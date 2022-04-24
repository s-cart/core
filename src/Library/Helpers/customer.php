<?php

/**
 * Send email reset password
 */
if (!function_exists('sc_customer_sendmail_reset_notification') && !in_array('sc_customer_sendmail_reset_notification', config('helper_except', []))) {
    function sc_customer_sendmail_reset_notification($token, $emailReset)
    {
        $checkContent = (new \SCart\Core\Front\Models\ShopEmailTemplate)->where('group', 'forgot_password')->where('status', 1)->first();
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
                'to' => $emailReset,
                'subject' => sc_language_render('email.forgot_password.reset_button'),
            ];

            sc_send_mail('templates.' . sc_store('template') . '.mail.forgot_password', $dataView, $config, $dataAtt = []);
        }
    }
}


/**
 * Send email verify
 */
if (!function_exists('sc_customer_sendmail_verify') && !in_array('sc_customer_sendmail_verify', config('helper_except', []))) {
    function sc_customer_sendmail_verify($emailVerify, $userId)
    {
        $url = \Illuminate\Support\Facades\URL::temporarySignedRoute(
            'customer.verify_process',
            \Carbon\Carbon::now()->addMinutes(config('auth.verification', 60)),
            [
                'id' => $userId,
                'token' => sha1($emailVerify),
            ]
        );

        $checkContent = (new \SCart\Core\Front\Models\ShopEmailTemplate)->where('group', 'customer_verify')->where('status', 1)->first();
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
                'to' => $emailVerify,
                'subject' => sc_language_render('customer.verify_email.button_verify'),
            ];

            sc_send_mail('templates.' . sc_store('template') . '.mail.customer_verify', $dataView, $config, $dataAtt = []);
            return true;
        }
    }
}


/**
 * Mapping data address of customer
 *
 * @param   [type]  $dataRaw  [$dataRaw description]
 *
 * @return  [array]              [return description]
 */
if (!function_exists('sc_customer_address_mapping') && !in_array('sc_customer_address_mapping', config('helper_except', []))) {
    function sc_customer_address_mapping(array $dataRaw)
    {
        $dataAddress = [
            'first_name'      => $dataRaw['first_name'] ?? '',
            'last_name'       => $dataRaw['last_name'] ?? '',
            'first_name_kana' => $dataRaw['first_name_kana'] ?? '',
            'last_name_kana'  => $dataRaw['last_name_kana'] ?? '',
            'postcode'        => $dataRaw['postcode'] ?? '',
            'address1'        => $dataRaw['address1'] ?? '',
            'address2'        => $dataRaw['address2'] ?? '',
            'address3'        => $dataRaw['address3'] ?? '',
            'country'         => $dataRaw['country'] ?? '',
            'phone'           => $dataRaw['phone'] ?? '',
        ];

        return $dataAddress;
    }
}


/**
 * Mapping data customer before insert
 *
 * @param   [array]  $dataRaw  [$dataRaw description]
 *
 * @return  [array]              [return description]
 */
if (!function_exists('sc_customer_data_insert_mapping') && !in_array('sc_customer_data_insert_mapping', config('helper_except', []))) {
    function sc_customer_data_insert_mapping(array $dataRaw)
    {
        $dataInsert = [
            'first_name' => $dataRaw['first_name'] ?? '',
            'email' => $dataRaw['email'],
            'password' => bcrypt($dataRaw['password']),
        ];
        if (isset($dataRaw['status'])) {
            $dataInsert['status']  = $dataRaw['status'];
        }
        if (sc_config('customer_lastname')) {
            if (!empty($dataRaw['last_name'])) {
                $dataInsert['last_name'] = $dataRaw['last_name'];
            }
        }
        if (sc_config('customer_firstname_kana')) {
            if (!empty($dataRaw['first_name_kana'])) {
                $dataInsert['first_name_kana'] = $dataRaw['first_name_kana'];
            }
        }
        if (sc_config('customer_lastname_kana')) {
            if (!empty($dataRaw['last_name_kana'])) {
                $dataInsert['last_name_kana'] = $dataRaw['last_name_kana'];
            }
        }
        if (sc_config('customer_address1')) {
            if (!empty($dataRaw['address1'])) {
                $dataInsert['address1'] = $dataRaw['address1'];
            }
        }
        if (sc_config('customer_address2')) {
            if (!empty($dataRaw['address2'])) {
                $dataInsert['address2'] = $dataRaw['address2'];
            }
        }

        if (sc_config('customer_address3')) {
            if (!empty($dataRaw['address3'])) {
                $dataInsert['address3'] = $dataRaw['address3'];
            }
        }

        if (sc_config('customer_phone')) {
            if (!empty($dataRaw['phone'])) {
                $dataInsert['phone'] = $dataRaw['phone'];
            }
        }
        if (sc_config('customer_country')) {
            if (!empty($dataRaw['country'])) {
                $dataInsert['country'] = $dataRaw['country'];
            }
        }
        if (sc_config('customer_postcode')) {
            if (!empty($dataRaw['postcode'])) {
                $dataInsert['postcode'] = $dataRaw['postcode'];
            }
        }
        if (sc_config('customer_company')) {
            if (!empty($dataRaw['company'])) {
                $dataInsert['company'] = $dataRaw['company'];
            }
        }
        if (sc_config('customer_sex')) {
            if (!empty($dataRaw['sex'])) {
                $dataInsert['sex'] = $dataRaw['sex'];
            }
        }
        if (sc_config('customer_birthday')) {
            if (!empty($dataRaw['birthday'])) {
                $dataInsert['birthday'] = $dataRaw['birthday'];
            }
        }
        if (sc_config('customer_group')) {
            if (!empty($dataRaw['group'])) {
                $dataInsert['group'] = $dataRaw['group'];
            }
        }

        if (!empty($dataRaw['fields'])) {
            $dataInsert['fields'] = $dataRaw['fields'];
        }
        return $dataInsert;
    }
}