From: Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: m68k, signals and single-stepping
Date: Sat, 02 Oct 2010 14:27:44 +0200
Message-ID: <m2eic8ixtr.fsf@igel.home>
References: <20100930055823.GK19804@ZenIV.linux.org.uk>
	<AANLkTimigeCBQdh1CxsxojKNGXWcoLQg10weE8w1r5v5@mail.gmail.com>
	<m362xn63qc.fsf@hase.home> <20100930120504.GM19804@ZenIV.linux.org.uk>
	<m3lj6j4dh8.fsf@hase.home> <20100930165041.GN19804@ZenIV.linux.org.uk>
	<alpine.OSX.2.00.1010021325070.289@localhost>
	<m2iq1kj0sz.fsf@igel.home>
	<alpine.OSX.2.00.1010022149050.289@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.9]:35251 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754589Ab0JBM1q (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sat, 2 Oct 2010 08:27:46 -0400
In-Reply-To: <alpine.OSX.2.00.1010022149050.289@localhost> (Finn Thain's
	message of "Sat, 2 Oct 2010 21:57:42 +1000 (EST)")
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: Al Viro <viro@ZenIV.linux.org.uk>, Geert Uytterhoeven <geert@linux-m68k.org>, Linux/m68k <linux-m68k@vger.kernel.org>

Finn Thain <fthain@telegraphics.com.au> writes:

> That sounds convenient enough. What test failures might one expect for 
> recent kernel, tools and libc?

You'll need to compare the runs before and after any patching.

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
"And now for something completely different."
