From: Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: [PATCH] fix m68k support
Date: Sun, 29 Jan 2012 08:54:51 +0100
Message-ID: <m2sjizgcz8.fsf@linux-m68k.org>
References: <Pine.BSM.4.64L.1201290042440.31292@herc.mirbsd.org>
	<201201290049.q0T0nKsw030673@herc.mirbsd.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.10]:45560 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751418Ab2A2Hyx (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 29 Jan 2012 02:54:53 -0500
In-Reply-To: <201201290049.q0T0nKsw030673@herc.mirbsd.org> (Thorsten Glaser's
	message of "Sat, 29 Jan 2011 17:19:10 +0000")
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Thorsten Glaser <tg@mirbsd.org>
Cc: klibc@zytor.com, linux-m68k@vger.kernel.org

Thorsten Glaser <tg@mirbsd.org> writes:

> +	bcs.l	1f			/* jump if _not_ error */

Why .l?

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
"And now for something completely different."
