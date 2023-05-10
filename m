Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16E54C77B7C
	for <linux-m68k@archiver.kernel.org>; Wed, 10 May 2023 12:35:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236306AbjEJMfG convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 10 May 2023 08:35:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237041AbjEJMes (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 10 May 2023 08:34:48 -0400
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20A3449C0
        for <linux-m68k@lists.linux-m68k.org>; Wed, 10 May 2023 05:34:47 -0700 (PDT)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-559e2051d05so103544617b3.3
        for <linux-m68k@lists.linux-m68k.org>; Wed, 10 May 2023 05:34:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683722086; x=1686314086;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kGY/0htSfGIvsVgPn7bx+ykp3agguIOsAu0irnl44Xg=;
        b=jTiFdeOhT6ZFC/Z1ZFCdc+LGaBv9UlpWBht8AQBl4273z7URHnrKsMo+F82GgkwucW
         bi4Ie+wZC1tUTavEyQab0uZdprJlYI1sVGUcPXrn2MYvNS3x1Owk/LWe8y5TnImM2vyC
         r5E6QvyNPA3WeUOPXmoJdBVhk/kyenXva3BGdyHVyYGxMXYLXX/Ks6K1iLiI+QxSyz4N
         6Ufggpet6MzK4N9AI2Dwef5iQeOty9WyrTJlNhxgItrc4j6lzVMpZyIDghhIUw7MQU+z
         G8BjXh/Hsr/337gKvSnqYw0+1iFro8fObo0CYHf9nyPjlmoVt8fHOv5BXrjfNiNJ5wbS
         xBlA==
X-Gm-Message-State: AC+VfDzlaQ77GYTChs5AwLVnz6SqCBNy11PgJVmfj8dv6q8H7xWDjpL4
        hZA7ttQJARCW96Qa2AfSpdlD3u8tSSKb1A==
X-Google-Smtp-Source: ACHHUZ6bH8c0yknxw29x+yYRCBITDd74SNOy8PX23Hn3j47VeTrP6P6kX2oich5wFVAfQiq7gE3T8Q==
X-Received: by 2002:a81:7586:0:b0:54f:b244:fef9 with SMTP id q128-20020a817586000000b0054fb244fef9mr18800104ywc.0.1683722085901;
        Wed, 10 May 2023 05:34:45 -0700 (PDT)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com. [209.85.128.178])
        by smtp.gmail.com with ESMTPSA id c127-20020a0dc185000000b0054eb6b21b9csm2633173ywd.84.2023.05.10.05.34.45
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 May 2023 05:34:45 -0700 (PDT)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-559e2051d05so103544267b3.3
        for <linux-m68k@lists.linux-m68k.org>; Wed, 10 May 2023 05:34:45 -0700 (PDT)
X-Received: by 2002:a0d:ead7:0:b0:55a:ae08:163f with SMTP id
 t206-20020a0dead7000000b0055aae08163fmr22367018ywe.32.1683722085095; Wed, 10
 May 2023 05:34:45 -0700 (PDT)
MIME-Version: 1.0
References: <20230510110557.14343-1-tzimmermann@suse.de> <20230510110557.14343-6-tzimmermann@suse.de>
In-Reply-To: <20230510110557.14343-6-tzimmermann@suse.de>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 10 May 2023 14:34:33 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVV-MQV3C_o6JxPj23h3zo0kMmsn9ZEWJxsrzr6YpKmyg@mail.gmail.com>
Message-ID: <CAMuHMdVV-MQV3C_o6JxPj23h3zo0kMmsn9ZEWJxsrzr6YpKmyg@mail.gmail.com>
Subject: Re: [PATCH v6 5/6] fbdev: Move framebuffer I/O helpers into <asm/fb.h>
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     deller@gmx.de, javierm@redhat.com, daniel@ffwll.ch,
        vgupta@kernel.org, chenhuacai@kernel.org, kernel@xen0n.name,
        davem@davemloft.net, James.Bottomley@hansenpartnership.com,
        arnd@arndb.de, sam@ravnborg.org, suijingfeng@loongson.cn,
        linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-arch@vger.kernel.org, linux-snps-arc@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-ia64@vger.kernel.org,
        loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
        sparclinux@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-parisc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Thomas,

On Wed, May 10, 2023 at 1:06 PM Thomas Zimmermann <tzimmermann@suse.de> wrote:
> Implement framebuffer I/O helpers, such as fb_read*() and fb_write*(),
> in the architecture's <asm/fb.h> header file or the generic one.
>
> The common case has been the use of regular I/O functions, such as
> __raw_readb() or memset_io(). A few architectures used plain system-
> memory reads and writes. Sparc used helpers for its SBus.
>
> The architectures that used special cases provide the same code in
> their __raw_*() I/O helpers. So the patch replaces this code with the
> __raw_*() functions and moves it to <asm-generic/fb.h> for all
> architectures.
>
> v6:
>         * fix fb_readq()/fb_writeq() on 64-bit mips (kernel test robot)
> v5:
>         * include <linux/io.h> in <asm-generic/fb>; fix s390 build
> v4:
>         * ia64, loongarch, sparc64: add fb_mem*() to arch headers
>           to keep current semantics (Arnd)
> v3:
>         * implement all architectures with generic helpers
>         * support reordering and native byte order (Geert, Arnd)
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Tested-by: Sui Jingfeng <suijingfeng@loongson.cn>
> Reviewed-by: Arnd Bergmann <arnd@arndb.de>
>
> add mips fb_q()

> --- a/arch/mips/include/asm/fb.h
> +++ b/arch/mips/include/asm/fb.h
> @@ -12,6 +12,28 @@ static inline void fb_pgprotect(struct file *file, struct vm_area_struct *vma,
>  }
>  #define fb_pgprotect fb_pgprotect
>
> +/*
> + * MIPS doesn't define __raw_ I/O macros, so the helpers
> + * in <asm-generic/fb.h> don't generate fb_readq() and
> + * fb_write(). We have to provide them here.

MIPS does not include <asm-generic/io.h>,  nor define its own
__raw_readq() and __raw_writeq()...

> + *
> + * TODO: Convert MIPS to generic I/O. The helpers below can
> + *       then be removed.
> + */
> +#ifdef CONFIG_64BIT
> +static inline u64 fb_readq(const volatile void __iomem *addr)
> +{
> +       return __raw_readq(addr);

... so how can this call work?

> +}
> +#define fb_readq fb_readq
> +
> +static inline void fb_writeq(u64 b, volatile void __iomem *addr)
> +{
> +       __raw_writeq(b, addr);
> +}
> +#define fb_writeq fb_writeq
> +#endif
> +
>  #include <asm-generic/fb.h>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
