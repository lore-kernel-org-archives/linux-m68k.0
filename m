From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: iop_msg_pool
Date: Sat, 29 Jun 2013 14:47:34 +1000 (EST)
Message-ID: <alpine.LNX.2.00.1306290034500.1099@nippy.intranet>
References: <CAMuHMdUCMUkoDbTFFXnVp-6E0LO5Y=4t64E13cWSpS1jVr2D_w@mail.gmail.com> <alpine.LNX.2.00.1306262026380.19790@nippy.intranet> <CAMuHMdX7WMDC9XXZrWYdcC0NouFjrS3TK+_U-DvmUAET5JB+DA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:44448 "EHLO
	kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750950Ab3F2Err (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sat, 29 Jun 2013 00:47:47 -0400
In-Reply-To: <CAMuHMdX7WMDC9XXZrWYdcC0NouFjrS3TK+_U-DvmUAET5JB+DA@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>


On Fri, 28 Jun 2013, Geert Uytterhoeven wrote:

> Hi Finn,
> 
> On Wed, Jun 26, 2013 at 12:48 PM, Finn Thain <fthain@telegraphics.com.au> wrote:
> >>
> >> As iop_msg_pool consumes 4928 bytes, it should be allocated 
> >> dynamically, especially for multi-platform kernels not running on 
> >> Mac.
> >
> > I agree. Though I don't care much for multi-platform kernels: bloat in 
> > portable code is easily excused when most users of that code run it on 
> > recent hardware. We don't have that excuse.
> >
> > Maybe use kcalloc() to allocate iop_msg_pool, iop_send_queue and 
> > iop_listeners and remove all of the following initialisation. I don't 
> > see a convenient way to call kfree() though.
> 
> At this time, slab hasn't been initialized yet, so kzalloc() is out of 
> the question. As iop_init() is called even before paging_init(), the 
> bootmem allocator is also not available yet.
> 
> I'm wondering if the call to iop_init() can be moved to 
> mac_platform_init(), where we can allocate memory?

Yes, but it would have to be called before mac_platform_init() registers 
the SWIM device. Preferably with a comment to that effect.

The devices attached to the IOPs are SWIM, SCC and ADB. iop_preinit() 
places the SCC channel in bypass mode, so we don't need iop_init() to use 
the SCC. ADB doesn't start until device_initcall(adb_init).

> The only callers into iop are adb-iop, which definitely runs later, and 
> mac_init_IRQ(), which calls iop_register_interrupts(). The latter may be 
> an issue: can we receive iop interrupts immediately after 
> iop_register_interrupts()? If yes, this may call into an uninitialized 
> iop module.

That could be a problem if we get the sequence wrong.

> Perhaps the call to iop_register_interrupts() can be done from 
> iop_init() instead?

Yes, I think so. The VIA initialisation disables the IOP interrupt sources 
(IRQ_VIA1_2 and IRQ_VIA2_0). After that, we call via_register_interrupts() 
and later iop_register_interrupts(), and then call iop_init(). After that 
the ADB driver can start exchanging messages between CPU and the IOP. The 
sequence is important, but you can delay iop_register_interrupts() until 
iop_init().

So I would move the contents of iop_register_interrupts() to the beginning 
of iop_init(), after you allocate messaging memory but before iop_start() 
is called. I'd eliminate iop_register_interrupts() entirely (see iop.c, 
mac_iop.h, macints.c).

The following code in macints.c strikes me as slightly misleading.

173	if (oss_present)
174		oss_register_interrupts();
175	else
176		via_register_interrupts();
177	if (psc_present)
178		psc_register_interrupts();
179	if (baboon_present)
180		baboon_register_interrupts();
181	iop_register_interrupts();

OSS, VIA, PSC and Baboon handlers all dispatch interrupts to drivers that 
register them, whereas the IOP handler doesn't do that. It is actually a 
driver, not an interrupt controller. It uses VIA interrupts and provides 
messaging services to other drivers. So eliminating 
iop_register_interrupts() could improve clarity.

Finn

> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
