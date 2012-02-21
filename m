From: Patrick Bottelberger <tjelfe@sigon.net>
Subject: Re: Linux on Amiga A600, a success story (in progress, with possible patch)
Date: Tue, 21 Feb 2012 11:55:38 +0100
Message-ID: <b761065a4748c565e1c31ea71cb21c16@localhost>
References: <4F1C577D.3040908@sigon.net> <CAMuHMdWFR-BQtwkh9=hgQEp4L+XZnDy4scm03TvmGbwrk=Jd5w@mail.gmail.com> <4F1EEBEF.4000400@sigon.net> <CAMuHMdWbQau3kS2-svDS705_PS4-0adCCvLvT=Af6VKKZfr+gA@mail.gmail.com> <4F2053C9.3090201@sigon.net> <97e6cf2ca60c81874f6ea82e8b4af158@localhost> <4F3181C6.8080805@sigon.net> <loom.20120207T231019-351@post.gmane.org> <4F42BD3E.3060901@sigon.net> <m2obstgnsu.fsf@igel.home> <4F42CD74.5010409@sigon.net> <m2fwe5glc7.fsf@igel.home>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from s15429932.onlinehome-server.info ([87.106.248.152]:55058 "EHLO
	ws1.rootfuchs.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754623Ab2BUKzn (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 21 Feb 2012 05:55:43 -0500
In-Reply-To: <m2fwe5glc7.fsf@igel.home>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: Patrick Bottelberger <patrick.bottelberger@sigon.net>, Thorsten Glaser <tg@debian.org>, linux-m68k@vger.kernel.org


Hi Andreas,

On Tue, 21 Feb 2012 00:02:16 +0100, Andreas Schwab <schwab@linux-m68k.org>
wrote:
> Patrick Bottelberger <patrick.bottelberger@sigon.net> writes:
> 
>> (e.g. jumping between 02:20, 12:20 and 22:20 in a few seconds)
> 
> That looks like a real hardware problem.
> 

I am absolutely sure that it's not a hardware problem, as netbsd has no
problems reading the hardware clock.

>> But i don't think the kernel relies on floating point registers for
>> getting the time from the rtc, or is it?
> 
> The kernel does not use floating point at all.
> 

Ok, thanks for clarifying.


Regards,
Patrick
