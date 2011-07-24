From: Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: memcpy on 68000
Date: Sun, 24 Jul 2011 18:08:11 +0200
Message-ID: <m2pqkzek5w.fsf@igel.home>
References: <caf33f7e8bf8202bde374315ce6c0961.squirrel@www.physik.tu-berlin.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.9]:33787 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750769Ab1GXQIP (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 24 Jul 2011 12:08:15 -0400
In-Reply-To: <caf33f7e8bf8202bde374315ce6c0961.squirrel@www.physik.tu-berlin.de>
	(Matthias Reis's message of "Sun, 24 Jul 2011 15:50:36 +0200")
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Matthias Reis <matthias.reis@physik.tu-berlin.de>
Cc: linux-m68k@vger.kernel.org

"Matthias Reis" <matthias.reis@physik.tu-berlin.de> writes:

> I recently did some work to compile a kernel for MMU less Atari STs.
> However, I 'm having a problem with the memcpy code as it is compiled by
> gcc. When copying from odd addresses, gcc produces memcpy code that tries
> to access odd addresses with move.w, which is not possible on the 68000

You need to use a compiler that is targeted to uclinux, not linux (the
latter assumes 68020+, thus disables strict alignment).

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
"And now for something completely different."
