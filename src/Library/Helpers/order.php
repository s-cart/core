<?php

/**
 * Function process after order success
 */
if (!function_exists('sc_order_process_after_success') && !in_array('sc_order_process_after_success', config('helper_except', []))) {
    function sc_order_process_after_success(string $orderID = null):array
    {
        $templatePath = 'templates.' . sc_store('template');
        if ((sc_config('order_success_to_admin') || sc_config('order_success_to_customer')) && sc_config('email_action_mode')) {
            $data = \SCart\Core\Front\Models\ShopOrder::with('details')->find($orderID)->toArray();
            $checkContent = (new \SCart\Core\Front\Models\ShopEmailTemplate)->where('group', 'order_success_to_admin')->where('status', 1)->first();
            $checkContentCustomer = (new \SCart\Core\Front\Models\ShopEmailTemplate)->where('group', 'order_success_to_customer')->where('status', 1)->first();
            if ($checkContent || $checkContentCustomer) {
                $orderDetail = '';
                $orderDetail .= '<tr>
                                    <td>' . sc_language_render('email.order.sort') . '</td>
                                    <td>' . sc_language_render('email.order.sku') . '</td>
                                    <td>' . sc_language_render('email.order.name') . '</td>
                                    <td>' . sc_language_render('email.order.price') . '</td>
                                    <td>' . sc_language_render('email.order.qty') . '</td>
                                    <td>' . sc_language_render('email.order.total') . '</td>
                                </tr>';
                foreach ($data['details'] as $key => $detail) {
                    $product = (new \SCart\Core\Front\Models\ShopProduct)->getDetail($detail['product_id']);
                    $pathDownload = $product->downloadPath->path ?? '';
                    $nameProduct = $detail['name'];
                    if ($product && $pathDownload && $product->property == SC_PROPERTY_DOWNLOAD) {
                        $nameProduct .="<br><a href='".sc_path_download_render($pathDownload)."'>Download</a>";
                    }

                    $orderDetail .= '<tr>
                                    <td>' . ($key + 1) . '</td>
                                    <td>' . $detail['sku'] . '</td>
                                    <td>' . $nameProduct . '</td>
                                    <td>' . sc_currency_render($detail['price'], '', '', '', false) . '</td>
                                    <td>' . number_format($detail['qty']) . '</td>
                                    <td align="right">' . sc_currency_render($detail['total_price'], '', '', '', false) . '</td>
                                </tr>';
                }
                $dataFind = [
                    '/\{\{\$title\}\}/',
                    '/\{\{\$orderID\}\}/',
                    '/\{\{\$firstName\}\}/',
                    '/\{\{\$lastName\}\}/',
                    '/\{\{\$toname\}\}/',
                    '/\{\{\$address\}\}/',
                    '/\{\{\$address1\}\}/',
                    '/\{\{\$address2\}\}/',
                    '/\{\{\$address3\}\}/',
                    '/\{\{\$email\}\}/',
                    '/\{\{\$phone\}\}/',
                    '/\{\{\$comment\}\}/',
                    '/\{\{\$orderDetail\}\}/',
                    '/\{\{\$subtotal\}\}/',
                    '/\{\{\$shipping\}\}/',
                    '/\{\{\$discount\}\}/',
                    '/\{\{\$otherFee\}\}/',
                    '/\{\{\$total\}\}/',
                ];
                $dataReplace = [
                    sc_language_render('email.order.email_subject_customer') . '#' . $orderID,
                    $orderID,
                    $data['first_name'],
                    $data['last_name'],
                    $data['first_name'].' '.$data['last_name'],
                    $data['address1'] . ' ' . $data['address2'].' '.$data['address3'],
                    $data['address1'],
                    $data['address2'],
                    $data['address3'],
                    $data['email'],
                    $data['phone'],
                    $data['comment'],
                    $orderDetail,
                    sc_currency_render($data['subtotal'], '', '', '', false),
                    sc_currency_render($data['shipping'], '', '', '', false),
                    sc_currency_render($data['discount'], '', '', '', false),
                    sc_currency_render($data['other_fee'], '', '', '', false),
                    sc_currency_render($data['total'], '', '', '', false),
                ];

                // Send mail order success to admin
                if (sc_config('order_success_to_admin') && $checkContent) {
                    $content = $checkContent->text;
                    $content = preg_replace($dataFind, $dataReplace, $content);
                    $dataView = [
                        'content' => $content,
                    ];
                    $config = [
                        'to' => sc_store('email'),
                        'subject' => sc_language_render('email.order.email_subject_to_admin', ['order_id' => $orderID]),
                    ];
                    sc_send_mail($templatePath . '.mail.order_success_to_admin', $dataView, $config, []);
                }

                // Send mail order success to customer
                if (sc_config('order_success_to_customer') && $checkContentCustomer) {
                    $contentCustomer = $checkContentCustomer->text;
                    $contentCustomer = preg_replace($dataFind, $dataReplace, $contentCustomer);
                    $dataView = [
                        'content' => $contentCustomer,
                    ];
                    $config = [
                        'to' => $data['email'],
                        'replyTo' => sc_store('email'),
                        'subject' => sc_language_render('email.order.email_subject_customer', ['order_id' => $orderID]),
                    ];

                    $attach = [];
                    if (sc_config('order_success_to_customer_pdf')) {
                        // Invoice pdf
                        \PDF::loadView($templatePath . '.mail.order_success_to_customer_pdf', $dataView)
                            ->save(\Storage::disk('invoice')->path('order-'.$orderID.'.pdf'));
                        $attach['attachFromStorage'] = [
                            [
                                'file_storage' => 'invoice',
                                'file_path' => 'order-'.$orderID.'.pdf',
                            ]
                        ];
                    }

                    sc_send_mail($templatePath . '.mail.order_success_to_customer', $dataView, $config, $attach);
                }
            }
        }
        $dataResponse = [
            'orderID'        => $orderID,
        ];
        return $dataResponse;
    }
}