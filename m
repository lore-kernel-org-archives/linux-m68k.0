Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C6D1C7EE22
	for <linux-m68k@archiver.kernel.org>; Thu, 11 May 2023 07:02:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237269AbjEKHCr convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 11 May 2023 03:02:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237224AbjEKHCe (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 11 May 2023 03:02:34 -0400
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A05876BC
        for <linux-m68k@lists.linux-m68k.org>; Thu, 11 May 2023 00:02:00 -0700 (PDT)
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-1929818d7faso49208550fac.0
        for <linux-m68k@lists.linux-m68k.org>; Thu, 11 May 2023 00:02:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683788510; x=1686380510;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gv6cvH2UY+DsSAH/1SoTqLLUBTfL/OySbHO2647mvDo=;
        b=IzknwCmVbRGDryDMSXh4/eNL1OkNnAtweGdxyN9I3MhVHXu/mzHWdSaNo+GYTPjGVE
         RF++nGn7xyoEtIRktPnCphu1M4TXTPxX7bDZ5a7e5Yf4zKLTTJb7VLlgiQpg1fReaypu
         w99bGmRX1uvfDZ141LFSo5jQ2JTpQqyDUUTbCbOxAXGvikuCKWXzctHpbe/JVDbSeUa6
         RYHzSkRuPhNzYYM71d9+yIIJ6v5RxY/tXJHkHgogvEsbYUfC0QashbT51U1HSZlvRGzi
         dKHouKC/IbI/2LoATGOt/stbfgNfxk+syhdRhDB5JGV37d4hozeK7QJo+nIRh+mfQaiV
         GQqQ==
X-Gm-Message-State: AC+VfDwiPPbW9yJ3VYsyxS3S2naxykgU99mB07R7GrHr7CLdtQo5FVJC
        COmlDRnr0IALNCJ2np73pkSs5Wzzurt0Fw==
X-Google-Smtp-Source: ACHHUZ7H1pe/RYP2rckPdJpdGffDs+5DdrQXxh6R0yU27DXDJ08bSvPnxfGg5BA3jrqvU0Ts0HKBaw==
X-Received: by 2002:a4a:6c1a:0:b0:54f:84ea:84e4 with SMTP id q26-20020a4a6c1a000000b0054f84ea84e4mr3818361ooc.3.1683788510316;
        Thu, 11 May 2023 00:01:50 -0700 (PDT)
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com. [209.85.160.47])
        by smtp.gmail.com with ESMTPSA id i18-20020a4addd2000000b00541f66fdac8sm6923599oov.17.2023.05.11.00.01.49
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 May 2023 00:01:50 -0700 (PDT)
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-1929818d7faso49208491fac.0
        for <linux-m68k@lists.linux-m68k.org>; Thu, 11 May 2023 00:01:49 -0700 (PDT)
X-Received: by 2002:a25:1342:0:b0:b25:a1e1:5b65 with SMTP id
 63-20020a251342000000b00b25a1e15b65mr22072246ybt.5.1683788488909; Thu, 11 May
 2023 00:01:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230510195806.2902878-1-nphamcs@gmail.com>
In-Reply-To: <20230510195806.2902878-1-nphamcs@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 11 May 2023 09:01:17 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV=PNCb1VYfUkEb9rPwGVB=1tkwvm-XBqECyhHR4SNGKg@mail.gmail.com>
Message-ID: <CAMuHMdV=PNCb1VYfUkEb9rPwGVB=1tkwvm-XBqECyhHR4SNGKg@mail.gmail.com>
Subject: Re: [PATCH] cachestat: wire up cachestat for other architectures
To:     Nhat Pham <nphamcs@gmail.com>
Cc:     akpm@linux-foundation.org, linux-mm@kvack.org,
        linux-api@vger.kernel.org, kernel-team@meta.com,
        linux-arch@vger.kernel.org, hannes@cmpxchg.org,
        richard.henderson@linaro.org, ink@jurassic.park.msu.ru,
        mattst88@gmail.com, linux@armlinux.org.uk, monstr@monstr.eu,
        tsbogend@alpha.franken.de, James.Bottomley@hansenpartnership.com,
        deller@gmx.de, mpe@ellerman.id.au, npiggin@gmail.com,
        christophe.leroy@csgroup.eu, hca@linux.ibm.com, gor@linux.ibm.com,
        agordeev@linux.ibm.com, borntraeger@linux.ibm.com,
        svens@linux.ibm.com, ysato@users.sourceforge.jp, dalias@libc.org,
        glaubitz@physik.fu-berlin.de, davem@davemloft.net,
        chris@zankel.net, jcmvbkbc@gmail.com, linux-alpha@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-ia64@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
        linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
        linux-sh@vger.kernel.org, sparclinux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Nat,

On Wed, May 10, 2023 at 9:58 PM Nhat Pham <nphamcs@gmail.com> wrote:
> cachestat is previously only wired in for x86 (and architectures using
> the generic unistd.h table):
>
> https://lore.kernel.org/lkml/20230503013608.2431726-1-nphamcs@gmail.com/
>
> This patch wires cachestat in for all the other architectures.
>
> Signed-off-by: Nhat Pham <nphamcs@gmail.com>
> ---
>  arch/alpha/kernel/syscalls/syscall.tbl      | 1 +
>  arch/arm/tools/syscall.tbl                  | 1 +

Looking at the last addition of a syscall (commit 21b084fdf2a49ca1
("mm/mempolicy: wire up syscall set_mempolicy_home_node"), it looks
like you forgot to update arm64 in compat mode? Or is that not needed?

>  arch/ia64/kernel/syscalls/syscall.tbl       | 1 +
>  arch/m68k/kernel/syscalls/syscall.tbl       | 1 +

For m68k:
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

>  arch/microblaze/kernel/syscalls/syscall.tbl | 1 +
>  arch/mips/kernel/syscalls/syscall_n32.tbl   | 1 +
>  arch/mips/kernel/syscalls/syscall_n64.tbl   | 1 +
>  arch/mips/kernel/syscalls/syscall_o32.tbl   | 1 +
>  arch/parisc/kernel/syscalls/syscall.tbl     | 1 +
>  arch/powerpc/kernel/syscalls/syscall.tbl    | 1 +
>  arch/s390/kernel/syscalls/syscall.tbl       | 1 +
>  arch/sh/kernel/syscalls/syscall.tbl         | 1 +
>  arch/sparc/kernel/syscalls/syscall.tbl      | 1 +
>  arch/xtensa/kernel/syscalls/syscall.tbl     | 1 +
>  14 files changed, 14 insertions(+)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
