From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: Linux 3.1-2-m68k config (was: Re: Linux 3.10-2-m68k FPU
 support)
Date: Tue, 12 Nov 2013 11:21:52 +1100 (EST)
Message-ID: <alpine.LNX.2.00.1311121104180.20517@nippy.intranet>
References: <CAMuHMdXDDyzdy80gDvS-i96pMSgiCw9AJTD3ts=HaCwC26KWUw@mail.gmail.com> <alpine.LNX.2.00.1311111111320.10595@nippy.intranet> <Pine.BSM.4.64L.1311110108550.15024@herc.mirbsd.org> <alpine.LNX.2.00.1311111600420.13170@nippy.intranet>
 <CAMuHMdXKPDo-cNL5btcmy=4obz9WB2W=9BUxbu5m72UXDSyN_w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:56491 "EHLO
	kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753427Ab3KLAWH (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 11 Nov 2013 19:22:07 -0500
In-Reply-To: <CAMuHMdXKPDo-cNL5btcmy=4obz9WB2W=9BUxbu5m72UXDSyN_w@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Thorsten Glaser <tg@mirbsd.de>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Debian m68k <debian-68k@lists.debian.org>, Linux/m68k <linux-m68k@vger.kernel.org>


On Mon, 11 Nov 2013, Geert Uytterhoeven wrote:

> On Mon, Nov 11, 2013 at 6:16 AM, Finn Thain <fthain@telegraphics.com.au> wrote:
> >> > ! CONFIG_FB_SYS_COPYAREA                   : m n
> >> > ! CONFIG_FB_SYS_FILLRECT                   : m n
> >> > ! CONFIG_FB_SYS_FOPS                       : m n
> >> > ! CONFIG_FB_SYS_IMAGEBLIT                  : m n
> >> >
> >> >Would this prevent the macfb framebuffer console from working in the 
> >> >absence of kernel modules?
> >> >
> >>
> >> With the switch to initrd, absence of modules is simply no longer 
> >> supported at all, period.
> >
> > When something goes wrong, and the kernel messages aren't available to 
> > tell you what went wrong, then you may lack the information you need 
> > to support those things that you are willing to support.
> >
> > Hence I was trying to find an explanation for the screen shot posted, 
> > which says "console [tty0] enabled" even though the macfb console did 
> > not appear.
> 
> No, without fb/console support you wouldn't even see those.

"console [tty0] enabled" comes from the early console, which implies 
CONFIG_FRAMEBUFFER_CONSOLE and CONFIG_EARLY_PRINTK. But neither of these 
implies a working macfb...

> 
> >> ...
> >> Besides, if multi_defconfig has it as "n"...
> >
> > That should be OK; all of my test kernel configs also disable these 
> > options.
> 
> Indeed. Mac needs the CONFIG_FB_CFB_* counterparts.
> 
> CONFIG_FB_SYS_* is for system RAM, while CONFIG_FB_CFB_* is for iomem. 
> Not that it would matter much on m68k, m68k has no strict separation 
> between both.

OK, thanks Geert.

I guess the mystery of the missing macfb remains unsolved.

Without hardware I'm not going to be much help here.

Finn
