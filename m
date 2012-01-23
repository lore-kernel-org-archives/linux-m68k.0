From: Michael Schmitz <schmitzmic@googlemail.com>
Subject: Re: Linux on Amiga A600, a success story (in progress, with possible patch)
Date: Tue, 24 Jan 2012 12:04:21 +1300
Message-ID: <CAOmrzkJO8hiMJhN5eanXpjjGnaLYrCDAbekX2=FY394+Vt1UHw@mail.gmail.com>
References: <4F1C577D.3040908@sigon.net>
	<CAMuHMdWFR-BQtwkh9=hgQEp4L+XZnDy4scm03TvmGbwrk=Jd5w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pz0-f46.google.com ([209.85.210.46]:52749 "EHLO
	mail-pz0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754020Ab2AWXEW (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 23 Jan 2012 18:04:22 -0500
Received: by dake40 with SMTP id e40so1895177dak.19
        for <linux-m68k@vger.kernel.org>; Mon, 23 Jan 2012 15:04:21 -0800 (PST)
In-Reply-To: <CAMuHMdWFR-BQtwkh9=hgQEp4L+XZnDy4scm03TvmGbwrk=Jd5w@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Patrick Bottelberger <patrick.bottelberger@sigon.net>, linux-m68k@vger.kernel.org

Hi,

>> the debian system and mknod'ing all needed device-files everything seems
>> to be running fine, with the exception of the RTC (i think that's my
>> fault, something i missed while configuring my kernel, is there
>> something needed besides of genrtc to get the A600/A603-clock working?)
>
> Do you know what clock chip is used on the A603? I had a quick look on the
> net, but couldn't find it (I did see a picture of an A604 with a partially
> covered chip that said M6242). If you can't find it, I can ask Jens.

Might be the wrong /dev/rtc device - it should be major 254 minor 0
not major 10 minor 135 (or whatever).

Cheers,

  Michael
