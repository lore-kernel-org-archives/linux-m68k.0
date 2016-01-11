From: Greg Ungerer <gerg@uclinux.org>
Subject: Re: [PATCH] m68k/atari, m68k/sun3: Fix SCSI platform device
 registration when driver is modular
Date: Mon, 11 Jan 2016 10:13:49 +1000
Message-ID: <5692F3BD.40408@uclinux.org>
References: <alpine.LNX.2.00.1512181218530.12965@nippy.intranet>
 <CAMuHMdVmqtErVxyP=YRPBE2PMx6QBgiWEd0ra3QbFhcptm4beg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from icp-osb-irony-out1.external.iinet.net.au ([203.59.1.210]:40242
	"EHLO icp-osb-irony-out1.external.iinet.net.au" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1757375AbcAKANS (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>);
	Sun, 10 Jan 2016 19:13:18 -0500
In-Reply-To: <CAMuHMdVmqtErVxyP=YRPBE2PMx6QBgiWEd0ra3QbFhcptm4beg@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>, Finn Thain <fthain@telegraphics.com.au>
Cc: Michael Schmitz <schmitzmic@gmail.com>, Linux/m68k <linux-m68k@vger.kernel.org>

Hi Geert,

On 10/01/16 23:00, Geert Uytterhoeven wrote:
> Hi Finn,
> 
> On Fri, Dec 18, 2015 at 2:44 AM, Finn Thain <fthain@telegraphics.com.au> wrote:
>> Fixes: 3ff228af84b5 ("atari_scsi: Convert to platform device")
>> Fixes: 0d31f8759109 ("sun3_scsi: Convert to platform device")
>> Reported-by: Michael Schmitz <schmitzmic@gmail.com>
>> Signed-off-by: Finn Thain <fthain@telegraphics.com.au>
> 
> Thanks, applied and queued for v4.5.
> 
>> Index: linux/arch/m68k/atari/config.c
>> ===================================================================
>> --- linux.orig/arch/m68k/atari/config.c 2015-12-18 12:06:53.000000000 +1100
>> +++ linux/arch/m68k/atari/config.c      2015-12-18 12:07:00.000000000 +1100
>> @@ -858,7 +858,7 @@ static struct platform_device *atari_net
>>  };
>>  #endif /* CONFIG_ATARI_ETHERNEC */
>>
>> -#ifdef CONFIG_ATARI_SCSI
>> +#if IS_ENABLED(CONFIG_ATARI_SCSI)
>>  static const struct resource atari_scsi_st_rsrc[] __initconst = {
>>         {
>>                 .flags = IORESOURCE_IRQ,
>> @@ -910,7 +910,7 @@ int __init atari_platform_init(void)
>>         }
>>  #endif
>>
>> -#ifdef CONFIG_ATARI_SCSI
>> +#if IS_ENABLED(CONFIG_ATARI_SCSI)
>>         if (ATARIHW_PRESENT(ST_SCSI))
>>                 platform_device_register_simple("atari_scsi", -1,
>>                         atari_scsi_st_rsrc, ARRAY_SIZE(atari_scsi_st_rsrc));
>> Index: linux/arch/m68k/sun3/config.c
>> ===================================================================
>> --- linux.orig/arch/m68k/sun3/config.c  2015-12-18 12:06:53.000000000 +1100
>> +++ linux/arch/m68k/sun3/config.c       2015-12-18 12:07:00.000000000 +1100
>> @@ -171,7 +171,7 @@ static void __init sun3_sched_init(irq_h
>>          intersil_clear();
>>  }
>>
>> -#ifdef CONFIG_SUN3_SCSI
>> +#if IS_ENABLED(CONFIG_SUN3_SCSI)
>>
>>  static const struct resource sun3_scsi_vme_rsrc[] __initconst = {
>>         {
> 
> Greg: There's a similar issue on Coldfire with CONFIG_FEC.

Thanks, I'll fix and postr a patch here.

Regards
Greg



> We also have an #ifdef for tristate BLK_DEV_FD, but as that one depends on
> broken, we don't care ;-)
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
> 
