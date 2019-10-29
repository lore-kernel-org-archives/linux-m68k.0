Return-Path: <SRS0=aYBz=YW=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3988ACA9EAE
	for <linux-m68k@archiver.kernel.org>; Tue, 29 Oct 2019 09:00:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1961D20830
	for <linux-m68k@archiver.kernel.org>; Tue, 29 Oct 2019 09:00:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730390AbfJ2JAm (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 29 Oct 2019 05:00:42 -0400
Received: from mail-oi1-f175.google.com ([209.85.167.175]:46567 "EHLO
        mail-oi1-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730295AbfJ2JAl (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Tue, 29 Oct 2019 05:00:41 -0400
Received: by mail-oi1-f175.google.com with SMTP id c2so8257835oic.13
        for <linux-m68k@vger.kernel.org>; Tue, 29 Oct 2019 02:00:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0mysURtq+A1cDD5JAJdCBFs1vb89zZ8nki4EKstGErs=;
        b=ipUcldFSy01Z9+rf1dZU7v28PTwJGlHyGFqkNEnbcsFnSXMh1vWQcuFlr3ACMrrNp7
         woEPPXEmO7UmU7HaikBEGWBn2AMFXkB8L61ratjaaD3A35WE5G31hP/Ik7GqDgsY4YQm
         dMq5GDmSL9z26sgiJe8K0ZcEeEHvJIAKQLVo9SFp+mF5BjmHZCl4NzxnKidFHGdzHtWu
         Hx8OCz4NGupbpjv+Z+0k6Yeewd3w9bSFbS0dMpwCbssbHJSwEuPCFFTlTHr0AmKDr5hz
         j/sUEH6rtw6rqLFg4xNxbtjSFJ4U4dwqAN5tZnc8Vx39VNNM6Pa5nHc0t9XOIkNAg4s4
         E1AQ==
X-Gm-Message-State: APjAAAWAhz7YqodAoKLopohdTMCAQ2JAnHZDWNWwGrBmwYUZc0UTB5eP
        Pbb9rK55ih26Tspys8uz6biRj7mjjZPng37T1txl0IkS
X-Google-Smtp-Source: APXvYqzPdUu4kq9oY447w8TKA3hvNJsJMqcUbuUd6rLF4LBF9g38Z3gOqtTM7o0LfNZLFsK0zOGISgAZQncPVxX9zJ0=
X-Received: by 2002:aca:4ac5:: with SMTP id x188mr299049oia.148.1572339640814;
 Tue, 29 Oct 2019 02:00:40 -0700 (PDT)
MIME-Version: 1.0
References: <7d87adfd-4373-950d-fc94-3bbdcce9e798@flatline.de>
 <CACz-3rgbLHbQf7kSbyH7NP5SUcMt1hJ=FiU+SGpTT8ZecuLYVQ@mail.gmail.com>
 <5531fcb0-687d-7186-a4b5-f2f9349d334a@flatline.de> <CACz-3riJHfuhkFMyPbUCz8Q9Mbu6T+CFz5gMwAKzMeg0tjM4Hg@mail.gmail.com>
In-Reply-To: <CACz-3riJHfuhkFMyPbUCz8Q9Mbu6T+CFz5gMwAKzMeg0tjM4Hg@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 29 Oct 2019 10:00:29 +0100
Message-ID: <CAMuHMdWdvHZ97Wh4PBfdO-Lz4QM3_ZoGah5p0SBJr8V-EcULGA@mail.gmail.com>
Subject: Re: Amiga PCMCIA network card support
To:     Kars de Jong <jongk@linux-m68k.org>
Cc:     "Andreas 'count' Kotes" 
        <count-vger.kernel.org+linux-m68k@flatline.de>,
        linux-m68k <linux-m68k@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

 Hi Kars,

On Mon, Oct 28, 2019 at 8:02 PM Kars de Jong <jongk@linux-m68k.org> wrote:
> Op vr 25 okt. 2019 om 13:49 schreef Andreas 'count' Kotes
> <count-vger.kernel.org+linux-m68k@flatline.de>:
> > On 25.10.19 09:25, Kars de Jong wrote:
> > > Op do 24 okt. 2019 om 22:56 schreef Andreas 'count' Kotes
> > > <count-vger.kernel.org+linux-
> > >> What needs to happen for stable, reliable support for existing PCMCIA
> > >> network cards people already have? How can we unblock those possible
> > >> Linux users?
> > > ...
> > > Then Real Life happened and I didn't touch my Amiga for 10+ years...
> >
> > .. hmm, is this something that's likely to change? ;)
>
> I've dusted it off and powered it on this weekend. It still works (RTC
> needs a new battery though), and the 2.6.18 kernel that I modified
> many years ago still works fine with the pcnet_cs driver and my
> Dynalink L10C card.

You may want to have a close look at the electrolytic capacitors.
A few months ago I had to repair some of the damage done by
a leaking capacitor.  Fortunately I don't need the signals on the
parallel port, but I do use the serial console, and thus had to fix
the eaten RXD trace.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
