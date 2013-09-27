From: Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: [PATCH 0/2] Experimental Amiga Zorro ESP driver
Date: Fri, 27 Sep 2013 21:17:47 +1200
Message-ID: <d5205dbffc532dab435d8e39dad7e496@gmail.com>
References: <1370552199-15048-1-git-send-email-schmitz@debian.org> <520D4AE3.6040801@aalto.fi> <520E76FC.9040803@aalto.fi> <11425cb5ec432e2fbb7b675052e8b33d@gmail.com> <520F5F81.7090409@aalto.fi> <52102BEC.7000006@gmail.com> <CAMuHMdV9vP-Qg2my5fyT+pa_WcDfZAPx5T1-4kXP8eD1oL8Kog@mail.gmail.com> <52108CAF.1010700@gmail.com> <CAMuHMdWqNBjHKiDojPdjzuOV65QXzjeMX5VbtUvgU7VTP4iYFg@mail.gmail.com> <5211DBD8.5090801@gmail.com> <5212840A.4080300@aalto.fi> <1ef2d87e4efecb2d8c8c2eaf8ac5fd51@gmail.com> <52133E48.50501@aalto.fi> <CAOmrzkKtB4OpnFNFh9PR4V8bc3ExfFXpwtkhGj0veQ4w-d=cqA@mail.gmail.com> <522F8B67.2080603@aalto.fi> <CAOmrzkKP4YcvnHcrtucMvS9WSaeg+6-qnobOWN6hBK=wkUHemg@mail.gmail.com> <52306B53.6030306@aalto.fi> <e063fd84a10c9413e4515c80ea4a139f@gmail.com> <52443EEF.90309@aalto.fi>
Mime-Version: 1.0 (Apple Message framework v624)
Content-Type: text/plain; charset=US-ASCII; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pd0-f180.google.com ([209.85.192.180]:47722 "EHLO
	mail-pd0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751905Ab3I0JSL (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 27 Sep 2013 05:18:11 -0400
Received: by mail-pd0-f180.google.com with SMTP id y10so2333295pdj.39
        for <linux-m68k@vger.kernel.org>; Fri, 27 Sep 2013 02:18:10 -0700 (PDT)
In-Reply-To: <52443EEF.90309@aalto.fi>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Tuomas Vainikka <tuomas.vainikka@aalto.fi>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>

Hello Tuomas,

>>

> Go ahead. I assume you can now open the attachments? If you could just 
> make one small modification; all controllers

You bet - though sz compressed .deb packages would still defeat me :-) 
 From here on it's just roadblocks like git rebase as usual.

By rightrs someone with access to the actual hardware should maintain 
the driver in the long term though.

> but Oktagon use a 40 MHz clock. The zorro_esp driver versions I've 
> been spamming to this list all have carried a bad 20 MHz clock setting 
> for the Blizzard 2060 board.

I'll do that, sure.

> I've actually been able to compile the driver into the kernel and use 
> it for root fs (on my Blizzard 1230-IV).

That should count for a successful acid test. Thanks so much for 
completing and debugging my rather rough draft!

Cheers,

	Michael
