Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07B47C433EF
	for <linux-m68k@archiver.kernel.org>; Tue, 12 Jul 2022 09:06:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230135AbiGLJGm (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 12 Jul 2022 05:06:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232062AbiGLJGk (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 12 Jul 2022 05:06:40 -0400
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 020B552FD0
        for <linux-m68k@lists.linux-m68k.org>; Tue, 12 Jul 2022 02:06:39 -0700 (PDT)
Received: by mail-qk1-f180.google.com with SMTP id v6so5769723qkh.2
        for <linux-m68k@lists.linux-m68k.org>; Tue, 12 Jul 2022 02:06:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=t9ec7iguCfy6L3waGgPnWXclPbbw0CysomvMpi7xE8A=;
        b=ttp6PVyhc3aJm5aHduWfsA2m2AOMei+pa8+hAGZcbNPNw2TlZyZrR7oN2lnnFYGizE
         SWnWRUr9QPT58rbX/oFgwPBkMYbnPT05aQMgDsrp4fzEoU/IsuwDYFxtM4CHGCf4eI7z
         GFtb2Kn8QfHunealprda24BLbPH0GpbMhzkakTfldn7jfDE/NP2LuvVo57hUNLFntzj2
         zRkovJNEnaguSHmeB9GJm6Ph77bo0d4RMnJvhMgT3aP4N0R5vyXZya5KwCqX6qp7YENP
         RxbbLOgz0aFSRqA/xbfGgJmTC5ytfxhGM17wTDq+SSVukeKbZ7kDQ9IZ4Wh29/QAoUf3
         XVFw==
X-Gm-Message-State: AJIora8a3sj6f/0HorTDNYld0LV7acRRD9nbqD9CfrzA8hg244+YhS3q
        rmkdtdjDDWgZdF0NGiWwBoU0mlDvvCLqyQ==
X-Google-Smtp-Source: AGRyM1s7UYErcsQsnNUrqqsZIpFM20RVDQgZn6MH0ZXMTuYw411d56yxRre4mfB9Qoo8MdeCBlekWA==
X-Received: by 2002:ae9:f302:0:b0:6b5:520d:194d with SMTP id p2-20020ae9f302000000b006b5520d194dmr14193513qkg.617.1657616797971;
        Tue, 12 Jul 2022 02:06:37 -0700 (PDT)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com. [209.85.219.180])
        by smtp.gmail.com with ESMTPSA id o22-20020a05620a0d5600b006af08c26774sm8075728qkl.47.2022.07.12.02.06.37
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Jul 2022 02:06:37 -0700 (PDT)
Received: by mail-yb1-f180.google.com with SMTP id n74so12879588yba.3
        for <linux-m68k@lists.linux-m68k.org>; Tue, 12 Jul 2022 02:06:37 -0700 (PDT)
X-Received: by 2002:a05:6902:701:b0:66e:a06d:53d7 with SMTP id
 k1-20020a056902070100b0066ea06d53d7mr20596635ybt.604.1657616474618; Tue, 12
 Jul 2022 02:01:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220712075255.1345991-1-chenhuacai@loongson.cn>
 <20220712075255.1345991-3-chenhuacai@loongson.cn> <CAMuHMdUazqHLbc80vpZ+Msg9A3j5aPJ3fx+CdCG3kuWDSf8WSw@mail.gmail.com>
 <CAAhV-H775jXMbcR9j=oLBuHo1PfFziZSUQWttJAEw20sUt+GAA@mail.gmail.com>
In-Reply-To: <CAAhV-H775jXMbcR9j=oLBuHo1PfFziZSUQWttJAEw20sUt+GAA@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 12 Jul 2022 11:01:02 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUHbepd974u5iox3BcOyo_Q2ZgT-znruk+WCt+HMQ_Lgw@mail.gmail.com>
Message-ID: <CAMuHMdUHbepd974u5iox3BcOyo_Q2ZgT-znruk+WCt+HMQ_Lgw@mail.gmail.com>
Subject: Re: [PATCH 3/6] M68K: cpuinfo: Fix a warning for CONFIG_CPUMASK_OFFSTACK
To:     Huacai Chen <chenhuacai@gmail.com>
Cc:     Huacai Chen <chenhuacai@loongson.cn>,
        Arnd Bergmann <arnd@arndb.de>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Michal Simek <monstr@monstr.eu>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>, Jeff Dike <jdike@addtoit.com>,
        Richard Weinberger <richard@nod.at>,
        Anton Ivanov <anton.ivanov@cambridgegreys.com>,
        loongarch@lists.linux.dev, Linux-Arch <linux-arch@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Guo Ren <guoren@kernel.org>, Xuerui Wang <kernel@xen0n.name>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Linux-sh list <linux-sh@vger.kernel.org>,
        linux-um <linux-um@lists.infradead.org>,
        stable <stable@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Huacai,

On Tue, Jul 12, 2022 at 10:53 AM Huacai Chen <chenhuacai@gmail.com> wrote:
> On Tue, Jul 12, 2022 at 4:33 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Tue, Jul 12, 2022 at 9:53 AM Huacai Chen <chenhuacai@loongson.cn> wrote:
> > > When CONFIG_CPUMASK_OFFSTACK and CONFIG_DEBUG_PER_CPU_MAPS is selected,
> >
> > DEBUG_PER_CPU_MAPS depends on SMP, which is not supported on m68k,
> > and thus cannot be enabled.
> This patch is derived from MIPS and LoongArch, I search all
> architectures and change those that look the same as MIPS and
> LoongArch.
> And the warning message below is also a copy-paste from LoongArch, sorry.
>
> Since M68K doesn't support SMP, then this patch seems to make no
> difference, but does it make sense to keep consistency across all
> architectures?

Yes, having consistency is good.  But that should be mentioned in the
patch description, instead of a scary warning CCed to stable ;-)

BTW, you probably want to update the other copy of c_start() in
arch/m68k/kernel/setup_mm.c, too.

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
