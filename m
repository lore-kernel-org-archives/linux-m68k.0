Return-Path: <SRS0=1ZKR=6Z=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5A31C54E8D
	for <linux-m68k@archiver.kernel.org>; Mon, 11 May 2020 07:41:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9ED7820736
	for <linux-m68k@archiver.kernel.org>; Mon, 11 May 2020 07:41:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728471AbgEKHlB (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 11 May 2020 03:41:01 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:41704 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725790AbgEKHlA (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 11 May 2020 03:41:00 -0400
Received: by mail-ot1-f66.google.com with SMTP id c3so6768869otp.8
        for <linux-m68k@lists.linux-m68k.org>; Mon, 11 May 2020 00:41:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VS2fk1JcC03oZxkfqvBGknuVzDopGVbMhfQjjlcRALA=;
        b=QLHyaQ+JjcMm4Cbg1ZOHU/XPwWkN7e0A9M36AmTqjFuOqGCe7whz1h44zUyenEsDLO
         7LId8695fIOx+qF4x0K2OjXbXockp+S+N221A6R2H8gnS3vRlua6e63w5RQH/9IW3xni
         G+zNC6CEDtVCUgMeAIwmQPAXALNaZLh8CHlM08fx3zHMoueJP1ifTYZkrStH6gBzEssg
         ogiG40+b8sUufAlVzNI+V2tMf6sYHofLoHQ98iJ42jMxR+fhLSwzYMtyOd8DEt3j2PMp
         6ExjUXAQPpwWj2Ild38bDQwENXpEyAUy1uUvQYR0f/XQqX+cLPk/iWDDlKRdCJNcfR0h
         u8wg==
X-Gm-Message-State: AGi0PuakxwrtmD6g7ruKKVe+h7MQLb/03alEMjm36elMB14OHA1zztTu
        EtX/iGVvis/Q8q9q+PZ4TjAtJSYqqyIZ7wsk1II=
X-Google-Smtp-Source: APiQypLrnA3x0TQgcu4GbQXkWDUyTXgEK7R9Byl6mAxrtqxgZZGXhJd6czCyilOQXM5O9JA2CdYzbDyIV5/QIHKRb9A=
X-Received: by 2002:a9d:63da:: with SMTP id e26mr10878643otl.107.1589182859874;
 Mon, 11 May 2020 00:40:59 -0700 (PDT)
MIME-Version: 1.0
References: <20200510075510.987823-1-hch@lst.de> <20200510075510.987823-32-hch@lst.de>
In-Reply-To: <20200510075510.987823-32-hch@lst.de>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 11 May 2020 09:40:39 +0200
Message-ID: <CAMuHMdU_OxNoKfO=i903kx0mgk0-i2h4u2ase3m9_dn6oFh_5g@mail.gmail.com>
Subject: Re: [PATCH 31/31] module: move the set_fs hack for flush_icache_range
 to m68k
To:     Christoph Hellwig <hch@lst.de>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Roman Zippel <zippel@linux-m68k.org>,
        Jessica Yu <jeyu@kernel.org>, Michal Simek <monstr@monstr.eu>,
        "the arch/x86 maintainers" <x86@kernel.org>,
        alpha <linux-alpha@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-c6x-dev@linux-c6x.org,
        "open list:QUALCOMM HEXAGON..." <linux-hexagon@vger.kernel.org>,
        "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        Openrisc <openrisc@lists.librecores.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        linux-riscv@lists.infradead.org,
        Linux-sh list <linux-sh@vger.kernel.org>,
        sparclinux <sparclinux@vger.kernel.org>,
        Linux-Arch <linux-arch@vger.kernel.org>,
        Linux MM <linux-mm@kvack.org>,
        linux-um <linux-um@lists.infradead.org>,
        "open list:TENSILICA XTENSA PORT (xtensa)" 
        <linux-xtensa@linux-xtensa.org>,
        Linux FS Devel <linux-fsdevel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Sun, May 10, 2020 at 9:57 AM Christoph Hellwig <hch@lst.de> wrote:
>
> flush_icache_range generally operates on kernel addresses, but for some
> reason m68k needed a set_fs override.  Move that into the m68k code
> insted of keeping it in the module loader.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
