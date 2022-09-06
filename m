Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0185AECAAA1
	for <linux-m68k@archiver.kernel.org>; Tue,  6 Sep 2022 07:33:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233162AbiIFHd7 convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 6 Sep 2022 03:33:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233073AbiIFHd6 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 6 Sep 2022 03:33:58 -0400
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FB4374BAB
        for <linux-m68k@lists.linux-m68k.org>; Tue,  6 Sep 2022 00:33:56 -0700 (PDT)
Received: by mail-qk1-f169.google.com with SMTP id b9so7581558qka.2
        for <linux-m68k@lists.linux-m68k.org>; Tue, 06 Sep 2022 00:33:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=bbzgY2koaSPP3gtcS3mcK0Al6MRExdxSntJo7nZGwqU=;
        b=MRnC2p6FukSpJMJ20+H7m9al9zgQeHRRgwQjwcA03w6EMs2kDrYssUNuhS39iIJMlb
         0cWqGapW7B8D9yyTbhqgaEuQIzkYRjw8KYqi3xhHMjs8wx1dn5RLRUN1NWpFDkhpFHgG
         dTlgFdPOuwiWLpQyH2cKoge+pIy130owJkgv/cn/j9yOWzitDfCJIRy6lxESC4Cv7P6M
         Mx75qjStW1WJHB025GpLVU5NCDJrPWGq2zKcVX+8NjZRH8FLJoBMjxvbo1Bu+gPlMspv
         5PcqY9UKAjJmTUHof3hMSh8dV6OB2ctimUbTR3GJzRSNw9T4QIqFvxVR+ZEM+y8ZajE0
         QAMQ==
X-Gm-Message-State: ACgBeo2084pVksGhzEMSv//bRhPFCDNrH7QW+Wb+SW2/1OCY99+lCoGS
        3fiydyt0d2BHH0gUdI+6LOtR9hY35M929A==
X-Google-Smtp-Source: AA6agR7vyfDTpp8RfGHep/5TyafpnJ//jAprPlVZ1anBS54yMx1x3Kw/AKtCvpfzZg4R8ZH+ziZEcA==
X-Received: by 2002:a05:620a:3729:b0:6bb:6412:f905 with SMTP id de41-20020a05620a372900b006bb6412f905mr34867527qkb.144.1662449635320;
        Tue, 06 Sep 2022 00:33:55 -0700 (PDT)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com. [209.85.219.175])
        by smtp.gmail.com with ESMTPSA id m7-20020a05620a290700b006b9593e2f68sm10750658qkp.4.2022.09.06.00.33.54
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Sep 2022 00:33:54 -0700 (PDT)
Received: by mail-yb1-f175.google.com with SMTP id 83so9360780ybd.2
        for <linux-m68k@lists.linux-m68k.org>; Tue, 06 Sep 2022 00:33:54 -0700 (PDT)
X-Received: by 2002:a5b:c08:0:b0:6a8:f150:8c8c with SMTP id
 f8-20020a5b0c08000000b006a8f1508c8cmr8531288ybq.36.1662449634477; Tue, 06 Sep
 2022 00:33:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220903102453.296ce496@vk3heg> <C8EF5850-C41A-4CD9-9F02-548EE21D31CB@2022.bluespice.org>
 <20220904115051.4ec95d62@vk3heg> <8675AEED-B370-4CBA-B32F-6F23C7F61476@2022.bluespice.org>
 <20220906114629.302188e8@vk3heg> <0545CA05-6782-4394-A437-EE286AED04A9@2022.bluespice.org>
In-Reply-To: <0545CA05-6782-4394-A437-EE286AED04A9@2022.bluespice.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 6 Sep 2022 09:33:43 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX+=6F_jMJifWFUx=hshsA-72adOmUvecQ45CsDZr7Z8g@mail.gmail.com>
Message-ID: <CAMuHMdX+=6F_jMJifWFUx=hshsA-72adOmUvecQ45CsDZr7Z8g@mail.gmail.com>
Subject: Re: Booting Kernel on Amiga 3000
To:     =?UTF-8?Q?Ingo_J=C3=BCrgensmann?= <ij@2022.bluespice.org>
Cc:     Debian m68k <debian-68k@lists.debian.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Ingo,

On Tue, Sep 6, 2022 at 7:46 AM Ingo Jürgensmann <ij@2022.bluespice.org> wrote:
> Am 06.09.2022 um 03:46 schrieb Stephen Walsh <vk3heg@vk3heg.net>:
> >> So, here is the error and a possible solution: using a memfile might
> >> help.
> > I've not done a memfile before so will need a pointer or two.
>
> Quick pointer was to look it up in my blog about the BigRamPlus:
>
> https://blog.windfluechter.net/2013/12/18/1677-debian-donation-m68k-arrived/
>
> There you can find a memfile. Basically it is quite simple. First line should be ChipMem and in that example there are my 64 MB FastMem on the Warpengine. And next parameter to the starting address is the size in bytes.
>
> > The memory layout is like this. Seams to be all the time, booting into
> > 3.1/ATK/SYSINFO
> >
> > $08000000 - $0FFFFFFF     128Mb (WarpEngine)
> > $07800000 - $07FFFFFF     8Mb (Fast Ram)
> > $00004000 - $001FFFFF     2Mb (Chip Ram)
> >
> >
> > Z3 Warpengine $40000000 (16Mb)
> > Z2 X-Surf     $00E90000 (64Kb)
> > Z2 Buddha IDE $00EA0000 (64Kb)
>
> You’ll only need to include those address space that is actually RAM, not address space for firmware or IO stuff.

As there are only two regions of Fast RAM, and the second one should
not be used as it is slow motherboard RAM, I think a memfile won't
make a difference.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
