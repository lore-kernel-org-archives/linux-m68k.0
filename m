From: =?UTF-8?Q?Kolbj=C3=B8rn_Barmen?= <linux-m68k@kolla.no>
Subject: Re: [PATCH] amiflop: get rid of sleep_on calls
Date: Sat, 13 Dec 2008 16:20:28 +0100 (CET)
Message-ID: <alpine.LNX.2.00.0812131614360.20992@firda.kolla.no>
References: <1228755578-26069-1-git-send-email-aeb@debian.org> <Pine.LNX.4.64.0812090927580.29640@anakin>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from ufisa.uninett.no ([158.38.152.126]:52038 "EHLO ufisa.uninett.no"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751235AbYLMPsS (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Sat, 13 Dec 2008 10:48:18 -0500
In-Reply-To: <Pine.LNX.4.64.0812090927580.29640@anakin>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Andreas Bombe <aeb@debian.org>, Linux/m68k <linux-m68k@vger.kernel.org>, linux-kernel@vger.kernel.org

On Tue, 9 Dec 2008, Geert Uytterhoeven wrote:

> > The complete_all() with INIT_COMPLETION() was because I'm not sure about
> > whether fd_motor_on() might run concurrently.  Better safe than sorry.
> 
> I'm afraid my Amiga floppy drive doesn't work anymore...
> Any other testers available?

I have some, even enough external ones to chain up to the max of 4
floppy drives (floppy raid anyone? :)). What needs to be tested?
I havent updated kernel for quite some time (still running 2.6.22),
should I now pull sources from git or what?

-- kolla
