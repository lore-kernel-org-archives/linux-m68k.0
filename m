From: Brad Boyer <flar@allandria.com>
Subject: Re: X11 problems
Date: Thu, 14 May 2009 09:38:21 -0700
Message-ID: <20090514163821.GA1898@cynthia.pants.nu>
References: <FCFD5D59-4060-11DE-A812-00050249ADE1@kaffe.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from [76.245.85.235] ([76.245.85.235]:52166 "EHLO cynthia.pants.nu"
	rhost-flags-FAIL-FAIL-OK-OK) by vger.kernel.org with ESMTP
	id S1751502AbZENQiq (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Thu, 14 May 2009 12:38:46 -0400
Content-Disposition: inline
In-Reply-To: <FCFD5D59-4060-11DE-A812-00050249ADE1@kaffe.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Riccardo <riccardo@kaffe.org>
Cc: linux-m68k@vger.kernel.org

On Thu, May 14, 2009 at 10:26:57AM +0200, Riccardo wrote:
> I have two problems with X11 on my Q950. The first is that the X server  
> doesn't start up:
> 
> here a snippet from my X11 log:
> <...>
> (II) Loading /usr/lib/xorg/modules//libshadow.so
> (II) Module shadow: vendor="X.Org Foundation"
>         compiled for 1.4.2, module version = 1.1.0
>         ABI class: X.Org ANSI C Emulation, version 0.3
> (EE) FBDEV(0): FBIOPUT_VSCREENINFO succeeded but modified mode
> (EE) FBDEV(0): mode initialization failed
> 
> Fatal server error:
> AddScreen/ScreenInit failed for driver 0

Are you using built-in video or a card? Also, have you specified a
mode in your X11 configuration that is different from the one the
card is already in? I don't think the macfb driver currently supports
changing the video mode in any way.

> Then furthermore, I compiled all my precious GNUstep stuff (make, base,  
> back and two test apps). I export the display and then I get the  
> following error:
> 
> /usr/GNUstep/Local/Applications/Terminal.app/Terminal: symbol lookup  
> error:  
> /usr/GNUstep/Local/Library/Bundles/libgnustep-back-017.bundle/./ 
> libgnustep-back-017: undefined symbol: XShmQueryVersion
> 
> Do we miss this symbol? I recompiled gnustep-back again and got no  
> errors... Ideas?

That is a tough one to diagnose without trying it myself. It's not m68k,
but on one of my systems I did the following to confirm that the library
had that symbol:

flar@cynthia:~$ objdump -T /usr/lib/libXext.so.6.4.0 | grep XShm
0000bc34 g    DF .text  0000017c  Base        XShmDetach
0000c844 g    DF .text  00000314  Base        XShmGetImage
0000c404 g    DF .text  0000020c  Base        XShmPixmapFormat
0000ce04 g    DF .text  000001b8  Base        XShmCreateImage
0000cb64 g    DF .text  00000290  Base        XShmPutImage
0000bdb4 g    DF .text  000001ac  Base        XShmAttach
0000c614 g    DF .text  0000022c  Base        XShmQueryVersion
0000bfc0 g    DF .text  00000040  Base        XShmQueryExtension
0000bf60 g    DF .text  00000054  Base        XShmGetEventBase
0000ba34 g    DF .text  000001fc  Base        XShmCreatePixmap

Confirming that you have a library with that symbol would at least
narrow down the possibilities. After that, it would either be a
problem that it is looking in the wrong place or that there is
some kind of bug with the runtime environment in some way. That would
be tougher to debug, particularly since it might be libobject or the
objc code in the compiler.

	Brad Boyer
	flar@allandria.com

