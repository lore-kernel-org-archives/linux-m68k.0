From: Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: [PATCH] m68k: fix assembler constraint to prevent overeager gcc optimisation
Date: Sun, 22 Jan 2012 13:42:21 +0100
Message-ID: <m21uqrdi36.fsf@igel.home>
References: <4F079F6B.8080502@fairlite.co.uk> <4F07EA66.6020603@gmail.com>
	<4F08E748.4020305@fairlite.co.uk> <4F0917E9.9090600@gmail.com>
	<4F0964EC.2080505@fairlite.co.uk>
	<CAOmrzkLH18VCY0dzJPM14dn5ccWmSBkiPzq8EFqnCDHiM3bECQ@mail.gmail.com>
	<4F0A2DD0.4000707@fairlite.co.uk>
	<CAOmrzk+P3mPXu_Q_KxgEk_jx-JNhXY4ydrKoGM+43LpD5icTHw@mail.gmail.com>
	<4F0A3CDE.7070308@fairlite.co.uk> <4F0A421C.9000600@fairlite.co.uk>
	<m2wr91yxa4.fsf@igel.home>
	<CAMuHMdXjWyEEOS4fJEaY1dg_cZWLyTps85jaQzsvbO_44-UhqA@mail.gmail.com>
	<m2obudynjs.fsf_-_@igel.home>
	<CAMuHMdVd7opSitKs82Q6N5Yi6eGBvhOsE9USVFiE81dXmGAHTg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.9]:41577 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751605Ab2AVMm2 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 22 Jan 2012 07:42:28 -0500
In-Reply-To: <CAMuHMdVd7opSitKs82Q6N5Yi6eGBvhOsE9USVFiE81dXmGAHTg@mail.gmail.com>
	(Geert Uytterhoeven's message of "Sun, 22 Jan 2012 11:15:57 +0100")
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Tuomas Vainikka <tuomas.vainikka@aalto.fi>, Alan Hourihane <alanh@fairlite.co.uk>, Michael Schmitz <schmitzmic@googlemail.com>, Linux/m68k <linux-m68k@vger.kernel.org>, Greg Ungerer <gerg@snapgear.com>

Geert Uytterhoeven <geert@linux-m68k.org> writes:

> I take it (but I prefer to ask, asm constraints always make me nervous)
> the "memory" is no longer needed with your fix?

No, it isn't.

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
"And now for something completely different."
