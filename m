Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 527EEC433EF
	for <linux-m68k@archiver.kernel.org>; Fri, 13 May 2022 06:56:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377552AbiEMG4s convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 13 May 2022 02:56:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377531AbiEMG4r (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 13 May 2022 02:56:47 -0400
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9A544D254
        for <linux-m68k@lists.linux-m68k.org>; Thu, 12 May 2022 23:56:46 -0700 (PDT)
Received: by mail-qv1-f53.google.com with SMTP id h13so6123572qvh.0
        for <linux-m68k@lists.linux-m68k.org>; Thu, 12 May 2022 23:56:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=A3H48Bilaow1oSqwuU8KPx26Mv8fSUb+Kt8mYEoS3qk=;
        b=BNOGLDys1VLvemeAIg8PvAAdGOZ85YTmO/Vm+/XkQAOqyB45nAzv7KNvNqcH5y69PL
         ixLjANihLWcq0TyFsOCilap42awAoA+oX5SYWzR8jL5eNNzvJeVMN0KnK/EWTo7TuXeH
         AK7EvUqo4dpQUeda1egWkrHmoigqhbqbFB2V7nUPypWP0ve+HncA+jqGmGKyHEB1LhCM
         /M8Lnrl/8A1F09iBWY2ZNpZz/jeuiH7ex2I9hj2fSiMw6L8i8/jd8oRa90FYNZA4QpZg
         fPcO2ZNUO8a6iq7Fap1mg2x41ezStU6Wf8uN3OuTxvZ4wErm40mEwyUtmcMudJlOaR8E
         XrqQ==
X-Gm-Message-State: AOAM532aOhCYR+WFsWdjxubmW4oXf1tTsM0yBhq1EKfH9KutapjnhOno
        DDmPovpcOGqrvtWEbLGAYKXFnBB7Qaa5Rw==
X-Google-Smtp-Source: ABdhPJwuLAicvCQ3pTK/Sa64C2jZtjZePigiFpM1gSuAT3HHOn5QOuTxVtI6fZLvbTFPWioP+9xb4Q==
X-Received: by 2002:a05:6214:27e4:b0:45a:a04d:d835 with SMTP id jt4-20020a05621427e400b0045aa04dd835mr3092930qvb.82.1652425005772;
        Thu, 12 May 2022 23:56:45 -0700 (PDT)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com. [209.85.219.171])
        by smtp.gmail.com with ESMTPSA id 8-20020a05620a048800b0069fc13ce24asm930468qkr.123.2022.05.12.23.56.45
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 May 2022 23:56:45 -0700 (PDT)
Received: by mail-yb1-f171.google.com with SMTP id g28so13732081ybj.10
        for <linux-m68k@lists.linux-m68k.org>; Thu, 12 May 2022 23:56:45 -0700 (PDT)
X-Received: by 2002:a25:4506:0:b0:648:cfc2:301d with SMTP id
 s6-20020a254506000000b00648cfc2301dmr3267840yba.380.1652425005199; Thu, 12
 May 2022 23:56:45 -0700 (PDT)
MIME-Version: 1.0
References: <e0a9cf982a80f14efbf01cdc38e31128a9f41999.1652262437.git.geert@linux-m68k.org>
 <CAMuHMdW3BsuJOx6r1TmUJJYhqn_v5iDznTw0gnbayQAjBp2OYA@mail.gmail.com> <db869491-142f-4360-0f3c-e4395563088b@uclinux.org>
In-Reply-To: <db869491-142f-4360-0f3c-e4395563088b@uclinux.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 13 May 2022 08:56:33 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUb=c5WYviGqJXSVtWe4rob28oOQsPE2V==V3P7hDWwyg@mail.gmail.com>
Message-ID: <CAMuHMdUb=c5WYviGqJXSVtWe4rob28oOQsPE2V==V3P7hDWwyg@mail.gmail.com>
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

Hi Greg,

On Fri, May 13, 2022 at 1:23 AM Greg Ungerer <gerg@uclinux.org> wrote:
> On 11/5/22 22:54, Geert Uytterhoeven wrote:
> > On Wed, May 11, 2022 at 11:48 AM Geert Uytterhoeven
> > <geert@linux-m68k.org> wrote:
> >> If CONFIG_M54xx=y, CONFIG_MMU=y, and CONFIG_M68KFPU_EMU=y:
> >>
> >>      {standard input}:272: Error: invalid instruction for this architecture; needs 68000 or higher (68000 [68ec000, 68hc000, 68hc001, 68008, 68302, 68306, 68307, 68322, 68356], 68010, 68020 [68k, 68ec020], 68030 [68ec030], 68040 [68ec040], 68060 [68ec060], cpu32 [68330, 68331, 68332, 68333, 68334, 68336, 68340, 68341, 68349, 68360], fidoa [fido]) -- statement `sub.b %d1,%d3' ignored
> >>      {standard input}:609: Error: invalid instruction for this architecture; needs 68020 or higher (68020 [68k, 68ec020], 68030 [68ec030], 68040 [68ec040], 68060 [68ec060]) -- statement `bfextu 4(%a1){%d0,#8},%d0' ignored
> >>      {standard input}:752: Error: operands mismatch -- statement `mulu.l 4(%a0),%d3:%d0' ignored
> >>      {standard input}:1155: Error: operands mismatch -- statement `divu.l %d0,%d3:%d7' ignored
> >>
> >> The math emulation support code is intended for 68020 and higher, and
> >> uses several instructions or instruction modes not available on coldfire
> >> or 68000.
> >>
> >> Originally, the dependency of M68KFPU_EMU on MMU was fine, as MMU
> >> support was only available on 68020 or higher.  But this assumption
> >> was broken by the introduction of MMU support for M547x and M548x.
> >>
> >> Drop the dependency on MMU, as the code should work fine on 68020 and up
> >> without MMU (which are not yet supported by Linux, though).
> >> Add dependencies on M68K_CLASSIC (to rule out Coldfire) and FPU (to rule
> >> out 68xxx below 68020).
> >>
> >> Fixes: 1f7034b9616e6f14 ("m68k: allow ColdFire 547x and 548x CPUs to be built with MMU enabled")
> >> Reported-by: kernel test robot <lkp@intel.com>
> >> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> >> ---
> >> To be queued in the m68k for-v5.19 branch.
> >>
> >>   arch/m68k/Kconfig.cpu | 2 +-
> >>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/arch/m68k/Kconfig.cpu b/arch/m68k/Kconfig.cpu
> >> index 16ea9a67723c09dc..9abddbbee819f1d3 100644
> >> --- a/arch/m68k/Kconfig.cpu
> >> +++ b/arch/m68k/Kconfig.cpu
> >> @@ -327,7 +327,7 @@ comment "Processor Specific Options"
> >>
> >>   config M68KFPU_EMU
> >>          bool "Math emulation support"
> >> -       depends on MMU
> >> +       depends on M68K_CLASSIC && FPU
> >                        ^^^^^^^^^^^^
> > Whoops, that's a silly typo...
>
> Are you going to resend, or are you thinking of changing the way this is done?

I was going to resend, with the above fixed, and an improved patch
description w.r.t. the dependency on FPU.

> I had thought that CONFIG_FPU enabled meant you had some type of
> floating point support in the kernel - be it hardware or software emulated.
> So I don't have a problem with this "as is".

That matches my understanding, too.

BTW, I'm not familiar with Coldfire FPU support. Does it rely on any
emulation (e.g. for transcendental functions, like '040/'060)?
Would there be any point in making the math emulation code
Coldfire-proof?

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
