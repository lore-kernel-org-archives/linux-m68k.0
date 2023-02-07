Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19ED8C636D4
	for <linux-m68k@archiver.kernel.org>; Tue,  7 Feb 2023 16:12:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232401AbjBGQMZ (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 7 Feb 2023 11:12:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232589AbjBGQMI (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 7 Feb 2023 11:12:08 -0500
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92CD5E3AA
        for <linux-m68k@lists.linux-m68k.org>; Tue,  7 Feb 2023 08:11:55 -0800 (PST)
Received: by mail-qt1-f174.google.com with SMTP id cr22so17216371qtb.10
        for <linux-m68k@lists.linux-m68k.org>; Tue, 07 Feb 2023 08:11:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IKpFmPELNxMbbdNEgrdFiGaCVQckx4xSvoILv5TiVp4=;
        b=w6dPjK6VklHKTUkoyqPUQ6X2jKy58TA6rUZKFLVJSkjUGwXGutJTGmV4StKnYJnvR/
         rxCWEtaGnB1KHdebimY36bR7VuFBkwIahKRiw2OFXsTcLy1jqY32Dm+mj74N/OZbsN4M
         VBLnMcnLPVCP0rYir1jGUNq2iOU4CYYYelHn3+b6/RAYsOo/rTvwsJLgg33fhd0sTnd7
         VZmLM6xwOCSIUwx9k3t4/iaRu25dhAzgRFMTdMr9/DhCemx0FL/D9WCk7JkIKQuG6ItL
         z7HcQjhBTczXiP69ay1w+jSxHzcbUhgxPFCeheNhT5UdNEuouTrKWXRzmMvrQ9a3/cFH
         jLdA==
X-Gm-Message-State: AO0yUKWyom3Yl55VsmJNdBiurxGNjsBF1zvJhNV+60YijzHbj8qrqhp8
        1vqUbF1VheN1Zs+yoQY4lUZBlVrEqqmjsg==
X-Google-Smtp-Source: AK7set+FD9WGXqEUbl+EqsVqZKvtIuC66ZfG/sqZ5IFtWMwYMXamWL4eyEkR1uiq2+HdVIl3U1nl3g==
X-Received: by 2002:ac8:5f92:0:b0:3b9:ba79:80d7 with SMTP id j18-20020ac85f92000000b003b9ba7980d7mr6682283qta.12.1675786314373;
        Tue, 07 Feb 2023 08:11:54 -0800 (PST)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com. [209.85.128.169])
        by smtp.gmail.com with ESMTPSA id z20-20020ac87f94000000b003b9b8ec742csm9798370qtj.14.2023.02.07.08.11.53
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Feb 2023 08:11:53 -0800 (PST)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-501c3a414acso201921937b3.7
        for <linux-m68k@lists.linux-m68k.org>; Tue, 07 Feb 2023 08:11:53 -0800 (PST)
X-Received: by 2002:a0d:f444:0:b0:526:78ad:bb15 with SMTP id
 d65-20020a0df444000000b0052678adbb15mr382260ywf.47.1675786312866; Tue, 07 Feb
 2023 08:11:52 -0800 (PST)
MIME-Version: 1.0
References: <Y9lz6yk113LmC9SI@ZenIV> <Y9l02DvS6CYThTEG@ZenIV>
In-Reply-To: <Y9l02DvS6CYThTEG@ZenIV>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 7 Feb 2023 17:11:40 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVQusKr_W4dnQzVSWbav7vooCHbiyOQHbnraJCL16bsDQ@mail.gmail.com>
Message-ID: <CAMuHMdVQusKr_W4dnQzVSWbav7vooCHbiyOQHbnraJCL16bsDQ@mail.gmail.com>
Subject: Re: [PATCH 09/10] riscv: fix livelock in uaccess
To:     Al Viro <viro@zeniv.linux.org.uk>
Cc:     linux-arch@vger.kernel.org, linux-alpha@vger.kernel.org,
        linux-ia64@vger.kernel.org, linux-hexagon@vger.kernel.org,
        linux-m68k@lists.linux-m68k.org, Michal Simek <monstr@monstr.eu>,
        Dinh Nguyen <dinguyen@kernel.org>,
        openrisc@lists.librecores.org, linux-parisc@vger.kernel.org,
        linux-riscv@lists.infradead.org, sparclinux@vger.kernel.org,
        Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Tue, Jan 31, 2023 at 9:07 PM Al Viro <viro@zeniv.linux.org.uk> wrote:
> riscv equivalent of 26178ec11ef3 "x86: mm: consolidate VM_FAULT_RETRY handling"
> If e.g. get_user() triggers a page fault and a fatal signal is caught, we might
> end up with handle_mm_fault() returning VM_FAULT_RETRY and not doing anything
> to page tables.  In such case we must *not* return to the faulting insn -
> that would repeat the entire thing without making any progress; what we need
> instead is to treat that as failed (user) memory access.
>
> Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>

Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
