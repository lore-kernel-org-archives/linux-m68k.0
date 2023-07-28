Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B01FEB64DD
	for <linux-m68k@archiver.kernel.org>; Fri, 28 Jul 2023 07:21:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234082AbjG1HVu convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 28 Jul 2023 03:21:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234076AbjG1HVt (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 28 Jul 2023 03:21:49 -0400
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A12DF7
        for <linux-m68k@lists.linux-m68k.org>; Fri, 28 Jul 2023 00:21:48 -0700 (PDT)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-577ddda6ab1so25325927b3.0
        for <linux-m68k@lists.linux-m68k.org>; Fri, 28 Jul 2023 00:21:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690528907; x=1691133707;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MFQWxr4NRzXbmAWsfMTrQuDYKbt07QuFKLEJ7ZPHdwg=;
        b=e2Z+Jhqp2uELlIfh5L48fjaN+T7D961Jes0xfePvLfEKB+ZXbF7RP/NPjHlOXJm4ji
         a9QbY33HZcEIgXNmYicMbqmO1LS8K1UMZu9Xk5AtvRa/7sJJ65eGyWApBG793VjuRb3Y
         tVFzrp2XEnP3XI6vzJnzdYLuPiufEauKcIaikUPNCY1SBFhe7O7efDETIPMEB8R/lJhA
         xoxuISGboM0LiXSQEQysOwtfc1/76eI4XnmaFkYdxj8s+9Hh3Y5Hk3g6jU6IeN6f5IS5
         x5Oi9kVXk6mwV32AX7FSq2YnosEAqf24m59oOyk1a2mMf0aMN3C5fMEQfvArb95JjgB6
         RZOw==
X-Gm-Message-State: ABy/qLayXc3Xst8FO0rXn+8adNlNU2OypJkpOdaG/c5oR5t6Ld+Va6+N
        XEHCz10lxo25McCNoZ1TVjrv3jbs3WzyBw==
X-Google-Smtp-Source: APBJJlFkXoG00Toy5JZ5Zs8AshOvKckL+eSXpb12EVuGdsmLSK9jEXElNbKoMTwOfIht6oIx0q00Kw==
X-Received: by 2002:a81:4886:0:b0:577:3f8c:fc60 with SMTP id v128-20020a814886000000b005773f8cfc60mr1275531ywa.1.1690528906957;
        Fri, 28 Jul 2023 00:21:46 -0700 (PDT)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com. [209.85.128.179])
        by smtp.gmail.com with ESMTPSA id h13-20020a816c0d000000b00579e8c7e478sm916484ywc.43.2023.07.28.00.21.46
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Jul 2023 00:21:46 -0700 (PDT)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-5768a7e3adbso43159917b3.0
        for <linux-m68k@lists.linux-m68k.org>; Fri, 28 Jul 2023 00:21:46 -0700 (PDT)
X-Received: by 2002:a0d:d796:0:b0:583:8c61:de8 with SMTP id
 z144-20020a0dd796000000b005838c610de8mr1178620ywd.16.1690528906062; Fri, 28
 Jul 2023 00:21:46 -0700 (PDT)
MIME-Version: 1.0
References: <ZLvZmVfzJNHlPTlJ@sowerbutts.com> <CAMuHMdUU62jjunJh9cqSqHT87B0H0A4udOOPs=WN7WZKpcagVA@mail.gmail.com>
 <1dabd80c-d91e-7869-e95e-199fc58b9f84@linux-m68k.org> <c47f07a9-d302-b8ce-c630-988e08cc8254@gmail.com>
 <ZL5jwoXAU5t8S+E6@sowerbutts.com> <d01db1e6-a0ae-559c-ab64-b3a2f5b60324@gmail.com>
 <997f0ff1-865d-29fb-ef65-2bb693549da8@linux-m68k.org> <288847c5-46bd-fcd4-11a7-829685a02c79@gmail.com>
 <521776cc-a11e-0a3a-b44d-fc051f6ee2ea@linux-m68k.org> <624c5629-e337-46ba-c8ac-411fe19f2f46@gmail.com>
 <81706cdc-2a7a-f383-881a-7313fefbb938@linux-m68k.org>
In-Reply-To: <81706cdc-2a7a-f383-881a-7313fefbb938@linux-m68k.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 28 Jul 2023 09:21:34 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV8LT27Mia-6+tzuCpdLbQAgQnD+h+s+Q14BR9VPgQfww@mail.gmail.com>
Message-ID: <CAMuHMdV8LT27Mia-6+tzuCpdLbQAgQnD+h+s+Q14BR9VPgQfww@mail.gmail.com>
Subject: Re: Linux 6.4.4 on m68k - Q40 - pata_falcon causes oops at boot time
To:     Finn Thain <fthain@linux-m68k.org>
Cc:     Michael Schmitz <schmitzmic@gmail.com>,
        William R Sowerbutts <will@sowerbutts.com>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Richard Zidlicky <rz@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Finn,

On Fri, Jul 28, 2023 at 1:47 AM Finn Thain <fthain@linux-m68k.org> wrote:
> It might be helpful to look for some precedent for this kind of thing
> among the other big-endian platforms with ISA. MIPS Magnum is dual-endian
> but Linux only runs in little-endian mode and the problem doesn't arise.
> But there must be other examples. Maybe CHRP?

The ISA symbol on PPC indeed depends on CHRP.
But e.g. my LongTrail didn't have ISA slots.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
