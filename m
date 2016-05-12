From: Greg Ungerer <gerg@linux-m68k.org>
Subject: Re: [RFC PATCH 2/2] arch/m68k: Add CONFIG_CPU_HAS_NO_MULDIV32
Date: Thu, 12 May 2016 22:55:46 +1000
Message-ID: <57347D52.2060801@linux-m68k.org>
References: <20160511102535.5858.qmail@ns.horizon.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <20160511102535.5858.qmail@ns.horizon.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: George Spelvin <linux@horizon.com>, geert@linux-m68k.org, linux-m68k@lists.linux-m68k.org

Hi George,

On 11/05/16 20:25, George Spelvin wrote:
> Assembly of 32-bit multiply/divide helpers was dependent on
> CONFIG_CPU_HAS_NO_MULDIV64, which is not necessary.
>
> Signed-off-by: George Spelvin <linux@horizon.com>
> ---
> This also turns out to be a very useful symbol for some other work
> I'm doing to <linux/hash.h>.
>
>   arch/m68k/Kconfig.cpu  | 11 +++++++++++
>   arch/m68k/lib/Makefile |  4 ++--
>   2 files changed, 13 insertions(+), 2 deletions(-)
>
> diff --git a/arch/m68k/Kconfig.cpu b/arch/m68k/Kconfig.cpu
> index 0dfcf12..3fce7bf 100644
> --- a/arch/m68k/Kconfig.cpu
> +++ b/arch/m68k/Kconfig.cpu
> @@ -37,6 +37,7 @@ config M68000
>   	bool "MC68000"
>   	depends on !MMU
>   	select CPU_HAS_NO_BITFIELDS
> +	select CPU_HAS_NO_MULDIV32
>   	select CPU_HAS_NO_MULDIV64
>   	select CPU_HAS_NO_UNALIGNED
>   	select GENERIC_CSUM
> @@ -391,8 +392,18 @@ config NODES_SHIFT
>   config CPU_HAS_NO_BITFIELDS
>   	bool
>
> +config CPU_HAS_NO_MULDIV32
> +	bool
> +	help
> +	  This option indicates the CPU lacks 32x32->32-bit multiply
> +	  and divide instructions, and thus requires the GCC helper
> +	  functions __mulsi3, __divsi3 __modsi3, etc.
> +
>   config CPU_HAS_NO_MULDIV64
>   	bool
> +	help
> +	  This option indicates the CPU lacks "widening" 32x32->64-bit
> +	  multiply and 64/32->(32,32)-bit divide instructions.
>
>   config CPU_HAS_NO_UNALIGNED
>   	bool
> diff --git a/arch/m68k/lib/Makefile b/arch/m68k/lib/Makefile
> index fcd8eb1..e6553db 100644
> --- a/arch/m68k/lib/Makefile
> +++ b/arch/m68k/lib/Makefile
> @@ -7,8 +7,8 @@ lib-y	:= ashldi3.o ashrdi3.o lshrdi3.o muldi3.o \
>   	   memcpy.o memset.o memmove.o
>
>   lib-$(CONFIG_MMU) += uaccess.o
> -lib-$(CONFIG_CPU_HAS_NO_MULDIV64) += mulsi3.o divsi3.o udivsi3.o
> -lib-$(CONFIG_CPU_HAS_NO_MULDIV64) += modsi3.o umodsi3.o
> +lib-$(CONFIG_CPU_HAS_NO_MULDIV32) += mulsi3.o divsi3.o udivsi3.o
> +lib-$(CONFIG_CPU_HAS_NO_MULDIV32) += modsi3.o umodsi3.o

Did you intend to no longer compile any of mulsi3.o, etc, for
ColdFire targets?

CPU_HAS_NO_MULDIV64 is selected by both M68000 and ColdFire, so
those functions used to be compiled. But with this change on
only M68000 will compile them.

That causes a problem if we are forced to fallback and use the
gcc -m5200 cpu switch. (That may be the case if the version of
gcc we are compiling with doesn't support the more advanced
ColdFire CPU selection switches).

When compiling with m5200 gcc will generate calls to divsi3,
udivsi3, modsi3 and umodsi3. (As far as I can tell we never need
mulsi3 for ColdFire). So linking will fail with this patch as-is
in that m5200 case.

Regards
Greg
