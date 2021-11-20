<?php

namespace App\Http;

use App\Http\Middleware\AdminMiddleware;
use App\Http\Middleware\AttributeMiddleware;
use App\Http\Middleware\AuthorMiddleware;
use App\Http\Middleware\CouponMiddleware;
use App\Http\Middleware\OfferMiddleware;
use App\Http\Middleware\OrderMiddleware;
use App\Http\Middleware\ProductBindingMiddleware;
use App\Http\Middleware\ProductMiddleware;
use App\Http\Middleware\PromotionMiddleware;
use App\Http\Middleware\ReportMiddleware;
use App\Http\Middleware\UserMiddleware;
use App\Http\Middleware\VoucherMiddleware;
use App\Http\Middleware\WebBasicMiddleware;
use App\Http\Middleware\DisctrictMiddleware;
use Illuminate\Foundation\Http\Kernel as HttpKernel;

class Kernel extends HttpKernel
{
    /**
     * The application's global HTTP middleware stack.
     *
     * These middleware are run during every request to your application.
     *
     * @var array
     */
    protected $middleware = [
        // \App\Http\Middleware\TrustHosts::class,
        \App\Http\Middleware\TrustProxies::class,
        \Fruitcake\Cors\HandleCors::class,
        \App\Http\Middleware\CheckForMaintenanceMode::class,
        \Illuminate\Foundation\Http\Middleware\ValidatePostSize::class,
        \App\Http\Middleware\TrimStrings::class,
        \Illuminate\Foundation\Http\Middleware\ConvertEmptyStringsToNull::class,
    ];

    /**
     * The application's route middleware groups.
     *
     * @var array
     */
    protected $middlewareGroups = [
        'web' => [
            \App\Http\Middleware\EncryptCookies::class,
            \Illuminate\Cookie\Middleware\AddQueuedCookiesToResponse::class,
            \Illuminate\Session\Middleware\StartSession::class,
            // \Illuminate\Session\Middleware\AuthenticateSession::class,
            \Illuminate\View\Middleware\ShareErrorsFromSession::class,
            \App\Http\Middleware\VerifyCsrfToken::class,
            \Illuminate\Routing\Middleware\SubstituteBindings::class,
        ],

        'api' => [
            'throttle:60,1',
            \Illuminate\Routing\Middleware\SubstituteBindings::class,
        ],
    ];

    /**
     * The application's route middleware.
     *
     * These middleware may be assigned to groups or used individually.
     *
     * @var array
     */
    protected $routeMiddleware = [
        'auth' => \App\Http\Middleware\Authenticate::class,
        'auth.basic' => \Illuminate\Auth\Middleware\AuthenticateWithBasicAuth::class,
        'bindings' => \Illuminate\Routing\Middleware\SubstituteBindings::class,
        'cache.headers' => \Illuminate\Http\Middleware\SetCacheHeaders::class,
        'can' => \Illuminate\Auth\Middleware\Authorize::class,
        'guest' => \App\Http\Middleware\RedirectIfAuthenticated::class,
        'password.confirm' => \Illuminate\Auth\Middleware\RequirePassword::class,
        'signed' => \Illuminate\Routing\Middleware\ValidateSignature::class,
        'throttle' => \Illuminate\Routing\Middleware\ThrottleRequests::class,
        'verified' => \Illuminate\Auth\Middleware\EnsureEmailIsVerified::class,
        'admin' => AdminMiddleware::class,
        'order' => OrderMiddleware::class,
        'report' => ReportMiddleware::class,
        'product' => ProductMiddleware::class,
        'attribute' => AttributeMiddleware::class,
        'binding' => ProductBindingMiddleware::class,
        'promotion' => PromotionMiddleware::class,
        'offer' => OfferMiddleware::class,
        'coupon' => CouponMiddleware::class,
        'voucher' => VoucherMiddleware::class,
        'district' => DisctrictMiddleware::class,
        'user' => UserMiddleware::class,
        'author' => AuthorMiddleware::class,
        'basic' => WebBasicMiddleware::class,
    ];
}
