Return-Path: <SRS0=ttaO=YV=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BDE6CA9EA0
	for <linux-m68k@archiver.kernel.org>; Mon, 28 Oct 2019 09:19:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4724221850
	for <linux-m68k@archiver.kernel.org>; Mon, 28 Oct 2019 09:19:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730133AbfJ1JTp (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 28 Oct 2019 05:19:45 -0400
Received: from smtpq3.tb.mail.iss.as9143.net ([212.54.42.166]:47114 "EHLO
        smtpq3.tb.mail.iss.as9143.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727664AbfJ1JTp (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>);
        Mon, 28 Oct 2019 05:19:45 -0400
Received: from [212.54.42.110] (helo=smtp7.tb.mail.iss.as9143.net)
        by smtpq3.tb.mail.iss.as9143.net with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.90_1)
        (envelope-from <jongk@linux-m68k.org>)
        id 1iP1Bf-0006kM-2Z
        for linux-m68k@vger.kernel.org; Mon, 28 Oct 2019 10:19:43 +0100
Received: from mail-wr1-f46.google.com ([209.85.221.46])
        by smtp7.tb.mail.iss.as9143.net with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.90_1)
        (envelope-from <jongk@linux-m68k.org>)
        id 1iP1Be-0000mR-UR
        for linux-m68k@vger.kernel.org; Mon, 28 Oct 2019 10:19:42 +0100
Received: by mail-wr1-f46.google.com with SMTP id a11so8992341wra.6
        for <linux-m68k@vger.kernel.org>; Mon, 28 Oct 2019 02:19:42 -0700 (PDT)
X-Gm-Message-State: APjAAAVCDg6l85Ipc7C78JKM41FFWZx47FTod3zyFuAtnzMDMMeVRq5Y
        QuPMrAeqIyosMJcVJtOLkusyyFqbjnOMFaAOIDU=
X-Google-Smtp-Source: APXvYqzskYmORxHIWOUKRcbipb99eGZQDLzO9nOLwApD0xnomAAnRbS0WW7vdFBVMdhDV5WmHoiFIvbQo0fM9+kF130=
X-Received: by 2002:adf:e64f:: with SMTP id b15mr13191174wrn.372.1572254382619;
 Mon, 28 Oct 2019 02:19:42 -0700 (PDT)
MIME-Version: 1.0
References: <7d87adfd-4373-950d-fc94-3bbdcce9e798@flatline.de>
 <CACz-3rgbLHbQf7kSbyH7NP5SUcMt1hJ=FiU+SGpTT8ZecuLYVQ@mail.gmail.com> <5531fcb0-687d-7186-a4b5-f2f9349d334a@flatline.de>
In-Reply-To: <5531fcb0-687d-7186-a4b5-f2f9349d334a@flatline.de>
From:   Kars de Jong <jongk@linux-m68k.org>
Date:   Mon, 28 Oct 2019 10:19:31 +0100
X-Gmail-Original-Message-ID: <CACz-3riJHfuhkFMyPbUCz8Q9Mbu6T+CFz5gMwAKzMeg0tjM4Hg@mail.gmail.com>
Message-ID: <CACz-3riJHfuhkFMyPbUCz8Q9Mbu6T+CFz5gMwAKzMeg0tjM4Hg@mail.gmail.com>
Subject: Re: Amiga PCMCIA network card support
To:     "Andreas 'count' Kotes" 
        <count-vger.kernel.org+linux-m68k@flatline.de>
Cc:     linux-m68k <linux-m68k@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-SourceIP: 209.85.221.46
X-Authenticated-Sender: karsdejong@home.nl (via SMTP)
X-Ziggo-spambar: /
X-Ziggo-spamscore: 0.0
X-Ziggo-spamreport: CMAE Analysis: v=2.3 cv=M/Qz1B4s c=1 sm=1 tr=0 a=9+rZDBEiDlHhcck0kWbJtElFXBc=:19 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=IkcTkHD0fZMA:10 a=XobE76Q3jBoA:10 a=VwQbUJbxAAAA:8 a=f6XZ_DWUAAAA:8 a=OQ6A6LRqNhZSKz_WeBMA:9 a=aS0xX618nUTpYiZL:21 a=FdMI1AXzKqvanVrU:21 a=QEXdDO2ut3YA:10 a=AjGcO6oz07-iQ99wixmX:22 a=Cc1_E8SGf5y_6ZUjtFu7:22
X-Ziggo-Spam-Status: No
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Op vr 25 okt. 2019 om 13:49 schreef Andreas 'count' Kotes
<count-vger.kernel.org+linux-m68k@flatline.de>:
>
> Hello Kars,
>
> On 25.10.19 09:25, Kars de Jong wrote:
> > Op do 24 okt. 2019 om 22:56 schreef Andreas 'count' Kotes
> > <count-vger.kernel.org+linux-
> >> What needs to happen for stable, reliable support for existing PCMCIA
> >> network cards people already have? How can we unblock those possible
> >> Linux users?
> > ...
> > Then Real Life happened and I didn't touch my Amiga for 10+ years...
>
> .. hmm, is this something that's likely to change? ;)

I've dusted it off and powered it on this weekend. It still works (RTC
needs a new battery though), and the 2.6.18 kernel that I modified
many years ago still works fine with the pcnet_cs driver and my
Dynalink L10C card.

I then tried a build of master of Geert's tree, which unfortunately
doesn't fully work due to issues with the Blizzard ESP driver. I also
had similar issues with the last 2.6.2x kernel I tested in 2008(?),
after switching to the new ESP driver.
The drive is identified, set to synchronous 10 MHz mode, some
transfers are done but then it locks up. After the ESP driver runs its
recovery procedure, the bash that I run as init process exits with
code 4.

> Kars, you sound like you're in Europe - will you be on the Chaos
> Communcation Congress in Leipzig this year? Will there be a Linux m68k
> table?

Yes, I'm from Hengelo (the Netherlands), but no, I won't be attending.
I have no idea whether there will be a Linux/m68k presence.

> I don't know how well bounties (like
> https://www.bountysource.com/issues/80706251-m68k-convert-the-backend-to-mode_cc-so-it-can-be-kept-in-future-releases)
> work, but I'd certainly willing to chip in with money, time and
> resources to get this addressed for good.

I don't need money, I need time :-) I looked at the changes I made to
2.6.18, most of it is pretty self contained and should still work on
5.x without too many changes, but the io.h changes are more hairy.
Also, someone once tested this on his A1200 which had a 68030 and I
believe it broke. Something about ioremap() not accepting physical
addresses that were already mapped by a fixed mapping (Zorro II
address space).

> I think cleaning up the IRQ handling etc would also be (another?) good
> showcase of linux-m68k and the Amiga platform being very much alive,
> contrary to what Linus might think :D

Linus knows it's alive, he just seems to wonder why it won't die ;-)
I will try to prepare a patch for the IRQ handling.

Kind regards,

Kars.
