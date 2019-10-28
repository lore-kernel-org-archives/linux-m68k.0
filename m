Return-Path: <SRS0=ttaO=YV=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D32ACA9EC1
	for <linux-m68k@archiver.kernel.org>; Mon, 28 Oct 2019 13:00:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5D96120717
	for <linux-m68k@archiver.kernel.org>; Mon, 28 Oct 2019 13:00:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729667AbfJ1NAu (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 28 Oct 2019 09:00:50 -0400
Received: from smtpq3.tb.mail.iss.as9143.net ([212.54.42.166]:36806 "EHLO
        smtpq3.tb.mail.iss.as9143.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726911AbfJ1NAs (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>);
        Mon, 28 Oct 2019 09:00:48 -0400
Received: from [212.54.42.137] (helo=smtp6.tb.mail.iss.as9143.net)
        by smtpq3.tb.mail.iss.as9143.net with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.90_1)
        (envelope-from <jongk@linux-m68k.org>)
        id 1iP4da-0002Iw-9X
        for linux-m68k@vger.kernel.org; Mon, 28 Oct 2019 14:00:46 +0100
Received: from mail-wr1-f52.google.com ([209.85.221.52])
        by smtp6.tb.mail.iss.as9143.net with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.90_1)
        (envelope-from <jongk@linux-m68k.org>)
        id 1iP4da-0001jZ-50
        for linux-m68k@vger.kernel.org; Mon, 28 Oct 2019 14:00:46 +0100
Received: by mail-wr1-f52.google.com with SMTP id w18so9806010wrt.3
        for <linux-m68k@vger.kernel.org>; Mon, 28 Oct 2019 06:00:46 -0700 (PDT)
X-Gm-Message-State: APjAAAU7sXeXH+FjDWGXg7oIjVge2NtSKMnpcw1kKuI2f0i0yh5/WlzX
        aihslfkeZXMpdecJWJrI4DRZefwTdalaXgCEMac=
X-Google-Smtp-Source: APXvYqyyGwtUfHE8s+gWQIy3mVPjgA462h/3CWTswzTl1X9tKdpV9mDGlihoA2DiPBaZvOB2FqqzpOtJYpN8eTyejUc=
X-Received: by 2002:adf:f306:: with SMTP id i6mr14416225wro.209.1572267645775;
 Mon, 28 Oct 2019 06:00:45 -0700 (PDT)
MIME-Version: 1.0
References: <7d87adfd-4373-950d-fc94-3bbdcce9e798@flatline.de>
 <CACz-3rgbLHbQf7kSbyH7NP5SUcMt1hJ=FiU+SGpTT8ZecuLYVQ@mail.gmail.com>
 <5531fcb0-687d-7186-a4b5-f2f9349d334a@flatline.de> <CACz-3riJHfuhkFMyPbUCz8Q9Mbu6T+CFz5gMwAKzMeg0tjM4Hg@mail.gmail.com>
 <1989702b-16ca-b376-c33d-9e04e6de2ca3@physik.fu-berlin.de>
In-Reply-To: <1989702b-16ca-b376-c33d-9e04e6de2ca3@physik.fu-berlin.de>
From:   Kars de Jong <jongk@linux-m68k.org>
Date:   Mon, 28 Oct 2019 14:00:34 +0100
X-Gmail-Original-Message-ID: <CACz-3riuHWhRXQsdaphDnhLM6zz6eKkc5YrT9=iUk5of+411wA@mail.gmail.com>
Message-ID: <CACz-3riuHWhRXQsdaphDnhLM6zz6eKkc5YrT9=iUk5of+411wA@mail.gmail.com>
Subject: Re: Amiga PCMCIA network card support
To:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc:     "Andreas 'count' Kotes" 
        <count-vger.kernel.org+linux-m68k@flatline.de>,
        linux-m68k <linux-m68k@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-SourceIP: 209.85.221.52
X-Authenticated-Sender: karsdejong@home.nl (via SMTP)
X-Ziggo-spambar: /
X-Ziggo-spamscore: 0.0
X-Ziggo-spamreport: CMAE Analysis: v=2.3 cv=bZoVr9HB c=1 sm=1 tr=0 a=9+rZDBEiDlHhcck0kWbJtElFXBc=:19 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=IkcTkHD0fZMA:10 a=XobE76Q3jBoA:10 a=L_vtIpN_u5cnuVvfCBUA:9 a=QEXdDO2ut3YA:10
X-Ziggo-Spam-Status: No
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hello!

Op ma 28 okt. 2019 om 12:08 schreef John Paul Adrian Glaubitz
<glaubitz@physik.fu-berlin.de>:
>
> Hi Kars!
> > had similar issues with the last 2.6.2x kernel I tested in 2008(?),
> > after switching to the new ESP driver.
> > The drive is identified, set to synchronous 10 MHz mode, some
> > transfers are done but then it locks up. After the ESP driver runs its
> > recovery procedure, the bash that I run as init process exits with
> > code 4.
>
> Wait, do you have build issues or do you have issues running the driver?

Running. Building was fine.

> The new zorro_esp has seen a lot of rewrite. So old bugs might have been
> fixed now.

Yes, for Mac support etc. Unfortunately it doesn't work for me. For
starters. it does not identify my chip correctly, it says it's a
FAS100A (it's actually a Symbios Logic 53CF94-2 which is more like a
FAS236).
But after I fixed that it still doesn't work.

One difference between the new driver and the old one is its support
for tagged commands. I haven't found an easy way to disable that yet
though.

> But I will be attending FOSDEM and Geert is coming as well (at least he
> has been to every FOSDEM so far ;)), so we can maybe have a small m68k
> meeting. I'm coming with two friends who are also Linux hackers.

Would be cool... Last time I went to something like that was the
Oldenburg meeting of 1998 ;-)

> > Also, someone once tested this on his A1200 which had a 68030 and I
> > believe it broke. Something about ioremap() not accepting physical
> > addresses that were already mapped by a fixed mapping (Zorro II
> > address space).
>
> Doesn't this depend on the type of accelerator used? I think some of them
> cause incompatibilities with the PCMCIA slot, don't they?

I don't think that was the issue. Roman Zippel provided a patch which
fixed it, but his last comment on the matter was

> ... it should have also worked without the patch, so
> there is still some other problem, I'd like to find.
>
> bye, Roman

We never got to that, and Roman seems to have disappeared.

> > I will try to prepare a patch for the IRQ handling.
>
> Nice. Thank you! Really cool to see more and more people starting to work
> on Linux/m68k again :). This shows that all the effort I put into Debian/m68k
> was worth it!

Thanks, I'll try installing a more recent Debian on my Amiga.

Kind regards,

Kars.
