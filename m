Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51CD5C001B0
	for <linux-m68k@archiver.kernel.org>; Wed, 16 Aug 2023 15:44:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236017AbjHPPnr convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 16 Aug 2023 11:43:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344414AbjHPPno (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 16 Aug 2023 11:43:44 -0400
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE1DF2D54
        for <linux-m68k@lists.linux-m68k.org>; Wed, 16 Aug 2023 08:43:24 -0700 (PDT)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-583b3aa4f41so69430087b3.2
        for <linux-m68k@lists.linux-m68k.org>; Wed, 16 Aug 2023 08:43:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692200578; x=1692805378;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jS0Ir3BurK0CGHkxbuP8affn5Kxq0PiiVgp+Xnqctvs=;
        b=UJBGdMsR7RoGBzY5J0Q9PVFoGz5W9f0e9u27kAnyngn+98QzDD71mXphIPFhobeYQ5
         80oN2ONLLIAZreHhdST+73P/rGWl1nx/QhjBZLY7mBU3xiha+en7f/m2INAV9gesZ+6C
         XznqL7X6jvt9RTUBH0snmM2SWlU19z3z0N/Ak5WIM2IqcsHNqW0xYohBCm48iMC3bTk5
         wNR9dBglyjVFhVgxzYGgeJI5oYvCs07sSk0spUdqEs2TYLh8ciPrKvH/btB5D2hu+xq2
         TKVVm71yhktdSQ6bgcW0H2oZJgbPQhyO8mX275Pt0/8Neb7Uj15zUiIp4qLC9Q/Ng3rs
         w0og==
X-Gm-Message-State: AOJu0Yycnv+LbodUpVejiKPnbLa1ZmKOrHN2GUIq8uIshoX+kihxtPpD
        /B5qnxAK6y8+lh83qkuPBmPMJmN8TpzU/g==
X-Google-Smtp-Source: AGHT+IG+vRceUnMXsZgm2COygThq49NWli83uK3ZApaNJI6/TiRWdw5ZefVSE+xbhIsT185lBeX1yQ==
X-Received: by 2002:a81:4a41:0:b0:583:69b4:c75a with SMTP id x62-20020a814a41000000b0058369b4c75amr1927414ywa.21.1692200578287;
        Wed, 16 Aug 2023 08:42:58 -0700 (PDT)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com. [209.85.219.174])
        by smtp.gmail.com with ESMTPSA id s131-20020a815e89000000b0057087e7691bsm4091176ywb.56.2023.08.16.08.42.58
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Aug 2023 08:42:58 -0700 (PDT)
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-d4b74a4a6daso6590089276.2
        for <linux-m68k@lists.linux-m68k.org>; Wed, 16 Aug 2023 08:42:58 -0700 (PDT)
X-Received: by 2002:a25:b292:0:b0:d72:a54d:4b7 with SMTP id
 k18-20020a25b292000000b00d72a54d04b7mr561479ybj.1.1692200577772; Wed, 16 Aug
 2023 08:42:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230809211057.60514-1-arnd@kernel.org> <20230809211057.60514-2-arnd@kernel.org>
In-Reply-To: <20230809211057.60514-2-arnd@kernel.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 16 Aug 2023 17:42:45 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUbVugY9rz1ZBLri154k7Sna59tHx_5O1V1wfXDwQzKSw@mail.gmail.com>
Message-ID: <CAMuHMdUbVugY9rz1ZBLri154k7Sna59tHx_5O1V1wfXDwQzKSw@mail.gmail.com>
Subject: Re: [PATCH 2/2] m68k: add memcmp() declarartion
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Arnd Bergmann <arnd@arndb.de>, linux-m68k@lists.linux-m68k.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Arnd,

On Wed, Aug 9, 2023 at 11:11 PM Arnd Bergmann <arnd@kernel.org> wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>
> There is a global definition of memcmp() that gets built on m68k but is never
> used and causes a warning because of the missing prototype:
>
> lib/string.c:671:15: error: no previous prototype for 'memcmp' [-Werror=missing-prototypes]
>
> Add the corresponding declaration to avoid the warning. As far as I understand
> the #define to redirect memcmp() to __builtin_memcmp() does not actually do anything
> here since this is what it does anyway.

I believe it does with -ffreestanding?
So if you don't mind, I'd like to apply this with that sentence removed.

x86 also still has that define in string_32.h.
Andi dropped it for amd64 in commit 6edfba1b33c70110
("[PATCH] x86_64: Don't define string functions to builtin")
in v2.6.17.

> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
i.e. will queue in the m68k for-v6.6 branch, with the obvious typo fixed.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
