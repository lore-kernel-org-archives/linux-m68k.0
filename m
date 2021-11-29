Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBF0FC433F5
	for <linux-m68k@archiver.kernel.org>; Mon, 29 Nov 2021 10:09:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235152AbhK2KMu (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 29 Nov 2021 05:12:50 -0500
Received: from mail-vk1-f182.google.com ([209.85.221.182]:38470 "EHLO
        mail-vk1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236596AbhK2KKt (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 29 Nov 2021 05:10:49 -0500
Received: by mail-vk1-f182.google.com with SMTP id s17so10633353vka.5
        for <linux-m68k@lists.linux-m68k.org>; Mon, 29 Nov 2021 02:07:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GVFNfQPdN79DFaiM4xA6K3MbJdiYsXlejmisa39lhE8=;
        b=pwg5EHi/eOrEN+EuovvRtPwFkOWIDuUZASAVjaOCd/zcTKaGKjCbGP7sYXIFe9Rejw
         v0ysuweiGjANuLT/EVngk1PoeMOGxEOWjDtaIvdqAnCBTWQxrfzS9N5eZ8dX4HwVGDBM
         rGbc73pViI4iCpINK87I+Jv8Svh54PA4Tzu6KCRl+6Nae8yZdWiR2VD2ZPjuFOoS8Wk1
         u+1KdsDel+C2HlwYN1REdeHeZitHGVyeKrXzZUMx5MWuiPvPnXkUkuDk9qKGqclmTSJ9
         nzPQ+PQYEUI7mwYCuvhVHMcQXWdEWoieZpNtj8B6iM2dOHp/lm0U0x8462Vb10+94YMq
         vxSA==
X-Gm-Message-State: AOAM530k2k9mtyv/+WUPhz36yDERIxrY07+VSa7r9xlCxXGmXfkGYEun
        FK7r6JNizz78rjdYYhq3UnBjGYTJIeEBkw==
X-Google-Smtp-Source: ABdhPJzMSE5lk5HNl+bVDUzBietgVF5D4MVfzATy6uM/qCJYtBvV5GIhR886OXuN00Hf1BjUiplGqg==
X-Received: by 2002:a05:6122:201e:: with SMTP id l30mr34645596vkd.10.1638180451713;
        Mon, 29 Nov 2021 02:07:31 -0800 (PST)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com. [209.85.222.48])
        by smtp.gmail.com with ESMTPSA id r24sm8209476vsn.1.2021.11.29.02.07.30
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Nov 2021 02:07:31 -0800 (PST)
Received: by mail-ua1-f48.google.com with SMTP id az37so32749813uab.13
        for <linux-m68k@lists.linux-m68k.org>; Mon, 29 Nov 2021 02:07:30 -0800 (PST)
X-Received: by 2002:a67:c106:: with SMTP id d6mr31358268vsj.77.1638180450870;
 Mon, 29 Nov 2021 02:07:30 -0800 (PST)
MIME-Version: 1.0
References: <8170fe1d1c62426d82275d36ba409ecc18754292.1637274578.git.fthain@linux-m68k.org>
In-Reply-To: <8170fe1d1c62426d82275d36ba409ecc18754292.1637274578.git.fthain@linux-m68k.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 29 Nov 2021 11:07:19 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUFZkFkDaxHx-hbXhZAk2B-J_sprtEz=S8AYf9wJgH1pg@mail.gmail.com>
Message-ID: <CAMuHMdUFZkFkDaxHx-hbXhZAk2B-J_sprtEz=S8AYf9wJgH1pg@mail.gmail.com>
Subject: Re: [PATCH v3] m68k: Enable memtest functionality
To:     Finn Thain <fthain@linux-m68k.org>
Cc:     Mike Rapoport <rppt@kernel.org>, Sam Creasey <sammy@sammy.net>,
        Jonathan Corbet <corbet@lwn.net>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Thu, Nov 18, 2021 at 11:32 PM Finn Thain <fthain@linux-m68k.org> wrote:
> Enable the memtest functionality and rearrange some code to prevent it
> from clobbering the initrd.
>
> The code to implement CONFIG_BLK_DEV_INITRD was conditional on
> !defined(CONFIG_SUN3). For simplicity, remove that test on the basis
> that m68k_ramdisk.size == 0 on Sun 3. The SLIME source code at
> http://sammy.net/sun3/ftp/pub/m68k/sun3/slime/slime-2.0.tar.gz
> indicates that no BI_RAMDISK entry is ever passed to the kernel due
> to #ifdef 0 around the relevant code.
>
> Cc: Mike Rapoport <rppt@kernel.org>
> Cc: Sam Creasey <sammy@sammy.net>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Signed-off-by: Finn Thain <fthain@linux-m68k.org>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
i.e. will queue in the m68k for-v5.17 branch.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
