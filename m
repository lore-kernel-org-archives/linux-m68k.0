From: Michael Schmitz <schmitzmic@googlemail.com>
Subject: Re: atarimouse (was: Re: [git pull] m68k SLUB fix for 2.6.39)
Date: Thu, 5 May 2011 16:21:57 +1200
Message-ID: <BANLkTimLx0PkUUhL+HY1vDoL=SB5QZPweQ@mail.gmail.com>
References: <BANLkTinjTOGR3-ONZTxqCQFJdq7_TsKOAA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pz0-f46.google.com ([209.85.210.46]:33635 "EHLO
	mail-pz0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750803Ab1EEEV5 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 5 May 2011 00:21:57 -0400
Received: by pzk9 with SMTP id 9so798452pzk.19
        for <linux-m68k@vger.kernel.org>; Wed, 04 May 2011 21:21:57 -0700 (PDT)
In-Reply-To: <BANLkTinjTOGR3-ONZTxqCQFJdq7_TsKOAA@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>

Hi Geert,

>> Falcon CT60, 14MB/512MB no swap:
>>
>> Out of memory: Kill process 8644 (malloctest) score 967 or sacrifice child
>> Killed process 8644 (malloctest) total-vm:512244kB, anon-rss:510088kB,
>> file-rss:284kB
>
> Ah, real hardware ;-)

Slow but still works :-)

> Any chance you can try the mouse (e.g. with gpm), and check if
> http://permalink.gmane.org/gmane.linux.ports.m68k/1867 is needed, so we know
> if this is an ARAnyM issue or not?

If I can find a version of gpm that works, sure! Due to my ongoing
battle with the SCSI driver the 2.6 test system is really minimal ...

Cheers,

  Michael
