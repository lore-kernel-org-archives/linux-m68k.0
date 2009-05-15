From: Lance Tagliapietra <lancetag@Luminet.net>
Subject: Re: m68k 2.6.26-1 vs 2.4.30 comparison
Date: Thu, 14 May 2009 21:37:45 -0500
Message-ID: <20090515023743.GA1647@luminet.net>
References: <20090503072811.GB3179@luminet.net> <10f740e80905030408p38f87e09ueabc45ef98d4a88f@mail.gmail.com>
Reply-To: lancetag@luminet.net
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from spamtitan.hbci.com ([206.230.105.6]:53516 "EHLO
	spamtitan.hbci.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754498AbZEOCdU (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 14 May 2009 22:33:20 -0400
Content-Disposition: inline
In-Reply-To: <10f740e80905030408p38f87e09ueabc45ef98d4a88f@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert.uytterhoeven@gmail.com>
Cc: linux-m68k@vger.kernel.org

On Sun, May 03, 2009 at 01:08:06PM +0200, Geert Uytterhoeven wrote:
> > d). The real time clock came up on the worng month, going from 2.4.30 to 2.6.26 (or 28),
> > March vs April, in this case.
> 
> That's an interesting one...
> 
> In 2.4.30, you have both a2000_gettod() (for boot time setting), which does:
> 
>     *monp  = tod_2000.month1      * 10 + tod_2000.month2;
> 
> and amiga_hwclk() (for /dev/rtc), which does:
> 
>     t->tm_mon  = tod_2000.month1      * 10 + tod_2000.month2 - 1;
> 
> In 2.6.29, you only have a2000_hwclk(), which does
> 
>     t->tm_mon  = tod_2000.month1      * 10 + tod_2000.month2 - 1;
> 
> The data returned by a2000_gettod() is converted to seconds using mktime(),
> which assumes months are in the range 1..12.
> 
> amiga_hwclk() and a2000_hwclk() both use struct rtc_time. This should
> be similar to
> struct tm in <time.h>, where the months are in the range 0..11.
> Both rtc_proc_output()/gen_rtc_proc_output() (2.4.30) and
> rtc_proc_show() (2.6.29) do
> print tm.tm_mon + 1 to make them be in the range 1..12.
> 
> So at first sight, I don't see where the bug is...
> 
> What does `hwlock -ur` say, on both 2.4.30 and 2.6.29?

I'm afraid the result isn't going to be helpful just yet (assuming you meant hwclock, not hwlock):

hwclock -ur
Cannot access the Hardware Clock via any known method.
Use the --debug option to see the details of our search for an access method.

hwclock --debug
hwclock: Open of /dev/rtc failed, errno=19: No such device.
Cannot access the Hardware Clock via any known method.
hwclock from util-linux-2.12r
No usable clock interface found.

Now, there is a /dev/rtc device of type 10 135.  Interestingly, though is that the 
kernel is looking for an "rtc0" device based on the kernel config.  So I'll make
that change to the kernel config and re-build and see what I get -- or would it 
be a better approach to add a /dev/rtc0 c 10 135?

Thanks,

--Lance
