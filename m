From: Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: Linux on Amiga A600, a success story (in progress, with possible patch)
Date: Tue, 21 Feb 2012 00:02:16 +0100
Message-ID: <m2fwe5glc7.fsf@igel.home>
References: <4F1C577D.3040908@sigon.net>
	<CAMuHMdWFR-BQtwkh9=hgQEp4L+XZnDy4scm03TvmGbwrk=Jd5w@mail.gmail.com>
	<4F1EEBEF.4000400@sigon.net>
	<CAMuHMdWbQau3kS2-svDS705_PS4-0adCCvLvT=Af6VKKZfr+gA@mail.gmail.com>
	<4F2053C9.3090201@sigon.net>
	<97e6cf2ca60c81874f6ea82e8b4af158@localhost>
	<4F3181C6.8080805@sigon.net> <loom.20120207T231019-351@post.gmane.org>
	<4F42BD3E.3060901@sigon.net> <m2obstgnsu.fsf@igel.home>
	<4F42CD74.5010409@sigon.net>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.10]:60411 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752193Ab2BTXCS (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 20 Feb 2012 18:02:18 -0500
In-Reply-To: <4F42CD74.5010409@sigon.net> (Patrick Bottelberger's message of
	"Mon, 20 Feb 2012 23:47:16 +0100")
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Patrick Bottelberger <patrick.bottelberger@sigon.net>
Cc: Thorsten Glaser <tg@debian.org>, linux-m68k@vger.kernel.org

Patrick Bottelberger <patrick.bottelberger@sigon.net> writes:

> (e.g. jumping between 02:20, 12:20 and 22:20 in a few seconds)

That looks like a real hardware problem.

> But i don't think the kernel relies on floating point registers for
> getting the time from the rtc, or is it?

The kernel does not use floating point at all.

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
"And now for something completely different."
