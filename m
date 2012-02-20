From: Patrick Bottelberger <patrick.bottelberger@sigon.net>
Subject: Re: Linux on Amiga A600, a success story (in progress, with possible
 patch)
Date: Mon, 20 Feb 2012 23:47:16 +0100
Message-ID: <4F42CD74.5010409@sigon.net>
References: <4F1C577D.3040908@sigon.net>	<CAMuHMdWFR-BQtwkh9=hgQEp4L+XZnDy4scm03TvmGbwrk=Jd5w@mail.gmail.com>	<4F1EEBEF.4000400@sigon.net>	<CAMuHMdWbQau3kS2-svDS705_PS4-0adCCvLvT=Af6VKKZfr+gA@mail.gmail.com>	<4F2053C9.3090201@sigon.net>	<97e6cf2ca60c81874f6ea82e8b4af158@localhost>	<4F3181C6.8080805@sigon.net> <loom.20120207T231019-351@post.gmane.org>	<4F42BD3E.3060901@sigon.net> <m2obstgnsu.fsf@igel.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from s15429932.onlinehome-server.info ([87.106.248.152]:50969 "EHLO
	ws1.rootfuchs.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754603Ab2BTWrU (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 20 Feb 2012 17:47:20 -0500
In-Reply-To: <m2obstgnsu.fsf@igel.home>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: Thorsten Glaser <tg@debian.org>, linux-m68k@vger.kernel.org

Hi Andreas,

yes, but after setting the clock (e.g. via "date MMDDhhmmccyy" and
"hwclock --systohc" thereafter) the date and time should be correct, as
long as the computer isn't turned off, right? That's not the case with
my A600, the date stays correct, but the time seems to have difficulties
with the first digit (e.g. jumping between 02:20, 12:20 and 22:20 in a
few seconds) and often returns an EINVAL when trying to read the time.
Trying to access the date (through /sys/class/rtc/rtc0/date for example)
curiously always works. Could it be related to the floating point
emulation? But i don't think the kernel relies on floating point
registers for getting the time from the rtc, or is it?


Regards,
Patrick

Andreas Schwab schrieb:
> Patrick Bottelberger <patrick.bottelberger@sigon.net> writes:
>
>   
>> Back to my current problems, i don't think the read errors for the RTC
>> may be connected to the fact, that i don't have a battery on my A603
>> board, or could it?
>>     
>
> The kernel rtc code rejects dates before the Unix epoch.  Typically an
> rtc that is reset reports a year before 1970.
>
> Andreas.
>
>   
