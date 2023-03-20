Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA7C4C6FD1D
	for <linux-m68k@archiver.kernel.org>; Mon, 20 Mar 2023 14:32:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231693AbjCTOcN convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 20 Mar 2023 10:32:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231288AbjCTOcL (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 20 Mar 2023 10:32:11 -0400
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72DDC14218
        for <linux-m68k@lists.linux-m68k.org>; Mon, 20 Mar 2023 07:31:58 -0700 (PDT)
Received: by mail-yb1-f178.google.com with SMTP id j7so13290382ybg.4
        for <linux-m68k@lists.linux-m68k.org>; Mon, 20 Mar 2023 07:31:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679322717;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O54noMvqG3UegcIjTcDUZ+r5sq4m1GQijs9yejp9gRE=;
        b=qaQJkSIAVtxXYYPsts3GYd+2HtrV0f4JF189U2etnfSePjzlxj/H9oLFiPKtiuPngG
         shE36//ABZ40h9+7xNOJ1ky0t4nb8su07vse/d4EYslItQqvFfJ4u3d1an8w6x1genXR
         WNuauy0ugBusXXwd7Xu023qHjaI4d9Jo+BM+8Yx6JuSN/NHSRXAFDJQ4nvbD75yVRTSE
         06gE4Yt2eXPqdH5NrJRZ1S13I8n9UbPEo/h9o5P2PgDW08NXntuNQhAjigNwecdEer8I
         NCRxVe3CkkJ+nhVOZ+//7ItdogEaDmn2ROUlptslbkh/fivaHcVfEB47+Km46xIzpTaG
         UQmA==
X-Gm-Message-State: AO0yUKVPHzIhumDN/9CnPAGDA7pJtwm8ueV7/QHzfwwJh4wLLTVOAnMK
        ZzYd521qu80iErOl9iT33pZBBhNd1lobUw==
X-Google-Smtp-Source: AK7set+xxcSNgUBlH8xc+Y2gVKjycJfSn2Jix/jmliKQtyx3YPKQvIcs82KjNrG9SDJ2GIWPU9vVVg==
X-Received: by 2002:a25:ac22:0:b0:b6d:5e86:7ed2 with SMTP id w34-20020a25ac22000000b00b6d5e867ed2mr1442723ybi.36.1679322717282;
        Mon, 20 Mar 2023 07:31:57 -0700 (PDT)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com. [209.85.219.177])
        by smtp.gmail.com with ESMTPSA id 12-20020a370b0c000000b0074680682acdsm2752415qkl.76.2023.03.20.07.31.56
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Mar 2023 07:31:57 -0700 (PDT)
Received: by mail-yb1-f177.google.com with SMTP id k17so2546028ybm.11
        for <linux-m68k@lists.linux-m68k.org>; Mon, 20 Mar 2023 07:31:56 -0700 (PDT)
X-Received: by 2002:a05:6902:120b:b0:b6e:b924:b96f with SMTP id
 s11-20020a056902120b00b00b6eb924b96fmr542059ybu.3.1679322716693; Mon, 20 Mar
 2023 07:31:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230320123202.14474-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20230320123202.14474-1-lukas.bulwahn@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 20 Mar 2023 15:31:45 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXoPXjXSr=-CnQnNFBf2bd1Oyj++nFekAUnhaj69Rv7JA@mail.gmail.com>
Message-ID: <CAMuHMdXoPXjXSr=-CnQnNFBf2bd1Oyj++nFekAUnhaj69Rv7JA@mail.gmail.com>
Subject: Re: [PATCH] m68k: remove obsolete config NO_KERNEL_MSG
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc:     linux-m68k@lists.linux-m68k.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Lukas,

On Mon, Mar 20, 2023 at 1:32 PM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
> The use of the config NO_KERNEL_MSG is long gone. Remove this config from
> m68k's debug kernel configuration setup.
>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

Thanks for your patch!

The last user was removed 20 years ago...

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
i.e. will queue in the m68k for-v6.4 branch.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
