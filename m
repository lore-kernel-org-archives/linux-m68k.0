From: Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: [PATCH v3 5/6] m68k: remove duplicate memcpy() implementation
Date: Mon, 23 May 2011 21:54:18 +0200
Message-ID: <m2sjs542hh.fsf@igel.home>
References: <1303345491-27888-1-git-send-email-gerg@snapgear.com>
	<1303345491-27888-2-git-send-email-gerg@snapgear.com>
	<1303345491-27888-3-git-send-email-gerg@snapgear.com>
	<1303345491-27888-4-git-send-email-gerg@snapgear.com>
	<1303345491-27888-5-git-send-email-gerg@snapgear.com>
	<1303345491-27888-6-git-send-email-gerg@snapgear.com>
	<BANLkTi=3K=J_UrG5f-sRZDG2oiWcjejkKg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.10]:40794 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932729Ab1EWTyZ (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 23 May 2011 15:54:25 -0400
In-Reply-To: <BANLkTi=3K=J_UrG5f-sRZDG2oiWcjejkKg@mail.gmail.com> (Geert
	Uytterhoeven's message of "Mon, 23 May 2011 21:26:01 +0200")
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: gerg@snapgear.com, linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org, Greg Ungerer <gerg@uclinux.org>

Geert Uytterhoeven <geert@linux-m68k.org> writes:

> FWIW, my m68k-linux-gnu-gcc (4.1.2 20061115 (prerelease)) always defines
> __mc68000__ and __mc68020__, even when specifying -m68000 on the command
> line.

m68k-linux has always defined __mc68020__ unconditionally, because it
does not support anything less.

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
"And now for something completely different."
