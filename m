From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] android: binder: Drop dependency on !M68K
Date: Wed, 6 Jun 2018 14:47:51 +0200
Message-ID: <20180606124751.GA21439@kroah.com>
References: <1528288856-11841-1-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
Content-Disposition: inline
In-Reply-To: <1528288856-11841-1-git-send-email-geert@linux-m68k.org>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: devel@driverdev.osuosl.org, linux-m68k@vger.kernel.org, Todd Kjos <tkjos@android.com>, linux-kernel@vger.kernel.org, Arve =?iso-8859-1?B?SGr4bm5lduVn?= <arve@android.com>, Martijn Coenen <maco@android.com>
List-Id: linux-m68k@vger.kernel.org

On Wed, Jun 06, 2018 at 02:40:56PM +0200, Geert Uytterhoeven wrote:
> As of commit 7124330dabe5b3cb ("m68k/uaccess: Revive 64-bit
> get_user()"), the 64-bit Android binder interface builds fine on m68k.
> 
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
>  drivers/android/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/android/Kconfig b/drivers/android/Kconfig
> index ee4880bfdcdc98d2..432e9ad770703275 100644
> --- a/drivers/android/Kconfig
> +++ b/drivers/android/Kconfig
> @@ -10,7 +10,7 @@ if ANDROID
>  
>  config ANDROID_BINDER_IPC
>  	bool "Android Binder IPC Driver"
> -	depends on MMU && !M68K
> +	depends on MMU

Wonderful!  Thanks for this, I'll queue it up after 4.18-rc1 is out.

greg k-h
