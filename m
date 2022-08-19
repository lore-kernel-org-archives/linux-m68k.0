Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B46B6C32771
	for <linux-m68k@archiver.kernel.org>; Fri, 19 Aug 2022 09:40:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346395AbiHSJkk (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 19 Aug 2022 05:40:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347482AbiHSJki (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 19 Aug 2022 05:40:38 -0400
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACC381D0C9
        for <linux-m68k@lists.linux-m68k.org>; Fri, 19 Aug 2022 02:40:37 -0700 (PDT)
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-11c896b879bso4656381fac.3
        for <linux-m68k@lists.linux-m68k.org>; Fri, 19 Aug 2022 02:40:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=bRymBzdXlfqAZ/An0FhEAiaTJ5r51uvoXyU3bQ2b9Zs=;
        b=gDUppoU0iJZDVeX2ax/xLDEjwNGT95xHVdfUi4iYo5LpHIijEHsifc4tqnIyEMpJV7
         hfV6uE3DhBrthww7i6T2OS1qm7roCG/RUj/XEAUV/yWUAhsMKEyX4MQTXGLQYCpa/O4s
         rrakZUHtCRCmDVTeJL00mQ/jOJYhvttiagyFAE4NFSKUPTpX5saXE46h3zUZLpedHqV+
         b5CISzUvQ1v2SLumt3XpX1e8u/EUe2zkNCXhSounjre/tEWsd0V9KQeKNxqsNXjDV5FN
         LzZuxkTP4yi7sHLEtepyflitfIyVl2ZHQcG4fYMxiT9rW5r6XWkLJGs4/8YAiGLgPqvJ
         gxhQ==
X-Gm-Message-State: ACgBeo1GCIzLB7JY8Wy9narA7AJzA4vEi0xdbBQSYJhHo+J/K69638sh
        QN3b0j9NgKy0FOSgEul9Rp5I0plC8Oe8diiz
X-Google-Smtp-Source: AA6agR6jhTGeIn0eFyw2lYkDkpS0IBpcgS7fPIsmajVN3D2KNPPRkhkkoJcFUzzxSSGmctq1iM3d6Q==
X-Received: by 2002:a05:6870:d788:b0:10d:7bec:b302 with SMTP id bd8-20020a056870d78800b0010d7becb302mr6536128oab.2.1660902036547;
        Fri, 19 Aug 2022 02:40:36 -0700 (PDT)
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com. [209.85.210.41])
        by smtp.gmail.com with ESMTPSA id h26-20020a9d641a000000b00636faf5e2d9sm1021317otl.39.2022.08.19.02.40.35
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Aug 2022 02:40:36 -0700 (PDT)
Received: by mail-ot1-f41.google.com with SMTP id v12-20020a9d7d0c000000b00638e210c995so2731701otn.13
        for <linux-m68k@lists.linux-m68k.org>; Fri, 19 Aug 2022 02:40:35 -0700 (PDT)
X-Received: by 2002:a25:250b:0:b0:68f:425b:3ee0 with SMTP id
 l11-20020a25250b000000b0068f425b3ee0mr6898469ybl.89.1660902025045; Fri, 19
 Aug 2022 02:40:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220819014406.32266-1-wangkefeng.wang@huawei.com>
In-Reply-To: <20220819014406.32266-1-wangkefeng.wang@huawei.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 19 Aug 2022 11:40:14 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUd5Ww-mtpymykuahHWD+S62Z8qiBMVx8y4okouuzTCAg@mail.gmail.com>
Message-ID: <CAMuHMdUd5Ww-mtpymykuahHWD+S62Z8qiBMVx8y4okouuzTCAg@mail.gmail.com>
Subject: Re: [PATCH] kernel: exit: cleanup release_thread()
To:     Kefeng Wang <wangkefeng.wang@huawei.com>
Cc:     Richard Henderson <richard.henderson@linaro.org>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
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
        "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
        Helge Deller <deller@gmx.de>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Heiko Carstens <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Sven Schnelle <svens@linux.ibm.com>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        "David S . Miller" <davem@davemloft.net>,
        Richard Weinberger <richard@nod.at>,
        Anton Ivanov <anton.ivanov@cambridgegreys.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        "the arch/x86 maintainers" <x86@kernel.org>,
        Chris Zankel <chris@zankel.net>,
        Max Filippov <jcmvbkbc@gmail.com>,
        alpha <linux-alpha@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        arcml <linux-snps-arc@lists.infradead.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-csky@vger.kernel.org,
        "open list:QUALCOMM HEXAGON..." <linux-hexagon@vger.kernel.org>,
        "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
        loongarch@lists.linux.dev,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        Openrisc <openrisc@lists.librecores.org>,
        Parisc List <linux-parisc@vger.kernel.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        linux-s390 <linux-s390@vger.kernel.org>,
        Linux-sh list <linux-sh@vger.kernel.org>,
        sparclinux <sparclinux@vger.kernel.org>,
        linux-um <linux-um@lists.infradead.org>,
        "open list:TENSILICA XTENSA PORT (xtensa)" 
        <linux-xtensa@linux-xtensa.org>,
        Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Kefeng,

On Fri, Aug 19, 2022 at 3:39 AM Kefeng Wang <wangkefeng.wang@huawei.com> wrote:
> Only x86 has own release_thread(), introduce a new weak
> release_thread() function to clean empty definitions in
> other ARCHs.
>
> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>

>  arch/m68k/include/asm/processor.h       | 5 -----

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

> --- a/kernel/exit.c
> +++ b/kernel/exit.c
> @@ -183,6 +183,10 @@ void put_task_struct_rcu_user(struct task_struct *task)
>                 call_rcu(&task->rcu, delayed_put_task_struct);
>  }
>
> +void __weak release_thread(struct task_struct *dead_task)
> +{
> +}

As the default implementation is empty, it might be better to keep
this as a static inline function, protected by #ifndef release_thread,
and let x86 #define release_thread.

> +
>  void release_task(struct task_struct *p)
>  {
>         struct task_struct *leader;

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
