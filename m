Return-Path: <SRS0=ubS4=AG=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6918FC433DF
	for <linux-m68k@archiver.kernel.org>; Thu, 25 Jun 2020 08:13:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4B04B2067D
	for <linux-m68k@archiver.kernel.org>; Thu, 25 Jun 2020 08:13:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390456AbgFYIN7 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 25 Jun 2020 04:13:59 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:33537 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726930AbgFYIN6 (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Thu, 25 Jun 2020 04:13:58 -0400
Received: by mail-ot1-f67.google.com with SMTP id n6so4505641otl.0
        for <linux-m68k@vger.kernel.org>; Thu, 25 Jun 2020 01:13:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QVxYKctNEGF85WTSXPf+f5iR129VLJrO5UcsgW7lQ8A=;
        b=clboYOPw1xysJH2Rh7sDEnsIWc2ZGwIoXpB5/9G2g3HC/0ONjoOJiprd5kBvyCM+Iv
         Qk6LEYYn1jNdsOx1VykdsmOCARcM1Ndf/asLn2rPyZGd/BofGisyMAE4He5VxjlnN1SF
         UJhrnxGzT1pZuwFx7YTv9aLRxIyUfVioUrj+ue8XmZsLFBkTqOt73NcKShVywKAN0tCH
         Xn5edL+bu3DdKHxLiJlgJqcxKoZdIqUYUYIqiAIt6NJtdyxWEQnFBgunh1stvr/Zf0uV
         dBVgb8ZZsZKtVgyuhnsevaK67Och3v6JZ1Q832PkVMF6E048zu+997MtlqxaJVsKJTZ9
         M0sQ==
X-Gm-Message-State: AOAM5316BbJsIEIE3drNrHeNM3hnHXYPI5lJS3EyQcbsUW26ai+wjpmm
        hsxWbu2cUVRNmaLekgW6afT+Kqrxn09ASw+Rr1Vp3C+d
X-Google-Smtp-Source: ABdhPJw+FxAwud2oxsiAFWC/Q/kpNol98VxkbavqS4mnzgWt9qD4zFER2yrd7gx0gQX+Of9lE+hWySi4k8i5/3GEMks=
X-Received: by 2002:a9d:6254:: with SMTP id i20mr1502237otk.145.1593072837815;
 Thu, 25 Jun 2020 01:13:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200624233443.3346919-1-angelo.dureghello@timesys.com>
In-Reply-To: <20200624233443.3346919-1-angelo.dureghello@timesys.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 25 Jun 2020 10:13:46 +0200
Message-ID: <CAMuHMdVF848G0S788ufYxz8OO8rLTo-G9PRDO0Did3s0PGTNKg@mail.gmail.com>
Subject: Re: [PATCH] m68k: mm: fix wrong m68k_fixup_info addresses
To:     Angelo Dureghello <angelo.dureghello@timesys.com>
Cc:     Greg Ungerer <gerg@linux-m68k.org>,
        "Linux/m68k" <linux-m68k@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Angelo,

Thanks for your patch!

On Thu, Jun 25, 2020 at 1:28 AM Angelo Dureghello
<angelo.dureghello@timesys.com> wrote:
> On mcf5441x, mmu enabled, using a small initramfs, the boot was
> recently hanging silently in the initial phase, inside
> arch/m68k/mm/init.c, m68k_setup_node()
>
> initrd at 0x47d2f000:0x47d82f64
> overlap at 1073741889 for chunk 0
> overlap at 1073746176 for chunk 0
> overlap at 1073746736 for chunk 0
> overlap at 1073746737 for chunk 0
> overlap at 1073746738 for chunk 0
> overlap at 1073746739 for chunk 0
> overlap at 1073746740 for chunk 0
>
> From some debugging, at m68k_setup_node(), the 25-bits shift value
> (virt_to_node_shift) seems unset, because applied to a wrong
> address (address previously set from m68k_fixup).
>
> Tried some fixes, but the more low-risk and hopefully correct seems
> to just add a volatile inside __virt_to_node_shift(). This seems to
> produce correct addresses for the next fixup to work. Cannot test this
> on other mmu ColdFire cpu's so every test is eventually welcome.
>
> Signed-off-by: Angelo Dureghello <angelo.dureghello@timesys.com>

> --- a/arch/m68k/include/asm/page_mm.h
> +++ b/arch/m68k/include/asm/page_mm.h
> @@ -135,7 +135,7 @@ static inline __attribute_const__ int __virt_to_node_shift(void)
>  {
>         int shift;
>
> -       asm (
> +       asm volatile (
>                 "1:     moveq   #0,%0\n"
>                 m68k_fixup(%c1, 1b)
>                 : "=d" (shift)

Perhaps we should add the volatile to the other asm statements, too?
Andreas?

Which compiler version are you using?
Have you compared the difference in generated code?

With gcc version 8.4.0 (Ubuntu 8.4.0-1ubuntu1~18.04), the above makes
no difference for m68k_setup_node(), and the compiler doesn't even
optimize away the call to __virt_to_node_shift(), which is marked
__attribute_const__.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
