From: Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: [PATCH] m68k: don't comment out syscalls used by glibc
Date: Fri, 11 Nov 2011 09:45:34 +0100
Message-ID: <m3ehxfavyp.fsf@hase.home>
References: <m2d3dbd1kg.fsf@igel.home>
	<CAMuHMdVkmZs60OrQRYVGbjX8Wh86Op1kRb2gcvphUDGA5s-7Cg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.10]:58054 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757135Ab1KKIph (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 11 Nov 2011 03:45:37 -0500
In-Reply-To: <CAMuHMdVkmZs60OrQRYVGbjX8Wh86Op1kRb2gcvphUDGA5s-7Cg@mail.gmail.com>
	(Geert Uytterhoeven's message of "Thu, 10 Nov 2011 21:28:13 +0100")
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>

Geert Uytterhoeven <geert@linux-m68k.org> writes:

> Hi Andreas,
>
> On Tue, Nov 1, 2011 at 21:34, Andreas Schwab <schwab@linux-m68k.org> wrote:
>> Define again the syscalls that are used by glibc so that it is possible to
>> compile a feature-complete glibc with the newest kernel headers.
>
> I'm a bit puzzled by this. What exactly is your objective? To build a glibc that
> runs on any possible kernel version ever released?

When building glibc it needs to know these numbers.  Otherwise only
stubs are generated that never try to use them.

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
"And now for something completely different."
