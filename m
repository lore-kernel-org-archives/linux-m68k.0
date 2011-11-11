From: Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: [PATCH] m68k: don't comment out syscalls used by glibc
Date: Fri, 11 Nov 2011 10:03:26 +0100
Message-ID: <m362irav4x.fsf@hase.home>
References: <m2d3dbd1kg.fsf@igel.home>
	<CAMuHMdVkmZs60OrQRYVGbjX8Wh86Op1kRb2gcvphUDGA5s-7Cg@mail.gmail.com>
	<m3ehxfavyp.fsf@hase.home>
	<CAMuHMdW-6W3+nZsLb2xgNX3aJczo8TpvK3Qh01Q2BwBggcNgwg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.9]:59785 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751757Ab1KKJDf (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 11 Nov 2011 04:03:35 -0500
In-Reply-To: <CAMuHMdW-6W3+nZsLb2xgNX3aJczo8TpvK3Qh01Q2BwBggcNgwg@mail.gmail.com>
	(Geert Uytterhoeven's message of "Fri, 11 Nov 2011 09:53:07 +0100")
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>

Geert Uytterhoeven <geert@linux-m68k.org> writes:

> What's the user experience advantage of glibc knowing about the syscall
> numbers for (never implemented) streams?

It will try to use them, instead of denying their existence.

There is no advantage in removing these definitions.

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
"And now for something completely different."
