From: Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: atafb and X/fbdev
Date: Sun, 08 Jul 2012 16:38:39 +1200
Message-ID: <4FF90ECF.2090001@gmail.com>
References: <Pine.BSM.4.64L.1207062301330.12225@herc.mirbsd.org> <4FF7AFD7.8000005@biophys.uni-duesseldorf.de> <Pine.BSM.4.64L.1207070751590.7146@herc.mirbsd.org> <CAMuHMdW1Gigu0642GuXHGyOmghDLkndboTKyGt=z=zDgWcNWFw@mail.gmail.com> <Pine.BSM.4.64L.1207070912580.7146@herc.mirbsd.org> <Pine.BSM.4.64L.1207071537230.13285@herc.mirbsd.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:51272 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750742Ab2GHEir (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 8 Jul 2012 00:38:47 -0400
Received: by pbbrp8 with SMTP id rp8so17198538pbb.19
        for <linux-m68k@vger.kernel.org>; Sat, 07 Jul 2012 21:38:46 -0700 (PDT)
In-Reply-To: <Pine.BSM.4.64L.1207071537230.13285@herc.mirbsd.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Thorsten Glaser <tg@mirbsd.de>
Cc: linux-m68k@vger.kernel.org

Thorsten Glaser wrote:
>>> The 16-bpp Falcon mode should be chunky and work.
>>>       
>> That's video=atafb:falh16 ?
>>     
>
> No, that's a 4bpp mode.
>
> From my reading of drivers/video/atafb.c there are
> no 16bpp modes?
>   
There is a 16 bpp mode - look for 'hicolor' in the source. From my 
understanding,
it has all been wired up right (to be honest, I did only rewrite the 
fbcon interface
for 2.6 onwards, and touched as little of the business end of the driver 
as possible).

The driver detects hicolor mode from bit 8 of f_shift:

        else if (hw->f_shift & 0x100)   /* hicolor */
                var->bits_per_pixel = 16;  

and uses the generic packed pixel cfb interface to draw characters to 
the screen in this case.

Thanks for the hint, Geert - I would have claimed there's only mono and 
interleaved planes otherwise. 
Nothing like a trip down memory lane - I had totally forgotten that I 
wrote Mac fbcon drivers back in the days.

I feel I should give the hicolor mode a test to see whether it does 
actually work after all this time.

Cheers,

  Michael
