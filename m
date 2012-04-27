From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: [PATCH 1/1] Changes for 68000 code integration.
Date: Sat, 28 Apr 2012 00:06:21 +1000
Message-ID: <4F9AA7DD.2020501@snapgear.com>
References: <MC68000 integration> <1335481717-8652-1-git-send-email-ljalvs@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:48009 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759972Ab2D0OJA (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 27 Apr 2012 10:09:00 -0400
In-Reply-To: <1335481717-8652-1-git-send-email-ljalvs@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Luis Alves <ljalvs@gmail.com>
Cc: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org, gerg@uclinux.org

Hi Luis,

On 04/27/2012 09:08 AM, Luis Alves wrote:
> This is the first of a pack of patches to support the original 68000 cpu.
> This adds:
>   -MC68000 cpu as a choice in the config menu.
>   -Alcetronics M68K board (uses this cpu).
>
> What I have changed:
>   -CONFIG_M68000 was being used by 68328 CPUs.
>    Renamed to CONFIG_M68XXX. Now the 68000 and all CPU32 CPUs use this flag for common configurations.
>   -Modified all 68[VZ|EZ]328 to select CONFIG_MCPU32
>   -Modified CONFIG_MCPU32 to select CONFIG_M68XXX.
>   -Modified CONFIG_M68360 to select CONFIG_M68XXX (I think it was missing some settings).
>   -Modified some files to use CONFIG_M68XXX instead of CONFIG_M68000/CONFIG_MCPU32

Thinking on this a little more, you probably don't want most of
these changes. Certainly as Brad points out CPU32 and 68000 are
quite different, and they need to remain as separate config options.

I can see you will end up with a arch/m68k/platform/68000 with
some new code. Is any of that common with what is currently in
arch/m68k/platform/68328?  I would expect we want to move the
common 68000 code into that platform/68000 directory. Longer
term we may want to do away with 68328/68EZ328/68VZ328 directories
all together. All the code may go in a platform/68000. (Still
thinking this one over though, but I am planning on doing away
with the separate 5xxx ColdFire directories real soon now).

Regards
Greg




> ---
>   arch/m68k/Kconfig.cpu          |   29 ++++++++++++++++++-----------
>   arch/m68k/Kconfig.machine      |    6 ++++++
>   arch/m68k/Makefile             |    9 ++++++---
>   arch/m68k/include/asm/bitops.h |    2 +-
>   arch/m68k/include/asm/delay.h  |    2 +-
>   arch/m68k/lib/memcpy.c         |    4 ++--
>   arch/m68k/lib/memset.c         |    2 +-
>   arch/m68k/lib/muldi3.c         |    2 +-
>   8 files changed, 36 insertions(+), 20 deletions(-)
>
> diff --git a/arch/m68k/Kconfig.cpu b/arch/m68k/Kconfig.cpu
> index 8a9c767..2abac0f 100644
> --- a/arch/m68k/Kconfig.cpu
> +++ b/arch/m68k/Kconfig.cpu
> @@ -32,26 +32,33 @@ endchoice
>
>   if M68KCLASSIC
>
> -config M68000
> +
> +config M68XXX
>   	bool
>   	select CPU_HAS_NO_BITFIELDS
>   	select CPU_HAS_NO_MULDIV64
>   	select GENERIC_CSUM
>   	help
> -	  The Freescale (was Motorola) 68000 CPU is the first generation of
> -	  the well known M68K family of processors. The CPU core as well as
> -	  being available as a stand alone CPU was also used in many
> -	  System-On-Chip devices (eg 68328, 68302, etc). It does not contain
> -	  a paging MMU.
> +	  Common features for the first generation of M68K CPUs. It
> +	  includes the original MC68000 and CPU32 core.
> +
>
>   config MCPU32
>   	bool
> -	select CPU_HAS_NO_BITFIELDS
> +	select M68XXX
>   	help
>   	  The Freescale (was then Motorola) CPU32 is a CPU core that is
>   	  based on the 68020 processor. For the most part it is used in
>   	  System-On-Chip parts, and does not contain a paging MMU.
>
> +config M68000
> +	bool "MC68000"
> +	select M68XXX
> +	help
> +	  The Freescale (was Motorola) 68000 CPU is the first generation of
> +	  the well known M68K family of processors. It does not contain
> +	  a paging MMU.
> +
>   config M68020
>   	bool "68020 support"
>   	depends on MMU
> @@ -96,28 +103,28 @@ config M68060
>   config M68328
>   	bool "MC68328"
>   	depends on !MMU
> -	select M68000
> +	select MCPU32
>   	help
>   	  Motorola 68328 processor support.
>
>   config M68EZ328
>   	bool "MC68EZ328"
>   	depends on !MMU
> -	select M68000
> +	select MCPU32
>   	help
>   	  Motorola 68EX328 processor support.
>
>   config M68VZ328
>   	bool "MC68VZ328"
>   	depends on !MMU
> -	select M68000
> +	select MCPU32
>   	help
>   	  Motorola 68VZ328 processor support.
>
>   config M68360
>   	bool "MC68360"
>   	depends on !MMU
> -	select MCPU32
> +	select M68XXX
>   	help
>   	  Motorola 68360 processor support.
>
> diff --git a/arch/m68k/Kconfig.machine b/arch/m68k/Kconfig.machine
> index 7cdf6b0..25ce143 100644
> --- a/arch/m68k/Kconfig.machine
> +++ b/arch/m68k/Kconfig.machine
> @@ -134,6 +134,12 @@ config SUN3
>
>   endif # M68KCLASSIC
>
> +config ALCE68K
> +	bool "Alcetronics M68K board support"
> +	depends on M68000
> +	help
> +	  Support for the Alcetronics M68K board.
> +
>   config PILOT
>   	bool
>
> diff --git a/arch/m68k/Makefile b/arch/m68k/Makefile
> index cf318f2..d1d7343 100644
> --- a/arch/m68k/Makefile
> +++ b/arch/m68k/Makefile
> @@ -32,8 +32,9 @@ cpuflags-$(CONFIG_M68040)	:= -m68040
>   endif
>   cpuflags-$(CONFIG_M68030)	:=
>   cpuflags-$(CONFIG_M68020)	:=
> -cpuflags-$(CONFIG_M68360)	:= -m68332
>   cpuflags-$(CONFIG_M68000)	:= -m68000
> +cpuflags-$(CONFIG_MCPU32)	:= -m68000
> +cpuflags-$(CONFIG_M68360)	:= -m68332
>   cpuflags-$(CONFIG_M54xx)	:= $(call cc-option,-mcpu=5475,-m5200)
>   cpuflags-$(CONFIG_M5407)	:= $(call cc-option,-mcpu=5407,-m5200)
>   cpuflags-$(CONFIG_M532x)	:= $(call cc-option,-mcpu=532x,-m5307)
> @@ -88,8 +89,9 @@ endif
>   #
>   head-y				:= arch/m68k/kernel/head.o
>   head-$(CONFIG_SUN3)		:= arch/m68k/kernel/sun3-head.o
> +head-$(CONFIG_M68000)		:= arch/m68k/platform/68000/head.o
>   head-$(CONFIG_M68360)		:= arch/m68k/platform/68360/head.o
> -head-$(CONFIG_M68000)		:= arch/m68k/platform/68328/head.o
> +head-$(CONFIG_MCPU32)		:= arch/m68k/platform/68328/head.o
>   head-$(CONFIG_COLDFIRE)		:= arch/m68k/platform/coldfire/head.o
>
>   core-y				+= arch/m68k/kernel/	arch/m68k/mm/
> @@ -111,7 +113,8 @@ core-$(CONFIG_M68040)		+= arch/m68k/fpsp040/
>   core-$(CONFIG_M68060)		+= arch/m68k/ifpsp060/
>   core-$(CONFIG_M68KFPU_EMU)	+= arch/m68k/math-emu/
>   core-$(CONFIG_M68360)		+= arch/m68k/platform/68360/
> -core-$(CONFIG_M68000)		+= arch/m68k/platform/68328/
> +core-$(CONFIG_M68000)		+= arch/m68k/platform/68000/
> +core-$(CONFIG_MCPU32)		+= arch/m68k/platform/68328/
>   core-$(CONFIG_M68EZ328)		+= arch/m68k/platform/68EZ328/
>   core-$(CONFIG_M68VZ328)		+= arch/m68k/platform/68VZ328/
>   core-$(CONFIG_COLDFIRE)		+= arch/m68k/platform/coldfire/
> diff --git a/arch/m68k/include/asm/bitops.h b/arch/m68k/include/asm/bitops.h
> index c6baa91..93b944d 100644
> --- a/arch/m68k/include/asm/bitops.h
> +++ b/arch/m68k/include/asm/bitops.h
> @@ -457,7 +457,7 @@ static inline unsigned long ffz(unsigned long word)
>    *	generic functions for those.
>    */
>   #if (defined(__mcfisaaplus__) || defined(__mcfisac__))&&  \
> -	!defined(CONFIG_M68000)&&  !defined(CONFIG_MCPU32)
> +	!defined(CONFIG_M68XXX)
>   static inline int __ffs(int x)
>   {
>   	__asm__ __volatile__ ("bitrev %0; ff1 %0"
> diff --git a/arch/m68k/include/asm/delay.h b/arch/m68k/include/asm/delay.h
> index 9c09bec..8e58c2a 100644
> --- a/arch/m68k/include/asm/delay.h
> +++ b/arch/m68k/include/asm/delay.h
> @@ -43,7 +43,7 @@ static inline void __delay(unsigned long loops)
>   extern void __bad_udelay(void);
>
>
> -#if defined(CONFIG_M68000) || defined(CONFIG_COLDFIRE)
> +#if defined(CONFIG_M68XXX) || defined(CONFIG_COLDFIRE)
>   /*
>    * The simpler m68k and ColdFire processors do not have a 32*32->64
>    * multiply instruction. So we need to handle them a little differently.
> diff --git a/arch/m68k/lib/memcpy.c b/arch/m68k/lib/memcpy.c
> index 10ca051..c0a1ae8 100644
> --- a/arch/m68k/lib/memcpy.c
> +++ b/arch/m68k/lib/memcpy.c
> @@ -22,7 +22,7 @@ void *memcpy(void *to, const void *from, size_t n)
>   		from = cfrom;
>   		n--;
>   	}
> -#if defined(CONFIG_M68000)
> +#if defined(CONFIG_M68XXX)
>   	if ((long)from&  1) {
>   		char *cto = to;
>   		const char *cfrom = from;
> @@ -43,7 +43,7 @@ void *memcpy(void *to, const void *from, size_t n)
>   	if (temp) {
>   		long *lto = to;
>   		const long *lfrom = from;
> -#if defined(CONFIG_M68000) || defined(CONFIG_COLDFIRE)
> +#if defined(CONFIG_M68XXX) || defined(CONFIG_COLDFIRE)
>   		for (; temp; temp--)
>   			*lto++ = *lfrom++;
>   #else
> diff --git a/arch/m68k/lib/memset.c b/arch/m68k/lib/memset.c
> index 8a7639f..6196f39 100644
> --- a/arch/m68k/lib/memset.c
> +++ b/arch/m68k/lib/memset.c
> @@ -32,7 +32,7 @@ void *memset(void *s, int c, size_t count)
>   	temp = count>>  2;
>   	if (temp) {
>   		long *ls = s;
> -#if defined(CONFIG_M68000) || defined(CONFIG_COLDFIRE)
> +#if defined(CONFIG_M68XXX) || defined(CONFIG_COLDFIRE)
>   		for (; temp; temp--)
>   			*ls++ = c;
>   #else
> diff --git a/arch/m68k/lib/muldi3.c b/arch/m68k/lib/muldi3.c
> index 79e928a..1cd9ba4 100644
> --- a/arch/m68k/lib/muldi3.c
> +++ b/arch/m68k/lib/muldi3.c
> @@ -19,7 +19,7 @@ along with GNU CC; see the file COPYING.  If not, write to
>   the Free Software Foundation, 59 Temple Place - Suite 330,
>   Boston, MA 02111-1307, USA.  */
>
> -#if defined(CONFIG_M68000) || defined(CONFIG_COLDFIRE)
> +#if defined(CONFIG_M68XXX) || defined(CONFIG_COLDFIRE)
>
>   #define SI_TYPE_SIZE 32
>   #define __BITS4 (SI_TYPE_SIZE / 4)


-- 
------------------------------------------------------------------------
Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.com
SnapGear Group, McAfee                      PHONE:       +61 7 3435 2888
8 Gardner Close,                            FAX:         +61 7 3891 3630
Milton, QLD, 4064, Australia                WEB: http://www.SnapGear.com
