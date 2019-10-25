Return-Path: <SRS0=vCbO=YS=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B9A1CA9EA0
	for <linux-m68k@archiver.kernel.org>; Fri, 25 Oct 2019 07:52:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7CC132070B
	for <linux-m68k@archiver.kernel.org>; Fri, 25 Oct 2019 07:52:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437302AbfJYHwu (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 25 Oct 2019 03:52:50 -0400
Received: from smtpq4.tb.mail.iss.as9143.net ([212.54.42.167]:42756 "EHLO
        smtpq4.tb.mail.iss.as9143.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727275AbfJYHwt (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>);
        Fri, 25 Oct 2019 03:52:49 -0400
X-Greylist: delayed 1637 seconds by postgrey-1.27 at vger.kernel.org; Fri, 25 Oct 2019 03:52:49 EDT
Received: from [212.54.42.137] (helo=smtp6.tb.mail.iss.as9143.net)
        by smtpq4.tb.mail.iss.as9143.net with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.90_1)
        (envelope-from <jongk@linux-m68k.org>)
        id 1iNtyV-00072H-3f
        for linux-m68k@vger.kernel.org; Fri, 25 Oct 2019 09:25:31 +0200
Received: from mail-wr1-f45.google.com ([209.85.221.45])
        by smtp6.tb.mail.iss.as9143.net with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.90_1)
        (envelope-from <jongk@linux-m68k.org>)
        id 1iNtyU-0006Et-Vx
        for linux-m68k@vger.kernel.org; Fri, 25 Oct 2019 09:25:31 +0200
Received: by mail-wr1-f45.google.com with SMTP id l10so1072083wrb.2
        for <linux-m68k@vger.kernel.org>; Fri, 25 Oct 2019 00:25:30 -0700 (PDT)
X-Gm-Message-State: APjAAAWumV/uXbNZPdGy8YYju9U4u9vbSgr4Rgz6qhh2x0TkP1wITF44
        M2tbqoyVleP3fasJygwo/Wk82TNIUYjemaJDcYI=
X-Google-Smtp-Source: APXvYqwi8nR60b3Peqgxu2nCRNeksbyjzELtH4WIy8lAuztWIvpfy5YVdMCa4nWuIg69M2hSk0z6jJjGQN2J9gcJY+g=
X-Received: by 2002:a5d:660c:: with SMTP id n12mr1428498wru.310.1571988330667;
 Fri, 25 Oct 2019 00:25:30 -0700 (PDT)
MIME-Version: 1.0
References: <7d87adfd-4373-950d-fc94-3bbdcce9e798@flatline.de>
In-Reply-To: <7d87adfd-4373-950d-fc94-3bbdcce9e798@flatline.de>
From:   Kars de Jong <jongk@linux-m68k.org>
Date:   Fri, 25 Oct 2019 09:25:19 +0200
X-Gmail-Original-Message-ID: <CACz-3rgbLHbQf7kSbyH7NP5SUcMt1hJ=FiU+SGpTT8ZecuLYVQ@mail.gmail.com>
Message-ID: <CACz-3rgbLHbQf7kSbyH7NP5SUcMt1hJ=FiU+SGpTT8ZecuLYVQ@mail.gmail.com>
Subject: Re: Amiga PCMCIA network card support
To:     "Andreas 'count' Kotes" 
        <count-vger.kernel.org+linux-m68k@flatline.de>
Cc:     linux-m68k <linux-m68k@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-SourceIP: 209.85.221.45
X-Authenticated-Sender: karsdejong@home.nl (via SMTP)
X-Ziggo-spambar: /
X-Ziggo-spamscore: 0.0
X-Ziggo-spamreport: CMAE Analysis: v=2.3 cv=bZoVr9HB c=1 sm=1 tr=0 a=9+rZDBEiDlHhcck0kWbJtElFXBc=:19 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=IkcTkHD0fZMA:10 a=XobE76Q3jBoA:10 a=VwQbUJbxAAAA:8 a=bnBrhIkzYeLGUzQVexYA:9 a=QEXdDO2ut3YA:10 a=AjGcO6oz07-iQ99wixmX:22
X-Ziggo-Spam-Status: No
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Op do 24 okt. 2019 om 22:56 schreef Andreas 'count' Kotes
<count-vger.kernel.org+linux-
> What needs to happen for stable, reliable support for existing PCMCIA
> network cards people already have? How can we unblock those possible
> Linux users?

That would involve quite a few things. I did most of this back in 2.6
times, and had the standard pcnet_cs, 3c589_cs and serial_cs drivers
working on my Amiga 1200. Some of it was a bit hackish though, changes
to <asm/io.h> were discussed but never implemented. The need to be
able to build a multi-machine kernel (with Atari, Q40 and Amiga
support in a single kernel) was one of the things that interfered (it
could probably be solved by adding an extra level of indirection ;-)).
Then Real Life happened and I didn't touch my Amiga for 10+ years...

1) A proper driver for the PCMCIA slot, including hot plugging and
proper controller reset. This involves rewriting part of the IRQ
handling to make Gayle a separate IRQ controller instead of the hard
coded hack that is used now. That shouldn't be too hard. Support for
setting up different data path widths (IO_DATA_PATH_WIDTH_16 etc.)
will require changes to <asm/io.h>, see point 2.
2) Rework <asm/io.h> so inb()/inw()/inl(), outb()/outw()/outl(),
insb()/insw()/insl() and outsb()/outsw()/outsl() "just work" for
PCMCIA address space without having to create ugly hacks in the
generic drivers. This is not trivial because of the strange memory
mapping of the Amiga PCMCIA slot.
3) ...
4) Profit!

Oh, the 3c589_cs driver needed an ugly hack because some of the
registers just didn't read out properly on the Amiga with 16-bit
access. That issue is also described in the source code for the
AmigaOS driver.

Kind regards,

Kars.
