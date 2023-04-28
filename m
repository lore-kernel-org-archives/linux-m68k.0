Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76C68C77B60
	for <linux-m68k@archiver.kernel.org>; Fri, 28 Apr 2023 12:35:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239683AbjD1Mff convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 28 Apr 2023 08:35:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345934AbjD1MfR (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 28 Apr 2023 08:35:17 -0400
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com [209.85.166.53])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 057FB421E
        for <linux-m68k@lists.linux-m68k.org>; Fri, 28 Apr 2023 05:35:16 -0700 (PDT)
Received: by mail-io1-f53.google.com with SMTP id ca18e2360f4ac-76355514e03so805454539f.0
        for <linux-m68k@lists.linux-m68k.org>; Fri, 28 Apr 2023 05:35:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682685314; x=1685277314;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XDsEdn6WDxg314v0qLuVGHvJOHZvS1YLN0vYRrRrPEc=;
        b=CzSMGp0kG2YuelGi7rc0Q1Ehp+KGjYPbfv9955gz4yBgN3yeaokHmpeC6UMs6FVyT8
         C0d/najd82a6S+9NOWX14tfRHBn4J/steuflkNgajqejsKEvMXy80ODHBfg4tXawBvbF
         v2oj+hwXuUdFYywK/e/JmL+lBhK31dpQNLpQnfsMvU8yQStXZa38sKY3uh9O9eNhD45Z
         i+JijYU9I7HG0p6dk9A6tytHnAg3EGWyp6wWYfCACYuT4sZV7NsDJRePcc7J/DQd+2x+
         /JKetDzgYSh2Ibi9BO/OirteJyrDMYFux3mjJUtxqsZHkQfpTzs8Dv4Sq31B6wsNZ6lH
         OpJw==
X-Gm-Message-State: AC+VfDyf0KvRKMq383gC15xWvCGisu6rGUuzbOS1d9OLWXR6rBgQyGCI
        4JDSB0DgLykWG3K0VH5B8ABl2AVI2EoINw==
X-Google-Smtp-Source: ACHHUZ4xE1rMmeVD/YjuNI82cciFVb2DwDgZzD8CT5v8VChapxYf/HSHlXmUzKyBZcfTyis+AYMxfg==
X-Received: by 2002:a92:cac8:0:b0:32a:bd64:4950 with SMTP id m8-20020a92cac8000000b0032abd644950mr3484966ilq.9.1682685314456;
        Fri, 28 Apr 2023 05:35:14 -0700 (PDT)
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com. [209.85.166.45])
        by smtp.gmail.com with ESMTPSA id x7-20020a92dc47000000b0032f493364c1sm618851ilq.52.2023.04.28.05.35.14
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Apr 2023 05:35:14 -0700 (PDT)
Received: by mail-io1-f45.google.com with SMTP id ca18e2360f4ac-7606d6b3294so804049739f.2
        for <linux-m68k@lists.linux-m68k.org>; Fri, 28 Apr 2023 05:35:14 -0700 (PDT)
X-Received: by 2002:a81:8a01:0:b0:544:69f5:fadc with SMTP id
 a1-20020a818a01000000b0054469f5fadcmr3593096ywg.6.1682684839491; Fri, 28 Apr
 2023 05:27:19 -0700 (PDT)
MIME-Version: 1.0
References: <20230428092711.406-1-tzimmermann@suse.de> <20230428092711.406-6-tzimmermann@suse.de>
 <430c73f0-45f4-f81e-6506-bc8cc955d936@arm.com>
In-Reply-To: <430c73f0-45f4-f81e-6506-bc8cc955d936@arm.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 28 Apr 2023 14:27:05 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUGjtiAR37L4_e0_p8ee2=gxoUj7+e7rqMLTBK+vpV4yw@mail.gmail.com>
Message-ID: <CAMuHMdUGjtiAR37L4_e0_p8ee2=gxoUj7+e7rqMLTBK+vpV4yw@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] fbdev: Define framebuffer I/O from Linux' I/O functions
To:     Robin Murphy <robin.murphy@arm.com>
Cc:     Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de,
        javierm@redhat.com, daniel@ffwll.ch, vgupta@kernel.org,
        chenhuacai@kernel.org, kernel@xen0n.name, davem@davemloft.net,
        James.Bottomley@hansenpartnership.com, arnd@arndb.de,
        sam@ravnborg.org, linux-fbdev@vger.kernel.org,
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

