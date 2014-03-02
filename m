From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: [RFC 1/4] m68k: remove CONSOLE_PENGIUN macro, adopt
 CONFIG_LOGO
Date: Sun, 2 Mar 2014 22:22:49 +1100 (EST)
Message-ID: <alpine.LNX.2.00.1403022221270.25474@nippy.intranet>
References: <alpine.LNX.2.00.1402151532410.16321@nippy.intranet> <CAMuHMdX6+pUS+AUak3xoRHMnC=tdFO3B97E6Aaj21Sd3boParg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdX6+pUS+AUak3xoRHMnC=tdFO3B97E6Aaj21Sd3boParg@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k <linux-m68k@lists.linux-m68k.org>


On Sun, 2 Mar 2014, Geert Uytterhoeven wrote:

> On Sat, Feb 15, 2014 at 5:45 AM, Finn Thain <fthain@telegraphics.com.au> wrote:
> > Allow CONFIG_LOGO to enable/disable the head.S penguin logo as well as 
> > the framebuffer console logo. This should save a few bytes. It also 
> > gets rid of the obscure CONSOLE_PENGIUN macro.
> 
> Looks fine to me. Can I add your SoB and take it?
> 

Yes, thanks.

Finn
