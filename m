Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55D4DC433EF
	for <linux-m68k@archiver.kernel.org>; Mon, 11 Apr 2022 09:56:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344874AbiDKJ6Z (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 11 Apr 2022 05:58:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244721AbiDKJ6Y (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 11 Apr 2022 05:58:24 -0400
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EB184131B
        for <linux-m68k@lists.linux-m68k.org>; Mon, 11 Apr 2022 02:56:11 -0700 (PDT)
Received: by mail-qt1-f169.google.com with SMTP id s7so15805653qtk.6
        for <linux-m68k@lists.linux-m68k.org>; Mon, 11 Apr 2022 02:56:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=O7QWdPF9wFARWEpFmkRlF+ejhR6FxhyYYT3eOvfg8Zw=;
        b=5vwaowGMHzswx4moxNGwxZZfIw5rGzLSoBaVMKDMRkc9ApzKd81Znk2MhARlZdHOIr
         M9PX40BoPAf486Kn5kjKQ0TM3PdyHJSFzQNURLxGXNGcAxXjiIZRvmA1ovm0bTpFe6mi
         HXRbf3nanugJrC/0y8PWqufF01V3ph25vXlqZhJosJbi1jBhU9HH4R5PRabyTWd2f3vR
         MMeVqwE55arKmBb3kGb4KwpsrAjVkXj751S7wHxoKfdqgMB/H3BoHHLmRkcZzESXwrZf
         D0Ghn8u8WwqxA8lM7PcMiJmFVG0lX6wIHD6aZYnerVH9/IJ0CqpduYvmKJEEZbGJ3u70
         lZfQ==
X-Gm-Message-State: AOAM533R894kRZ/+tDx1mUAhJZSwPhJxhtmNJ9TRZU3Pm0PLhka87PL5
        cVi6+OmpjQGRTB0Ynhg/OjDuQw4T7XAMvw==
X-Google-Smtp-Source: ABdhPJxliVinc1UmS23ORrFSLqdOleF3lSxmui8JZmo71ZbAKAjqlqcQfKqKLOZGSDYFP2I0gGsxyw==
X-Received: by 2002:a05:622a:4ce:b0:2e1:e18f:5b33 with SMTP id q14-20020a05622a04ce00b002e1e18f5b33mr24603897qtx.565.1649670969745;
        Mon, 11 Apr 2022 02:56:09 -0700 (PDT)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com. [209.85.219.176])
        by smtp.gmail.com with ESMTPSA id s19-20020a05622a179300b002e1ceeb21d0sm25109398qtk.97.2022.04.11.02.56.08
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Apr 2022 02:56:08 -0700 (PDT)
Received: by mail-yb1-f176.google.com with SMTP id g34so6543368ybj.1
        for <linux-m68k@lists.linux-m68k.org>; Mon, 11 Apr 2022 02:56:08 -0700 (PDT)
X-Received: by 2002:a05:6902:101:b0:633:ccde:cfca with SMTP id
 o1-20020a056902010100b00633ccdecfcamr21144323ybh.207.1649670968330; Mon, 11
 Apr 2022 02:56:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220406201523.243733-1-laurent@vivier.eu>
In-Reply-To: <20220406201523.243733-1-laurent@vivier.eu>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 11 Apr 2022 11:55:57 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWkPcHW3Ba19giDHJC6g-GNmQ7HnZAavutxh3q_ZF5y6Q@mail.gmail.com>
Message-ID: <CAMuHMdWkPcHW3Ba19giDHJC6g-GNmQ7HnZAavutxh3q_ZF5y6Q@mail.gmail.com>
Subject: Re: [PATCH v16 0/4] m68k: Add Virtual M68k Machine
To:     Laurent Vivier <laurent@vivier.eu>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-rtc@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        John Stultz <john.stultz@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Alessandro Zummo <a.zummo@towertech.it>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Wed, Apr 6, 2022 at 10:15 PM Laurent Vivier <laurent@vivier.eu> wrote:
> The most powerful m68k machine emulated by QEMU is a Quadra 800,
> but this machine is very limited: only 1 GiB of memory and only some
> specific interfaces, with no DMA.
>
> The Virtual M68k Machine is based on Goldfish interfaces defined by Google
> for Android simulator. It uses Goldfish-rtc (timer and RTC),
> Goldfish-pic (PIC) and Goldfish-tty (for early tty).
>
> The machine is created with 128 virtio-mmio buses, and they can
> be used to add serial console, GPU, disk, NIC, HID, hwrng, 9PFS...
>
> The virtual m68k machine has been merged in QEMU and will be available
> with the release 6.0.
>
> This series introduces the support of this new machine in the linux kernel.

Thanks, queued in the m68k for-v5.19 branch.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
