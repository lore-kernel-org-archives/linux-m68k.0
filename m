From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: [RFC v3 24/24] m68k: Dispatch nvram_ops calls to Atari or Mac
 functions
Date: Thu, 2 Jul 2015 12:07:14 +1000 (AEST)
Message-ID: <alpine.LNX.2.00.1507021146530.15903@nippy.intranet>
References: <20150628014159.732792697@telegraphics.com.au> <20150628014205.532621991@telegraphics.com.au> <CAMuHMdX0c3BjhkSMv4fUe1WVWDHhqRMHz=K15750EBatwkJisQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:34592 "EHLO
	kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753757AbbGBCHe (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 1 Jul 2015 22:07:34 -0400
In-Reply-To: <CAMuHMdX0c3BjhkSMv4fUe1WVWDHhqRMHz=K15750EBatwkJisQ@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, Linux/m68k <linux-m68k@vger.kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>


On Mon, 29 Jun 2015, Geert Uytterhoeven wrote:

> On Sun, Jun 28, 2015 at 3:42 AM, Finn Thain <fthain@telegraphics.com.au> 
> wrote:
> > --- linux.orig/arch/m68k/kernel/setup_mm.c      2015-06-28 11:41:27.000000000 +1000
> > +++ linux/arch/m68k/kernel/setup_mm.c   2015-06-28 11:41:56.000000000 +1000
> 
> > @@ -568,3 +569,109 @@ static int __init adb_probe_sync_enable
> >
> >  __setup("adb_sync", adb_probe_sync_enable);
> >  #endif /* CONFIG_ADB */
> > +
> > +#if IS_ENABLED(CONFIG_NVRAM)
> > +extern unsigned char mac_pram_read_byte(int);
> > +extern void mac_pram_write_byte(unsigned char, int);
> > +extern ssize_t mac_pram_get_size(void);
> > +
> > +extern ssize_t atari_nvram_read(char *, size_t, loff_t *);
> > +extern ssize_t atari_nvram_write(char *, size_t, loff_t *);
> > +extern long atari_nvram_set_checksum(void);
> > +extern long atari_nvram_initialize(void);
> > +extern ssize_t atari_nvram_get_size(void);
> 
> Forward declarations belong in a header file, to be included by both 
> producers and consumers.

Right, will fix. (That was how the v1 patch did this. Looks like I messed 
it up.)

> 
> > --- linux.orig/arch/m68k/Kconfig        2015-06-28 11:41:39.000000000 +1000
> > +++ linux/arch/m68k/Kconfig     2015-06-28 11:41:56.000000000 +1000
> > @@ -72,7 +72,7 @@ config PGTABLE_LEVELS
> >         default 3
> >
> >  config HAVE_ARCH_NVRAM_OPS
> > -       def_bool ATARI
> > +       def_bool ATARI || MAC
> 
> For maintainability, it's better to just have "bool" here, and let both 
> the ATARI and MAC config symbols select HAVE_ARCH_NVRAM_OPS.

OK, will fix.

Thanks for your review.

-- 

> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
