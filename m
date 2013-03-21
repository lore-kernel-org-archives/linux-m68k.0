From: Greg Ungerer <gregungerer@westnet.com.au>
Subject: Re: [RFC 2/3] m68k: coldfire: use gpiolib
Date: Thu, 21 Mar 2013 15:35:21 +1000
Message-ID: <514A9C19.8080008__8372.14953867278$1363844223$gmane$org@westnet.com.au>
References: <1363527723-32713-1-git-send-email-acourbot@nvidia.com> <1363527723-32713-3-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1363527723-32713-3-git-send-email-acourbot@nvidia.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Alexandre Courbot <gnurou@gmail.com>
Cc: Mike Frysinger <vapier@gentoo.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Ralf Baechle <ralf@linux-mips.org>, uclinux-dist-devel@blackfin.uclinux.org, linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org, linux-mips@linux-mips.org, Alexandre Courbot <acourbot@nvidia.com>

On 17/03/13 23:42, Alexandre Courbot wrote:
> Force use of gpiolib for Coldfire, as a step towards the deprecation of
> GENERIC_GPIO.
>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> Acked-by: Arnd Bergmann <arnd@arndb.de>
> Acked-by: Linus Walleij <linus.walleij@linaro.org>

Acked-by: Greg Ungerer <gerg@uclinux.org>


> ---
>   arch/m68k/Kconfig.cpu | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/arch/m68k/Kconfig.cpu b/arch/m68k/Kconfig.cpu
> index b1cfff8..d266787 100644
> --- a/arch/m68k/Kconfig.cpu
> +++ b/arch/m68k/Kconfig.cpu
> @@ -22,8 +22,7 @@ config M68KCLASSIC
>
>   config COLDFIRE
>   	bool "Coldfire CPU family support"
> -	select GENERIC_GPIO
> -	select ARCH_WANT_OPTIONAL_GPIOLIB
> +	select ARCH_REQUIRE_GPIOLIB
>   	select ARCH_HAVE_CUSTOM_GPIO_H
>   	select CPU_HAS_NO_BITFIELDS
>   	select CPU_HAS_NO_MULDIV64
>
