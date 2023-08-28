Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79985C71153
	for <linux-m68k@archiver.kernel.org>; Mon, 28 Aug 2023 11:41:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231820AbjH1LlW convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 28 Aug 2023 07:41:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230151AbjH1Lk4 (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Mon, 28 Aug 2023 07:40:56 -0400
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D9E9C7
        for <linux-m68k@vger.kernel.org>; Mon, 28 Aug 2023 04:40:54 -0700 (PDT)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-58d41109351so56260857b3.1
        for <linux-m68k@vger.kernel.org>; Mon, 28 Aug 2023 04:40:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693222853; x=1693827653;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9kLDek6rTtjhc6OgnX07j3j3zBhAPaVZMgw7x1dkhgE=;
        b=WIU/5uFBLvMIyx80PNCVzP2uf0shBLULh+1fySiJU2vqGs5gRQpTW8glZIZeybpPlG
         Sb+DYyQBD7VTTVkoqVB6tS6hwRzIHcgfAg9wy6oeANaTxD0BQmIt0cIk3DnrOaZaRrix
         7OJGFwYSFhiYmqw47kOK8q7K1/bdUne4KUAZespIX5ADsJh0ee52IZXMuxWANZddN73s
         bOo37M0bk+lbx+BagcHPfugD/ETSqEKrmxZCmhNoi2xV5kc3/kXMPiDZt5oawK1VWoQQ
         sBmD+dTMPf2kMhLksz7jAPXX/Zt1tfY9/vFQauHGUC/yVFDkBIOpXp/Z3XsZHjKfmicl
         +Fdw==
X-Gm-Message-State: AOJu0YyDtw/ocUXsqhHX0+Jid0YNLkM7KNc2WJIp911BY6fNd2rlxvRX
        qbim/8anMco/bsS5aCdzVScvy5F/BIXnGw==
X-Google-Smtp-Source: AGHT+IFdj8DDpfgEE2mVZDYus2uUOC8buJh0Bh8v2BCYkBpVSFdRzMTZpmflm1KIifDmcIf1RuebcA==
X-Received: by 2002:a81:9290:0:b0:58e:c394:37c9 with SMTP id j138-20020a819290000000b0058ec39437c9mr22741898ywg.10.1693222853207;
        Mon, 28 Aug 2023 04:40:53 -0700 (PDT)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com. [209.85.219.171])
        by smtp.gmail.com with ESMTPSA id a6-20020a81bb46000000b00590f25ef8afsm2063511ywl.43.2023.08.28.04.40.52
        for <linux-m68k@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Aug 2023 04:40:52 -0700 (PDT)
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-d748d8cf074so5600914276.0
        for <linux-m68k@vger.kernel.org>; Mon, 28 Aug 2023 04:40:52 -0700 (PDT)
X-Received: by 2002:a25:f81b:0:b0:d4b:f497:c869 with SMTP id
 u27-20020a25f81b000000b00d4bf497c869mr22123150ybd.8.1693222851829; Mon, 28
 Aug 2023 04:40:51 -0700 (PDT)
MIME-Version: 1.0
References: <e9035006d50933fb02727fa373629cc821784f6c.camel@aura-online.co.uk>
 <10cbcb8a65639f88e7eeb503fd02df172bc46a07.camel@physik.fu-berlin.de>
 <80a52487-3105-ed5b-a1eb-ec1a0689ef21@linux-m68k.org> <751c83150533b701d66ac24c8fe81863cf5eab98.camel@aura-online.co.uk>
 <CAMuHMdUV0oM=zp6dG0KNbPJz2m7KBhynHa=ENUJmfh=u3gisbg@mail.gmail.com> <BEE12C98-6C32-4ECE-888F-EC01D4E5BCFD@arcor.de>
In-Reply-To: <BEE12C98-6C32-4ECE-888F-EC01D4E5BCFD@arcor.de>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 28 Aug 2023 13:40:39 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUbqEynODaEsmNPO_7Os9hw-jsAr0FrF4E7e=OePgvJ3Q@mail.gmail.com>
Message-ID: <CAMuHMdUbqEynODaEsmNPO_7Os9hw-jsAr0FrF4E7e=OePgvJ3Q@mail.gmail.com>
Subject: Re: Tuple and changes for m68k with -malign-int
To:     Richard <richiezid@arcor.de>
Cc:     debian-68k@lists.debian.org,
        James Le Cuirot <chewi@aura-online.co.uk>,
        Finn Thain <fthain@linux-m68k.org>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        libc-help@sourceware.org, linux-m68k <linux-m68k@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Richard,

On Mon, Aug 28, 2023 at 1:27 PM Richard <richiezid@arcor.de> wrote:
> On August 28, 2023 7:00:07 AM UTC, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> >On Sun, Aug 27, 2023 at 11:36 AM James Le Cuirot
> ><chewi@aura-online.co.uk> wrote:
> >> On Sun, 2023-08-27 at 10:46 +1000, Finn Thain wrote:
> >> > Moreover, why is it that only a few developers have a problem with making
> >> > explicit their decisions regarding alignment of shorts? What actual pain
> >> > does it cause them to accept a patch to make their struct layouts plain?
> >>
> >> Some projects do accept patches. Yann Collet was even kind enough to fix this
> >> in zstd themselves. On the other hand, we have had to fight to stop Python
> >> from dropping m68k support entirely. The real problem is the effort required
> >> to produce these patches. I haven't been able to wrap my head around this so
> >> far, but I would still like to learn. I could see myself eventually fixing
> >> mold, but LLVM feels like a very tall order.
> >
> >Perhaps we need a new compiler warning: "hole in structure due to
> >non-natural alignment, please consider adding explicit padding"?
>
> Sounds reasonable but I am afraid in 99% of cases this would be completely irrelevant and not break anything so the acceptance would be pretty low.
>
> The problem arises only when people start doing "strange" things with such structs. Can we define strange things in a better way? It appears to me all modern c standards somewhat lack an attribute to mark a struct as being "special use" and thus emit more warnings and avoid some kinds of trickery.

Do you consider

    struct foo {
            short x;
            int y;
    } bar;

a "strange" thing? In se it's not strange.

Unless someone starts doing:

     assert(sizeof(struct foo) == 8);

or:

    write(fd, &bar, sizeof(bar));

and expects this to be portable/interoperable (ignoring endianness
for now).

IIRC, there are similar issues with the alignment of long long and double
on some 32-bit platforms, where they would not be aligned naturally.

In Linux userspace APIs, we always[*] use natural alignment and
explicit padding.

[*] try to.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
