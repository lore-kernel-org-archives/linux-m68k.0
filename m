Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FC1AC433EF
	for <linux-m68k@archiver.kernel.org>; Tue, 15 Feb 2022 20:49:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233812AbiBOUtm (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 15 Feb 2022 15:49:42 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:37716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231775AbiBOUtm (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 15 Feb 2022 15:49:42 -0500
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C74DBC11
        for <linux-m68k@lists.linux-m68k.org>; Tue, 15 Feb 2022 12:49:31 -0800 (PST)
Received: by mail-pg1-x52b.google.com with SMTP id r76so1366pgr.10
        for <linux-m68k@lists.linux-m68k.org>; Tue, 15 Feb 2022 12:49:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=Oe46YWT8iD5FannbkTa7XC1mJ22kPNsFeaRtLrxbiZE=;
        b=AIK63jGh1yiEgTlhni2YOkSVNrP+4OGV26+/g7IXVUFay3XFzC6McU/GNhTFLSmbmV
         lt452RTtJqJn7G6ls/M0//1Uim684iwM3REvuo84XymOzUdAImGyMFtJoDcI86lSSZyT
         +B3xfHQlsVvWHLcWt+aRfVyNfeH5QLQTGiskz/Iby1HfrLSzdCA1IRZHpghjIP0Bo4x0
         /3Z27Ab3GsFCJaGOZZmmCj8gE0A5msgiUnZGd9/0osDWH52hXWd3PRSSd/E/0pydTwnt
         UBLilbJWATpwN3wbN4JFnAfIqEnvBXMiR+i1ROgWDseJfLBZ9b81e7mE63O6U3wI0Msu
         steQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Oe46YWT8iD5FannbkTa7XC1mJ22kPNsFeaRtLrxbiZE=;
        b=GML2e9jepEAkUrz/pA/571TRciDgqxbkDjFsV0kSgfN7BSq4aYMzrgiMGl6yvgVmeS
         G+PG5UFRPcqGGjirSvUCyyJrH0EliOIGx2nye1ro5lVBq0e8TBm2omH1NMKgaZKaJACG
         9ntByJNDkO/wbwN8ns8E+Jf6iUyiDgCuX4AqMlnLX9bGI0r99aZ8HFDoM2qUtG6c1vt8
         +6pWhOgNw7jRlZwnKxF7/GcRhybPxfE1EVXa5RIXsIDWhK03WPX2CkgTE/F7SgnVyEal
         caeZyvjhvdXuzk740LXCZk7I7NNCAxwgnP5wDi5j6CUht9nNVhwBBqBfAFUruWFKi8z8
         U01w==
X-Gm-Message-State: AOAM531JRJh/GCBLsciiYLd/ySRecQW/YoMN8GgVzYDl2MCrcJWHjj0d
        NepJMtrVUQg5VP6dWTsEFDg=
X-Google-Smtp-Source: ABdhPJzmsA71Hd/QSsyPpu3bs4aMu8e9BQxcCpRMYGW14RHbfefoyN9iBvyx+p7sljQ/IhVPToo2pQ==
X-Received: by 2002:aa7:8190:: with SMTP id g16mr526186pfi.5.1644958170571;
        Tue, 15 Feb 2022 12:49:30 -0800 (PST)
Received: from ?IPV6:2001:df0:0:200c:3049:b141:496e:4dcd? ([2001:df0:0:200c:3049:b141:496e:4dcd])
        by smtp.gmail.com with ESMTPSA id c8sm42802201pfv.57.2022.02.15.12.49.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Feb 2022 12:49:30 -0800 (PST)
Message-ID: <baf33986-d02e-35e8-7381-a30e28089a0a@gmail.com>
Date:   Wed, 16 Feb 2022 09:49:25 +1300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: Wrong colors on ARAnyM
Content-Language: en-US
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Petr Stehlik <pstehlik@sophics.cz>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
References: <CAMuHMdU3ievhXxKR_xi_v3aumnYW7UNUO6qMdhgfyWTyVSsCkQ@mail.gmail.com>
 <b03160b6-7f3b-7765-49ee-c49b7dd2c4e0@gmail.com>
 <CAMuHMdVUX0zJtRAtjCBAa7iEk7MwCjcmSsJdCrSrPcY=6ti=cQ@mail.gmail.com>
 <4b3a0bc8-24a1-2a33-19bb-fbae954c614c@gmail.com>
 <CAMuHMdWkxDMbS4D8wkEPAVgrFnoJzejUkxKCnvA+MA38vS6g9Q@mail.gmail.com>
From:   Michael Schmitz <schmitzmic@gmail.com>
In-Reply-To: <CAMuHMdWkxDMbS4D8wkEPAVgrFnoJzejUkxKCnvA+MA38vS6g9Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Geert,

On 15/02/22 21:11, Geert Uytterhoeven wrote:
>>> Linux' falcon_setcolreg() writes to both the Falcon palette registers
>>> and shifter_tt.color_reg[], so shouldn't the STE color palette contain
>>> the correct colors, too?
>> I don't think it will:
>>
>> The STe palette is set like this:
>>
>>                   shifter_tt.color_reg[regno] =
>>                           (((red & 0xe) >> 1) | ((red & 1) << 3) << 8) |
>>                           (((green & 0xe) >> 1) | ((green & 1) << 3) << 4) |
>>                           ((blue & 0xe) >> 1) | ((blue & 1) << 3);
>>
>> with all colours downshifted by 12 bits already. Rewriting that in the
>> same form as is used in falcon_setcolreg(), i.e. without the downshift:
>>
>>                   shifter_tt.color_reg[regno] =
>>                           (((red & 0xe000) >> 13) | ((red & 1000) >> 9)
>> << 8) |
>>                           (((green & 0xe000) >> 13) | ((green & 1000) >>
>> 9) << 4) |
>>                           ((blue & 0xe000) >> 13) | ((blue & 1000) >> 9);
>>
>>
>> Now look at falcon_setcolreg:
>>
>>                   shifter_tt.color_reg[regno] =
>>                           (((red & 0xe000) >> 13) | ((red & 0x1000) >>
>> 12) << 8) |
>>                           (((green & 0xe000) >> 13) | ((green & 0x1000)
>>   >> 12) << 4) |
>>                           ((blue & 0xe000) >> 13) | ((blue & 0x1000) >> 12);
>>
>>
>> My guess would be the two ought to be identical, assuming the STe
>> palette registers provide backwards hardware compatibility.

The atafb driver references a 'linux/tools/hardware.txt' file for a 
description of the Videl registers. Does anyone still have a copy of 
that file?

Failing that - how would I go about setting specific text colours for 
the console (or draw a test pattern showing the result of the four 
palette entries)?

>>
>> Either way, I think we've got operator precedence wrong here. Shift
>> takes precedence over bitwise and / or? With that precedence, what we
>> have in summary is
>>
>>                   shifter_tt.color_reg[regno] =
>>                           (((red & 0xe000) >> 13) | ((red & 0x1000) >> 4)) |
>>                           (((green & 0xe000) >> 13) | ((green & 0x1000)
>>   >> 8)) |
>>                           ((blue & 0xe000) >> 13) | ((blue & 0x1000) >> 12);
>>
>> Only the blue bits ever entirely seem to end up where they ought to.
>> Testing this hypothesis on ARAnyM (without getting it to boot all the
>> way, for some odd reason likely to do with my current .config) shows
>> that the current code results in the shifter_tt.color_reg entries either
>> 5 or 0x17, 0x113 or 0x117. Adding the missing parentheses results in
>> what I'd expect to see.
> Oops.
>
>> This bug has been present since at least 2.4.30. I do recall seeing this
>> odd blue console before on the Falcon, so it's been a real bug for ages.
> I recall seeing an odd blue console before, too.
> I always dismissed it as some artefact of redrawing the screen in
> a different color mode, like we used to have when switching from a
> 16-color to a monochrome text console (remember the underlined text?).
Can't say I do ... but I don't use the console much at all (keyboard 
beginning to act up).
> Did/do you see it on the real Falcon, too?
Didn't try yet, sorry.
> Initially, I suspected the real Falcon always using the Falcon palette,
> so the bug was never seen on real hardware. But the following comment
> makes me think the colors have always been wrong if bpp == 2:
>
>          /* 2 planes must use STE compatibility mode */
>          par->hw.falcon.ste_mode = bpp == 2;
>
>> Did the operator precedence change sometime since?
> ;-)
>
>>>> As the problem is not 100% reproducible, it looks like a race condition
>>>> in ARAnyM, or a wrong initialization order in atafb.
>>>>
>>>> I'd have to test this on hardware but haven't got fbset on the Falcon. I'll try to locate a binary.
>>> Sorry, you do not need fbset to reproduce this:
>>>
>>>       echo N > /sys/class/graphics/fb0/bits_per_pixel
>> Thanks, that's easy enough to try.
>>
>> Playing around with that command a bit, it does appear that the second
>> switch after selecting depth 2 turns the console blue (regardless of
>> what depth is set in that step). And the second switch after that (even
>> if setting depth 2) restores normal colours. No race that I can see
>> there, it's quite reproducible.
> Yes, it is quite reproducible, but it doesn't always happen every
> second switch. As my Atari DRM driver cannot switch mode on the fly,
> I have to initialize the driver with the mode I want to use. Booting
> with a mode with 2 bitplanes gives me the wrong colors in ca. 20%
> of the cases. So it is random.
Yes, the 'every second switch' does appear to be a little random, too. 
One boot I get that behavior, the next it's behaving as it should.
>> Now what would cause us to miss every other palette update or depth change?
> That's a good question! Why does ARAnyM sometimes decide to use the
> Falcon palette, and sometimes the STe palette, and not only with
> bpp == 2, but also with other color depths?

I guess we'll have to wait and see whether I see that random behaviour 
on the actual hardware.

Looking at getBpp() in the ARAnyM source, I see that ST shifter modes 
are used if bits 10, 8 and 4 in f_shift are clear, but the selection of 
mono vs. STe 2 bpp modes is different from what's used in the kernel driver:

The kernel uses videl.st_shift & 0x300 == 0x100 for STe mode, and == 
0x200 for mono. ARAnyM uses == 0x01 for STe mode in getBpp(). In 
useStPalette(), == 0x100 is used. Both read from the same register 
offset. The kernel never sets 0x01 for st_shift, so the code in getBpp() 
can't work as far as I can see.

>
>> I can confirm that the bug is gone with additional parentheses to apply
>> the shifts (<<8 for red, <<4 for green) to the result of the bit-wise
>> or, not just the right-hand portion of it.
>>
>> Do you want me to prepare a patch, or would you prefer to do it yourself?
> Feel free to send a patch.
> If you don't get to it, I'll make one, eventually.
> Thanks!

My pleasure - checkpatch may grumble a litte over the additonal line 
length but I think we can ignore that!

Cheers,

     Michael

>
> Gr{oetje,eeting}s,
>
>                          Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                  -- Linus Torvalds
