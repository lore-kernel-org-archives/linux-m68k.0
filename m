Return-Path: <SRS0=aYBz=YW=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DCF8CA9EAE
	for <linux-m68k@archiver.kernel.org>; Tue, 29 Oct 2019 08:57:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2A7CF20830
	for <linux-m68k@archiver.kernel.org>; Tue, 29 Oct 2019 08:57:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730261AbfJ2I5A (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 29 Oct 2019 04:57:00 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:43382 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730258AbfJ2I5A (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Tue, 29 Oct 2019 04:57:00 -0400
Received: by mail-ot1-f65.google.com with SMTP id b19so6740115otq.10
        for <linux-m68k@vger.kernel.org>; Tue, 29 Oct 2019 01:57:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Z2IzA2GZseCJB9RaBV7v/IZaQBkyl5Wllud5Tv4Cqno=;
        b=dXHlOIBaErTOh0YbrRZ9mfSGU4G5cw39N2KLUHah5febxn44eRw26VtbPeHm2bag6H
         pReiXOAtfT2D9HJ0Or8y98vfWHAJZOzhGqxPQ4OAvXoQNUEZ6hVncPVUk1YRqw+m8tCo
         gmLxbk0Y819AQFnEuSWdiXRq1zW8zY2GUDFSZgd/rJVCyRed1sLWLH4XkO2uwEtfXzfP
         QGqQjmuoKTvdWFf+c0e9DkJJC8DvIHOevBCIhLi+jBFsfU2Me94PTNMXbNmC07bbJrUw
         1JHnOVa5DlhRsvCiO9Lqa0eNLAW8MCAGG+7PNuR/CZa0/e2z/YjK2FGb49aGDlX9MVlT
         DmUQ==
X-Gm-Message-State: APjAAAWbhPSsq9wZZXHvyy3ryJ07md8C5esoiI/jaScRDBczAesCJGdy
        S+stomS+zDYTBdXBQYN4q8nOxlPvd0U9+n+ct/tE9reJ
X-Google-Smtp-Source: APXvYqw+HhBvF3EkKUIv2//IijlnNyn95CnvwNI8eXX6SoxcHIac9a5Wac7DzGBjmKnskBGzy9r0OOuNv0QgV9sWz9U=
X-Received: by 2002:a05:6830:20d2:: with SMTP id z18mr430017otq.297.1572339419668;
 Tue, 29 Oct 2019 01:56:59 -0700 (PDT)
MIME-Version: 1.0
References: <7d87adfd-4373-950d-fc94-3bbdcce9e798@flatline.de>
 <CACz-3rgbLHbQf7kSbyH7NP5SUcMt1hJ=FiU+SGpTT8ZecuLYVQ@mail.gmail.com>
 <5531fcb0-687d-7186-a4b5-f2f9349d334a@flatline.de> <CACz-3riJHfuhkFMyPbUCz8Q9Mbu6T+CFz5gMwAKzMeg0tjM4Hg@mail.gmail.com>
 <1989702b-16ca-b376-c33d-9e04e6de2ca3@physik.fu-berlin.de> <CACz-3riuHWhRXQsdaphDnhLM6zz6eKkc5YrT9=iUk5of+411wA@mail.gmail.com>
In-Reply-To: <CACz-3riuHWhRXQsdaphDnhLM6zz6eKkc5YrT9=iUk5of+411wA@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 29 Oct 2019 09:56:48 +0100
Message-ID: <CAMuHMdWER-r-oFM_17kggVPDb7y2XupLViUPubqTZSQYWjgoqQ@mail.gmail.com>
Subject: FOSDEM (was: Re: Amiga PCMCIA network card support)
To:     Kars de Jong <jongk@linux-m68k.org>
Cc:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        "Andreas 'count' Kotes" 
        <count-vger.kernel.org+linux-m68k@flatline.de>,
        linux-m68k <linux-m68k@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi all,

On Mon, Oct 28, 2019 at 9:27 PM Kars de Jong <jongk@linux-m68k.org> wrote:
> Op ma 28 okt. 2019 om 12:08 schreef John Paul Adrian Glaubitz
> <glaubitz@physik.fu-berlin.de>:
> > But I will be attending FOSDEM and Geert is coming as well (at least he
> > has been to every FOSDEM so far ;)), so we can maybe have a small m68k

Yes, I plan to be there.

> > meeting. I'm coming with two friends who are also Linux hackers.
>
> Would be cool... Last time I went to something like that was the
> Oldenburg meeting of 1998 ;-)

Time to broaden your playfield again ;-)

Note that there will be a retro-computing devroom, for which a talk about
e.g. not letting die Linux on m68k may be a suitable topic.

https://fosdem.org/2020/news/2019-10-01-accepted-developer-rooms/

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
