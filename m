Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6D5AC48BDF
	for <linux-m68k@archiver.kernel.org>; Fri, 18 Jun 2021 08:06:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9950761351
	for <linux-m68k@archiver.kernel.org>; Fri, 18 Jun 2021 08:06:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231877AbhFRIIi (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 18 Jun 2021 04:08:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232395AbhFRIIh (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Fri, 18 Jun 2021 04:08:37 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F05F5C061574;
        Fri, 18 Jun 2021 01:06:25 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id k22-20020a17090aef16b0290163512accedso6805057pjz.0;
        Fri, 18 Jun 2021 01:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=LZv0lWsZ028iyr8vq0HfRi2N3ffpsv5fCOqqDgr2at4=;
        b=PdMP+51Yl8pKocErxqVLBFAPwTKLWwLprB3Mwa43S9H3awdMJBFNHgBg9PR3sNlFem
         PHj+oOR+3lAJOQWAynDrn0m4hNyIQ7pSlPL/yEw1GGWNP1lLJCqWk/Cyam9WD4rRmMAh
         Q0T7McwE5wMyI8yI5WpAKNrTMCv4lvBGAcyqqXCzpTHgxKxwx1H9dn2YjRIppKDEJzk0
         0wrVO5Cpmt7Elmq74//604QmWhycCAFw9f2BytJcYxAm886pB0tvL2a5cGyrFOThWJzu
         OswRdoTnjr0RSrvz21KwgLl0pSKDX5jQ2NWMHEDgCxJhPsVIJivEtdhwlPKqnJgDlUxA
         Y82w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:cc:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=LZv0lWsZ028iyr8vq0HfRi2N3ffpsv5fCOqqDgr2at4=;
        b=uCtoN7NoaDSHTgroDP71oCle+msA7V8JwGvYzPo1JWExO/A6oao3DOZeT8AMRl0hqU
         y72/Lguqe4RGg4GsvV0b/4ur3+dolYo0D9Eo7u/+EvdvuHMsawr1Y9o1Wp2JBhrhuDSP
         M9vO+Z44WBG5gJgPaJrYbnzaa5RJSZD6oJ4MwF/6cQjsWQeH6P1sY87DM332f1D8BL9U
         5hMgjoOICWPMyO9QSsm1V0GfAyWuYVG/6V7cvY/76csnUQ1kqfsIOi/taPXjpIQP9qSW
         jkXsl4cjj8azUwqS+k+j9g6h0qwlTU01pIrMs2z0eK8GX4Pzh+Du+xGNS/gpMjJu6D5m
         aJQw==
X-Gm-Message-State: AOAM531o5rtTM5tQZGpplaggRKKTmeFmBoQD/po+BPv9CS16ppgPcGIR
        YjFtZg4XVzDLFSIC1ZboMDDQejLhw0M=
X-Google-Smtp-Source: ABdhPJzVYZxgVw25FGjhK+4SyrGoz17eB4y3Iey5PBYuBWnJRBspAICa0Ld93YufHUbqhgimwEALsQ==
X-Received: by 2002:a17:90a:4208:: with SMTP id o8mr9672528pjg.216.1624003585199;
        Fri, 18 Jun 2021 01:06:25 -0700 (PDT)
Received: from [10.1.1.25] (222-152-189-137-fibre.sparkbb.co.nz. [222.152.189.137])
        by smtp.gmail.com with ESMTPSA id ip7sm7047665pjb.39.2021.06.18.01.06.21
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 18 Jun 2021 01:06:24 -0700 (PDT)
Subject: Re: [PATCH net-next v3 2/2] net/8390: apne.c - add 100 Mbit support
 to apne.c driver
To:     Geert Uytterhoeven <geert@linux-m68k.org>
References: <1623907712-29366-1-git-send-email-schmitzmic@gmail.com>
 <1623907712-29366-3-git-send-email-schmitzmic@gmail.com>
 <d661fb8-274d-6731-75f4-685bb2311c41@linux-m68k.org>
 <1fa288e2-3157-68f8-32c1-ffa1c63e4f85@gmail.com>
 <CAMuHMdVGe1EutOVpw3-R=25xG0p2rWd65cB2mqM-imXWYjLtXw@mail.gmail.com>
Cc:     Finn Thain <fthain@linux-m68k.org>,
        Linux/m68k <linux-m68k@vger.kernel.org>,
        ALeX Kazik <alex@kazik.de>, netdev <netdev@vger.kernel.org>
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <da54e915-c142-a69b-757f-6a6419f173fa@gmail.com>
Date:   Fri, 18 Jun 2021 20:06:19 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdVGe1EutOVpw3-R=25xG0p2rWd65cB2mqM-imXWYjLtXw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Geert,

Am 18.06.2021 um 19:16 schrieb Geert Uytterhoeven:
>>>> +#ifdef CONFIG_APNE100MBIT
>>>> +    if (apne_100_mbit)
>>>> +            isa_type = ISA_TYPE_AG16;
>>>> +#endif
>>>> +
>>> I think isa_type has to be assigned unconditionally otherwise it can't be
>>> reset for 10 mbit cards. Therefore, the AMIGAHW_PRESENT(PCMCIA) logic in
>>> arch/m68k/kernel/setup_mm.c probably should move here.
>>
>> Good catch! I am uncertain though as to whether replacing a 100 Mbit
>> card by a 10 Mbit one at run time is a common use case (or even
>> possible, given constraints of the Amiga PCMCIA interface?), but it
>> ought to work even if rarely used.
>
> Given it's PCMCIA, I guess that's a possibility.
> Furthermore, always setting isa_type means the user can recover from
> a mistake by unloading the module, and modprobe'ing again with the
> correct parameter.
> For the builtin-case, that needs a s/0444/0644/ change, though.

How does re-probing after a card change for a builtin driver work? 
Changing the permission bits is a minor issue.

>
>> The comment there says isa_type must be set as early as possible, so I'd
>> rather leave that alone, and add an 'else' clause here.
>>
>> This of course raise the question whether we ought to move the entire
>> isa_type handling into arch code instead - make it a generic
>> amiga_pcmcia_16bit option settable via sysfs. There may be other 16 bit
>> cards that require the same treatment, and duplicating PCMCIA mode
>> switching all over the place could be avoided. Opinions?
>
> Indeed.

The only downside I can see is that setting isa_type needs to be done 
ahead of modprobe, through sysfs. That might be a little error prone.

> Still, can we autodetect in the driver?

Guess we'll have to find out how the 16 bit cards behave if first poked 
in 8 bit mode, attempting to force a reset of the 8390 chip, and 
switching to 16 bit mode if this fails. That's normally done in 
apne_probe1() which runs after init_pcmcia(), so we can't rely on the 
result of a 8390 reset autoprobe to do the PCMCIA software reset there.

The 8390 reset part does not rely on anything else in apne_probe1(), so 
that code can be lifted out of apne_probe1() and run early in 
apne_probe() (after the check for an inserted PCMCIA card). I'll try and 
prepare a patch for Alex to test that method.

>
> I'm wondering how this is handled on PCs with PCMCIA, or if there
> really is something special about Amiga PCMCIA hardware...

What's special about Amiga PCMCIA hardware is that the card reset isn't 
connected for those 16 bit cards, so pcmcia_reset() does not work.

Whether the software reset workaround hurts for 8 bit cards is something 
I don't know and cannot test. But

> And I'd really like to get rid of the CONFIG_APNE100MBIT option,
> i.e. always include the support, if possible.

I can't see why that wouldn't be possible - the only downside is that we 
force MULTI_ISA=1 always for Amiga, and lose the optimizations done for 
MUTLI_ISA=0 in io_mm.h. Unless we autoprobe, we can use isa_type to 
guard against running a software reset on 8 bit cards ...

Cheers,

	Michael

> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
>
