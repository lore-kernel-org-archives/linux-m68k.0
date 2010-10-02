From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: m68k, signals and single-stepping
Date: Sat, 2 Oct 2010 13:44:36 +1000 (EST)
Message-ID: <alpine.OSX.2.00.1010021325070.289@localhost>
References: <20100930055823.GK19804@ZenIV.linux.org.uk> <AANLkTimigeCBQdh1CxsxojKNGXWcoLQg10weE8w1r5v5@mail.gmail.com> <m362xn63qc.fsf@hase.home> <20100930120504.GM19804@ZenIV.linux.org.uk> <m3lj6j4dh8.fsf@hase.home>
 <20100930165041.GN19804@ZenIV.linux.org.uk>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from www.telegraphics.com.au ([204.15.192.19]:33657 "EHLO
	mail.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751318Ab0JBDos (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 1 Oct 2010 23:44:48 -0400
In-Reply-To: <20100930165041.GN19804@ZenIV.linux.org.uk>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Al Viro <viro@ZenIV.linux.org.uk>
Cc: Andreas Schwab <schwab@linux-m68k.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Linux/m68k <linux-m68k@vger.kernel.org>


On Thu, 30 Sep 2010, Al Viro wrote:

> On Thu, Sep 30, 2010 at 02:34:11PM +0200, Andreas Schwab wrote:
> 
> > > Um...  What's wrong with doing that from trap_c()?
> > 
> > IIRC that was the only way to make gdb work correctly wrt. single 
> > stepping over system calls and into signal handlers.  If anyone wants 
> > to test it with today's kernel on real hardware, please go ahead.
> 
> Ouch...  Resurrecting that 840av box will be interesting - most likely a 
> dead battery, but... ;-/

My 840av has a weird issue where it powers up and lights the front LED but 
doesn't POST, chime, etc. Eventually (after waiting 2 minutes? 15 
minutes... it varies) I can then reset it with ctrl-apple-power key and it 
comes good. New battery didn't affect this. I've been considering swapping 
in a PSU from a pmac 8500 but maybe it just needs some new capacitors.

> And yes, I certainly understand why qemu testing is not sufficient for 
> that kind of stuff - subtle enough to make the odds of stepping on qemu 
> bugs...

I can test patches for you on a quadra 700 (MC68040) that I have set up at 
the moment. My time is in demand at present, but if you've tested them on 
aranym, and you can tell me what to look for, it shouldn't take too long.

What are the userland pre-requisites for this kind of testing? I have 
etch-m68k handy, but it is getting long in the tooth (that is, it 
pre-dates the siginfo patches that Maxim wrote, all of the ptrace work 
that Andreas has done recently, and probably a bunch of other related 
stuff that I didn't notice).

Finn

> 
> Oh, well.  Anyway, the obvious ones I've got are:
> 	* setup_frame/setup_rt_frame should report failure, so that
> handle_signal() wouldn't block signals in that case (losing the original
> mask, since it's not stored anywhere in that case)
> 	* notify_resume isn't handled at all
> 	* sigsuspend would be better off with ERESTARTNOHAND scheme.
> 
> FWIW, I wonder if it would be better to have handle_signal() call
> send_sig() and clear regs.SR.T1 and forget about checking return
> value of do_signal(); do_delayed_trace is still needed, since currently
> there are two places that can reach it, but it'd make the code around
> calling do_signal() simpler while preserving the current behaviour...
> --
> To unsubscribe from this list: send the line "unsubscribe linux-m68k" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
