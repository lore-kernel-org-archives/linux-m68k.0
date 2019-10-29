Return-Path: <SRS0=aYBz=YW=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F021CA9EAE
	for <linux-m68k@archiver.kernel.org>; Tue, 29 Oct 2019 09:15:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 447E720717
	for <linux-m68k@archiver.kernel.org>; Tue, 29 Oct 2019 09:15:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730552AbfJ2JPG (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 29 Oct 2019 05:15:06 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:40837 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729876AbfJ2JPG (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Tue, 29 Oct 2019 05:15:06 -0400
Received: by mail-ot1-f68.google.com with SMTP id d8so9128305otc.7
        for <linux-m68k@vger.kernel.org>; Tue, 29 Oct 2019 02:15:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=C+QSDWI1DkN10fCQd06B7rMGY6XAboUc5jD11Srz814=;
        b=tROySnRuCxfFExFFvKeW+HdTQqAm5+aPA9IQ/ZRLuQW6VXKDhIzMl3G3RZ+UYn7+u1
         7Rmw1DC+YxZ7MizVBwFcXueQISggNavXoQ6SsKyzs2wM3oI+QYil52MKkKKP5ArdmqS2
         l3LS6t41sUzrnyU27WlNwyT82abxzGPfO9ycEUNh9E+5ozd52cDqg9tWJ0/HRn9lE3JS
         9WBb/4NUO6XI6epx7bBAm15/P/IbgaGi3xWMLV2LlUiMShLdMyZoOjDmE5NhW8QL5905
         DfkyfkRUIvtAMKGUC/itO9zy87GDUxB21IrHHrp4QYs1vXnsaNvIYP2OFYaBvWLvHDts
         bo8w==
X-Gm-Message-State: APjAAAXunZMConkYEo+Eo4+WK0tZpzL5g+g2/yHExdSJDNiELZMnU42F
        s1cKvSpy+24kI8YYEWopiSVhaYMu4dQaWycPUBA=
X-Google-Smtp-Source: APXvYqz3/o/K9pNZsqHZWEWLA4JONEUJNSjfYIPJwwWWdkfDwH5X8nyeWWMFKmt9pJKcQUUZUB3WhFeZsPM8O9NJ9OI=
X-Received: by 2002:a9d:7d19:: with SMTP id v25mr14005800otn.250.1572340504339;
 Tue, 29 Oct 2019 02:15:04 -0700 (PDT)
MIME-Version: 1.0
References: <7d87adfd-4373-950d-fc94-3bbdcce9e798@flatline.de>
 <CACz-3rgbLHbQf7kSbyH7NP5SUcMt1hJ=FiU+SGpTT8ZecuLYVQ@mail.gmail.com>
 <5531fcb0-687d-7186-a4b5-f2f9349d334a@flatline.de> <CACz-3riJHfuhkFMyPbUCz8Q9Mbu6T+CFz5gMwAKzMeg0tjM4Hg@mail.gmail.com>
 <CAMuHMdWdvHZ97Wh4PBfdO-Lz4QM3_ZoGah5p0SBJr8V-EcULGA@mail.gmail.com> <0711e1c1-889f-614d-556f-250d1f6173f1@physik.fu-berlin.de>
In-Reply-To: <0711e1c1-889f-614d-556f-250d1f6173f1@physik.fu-berlin.de>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 29 Oct 2019 10:14:52 +0100
Message-ID: <CAMuHMdVGT9vGeapDHL73dcnd7QNq7+P613W5nLQ3R2Az4xfH3Q@mail.gmail.com>
Subject: Re: Amiga PCMCIA network card support
To:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc:     Kars de Jong <jongk@linux-m68k.org>,
        "Andreas 'count' Kotes" 
        <count-vger.kernel.org+linux-m68k@flatline.de>,
        linux-m68k <linux-m68k@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Adrian,

On Tue, Oct 29, 2019 at 10:12 AM John Paul Adrian Glaubitz
<glaubitz@physik.fu-berlin.de> wrote:
> On 10/29/19 10:00 AM, Geert Uytterhoeven wrote:
> >> I've dusted it off and powered it on this weekend. It still works (RTC
> >> needs a new battery though), and the 2.6.18 kernel that I modified
> >> many years ago still works fine with the pcnet_cs driver and my
> >> Dynalink L10C card.
> >
> > You may want to have a close look at the electrolytic capacitors.
> > A few months ago I had to repair some of the damage done by
> > a leaking capacitor.  Fortunately I don't need the signals on the
> > parallel port, but I do use the serial console, and thus had to fix
> > the eaten RXD trace.
>
> In the worst case, you can just buy a new A1200 board off eBay for 70 Euros:

Mine is an A4000 ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
