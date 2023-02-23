Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56130C61DA4
	for <linux-m68k@archiver.kernel.org>; Thu, 23 Feb 2023 14:23:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234720AbjBWOXH (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 23 Feb 2023 09:23:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233787AbjBWOXF (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 23 Feb 2023 09:23:05 -0500
X-Greylist: delayed 1063 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 23 Feb 2023 06:22:57 PST
Received: from smtpq4.tb.mail.iss.as9143.net (smtpq4.tb.mail.iss.as9143.net [212.54.42.167])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E32CC4AFE8
        for <linux-m68k@lists.linux-m68k.org>; Thu, 23 Feb 2023 06:22:57 -0800 (PST)
Received: from [212.54.42.106] (helo=smtp2.tb.mail.iss.as9143.net)
        by smtpq4.tb.mail.iss.as9143.net with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.90_1)
        (envelope-from <jongk@linux-m68k.org>)
        id 1pVCDg-00074h-Er
        for linux-m68k@lists.linux-m68k.org; Thu, 23 Feb 2023 15:05:12 +0100
Received: from mail-lj1-f179.google.com ([209.85.208.179])
        by smtp2.tb.mail.iss.as9143.net with ESMTPA
        id VCDfpnK8IrQ6FVCDfppUu4; Thu, 23 Feb 2023 15:05:12 +0100
X-Env-Mailfrom: jongk@linux-m68k.org
X-Env-Rcptto: linux-m68k@lists.linux-m68k.org
X-SourceIP: 209.85.208.179
X-CNFS-Analysis: v=2.4 cv=PbA5xAtd c=1 sm=1 tr=0 ts=63f77298 cx=a_exe
 a=VTRoezvS/npC8Q0+BDQU1g==:117 a=NxlEi8_b7Ylpj-t5:21 a=IkcTkHD0fZMA:10
 a=m04uMKEZRckA:10 a=tBb2bbeoAAAA:8 a=VwQbUJbxAAAA:8 a=dDSpQXan1UweYd4uofYA:9
 a=QEXdDO2ut3YA:10 a=V06SB31hTH_lka26cmxE:22 a=Oj-tNtZlA1e06AYgeCfH:22
 a=AjGcO6oz07-iQ99wixmX:22
X-Authenticated-Sender: karsdejong@home.nl
Received: by mail-lj1-f179.google.com with SMTP id e9so10882857ljn.9
        for <linux-m68k@lists.linux-m68k.org>; Thu, 23 Feb 2023 06:05:11 -0800 (PST)
X-Gm-Message-State: AO0yUKV+F/vfPWT1Af46ZdMbiAhr9l3p+sDQ9DjR2YgzRDrAkbbH/jmW
        0FcE2Kg6OTH21lMsJD3pCWVfmhzYouupXn67akU=
X-Google-Smtp-Source: AK7set/+lM/QQMkGuoTiO9/h1OTTNVqTOf6NJrYR18JhLWA3xzmet3MKcMvoX4xjfQwEOwnnC5Qo4BTNcHsq3fELZno=
X-Received: by 2002:a2e:a4c3:0:b0:295:93eb:e790 with SMTP id
 p3-20020a2ea4c3000000b0029593ebe790mr2236856ljm.5.1677161111227; Thu, 23 Feb
 2023 06:05:11 -0800 (PST)
MIME-Version: 1.0
References: <20230223112349.26675-1-jongk@linux-m68k.org> <CAMuHMdWVwyRuwUZY4t7NKEbAePTuj44zYi7gmYiL1_ZCJWySZQ@mail.gmail.com>
In-Reply-To: <CAMuHMdWVwyRuwUZY4t7NKEbAePTuj44zYi7gmYiL1_ZCJWySZQ@mail.gmail.com>
From:   Kars de Jong <jongk@linux-m68k.org>
Date:   Thu, 23 Feb 2023 15:05:00 +0100
X-Gmail-Original-Message-ID: <CACz-3rhNFb81+auU10+ctG2XrcvKgQ7o0MGy+6DV5MsNw9XmNg@mail.gmail.com>
Message-ID: <CACz-3rhNFb81+auU10+ctG2XrcvKgQ7o0MGy+6DV5MsNw9XmNg@mail.gmail.com>
Subject: Re: [PATCH] m68k: fix for systems with memory at end of 32-bit
 address space
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Content-Type: text/plain; charset="UTF-8"
X-CMAE-Envelope: MS4xfLlBJw6Yq1GcwV7rURhBTWFqMWiXabZ8Iha7QWRHPJL2h1t2rkU1LL8wgJYOV8kCKb2TCiJ3fGG4WHzTgYaZQGqM4f9W/eYggaH2x8jyCRa6y0OFJ06Z
 jQqf+jMRrF99vlkm5Z+QLN+kaG0Or1IyrN12RFJhsSLlA6UT5uUDne3yGnDNti9rwGv7YWZSzsyqRcdhBJY69n44G+9xQdga4jqEgJNebIM1uALEWcjMlL0/
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Op do 23 feb. 2023 om 13:39 schreef Geert Uytterhoeven <geert@linux-m68k.org>:
>
> So this has been broken for the last 15 years?

Yes, looks like this commit broke it:
https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git/commit/arch/m68k/mm/motorola.c?id=12d810c1b8c2b913d48e629e2b5c01d105029839,
so slightly longer than 15 years :-).
Looking at my old 2.6 trees, it looks like the last time I was really
actively developing for the HP300 was in 2006.
How time flies...

Anyway, now it boots to the point of attempting to run init, which
fails, the network driver appears to get stuck.

Kind regards,

Kars.
