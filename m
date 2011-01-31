From: Michael Schmitz <schmitzmic@googlemail.com>
Subject: Re: Atari console corruption
Date: Mon, 31 Jan 2011 14:46:42 +1300
Message-ID: <4D461482.4010601@gmail.com>
References: <AANLkTimZ4q3mGhy27qVo5gQHMCM2U8jrc_fNPH4YUXev@mail.gmail.com>	<m2fww9dczv.fsf@igel.home>	<Pine.BSM.4.64L.1101301417070.30539@herc.mirbsd.org> <AANLkTikQ26zuDvt6WsHAg_Mn4y3KY+eroSJiKwP8rSWE@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pw0-f46.google.com ([209.85.160.46]:49840 "EHLO
	mail-pw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752764Ab1AaBqx (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 30 Jan 2011 20:46:53 -0500
Received: by pwj3 with SMTP id 3so957267pwj.19
        for <linux-m68k@vger.kernel.org>; Sun, 30 Jan 2011 17:46:52 -0800 (PST)
In-Reply-To: <AANLkTikQ26zuDvt6WsHAg_Mn4y3KY+eroSJiKwP8rSWE@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Thorsten Glaser <tg@mirbsd.de>, linux-m68k@vger.kernel.org

Geert,
>>> $ printf 'abcd\10\10\33[@\n'
>>>      =20
>> Doesn=E2=80=99t happen on the 2.6.32-5+m68k.5-atari I just built. Go=
od news
>> too, video=3Datafb:vga2 is no longer needed either.
>>    =20
>
> Are you sure? Nothing related to that got fixed. I'm still seeing it
> on 2.6.38-rc2.
>  =20
You did include my ST-RAM pool reserve patch, that might have fixed=20
problems with video modes taking more than the minimum amount of RAM fo=
r=20
the screen buffer. Hence no need to stick to vga2.
> You must use an Atari interleaved bitplanes mode to see it, though.
>  =20
There may well have been bugs in that code - I'm sure I have seen=20
incorrect overtype behavior with the sthigh mode myself. Not sure what=20
kernel version that happened on.

I'll give it a test on the emulator.

Cheers,

  Michael
