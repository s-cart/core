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
 * @param   [type]  $dataClean  [$dataClean description]
 *
 * @return  [array]              [return description]
 */
if (!function_exists('sc_customer_address_mapping') && !in_array('sc_customer_address_mapping', config('helper_except', []))) {
    function sc_customer_address_mapping(array $dataClean)
    {
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

        return $dataAddress;
    }
}