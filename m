From: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>
Subject: Re: [PATCH] reinstate mac rtc
Date: Fri, 24 Oct 2008 04:49:22 +0200 (CEST)
Message-ID: <alpine.DEB.1.00.0810240430500.28232@zirkon.biophys.uni-duesseldorf.de>
References: <A4BCBF08-9D05-11DD-9A2B-00050249ADE1@kaffe.org>
 <alpine.LNX.2.00.0810181928560.1848@firda.kolla.no>
 <Pine.LNX.4.64.0810191352510.27783@loopy.telegraphics.com.au>
 <alpine.LNX.2.00.0810191813240.1848@firda.kolla.no>
 <alpine.DEB.1.00.0810200140300.14463@zirkon.biophys.uni-duesseldorf.de>
 <A064497F-167C-4BC4-9565-6530A6914285@lvivier.info>
 <alpine.DEB.1.00.0810220916590.18164@zirkon.biophys.uni-duesseldorf.de>
 <alpine.LNX.2.00.0810221309050.3377@halbrend.uninett.no>
 <5AC01130-D57C-4A0E-81EB-D10549A1146C@lvivier.info>
 <alpine.DEB.1.00.0810230538410.22587@zirkon.biophys.uni-duesseldorf.de>
 <Pine.LNX.4.64.0810230910460.7533@anakin>
 <Pine.LNX.4.64.0810230937200.7533@anakin>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; format=flowed; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail.rz.uni-duesseldorf.de ([134.99.128.30]:41031 "EHLO
	mail.rz.uni-duesseldorf.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752704AbYJXCtZ (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>);
	Thu, 23 Oct 2008 22:49:25 -0400
Received: from conversion-daemon by mail.rz.uni-duesseldorf.de
 (Sun Internet Mail Server sims.4.0.2001.07.26.11.50.p9)
 id <0K9800A012IA80@mail.rz.uni-duesseldorf.de> for linux-m68k@vger.kernel.org;
 Fri, 24 Oct 2008 04:49:23 +0200 (MEST)
In-reply-to: <Pine.LNX.4.64.0810230937200.7533@anakin>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Roman Zippel <zippel@linux-m68k.org>, Laurent Vivier <laurent@lvivier.info>, =?ISO-8859-15?Q?Kolbj=F8rn_Barmen?= <linux-m68k@kolla.no>, Finn Thain <fthain@telegraphics.com.au>, Riccardo <riccardo@kaffe.org>, Brad Boyer <flar@allandria.com>, Linux/m68k <linux-m68k@vger.kernel.org>

Hi Geert,

> On Thu, 23 Oct 2008, Geert Uytterhoeven wrote:
>> On Thu, 23 Oct 2008, Michael Schmitz wrote:
>> It seems to be removed in early 2.5 (2.4 has it, my oldest 2.5 is 2.5.5
>> and that one doesn't have it anymore):
>
>> and `mach_gettod' was wired up to 'mac_gettod'.
>>
>> No idea why it was removed. I should check my mail archives (2002 and
>> older are on CD).
>
> full-history-linux.git points to:
>
> commit d5d48bb9b0d46f7eb6168a2e573fcf78d00c7244
> Author: Roman Zippel <zippel@linux-m68k.org>
> Date:   Mon May 6 20:10:29 2002 -0700
>
>    [PATCH] m68k: remove hwclk_time/gettod [9/20]
>
>    - replace hwclk_time with rtc_time
>    - use hwclk instead of gettod to set initial time

> diff --git a/arch/m68k/kernel/time.c b/arch/m68k/kernel/time.c
> index af22bee..a845040 100644
> --- a/arch/m68k/kernel/time.c
> +++ b/arch/m68k/kernel/time.c
> @@ -17,6 +17,7 @@
> #include <linux/param.h>
> #include <linux/string.h>
> #include <linux/mm.h>
> +#include <linux/rtc.h>
>
> #include <asm/machdep.h>
> #include <asm/io.h>
> @@ -104,17 +105,17 @@ static void timer_interrupt(int irq, void *dummy, struct pt_regs * regs)
>
> void time_init(void)
> {
> -	unsigned int year, mon, day, hour, min, sec;
> +	struct rtc_time time;
>
> -	extern void arch_gettod(int *year, int *mon, int *day, int *hour,
> -				int *min, int *sec);
> +	if (mach_hwclk) {
> +		mach_hwclk(0, &time);
>
> -	arch_gettod (&year, &mon, &day, &hour, &min, &sec);
> -
> -	if ((year += 1900) < 1970)
> -		year += 100;
> -	xtime.tv_sec = mktime(year, mon, day, hour, min, sec);
> -	xtime.tv_usec = 0;
> +		if ((time.tm_year += 1900) < 1970)
> +			time.tm_year += 100;
> +		xtime.tv_sec = mktime(time.tm_year, time.tm_mon, time.tm_mday,
> +				      time.tm_hour, time.tm_min, time.tm_sec);
> +		xtime.tv_usec = 0;
> +	}
>
> 	mach_sched_init(timer_interrupt);
> }
> diff --git a/arch/m68k/mac/config.c b/arch/m68k/mac/config.c
> index 02b391d..0d5eca4 100644
> --- a/arch/m68k/mac/config.c
> +++ b/arch/m68k/mac/config.c
> @@ -62,9 +62,8 @@ void *mac_env;		/* Loaded by the boot asm */
> unsigned long mac_orig_videoaddr;
>
> /* Mac specific timer functions */
> -extern void mac_gettod (int *, int *, int *, int *, int *, int *);
> extern unsigned long mac_gettimeoffset (void);
> -extern int mac_hwclk (int, struct hwclk_time *);
> +extern int mac_hwclk (int, struct rtc_time *);
> extern int mac_set_clock_mmss (unsigned long);
> extern int show_mac_interrupts(struct seq_file *, void *);
> extern void iop_preinit(void);
> @@ -243,8 +242,10 @@ void __init config_mac(void)
> 	mach_default_handler = &mac_handlers;
> 	mach_get_irq_list    = show_mac_interrupts;
> 	mach_gettimeoffset   = mac_gettimeoffset;
> -	mach_gettod          = mac_gettod;
> +#warning move to adb/via init
> +#if 0
> 	mach_hwclk           = mac_hwclk;
> +#endif
> 	mach_set_clock_mmss	 = mac_set_clock_mmss;
> #if 0
> 	mach_mksound         = mac_mksound;
> diff --git a/arch/m68k/mac/misc.c b/arch/m68k/mac/misc.c
> index d507bc0..a0c487c 100644
> --- a/arch/m68k/mac/misc.c
> +++ b/arch/m68k/mac/misc.c
> @@ -11,7 +11,7 @@
> #include <linux/sched.h>
> #include <linux/slab.h>
> #include <linux/time.h>
> -
> +#include <linux/rtc.h>
> #include <linux/mm.h>
>
> #include <linux/adb.h>
> @@ -571,31 +571,11 @@ static void unmktime(unsigned long time, long offset,
> 	return;
> }
>
> -/*
> - * Return the boot time for use in initializing the kernel clock.
> - *
> - * I'd like to read the hardware clock here but many machines read
> - * the PRAM through ADB, and interrupts aren't initialized when this
> - * is called so ADB obviously won't work.
> - */
> -
> -void mac_gettod(int *yearp, int *monp, int *dayp,
> -	       int *hourp, int *minp, int *secp)
> -{
> -	/* Yes the GMT bias is backwards.  It looks like Penguin is
> -           screwing up the boottime it gives us... This works for me
> -           in Canada/Eastern but it might be wrong everywhere else. */
> -	unmktime(mac_bi_data.boottime, -mac_bi_data.gmtbias * 60,
> -		yearp, monp, dayp, hourp, minp, secp);
> -	/* For some reason this is off by one */
> -	*monp = *monp + 1;
> -}
> -

That part we'd need to graft onto the RTC routine(s) it seems, for those 
machines where we don't have reliable RTC at least.

> /*
>  * Read/write the hardware clock.
>  */
>
> -int mac_hwclk(int op, struct hwclk_time *t)
> +int mac_hwclk(int op, struct rtc_time *t)
> {
> 	unsigned long now;
>
> @@ -613,19 +593,19 @@ int mac_hwclk(int op, struct hwclk_time *t)
> 			now = 0;
> 		}
>
> -		t->wday = 0;
> +		t->tm_wday = 0;
> 		unmktime(now, 0,
> -			 &t->year, &t->mon, &t->day,
> -			 &t->hour, &t->min, &t->sec);
> +			 &t->tm_year, &t->tm_mon, &t->tm_mday,
> +			 &t->tm_hour, &t->tm_min, &t->tm_sec);
> 		printk("mac_hwclk: read %04d-%02d-%-2d %02d:%02d:%02d\n",
> -			t->year + 1900, t->mon + 1, t->day, t->hour, t->min, t->sec);
> +			t->tm_year + 1900, t->tm_mon + 1, t->tm_mday, t->tm_hour, t->tm_min, t->tm_sec);
> 	} else { /* write */
> 		printk("mac_hwclk: tried to write %04d-%02d-%-2d %02d:%02d:%02d\n",
> -			t->year + 1900, t->mon + 1, t->day, t->hour, t->min, t->sec);
> +			t->tm_year + 1900, t->tm_mon + 1, t->tm_mday, t->tm_hour, t->tm_min, t->tm_sec);
>
> #if 0	/* it trashes my rtc */
> -		now = mktime(t->year + 1900, t->mon + 1, t->day,
> -			     t->hour, t->min, t->sec);
> +		now = mktime(t->tm_year + 1900, t->tm_mon + 1, t->tm_mday,
> +			     t->tm_hour, t->tm_min, t->tm_sec);
>
> 		if (macintosh_config->adb_type == MAC_ADB_II) {
> 			via_write_time(now);

And that'll have changed anyway due to the generic RTC interface added.

> @@ -648,11 +628,11 @@ int mac_hwclk(int op, struct hwclk_time *t)
>
> int mac_set_clock_mmss (unsigned long nowtime)
> {
> -	struct hwclk_time now;
> +	struct rtc_time now;
>
> 	mac_hwclk(0, &now);
> -	now.sec = nowtime % 60;
> -	now.min = (nowtime / 60) % 60;
> +	now.tm_sec = nowtime % 60;
> +	now.tm_min = (nowtime / 60) % 60;
> 	mac_hwclk(1, &now);
>
> 	return 0;

That's probably gone now.

Thanks for narrowing that down - I had totally forgotten about 2.5 ever 
existing...

 	Michael
