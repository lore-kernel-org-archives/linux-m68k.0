Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84D8DC433EF
	for <linux-m68k@archiver.kernel.org>; Mon, 14 Feb 2022 20:51:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229679AbiBNUv0 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 14 Feb 2022 15:51:26 -0500
Received: from gmail-smtp-in.l.google.com ([23.128.96.19]:44340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229616AbiBNUvX (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 14 Feb 2022 15:51:23 -0500
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E0E0177E66
        for <linux-m68k@lists.linux-m68k.org>; Mon, 14 Feb 2022 12:50:56 -0800 (PST)
Received: by mail-pl1-x632.google.com with SMTP id w1so11473684plb.6
        for <linux-m68k@lists.linux-m68k.org>; Mon, 14 Feb 2022 12:50:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=VaZJc96sp2BM3s4rTJQ5pRWPoOVf7lo6WuX32JDOHuk=;
        b=INTHkTleM1QFds9vgtwS5l93bhCRJsCr/OzTMRK+VpmdTrVVuDNzUN4mvzpYGCY4v/
         yt0tTcSQqD9TLL96aXHt0rzFF+ySH/Y54iR91phaET+2Hp/E+O3WARUQVySC0xJQAtFQ
         P1+Bb0Nsp0mTLoey7xQDzPbECc/eqMskh/1KUbTngu9tcgbvzYX+AyOm3bTJttpRYjiU
         is/dzjOQkV6KkNjmWHTmTuZ6iuuCW2f3CuLLNqV/Kv1dfnXVKf5vZ8bOR1rHy3xU9M+z
         r0zi/+Cbb9SXWiwsPoWrd2qt/MzHaDo7BgtvLWxaoUpOlUJKqeO2Q5XAn85a3YlQm+ti
         vCZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=VaZJc96sp2BM3s4rTJQ5pRWPoOVf7lo6WuX32JDOHuk=;
        b=HsRdjJSn3YC+vE7ASP2IGbH5MBhilH8fo+/Fpo1vuWFWmnhzofYEoO337gX5KtJg20
         WO9mkLioApMKFyVuXnfdQbqn6jlfNXRoZN7oes0tls0aKQCtXgjNIKzkd8dt1RKjcEqx
         ewz4XAyfuuGoaJ1Hdf+JSbSTYRtPScba8BwODctwkJb+QVLQOcFF62VXH3MRxTRA+7rX
         Fsf0AKkrUAynV08xNQfzlnSLCuB1QvrruphpSS4lpWAOXp6LT0xdk4Bc3x80RFDDthjF
         yawT2r6d4N38S9lZq13XRQc9ge4C5hjzaj8CU4Yg5XzXO7ZtsMhocViv6Ylwdb0DKa+V
         hW9g==
X-Gm-Message-State: AOAM5332PZ9suSU3v2+67Ob0wrDFF5nsesa3zkzW3ohl5Khbb4x/1+LF
        nNGHz8KwY0u6imd1IySnoeM=
X-Google-Smtp-Source: ABdhPJy4Hgxif7RqzWzBcjvr92JSy2sl/oENjTylfc2WXC6rtgnTfODcoI1PyrN/amjCVdDzURmL4g==
X-Received: by 2002:a17:902:c406:: with SMTP id k6mr642309plk.156.1644871809546;
        Mon, 14 Feb 2022 12:50:09 -0800 (PST)
Received: from ?IPV6:2001:df0:0:200c:f5e5:b852:89ee:52d? ([2001:df0:0:200c:f5e5:b852:89ee:52d])
        by smtp.gmail.com with ESMTPSA id 16sm26281376pfm.200.2022.02.14.12.50.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Feb 2022 12:50:08 -0800 (PST)
Message-ID: <4b3a0bc8-24a1-2a33-19bb-fbae954c614c@gmail.com>
Date:   Tue, 15 Feb 2022 09:50:04 +1300
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
From:   Michael Schmitz <schmitzmic@gmail.com>
In-Reply-To: <CAMuHMdVUX0zJtRAtjCBAa7iEk7MwCjcmSsJdCrSrPcY=6ti=cQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Geert,

On 14/02/22 20:41, Geert Uytterhoeven wrote:
> Hi Michael,
>
> (replying in plain text mode ;-)
Sorry about that - hopefully fixed now.
>
> On Sun, Feb 13, 2022 at 9:29 PM Michael Schmitz <schmitzmic@gmail.com> wrote:
>>
>>   2. Change the color depth a few times:
>>
>>      $ fbset -depth 1
>>      $ fbset -depth 2
>>
>> Depth 2 forces STe palette mode (in decode_var; activated in the Videl in the vbl switcher).
>>
>> [...]
>> It _looks_ as though changes to f_shift and st_shift are not pushed to hardware in the VBL interrupt. Does ARAnyM run the VBL interrupt regularly?
> Yes it does.
>
>> But maybe the kernel and ARAnyM disagree because useStPalette() has this:
>>
>> int hreg = handleReadW(HW + 0x82); // Too lame!
>> // Better way how to make out ST LOW mode wanted
>> if (hreg == 0x10 || hreg == 0x17 || hreg == 0x3e) {
>> useStPal = true;
>>
>> }
>>
>> for st_shift == 0
> Linux' falcon_setcolreg() writes to both the Falcon palette registers
> and shifter_tt.color_reg[], so shouldn't the STE color palette contain
> the correct colors, too?


I don't think it will:

The STe palette is set like this:

                 shifter_tt.color_reg[regno] =
                         (((red & 0xe) >> 1) | ((red & 1) << 3) << 8) |
                         (((green & 0xe) >> 1) | ((green & 1) << 3) << 4) |
                         ((blue & 0xe) >> 1) | ((blue & 1) << 3);

with all colours downshifted by 12 bits already. Rewriting that in the 
same form as is used in falcon_setcolreg(), i.e. without the downshift:

                 shifter_tt.color_reg[regno] =
                         (((red & 0xe000) >> 13) | ((red & 1000) >> 9) 
<< 8) |
                         (((green & 0xe000) >> 13) | ((green & 1000) >> 
9) << 4) |
                         ((blue & 0xe000) >> 13) | ((blue & 1000) >> 9);


Now look at falcon_setcolreg:

                 shifter_tt.color_reg[regno] =
                         (((red & 0xe000) >> 13) | ((red & 0x1000) >> 
12) << 8) |
                         (((green & 0xe000) >> 13) | ((green & 0x1000) 
 >> 12) << 4) |
                         ((blue & 0xe000) >> 13) | ((blue & 0x1000) >> 12);


My guess would be the two ought to be identical, assuming the STe 
palette registers provide backwards hardware compatibility.

Either way, I think we've got operator precedence wrong here. Shift 
takes precedence over bitwise and / or? With that precedence, what we 
have in summary is

                 shifter_tt.color_reg[regno] =
                         (((red & 0xe000) >> 13) | ((red & 0x1000) >> 4)) |
                         (((green & 0xe000) >> 13) | ((green & 0x1000) 
 >> 8)) |
                         ((blue & 0xe000) >> 13) | ((blue & 0x1000) >> 12);

Only the blue bits ever entirely seem to end up where they ought to. 
Testing this hypothesis on ARAnyM (without getting it to boot all the 
way, for some odd reason likely to do with my current .config) shows 
that the current code results in the shifter_tt.color_reg entries either 
5 or 0x17, 0x113 or 0x117. Adding the missing parentheses results in 
what I'd expect to see.

This bug has been present since at least 2.4.30. I do recall seeing this 
odd blue console before on the Falcon, so it's been a real bug for ages. 
Did the operator precedence change sometime since?

>
>> As the problem is not 100% reproducible, it looks like a race condition
>> in ARAnyM, or a wrong initialization order in atafb.
>>
>> I'd have to test this on hardware but haven't got fbset on the Falcon. I'll try to locate a binary.
> Sorry, you do not need fbset to reproduce this:
>
>      echo N > /sys/class/graphics/fb0/bits_per_pixel

Thanks, that's easy enough to try.

Playing around with that command a bit, it does appear that the second 
switch after selecting depth 2 turns the console blue (regardless of 
what depth is set in that step). And the second switch after that (even 
if setting depth 2) restores normal colours. No race that I can see 
there, it's quite reproducible.

Now what would cause us to miss every other palette update or depth change?

I'll verify that the bug is gone once I've rebuilt with a sane .config. 
But I think we've got enough to fix at least the annoying STe palette 
bug. Unless you want to keep that alive until we've found out what 
causes us to miss odd updates...

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
