Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8A76C83F1E
	for <linux-m68k@archiver.kernel.org>; Mon, 28 Aug 2023 06:43:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229598AbjH1GnX convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 28 Aug 2023 02:43:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229512AbjH1GnQ (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 28 Aug 2023 02:43:16 -0400
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 181E910D
        for <linux-m68k@lists.linux-m68k.org>; Sun, 27 Aug 2023 23:43:14 -0700 (PDT)
Received: by mail-io1-f50.google.com with SMTP id ca18e2360f4ac-79329a8f78bso40500539f.3
        for <linux-m68k@lists.linux-m68k.org>; Sun, 27 Aug 2023 23:43:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693204993; x=1693809793;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1ZAs6BPn0UEnVbrYLaaDeF3O9l7Iturm7FWJFQ5jda0=;
        b=C5cRJg1/V9Q0EHewhaPWLvrApPRiUr/iwyTlNqqNk4qlI599YatsATWqD4kl/a3lL+
         hQZX7SO7WG6FKmGNeTgtsVmj4VO9eOR7jfE+JoozWtgVBZoSEHIMkdwTm9ly2RyhJc90
         NMdb9erFkOUnHaV8jTBQeEHoaxaFMGzEpvc8WPE5PBB0ajXia6mYjPww3Q6401d7BCQQ
         Vgfm2HzpqM5BcdxNCoMNr7sxKNGNyKy22kb9EQuZfaHWrZjVNCQzBSBnhaIszw/OKfsk
         06SMRSB5sfWv2/FiVFkSQyTFeVhSyS5CHPPzs3TqXa1er1KwBVfeZDDljrPFvsX3QCJO
         E4rg==
X-Gm-Message-State: AOJu0YwIe1KkrN3hTWj+3PdscNovaDdO4P5aIlN9sRPttbihoz1zAgvW
        2ce3TMqw82jGWEBhuaOMT+dX6Lu3qnGCkw==
X-Google-Smtp-Source: AGHT+IFNA6eV2rLqc4X12A+DVeEy3OZP7qsOSpKf8/Xm7IFOrx0ty9zSrSnFQO1Fi1q13alcJYh7pg==
X-Received: by 2002:a05:6e02:1d96:b0:345:f28f:cc26 with SMTP id h22-20020a056e021d9600b00345f28fcc26mr19200901ila.24.1693204992718;
        Sun, 27 Aug 2023 23:43:12 -0700 (PDT)
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com. [209.85.166.51])
        by smtp.gmail.com with ESMTPSA id h9-20020a02c729000000b0042acf389ac8sm2229497jao.130.2023.08.27.23.43.12
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Aug 2023 23:43:12 -0700 (PDT)
Received: by mail-io1-f51.google.com with SMTP id ca18e2360f4ac-76c64da0e46so99577839f.0
        for <linux-m68k@lists.linux-m68k.org>; Sun, 27 Aug 2023 23:43:12 -0700 (PDT)
X-Received: by 2002:a25:8502:0:b0:d7a:e348:1e47 with SMTP id
 w2-20020a258502000000b00d7ae3481e47mr3956815ybk.36.1693204971245; Sun, 27 Aug
 2023 23:42:51 -0700 (PDT)
MIME-Version: 1.0
References: <20230810141947.1236730-1-arnd@kernel.org> <169292577153.789945.11297239773543112051.b4-ty@oracle.com>
 <3956e2a4-c545-1212-e95f-3cf61a60d6a4@gmail.com> <CAMuHMdWC2S330_Vb_NTHTDC=BakBsw4ouP-eFJv0erV1-jmvTQ@mail.gmail.com>
 <130b3b57-edb0-184d-5b5f-69b013715773@gmail.com>
In-Reply-To: <130b3b57-edb0-184d-5b5f-69b013715773@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 28 Aug 2023 08:42:39 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUkZmkBSksvaGcDCKz2tsgkwyWgDa+WwCJm2UxFMCj1jw@mail.gmail.com>
Message-ID: <CAMuHMdUkZmkBSksvaGcDCKz2tsgkwyWgDa+WwCJm2UxFMCj1jw@mail.gmail.com>
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

On Sat, Aug 26, 2023 at 12:44 AM Michael Schmitz <schmitzmic@gmail.com> wrote:
> (Incidentally - did you ever publish the m68k full history tree anywhere
> in git?)

You mean the gitified version of the Linux/m68k CVS tree Ralf created
for me because my machine wasn't powerful enough?
No, and I should look into doing that...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
