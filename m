Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 431CDC77B75
	for <linux-m68k@archiver.kernel.org>; Wed,  3 May 2023 08:10:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229986AbjECIKX convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 3 May 2023 04:10:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229739AbjECIKI (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 3 May 2023 04:10:08 -0400
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3200849E9
        for <linux-m68k@lists.linux-m68k.org>; Wed,  3 May 2023 01:09:54 -0700 (PDT)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-559ded5e170so61274217b3.3
        for <linux-m68k@lists.linux-m68k.org>; Wed, 03 May 2023 01:09:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683101393; x=1685693393;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3SVmNF978sXXspcYjjZLpiBDqyot8IfsoBtpE1ZoRNc=;
        b=UlomORKrd+5Xh0x+UU4Wen3zgVRXatmIVIVgv9Hzm1/fcccjZHXW9RGURDlHr5L8pC
         NNvL2MqZHZjFmPGRTbab0S94hG8t7J6flp0kGyW70U+0HW8uN8/3yJNQXF9Kh6soxv6G
         EEa5KM7PgzRsQQc9HQqpsDBoMbIkfAvBV8KTVswssFU2RajhpoeEozfnppOfYU/esaYw
         iyY+RyJ9sHNMUp6RFUnk3xJFIwCSn8ArCINItGalNR7pxABHcAZeByRSFVBQm+WbqzEJ
         bMl4EGVURiRgzdJxU2t1ciLLtlI8L5C9PVLyxZMevzcjxbr9LpiUZXs+hAk6IrdiMNsq
         QTZw==
X-Gm-Message-State: AC+VfDwzAkZBiyls7895xezNXw5+WjX0vH3Bj55QrccZYrz2NpnBZNvp
        N6/7ZaNZcZl2k+plCjxAmghBzGKkbuVGxg==
X-Google-Smtp-Source: ACHHUZ4K/DpnfxSlncWKkAp/EYIOVQ39QkS7kzHfAcBQR0e9T1L9UqHDNnxs0iNtaQeiTJuwBCpz1w==
X-Received: by 2002:a0d:d986:0:b0:55a:f428:e8ea with SMTP id b128-20020a0dd986000000b0055af428e8eamr2372395ywe.41.1683101392996;
        Wed, 03 May 2023 01:09:52 -0700 (PDT)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com. [209.85.128.171])
        by smtp.gmail.com with ESMTPSA id x66-20020a0dd545000000b0055a2cda24acsm2164613ywd.35.2023.05.03.01.09.50
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 May 2023 01:09:51 -0700 (PDT)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-559e317eef1so59866877b3.0
        for <linux-m68k@lists.linux-m68k.org>; Wed, 03 May 2023 01:09:50 -0700 (PDT)
X-Received: by 2002:a0d:c347:0:b0:556:dd1b:3bb7 with SMTP id
 f68-20020a0dc347000000b00556dd1b3bb7mr19301020ywd.43.1683101390642; Wed, 03
 May 2023 01:09:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230502130223.14719-1-tzimmermann@suse.de> <20230502130223.14719-5-tzimmermann@suse.de>
 <20230502195429.GA319489@ravnborg.org> <563673c0-799d-e353-974c-91b1ab881a22@suse.de>
 <87354dyj9i.fsf@minerva.mail-host-address-is-not-set>
In-Reply-To: <87354dyj9i.fsf@minerva.mail-host-address-is-not-set>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 3 May 2023 10:09:39 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW8Sm7sBu47XQ1xygn6fzq2FzQeiuK0ncMVGHan-_k4Ow@mail.gmail.com>
Message-ID: <CAMuHMdW8Sm7sBu47XQ1xygn6fzq2FzQeiuK0ncMVGHan-_k4Ow@mail.gmail.com>
Subject: Re: [PATCH v3 4/6] fbdev: Include <linux/io.h> via <asm/fb.h>
To:     Javier Martinez Canillas <javierm@redhat.com>
Cc:     Thomas Zimmermann <tzimmermann@suse.de>,
        Sam Ravnborg <sam@ravnborg.org>, linux-arch@vger.kernel.org,
        linux-fbdev@vger.kernel.org, linux-ia64@vger.kernel.org,
        loongarch@lists.linux.dev, arnd@arndb.de, deller@gmx.de,
        chenhuacai@kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        James.Bottomley@hansenpartnership.com,
        linux-m68k@lists.linux-m68k.org, linux-parisc@vger.kernel.org,
        vgupta@kernel.org, sparclinux@vger.kernel.org, kernel@xen0n.name,
        linux-snps-arc@lists.infradead.org, davem@davemloft.net,
        linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Wed, May 3, 2023 at 9:19 AM Javier Martinez Canillas
<javierm@redhat.com> wrote:
> Thomas Zimmermann <tzimmermann@suse.de> writes:
> > Am 02.05.23 um 21:54 schrieb Sam Ravnborg:
> >> On Tue, May 02, 2023 at 03:02:21PM +0200, Thomas Zimmermann wrote:
>
> [...]
>
> >>>   #include <linux/console.h> /* Why should fb driver call console functions? because console_lock() */
> >>>   #include <video/vga.h>
> >>>
> >>> +#include <asm/fb.h>
> >>
> >> When we have a header like linux/fb.h - it is my understanding that it is
> >> preferred to include that file, and not the asm/fb.h variant.
> >>
> >> This is assuming the linux/fb.h contains the generic stuff, and includes
> >> asm/fb.h for the architecture specific parts.
> >>
> >> So drivers will include linux/fb.h and then they automatically get the
> >> architecture specific parts from asm/fb.h.
> >>
> >> In other words, drivers are not supposed to include asm/fb.h, if
> >> linux.fb.h exists - and linux/fb.h shall include the asm/fb.h.
> >>
> >> If the above holds true, then it is wrong and not needed to add asm/fb.h
> >> as seen above.
> >>
> >>
> >> There are countless examples where the above are not followed,
> >> but to my best understanding the above it the preferred way to do it.
> >
> > Where did youher this? I only know about this in the case of asm/io.h
> > vs. linux/io.h.
> >
>
> I understand that's the case too. I believe even checkpatch.pl complains
> about it? (not that the script always get right, but just as an example).

One more to chime in: in general, drivers should only include <linux/foo.h>.
Including <asm/foo.h> directly is the exception.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
