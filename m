Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FA89C32771
	for <linux-m68k@archiver.kernel.org>; Mon, 26 Sep 2022 09:57:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234200AbiIZJ5S (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 26 Sep 2022 05:57:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233095AbiIZJ5R (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 26 Sep 2022 05:57:17 -0400
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95CF826AC0
        for <linux-m68k@lists.linux-m68k.org>; Mon, 26 Sep 2022 02:57:16 -0700 (PDT)
Received: by mail-qt1-f180.google.com with SMTP id w2so3736367qtv.9
        for <linux-m68k@lists.linux-m68k.org>; Mon, 26 Sep 2022 02:57:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=wKItE+4AXq4ijfjw/zsb4jrjt0VwS9VW608UoTuf7bY=;
        b=limYLiJIhx4iQZVpBwzZvXgL/v3TD1ZbKZHU2dFXljUTZe8c57BSrnU2J/JkSVXNEE
         d0wAC6q1330YEyo12+Sm6Y3V2vwokQNYN2DMzCdo2DrrgWUj+ooFhf254jF4RmI60Axb
         GbQgp+B+rXfJEjCcaSplIanHu3rcZiyIchwGAxAD/lY7FdVmvSiyPBbgUODUPNhXpZ9x
         qVuWN8EzyU5rEyNlhfND0OEo1tMduB+4prGHUOJFWcOlUJwDMbfqQbhV2t5S1CyPEMhn
         dxITqGf1OMchlrEJRpnWGLjX3f/f6petlDqzH5LxhKZc3/3HkYaSEg7zQwu0JPSsms+x
         89tQ==
X-Gm-Message-State: ACrzQf2LF2+WP4xwMolhk+ra4jqsg9TynPMpve+WQixWmFVKag7NwBdm
        rSxjubVOy5Nz4kCghtS/scyx390Tx7IKjQ==
X-Google-Smtp-Source: AMsMyM6Bz92qmtI2oBrOr4uY2BNhSx5Ojdmg/pc6Ji3ZR1zDNf/nC5jqwhu6vi9WReB2MY5d32FjTA==
X-Received: by 2002:ac8:7d46:0:b0:35c:d831:5237 with SMTP id h6-20020ac87d46000000b0035cd8315237mr17094087qtb.639.1664186235400;
        Mon, 26 Sep 2022 02:57:15 -0700 (PDT)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com. [209.85.219.173])
        by smtp.gmail.com with ESMTPSA id cf14-20020a05622a400e00b0031f41ea94easm10471106qtb.28.2022.09.26.02.57.14
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Sep 2022 02:57:15 -0700 (PDT)
Received: by mail-yb1-f173.google.com with SMTP id e187so7642936ybh.10
        for <linux-m68k@lists.linux-m68k.org>; Mon, 26 Sep 2022 02:57:14 -0700 (PDT)
X-Received: by 2002:a5b:506:0:b0:6af:ffac:4459 with SMTP id
 o6-20020a5b0506000000b006afffac4459mr18511883ybp.365.1664186234639; Mon, 26
 Sep 2022 02:57:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220923170340.4099226-1-Jason@zx2c4.com>
In-Reply-To: <20220923170340.4099226-1-Jason@zx2c4.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 26 Sep 2022 11:57:02 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVJoocGUugnhv=pbgu7z6MFexmRGH1JkQCjm9g-=HiowQ@mail.gmail.com>
Message-ID: <CAMuHMdVJoocGUugnhv=pbgu7z6MFexmRGH1JkQCjm9g-=HiowQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] m68k: process bootinfo records before saving them
To:     "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc:     linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Fri, Sep 23, 2022 at 7:03 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> The RNG seed boot record is memzeroed after processing, in order to
> preserve forward secrecy. By saving the bootinfo for procfs prior to
> that, forward secrecy is violated, since it becomes possible to recover
> past states. So, save the bootinfo block only after first processing
> them.
>
> Fixes: a1ee38ab1a75 ("m68k: virt: Use RNG seed from bootinfo block")
> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
