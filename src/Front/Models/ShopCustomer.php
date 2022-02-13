<?php

namespace SCart\Core\Front\Models;

use SCart\Core\Front\Models\ShopEmailTemplate;
use SCart\Core\Front\Models\ShopCustomerAddress;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Auth;
use Laravel\Passport\HasApiTokens;
use SCart\Core\Front\Models\ShopCustomFieldDetail;
use Illuminate\Auth\AuthenticationException;

class ShopCustomer extends Authenticatable
{
    use \SCart\Core\Front\Models\ModelTrait;
    use \SCart\Core\Front\Models\UuidTrait;
    
    use Notifiable, HasApiTokens;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $table = SC_DB_PREFIX.'shop_customer';
    protected $guarded = [];
    protected $connection = SC_CONNECTION;
    private static $profile = null;
    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];
    protected $appends = [
        'name',
    ];
    public function orders()
    {
        return $this->hasMany(ShopOrder::class, 'customer_id', 'id');
    }

    public function addresses()
    {
        return $this->hasMany(ShopCustomerAddress::class, 'customer_id', 'id');
    }

    /**
     * Send email reset password
     * @param  [type] $token [description]
     * @return [type]        [description]
     */
    public function sendPasswordResetNotification($token)
    {
        $checkContent = (new ShopEmailTemplate)->where('group', 'forgot_password')->where('status', 1)->first();
        if ($checkContent) {
            $content = $checkContent->text;
            $dataFind = [
                '/\{\{\$title\}\}/',
                '/\{\{\$reason_sendmail\}\}/',
                '/\{\{\$note_sendmail\}\}/',
                '/\{\{\$note_access_link\}\}/',
                '/\{\{\$reset_link\}\}/',
                '/\{\{\$reset_button\}\}/',
            ];
            $url = sc_route('password.reset', ['token' => $token]);
            $dataReplace = [
                sc_language_render('email.forgot_password.title'),
                sc_language_render('email.forgot_password.reason_sendmail'),
                sc_language_render('email.forgot_password.note_sendmail', ['count' => config('auth.passwords.'.config('auth.defaults.passwords').'.expire')]),
                sc_language_render('email.forgot_password.note_access_link', ['reset_button' => sc_language_render('email.forgot_password.reset_button'), 'url' => $url]),
                $url,
                sc_language_render('email.forgot_password.reset_button'),
            ];
            $content = preg_replace($dataFind, $dataReplace, $content);
            $dataView = [
                'content' => $content,
            ];

            $config = [
                'to' => $this->getEmailForPasswordReset(),
                'subject' => sc_language_render('email.forgot_password.reset_button'),
            ];

            sc_send_mail('templates.' . sc_store('template') . '.mail.forgot_password', $dataView, $config, $dataAtt = []);
        }
    }

    /*
    Full name
     */
    public function getNameAttribute()
    {
        return $this->first_name . ' ' . $this->last_name;
    }



    protected static function boot()
    {
        parent::boot();
        // before delete() method call this
        static::deleting(
            function ($customer) {
            //Delete custom field
                (new ShopCustomFieldDetail)
                ->join(SC_DB_PREFIX.'shop_custom_field', SC_DB_PREFIX.'shop_custom_field.id', SC_DB_PREFIX.'shop_custom_field_detail.custom_field_id')
                ->select('code', 'name', 'text')
                ->where(SC_DB_PREFIX.'shop_custom_field_detail.rel_id', $customer->id)
                ->where(SC_DB_PREFIX.'shop_custom_field.type', 'customer')
                ->delete();
            }
        );

        //Uuid
        static::creating(function ($model) {
            if (empty($model->{$model->getKeyName()})) {
                $model->{$model->getKeyName()} = sc_generate_id($type = 'shop_customer');
            }
        });
    }


    /**
     * Update info customer
     * @param  [array] $dataUpdate
     * @param  [int] $id
     */
    public static function updateInfo($dataUpdate, $id)
    {
        $dataUpdate = sc_clean($dataUpdate);
        $obj = self::find($id);
        return $obj->update($dataUpdate);
    }

    /**
     * Create new customer
     * @return [type] [description]
     */
    public static function createCustomer($dataInsert)
    {
        $dataClean = sc_clean($dataInsert);
        $fields = $dataClean['fields'] ?? [];
        unset($dataClean['fields']);
        $dataAddress = [
            'first_name'      => $dataClean['first_name'] ?? '',
            'last_name'       => $dataClean['last_name'] ?? '',
            'first_name_kana' => $dataClean['first_name_kana'] ?? '',
            'last_name_kana'  => $dataClean['last_name_kana'] ?? '',
            'postcode'        => $dataClean['postcode'] ?? '',
            'address1'        => $dataClean['address1'] ?? '',
            'address2'        => $dataClean['address2'] ?? '',
            'address3'        => $dataClean['address3'] ?? '',
            'country'         => $dataClean['country'] ?? '',
            'phone'           => $dataClean['phone'] ?? '',
        ];
        $user = self::create($dataClean);
        $address = $user->addresses()->save(new ShopCustomerAddress($dataAddress));
        $user->address_id = $address->id;
        $user->save();

        //Insert custom fields
        ShopCustomer::updateCustomField($fields, $user->id);
        
        // Process event customer created
        sc_event_customer_created($user);
        
        return $user;
    }

    /**
     * Get address default of user
     *
     * @return  [collect]
     */
    public function getAddressDefault()
    {
        return (new ShopCustomerAddress)->where('customer_id', $this->id)
            ->where('id', $this->address_id)
            ->first();
    }

    public function profile()
    {
        if (self::$profile === null) {
            self::$profile = Auth::user();
        }
        return self::$profile;
    }

    /**
     * Check customer has Check if the user is verified
     *
     * @return boolean
     */
    public function isVerified()
    {
        return ! is_null($this->email_verified_at)  || $this->provider_id ;
    }

    /**
     * Check customer need verify email
     *
     * @return boolean
     */
    public function hasVerifiedEmail()
    {
        return !$this->isVerified() && sc_config('customer_verify');
    }
    /**
     * Send the email verification notification.
     *
     * @return void
     */
    public function sendEmailVerify()
    {
        if ($this->hasVerifiedEmail()) {
            $url = \Illuminate\Support\Facades\URL::temporarySignedRoute(
                'customer.verify_process',
                \Carbon\Carbon::now()->addMinutes(config('auth.verification', 60)),
                [
                    'id' => $this->id,
                    'token' => sha1($this->email),
                ]
            );

            $checkContent = (new ShopEmailTemplate)->where('group', 'customer_verify')->where('status', 1)->first();
            if ($checkContent) {
                $content = $checkContent->text;
                $dataFind = [
                    '/\{\{\$title\}\}/',
                    '/\{\{\$reason_sendmail\}\}/',
                    '/\{\{\$note_sendmail\}\}/',
                    '/\{\{\$note_access_link\}\}/',
                    '/\{\{\$url_verify\}\}/',
                    '/\{\{\$button\}\}/',
                ];
                $dataReplace = [
                    sc_language_render('email.verification_content.title'),
                    sc_language_render('email.verification_content.reason_sendmail'),
                    sc_language_render('email.verification_content.note_sendmail', ['count' => config('auth.verification')]),
                    sc_language_render('email.verification_content.note_access_link', ['reset_button' => sc_language_render('customer.verify_email.button_verify'), 'url' => $url]),
                    $url,
                    sc_language_render('customer.verify_email.button_verify'),
                ];
                $content = preg_replace($dataFind, $dataReplace, $content);
                $dataView = [
                    'content' => $content,
                ];
    
                $config = [
                    'to' => $this->email,
                    'subject' => sc_language_render('customer.verify_email.button_verify'),
                ];
    
                sc_send_mail('templates.' . sc_store('template') . '.mail.customer_verify', $dataView, $config, $dataAtt = []);
                return true;
            }
        }
        return false;
    }

    /**
     * Get all custom fields
     *
     * @return void
     */
    public function getCustomFields()
    {
        $data =  (new ShopCustomFieldDetail)
            ->join(SC_DB_PREFIX.'shop_custom_field', SC_DB_PREFIX.'shop_custom_field.id', SC_DB_PREFIX.'shop_custom_field_detail.custom_field_id')
            ->select('code', 'name', 'text')
            ->where(SC_DB_PREFIX.'shop_custom_field_detail.rel_id', $this->id)
            ->where(SC_DB_PREFIX.'shop_custom_field.type', 'customer')
            ->where(SC_DB_PREFIX.'shop_custom_field.status', '1')
            ->get()
            ->keyBy('code');
        return $data;
    }

    /**
     * Get custom field
     *
     * @return void
     */
    public function getCustomField($code = null)
    {
        $data =  (new ShopCustomFieldDetail)
            ->join(SC_DB_PREFIX.'shop_custom_field', SC_DB_PREFIX.'shop_custom_field.id', SC_DB_PREFIX.'shop_custom_field_detail.custom_field_id')
            ->select('code', 'name', 'text')
            ->where(SC_DB_PREFIX.'shop_custom_field_detail.rel_id', $this->id)
            ->where(SC_DB_PREFIX.'shop_custom_field.type', 'customer')
            ->where(SC_DB_PREFIX.'shop_custom_field.status', '1');
        if ($code) {
            $data = $data->where(SC_DB_PREFIX.'shop_custom_field.code', $code);
        }
        $data = $data->first();
        return $data;
    }

    /**
     * Update custom field
     *
     * @param   array  $fields  [$fields description]
     * @param   [type] $cID     [$cID description]
     *
     * @return  []              [return description]
     */
    public static function updateCustomField(array $fields = [], $cID) {
        if (!empty($fields)) {
            (new ShopCustomFieldDetail)
                ->join(SC_DB_PREFIX.'shop_custom_field', SC_DB_PREFIX.'shop_custom_field.id', SC_DB_PREFIX.'shop_custom_field_detail.custom_field_id')
                ->where(SC_DB_PREFIX.'shop_custom_field_detail.rel_id', $cID)
                ->where(SC_DB_PREFIX.'shop_custom_field.type', 'customer')
                ->delete();

            $dataField = [];
            foreach ($fields as $key => $value) {
                $field = (new ShopCustomField)->where('code', $key)->where('type', 'customer')->first();
                if ($field) {
                    $dataField[] = sc_clean([
                        'id' => sc_uuid(),
                        'custom_field_id' => $field->id,
                        'rel_id' => $cID,
                        'text' => trim($value),
                    ], [], true);
                }
            }
            if ($dataField) {
                (new ShopCustomFieldDetail)->insert($dataField);
            }
        }
    }
}
