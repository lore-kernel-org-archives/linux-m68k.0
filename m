Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 975CBCA5507
	for <linux-m68k@archiver.kernel.org>; Wed, 13 Sep 2023 08:10:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235651AbjIMIKm convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 13 Sep 2023 04:10:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238728AbjIMIKF (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 13 Sep 2023 04:10:05 -0400
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3780E19A2
        for <linux-m68k@lists.linux-m68k.org>; Wed, 13 Sep 2023 01:09:24 -0700 (PDT)
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-d776e1f181bso5673095276.3
        for <linux-m68k@lists.linux-m68k.org>; Wed, 13 Sep 2023 01:09:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694592563; x=1695197363;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uCz1YqPLlml0me4QSAkCQsY8FV1Cudx91zoZbXBVMOA=;
        b=twAc9/dhV+UnD81uPzWu+vB+dmCj4issB7Aly8Sr41B4e2shq5i1KgVNcUBsBJ6YM4
         4LoOpkaoJzQ8FKuODWjbnVMgpRP3ErphNINP47JJ5nFfRtKd4AoelBgV3N6ckLoaf9w8
         0/7+wjQhWqRGvkHxcIC2Tm7OaoCSFte5igOVXL8mz/8axFnfJgt3uZQNT7OH1h2jHpnJ
         cpFTUkjDuonjfaG+2GyxwaW6Y2ewQvVZKqZZfhSiEof8xU231dVn8gLD04XslJApe5OY
         PnZ5wNGaXlZ0+fJn6e3bbHHNoLuPUKNF0uF0/u2a0IXXs6/Zt2CdBE7oqiuflhZVun3O
         ISSQ==
X-Gm-Message-State: AOJu0YwjQhP+FRXy0F86oUWjDQZBtoJdEoYRk5xgH7ChtUcM8+faCCEC
        NDxhiNL/CzTXDntXcENPVjB2JF/xG7WKPw==
X-Google-Smtp-Source: AGHT+IGXx6HVhvp9vZkQXokL2Hv2pluEjmPWUPx8mftYUGReJsV/4eNEHIIEq8ghHryW8Hm6RL0+sw==
X-Received: by 2002:a25:d2d5:0:b0:d0d:2d17:3f11 with SMTP id j204-20020a25d2d5000000b00d0d2d173f11mr1747359ybg.17.1694592563150;
        Wed, 13 Sep 2023 01:09:23 -0700 (PDT)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com. [209.85.219.178])
        by smtp.gmail.com with ESMTPSA id o12-20020a056902010c00b00d71c764379fsm1858661ybh.55.2023.09.13.01.09.22
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Sep 2023 01:09:22 -0700 (PDT)
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-d7d50ba994eso5677603276.1
        for <linux-m68k@lists.linux-m68k.org>; Wed, 13 Sep 2023 01:09:22 -0700 (PDT)
X-Received: by 2002:a25:9844:0:b0:d81:4e98:4f5c with SMTP id
 k4-20020a259844000000b00d814e984f5cmr1178332ybo.47.1694592562230; Wed, 13 Sep
 2023 01:09:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230912135050.17155-1-tzimmermann@suse.de> <20230912135050.17155-3-tzimmermann@suse.de>
In-Reply-To: <20230912135050.17155-3-tzimmermann@suse.de>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 13 Sep 2023 10:09:10 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU66MLdWM9Qjk-2qmHUZA6F8L-W1iAoc73-HvSB1n-drg@mail.gmail.com>
Message-ID: <CAMuHMdU66MLdWM9Qjk-2qmHUZA6F8L-W1iAoc73-HvSB1n-drg@mail.gmail.com>
Subject: Re: [PATCH v4 2/5] fbdev: Replace fb_pgprotect() with pgprot_framebuffer()
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

Hi Thomas,

On Tue, Sep 12, 2023 at 5:32 PM Thomas Zimmermann <tzimmermann@suse.de> wrote:
> Rename the fbdev mmap helper fb_pgprotect() to pgprot_framebuffer(
> The helper sets VMA page-access flags for framebuffers in device I/O
> memory.
>
> Also clean up the helper's parameters and return value. Instead of
> the VMA instance, pass the individial parameters separately: existing
> page-access flags, the VMAs start and end addresses and the offset
> in the underlying device memory rsp file. Return the new page-access
> flags. These changes align pgprot_framebuffer() with other pgprot_()
> functions.
>
> v4:
>         * fix commit message (Christophe)
> v3:
>         * rename fb_pgprotect() to pgprot_framebuffer() (Arnd)
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Thanks for your patch!

>  arch/m68k/include/asm/fb.h           | 19 ++++++++++---------

Looks like you forgot to apply my
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>
given on v1.

I didn't notice before, as I never received v2 and v3 due to the
gmail/vger email issues.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
