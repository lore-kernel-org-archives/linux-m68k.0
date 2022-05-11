Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 003E7C433F5
	for <linux-m68k@archiver.kernel.org>; Wed, 11 May 2022 12:54:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242825AbiEKMyw convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 11 May 2022 08:54:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242827AbiEKMyu (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 11 May 2022 08:54:50 -0400
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C22769CF5
        for <linux-m68k@lists.linux-m68k.org>; Wed, 11 May 2022 05:54:49 -0700 (PDT)
Received: by mail-qv1-f53.google.com with SMTP id f3so2011145qvi.2
        for <linux-m68k@lists.linux-m68k.org>; Wed, 11 May 2022 05:54:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Q5qER0/5H5wBfui39NpZxFiYcytefU8SErVM/nlWBlU=;
        b=3C9VjKW4hb4R/2hqlm1Q7AzdWFwfDaPfOzWb6m5Lq68GxBI+/IVmCmxXF39iKrtLgL
         VQWx1GFA8pfF3KElt7eme1GpxEsKx6tc4kzGEkFsWD1xojt8clg0H7fjDx3F4CHo9jsW
         +98WeCpWOcb8nJlWFgztxuTVpp6PH6NoNYWOzbc/osMcLUz3npYt51qH/WQXofCHyHGn
         dgW4fiOPU2wq+fLtI+MkC8j2lc/nj4qnmuOPFkB6Xrrtm/Fr7PgZ7mmYbnM5GFacxEi4
         0BQRaWoHl7SmeKrowfS7zpudVzXVz/do+xV9DFtgrF5doFTzMw6V/btmw5QwwBhDVyA/
         K9Qw==
X-Gm-Message-State: AOAM533DIJnPWXf2OBtknJy4nlQWGLHWZQ1JekFjVl1PZtpPWcT1GGCc
        C8rGWiV03qNpkpFR10n3wr1mWdeSXfmj3Q==
X-Google-Smtp-Source: ABdhPJwzvcOuaso+7LaYZTnEpX0tg6fLwhGMm6+I6w+N8wyNc6JJW6s4hrnSain/wUgtJv7Dxc2cFg==
X-Received: by 2002:a05:6214:4103:b0:440:e4d1:a2a0 with SMTP id kc3-20020a056214410300b00440e4d1a2a0mr22065699qvb.42.1652273688172;
        Wed, 11 May 2022 05:54:48 -0700 (PDT)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com. [209.85.128.176])
        by smtp.gmail.com with ESMTPSA id 184-20020a3708c1000000b0069fc13ce20asm1072348qki.59.2022.05.11.05.54.47
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 May 2022 05:54:47 -0700 (PDT)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-2f7bb893309so19476967b3.12
        for <linux-m68k@lists.linux-m68k.org>; Wed, 11 May 2022 05:54:47 -0700 (PDT)
X-Received: by 2002:a0d:d689:0:b0:2fb:9a57:8517 with SMTP id
 y131-20020a0dd689000000b002fb9a578517mr2566059ywd.502.1652273687431; Wed, 11
 May 2022 05:54:47 -0700 (PDT)
MIME-Version: 1.0
References: <e0a9cf982a80f14efbf01cdc38e31128a9f41999.1652262437.git.geert@linux-m68k.org>
In-Reply-To: <e0a9cf982a80f14efbf01cdc38e31128a9f41999.1652262437.git.geert@linux-m68k.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 11 May 2022 14:54:36 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW3BsuJOx6r1TmUJJYhqn_v5iDznTw0gnbayQAjBp2OYA@mail.gmail.com>
Message-ID: <CAMuHMdW3BsuJOx6r1TmUJJYhqn_v5iDznTw0gnbayQAjBp2OYA@mail.gmail.com>
Subject: Re: [PATCH] m68k: math-emu: Fix dependencies of math emulation support
To:     Greg Ungerer <gerg@uclinux.org>
Cc:     linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Wed, May 11, 2022 at 11:48 AM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> If CONFIG_M54xx=y, CONFIG_MMU=y, and CONFIG_M68KFPU_EMU=y:
>
>     {standard input}:272: Error: invalid instruction for this architecture; needs 68000 or higher (68000 [68ec000, 68hc000, 68hc001, 68008, 68302, 68306, 68307, 68322, 68356], 68010, 68020 [68k, 68ec020], 68030 [68ec030], 68040 [68ec040], 68060 [68ec060], cpu32 [68330, 68331, 68332, 68333, 68334, 68336, 68340, 68341, 68349, 68360], fidoa [fido]) -- statement `sub.b %d1,%d3' ignored
>     {standard input}:609: Error: invalid instruction for this architecture; needs 68020 or higher (68020 [68k, 68ec020], 68030 [68ec030], 68040 [68ec040], 68060 [68ec060]) -- statement `bfextu 4(%a1){%d0,#8},%d0' ignored
>     {standard input}:752: Error: operands mismatch -- statement `mulu.l 4(%a0),%d3:%d0' ignored
>     {standard input}:1155: Error: operands mismatch -- statement `divu.l %d0,%d3:%d7' ignored
>
> The math emulation support code is intended for 68020 and higher, and
> uses several instructions or instruction modes not available on coldfire
> or 68000.
>
> Originally, the dependency of M68KFPU_EMU on MMU was fine, as MMU
> support was only available on 68020 or higher.  But this assumption
> was broken by the introduction of MMU support for M547x and M548x.
>
> Drop the dependency on MMU, as the code should work fine on 68020 and up
> without MMU (which are not yet supported by Linux, though).
> Add dependencies on M68K_CLASSIC (to rule out Coldfire) and FPU (to rule
> out 68xxx below 68020).
>
> Fixes: 1f7034b9616e6f14 ("m68k: allow ColdFire 547x and 548x CPUs to be built with MMU enabled")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
> To be queued in the m68k for-v5.19 branch.
>
>  arch/m68k/Kconfig.cpu | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/m68k/Kconfig.cpu b/arch/m68k/Kconfig.cpu
> index 16ea9a67723c09dc..9abddbbee819f1d3 100644
> --- a/arch/m68k/Kconfig.cpu
> +++ b/arch/m68k/Kconfig.cpu
> @@ -327,7 +327,7 @@ comment "Processor Specific Options"
>
>  config M68KFPU_EMU
>         bool "Math emulation support"
> -       depends on MMU
> +       depends on M68K_CLASSIC && FPU
                      ^^^^^^^^^^^^
Whoops, that's a silly typo...

>         help
>           At some point in the future, this will cause floating-point math
>           instructions to be emulated by the kernel on machines that lack a

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
