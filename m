Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9687BC433F5
	for <linux-m68k@archiver.kernel.org>; Mon, 30 May 2022 07:12:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229930AbiE3HMO (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 30 May 2022 03:12:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233370AbiE3HML (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 30 May 2022 03:12:11 -0400
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3A8F1010
        for <linux-m68k@lists.linux-m68k.org>; Mon, 30 May 2022 00:12:09 -0700 (PDT)
Received: by mail-qk1-f179.google.com with SMTP id b200so10742475qkc.7
        for <linux-m68k@lists.linux-m68k.org>; Mon, 30 May 2022 00:12:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BdhRdmYpzSaLyDZukxciTRFSwXlW7RAhZsMxh7fK1iA=;
        b=M9LbicVeDHwNjO0TMG8QAceHm3Hmg48WWMZE8Be0jAb6OuQd6Pccip7DVNmoIyHQZy
         s4vTmskf8IQYoEjOHIJW75/lExYBlipoGfDTAaSxmJz7mHvCWaZCWHcVrBt1mfisU9pG
         LfwEjzNZA5Wcq4Ndzn6W3/Sj5yY6jbBZOuJ0y7uUTmYcub6B54f/DTHWz6mYxD7EuWUp
         5Z2Y+XOBpup0hOV/PDbwHHhk/3aQXAWh2PGTEz0a+87Upy/8wel8oe2s0uR01gZPBC5V
         t4bEr3/CqHDlE1bJYb97tHEw4QpGoITrzIeOO5NJLUmFXaJQ3bX7pB5RTUV36kamzr4x
         ol4A==
X-Gm-Message-State: AOAM533+HHX4oVkSh83b5HwUT71KH6zRIMAc6lcUPmdXgX+Ya8scHlre
        r1z/ALqTbNcTiR7f/jnWGfBhu6hOVpI=
X-Google-Smtp-Source: ABdhPJyYksSNhidhLRD+pcgUZ8ulY12f9NgThr5KVUCWTr6gtq9niDON/Y+hT76zfavucC8bxZp0Kg==
X-Received: by 2002:ae9:e90d:0:b0:6a3:28eb:1a4f with SMTP id x13-20020ae9e90d000000b006a328eb1a4fmr36990233qkf.21.1653894728375;
        Mon, 30 May 2022 00:12:08 -0700 (PDT)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com. [209.85.128.182])
        by smtp.gmail.com with ESMTPSA id l3-20020a37f503000000b006a5c0dce590sm6522784qkk.79.2022.05.30.00.12.07
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 May 2022 00:12:07 -0700 (PDT)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-30c2f288f13so25390647b3.7
        for <linux-m68k@lists.linux-m68k.org>; Mon, 30 May 2022 00:12:07 -0700 (PDT)
X-Received: by 2002:a0d:f745:0:b0:2fe:e903:b0f8 with SMTP id
 h66-20020a0df745000000b002fee903b0f8mr58276985ywf.383.1653894726993; Mon, 30
 May 2022 00:12:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220530025312.55057-1-wangxiang@cdjrlc.com>
In-Reply-To: <20220530025312.55057-1-wangxiang@cdjrlc.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 30 May 2022 09:11:54 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVk+RStP90cmuWzAY+3tLEJwaaOPR-h=xrLahmCZ_CDOg@mail.gmail.com>
Message-ID: <CAMuHMdVk+RStP90cmuWzAY+3tLEJwaaOPR-h=xrLahmCZ_CDOg@mail.gmail.com>
Subject: Re: [PATCH] m68k: coldfire:Add const to clk_ops
To:     Xiang wangx <wangxiang@cdjrlc.com>
Cc:     Greg Ungerer <gerg@linux-m68k.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Xiang,

On Mon, May 30, 2022 at 4:53 AM Xiang wangx <wangxiang@cdjrlc.com> wrote:
> Struct clk_ops should normally be const.
>
> Signed-off-by: Xiang wangx <wangxiang@cdjrlc.com>

Thanks for your patch!

> --- a/arch/m68k/coldfire/clk.c
> +++ b/arch/m68k/coldfire/clk.c
> @@ -50,7 +50,7 @@ static void __clk_disable0(struct clk *clk)
>         __raw_writeb(clk->slot, MCFPM_PPMSR0);
>  }
>
> -struct clk_ops clk_ops0 = {
> +struct const clk_ops clk_ops0 = {

The "const" should be first on the line.
Please test-compile your patches before submitting them.

>         .enable         = __clk_enable0,
>         .disable        = __clk_disable0,
>  };

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
