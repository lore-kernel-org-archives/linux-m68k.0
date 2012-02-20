From: Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: Linux on Amiga A600, a success story (in progress, with possible patch)
Date: Mon, 20 Feb 2012 23:09:05 +0100
Message-ID: <m2obstgnsu.fsf@igel.home>
References: <4F1C577D.3040908@sigon.net>
	<CAMuHMdWFR-BQtwkh9=hgQEp4L+XZnDy4scm03TvmGbwrk=Jd5w@mail.gmail.com>
	<4F1EEBEF.4000400@sigon.net>
	<CAMuHMdWbQau3kS2-svDS705_PS4-0adCCvLvT=Af6VKKZfr+gA@mail.gmail.com>
	<4F2053C9.3090201@sigon.net>
	<97e6cf2ca60c81874f6ea82e8b4af158@localhost>
	<4F3181C6.8080805@sigon.net> <loom.20120207T231019-351@post.gmane.org>
	<4F42BD3E.3060901@sigon.net>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.10]:48752 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754606Ab2BTWJJ (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 20 Feb 2012 17:09:09 -0500
In-Reply-To: <4F42BD3E.3060901@sigon.net> (Patrick Bottelberger's message of
	"Mon, 20 Feb 2012 22:38:06 +0100")
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Patrick Bottelberger <patrick.bottelberger@sigon.net>
Cc: Thorsten Glaser <tg@debian.org>, linux-m68k@vger.kernel.org

Patrick Bottelberger <patrick.bottelberger@sigon.net> writes:

> Back to my current problems, i don't think the read errors for the RTC
> may be connected to the fact, that i don't have a battery on my A603
> board, or could it?

The kernel rtc code rejects dates before the Unix epoch.  Typically an
rtc that is reset reports a year before 1970.

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
"And now for something completely different."
