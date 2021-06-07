Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 348D0C47082
	for <linux-m68k@archiver.kernel.org>; Mon,  7 Jun 2021 08:53:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0D85060E08
	for <linux-m68k@archiver.kernel.org>; Mon,  7 Jun 2021 08:53:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230374AbhFGIz1 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 7 Jun 2021 04:55:27 -0400
Received: from mail-ua1-f49.google.com ([209.85.222.49]:38530 "EHLO
        mail-ua1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230366AbhFGIz0 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 7 Jun 2021 04:55:26 -0400
Received: by mail-ua1-f49.google.com with SMTP id d13so8588143uav.5
        for <linux-m68k@lists.linux-m68k.org>; Mon, 07 Jun 2021 01:53:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=y7XwbZyFAy9rqQo5J7t8DRS+d/mueoOLl5p+cSQb+8Y=;
        b=OtZJ0eQTCq+Wdj0lBQSXQNLLPAZyN7EL8Z1Zu0FJY0D1rV2PIuOfJLw8F3Mr9al+PO
         1gNlT9r330+dJGnL4PrgkGyV0r18Un8mSLKpV+FdpLW7hRhNyeV4ngSNfHFUaCSbVghx
         MvdZSLKW21g7d3FdxNrZHhTY2Msg9bTI5QQ/IuWUysrJlPQ+7zKSvv+og8gfGLcQv0ga
         fFJLCg7HXSLUcWUYsN/Pa7hlikr+m3JwjXOtjAmnQGjo2Elc9hjTa7zD1fmq58H6C7gY
         Fjzym50r1qhFCSIo4aqnGrJd7uYYuMiYhkuv2DiNu4m57krSOsIMzSFHN2xpK3xkwMEc
         UEpw==
X-Gm-Message-State: AOAM532yFxz47k2TJGtbiCwlMSoTF0Hq1C9YBjQ4OxqcDz9gSn2+UM7q
        7lAjOpb+mdiYOlqCa2NRi1g4kw2okX0pGEvfiWw=
X-Google-Smtp-Source: ABdhPJw70xfmNroh3KIu5QGmqKsYwQ+PKLyHQ50n7DeatYgE4iGl6TNz+FWGTOL2BBcrgRRRH99rMYwIPPT469OpB6M=
X-Received: by 2002:ab0:63d9:: with SMTP id i25mr6682382uap.106.1623055999326;
 Mon, 07 Jun 2021 01:53:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210604064916.26580-1-rppt@kernel.org> <20210604064916.26580-9-rppt@kernel.org>
In-Reply-To: <20210604064916.26580-9-rppt@kernel.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 7 Jun 2021 10:53:08 +0200
Message-ID: <CAMuHMdVa29gUQAdHjKh-qDNpOJaoGwXtUkBM2qnOTi1DWV70xA@mail.gmail.com>
Subject: Re: [PATCH v2 8/9] mm: replace CONFIG_NEED_MULTIPLE_NODES with CONFIG_NUMA
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

On Fri, Jun 4, 2021 at 8:50 AM Mike Rapoport <rppt@kernel.org> wrote:
> From: Mike Rapoport <rppt@linux.ibm.com>
>
> After removal of DISCINTIGMEM the NEED_MULTIPLE_NODES and NUMA
> configuration options are equivalent.
>
> Drop CONFIG_NEED_MULTIPLE_NODES and use CONFIG_NUMA instead.
>
> Done with
>
>         $ sed -i 's/CONFIG_NEED_MULTIPLE_NODES/CONFIG_NUMA/' \
>                 $(git grep -wl CONFIG_NEED_MULTIPLE_NODES)
>         $ sed -i 's/NEED_MULTIPLE_NODES/NUMA/' \
>                 $(git grep -wl NEED_MULTIPLE_NODES)
>
> with manual tweaks afterwards.
>
> Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>

Thanks for your patch!

As you dropped the following hunk from v2 of PATCH 5/9, there's now
one reference left of CONFIG_NEED_MULTIPLE_NODES
(plus the discontigmem comment):

-diff --git a/mm/memory.c b/mm/memory.c
-index f3ffab9b9e39157b..fd0ebb63be3304f5 100644
---- a/mm/memory.c
-+++ b/mm/memory.c
-@@ -90,8 +90,7 @@
- #warning Unfortunate NUMA and NUMA Balancing config, growing
page-frame for last_cpupid.
- #endif
-
--#ifndef CONFIG_NEED_MULTIPLE_NODES
--/* use the per-pgdat data instead for discontigmem - mbligh */
-+#ifdef CONFIG_FLATMEM
- unsigned long max_mapnr;
- EXPORT_SYMBOL(max_mapnr);
-

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
