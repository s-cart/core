<?php
if (!function_exists('sc_notice_add')) {
    /**
     * [sc_notice_add description]
     *
     * @param   string  $type    [$type description]
     * @param   string  $typeId  [$typeId description]
     *
     * @return  [type]           [return description]
     */
    function sc_notice_add(string $type, string $typeId)
    {
        $modelNotice = new SCart\Core\Admin\Models\AdminNotice;
        $content = '';
        $admins = [];
        switch ($type) {
            case 'sc_customer_created':
                $admins = sc_admin_notice_get_admin($type);
                $content = "admin_notice.customer.new";
                break;
            case 'sc_order_created':
                $admins = sc_admin_notice_get_admin($type);
                $content = "admin_notice.order.new";
                break;
            case 'sc_order_success':
                $admins = sc_admin_notice_get_admin($type);
                $content = "admin_notice.order.success";
                break;
            case 'sc_order_update_status':
                $admins = sc_admin_notice_get_admin($type);
                $content = "admin_notice.order.update_status";
                break;
            
            default:
                $admins = sc_admin_notice_get_admin($type);
                $content = $type;
                break;
        }
        if (count($admins)) {
            foreach ($admins as $key => $admin) {
                $modelNotice->create(
                    [
                        'type' => $type,
                        'type_id' => $typeId,
                        'admin_id' => $admin,
                        'content' => $content
                    ]
                );
            }
        }

    }

    /**
     * Get list id admin can get notice
     */
    if (!function_exists('sc_admin_notice_get_admin')) {
        function sc_admin_notice_get_admin(string $type = "")
        {
            if (function_exists('sc_admin_notice_pro_get_admin')) {
                return sc_admin_notice_pro_get_admin($type);
            }

            return (new \SCart\Core\Admin\Models\AdminUser)
            ->selectRaw('distinct '. SC_DB_PREFIX.'admin_user.id')
            ->join(SC_DB_PREFIX . 'admin_role_user', SC_DB_PREFIX . 'admin_role_user.user_id', SC_DB_PREFIX . 'admin_user.id')
            ->join(SC_DB_PREFIX . 'admin_role', SC_DB_PREFIX . 'admin_role.id', SC_DB_PREFIX . 'admin_role_user.role_id')
            ->whereIn(SC_DB_PREFIX . 'admin_role.slug', ['administrator','view.all', 'manager'])
            ->pluck('id')
            ->toArray();
        }
    }

}
