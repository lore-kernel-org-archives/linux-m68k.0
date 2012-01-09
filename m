From: Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: Atari TT (next)
Date: Mon, 09 Jan 2012 01:23:22 +0100
Message-ID: <m262gllo5h.fsf@igel.home>
References: <4F079F6B.8080502@fairlite.co.uk> <4F07EA66.6020603@gmail.com>
	<4F08E748.4020305@fairlite.co.uk> <4F0917E9.9090600@gmail.com>
	<4F0964EC.2080505@fairlite.co.uk>
	<CAOmrzkLH18VCY0dzJPM14dn5ccWmSBkiPzq8EFqnCDHiM3bECQ@mail.gmail.com>
	<4F0A2DD0.4000707@fairlite.co.uk>
	<CAOmrzk+P3mPXu_Q_KxgEk_jx-JNhXY4ydrKoGM+43LpD5icTHw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.9]:41313 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754762Ab2AIAX0 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 8 Jan 2012 19:23:26 -0500
In-Reply-To: <CAOmrzk+P3mPXu_Q_KxgEk_jx-JNhXY4ydrKoGM+43LpD5icTHw@mail.gmail.com>
	(Michael Schmitz's message of "Mon, 9 Jan 2012 13:05:38 +1300")
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@googlemail.com>
Cc: Alan Hourihane <alanh@fairlite.co.uk>, Linux/m68k <linux-m68k@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>

Michael Schmitz <schmitzmic@googlemail.com> writes:

> Hi Alan,
>
>> I understand, but the STRAM allocator is broken. It gives out TT-RAM. It
>> should never do that on a TT.
>
> The ST-RAM allocator is used by a number of drivers, some of those
> could actually use TT-RAM fine.

There is no point in calling atari_stram_alloc if you don't need ST-RAM.
Of course, all uses are because they *can't* use TT-RAM.

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
"And now for something completely different."
