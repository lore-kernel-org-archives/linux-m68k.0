From: Luis Alves <ljalvs@gmail.com>
Subject: Re: [PATCH 1/1] Changes for 68000 code integration.
Date: Fri, 27 Apr 2012 15:30:29 +0100
Message-ID: <CAGj5WxBNxkXdS8atb-WVwWR5QLWPS6wreDnmpwaZLa=PzE6cNw@mail.gmail.com>
References: <1335481717-8652-1-git-send-email-ljalvs@gmail.com>
	<4F9AA7DD.2020501@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:58013 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1760020Ab2D0Oa3 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 27 Apr 2012 10:30:29 -0400
Received: by iadi9 with SMTP id i9so1084549iad.19
        for <linux-m68k@vger.kernel.org>; Fri, 27 Apr 2012 07:30:29 -0700 (PDT)
In-Reply-To: <4F9AA7DD.2020501@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: gerg@uclinux.org

On Fri, Apr 27, 2012 at 3:06 PM, Greg Ungerer <gerg@snapgear.com> wrote=
:
> Hi Luis,
>
>
> On 04/27/2012 09:08 AM, Luis Alves wrote:
>>
>> This is the first of a pack of patches to support the original 68000=
 cpu.
>> This adds:
>> =A0-MC68000 cpu as a choice in the config menu.
>> =A0-Alcetronics M68K board (uses this cpu).
>>
>> What I have changed:
>> =A0-CONFIG_M68000 was being used by 68328 CPUs.
>> =A0 Renamed to CONFIG_M68XXX. Now the 68000 and all CPU32 CPUs use t=
his flag
>> for common configurations.
>> =A0-Modified all 68[VZ|EZ]328 to select CONFIG_MCPU32
>> =A0-Modified CONFIG_MCPU32 to select CONFIG_M68XXX.
>> =A0-Modified CONFIG_M68360 to select CONFIG_M68XXX (I think it was m=
issing
>> some settings).
>> =A0-Modified some files to use CONFIG_M68XXX instead of
>> CONFIG_M68000/CONFIG_MCPU32
>
>
> Thinking on this a little more, you probably don't want most of
> these changes. Certainly as Brad points out CPU32 and 68000 are
> quite different, and they need to remain as separate config options.
>
> I can see you will end up with a arch/m68k/platform/68000 with
> some new code. Is any of that common with what is currently in
> arch/m68k/platform/68328? =A0I would expect we want to move the
> common 68000 code into that platform/68000 directory. Longer
> term we may want to do away with 68328/68EZ328/68VZ328 directories
> all together. All the code may go in a platform/68000. (Still
> thinking this one over though, but I am planning on doing away
> with the separate 5xxx ColdFire directories real soon now).
>

I think this is a good idea. Do you suggest putting all together in the
same file and use #ifdef's for cpu specific options? I could do that.

Also, how to deal with board specific configuration files?
As I referred in the previous mail, the 68000 has zero on-chip peripher=
als
so the initial setup and configuration is a lot 'board-dependent'.



Regards,
Luis




> Regards
> Greg
>
>
>
>
>> ---
>> =A0arch/m68k/Kconfig.cpu =A0 =A0 =A0 =A0 =A0| =A0 29 +++++++++++++++=
+++-----------
>> =A0arch/m68k/Kconfig.machine =A0 =A0 =A0| =A0 =A06 ++++++
>> =A0arch/m68k/Makefile =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =A09 ++++++---
>> =A0arch/m68k/include/asm/bitops.h | =A0 =A02 +-
>> =A0arch/m68k/include/asm/delay.h =A0| =A0 =A02 +-
>> =A0arch/m68k/lib/memcpy.c =A0 =A0 =A0 =A0 | =A0 =A04 ++--
>> =A0arch/m68k/lib/memset.c =A0 =A0 =A0 =A0 | =A0 =A02 +-
>> =A0arch/m68k/lib/muldi3.c =A0 =A0 =A0 =A0 | =A0 =A02 +-
>> =A08 files changed, 36 insertions(+), 20 deletions(-)
>>
>> diff --git a/arch/m68k/Kconfig.cpu b/arch/m68k/Kconfig.cpu
>> index 8a9c767..2abac0f 100644
>> --- a/arch/m68k/Kconfig.cpu
>> +++ b/arch/m68k/Kconfig.cpu
>> @@ -32,26 +32,33 @@ endchoice
>>
>> =A0if M68KCLASSIC
>>
>> -config M68000
>> +
>> +config M68XXX
>> =A0 =A0 =A0 =A0bool
>> =A0 =A0 =A0 =A0select CPU_HAS_NO_BITFIELDS
>> =A0 =A0 =A0 =A0select CPU_HAS_NO_MULDIV64
>> =A0 =A0 =A0 =A0select GENERIC_CSUM
>> =A0 =A0 =A0 =A0help
>> - =A0 =A0 =A0 =A0 The Freescale (was Motorola) 68000 CPU is the firs=
t generation
>> of
>> - =A0 =A0 =A0 =A0 the well known M68K family of processors. The CPU =
core as well
>> as
>> - =A0 =A0 =A0 =A0 being available as a stand alone CPU was also used=
 in many
