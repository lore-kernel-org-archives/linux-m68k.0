From: Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: [PATCH] m68k: Increase initial mapping to 16MB if possible
Date: Tue, 08 Jul 2014 00:11:57 +0200
Message-ID: <87k37o4y4y.fsf@igel.home>
References: <87ppk7m3db.fsf@igel.home>
	<loom.20140429T121132-254@post.gmane.org> <8738gwxw53.fsf@igel.home>
	<CAMuHMdU50FnSD0K896b7aJN-RPXWpUoW46oiOFy-9AsYP2LGGQ@mail.gmail.com>
	<87sioww0gb.fsf@igel.home> <5360A881.7040107@gmail.com>
	<alpine.DEB.2.02.1405251846540.6045@ayla.of.borg>
	<87k381dwwj.fsf@igel.home>
	<CAMuHMdXseK3HydzVyQdSFQg93bOa1Uo29mg=EEHpT_9A3A1+pQ@mail.gmail.com>
	<87fvipdtz8.fsf@igel.home>
	<CAMuHMdV7QTMN+2C4OOf_zyKQ43oXec8g8T9g2qE+jNNU2HFW4w@mail.gmail.com>
	<87bntddrto.fsf@igel.home>
	<CAMuHMdXz-ek=go9dV_rcDRKYYve3q80RASFjfJj4nTCe4aMVoQ@mail.gmail.com>
	<877g41dmoa.fsf@igel.home>
	<CAMuHMdWKSWeW61Xh5-e6y7MwsXDQMipeYz4+-CLJWommZkncqQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.10]:57472 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751245AbaGGWMA (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 7 Jul 2014 18:12:00 -0400
In-Reply-To: <CAMuHMdWKSWeW61Xh5-e6y7MwsXDQMipeYz4+-CLJWommZkncqQ@mail.gmail.com>
	(Geert Uytterhoeven's message of "Sun, 6 Jul 2014 11:31:10 +0200")
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Michael Schmitz <schmitzmic@gmail.com>, Thorsten Glaser <tg@debian.org>, Linux/m68k <linux-m68k@vger.kernel.org>

Geert Uytterhoeven <geert@linux-m68k.org> writes:

> Does this (whitespace-damaged) patch help?

Yes, that helps.

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
"And now for something completely different."
