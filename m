Return-Path: <SRS0=8jjU=AK=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34DD0C433E0
	for <linux-m68k@archiver.kernel.org>; Mon, 29 Jun 2020 19:18:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 25466206A5
	for <linux-m68k@archiver.kernel.org>; Mon, 29 Jun 2020 19:18:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730406AbgF2TSn (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 29 Jun 2020 15:18:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731837AbgF2TRm (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 29 Jun 2020 15:17:42 -0400
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com [IPv6:2607:f8b0:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81D10C0307A0
        for <linux-m68k@lists.linux-m68k.org>; Mon, 29 Jun 2020 08:41:55 -0700 (PDT)
Received: by mail-ot1-x341.google.com with SMTP id 95so5276034otw.10
        for <linux-m68k@lists.linux-m68k.org>; Mon, 29 Jun 2020 08:41:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=18DuSBZeLijFT5byeb07kqFnxpD8Og5k3o71uVKMsdg=;
        b=HqCfr7jiGc967KvJKY1tlSAGBjvIrZwM2/ZmqDz6vvSB7WmzZ7JWIBJqe6zi4OvGtI
         Ig6F+VdGTovFRBJx0Bb8h39mpvvz7HfFiak1/c6K4YL9joDJkZWIDVzzqFtmgFtao5vj
         8foQIii1pVCQZsvRGCYwBYUyFgYE4fKxoac/TOpMDdVwc/lho4SzJOVFI1WRAyGgw96v
         S4LUX4R7KFFM4GXSoD4t/YAZiTjeEWvCUnRYC55JNT97mg71DOcvgbGozHMkYL89Jp/G
         zXxBk67UOAyHLBMI7Rqt1S/Hvmy1PGRnubF9BtE44blnA9Ari4jQI7PyI4QkyxAPBUHt
         NAVA==
X-Gm-Message-State: AOAM533j8dxm9h+ikxDE2onxq26uWELtnrIGZlqpGudi18D1A45XqSyM
        AwYqUDyivgBmahqg8VKP02byr9BAV6B1VrWLfYI=
X-Google-Smtp-Source: ABdhPJyfGDnofAtWY6Vq9zQSiEjHHywgsNVHJzUbnOYeAK8rSOSVeLQNZQAOcMed2+/KO3c+bzP8Q5CiqDzs7aUNX9g=
X-Received: by 2002:a05:6830:1451:: with SMTP id w17mr1238896otp.250.1593445314725;
 Mon, 29 Jun 2020 08:41:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200627143453.31835-1-rppt@kernel.org> <20200627143453.31835-2-rppt@kernel.org>
In-Reply-To: <20200627143453.31835-2-rppt@kernel.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 29 Jun 2020 17:41:43 +0200
Message-ID: <CAMuHMdUOrrrtKuhtWJvzKNNLXY1fx+Ym1oXGN2J_CZ7RqByGHQ@mail.gmail.com>
Subject: Re: [PATCH 1/8] mm: remove unneeded includes of <asm/pgalloc.h>
To:     Mike Rapoport <rppt@kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Abdul Haleem <abdhalee@linux.vnet.ibm.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Andy Lutomirski <luto@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Joerg Roedel <joro@8bytes.org>,
        Max Filippov <jcmvbkbc@gmail.com>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>,
        Stafford Horne <shorne@gmail.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Steven Rostedt <rostedt@goodmis.org>,
        alpha <linux-alpha@vger.kernel.org>,
        Linux-Arch <linux-arch@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-csky@vger.kernel.org,
        "open list:QUALCOMM HEXAGON..." <linux-hexagon@vger.kernel.org>,
        "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        Linux MM <linux-mm@kvack.org>,
        Parisc List <linux-parisc@vger.kernel.org>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        linux-s390 <linux-s390@vger.kernel.org>,
        Linux-sh list <linux-sh@vger.kernel.org>,
        arcml <linux-snps-arc@lists.infradead.org>,
        linux-um <linux-um@lists.infradead.org>,
        "open list:TENSILICA XTENSA PORT (xtensa)" 
        <linux-xtensa@linux-xtensa.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Openrisc <openrisc@lists.librecores.org>,
        sparclinux <sparclinux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Sat, Jun 27, 2020 at 4:35 PM Mike Rapoport <rppt@kernel.org> wrote:
> From: Mike Rapoport <rppt@linux.ibm.com>
>
> In the most cases <asm/pgalloc.h> header is required only for allocations
> of page table memory. Most of the .c files that include that header do not
> use symbols declared in <asm/pgalloc.h> and do not require that header.
>
> As for the other header files that used to include <asm/pgalloc.h>, it is
> possible to move that include into the .c file that actually uses symbols
> from <asm/pgalloc.h> and drop the include from the header file.
>
> The process was somewhat automated using
>
>         sed -i -E '/[<"]asm\/pgalloc\.h/d' \
>                 $(grep -L -w -f /tmp/xx \
>                         $(git grep -E -l '[<"]asm/pgalloc\.h'))
>
> where /tmp/xx contains all the symbols defined in
> arch/*/include/asm/pgalloc.h.
>
> Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>

For the m68k part:
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
