From: Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: m68k 2.6.26-1 vs 2.4.30 comparison
Date: Fri, 15 May 2009 11:31:12 +0200
Message-ID: <m2octulnkv.fsf@igel.home>
References: <20090503072811.GB3179@luminet.net>
	<10f740e80905030408p38f87e09ueabc45ef98d4a88f@mail.gmail.com>
	<20090515023743.GA1647@luminet.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.9]:48489 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757617AbZEOJbO (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 15 May 2009 05:31:14 -0400
In-Reply-To: <20090515023743.GA1647@luminet.net> (Lance Tagliapietra's message
	of "Thu, 14 May 2009 21:37:45 -0500")
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert.uytterhoeven@gmail.com>
Cc: linux-m68k@vger.kernel.org

Lance Tagliapietra <lancetag@Luminet.net> writes:

> Now, there is a /dev/rtc device of type 10 135.  Interestingly, though is that the 
> kernel is looking for an "rtc0" device based on the kernel config.  So I'll make
> that change to the kernel config and re-build and see what I get -- or would it 
> be a better approach to add a /dev/rtc0 c 10 135?

I think you need a c 254 0 device if you use rtc-generic.

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
"And now for something completely different."
