Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FECDC77B6F
	for <linux-m68k@archiver.kernel.org>; Tue, 11 Apr 2023 08:28:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230112AbjDKI2w convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 11 Apr 2023 04:28:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230174AbjDKI2k (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 11 Apr 2023 04:28:40 -0400
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48C733A9B
        for <linux-m68k@lists.linux-m68k.org>; Tue, 11 Apr 2023 01:28:10 -0700 (PDT)
Received: by mail-pl1-f180.google.com with SMTP id y6so6064585plp.2
        for <linux-m68k@lists.linux-m68k.org>; Tue, 11 Apr 2023 01:28:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681201689;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KOXdqLxEHLBZ7hy/2mM/9REbA1X5ZreSZtF+7etv6Sw=;
        b=Y4aCylXMAJ2q6RRDvMDkLXwmT00U6Kc+P6TmrvzYI4Mu3mhqNG762rxalflFDi9j1Q
         +bLzhKrbl/UMN6LGfULRKeq8VzPimrJevD1IcNEj7lmQn2o8wjxmVCO0c89zmjQbQqnP
         ttt4PVF7OA0H/GdU9yrO8heb+kKd5h3IKuo1b4CmeY6ku9xTdtiHgMb+YBf0VsEhbrI0
         5yjLViG6nnA2qF8iMyxmm9if9Vkq10y018QEHO+5jyMsNqukpit+Iz1q8zVE1tV39diL
         OZowVl8Wm0xTeyuxwUAXztT2F40m52AH7VUmtkDsrFXo+gnqRd/QbY1sjwVM3wLEp/O8
         je8w==
X-Gm-Message-State: AAQBX9eXq6wOrqN0V6cqbb+XJzWIBv3d19h924aPSREXzcq+oyvt0j+o
        /9PRKT4tIg74CjF8NaGEDu5HYKt73lHdxw==
X-Google-Smtp-Source: AKy350ZqMVwx27+v/LH/8/0as6lEmZPmEPYYqXPXUc6KTGleKObeJLoalisypiDNwSVZ7A+FDWY5mw==
X-Received: by 2002:a17:90b:4d86:b0:246:92e4:bdbd with SMTP id oj6-20020a17090b4d8600b0024692e4bdbdmr3091509pjb.15.1681201688892;
        Tue, 11 Apr 2023 01:28:08 -0700 (PDT)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com. [209.85.216.53])
        by smtp.gmail.com with ESMTPSA id ba6-20020a170902720600b001a5317b5170sm4709874plb.278.2023.04.11.01.28.08
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Apr 2023 01:28:08 -0700 (PDT)
Received: by mail-pj1-f53.google.com with SMTP id y11-20020a17090a600b00b0024693e96b58so6085661pji.1
        for <linux-m68k@lists.linux-m68k.org>; Tue, 11 Apr 2023 01:28:08 -0700 (PDT)
X-Received: by 2002:a25:d447:0:b0:b75:9519:dbcd with SMTP id
 m68-20020a25d447000000b00b759519dbcdmr960089ybf.12.1681201212819; Tue, 11 Apr
 2023 01:20:12 -0700 (PDT)
MIME-Version: 1.0
References: <20230406143019.6709-1-tzimmermann@suse.de> <20230406143019.6709-9-tzimmermann@suse.de>
In-Reply-To: <20230406143019.6709-9-tzimmermann@suse.de>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 11 Apr 2023 10:20:00 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVmZ2GRKqEnZgQKzJ1-Hy-Cz8yoUOhD0TMMqZriH82-tQ@mail.gmail.com>
Message-ID: <CAMuHMdVmZ2GRKqEnZgQKzJ1-Hy-Cz8yoUOhD0TMMqZriH82-tQ@mail.gmail.com>
Subject: Re: [PATCH v2 08/19] arch/m68k: Implement <asm/fb.h> with generic helpers
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
> Replace the architecture's fb_is_primary_device() with the generic
> one from <asm-generic/fb.h>. No functional changes.
>
> v2:
>         * provide empty fb_pgprotect() on non-MMU systems
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Geert Uytterhoeven <geert@linux-m68k.org>

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
