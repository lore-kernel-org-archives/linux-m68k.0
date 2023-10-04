Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C2CAE7C4C6
	for <linux-m68k@archiver.kernel.org>; Wed,  4 Oct 2023 14:52:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233270AbjJDOwo convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 4 Oct 2023 10:52:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233155AbjJDOwn (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 4 Oct 2023 10:52:43 -0400
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2A48C1
        for <linux-m68k@lists.linux-m68k.org>; Wed,  4 Oct 2023 07:52:39 -0700 (PDT)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-59f6492b415so9819797b3.0
        for <linux-m68k@lists.linux-m68k.org>; Wed, 04 Oct 2023 07:52:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696431159; x=1697035959;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iD/MXLiPzU2b+Abgh+9ChZTilTJy/oen9oKi+uvAJ04=;
        b=F7eMxDWG5lmpOto+h3/fI0iZy+E/fUKh7hWbn9J3H+zfMR2s6TJjDmdp7uzAidscq7
         Ir6VXHDWVH1qW/E3wa/GlxOCHZ/+PHsbY9zMEGb03k3/BSCvWF1XIT5MZCH831q0gSEc
         d3EestxzH68876xdTw6wCjioC2lMNHB2Y3UBfmsTINXtCXFfCSKLnRcJgprBLX7G0rQb
         BoZpoGrWuc1JmktCr0YYs+tKw6fGFtkOmi/Wl/Ypyzm2PANEloSmvi+Uuv56/MDRK9pP
         6cj1Ft18rUnHoJ8zaKhWc2PKBPdEYdILHJ1Sawjeg8bU/zllqgxpI+cOxrHaP0OplHeL
         nPKQ==
X-Gm-Message-State: AOJu0YzMP5QdNb8iqjhQdYgMbUsxmnL1OCnQgKszF1QI8Ul1qy9RTP0e
        G6+PgTGBznxxLQ4yGoCBU0tZ8H++peEjfg==
X-Google-Smtp-Source: AGHT+IHxB5KVqCD4pTaJgzWg44Etc6GXMf4H/GWvBd4AhrXsUDdAM6eyaRdrd/wAAcAjWLnvMSAlGQ==
X-Received: by 2002:a81:6d45:0:b0:5a1:d216:8d3 with SMTP id i66-20020a816d45000000b005a1d21608d3mr4613317ywc.5.1696431158597;
        Wed, 04 Oct 2023 07:52:38 -0700 (PDT)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com. [209.85.128.180])
        by smtp.gmail.com with ESMTPSA id a130-20020a0dd888000000b00583cf4ed41esm1197117ywe.2.2023.10.04.07.52.38
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Oct 2023 07:52:38 -0700 (PDT)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-59e88a28b98so9731607b3.1
        for <linux-m68k@lists.linux-m68k.org>; Wed, 04 Oct 2023 07:52:38 -0700 (PDT)
X-Received: by 2002:a81:6c42:0:b0:5a4:dde3:6db5 with SMTP id
 h63-20020a816c42000000b005a4dde36db5mr1964498ywc.10.1696431158102; Wed, 04
 Oct 2023 07:52:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230913071350.1939818-1-gerg@kernel.org>
In-Reply-To: <20230913071350.1939818-1-gerg@kernel.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 4 Oct 2023 16:52:24 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXT6+UfUY_1GKefQ7-9a+a1QcX7spBJk6+qY6yUXyNQkA@mail.gmail.com>
Message-ID: <CAMuHMdXT6+UfUY_1GKefQ7-9a+a1QcX7spBJk6+qY6yUXyNQkA@mail.gmail.com>
Subject: Re: [PATCH] m68k: use kernel's generic libgcc functions
To:     Greg Ungerer <gerg@kernel.org>
Cc:     linux-m68k@lists.linux-m68k.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Greg,

On Wed, Sep 13, 2023 at 9:14 AM Greg Ungerer <gerg@kernel.org> wrote:
> From: Greg Ungerer <gerg@linux-m68k.org>
>
> The arch/m68k/lib versions of the libgcc functions: ashldi3, ashrdi3
> and lshrdi3 were taken directly from an older version of gcc.
> We can use the kernel's own generic lib versions of these - they are
> virtually identical. Switch to those and remove the m68k local ones.
>
> Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>

Thanks for your patch!

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
i.e. will queue in the m68k for-v6.7 branch.

> --- a/arch/m68k/Kconfig
> +++ b/arch/m68k/Kconfig
> @@ -19,6 +19,9 @@ config M68K
>         select GENERIC_CPU_DEVICES
>         select GENERIC_IOMAP
>         select GENERIC_IRQ_SHOW
> +       select GENERIC_LIB_ASHLDI3
> +       select GENERIC_LIB_ASHRDI3
> +       select GENERIC_LIB_LSHRDI3
>         select HAS_IOPORT if PCI || ISA || ATARI_ROM_ISA
>         select HAVE_ARCH_SECCOMP
>         select HAVE_ARCH_SECCOMP_FILTER

I guess we can select GENERIC_LIB_MULDI3 if CPU_HAS_NO_MULDIV64
and clean up arch/m68k/lib/muldi3.c, too?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
