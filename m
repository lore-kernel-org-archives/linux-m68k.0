From: Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: Add private syscalls to support NPTL
Date: Tue, 18 Aug 2009 20:18:55 +0200
Message-ID: <m2tz05oui8.fsf@igel.home>
References: <4A89D037.7090807@codesourcery.com> <m27hx2um3t.fsf@igel.home>
	<4A8A54F9.3080100@codesourcery.com> <m3d46tpmue.fsf@hase.home>
	<4A8A6CA2.4040806@codesourcery.com>
	<10f740e80908180222p4d95b19bp3069e037a6bc590e@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.9]:32852 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751868AbZHRSS6 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 18 Aug 2009 14:18:58 -0400
In-Reply-To: <10f740e80908180222p4d95b19bp3069e037a6bc590e@mail.gmail.com>
	(Geert Uytterhoeven's message of "Tue, 18 Aug 2009 11:22:41 +0200")
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Maxim Kuvyrkov <maxim@codesourcery.com>, linux-m68k@vger.kernel.org

Geert Uytterhoeven <geert@linux-m68k.org> writes:

> Probably I should wire those up first (for 2.6.31, if still possible).
>
> Next I should reserve 333..336 for you?

We could even (re-)use some of the smaller numbers that were never
implemented, allowing the use of moveq.

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
"And now for something completely different."
