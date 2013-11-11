From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: Linux 3.1-2-m68k config (was: Re: Linux 3.10-2-m68k FPU
 support)
Date: Mon, 11 Nov 2013 11:13:55 +1100 (EST)
Message-ID: <alpine.LNX.2.00.1311111111320.10595@nippy.intranet>
References: <CAMuHMdXDDyzdy80gDvS-i96pMSgiCw9AJTD3ts=HaCwC26KWUw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:45153 "EHLO
	kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752407Ab3KKAOF (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 10 Nov 2013 19:14:05 -0500
In-Reply-To: <CAMuHMdXDDyzdy80gDvS-i96pMSgiCw9AJTD3ts=HaCwC26KWUw@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Thorsten Glaser <tg@mirbsd.de>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Debian m68k <debian-68k@lists.debian.org>, Linux/m68k <linux-m68k@vger.kernel.org>


On Sun, 20 Oct 2013, Geert Uytterhoeven wrote:

> This is the difference between my multi_defconfig and config-3.10-2-m68k.

...

> 
> ! multi_defconfig -----------------------------+
> ! config-3.10-2-m68k ------------------------+ |
> !                                            | |

...

> ! CONFIG_FB_SYS_COPYAREA                   : m n
> ! CONFIG_FB_SYS_FILLRECT                   : m n
> ! CONFIG_FB_SYS_FOPS                       : m n
> ! CONFIG_FB_SYS_IMAGEBLIT                  : m n

Would this prevent the macfb framebuffer console from working in the 
absence of kernel modules?

Finn
