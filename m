From: Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: atafb and X/fbdev
Date: Tue, 17 Jul 2012 14:59:41 +1200
Message-ID: <CAOmrzkKSv_JVqnc210e2ZH8iyHj8BQoKaRo9HBj6A6Qnd4ihEA@mail.gmail.com>
References: <Pine.BSM.4.64L.1207062301330.12225@herc.mirbsd.org>
	<4FF7AFD7.8000005@biophys.uni-duesseldorf.de>
	<Pine.BSM.4.64L.1207070751590.7146@herc.mirbsd.org>
	<CAMuHMdW1Gigu0642GuXHGyOmghDLkndboTKyGt=z=zDgWcNWFw@mail.gmail.com>
	<Pine.BSM.4.64L.1207070912580.7146@herc.mirbsd.org>
	<Pine.BSM.4.64L.1207071537230.13285@herc.mirbsd.org>
	<4FF90ECF.2090001@gmail.com>
	<CAOmrzk+uSw+o1rzoZP5Xz5usFwYm1Fc8-0-dJRq+uh6dV4La8Q@mail.gmail.com>
	<5000EAB2.4080900@gmail.com>
	<CAMuHMdXG+TiuGi_chhx9dVJH+r4+4Lbj8BJDUCY0d_DH9zFPvA@mail.gmail.com>
	<50026D5E.9060400@gmail.com>
	<CAMuHMdXL6VY5e2YWBzUUqg2U6D1Reeyb8a8nFNQBiO4qVLAx+w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-gg0-f174.google.com ([209.85.161.174]:49721 "EHLO
	mail-gg0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753333Ab2GQC7m (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 16 Jul 2012 22:59:42 -0400
Received: by gglu4 with SMTP id u4so5727054ggl.19
        for <linux-m68k@vger.kernel.org>; Mon, 16 Jul 2012 19:59:42 -0700 (PDT)
In-Reply-To: <CAMuHMdXL6VY5e2YWBzUUqg2U6D1Reeyb8a8nFNQBiO4qVLAx+w@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Thorsten Glaser <tg@mirbsd.de>, linux-m68k@vger.kernel.org, debian m68k <debian-68k@lists.debian.org>

Geert,

>>> For 640x480 that's true.
>>>
>>> For 320x240, it should work. I definitely used a hicolor mode on ARAnyM
>>> when
>>> atafb was revived.
>>
>> Using what atafb option? Or did you use fbset to switch?
>
> I used fbset. But it should also be possible using the kernel command line.

Try as I may, I do only get atafb to parse the first option. Neither
the monitorcap nor resolution options were parsed correctly.

I"ll give fbset a shot though.

Cheers,

  Michael
