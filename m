Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D859C433E0
	for <linux-m68k@archiver.kernel.org>; Sun,  7 Feb 2021 09:47:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0883564DFD
	for <linux-m68k@archiver.kernel.org>; Sun,  7 Feb 2021 09:47:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229548AbhBGJqp (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 7 Feb 2021 04:46:45 -0500
Received: from mail-oi1-f173.google.com ([209.85.167.173]:38257 "EHLO
        mail-oi1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229522AbhBGJqn (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sun, 7 Feb 2021 04:46:43 -0500
Received: by mail-oi1-f173.google.com with SMTP id h6so12581591oie.5
        for <linux-m68k@lists.linux-m68k.org>; Sun, 07 Feb 2021 01:46:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eCzHsHOfsw/92ruMuZqxGmd0Y8mzeC+auWD82Of4Qj4=;
        b=nNyG2l0b5qACnTysTRDQpov227xGOl3Nr8wEJRFuk47Ba+Ls26r5SSxCj9PCQxSXQw
         cklOoF1LwIOLuTeun/7og+5rAR/gJxKP88LLJmQEVEXHkVFdAesTcILHigDyevD/wm1j
         EgkWAlTn2kFamr4DFLtHQDJ/eKIgbDrIaPxG/BN89yg4z9im41qdV34slWy49O0HY/kY
         HZJmAFscrq3tlnr05skyIwrmNv6rGJS1YdcOrgdpROyclAlJ3VM+5/a4ZGtSlgwjyPjx
         RGuzhvgTwKcSu4iqHEx4DaNOvcflzWbQf3LKBfWJkHgPeBu6/W8Qe22d/+mdb8vyRNkK
         nCmw==
X-Gm-Message-State: AOAM530kqJNjsluORFlETVdNRR3ItS3FNI3OKqFIjb24M0YVvOZY3x1H
        cM/5SXkXYpItR4ysehdXCd6909FwcP12pKshVzs=
X-Google-Smtp-Source: ABdhPJwCKZmBf9CKasiV5sqSR6MM4vEWX6alfoIfk5diGVjc45PrwAyDnkunUISqepwXGVYfzTgDqynqUomYuLHwUDQ=
X-Received: by 2002:a54:4e88:: with SMTP id c8mr7876328oiy.148.1612691162656;
 Sun, 07 Feb 2021 01:46:02 -0800 (PST)
MIME-Version: 1.0
References: <baa95d7235921dff23bed6320518f3fa90396603.1612681353.git.fthain@telegraphics.com.au>
 <8e3f7657-7e37-a8f1-ea20-2bd984fccd81@physik.fu-berlin.de>
In-Reply-To: <8e3f7657-7e37-a8f1-ea20-2bd984fccd81@physik.fu-berlin.de>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Sun, 7 Feb 2021 10:45:51 +0100
Message-ID: <CAMuHMdUoHENnX9xDp3awgAxgbNpmKwqAR_MdunUA3O_3gGvK8g@mail.gmail.com>
Subject: Re: [PATCH] m68k: Drop -fno-strength-reduce from KBUILD_CFLAGS
To:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc:     Finn Thain <fthain@telegraphics.com.au>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Adrian,

On Sun, Feb 7, 2021 at 9:51 AM John Paul Adrian Glaubitz
<glaubitz@physik.fu-berlin.de> wrote:
> On 2/7/21 8:02 AM, Finn Thain wrote:
> > References: commit 565bae6a4a8f ("[SCSI] 53c7xx: kill driver")
>
> Does that mean there is currently no driver for the A4091?

Supported by the replacement driver:
45804fbb00eea27b ("[SCSI] 53c700: Amiga Zorro NCR53c710 SCSI")

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
