Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 871FEC71153
	for <linux-m68k@archiver.kernel.org>; Mon, 28 Aug 2023 12:23:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229982AbjH1MWr convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 28 Aug 2023 08:22:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231126AbjH1MWg (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Mon, 28 Aug 2023 08:22:36 -0400
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 175E8D8
        for <linux-m68k@vger.kernel.org>; Mon, 28 Aug 2023 05:22:34 -0700 (PDT)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-59209b12c50so39233927b3.0
        for <linux-m68k@vger.kernel.org>; Mon, 28 Aug 2023 05:22:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693225353; x=1693830153;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YYZ0yybWegwUkIUetA2Q6pf5TGRSh+lMt+CtOQ+0ORo=;
        b=FEayf+I26dtXq4foCzBi5SHXj2XVX4fP0mhbSzUrln83oVzg8rqClnlXbnURkUMdcW
         Ln7Q7G5SiOD4VXQswIF/iklmjTBGxpnvqQ8e+wh8zkfe4jSURUMdXvjp+IXEm+A2xbDg
         cOY7rz3iho/Ni4WfWYPQE1tFO/YVfXRbtL3J9QhGW12fngdXvEkHw+0RA3NzQ0rICm6s
         4EQehGiLgFPdHDOPzRriUr1kO/M1gi0Mba84sgAFFF4CQQOJJ1l4mjRUBRruz/o11rmr
         Uwbr7LVQhxeatQd0fNd0MtwV+iaj28H58NOHbb976anToLlCNrWzfHmhIdmWExFe1Bc4
         o8Ng==
X-Gm-Message-State: AOJu0YxTnU1rWPvWj6xl5acffCWoXOaTV9kEKyj90Sp7GP0yM6xu/Puv
        2wCL9ZQ1xHfHg7PAVw18sSv85lW3baoSmg==
X-Google-Smtp-Source: AGHT+IG3ezyix28MTxe+SjfjF1henmQobKjozBy8TYT3Majci12e6DN+/QXG0I/fKxKw26D2CwV9Aw==
X-Received: by 2002:a05:690c:4286:b0:592:8893:3fa1 with SMTP id gj6-20020a05690c428600b0059288933fa1mr9541087ywb.48.1693225353131;
        Mon, 28 Aug 2023 05:22:33 -0700 (PDT)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com. [209.85.219.174])
        by smtp.gmail.com with ESMTPSA id m10-20020a81710a000000b0058bcea54fc2sm2099214ywc.57.2023.08.28.05.22.32
        for <linux-m68k@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Aug 2023 05:22:32 -0700 (PDT)
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-d35a9d7a5bdso2833545276.0
        for <linux-m68k@vger.kernel.org>; Mon, 28 Aug 2023 05:22:32 -0700 (PDT)
X-Received: by 2002:a5b:24f:0:b0:cae:d40f:5934 with SMTP id
 g15-20020a5b024f000000b00caed40f5934mr23366927ybp.27.1693225352261; Mon, 28
 Aug 2023 05:22:32 -0700 (PDT)
MIME-Version: 1.0
References: <e9035006d50933fb02727fa373629cc821784f6c.camel@aura-online.co.uk>
 <10cbcb8a65639f88e7eeb503fd02df172bc46a07.camel@physik.fu-berlin.de>
 <5F114C03-5320-485F-86E3-946A334F16D1@arcor.de> <99aacdf62e82c8c4244e47052d5661df7417a47a.camel@physik.fu-berlin.de>
 <D3BF1EA1-1675-42EB-AF10-592F4C3D5C83@arcor.de>
In-Reply-To: <D3BF1EA1-1675-42EB-AF10-592F4C3D5C83@arcor.de>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 28 Aug 2023 14:22:20 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXbEsqhVoft3xwDiOnALEojnQk=YWASshtx8D_hZTjjVw@mail.gmail.com>
Message-ID: <CAMuHMdXbEsqhVoft3xwDiOnALEojnQk=YWASshtx8D_hZTjjVw@mail.gmail.com>
Subject: Re: Tuple and changes for m68k with -malign-int
To:     Richard <richiezid@arcor.de>
Cc:     debian-68k@lists.debian.org,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        James Le Cuirot <chewi@aura-online.co.uk>,
        libc-help@sourceware.org, linux-m68k <linux-m68k@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Richard,

On Mon, Aug 28, 2023 at 2:12 PM Richard <richiezid@arcor.de> wrote:
> On August 28, 2023 10:57:25 AM UTC, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de> wrote:
> >On Sat, 2023-08-26 at 19:24 +0000, Richard wrote:
> >> > Not only mold but also most notably the following projects:
> >>
> >> a linker that is broken by a slightly unusual alignment isn't exactly a
> >> prime example.. if any project I would expect linkers and binary tools
> >> to pay attention to portability.
> >
> >Portable shouldn't mean having to accommodate for unreasonable design decisions
> >of other developers. It's perfectly fine to assume 32-bit natural alignment on
> >a 32-bit platform and I don't think it's fair to put the burden of adopting for
> >unusual design decisions on to upstream projects.
>
> Assuming anything that is not declared by the c standard is not good imho. The C lang is well known for its pitfalls and the basic binary tools ought not to set bad precedents ignoring those.
>
>  It is also reasonable to assume that on modern hw cache is filled in blocks of perhaps 1k or more and thus "unnatural" alignment might actually help performance because more fits into that one data burst.

"1k" (I assume you mean 1 KiB?) is a bit much...

Note that on several architectures you cannot do unaligned accesses,
so you have to declare such a structure with __attribute__((__packed__)),
and thus not only live with the overhead of doing unaligned accesses
from the D-cache, but also in emulating them in software...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
