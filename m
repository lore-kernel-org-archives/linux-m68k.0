From: Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: [PATCH] m68k: Increase initial mapping to 16MB if possible
Date: Sat, 28 Jun 2014 16:36:19 +0200
Message-ID: <87bntddrto.fsf@igel.home>
References: <87ppk7m3db.fsf@igel.home>
	<loom.20140429T121132-254@post.gmane.org> <8738gwxw53.fsf@igel.home>
	<CAMuHMdU50FnSD0K896b7aJN-RPXWpUoW46oiOFy-9AsYP2LGGQ@mail.gmail.com>
	<87sioww0gb.fsf@igel.home> <5360A881.7040107@gmail.com>
	<alpine.DEB.2.02.1405251846540.6045@ayla.of.borg>
	<87k381dwwj.fsf@igel.home>
	<CAMuHMdXseK3HydzVyQdSFQg93bOa1Uo29mg=EEHpT_9A3A1+pQ@mail.gmail.com>
	<87fvipdtz8.fsf@igel.home>
	<CAMuHMdV7QTMN+2C4OOf_zyKQ43oXec8g8T9g2qE+jNNU2HFW4w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.10]:40499 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752628AbaF1OgX (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sat, 28 Jun 2014 10:36:23 -0400
In-Reply-To: <CAMuHMdV7QTMN+2C4OOf_zyKQ43oXec8g8T9g2qE+jNNU2HFW4w@mail.gmail.com>
	(Geert Uytterhoeven's message of "Sat, 28 Jun 2014 16:29:07 +0200")
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Michael Schmitz <schmitzmic@gmail.com>, Thorsten Glaser <tg@debian.org>, Linux/m68k <linux-m68k@vger.kernel.org>

Geert Uytterhoeven <geert@linux-m68k.org> writes:

> In what way doesn't it work?

[    0.000000] bootmem alloc of 4096 bytes failed!

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
"And now for something completely different."
