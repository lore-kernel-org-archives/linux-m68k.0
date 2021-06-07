Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C774CC47082
	for <linux-m68k@archiver.kernel.org>; Mon,  7 Jun 2021 08:44:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A5DAE61105
	for <linux-m68k@archiver.kernel.org>; Mon,  7 Jun 2021 08:44:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231176AbhFGIqs (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 7 Jun 2021 04:46:48 -0400
Received: from mail-vs1-f49.google.com ([209.85.217.49]:39591 "EHLO
        mail-vs1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230374AbhFGIqs (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 7 Jun 2021 04:46:48 -0400
Received: by mail-vs1-f49.google.com with SMTP id z206so8491116vsz.6
        for <linux-m68k@lists.linux-m68k.org>; Mon, 07 Jun 2021 01:44:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NMLFqpyinJNzmHBwsTXpi/IC86W5Z3EEdqUV4Gadqtw=;
        b=NA7hNcMjFjR+MHm/t0Dio2IoErFjlLFw4j4dj+ouhQU4CFwIXnORbozD2xp9VnK4xg
         ygpfs6mEJbcyhfcgqpYFrkirPHMGUaD+oZpP0XRUX6xFEDCnVyU/ZqWdjd/TgUHcVzGj
         oxv6YyCGoAMwZC44MgIg03pL4ae6iZgCFhfld0KS/wMCdurSMfwR7lP5wu1Z9mWBguAU
         rc0Xs4ib8cXqX6+a071f8RrQ7Cy25AvwPJhhDQXv5kS4l6/S4yAtLKuZavE5pBtB8Plx
         T9a9YfbpFkIZLGdpbZV0XJqKCCgtJXeiU9poVHxLjJXD2w6lLwwrtxbRX8bvLy4Wwnt+
         pQGQ==
X-Gm-Message-State: AOAM532cmuQB+SYWmSyUSAUb40cnivq4A40saRBIBuUh1PYxIW+W/DW/
        A8GJhvF+U5mvSNkw7S9lbf1QGCA+oA2/yR2Pojw=
X-Google-Smtp-Source: ABdhPJwMLHirwEQ4tJUPI7qaplUDz3bp0fsmhod8P88K7RhBRU2njU8TgCywfoM2VwxcEnVDrH/bezsBM2ie2giEJTc=
X-Received: by 2002:a05:6102:c4c:: with SMTP id y12mr3863270vss.18.1623055497041;
 Mon, 07 Jun 2021 01:44:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210604064916.26580-1-rppt@kernel.org>
In-Reply-To: <20210604064916.26580-1-rppt@kernel.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 7 Jun 2021 10:44:45 +0200
Message-ID: <CAMuHMdWuOk2LBJunCsCjzjYnBDs1rZh_x=ez7N=gjYv_ETMAcQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/9] Remove DISCINTIGMEM memory model
To:     Mike Rapoport <rppt@kernel.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Jonathan Corbet <corbet@lwn.net>,
        Matt Turner <mattst88@gmail.com>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Richard Henderson <rth@twiddle.net>,
        Vineet Gupta <vgupta@synopsys.com>, kexec@lists.infradead.org,
        alpha <linux-alpha@vger.kernel.org>,
        Linux-Arch <linux-arch@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        Linux MM <linux-mm@kvack.org>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        linux-s390 <linux-s390@vger.kernel.org>,
        Linux-sh list <linux-sh@vger.kernel.org>,
        arcml <linux-snps-arc@lists.infradead.org>,
        "open list:TENSILICA XTENSA PORT (xtensa)" 
        <linux-xtensa@linux-xtensa.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        sparclinux <sparclinux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Mike,

You may want to fix the DISCINTIGMEM typo in the subject for v3, unless
you think that makes tracking series versions more complicated ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
