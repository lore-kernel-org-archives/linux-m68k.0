From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: [PATCH] reinstate mac rtc
Date: Sun, 19 Oct 2008 22:52:01 +1100 (EST)
Message-ID: <Pine.LNX.4.64.0810192223430.31976@loopy.telegraphics.com.au>
References: <A4BCBF08-9D05-11DD-9A2B-00050249ADE1@kaffe.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from loopy.telegraphics.com.au ([202.45.126.152]:38892 "EHLO
	loopy.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750878AbYJSLwE (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 19 Oct 2008 07:52:04 -0400
In-Reply-To: <A4BCBF08-9D05-11DD-9A2B-00050249ADE1@kaffe.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Riccardo <riccardo@kaffe.org>
Cc: Brad Boyer <flar@allandria.com>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@vger.kernel.org



On Sat, 18 Oct 2008, Riccardo wrote:

> I don't know "how", but with 2.2 kernels I always had a correct date at 
> boot without any tricks. It is true though that with high CPU load we 
> had clockskew and that we didn't save back the date and hourtime to the 
> clock, thus any clock setting needed to be done from the mac side. A 
> compromoise, but better than the current situation.

AFAICT the currect situation is the same: RTC doesn't work with debian 
sarge 2.2.25-mac kernel on my Q950 (nor with the current kernel).

> Of course, in a perfect world, you could use EMILE and not install macos 
> at all (also saving space on those old SCSI disks) and consequently 
> everything needs to be supported inside linux.

Yes, the RTC is important.

Our method of accessing the RTC on the Q950 is the same as NetBSD's. So it 
really looks like no-one knows how to make it work. All we know is that 
the same code does work on the Mac II etc.

You could try running the "hwclock" command on your Q950. If that works 
for you, it might give me a lead.

Finn

> RIccardo
> 
