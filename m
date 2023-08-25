Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72CAEC3DA6F
	for <linux-m68k@archiver.kernel.org>; Fri, 25 Aug 2023 07:40:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232296AbjHYHkV convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 25 Aug 2023 03:40:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239564AbjHYHkF (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 25 Aug 2023 03:40:05 -0400
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 917C01FCA
        for <linux-m68k@lists.linux-m68k.org>; Fri, 25 Aug 2023 00:40:02 -0700 (PDT)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-26fc9e49859so405742a91.0
        for <linux-m68k@lists.linux-m68k.org>; Fri, 25 Aug 2023 00:40:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692949202; x=1693554002;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E5r8bhhlGnXrx708tsGw6Ag8gm7AVkEO6BeDk4HD7tk=;
        b=GO1o7wvUAX+eTvVGcRcnoro1cAxPSTBio+2gtwxr8jzJVH91WeDBMbpwwOygEVH7Ku
         /PwkNHeUwKi/T9GLa1uLOdkkBBMBoEVlJlkarl8TQ+5PkEo5uXE+p/fXXIEC3zTc/z9D
         jA8wlNA477sKcbt+p0PbyeAJiMbTdftyu5gzqEj+dNAg4Mwmmx/xhm3+PDYBLqr8/GKB
         XBvmN6OtRkMWeVIFb01RFZgSG7XuxkabqrnaFbLAmbMaLYaY10XuRaFmyGk28oA+YU+N
         PIl7vJ3e83fVk6yycZUfK87hWeqK5ldfMuc/RQj0MtmJW7Nj19ofd0kenQXKUVOipeam
         ahAA==
X-Gm-Message-State: AOJu0YwzbsoIh5OFdgLQLqf0AZev97JkmgQqEmE58JMtoFu8nVNzAJAY
        cnJuYbOMpkax7ZU+MHy7QJXTITtQqzDaEQ6S
X-Google-Smtp-Source: AGHT+IHIB2sA7vAZBxUM71FzhStxCzyCRUYdzY206DHzXkvPEyFWJn3YJcJ7DxaG91XeSIbwruaU6A==
X-Received: by 2002:a17:90a:9a85:b0:26f:4685:5b69 with SMTP id e5-20020a17090a9a8500b0026f46855b69mr12865503pjp.7.1692949201721;
        Fri, 25 Aug 2023 00:40:01 -0700 (PDT)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com. [209.85.210.178])
        by smtp.gmail.com with ESMTPSA id jh15-20020a170903328f00b001bb7a736b4csm958001plb.77.2023.08.25.00.40.00
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Aug 2023 00:40:01 -0700 (PDT)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-68bec3a1c0fso570066b3a.1
        for <linux-m68k@lists.linux-m68k.org>; Fri, 25 Aug 2023 00:40:00 -0700 (PDT)
X-Received: by 2002:a25:34cd:0:b0:d0b:5b6:4629 with SMTP id
 b196-20020a2534cd000000b00d0b05b64629mr19382891yba.46.1692949180028; Fri, 25
 Aug 2023 00:39:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230810141947.1236730-1-arnd@kernel.org> <169292577153.789945.11297239773543112051.b4-ty@oracle.com>
 <3956e2a4-c545-1212-e95f-3cf61a60d6a4@gmail.com>
In-Reply-To: <3956e2a4-c545-1212-e95f-3cf61a60d6a4@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 25 Aug 2023 09:39:28 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWC2S330_Vb_NTHTDC=BakBsw4ouP-eFJv0erV1-jmvTQ@mail.gmail.com>
Message-ID: <CAMuHMdWC2S330_Vb_NTHTDC=BakBsw4ouP-eFJv0erV1-jmvTQ@mail.gmail.com>
Subject: Re: (subset) [PATCH 00/17] -Wmissing-prototype warning fixes
To:     Michael Schmitz <schmitzmic@gmail.com>
Cc:     "Martin K. Petersen" <martin.petersen@oracle.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Matt Turner <mattst88@gmail.com>,
        Vineet Gupta <vgupta@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>,
        Brian Cain <bcain@quicinc.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        WANG Xuerui <kernel@xen0n.name>,
        Michal Simek <monstr@monstr.eu>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Dinh Nguyen <dinguyen@kernel.org>,
        Jonas Bonn <jonas@southpole.se>,
        Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
        Stafford Horne <shorne@gmail.com>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        Helge Deller <deller@gmx.de>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Heiko Carstens <hca@linux.ibm.com>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        x86@kernel.org, Borislav Petkov <bp@alien8.de>,
        Max Filippov <jcmvbkbc@gmail.com>,
        Jens Axboe <axboe@kernel.dk>,
        Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
        Richard Weinberger <richard@nod.at>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        linux-next@vger.kernel.org, linux-alpha@vger.kernel.org,
        linux-snps-arc@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
        linux-hexagon@vger.kernel.org, linux-ia64@vger.kernel.org,
        loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
        linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org,
        linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
        linux-block@vger.kernel.org, linux-scsi@vger.kernel.org,
        linux-mtd@lists.infradead.org, linux-trace-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Michael,

On Fri, Aug 25, 2023 at 3:31 AM Michael Schmitz <schmitzmic@gmail.com> wrote:
> On 25/08/23 13:12, Martin K. Petersen wrote:
> > [11/17] scsi: gvp11: remove unused gvp11_setup() function
> >          https://git.kernel.org/mkp/scsi/c/bfaa4a0ce1bb
>
> I somehow missed that one ...
>
> The gvp11_setup() function was probably a relic from the times before
> module parameters.
>
> Since gvp11_xfer_mask appears to be required for some Amiga systems to
> set the DMA mask, I'd best send a patch to add such a module parameter ...
>
> Do you know any details around the use of DMA masks for Amiga WD33C93
> drivers, Geert?

Doh, it's been a while, and I never had an affected system.
Probably it's needed on A2000 with an accelerator card and GVP II SCSI,
to prevent DMA to RAM banks that do not support fast DMA cycles.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
