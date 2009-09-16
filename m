From: Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: [PATCH] Fix siginfo._uid bug
Date: Wed, 16 Sep 2009 21:42:33 +0200
Message-ID: <m21vm6k76e.fsf@igel.home>
References: <4AB113C3.1090606@codesourcery.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.10]:44320 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754609AbZIPTmf (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 16 Sep 2009 15:42:35 -0400
In-Reply-To: <4AB113C3.1090606@codesourcery.com> (Maxim Kuvyrkov's message of
	"Wed, 16 Sep 2009 20:35:15 +0400")
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Maxim Kuvyrkov <maxim@codesourcery.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@vger.kernel.org

Maxim Kuvyrkov <maxim@codesourcery.com> writes:

> The bug is rather elegant and has been present in sources for years.

For more than 9 years, to be precise, when 32 bit uids were introduced.

> The problem is that m68k uses a custom siginfo layout due to having
> a 16-bit uid field for 'backward compatibility'.  I.e., siginfo._kill
> fields are:

I've found this interesting thread from 2000:

http://marc.info/?l=linux-kernel&m=94829131029274&w=2

The change went in 2.3.41, and undid the change made in 2.3.39.  It was
reintroduced (for asm-m68k/siginfo.h only and with __kernel_* types; no
other siginfo header used them at that time) in 2.4.0-test12.

Now looking at the glibc side, m68k has always used the generic
linux/bits/siginfo.h (with a single 32bit uid field), until Richard
Sandiford introduced linux/m68k/siginfo.h in October 2006, copying the
(broken) layout from the kernel.

Given that there is no way to keep backward compatibility it might be a
good opportunity to do same cleanup here.  Like going back to the
generic layout.

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
"And now for something completely different."
