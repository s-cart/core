<?php

namespace SCart\Core\Front\Controllers\Auth;

use SCart\Core\Front\Controllers\RootFrontController;
use SCart\Core\Front\Models\ShopEmailTemplate;
use SCart\Core\Front\Models\ShopCustomer;
use SCart\Core\Front\Models\ShopCustomField;
use SCart\Core\Front\Models\ShopCountry;
use Illuminate\Foundation\Auth\RegistersUsers;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use SCart\Core\Front\Controllers\Auth\AuthTrait;
use Illuminate\Auth\Events\Registered;
use Illuminate\Http\JsonResponse;

class RegisterController extends RootFrontController
{
    /*
    |--------------------------------------------------------------------------
    | Register Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles the registration of new users as well as their
    | validation and creation. By default this controller uses a trait to
    | provide this functionality without requiring any additional code.
    |
     */

    use RegistersUsers;
    use AuthTrait;

    /**
     * Where to redirect users after registration.
     *
     * @var string
     */
    // protected $redirectTo = '/home';
    protected function redirectTo()
    {
        return sc_route('customer.index');
    }

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
        $this->middleware('guest');
    }

    /**
     * Get a validator for an incoming registration request.
     *
     * @param  array  $data
     * @return \Illuminate\Contracts\Validation\Validator
     */
    protected function validator(array $data)
    {
        $dataMapping = $this->mappingValidator($data);
        if (sc_captcha_method() && in_array('register', sc_captcha_page())) {
            $data['captcha_field'] = $data[sc_captcha_method()->getField()] ?? '';
            $dataMapping['validate']['captcha_field'] = ['required', 'string', new \SCart\Core\Rules\CaptchaRule];
        }
        return Validator::make($data, $dataMapping['validate'], $dataMapping['messages']);
    }

    /**
     * Create a new user instance after a valid registration.
     *
     * @param  array  $data
     * @return \SCart\Core\Front\Models\ShopCustomer
     */
    protected function create(array $data)
    {
        $data['country'] = strtoupper($data['country'] ?? '');
        $dataMap = $this->mappDataInsert($data);

        $user = ShopCustomer::createCustomer($dataMap);
        if ($user) {
            if (sc_config('welcome_customer')) {
                $checkContent = (new ShopEmailTemplate)->where('group', 'welcome_customer')->where('status', 1)->first();
                if ($checkContent) {
                    $content = $checkContent->text;
                    $dataFind = [
                        '/\{\{\$title\}\}/',
                        '/\{\{\$first_name\}\}/',
                        '/\{\{\$last_name\}\}/',
                        '/\{\{\$email\}\}/',
                        '/\{\{\$phone\}\}/',
                        '/\{\{\$password\}\}/',
                        '/\{\{\$address1\}\}/',
                        '/\{\{\$address2\}\}/',
                        '/\{\{\$address3\}\}/',
                        '/\{\{\$country\}\}/',
                    ];
                    $dataReplace = [
                        sc_language_render('email.welcome_customer.title'),
                        $dataMap['first_name'] ?? '',
                        $dataMap['last_name'] ?? '',
                        $dataMap['email'] ?? '',
                        $dataMap['phone'] ?? '',
                        $dataMap['password'] ?? '',
                        $dataMap['address1'] ?? '',
                        $dataMap['address2'] ?? '',
                        $dataMap['address3'] ?? '',
                        $dataMap['country'] ?? '',
                    ];
                    $content = preg_replace($dataFind, $dataReplace, $content);
                    $dataView = [
                        'content' => $content,
                    ];

                    $config = [
                        'to' => $data['email'],
                        'subject' => sc_language_render('email.welcome_customer.title'),
                    ];

                    sc_send_mail($this->templatePath . '.mail.welcome_customer', $dataView, $config, []);
                }
            }
        } else {
        }
        return $user;
    }
    
    public function showRegistrationForm()
    {
        return redirect(sc_route('register'));
        // return view('auth.register');
    }

    protected function registered(Request $request, $user)
    {
        redirect()->route('home')->with(['message' => sc_language_render('customer.register_success')]);
    }


    /**
     * Process front form register
     *
     * @param [type] ...$params
     * @return void
     */
    public function showRegisterFormProcessFront(...$params)
    {
        if (config('app.seoLang')) {
            $lang = $params[0] ?? '';
            sc_lang_switch($lang);
        }
        return $this->_showRegisterForm();
    }


    /**
     * Form register
     *
     * @return  [type]  [return description]
     */
    private function _showRegisterForm()
    {
        if (session('customer')) {
            return redirect()->route('home');
        }
        $viewCaptcha = '';
        if (sc_captcha_method() && in_array('register', sc_captcha_page())) {
            if (view()->exists(sc_captcha_method()->pathPlugin.'::render')) {
                $dataView = [
                    'titleButton' => sc_language_render('customer.signup'),
                    'idForm' => 'form-process',
                    'idButtonForm' => 'button-form-process',
                ];
                $viewCaptcha = view(sc_captcha_method()->pathPlugin.'::render', $dataView)->render();
            }
        }
        sc_check_view($this->templatePath . '.auth.register');
        return view(
            $this->templatePath . '.auth.register',
            array(
                'title'       => sc_language_render('customer.title_register'),
                'countries'   => ShopCountry::getCodeAll(),
                'layout_page' => 'shop_auth',
                'viewCaptcha' => $viewCaptcha,
                'customFields'=> (new ShopCustomField)->getCustomField($type = 'customer'),
                'breadcrumbs' => [
                    ['url'    => '', 'title' => sc_language_render('customer.title_register')],
                ],
            )
        );
    }


    /**
     * Handle a registration request for the application.
     * User for Front
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\RedirectResponse|\Illuminate\Http\JsonResponse
     */
    public function register(Request $request)
    {
        $data = $request->all();
        $this->validator($data)->validate();
        $user = $this->create($data);
        $dataMap = $this->mappDataInsert($data);
        if ($user) {
            if (sc_config('welcome_customer')) {
                $checkContent = (new ShopEmailTemplate)->where('group', 'welcome_customer')->where('status', 1)->first();
                if ($checkContent) {
                    $content = $checkContent->text;
                    $dataFind = [
                        '/\{\{\$title\}\}/',
                        '/\{\{\$first_name\}\}/',
                        '/\{\{\$last_name\}\}/',
                        '/\{\{\$email\}\}/',
                        '/\{\{\$phone\}\}/',
                        '/\{\{\$password\}\}/',
                        '/\{\{\$address1\}\}/',
                        '/\{\{\$address2\}\}/',
                        '/\{\{\$address3\}\}/',
                        '/\{\{\$country\}\}/',
                    ];
                    $dataReplace = [
                        sc_language_render('email.welcome_customer.title'),
                        $dataMap['first_name'] ?? '',
                        $dataMap['last_name'] ?? '',
                        $dataMap['email'] ?? '',
                        $dataMap['phone'] ?? '',
                        $dataMap['password'] ?? '',
                        $dataMap['address1'] ?? '',
                        $dataMap['address2'] ?? '',
                        $dataMap['address3'] ?? '',
                        $dataMap['country'] ?? '',
                    ];
                    $content = preg_replace($dataFind, $dataReplace, $content);
                    $dataView = [
                        'content' => $content,
                    ];

                    $config = [
                        'to' => $data['email'],
                        'subject' => sc_language_render('email.welcome_customer.title'),
                    ];

                    sc_send_mail($this->templatePath . '.mail.welcome_customer', $dataView, $config, []);
                }
            }

            //Send email verify
            $user->sendEmailVerify();

            //Login
            $this->guard()->login($user);
            
            if ($response = $this->registered($request, $user)) {
                return $response;
            }
        } else {
            return back()->withInput();
        }

        return $request->wantsJson()
                    ? new JsonResponse([], 201)
                    : redirect($this->redirectPath());
    }
}
