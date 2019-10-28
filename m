Return-Path: <SRS0=ttaO=YV=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8823ECA9EC0
	for <linux-m68k@archiver.kernel.org>; Mon, 28 Oct 2019 15:39:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6798A21721
	for <linux-m68k@archiver.kernel.org>; Mon, 28 Oct 2019 15:39:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389673AbfJ1Pjm (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 28 Oct 2019 11:39:42 -0400
Received: from smtpq4.tb.mail.iss.as9143.net ([212.54.42.167]:38554 "EHLO
        smtpq4.tb.mail.iss.as9143.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726025AbfJ1Pjm (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>);
        Mon, 28 Oct 2019 11:39:42 -0400
Received: from [212.54.42.110] (helo=smtp7.tb.mail.iss.as9143.net)
        by smtpq4.tb.mail.iss.as9143.net with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.90_1)
        (envelope-from <jongk@linux-m68k.org>)
        id 1iP77M-0003QF-67
        for linux-m68k@vger.kernel.org; Mon, 28 Oct 2019 16:39:40 +0100
Received: from mail-wm1-f49.google.com ([209.85.128.49])
        by smtp7.tb.mail.iss.as9143.net with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.90_1)
        (envelope-from <jongk@linux-m68k.org>)
        id 1iP77M-0008Lc-0p
        for linux-m68k@vger.kernel.org; Mon, 28 Oct 2019 16:39:40 +0100
Received: by mail-wm1-f49.google.com with SMTP id r141so9629963wme.4
        for <linux-m68k@vger.kernel.org>; Mon, 28 Oct 2019 08:39:39 -0700 (PDT)
X-Gm-Message-State: APjAAAXP+oMno48XFy7Atcac858ty+b6CeHK5L+EyQhssth96307Hd9m
        3sKsL8870jzkI7m0CYad5ZcWMcBAlz8TvsIZQHY=
X-Google-Smtp-Source: APXvYqzz7NQwYP/7/C5XH9AW5Hezfc/pc75qxa66SAW8vaBkyOBZfSvfroxeQzjS9DZsT5SClXhBoquuPoFkPxtokJo=
X-Received: by 2002:a1c:453:: with SMTP id 80mr552521wme.5.1572277179758; Mon,
 28 Oct 2019 08:39:39 -0700 (PDT)
MIME-Version: 1.0
References: <7d87adfd-4373-950d-fc94-3bbdcce9e798@flatline.de>
 <CACz-3rgbLHbQf7kSbyH7NP5SUcMt1hJ=FiU+SGpTT8ZecuLYVQ@mail.gmail.com>
 <5531fcb0-687d-7186-a4b5-f2f9349d334a@flatline.de> <CACz-3riJHfuhkFMyPbUCz8Q9Mbu6T+CFz5gMwAKzMeg0tjM4Hg@mail.gmail.com>
 <1989702b-16ca-b376-c33d-9e04e6de2ca3@physik.fu-berlin.de>
 <CACz-3riuHWhRXQsdaphDnhLM6zz6eKkc5YrT9=iUk5of+411wA@mail.gmail.com> <a2f35ec5-4dd3-b9b2-5f0c-25258296d9db@physik.fu-berlin.de>
In-Reply-To: <a2f35ec5-4dd3-b9b2-5f0c-25258296d9db@physik.fu-berlin.de>
From:   Kars de Jong <jongk@linux-m68k.org>
Date:   Mon, 28 Oct 2019 16:39:28 +0100
X-Gmail-Original-Message-ID: <CACz-3rjsk_A++yGi8agNZQYsn+rtkFJVfrhOAVUFvr=zCe0Dbg@mail.gmail.com>
Message-ID: <CACz-3rjsk_A++yGi8agNZQYsn+rtkFJVfrhOAVUFvr=zCe0Dbg@mail.gmail.com>
Subject: ESP SCSI driver (was: Amiga PCMCIA network card support)
To:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc:     linux-m68k <linux-m68k@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-SourceIP: 209.85.128.49
X-Authenticated-Sender: karsdejong@home.nl (via SMTP)
X-Ziggo-spambar: /
X-Ziggo-spamscore: 0.0
X-Ziggo-spamreport: CMAE Analysis: v=2.3 cv=M/Qz1B4s c=1 sm=1 tr=0 a=9+rZDBEiDlHhcck0kWbJtElFXBc=:19 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=IkcTkHD0fZMA:10 a=XobE76Q3jBoA:10 a=gi-HZz6TAAAA:8 a=YV9PX1sxFJ3KfnMg3h8A:9 a=QEXdDO2ut3YA:10 a=MYlAAKawBcYl2c7ffVlE:22
X-Ziggo-Spam-Status: No
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Op ma 28 okt. 2019 om 14:20 schreef John Paul Adrian Glaubitz
<glaubitz@physik.fu-berlin.de>:
>
> On 10/28/19 2:00 PM, Kars de Jong wrote:
> >> The new zorro_esp has seen a lot of rewrite. So old bugs might have been
> >> fixed now.
> >
> > Yes, for Mac support etc. Unfortunately it doesn't work for me. For
> > starters. it does not identify my chip correctly, it says it's a
> > FAS100A (it's actually a Symbios Logic 53CF94-2 which is more like a
> > FAS236).
> > But after I fixed that it still doesn't work.
>
> It works perfectly fine with my Amiga 4000 and the SCSI controller on the
> Cyberstorm: http://amiga.resource.cx/exp/cyberstorm1.
>
> Michael actually tested everything on the Amiga 4000.

It probably uses a different chip. The text and images show it's a
QLogic FAS216 (which is the same as a FAS236, FAS236 is the
differential variant). The type should more accurately be presented as
"FAS2x6" since you can't tell which type it is in software.

Some of the bits in CONFIG3 have completely different meanings between
these chip variants, and because of the misdetection it is quite wrong
for the 53CF9x-2 in my A1200.

I will try out some things this evening, I naively added the FSC to
the end of the enum, but the code does things like "if (esp->rev >=
FAS100A)" which break horribly then.

It looks like it might work if I add my chip type between FAS236 and
FAS100A in the esp_rev enum.

Kind regards,

Kars.
