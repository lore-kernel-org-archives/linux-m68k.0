From: Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: [PATCH v3 5/6] m68k: remove duplicate memcpy() implementation
Date: Tue, 24 May 2011 10:06:34 +0200
Message-ID: <m3wrhgwmid.fsf@linux-m68k.org>
References: <1303345491-27888-1-git-send-email-gerg@snapgear.com>
	<1303345491-27888-2-git-send-email-gerg@snapgear.com>
	<1303345491-27888-3-git-send-email-gerg@snapgear.com>
	<1303345491-27888-4-git-send-email-gerg@snapgear.com>
	<1303345491-27888-5-git-send-email-gerg@snapgear.com>
	<1303345491-27888-6-git-send-email-gerg@snapgear.com>
	<BANLkTi=3K=J_UrG5f-sRZDG2oiWcjejkKg@mail.gmail.com>
	<m2sjs542hh.fsf@igel.home>
	<BANLkTinjZMVF5q11dORUMUDPkuYPPO=qJQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.9]:52516 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753632Ab1EXIGh (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 24 May 2011 04:06:37 -0400
In-Reply-To: <BANLkTinjZMVF5q11dORUMUDPkuYPPO=qJQ@mail.gmail.com> (Geert
	Uytterhoeven's message of "Tue, 24 May 2011 09:51:15 +0200")
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: gerg@snapgear.com, linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org, Greg Ungerer <gerg@uclinux.org>

Geert Uytterhoeven <geert@linux-m68k.org> writes:

> What exactly do you mean by "does not support anything less"? It seems it does
> restrict instruction generation to 68000 if you ask for it.

The point is that Linux/m68k requires 68020+, so compiling for 68000
does not make sense (at least back when the gcc configuration was
created).

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
"And now for something completely different."
