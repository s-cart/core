<?php

namespace SCart\Core\Api\Controllers;

use SCart\Core\Front\Controllers\RootFrontController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Carbon\Carbon;
use SCart\Core\Front\Models\ShopCustomer;
use Illuminate\Support\Facades\Validator;
use SCart\Core\Front\Models\ShopEmailTemplate;
use SCart\Core\Front\Controllers\Auth\AuthTrait;

class MemberAuthController extends RootFrontController
{
    use AuthTrait;

    /**
     * Login user and create token
     *
     * @param  [string] email
     * @param  [string] password
     * @param  [boolean] remember_me
     * @return [string] access_token
     * @return [string] token_type
     * @return [string] expires_at
     */
    public function login(Request $request)
    {
        $request->validate([
            'email' => 'required|string|email',
            'password' => 'required|string',
            'remember_me' => 'boolean'
        ]);

        $credentials = request(['email', 'password']);

        if (!$this->guard()->attempt($credentials)) {
            return response()->json([
                'error' => 1,
                'msg' => 'Unauthorized'
            ], 401);
        }

        $user = $this->guard()->user();

        if ($user->status == 0) {
            $scope = ['user-guest'];
        } else {
            $scope = ['user'];
        }
        
        $tokenResult = $user->createToken('Client:'.$user->email.'- '.now(), $scope);
        $token = $tokenResult->token;

        if ($request->remember_me) {
            $token->expires_at = Carbon::now()->addWeeks(1);
        }

        $token->save();

        return response()->json([
            'access_token' => $tokenResult->accessToken,
            'token_type' => 'Bearer',
            'expires_at' => Carbon::parse(
                $tokenResult->token->expires_at
            )->toDateTimeString()
        ]);
    }

    /**
     * Create new customer
     */
    public function create(Request $request)
    {
        $data = $request->all();
        $data['country'] = strtoupper($data['country'] ?? '');
        $dataMapp = $this->mappingValidator($data);
        $v = Validator::make($data, $dataMapp['validate'], $dataMapp['messages']);
        if ($v->fails()) {
            $msg = '';
            foreach ($v->errors()->toArray() as $key => $value) {
                $msg .=$key." : ".$value[0]."\n ";
            }
            return response()->json([
                'error' => 1,
                'msg' => 'Error while create new customer',
                'detail' => $msg
            ]);
        }
        $user = $this->insert($dataMapp['dataInsert']);
        return response()->json($user);
    }


    /**
     * Inser data new customer
     */
    protected function insert($data)
    {
        $user = ShopCustomer::createCustomer($data);

        if ($user) {
            sc_customer_created_by_client($user, $data);
        }
        return $user;
    }

  
    /**
     * Logout user (Revoke the token)
     *
     * @return [string] message
     */
    public function logout(Request $request)
    {
        $request->user()->token()->revoke();
        return response()->json([
            'error' => 0,
            'msg' => 'Successfully logged out'
        ]);
    }
  
    protected function guard()
    {
        return Auth::guard();
    }
}
