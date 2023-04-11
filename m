Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AFD2C77B76
	for <linux-m68k@archiver.kernel.org>; Tue, 11 Apr 2023 08:10:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230127AbjDKIK1 convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 11 Apr 2023 04:10:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229794AbjDKIKY (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 11 Apr 2023 04:10:24 -0400
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE1FC2691
        for <linux-m68k@lists.linux-m68k.org>; Tue, 11 Apr 2023 01:10:19 -0700 (PDT)
Received: by mail-yb1-f175.google.com with SMTP id y69so14052527ybe.2
        for <linux-m68k@lists.linux-m68k.org>; Tue, 11 Apr 2023 01:10:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681200619;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BKyKsR4WjWkIQ4662w2UQ58EahuI+KkHYModkQblq2M=;
        b=4d5umf01L6eanQ5fOSIXkFyNT0qPSiqMOTQ8tmPjINMPUt6VE1u20kDocDz/1v49l0
         xl03IBtX4gV+gK++fNLaYFmZGMlqYirS3xOFk9CSR/riMLAA2ss64r25UppTcnhDr2R3
         t9kE64osAG9ehY0AVyJ9eTYWjiX1CebduQozqNNlvTNgrKwE5U1jGaVa0Ef+dom+wv45
         TLtvjmi1jHu/9q+E1H/fZV72naB3gZbYuSOLh8DlF0mAOoAQn9ZR7QPURkA2V+1vdvvr
         8A2kJhQfmAHjU6Jk+xSpWGXv0qZOEB0cD3BU7ngKxOSfyyHmAKqIxVlE5wYHNZdYB+fU
         vbjw==
X-Gm-Message-State: AAQBX9eLInIbDzb+e7BfYQY9FDDP0iEN5M8U8+Jy1cVBt3jVa1JXLH2V
        gZPgeOfD4QlhcGWLZklahKyJiS9nSPuIQA==
X-Google-Smtp-Source: AKy350aDWTDUO3uCxPK4YLgHmLn2K3I2tVtZZbixHT4mYgtOSIlN3fmEHGNgOSflBF4YmiboDGkk4w==
X-Received: by 2002:a25:ae08:0:b0:b73:1eab:1723 with SMTP id a8-20020a25ae08000000b00b731eab1723mr7885269ybj.29.1681200618898;
        Tue, 11 Apr 2023 01:10:18 -0700 (PDT)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com. [209.85.128.175])
        by smtp.gmail.com with ESMTPSA id 11-20020a25020b000000b00b7f5ce4f0d3sm3474862ybc.23.2023.04.11.01.10.16
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Apr 2023 01:10:17 -0700 (PDT)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-54f21cdfadbso93121117b3.7
        for <linux-m68k@lists.linux-m68k.org>; Tue, 11 Apr 2023 01:10:16 -0700 (PDT)
X-Received: by 2002:a81:bc08:0:b0:54e:e490:d190 with SMTP id
 a8-20020a81bc08000000b0054ee490d190mr1216128ywi.4.1681200616792; Tue, 11 Apr
 2023 01:10:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230406143019.6709-1-tzimmermann@suse.de> <20230406143019.6709-8-tzimmermann@suse.de>
In-Reply-To: <20230406143019.6709-8-tzimmermann@suse.de>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 11 Apr 2023 10:10:04 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWY2KdnpuunRqADjDjt_vnEdyD_yfwJySTi4s5N+A1ZgA@mail.gmail.com>
Message-ID: <CAMuHMdWY2KdnpuunRqADjDjt_vnEdyD_yfwJySTi4s5N+A1ZgA@mail.gmail.com>
Subject: Re: [PATCH v2 07/19] arch/m68k: Merge variants of fb_pgprotect() into
 single function
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     arnd@arndb.de, daniel.vetter@ffwll.ch, deller@gmx.de,
        javierm@redhat.com, gregkh@linuxfoundation.org,
        linux-arch@vger.kernel.org, linux-fbdev@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org,
        loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
        linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org,
        sparclinux@vger.kernel.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Thu, Apr 6, 2023 at 4:30 PM Thomas Zimmermann <tzimmermann@suse.de> wrote:
> Merge all variants of fb_pgprotect() into a single function body.
> There are two different cases for MMU systems. For non-MMU systems,
> the function body will be empty. No functional changes, but this
> will help with the switch to <asm-generic/fb.h>.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
