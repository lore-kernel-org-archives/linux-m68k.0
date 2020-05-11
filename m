Return-Path: <SRS0=1ZKR=6Z=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58EC1C54E8F
	for <linux-m68k@archiver.kernel.org>; Mon, 11 May 2020 07:38:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 42C3F206B9
	for <linux-m68k@archiver.kernel.org>; Mon, 11 May 2020 07:38:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728638AbgEKHiq (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 11 May 2020 03:38:46 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:34917 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728573AbgEKHii (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 11 May 2020 03:38:38 -0400
Received: by mail-ot1-f65.google.com with SMTP id k110so6791906otc.2
        for <linux-m68k@lists.linux-m68k.org>; Mon, 11 May 2020 00:38:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aNoZEZ57CrI9/0G/8w94E+hwvPuAlWx38MUKzKDQBhc=;
        b=eWUJXHUvs0mLfiiUt35hk6TMmzQEZieZb+wCpsBmMfBH/dsajsDheJf/JSvfyZ7/oW
         FZ6XbfzwyQbsMzyPYR9IeDXgtoSoIUJCrVt+SBGzE5OaBy/XUXnoY1rag+Q9joHXF40r
         Ul3HKcf92I8QeBF7TZbgQuXcP/LQ1vEYy7sjlFoVssMh+He4zvrZxuHx4OWv6/+aVs+r
         XDwnzp0lhuwkEmZm3pBrP7JgH8p5z3ydmpurg2b30vMaOuJ+i/bY3FeC/J1wJTm6Knev
         kMb1X7JTKOdKehUyXXFW0WSpklYFDPcrKSuoJB/NjPGwyWub6ztzePzZRFVTfATxeZ5L
         6mbQ==
X-Gm-Message-State: AGi0PubWv397Fy3Oq6nLPDsBNDRdpGXZLiml+cilpmMXVYo5ovcNGQl8
        4EPBOKQoJDDh0FRY6bmr6t2IvKoQLlWa5cPjwAg=
X-Google-Smtp-Source: APiQypLoBt4t5N0l098m7w2IDSx4KyTJchn19q3bmw0+va1jJpmuNmPwj2oo62ETWA1hKW2oSkbgdMOlQ069s61RJoI=
X-Received: by 2002:a9d:63da:: with SMTP id e26mr10874719otl.107.1589182716617;
 Mon, 11 May 2020 00:38:36 -0700 (PDT)
MIME-Version: 1.0
References: <20200510075510.987823-1-hch@lst.de> <20200510075510.987823-27-hch@lst.de>
In-Reply-To: <20200510075510.987823-27-hch@lst.de>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 11 May 2020 09:38:25 +0200
Message-ID: <CAMuHMdUTAA_mkS-KY70ykr-n-UJxfqM09EYcVQVKA4+FSkC1Og@mail.gmail.com>
Subject: Re: [PATCH 26/31] m68k: implement flush_icache_user_range
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
> Rename the current flush_icache_range to flush_icache_user_range as
> per commit ae92ef8a4424 ("PATCH] flush icache in correct context") there
> seems to be an assumption that it operates on user addresses.  Add a
> flush_icache_range around it that for now is a no-op.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
