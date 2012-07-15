From: Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: atafb and X/fbdev
Date: Sun, 15 Jul 2012 19:12:30 +1200
Message-ID: <50026D5E.9060400@gmail.com>
References: <Pine.BSM.4.64L.1207062301330.12225@herc.mirbsd.org> <4FF7AFD7.8000005@biophys.uni-duesseldorf.de> <Pine.BSM.4.64L.1207070751590.7146@herc.mirbsd.org> <CAMuHMdW1Gigu0642GuXHGyOmghDLkndboTKyGt=z=zDgWcNWFw@mail.gmail.com> <Pine.BSM.4.64L.1207070912580.7146@herc.mirbsd.org> <Pine.BSM.4.64L.1207071537230.13285@herc.mirbsd.org> <4FF90ECF.2090001@gmail.com> <CAOmrzk+uSw+o1rzoZP5Xz5usFwYm1Fc8-0-dJRq+uh6dV4La8Q@mail.gmail.com> <5000EAB2.4080900@gmail.com> <CAMuHMdXG+TiuGi_chhx9dVJH+r4+4Lbj8BJDUCY0d_DH9zFPvA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:37345 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750994Ab2GOHMk (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 15 Jul 2012 03:12:40 -0400
Received: by pbbrp8 with SMTP id rp8so8142224pbb.19
        for <linux-m68k@vger.kernel.org>; Sun, 15 Jul 2012 00:12:40 -0700 (PDT)
In-Reply-To: <CAMuHMdXG+TiuGi_chhx9dVJH+r4+4Lbj8BJDUCY0d_DH9zFPvA@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Thorsten Glaser <tg@mirbsd.de>, linux-m68k@vger.kernel.org, debian m68k <debian-68k@lists.debian.org>

Hi Geert,
>> I've played with the framebuffer timing calculations a bit - 16 bpp appears
>> to require unreasonably
>> low hsync frequency in order to keep within the available video bandwidth of
>> 32 MHz.
> For 640x480 that's true.
>
> For 320x240, it should work. I definitely used a hicolor mode on ARAnyM when
> atafb was revived.
Using what atafb option? Or did you use fbset to switch?

Cheers,

   Michael
