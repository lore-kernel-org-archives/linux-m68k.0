Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55818E732D0
	for <linux-m68k@archiver.kernel.org>; Fri, 29 Sep 2023 10:03:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231774AbjI2KDw convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 29 Sep 2023 06:03:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231429AbjI2KDv (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 29 Sep 2023 06:03:51 -0400
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F07C1199
        for <linux-m68k@lists.linux-m68k.org>; Fri, 29 Sep 2023 03:03:49 -0700 (PDT)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-59f6041395dso131197607b3.1
        for <linux-m68k@lists.linux-m68k.org>; Fri, 29 Sep 2023 03:03:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695981828; x=1696586628;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BTXbPlYpsMiuCcRFcRIzs7rP8dy9t2PLSeQxuACbVxk=;
        b=VCJQkqGMMxImn0T7DY1zqh2aMjSsED5pExBJU0LYCPd7PtM6FJkidwmqvOL8o1OlQh
         KKGTGrHUkVSnYlJiSwOmUKIKY7OPeAuLHjBaXFHAWDf2hOr4ECpvSh8X3UeSIG9G9f6Z
         BkPCQeyThKoiK0qAiNInidHgE/EquyeApqoGzc6Quh60qRRBcsteaGQ8pc4GS/VTFXjt
         4STXtkSXmIXwarzygsV2Zev65nyhdqR8+rE6QAC0ScKNu29n6GZDjs1u6cV5eFx5tCZJ
         JC8WQTkJ7sgzTBB5ZUS3R+dr8YKv5GkNZcYMa90e1QaIcclg7XrG9dv+hOBv/adujKzi
         TRQA==
X-Gm-Message-State: AOJu0Yz2nGoz4rQN3dRbjanv9Al0U7RwXvOVfORnqQO+5v0Wb6H40LN9
        8oIj98X/SGac4Cckd4+d5yHjoijRkg6tSGLl
X-Google-Smtp-Source: AGHT+IFBjgRIDCtzAKPVmSPo5A2FXodlMl6FdCIFHyY/yESqddzf1VVnrMXydOW5l3aehA6HS6R2uQ==
X-Received: by 2002:a0d:d987:0:b0:59f:728b:ac11 with SMTP id b129-20020a0dd987000000b0059f728bac11mr3833303ywe.43.1695981827871;
        Fri, 29 Sep 2023 03:03:47 -0700 (PDT)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com. [209.85.128.177])
        by smtp.gmail.com with ESMTPSA id r188-20020a0dcfc5000000b00565271801b6sm5347922ywd.59.2023.09.29.03.03.47
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Sep 2023 03:03:47 -0700 (PDT)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-59f82ad1e09so108866117b3.0
        for <linux-m68k@lists.linux-m68k.org>; Fri, 29 Sep 2023 03:03:47 -0700 (PDT)
X-Received: by 2002:a81:6e85:0:b0:57a:f72:ebf8 with SMTP id
 j127-20020a816e85000000b0057a0f72ebf8mr3927704ywc.28.1695981827313; Fri, 29
 Sep 2023 03:03:47 -0700 (PDT)
MIME-Version: 1.0
References: <6f30b86b83b972e9902b62295f397a20512d5507.1695977960.git.geert@linux-m68k.org>
 <dd94cc5b-4918-0342-4781-69a031ab2d1f@vivier.eu>
In-Reply-To: <dd94cc5b-4918-0342-4781-69a031ab2d1f@vivier.eu>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 29 Sep 2023 12:03:35 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWOMbYqYurJ_KnxmY75soNsA=TBea6b2VZAG7eJRPy-mg@mail.gmail.com>
Message-ID: <CAMuHMdWOMbYqYurJ_KnxmY75soNsA=TBea6b2VZAG7eJRPy-mg@mail.gmail.com>
Subject: Re: [PATCH] m68k: defconfig: Update virt_defconfig for v6.6-rc3
To:     Laurent Vivier <laurent@vivier.eu>
Cc:     linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Laurent,

On Fri, Sep 29, 2023 at 11:44 AM Laurent Vivier <laurent@vivier.eu> wrote:
> Le 29/09/2023 à 11:01, Geert Uytterhoeven a écrit :
> >    - Enable CONFIG_DRM_FBDEV_EMULATION and CONFIG_FB_DEVICE (no longer
> >      auto-enabled since commit bb6c4507fe825f1b ("drm: fix up fbdev
> >      Kconfig defaults")),
> >    - Drop CONFIG_FRAMEBUFFER_CONSOLE=y (auto-enabled since commit
> >      bb6c4507fe825f1b ("drm: fix up fbdev Kconfig defaults")).
> >
> > Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> > ---
> > Perhaps CONFIG_FB_DEVICE should not be enabled?
>
> Why do you think it should not be enabled?

Because virt uses virtio_gpudrm.

> I think X was needing this to work on m68k.

Perhaps a version of X or Wayland can work with virtio_gpudrm
directly, without needing DRM's fbdev emulation and /dev/fb0?

DRM's fbdev emulation is still needed for the text console, of course.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
