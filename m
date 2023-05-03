Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60A3DC77B78
	for <linux-m68k@archiver.kernel.org>; Wed,  3 May 2023 08:30:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229455AbjECIaD convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 3 May 2023 04:30:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229498AbjECIaB (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 3 May 2023 04:30:01 -0400
Received: from mail-il1-f169.google.com (mail-il1-f169.google.com [209.85.166.169])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53CB849F1
        for <linux-m68k@lists.linux-m68k.org>; Wed,  3 May 2023 01:30:00 -0700 (PDT)
Received: by mail-il1-f169.google.com with SMTP id e9e14a558f8ab-3310e9368eeso18041865ab.0
        for <linux-m68k@lists.linux-m68k.org>; Wed, 03 May 2023 01:30:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683102599; x=1685694599;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yf0nQOOKHL0GEtmAgACXt9/1DKDkHK6ft7tmYSYGTKo=;
        b=PS5G7lQiByHsuAnOYT70YHmuSIWHWO47njw9WV4eR/UTomRjVCeaXfrbqm9NxYBH+I
         FUQFy+mNqbi58Ua/gkHNoftCWFf4aasi3G1oGjoJNKO3/OzVORGP9/Q69YYo/Wr3iPQd
         jzwZ35HpqI2blfOBf3pjpW6Ut8FmnyIJHA3pjH6wgLqggTTIcsZFceQjTGpgVszEauJH
         d5a2laH1AtJHKC7zRB9j+otUhLiv4sCyGft9OAGcN2CUUcAFyVekQsDP8LgVo85+QPPd
         4iJ3JQMn5vii7tTskRPj6KU3F1gyuWe9eW/5CVsWAeL+iFZysRfH90VRLTwkgu9APrxA
         71+w==
X-Gm-Message-State: AC+VfDxo/7/SmDPkrq8yd/rqeYGGw/kwq9jz/txvbdIZFt4qHkqVLn2F
        gx+42OYQVhiKo9xqUMvrfDh5Od+5E6PI8Q==
X-Google-Smtp-Source: ACHHUZ5Az7FYC/8tDQ8tdmrqphGykjSG5vi++EMZgxhh4I/5IvC3BajCtheALHAQtK8P6pOevDLYYw==
X-Received: by 2002:a05:6e02:609:b0:32a:a16c:d28d with SMTP id t9-20020a056e02060900b0032aa16cd28dmr12802069ils.12.1683102599095;
        Wed, 03 May 2023 01:29:59 -0700 (PDT)
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com. [209.85.166.177])
        by smtp.gmail.com with ESMTPSA id cl5-20020a0566383d0500b0040bb600eb81sm9677310jab.149.2023.05.03.01.29.58
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 May 2023 01:29:58 -0700 (PDT)
Received: by mail-il1-f177.google.com with SMTP id e9e14a558f8ab-3310e9368eeso18041755ab.0
        for <linux-m68k@lists.linux-m68k.org>; Wed, 03 May 2023 01:29:58 -0700 (PDT)
X-Received: by 2002:a25:240f:0:b0:b9d:d5dc:596c with SMTP id
 k15-20020a25240f000000b00b9dd5dc596cmr11998230ybk.12.1683102122353; Wed, 03
 May 2023 01:22:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230502130223.14719-1-tzimmermann@suse.de>
In-Reply-To: <20230502130223.14719-1-tzimmermann@suse.de>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 3 May 2023 10:21:50 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV06LN17KzOh42vjyF504myT=D=a-zz3MduOmQPEmv5SA@mail.gmail.com>
Message-ID: <CAMuHMdV06LN17KzOh42vjyF504myT=D=a-zz3MduOmQPEmv5SA@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] fbdev: Move framebuffer I/O helpers to <asm/fb.h>
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     deller@gmx.de, javierm@redhat.com, daniel@ffwll.ch,
        vgupta@kernel.org, chenhuacai@kernel.org, kernel@xen0n.name,
        davem@davemloft.net, James.Bottomley@hansenpartnership.com,
        arnd@arndb.de, sam@ravnborg.org, linux-fbdev@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-arch@vger.kernel.org,
        linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-ia64@vger.kernel.org, loongarch@lists.linux.dev,
        linux-m68k@lists.linux-m68k.org, sparclinux@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-parisc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Thomas,

On Tue, May 2, 2023 at 3:02 PM Thomas Zimmermann <tzimmermann@suse.de> wrote:
> (was: fbdev: Use regular I/O function for framebuffers)
>
> Fbdev provides helpers for framebuffer I/O, such as fb_readl(),
> fb_writel() or fb_memcpy_to_fb(). The implementation of each helper
> depends on the architecture, but they are all equivalent to regular
> I/O functions of similar names. So use regular functions instead and
> move all helpers into <asm-generic/fb.h>
>
> The first patch a simple whitespace cleanup.
>
> Until now, <linux/fb.h> contained an include of <asm/io.h>. As this
> will go away patches 2 to 4 prepare include statements in the various
> drivers. Source files that use regular I/O helpers, such as readl(),
> now include <linux/io.h>. Source files that use framebuffer I/O
> helpers, such as fb_readl(), also include <asm/fb.h>.
>
> Patch 5 replaces the architecture-based if-else branching in
> <linux/fb.h> by helpers in <asm-generic/fb.h>. All helpers use Linux'
> existing I/O functions.
>
> Patch 6 harmonizes naming among fbdev and existing I/O functions.
>
> The patchset has been built for a variety of platforms, such as x86-64,
> arm, aarch64, ppc64, parisc, m64k, mips and sparc.
>
> v3:
>         * add the new helpers in <asm-generic/fb.h>
>         * support reordering and native byte order (Geert, Arnd)

Thanks, this fixes the mangled display I was seeing on ARAnyM
with bpp=16.

BTW, this series seems to have mixed dependencies: the change
to include/asm-generic/fb.h depends on "[PATCH v3 00/19] arch:
Consolidate <asm/fb.h>"[1], but with that applied, I had to manually
fixup drivers/video/fbdev/core/fb_cfb_fops.c.

[1] https://lore.kernel.org/all/20230417125651.25126-1-tzimmermann@suse.de,

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
