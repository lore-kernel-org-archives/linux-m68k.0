From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: [PATCH 4/5] m68k: Introduce config option CPU_HAS_NO_UNALIGNED
Date: Fri, 8 Jun 2012 13:50:35 +1000
Message-ID: <4FD1768B.4050206@snapgear.com>
References: <1339094827-12349-1-git-send-email-geert@linux-m68k.org> <1339094827-12349-4-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1339094827-12349-4-git-send-email-geert@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org, Greg Ungerer <gerg@uclinux.org>, Philippe De Muyter <phdm@macqel.be>, linux-kernel@vger.kernel.org

On 08/06/12 04:47, Geert Uytterhoeven wrote:
> Use CONFIG_CPU_HAS_NO_UNALIGNED instead of open coding CONFIG_M68000 ||
> CONFIG_COLDFIRE
>
> Signed-off-by: Geert Uytterhoeven<geert@linux-m68k.org>

Acked-by: Greg Ungerer<gerg@uclinux.org>

Regards
Greg



> ---
>   arch/m68k/Kconfig.cpu             |    5 +++++
>   arch/m68k/include/asm/unaligned.h |    4 ++--
>   2 files changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/arch/m68k/Kconfig.cpu b/arch/m68k/Kconfig.cpu
> index 6cd8c1a..c4ed650 100644
> --- a/arch/m68k/Kconfig.cpu
> +++ b/arch/m68k/Kconfig.cpu
> @@ -27,6 +27,7 @@ config COLDFIRE
>   	select ARCH_HAVE_CUSTOM_GPIO_H
>   	select CPU_HAS_NO_BITFIELDS
>   	select CPU_HAS_NO_MULDIV64
> +	select CPU_HAS_NO_UNALIGNED
>   	select GENERIC_CSUM
>
>   endchoice
> @@ -37,6 +38,7 @@ config M68000
>   	bool
>   	select CPU_HAS_NO_BITFIELDS
>   	select CPU_HAS_NO_MULDIV64
> +	select CPU_HAS_NO_UNALIGNED
>   	select GENERIC_CSUM
>   	help
>   	  The Freescale (was Motorola) 68000 CPU is the first generation of
> @@ -366,6 +368,9 @@ config CPU_HAS_NO_BITFIELDS
>   config CPU_HAS_NO_MULDIV64
>   	bool
>
> +config CPU_HAS_NO_UNALIGNED
> +	bool
> +
>   config CPU_HAS_ADDRESS_SPACES
>   	bool
>
> diff --git a/arch/m68k/include/asm/unaligned.h b/arch/m68k/include/asm/unaligned.h
> index f4043ae..2b3ca0b 100644
> --- a/arch/m68k/include/asm/unaligned.h
> +++ b/arch/m68k/include/asm/unaligned.h
> @@ -2,7 +2,7 @@
>   #define _ASM_M68K_UNALIGNED_H
>
>
> -#if defined(CONFIG_COLDFIRE) || defined(CONFIG_M68000)
> +#ifdef CONFIG_CPU_HAS_NO_UNALIGNED
>   #include<linux/unaligned/be_struct.h>
>   #include<linux/unaligned/le_byteshift.h>
>   #include<linux/unaligned/generic.h>
> @@ -12,7 +12,7 @@
>
>   #else
>   /*
> - * The m68k can do unaligned accesses itself.
> + * The m68k can do unaligned accesses itself.
>    */
>   #include<linux/unaligned/access_ok.h>
>   #include<linux/unaligned/generic.h>


-- 
------------------------------------------------------------------------
Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.com
SnapGear Group, McAfee                      PHONE:       +61 7 3435 2888
8 Gardner Close                             FAX:         +61 7 3217 5323
Milton, QLD, 4064, Australia                WEB: http://www.SnapGear.com
