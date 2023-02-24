Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FE8EC61DA3
	for <linux-m68k@archiver.kernel.org>; Fri, 24 Feb 2023 10:43:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229998AbjBXKnG (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 24 Feb 2023 05:43:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229740AbjBXKmi (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 24 Feb 2023 05:42:38 -0500
Received: from smtpq4.tb.mail.iss.as9143.net (smtpq4.tb.mail.iss.as9143.net [212.54.42.167])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCF25671CD
        for <linux-m68k@lists.linux-m68k.org>; Fri, 24 Feb 2023 02:41:07 -0800 (PST)
Received: from [212.54.42.105] (helo=smtp1.tb.mail.iss.as9143.net)
        by smtpq4.tb.mail.iss.as9143.net with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.90_1)
        (envelope-from <jongk@linux-m68k.org>)
        id 1pVVVh-0002hB-QS
        for linux-m68k@lists.linux-m68k.org; Fri, 24 Feb 2023 11:41:05 +0100
Received: from mail-lf1-f43.google.com ([209.85.167.43])
        by smtp1.tb.mail.iss.as9143.net with ESMTPA
        id VVVhp2c2agqUQVVVhpGCUs; Fri, 24 Feb 2023 11:41:05 +0100
X-Env-Mailfrom: jongk@linux-m68k.org
X-Env-Rcptto: linux-m68k@lists.linux-m68k.org
X-SourceIP: 209.85.167.43
X-CNFS-Analysis: v=2.4 cv=OoKJiQzt c=1 sm=1 tr=0 ts=63f89441 cx=a_exe
 a=V3SKbpRzU9DxzSgA2GKAQg==:117 a=NxlEi8_b7Ylpj-t5:21 a=IkcTkHD0fZMA:10
 a=m04uMKEZRckA:10 a=tBb2bbeoAAAA:8 a=VwQbUJbxAAAA:8 a=gu6fZOg2AAAA:8
 a=ViZW21dTAoLjEVhZu-YA:9 a=QEXdDO2ut3YA:10 a=-FEs8UIgK8oA:10
 a=V06SB31hTH_lka26cmxE:22 a=Oj-tNtZlA1e06AYgeCfH:22 a=AjGcO6oz07-iQ99wixmX:22
 a=2RSlZUUhi9gRBrsHwhhZ:22
X-Authenticated-Sender: karsdejong@home.nl
Received: by mail-lf1-f43.google.com with SMTP id k14so16381771lfj.7
        for <linux-m68k@lists.linux-m68k.org>; Fri, 24 Feb 2023 02:41:05 -0800 (PST)
X-Gm-Message-State: AO0yUKVq2MieJHtV4K+FX/WN4/Lc6PhQmuj0OFnPxub1sOHuOxNPt22+
        QL7FxG7fe31VCDV4pB7v9qb5GY+8CHesoT3cAnA=
X-Google-Smtp-Source: AK7set/q9Eq73o7mHYH/ulMy4wvW4YaFKXg+jPnl5nnzvWKJ8eycvazNyDAg5/NYMv0ri3ErNwXE8XLbhUQYaE54sQk=
X-Received: by 2002:a19:5207:0:b0:4db:1326:79b2 with SMTP id
 m7-20020a195207000000b004db132679b2mr4721640lfb.2.1677235265043; Fri, 24 Feb
 2023 02:41:05 -0800 (PST)
MIME-Version: 1.0
References: <20230223112349.26675-1-jongk@linux-m68k.org> <CAMuHMdWVwyRuwUZY4t7NKEbAePTuj44zYi7gmYiL1_ZCJWySZQ@mail.gmail.com>
 <CACz-3rhNFb81+auU10+ctG2XrcvKgQ7o0MGy+6DV5MsNw9XmNg@mail.gmail.com>
In-Reply-To: <CACz-3rhNFb81+auU10+ctG2XrcvKgQ7o0MGy+6DV5MsNw9XmNg@mail.gmail.com>
From:   Kars de Jong <jongk@linux-m68k.org>
Date:   Fri, 24 Feb 2023 11:40:53 +0100
X-Gmail-Original-Message-ID: <CACz-3rh+m7FEXVyNUUwCzbUFg6Ytk-iMNcc12o_WNie69aHT+Q@mail.gmail.com>
Message-ID: <CACz-3rh+m7FEXVyNUUwCzbUFg6Ytk-iMNcc12o_WNie69aHT+Q@mail.gmail.com>
Subject: Re: [PATCH] m68k: fix for systems with memory at end of 32-bit
 address space
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Content-Type: text/plain; charset="UTF-8"
X-CMAE-Envelope: MS4xfNaU6CXiw8/2HzUBmhe+ct0QUSnwsqTOAkhl88ymg+WHF+Ae2e+Qos9WS3jU7Kv8FpUfVEL+aN0OTdgZ88HulEeyhVCWRP31N7nI7VmorYFx04Bakw6C
 9v2m9UCcldbxAWB/fsmPIF4eFJxhEYZ63az5YI4h1EFvebKwiSAATQSEud3Djm+qial0grqAn3gKPOHJ3G60Y8ZujHbJKDcqcBm4bpdQqFNSPOk8uh21RuAA
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Op do 23 feb. 2023 om 15:05 schreef Kars de Jong <jongk@linux-m68k.org>:
>
> Op do 23 feb. 2023 om 13:39 schreef Geert Uytterhoeven <geert@linux-m68k.org>:
> >
> > So this has been broken for the last 15 years?
>
> Yes, looks like this commit broke it:
> https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git/commit/arch/m68k/mm/motorola.c?id=12d810c1b8c2b913d48e629e2b5c01d105029839,
> so slightly longer than 15 years :-).

I found the original thread where I reported this here:
https://marc.info/?t=117175647600006&r=1&w=2, including a version of
this same patch, created by Roman Zippel:
https://marc.info/?l=linux-m68k&m=117184910524555&w=2. This was still
in CVS times.

Apparently I used to work around this issue by subtracting 1 from the
memory size in my boot loader.

Now I just need to figure out why the last page of memory is excluded.
Do you also see this on other machines?

Zone ranges:
  DMA      [mem 0x00000000fc000000-0x00000fffffffefff]
  Normal   empty
Movable zone start for each node
Early memory node ranges
  node   0: [mem 0x00000000fc000000-0x00000000ffffefff]
Initmem setup node 0 [mem 0x00000000fc000000-0x00000000ffffefff]


Kind regards,

Kars.