>> - =A0 =A0 =A0 =A0 System-On-Chip devices (eg 68328, 68302, etc). It =
does not
>> contain
>> - =A0 =A0 =A0 =A0 a paging MMU.
>> + =A0 =A0 =A0 =A0 Common features for the first generation of M68K C=
PUs. It
>> + =A0 =A0 =A0 =A0 includes the original MC68000 and CPU32 core.
>> +
>>
>> =A0config MCPU32
>> =A0 =A0 =A0 =A0bool
>> - =A0 =A0 =A0 select CPU_HAS_NO_BITFIELDS
>> + =A0 =A0 =A0 select M68XXX
>> =A0 =A0 =A0 =A0help
>> =A0 =A0 =A0 =A0 =A0The Freescale (was then Motorola) CPU32 is a CPU =
core that is
>> =A0 =A0 =A0 =A0 =A0based on the 68020 processor. For the most part i=
t is used in
>> =A0 =A0 =A0 =A0 =A0System-On-Chip parts, and does not contain a pagi=
ng MMU.
>>
>> +config M68000
>> + =A0 =A0 =A0 bool "MC68000"
>> + =A0 =A0 =A0 select M68XXX
>> + =A0 =A0 =A0 help
>> + =A0 =A0 =A0 =A0 The Freescale (was Motorola) 68000 CPU is the firs=
t generation
>> of
>> + =A0 =A0 =A0 =A0 the well known M68K family of processors. It does =
not contain
>> + =A0 =A0 =A0 =A0 a paging MMU.
>> +
>> =A0config M68020
>> =A0 =A0 =A0 =A0bool "68020 support"
>> =A0 =A0 =A0 =A0depends on MMU
>> @@ -96,28 +103,28 @@ config M68060
>> =A0config M68328
>> =A0 =A0 =A0 =A0bool "MC68328"
>> =A0 =A0 =A0 =A0depends on !MMU
>> - =A0 =A0 =A0 select M68000
>> + =A0 =A0 =A0 select MCPU32
>> =A0 =A0 =A0 =A0help
>> =A0 =A0 =A0 =A0 =A0Motorola 68328 processor support.
>>
>> =A0config M68EZ328
>> =A0 =A0 =A0 =A0bool "MC68EZ328"
>> =A0 =A0 =A0 =A0depends on !MMU
>> - =A0 =A0 =A0 select M68000
>> + =A0 =A0 =A0 select MCPU32
>> =A0 =A0 =A0 =A0help
>> =A0 =A0 =A0 =A0 =A0Motorola 68EX328 processor support.
>>
>> =A0config M68VZ328
>> =A0 =A0 =A0 =A0bool "MC68VZ328"
>> =A0 =A0 =A0 =A0depends on !MMU
>> - =A0 =A0 =A0 select M68000
>> + =A0 =A0 =A0 select MCPU32
>> =A0 =A0 =A0 =A0help
>> =A0 =A0 =A0 =A0 =A0Motorola 68VZ328 processor support.
>>
>> =A0config M68360
>> =A0 =A0 =A0 =A0bool "MC68360"
>> =A0 =A0 =A0 =A0depends on !MMU
>> - =A0 =A0 =A0 select MCPU32
>> + =A0 =A0 =A0 select M68XXX
>> =A0 =A0 =A0 =A0help
>> =A0 =A0 =A0 =A0 =A0Motorola 68360 processor support.
>>
>> diff --git a/arch/m68k/Kconfig.machine b/arch/m68k/Kconfig.machine
>> index 7cdf6b0..25ce143 100644
>> --- a/arch/m68k/Kconfig.machine
>> +++ b/arch/m68k/Kconfig.machine
>> @@ -134,6 +134,12 @@ config SUN3
>>
>> =A0endif # M68KCLASSIC
>>
>> +config ALCE68K
>> + =A0 =A0 =A0 bool "Alcetronics M68K board support"
>> + =A0 =A0 =A0 depends on M68000
>> + =A0 =A0 =A0 help
>> + =A0 =A0 =A0 =A0 Support for the Alcetronics M68K board.
>> +
>> =A0config PILOT
>> =A0 =A0 =A0 =A0bool
>>
>> diff --git a/arch/m68k/Makefile b/arch/m68k/Makefile
>> index cf318f2..d1d7343 100644
>> --- a/arch/m68k/Makefile
>> +++ b/arch/m68k/Makefile
>> @@ -32,8 +32,9 @@ cpuflags-$(CONFIG_M68040) =A0 =A0 :=3D -m68040
>> =A0endif
>> =A0cpuflags-$(CONFIG_M68030) =A0 =A0 :=3D
>> =A0cpuflags-$(CONFIG_M68020) =A0 =A0 :=3D
>> -cpuflags-$(CONFIG_M68360) =A0 =A0 =A0:=3D -m68332
>> =A0cpuflags-$(CONFIG_M68000) =A0 =A0 :=3D -m68000
>> +cpuflags-$(CONFIG_MCPU32) =A0 =A0 =A0:=3D -m68000
>> +cpuflags-$(CONFIG_M68360) =A0 =A0 =A0:=3D -m68332
>> =A0cpuflags-$(CONFIG_M54xx) =A0 =A0 =A0:=3D $(call cc-option,-mcpu=3D=
5475,-m5200)
>> =A0cpuflags-$(CONFIG_M5407) =A0 =A0 =A0:=3D $(call cc-option,-mcpu=3D=
5407,-m5200)
>> =A0cpuflags-$(CONFIG_M532x) =A0 =A0 =A0:=3D $(call cc-option,-mcpu=3D=
532x,-m5307)
>> @@ -88,8 +89,9 @@ endif
>> =A0#
>> =A0head-y =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0:=3D arch/m68k/kernel/head.o
>> =A0head-$(CONFIG_SUN3) =A0 =A0 =A0 =A0 =A0 :=3D arch/m68k/kernel/sun=
3-head.o
>> +head-$(CONFIG_M68000) =A0 =A0 =A0 =A0 =A0:=3D arch/m68k/platform/68=
000/head.o
>> =A0head-$(CONFIG_M68360) =A0 =A0 =A0 =A0 :=3D arch/m68k/platform/683=
60/head.o
>> -head-$(CONFIG_M68000) =A0 =A0 =A0 =A0 =A0:=3D arch/m68k/platform/68=
328/head.o
>> +head-$(CONFIG_MCPU32) =A0 =A0 =A0 =A0 =A0:=3D arch/m68k/platform/68=
328/head.o
>> =A0head-$(CONFIG_COLDFIRE) =A0 =A0 =A0 =A0 =A0 =A0 =A0 :=3D
>> arch/m68k/platform/coldfire/head.o
>>
>> =A0core-y =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0+=3D arch/m68k/kernel/
>> =A0arch/m68k/mm/
>> @@ -111,7 +113,8 @@ core-$(CONFIG_M68040) =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 +=3D
>> arch/m68k/fpsp040/
>> =A0core-$(CONFIG_M68060) =A0 =A0 =A0 =A0 +=3D arch/m68k/ifpsp060/
>> =A0core-$(CONFIG_M68KFPU_EMU) =A0 =A0+=3D arch/m68k/math-emu/
>> =A0core-$(CONFIG_M68360) =A0 =A0 =A0 =A0 +=3D arch/m68k/platform/683=
60/
>> -core-$(CONFIG_M68000) =A0 =A0 =A0 =A0 =A0+=3D arch/m68k/platform/68=
328/
>> +core-$(CONFIG_M68000) =A0 =A0 =A0 =A0 =A0+=3D arch/m68k/platform/68=
000/
>> +core-$(CONFIG_MCPU32) =A0 =A0 =A0 =A0 =A0+=3D arch/m68k/platform/68=
328/
>> =A0core-$(CONFIG_M68EZ328) =A0 =A0 =A0 =A0 =A0 =A0 =A0 +=3D arch/m68=
k/platform/68EZ328/
>> =A0core-$(CONFIG_M68VZ328) =A0 =A0 =A0 =A0 =A0 =A0 =A0 +=3D arch/m68=
k/platform/68VZ328/
>> =A0core-$(CONFIG_COLDFIRE) =A0 =A0 =A0 =A0 =A0 =A0 =A0 +=3D arch/m68=
k/platform/coldfire/
>> diff --git a/arch/m68k/include/asm/bitops.h
>> b/arch/m68k/include/asm/bitops.h
>> index c6baa91..93b944d 100644
>> --- a/arch/m68k/include/asm/bitops.h
>> +++ b/arch/m68k/include/asm/bitops.h
>> @@ -457,7 +457,7 @@ static inline unsigned long ffz(unsigned long wo=
rd)
>> =A0 * =A0 =A0generic functions for those.
>> =A0 */
>> =A0#if (defined(__mcfisaaplus__) || defined(__mcfisac__))&& =A0\
>> - =A0 =A0 =A0 !defined(CONFIG_M68000)&& =A0!defined(CONFIG_MCPU32)
>>
>> + =A0 =A0 =A0 !defined(CONFIG_M68XXX)
>> =A0static inline int __ffs(int x)
>> =A0{
>> =A0 =A0 =A0 =A0__asm__ __volatile__ ("bitrev %0; ff1 %0"
>> diff --git a/arch/m68k/include/asm/delay.h b/arch/m68k/include/asm/d=
elay.h
>> index 9c09bec..8e58c2a 100644
>> --- a/arch/m68k/include/asm/delay.h
>> +++ b/arch/m68k/include/asm/delay.h
>> @@ -43,7 +43,7 @@ static inline void __delay(unsigned long loops)
>> =A0extern void __bad_udelay(void);
>>
>>
>> -#if defined(CONFIG_M68000) || defined(CONFIG_COLDFIRE)
>> +#if defined(CONFIG_M68XXX) || defined(CONFIG_COLDFIRE)
>> =A0/*
>> =A0 * The simpler m68k and ColdFire processors do not have a 32*32->=
64
>> =A0 * multiply instruction. So we need to handle them a little diffe=
rently.
>> diff --git a/arch/m68k/lib/memcpy.c b/arch/m68k/lib/memcpy.c
>> index 10ca051..c0a1ae8 100644
>> --- a/arch/m68k/lib/memcpy.c
>> +++ b/arch/m68k/lib/memcpy.c
>> @@ -22,7 +22,7 @@ void *memcpy(void *to, const void *from, size_t n)
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0from =3D cfrom;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0n--;
>> =A0 =A0 =A0 =A0}
>> -#if defined(CONFIG_M68000)
>> +#if defined(CONFIG_M68XXX)
>> =A0 =A0 =A0 =A0if ((long)from& =A01) {
>>
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0char *cto =3D to;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0const char *cfrom =3D from;
>> @@ -43,7 +43,7 @@ void *memcpy(void *to, const void *from, size_t n)
>> =A0 =A0 =A0 =A0if (temp) {
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0long *lto =3D to;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0const long *lfrom =3D from;
>> -#if defined(CONFIG_M68000) || defined(CONFIG_COLDFIRE)
>> +#if defined(CONFIG_M68XXX) || defined(CONFIG_COLDFIRE)
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0for (; temp; temp--)
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0*lto++ =3D *lfrom++;
>> =A0#else
>> diff --git a/arch/m68k/lib/memset.c b/arch/m68k/lib/memset.c
>> index 8a7639f..6196f39 100644
>> --- a/arch/m68k/lib/memset.c
>> +++ b/arch/m68k/lib/memset.c
>> @@ -32,7 +32,7 @@ void *memset(void *s, int c, size_t count)
>> =A0 =A0 =A0 =A0temp =3D count>> =A02;
>> =A0 =A0 =A0 =A0if (temp) {
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0long *ls =3D s;
>> -#if defined(CONFIG_M68000) || defined(CONFIG_COLDFIRE)
>> +#if defined(CONFIG_M68XXX) || defined(CONFIG_COLDFIRE)
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0for (; temp; temp--)
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0*ls++ =3D c;
>> =A0#else
>> diff --git a/arch/m68k/lib/muldi3.c b/arch/m68k/lib/muldi3.c
>> index 79e928a..1cd9ba4 100644
>> --- a/arch/m68k/lib/muldi3.c
>> +++ b/arch/m68k/lib/muldi3.c
>> @@ -19,7 +19,7 @@ along with GNU CC; see the file COPYING. =A0If not=
, write
>> to
>> =A0the Free Software Foundation, 59 Temple Place - Suite 330,
>> =A0Boston, MA 02111-1307, USA. =A0*/
>>
>> -#if defined(CONFIG_M68000) || defined(CONFIG_COLDFIRE)
>> +#if defined(CONFIG_M68XXX) || defined(CONFIG_COLDFIRE)
>>
>> =A0#define SI_TYPE_SIZE 32
>> =A0#define __BITS4 (SI_TYPE_SIZE / 4)
>
>
>
> --
> ---------------------------------------------------------------------=
---
> Greg Ungerer =A0-- =A0Principal Engineer =A0 =A0 =A0 =A0EMAIL: =A0 =A0=
 gerg@snapgear.com
> SnapGear Group, McAfee =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0PHO=
NE: =A0 =A0 =A0 +61 7 3435 2888
> 8 Gardner Close, =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0FAX: =A0 =A0 =A0 =A0 +61 7 3891 3630
>
> Milton, QLD, 4064, Australia =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0WEB: http=
://www.SnapGear.com
