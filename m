Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 054E0CA0FE3
	for <linux-m68k@archiver.kernel.org>; Mon,  4 Sep 2023 06:50:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237760AbjIDGuP convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 4 Sep 2023 02:50:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232400AbjIDGuO (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 4 Sep 2023 02:50:14 -0400
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60355102
        for <linux-m68k@lists.linux-m68k.org>; Sun,  3 Sep 2023 23:50:11 -0700 (PDT)
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-d74a012e613so1496310276.1
        for <linux-m68k@lists.linux-m68k.org>; Sun, 03 Sep 2023 23:50:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693810210; x=1694415010;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3rK9iNlhM9qm2dLN2U9ruHBYs+JWxgylVxpO0f1W8IM=;
        b=O6TUDeexO+ser177rGdG8KdgWWDmP/kTrqnis/Hi3cfa35BfwkitS4gg3oNEtSPQz2
         EZiiZr8+cqmy7b/yKzx1WwXkgmM6+lBJOx9s5atw6errsGpO/M2bp3qlWZCPJGIKjdyg
         /D8CUYqwwudCBFWybSS/jFd7CZF4sRpDUEKWI5zVRRd5KDOQpJ0LHAKUATLe4ltSezep
         DKXmPEZaK7Wr2M4Q7u91UUxHfc7ccE0Y7w2Tq877uYQDK/FLG0oJlIay7LD1/4/AQHk1
         FtxtDrgg+W/80plf3gUUhdhVYwmXWayFx2rcq4mtyRM7JQx73/jFzypmYI9ybF0+vPwB
         p1iQ==
X-Gm-Message-State: AOJu0YymLHIONMLFX3G2Nm/4Dh6K0YY2YELE6c1ZsuCKI9gKPfu5c8i2
        Ih4Gg9wKkzH8tWFuVJ623GiSR4VvMNZG/w==
X-Google-Smtp-Source: AGHT+IF+3u/Ovg/Nm5nXsy6ADzmiUOit8xGZ9zgUy1MREWH2TYdgLlvKkJhKk8UZl4hZ7r0uyWVZeA==
X-Received: by 2002:a25:ad66:0:b0:d72:cd04:2db7 with SMTP id l38-20020a25ad66000000b00d72cd042db7mr12486165ybe.21.1693810210311;
        Sun, 03 Sep 2023 23:50:10 -0700 (PDT)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com. [209.85.128.180])
        by smtp.gmail.com with ESMTPSA id g34-20020a25ae62000000b00d74b5e166acsm2207279ybe.10.2023.09.03.23.50.09
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 03 Sep 2023 23:50:09 -0700 (PDT)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-58d41109351so27038317b3.1
        for <linux-m68k@lists.linux-m68k.org>; Sun, 03 Sep 2023 23:50:09 -0700 (PDT)
X-Received: by 2002:a25:a1a9:0:b0:d7b:a78e:6b2d with SMTP id
 a38-20020a25a1a9000000b00d7ba78e6b2dmr12488603ybi.20.1693810209384; Sun, 03
 Sep 2023 23:50:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230901142659.31787-1-tzimmermann@suse.de> <20230901142659.31787-5-tzimmermann@suse.de>
In-Reply-To: <20230901142659.31787-5-tzimmermann@suse.de>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 4 Sep 2023 08:49:57 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV+0P40QpPcLeuSAd0HJ_Z2uPpmhyBKXnxoOQibtGAVFg@mail.gmail.com>
Message-ID: <CAMuHMdV+0P40QpPcLeuSAd0HJ_Z2uPpmhyBKXnxoOQibtGAVFg@mail.gmail.com>
Subject: Re: [PATCH 4/4] fbdev: Replace fb_pgprotect() with fb_pgprot_device()
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
        arnd@arndb.de, deller@gmx.de, linuxppc-dev@lists.ozlabs.org,
        linux-fbdev@vger.kernel.org, linux-ia64@vger.kernel.org,
        linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
        sparclinux@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-arch@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Sat, Sep 2, 2023 at 11:13 AM Thomas Zimmermann <tzimmermann@suse.de> wrote:
> Rename the fbdev mmap helper fb_pgprotect() to fb_pgprot_device().
> The helper sets VMA page-access flags for framebuffers in device I/O
> memory. The new name follows pgprot_device(), which does the same for
> arbitrary devices.
>
> Also clean up the helper's parameters and return value. Instead of
> the VMA instance, pass the individial parameters separately: existing
> page-access flags, the VMAs start and end addresses and the offset
> in the underlying device memory rsp file. Return the new page-access
> flags. These changes align fb_pgprot_device() closer with pgprot_device.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

>  arch/m68k/include/asm/fb.h           | 19 ++++++++++---------

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>


Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
