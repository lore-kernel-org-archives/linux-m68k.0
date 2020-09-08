Return-Path: <SRS0=nM4c=CR=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C254C433E2
	for <linux-m68k@archiver.kernel.org>; Tue,  8 Sep 2020 07:00:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 005542068D
	for <linux-m68k@archiver.kernel.org>; Tue,  8 Sep 2020 07:00:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728922AbgIHHAa (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 8 Sep 2020 03:00:30 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:43073 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728998AbgIHHAA (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 8 Sep 2020 03:00:00 -0400
Received: by mail-oi1-f196.google.com with SMTP id i17so15504416oig.10
        for <linux-m68k@lists.linux-m68k.org>; Mon, 07 Sep 2020 23:59:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=80BY8rNg7RfD6oxznXYOKPcFZuo8wajfOpZ0OBeC/wY=;
        b=LYlfcOQKqWdUaMdliSpedYX1m8fzoitE5KVLgIEqLD6BOY+hRwCIs/0QHpaLrSGkt1
         bsJNJxFpAl5LOblHrH07/OwmwQsaKfwcE2Px2D7wOJeVpnHfxTy5l4t0ptcrIwcu/yyg
         BJiomeJYZge9XREnQRKzoK36fkl6qBaH+VvgHzZf8upmqjtvJzUI8tZAYpz3ziuh2HKY
         k6jHA7kGOGTwa5gCYPFuJ9AemXZzbSI9wjuY2XVMIiZJcm4c7dYKveu3gRPIABFIrukO
         gBYN2Bhxn3DqDSiCH4XkD75/7eSWZXzRciRF+6T+s1cDLN+wXr6bk2iwyh9pwata4gWw
         BDpg==
X-Gm-Message-State: AOAM530gCJbq3afhdEn2h+drAK2NgZngm9B06D6a3x7RRwXuC7cCEIFO
        moOqx2ZC1dSaDEGUDeXWbt2Hv5GEp6170A4aR2M=
X-Google-Smtp-Source: ABdhPJw+Sdn/Kf/NbESMrEGT3ykKzS7L5e1uWHMt5PE98XyXUrM0snkLRMMoZ/Q/NW5lb7vt9j4vz11Ltnr3Qr8PC/E=
X-Received: by 2002:aca:b742:: with SMTP id h63mr1711017oif.148.1599548399253;
 Mon, 07 Sep 2020 23:59:59 -0700 (PDT)
MIME-Version: 1.0
References: <20200908042708.2511528-1-masahiroy@kernel.org>
In-Reply-To: <20200908042708.2511528-1-masahiroy@kernel.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 8 Sep 2020 08:59:48 +0200
Message-ID: <CAMuHMdVobzKWKnN0ScqSY+Jv3N1ri8=mWEd-SZfH5+je+CVVcQ@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: preprocess module linker script
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild <linux-kbuild@vger.kernel.org>,
        "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Paul Mackerras <paulus@samba.org>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        Will Deacon <will@kernel.org>,
        Anton Ivanov <anton.ivanov@cambridgegreys.com>,
        Linux-Arch <linux-arch@vger.kernel.org>,
        Richard Weinberger <richard@nod.at>,
        Russell King <linux@armlinux.org.uk>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Fenghua Yu <fenghua.yu@intel.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Arnd Bergmann <arnd@arndb.de>, Jeff Dike <jdike@addtoit.com>,
        Jessica Yu <jeyu@kernel.org>,
        linux-um <linux-um@lists.infradead.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Tony Luck <tony.luck@intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Tue, Sep 8, 2020 at 6:29 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
> There was a request to preprocess the module linker script like we
> do for the vmlinux one. (https://lkml.org/lkml/2020/8/21/512)
>
> The difference between vmlinux.lds and module.lds is that the latter
> is needed for external module builds, thus must be cleaned up by
> 'make mrproper' instead of 'make clean'. Also, it must be created
> by 'make modules_prepare'.
>
> You cannot put it in arch/$(SRCARCH)/kernel/, which is cleaned up by
> 'make clean'. I moved arch/$(SRCARCH)/kernel/module.lds to
> arch/$(SRCARCH)/include/asm/module.lds.h, which is included from
> scripts/module.lds.S.
>
> scripts/module.lds is fine because 'make clean' keeps all the
> build artifacts under scripts/.
>
> You can add arch-specific sections in <asm/module.lds.h>.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> Tested-by: Jessica Yu <jeyu@kernel.org>
> Acked-by: Will Deacon <will@kernel.org>

>  arch/m68k/Makefile                                     |  1 -
>  .../{kernel/module.lds => include/asm/module.lds.h}    |  0

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
