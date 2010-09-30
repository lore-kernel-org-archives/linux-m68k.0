From: Al Viro <viro@ZenIV.linux.org.uk>
Subject: Re: m68k, signals and single-stepping
Date: Thu, 30 Sep 2010 17:50:41 +0100
Message-ID: <20100930165041.GN19804@ZenIV.linux.org.uk>
References: <20100930055823.GK19804@ZenIV.linux.org.uk>
 <AANLkTimigeCBQdh1CxsxojKNGXWcoLQg10weE8w1r5v5@mail.gmail.com>
 <m362xn63qc.fsf@hase.home>
 <20100930120504.GM19804@ZenIV.linux.org.uk>
 <m3lj6j4dh8.fsf@hase.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from zeniv.linux.org.uk ([195.92.253.2]:36575 "EHLO
	ZenIV.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932236Ab0I3Qum (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 30 Sep 2010 12:50:42 -0400
Content-Disposition: inline
In-Reply-To: <m3lj6j4dh8.fsf@hase.home>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Linux/m68k <linux-m68k@vger.kernel.org>

On Thu, Sep 30, 2010 at 02:34:11PM +0200, Andreas Schwab wrote:

> > Um...  What's wrong with doing that from trap_c()?
> 
> IIRC that was the only way to make gdb work correctly wrt. single
> stepping over system calls and into signal handlers.  If anyone wants to
> test it with today's kernel on real hardware, please go ahead.

Ouch...  Resurrecting that 840av box will be interesting - most likely
a dead battery, but... ;-/  And yes, I certainly understand why qemu
testing is not sufficient for that kind of stuff - subtle enough to
make the odds of stepping on qemu bugs...

Oh, well.  Anyway, the obvious ones I've got are:
	* setup_frame/setup_rt_frame should report failure, so that
handle_signal() wouldn't block signals in that case (losing the original
mask, since it's not stored anywhere in that case)
	* notify_resume isn't handled at all
	* sigsuspend would be better off with ERESTARTNOHAND scheme.

FWIW, I wonder if it would be better to have handle_signal() call
send_sig() and clear regs.SR.T1 and forget about checking return
value of do_signal(); do_delayed_trace is still needed, since currently
there are two places that can reach it, but it'd make the code around
calling do_signal() simpler while preserving the current behaviour...
