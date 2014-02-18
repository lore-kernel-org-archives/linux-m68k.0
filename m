From: Stephen N Chivers <schivers@csc.com.au>
Subject: Re: SCSI OOPS.
Date: Wed, 19 Feb 2014 06:23:10 +1000
Message-ID: <OF77FDF379.1F1F9CA9-ONCA257C83.006F5534-CA257C83.006FFC0F@csc.com>
References: <alpine.LNX.2.00.1402151533350.16321@nippy.intranet>	<CAMuHMdULJ+61j4SreJXjPwnHVcQ_W4_ousfBzZz1+RqgF+hSGA@mail.gmail.com>
	<OF85B22C02.E99ADB8D-ONCA257C82.007AA014-CA257C82.007B99D2@csc.com> <CAMuHMdUcy5dCrPr03bNsDcVMCRh6zJxD33fSw2eBB0Y4=zi7ag@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail1.bemta8.messagelabs.com ([216.82.243.206]:31612 "EHLO
	mail1.bemta8.messagelabs.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751930AbaBRU3o (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>);
	Tue, 18 Feb 2014 15:29:44 -0500
In-Reply-To: <CAMuHMdUcy5dCrPr03bNsDcVMCRh6zJxD33fSw2eBB0Y4=zi7ag@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: geert.uytterhoeven@gmail.com, Kars de Jong <jongk@linux-m68k.org>, Linux/m68k <linux-m68k@vger.kernel.org>, Stephen N Chivers <schivers@csc.com.au>

Geert , Karl et al:

geert.uytterhoeven@gmail.com wrote on 02/18/2014 07:06:14 PM:

> From: Geert Uytterhoeven <geert@linux-m68k.org>
> To: Stephen N Chivers <schivers@csc.com.au>
> Cc: Kars de Jong <jongk@linux-m68k.org>, "Linux/m68k" <linux-
> m68k@vger.kernel.org>
> Date: 02/18/2014 07:06 PM
> Subject: Re: SCSI OOPS.
> Sent by: geert.uytterhoeven@gmail.com
> 
> Hi Stephen,
> 
> (adding Kars and linux-m68k)
> 
> On Mon, Feb 17, 2014 at 11:30 PM, Stephen N Chivers 
> <schivers@csc.com.au> wrote:
> > Below is the OOPS I got for linux-3.14-rc2 compiled for the MVME167.
> >
> > For me it is not particularly important as my boards are normally 
operated
> > diskless.
> >
snip.....
> > Modules linked in:
> > PC: [<001b69fe>] NCR_700_detect+0x26c/0x428
> 
> This looks like the first access to the chip:
> 
>     /* kick the chip */
>     NCR_700_writeb(0xff, host, CTEST9_REG);
> 
> The driver didn't ioremap() 0xfff47000, but this should be covered
> by the transparent mapping set up in head.S:
> 
>     mmu_map_tt      #1,#0xe0000000,#0x20000000,#_PAGE_NOCACHE_S
> 
> Does SCSI work from the boot loader/in older kernels?
I have never tried as the boards have always been operated
diskless, either with VxWorks or Linux.
I do not think I have any suitable SCSI disks, or
even a mechanism to power them. The boards are in ancient
VME32 backplanes.

I might be able to use some old disks from
some SUN sparcstation10/20s I have as they would probably be the
closest to those supported by the controller.

It is an area I have not thought about at all. 
> 
> > SR: 2008  SP: 01c27d48  a2: 01c24be0
> > d0: 000000ff    d1: fff47020    d2: 00042b78    d3: 01d404e0
> > d4: 01cbf26a    d5: 0019bbb2    a0: fff47020    a1: 0028599e
> > Process swapper (pid: 1, task=01c24be0)
> > Frame format=7 eff addr=00000004 ssw=00a5 faddr=fff47020
> > wb 1 stat/addr/data: 00a5 fff47020 ffffffff
> > wb 2 stat/addr/data: 0025 fff47020 ffffffff
> > wb 3 stat/addr/data: 0025 fff47020 ffffffff
> > push data: ffffffff 001b69fc 000000ff fff47020
> > Stack from 01c27db0:
> >         01cbf26a 01c27e4c 01cbf26a 01d2b9f0 01cbf26a 01cbf26a 01d40000
> > 01cbf26a
> >         001b79bc 0031d014 01d2b9f0 01cbf26a 0031cfc0 01cbf26a 0031c27a
> > 002d0e84
> >         0019f822 01cbf260 01cbf26a 0031cfd4 0019e4de 01cbf26a 01cbf26a
> > 0031cfd4
> >         0019e7c4 0031c27a 0019e7f2 0031cfd4 01cbf26a 00000000 00267d92
> > 0019d038
> >         0031cfd4 01cbf26a 00000000 00000000 0019b8e4 01cbf26a 01cbf29c
> > 01c4cefc
> >         01d2bae4 0019e858 0031c27a 00000000 01cbf26a 0019e7c4 00000000
> > 01cbf26a
> > Call Trace: [<001b79bc>] mvme16x_probe+0x6a/0x156
> >  [<0019f822>] platform_drv_probe+0x18/0x40
> >  [<0019e4de>] driver_probe_device+0xce/0x270
> >  [<0019e7c4>] __device_attach+0x0/0x36
> >  [<0019e7f2>] __device_attach+0x2e/0x36
> >  [<00267d92>] klist_next+0x0/0xfa
> >  [<0019d038>] bus_for_each_drv+0x62/0xae
> >  [<0019b8e4>] device_create_file+0x0/0x98
> >  [<0019e858>] device_attach+0x5e/0x76
> >  [<0019e7c4>] __device_attach+0x0/0x36
> >  [<0019d5f0>] bus_probe_device+0x7a/0xbc
> >  [<0019bd8c>] device_add+0x1c4/0x4f2
> >  [<00035002>] parse_args+0x0/0x296
> >  [<00170b14>] strcpy+0x0/0x16
> >  [<0019fb14>] platform_device_add+0x200/0x232
> >  [<0019fb36>] platform_device_add+0x222/0x232
> >  [<0019ff48>] platform_device_register_full+0xb8/0xec
> >  [<0035903c>] mvme16x_scsi_init+0x0/0x7a
> >  [<0035908a>] mvme16x_scsi_init+0x4e/0x7a
> >  [<000020f4>] do_one_initcall+0xec/0x188
> >  [<00035002>] parse_args+0x0/0x296
> >  [<00170b14>] strcpy+0x0/0x16
> >  [<00002008>] do_one_initcall+0x0/0x188
> >  [<00035002>] parse_args+0x0/0x296
> >  [<00170b14>] strcpy+0x0/0x16
> >  [<00002008>] do_one_initcall+0x0/0x188
> >  [<00040006>] __wake_up_common+0x6/0x66
> >  [<00348b34>] kernel_init_freeable+0xc4/0x184
> >  [<00348b4c>] kernel_init_freeable+0xdc/0x184
> >  [<0035903c>] mvme16x_scsi_init+0x0/0x7a
> >  [<0026b602>] schedule+0x0/0x46
> >  [<00018df4>] _060_fpsp_effadd+0x8210/0xd518
> >  [<00269d50>] kernel_init+0x0/0xd0
> >  [<00269d58>] kernel_init+0x8/0xd0
> >  [<00269d50>] kernel_init+0x0/0xd0
> >  [<000028dc>] ret_from_kernel_thread+0xc/0x14
> >
> > Code: 0004 2f01 4878 00ff 61ff fffc 40f4 508f <082c> 0006 0018 6600 
00c2
> > 206d 0248 7218 d2a8 0004 2f01 47f9 0017 ab84 4e93 e808
> > Disabling lock debugging due to kernel taint
> > Kernel panic - not syncing: Attempted to kill init! 
exitcode=0x0000000b
> >
> >
> > I will put in diagnostics for this sometime this coming weekend.
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- 
> geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. 
But
> when I'm talking to journalists I just say "programmer" or somethinglike 
that.
>                                 -- Linus Torvalds
Regards,
Stephen Chivers,
CSC Australia Pty. Ltd.
