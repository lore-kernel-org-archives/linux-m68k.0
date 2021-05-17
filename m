Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DC3BC433B4
	for <linux-m68k@archiver.kernel.org>; Mon, 17 May 2021 07:50:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4E203611ED
	for <linux-m68k@archiver.kernel.org>; Mon, 17 May 2021 07:50:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235232AbhEQHvP (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 17 May 2021 03:51:15 -0400
Received: from mail-ua1-f48.google.com ([209.85.222.48]:40931 "EHLO
        mail-ua1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235161AbhEQHvO (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 17 May 2021 03:51:14 -0400
Received: by mail-ua1-f48.google.com with SMTP id z14so713250uan.7
        for <linux-m68k@lists.linux-m68k.org>; Mon, 17 May 2021 00:49:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Wm1leRczzFOwOFaSNT2IC1vyfbeH7BGd9FvIHYCsh/w=;
        b=oGXPrGSuZBbQTOzhsyOBev0FGxKcneACG/xUg1te6sdVIticQ1cGfVy3j2UJbkobBb
         UaFICR6qsGDpGJezfGmE9Px9GApCfnR53MAIb4qVBv9vbdJROvq0b4eVazsA9JOc35sq
         vWMlj4zD34mtQVk1L54+0qXCgRAKzWocop4AqrkcLbeLGzA613JXDYqviVj/QusKA3PZ
         pK4sSi7+FMZ2jpotW/75qv/aJn98W+KuuzOPKAygsU8k2tf4JaZ0FgCw0Qy7VOs4/6m9
         8i9gA6s8TmDnfaU+UG2zPbdDovkJQX4Mc/PFH1q4OmaWg50lukE0sskqdbC9dp+bP/A5
         VK4Q==
X-Gm-Message-State: AOAM531GHyHRCPQkZiPQU5wcsdO9eLX0aCSqGuib/wJnpJwul5Sd1maI
        lIzmp8P8iAdKohqooy8iw6Icutu1EmJ+wQ6YFX4=
X-Google-Smtp-Source: ABdhPJxMkbz10U6Jg7YSgioxoN/77aKbpd9YpL153uII/i6U1HGzQThHJEqUHqKW1WMKKAc41kkz+IhZpWsMRXHngY4=
X-Received: by 2002:ab0:f5:: with SMTP id 108mr16323124uaj.106.1621237797742;
 Mon, 17 May 2021 00:49:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210514220942.879805-1-arnd@kernel.org> <20210514220942.879805-5-arnd@kernel.org>
In-Reply-To: <20210514220942.879805-5-arnd@kernel.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 17 May 2021 09:49:45 +0200
Message-ID: <CAMuHMdXPWdNqeeyCuKheOyTT-DSqrhKQyotmY5YBhdbz-VgfwA@mail.gmail.com>
Subject: Re: [PATCH 4/5] asm-generic: uaccess: remove inline strncpy_from_user/strnlen_user
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Linux-Arch <linux-arch@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Christoph Hellwig <hch@lst.de>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Vineet Gupta <vgupta@synopsys.com>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Brian Cain <bcain@codeaurora.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Jeff Dike <jdike@addtoit.com>,
        Richard Weinberger <richard@nod.at>,
        Anton Ivanov <anton.ivanov@cambridgegreys.com>,
        Sid Manning <sidneym@codeaurora.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Mike Rapoport <rppt@kernel.org>,
        arcml <linux-snps-arc@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "moderated list:H8/300 ARCHITECTURE" 
        <uclinux-h8-devel@lists.sourceforge.jp>,
        "open list:QUALCOMM HEXAGON..." <linux-hexagon@vger.kernel.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        linux-um <linux-um@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Sat, May 15, 2021 at 12:11 AM Arnd Bergmann <arnd@kernel.org> wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>
> Consolidate the asm-generic implementation with the library version
> that is used everywhere else.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

>  arch/m68k/Kconfig             |  4 +--

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