On Fri, Apr 28, 2023 at 2:18 PM Robin Murphy <robin.murphy@arm.com> wrote:
> On 2023-04-28 10:27, Thomas Zimmermann wrote:
> > Implement framebuffer I/O helpers, such as fb_read*() and fb_write*()
> > with Linux' regular I/O functions. Remove all ifdef cases for the
> > various architectures.
> >
> > Most of the supported architectures use __raw_() I/O functions or treat
> > framebuffer memory like regular memory. This is also implemented by the
> > architectures' I/O function, so we can use them instead.
> >
> > Sparc uses SBus to connect to framebuffer devices. It provides respective
> > implementations of the framebuffer I/O helpers. The involved sbus_()
> > I/O helpers map to the same code as Sparc's regular I/O functions. As
> > with other platforms, we can use those instead.
> >
> > We leave a TODO item to replace all fb_() functions with their regular
> > I/O counterparts throughout the fbdev drivers.
> >
> > Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> > ---
> >   include/linux/fb.h | 63 +++++++++++-----------------------------------
> >   1 file changed, 15 insertions(+), 48 deletions(-)
> >
> > diff --git a/include/linux/fb.h b/include/linux/fb.h
> > index 08cb47da71f8..4aa9e90edd17 100644
> > --- a/include/linux/fb.h
> > +++ b/include/linux/fb.h
> > @@ -15,7 +15,6 @@
> >   #include <linux/list.h>
> >   #include <linux/backlight.h>
> >   #include <linux/slab.h>
> > -#include <asm/io.h>
> >
> >   struct vm_area_struct;
> >   struct fb_info;
> > @@ -511,58 +510,26 @@ struct fb_info {
> >    */
> >   #define STUPID_ACCELF_TEXT_SHIT
> >
> > -// This will go away
> > -#if defined(__sparc__)
> > -
> > -/* We map all of our framebuffers such that big-endian accesses
> > - * are what we want, so the following is sufficient.
> > +/*
> > + * TODO: Update fbdev drivers to call the I/O helpers directly and
> > + *       remove the fb_() tokens.
> >    */
> > -
> > -// This will go away
> > -#define fb_readb sbus_readb
> > -#define fb_readw sbus_readw
> > -#define fb_readl sbus_readl
> > -#define fb_readq sbus_readq
> > -#define fb_writeb sbus_writeb
> > -#define fb_writew sbus_writew
> > -#define fb_writel sbus_writel
> > -#define fb_writeq sbus_writeq
> > -#define fb_memset sbus_memset_io
> > -#define fb_memcpy_fromfb sbus_memcpy_fromio
> > -#define fb_memcpy_tofb sbus_memcpy_toio
> > -
> > -#elif defined(__i386__) || defined(__alpha__) || defined(__x86_64__) ||      \
> > -     defined(__hppa__) || defined(__sh__) || defined(__powerpc__) || \
> > -     defined(__arm__) || defined(__aarch64__) || defined(__mips__)
> > -
> > -#define fb_readb __raw_readb
> > -#define fb_readw __raw_readw
> > -#define fb_readl __raw_readl
> > -#define fb_readq __raw_readq
> > -#define fb_writeb __raw_writeb
> > -#define fb_writew __raw_writew
> > -#define fb_writel __raw_writel
> > -#define fb_writeq __raw_writeq
>
> Note that on at least some architectures, the __raw variants are
> native-endian, whereas the regular accessors are explicitly
> little-endian, so there is a slight risk of inadvertently changing
> behaviour on big-endian systems (MIPS most likely, but a few old ARM
> platforms run BE as well).

Also on m68k, when ISA or PCI are enabled.

In addition, the non-raw variants may do some extras to guarantee
ordering, which you do not need on a frame buffer.

So I'd go for the __raw_*() variants everywhere.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
