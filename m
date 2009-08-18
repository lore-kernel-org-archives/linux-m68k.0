From: Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: Add private syscalls to support NPTL
Date: Tue, 18 Aug 2009 10:06:49 +0200
Message-ID: <m3d46tpmue.fsf@hase.home>
References: <4A89D037.7090807@codesourcery.com> <m27hx2um3t.fsf@igel.home>
	<4A8A54F9.3080100@codesourcery.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mx2.redhat.com ([66.187.237.31]:54447 "EHLO mx2.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750853AbZHRIK7 (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Tue, 18 Aug 2009 04:10:59 -0400
In-Reply-To: <4A8A54F9.3080100@codesourcery.com> (Maxim Kuvyrkov's message of
	"Tue, 18 Aug 2009 11:15:05 +0400")
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Maxim Kuvyrkov <maxim@codesourcery.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@vger.kernel.org

Maxim Kuvyrkov <maxim@codesourcery.com> writes:

> The need would be (a) use numbers that are very unlikely to used for
> normal syscalls,

I don't understand.  These are normal syscalls.

> and (b) using -1..-4 for the syscall numbers works out quite nicely
> for the code in entry.S.  It adds just a couple of instructions to the
> execution path.

Those additional instructions are totally unnecessary.

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
"And now for something completely different."
