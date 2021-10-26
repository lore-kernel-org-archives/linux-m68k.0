Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 562B2C433EF
	for <linux-m68k@archiver.kernel.org>; Tue, 26 Oct 2021 10:17:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3D2F060295
	for <linux-m68k@archiver.kernel.org>; Tue, 26 Oct 2021 10:17:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235402AbhJZKTZ (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 26 Oct 2021 06:19:25 -0400
Received: from mail-ua1-f46.google.com ([209.85.222.46]:40454 "EHLO
        mail-ua1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235462AbhJZKTB (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 26 Oct 2021 06:19:01 -0400
Received: by mail-ua1-f46.google.com with SMTP id e2so28049917uax.7
        for <linux-m68k@lists.linux-m68k.org>; Tue, 26 Oct 2021 03:16:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eNj0r0yYtbYaRBmFTkNSJ9P/S2xKrXUmhGE0uyRbugk=;
        b=sfkPNTJJ5soatgVkfLWGPgQrUzjs5r+qnUWgahx1waODs2I7lEFBDacpM6c64b6rVs
         O61/3q+rDsj/JZsVqjGON4urJttQQXxpn7RdE9rEwaZqibQ4jiHfQEadyKJwUcG4EyzG
         tJPih6Um9IOZepfr8pndgFBVavA3oyX567Y29/j6svaxYUpR8X+Okmex+IkSOKE3q0kc
         mScGN/zHt00lYqrUT4TgqXWZEnDBTFt/tdMwOWFEVPD+azHuP5t/dh124GsV1l2f369z
         ZRJFbCy++MKP140+S/6JKqWF+ClgkgMYcCTsl/gd7P3gkdDYyw28uQohHwrSN6zUlL0x
         jsqg==
X-Gm-Message-State: AOAM530nh2PJBeOttdgNHWPPMzZgxMXuCYg7yeIh6t90K2JWnk9drEMM
        vCTB2DQ6KQ4159Sl3deVww4UMZfTR14mlQ==
X-Google-Smtp-Source: ABdhPJx/IHZLVhN6/2Y9TpQHpBZjuAkDk+gZPs0qF21eaTv3cZCN7ShuqLtzanrauvcHkNwByZZymQ==
X-Received: by 2002:a9f:3523:: with SMTP id o32mr14952876uao.131.1635243397531;
        Tue, 26 Oct 2021 03:16:37 -0700 (PDT)
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com. [209.85.221.174])
        by smtp.gmail.com with ESMTPSA id q127sm164757vkh.44.2021.10.26.03.16.37
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Oct 2021 03:16:37 -0700 (PDT)
Received: by mail-vk1-f174.google.com with SMTP id u130so6665582vku.2
        for <linux-m68k@lists.linux-m68k.org>; Tue, 26 Oct 2021 03:16:37 -0700 (PDT)
X-Received: by 2002:a67:f84d:: with SMTP id b13mr18437374vsp.41.1635243386319;
 Tue, 26 Oct 2021 03:16:26 -0700 (PDT)
MIME-Version: 1.0
References: <20211026100432.1730393-1-arnd@kernel.org> <20211026100432.1730393-2-arnd@kernel.org>
In-Reply-To: <20211026100432.1730393-2-arnd@kernel.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 26 Oct 2021 12:16:15 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW0RPpbmCaixYTdKFLPTZGp=3WycHK1xiyryKku45f6_A@mail.gmail.com>
Message-ID: <CAMuHMdW0RPpbmCaixYTdKFLPTZGp=3WycHK1xiyryKku45f6_A@mail.gmail.com>
Subject: Re: [PATCH 2/2] futex: remove futex_cmpxchg detection
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Peter Zijlstra <peterz@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Arnd Bergmann <arnd@arndb.de>,
        Vineet Gupta <vgupta@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Heiko Carstens <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>, Jeff Dike <jdike@addtoit.com>,
        Richard Weinberger <richard@nod.at>,
        Anton Ivanov <anton.ivanov@cambridgegreys.com>,
        Chris Zankel <chris@zankel.net>,
        Max Filippov <jcmvbkbc@gmail.com>,
        Darren Hart <dvhart@infradead.org>,
        Davidlohr Bueso <dave@stgolabs.net>,
        =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@collabora.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Mike Rapoport <rppt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        arcml <linux-snps-arc@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-csky@vger.kernel.org,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        linux-s390 <linux-s390@vger.kernel.org>,
        Linux-sh list <linux-sh@vger.kernel.org>,
        linux-um <linux-um@lists.infradead.org>,
        "open list:TENSILICA XTENSA PORT (xtensa)" 
        <linux-xtensa@linux-xtensa.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Tue, Oct 26, 2021 at 12:06 PM Arnd Bergmann <arnd@kernel.org> wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>
> Now that all architectures have a working futex implementation
> in any configuration, remove the runtime detection code.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

>  arch/m68k/Kconfig             |  1 -

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
