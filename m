Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74CD4C433EF
	for <linux-m68k@archiver.kernel.org>; Tue, 12 Jul 2022 09:13:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229621AbiGLJNn (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 12 Jul 2022 05:13:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229591AbiGLJNm (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 12 Jul 2022 05:13:42 -0400
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39DBDE025
        for <linux-m68k@lists.linux-m68k.org>; Tue, 12 Jul 2022 02:13:41 -0700 (PDT)
Received: by mail-qk1-f181.google.com with SMTP id 20so5774719qky.5
        for <linux-m68k@lists.linux-m68k.org>; Tue, 12 Jul 2022 02:13:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qbAwHtAb/u/Ek/RuPM5JbYjzEl/C/Q4rkrYxQHQ2tOE=;
        b=m2p8/2hYth0JBD+NSDuyPRZfeo/Dq+SKbWWVzl2b70z0g03W+ZFBDEWwF3SW+cokg7
         yW8EmArO9OhMF0T7ETheZMlX7ZM+mAT34KvCcD0Dd6bjQcdV8V2ai07hWGKsiuwHqApS
         wtTzDj27KHQ4LRCXS4jDGtvfkinArCIuABnxPHQW06J7Uf7ea90AvxgdlvY28TcEZHH+
         6RNGreDODpELbXvL5uGtIw8rpVertKFFBCPcdgHVpYFV+qO1yIXL7+It88dudJYd9l22
         zapopzDCaQmZHCSmvCic/PwB6mz7lJcYIJdJdC/opzS/iMI8ZLf7K4ZwyahOEAJnD0KJ
         qBBg==
X-Gm-Message-State: AJIora8D5ZgPTyxQWEL8h1wYGgUf+emoDbsV12azQX6m4Mx7y45C3gCX
        1bL8rITyKbZy+dpRxJOlIA5N4TD0Cdcplw==
X-Google-Smtp-Source: AGRyM1vzutgEScM+WfId9KDMWMbnxZ3h3UPeHbSb5AXaKoza31JyEqRFSa9+oMKrQ55mbDkSGH3ZZw==
X-Received: by 2002:a05:620a:28c9:b0:6b5:768d:aee0 with SMTP id l9-20020a05620a28c900b006b5768daee0mr9683787qkp.456.1657617220091;
        Tue, 12 Jul 2022 02:13:40 -0700 (PDT)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com. [209.85.219.170])
        by smtp.gmail.com with ESMTPSA id s8-20020a05620a29c800b006a67eb4610fsm9505679qkp.116.2022.07.12.02.13.36
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Jul 2022 02:13:37 -0700 (PDT)
Received: by mail-yb1-f170.google.com with SMTP id f73so12866567yba.10
        for <linux-m68k@lists.linux-m68k.org>; Tue, 12 Jul 2022 02:13:36 -0700 (PDT)
X-Received: by 2002:a25:2b48:0:b0:668:3b7d:326c with SMTP id
 r69-20020a252b48000000b006683b7d326cmr20912003ybr.380.1657617216068; Tue, 12
 Jul 2022 02:13:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220712075255.1345991-1-chenhuacai@loongson.cn>
 <20220712075255.1345991-3-chenhuacai@loongson.cn> <CAMuHMdUazqHLbc80vpZ+Msg9A3j5aPJ3fx+CdCG3kuWDSf8WSw@mail.gmail.com>
 <CAAhV-H775jXMbcR9j=oLBuHo1PfFziZSUQWttJAEw20sUt+GAA@mail.gmail.com>
 <CAMuHMdUHbepd974u5iox3BcOyo_Q2ZgT-znruk+WCt+HMQ_Lgw@mail.gmail.com> <CAAhV-H78Fi0aE-h5MOgRa5L+Jt7D0wG0nLcYzx45jVney8T1BQ@mail.gmail.com>
In-Reply-To: <CAAhV-H78Fi0aE-h5MOgRa5L+Jt7D0wG0nLcYzx45jVney8T1BQ@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 12 Jul 2022 11:13:24 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVXFmKR4LuXHYRrSk3Q0VRqATGbsM512DxayWCPCE-wvg@mail.gmail.com>
Message-ID: <CAMuHMdVXFmKR4LuXHYRrSk3Q0VRqATGbsM512DxayWCPCE-wvg@mail.gmail.com>
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

On Tue, Jul 12, 2022 at 11:08 AM Huacai Chen <chenhuacai@gmail.com> wrote:
> On Tue, Jul 12, 2022 at 5:01 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Tue, Jul 12, 2022 at 10:53 AM Huacai Chen <chenhuacai@gmail.com> wrote:
> > > On Tue, Jul 12, 2022 at 4:33 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > > On Tue, Jul 12, 2022 at 9:53 AM Huacai Chen <chenhuacai@loongson.cn> wrote:
> > > > > When CONFIG_CPUMASK_OFFSTACK and CONFIG_DEBUG_PER_CPU_MAPS is selected,
> > > >
> > > > DEBUG_PER_CPU_MAPS depends on SMP, which is not supported on m68k,
> > > > and thus cannot be enabled.
> > > This patch is derived from MIPS and LoongArch, I search all
> > > architectures and change those that look the same as MIPS and
> > > LoongArch.
> > > And the warning message below is also a copy-paste from LoongArch, sorry.
> > >
> > > Since M68K doesn't support SMP, then this patch seems to make no
> > > difference, but does it make sense to keep consistency across all
> > > architectures?
> >
> > Yes, having consistency is good.  But that should be mentioned in the
> > patch description, instead of a scary warning CCed to stable ;-)
> >
> > BTW, you probably want to update the other copy of c_start() in
> > arch/m68k/kernel/setup_mm.c, too.
> For no-SMP architectures, it seems c_start() in
> arch/m68k/kernel/setup_mm.c is more reasonable (just use 1, neither
> NR_CPUS, nor nr_cpu_ids)?

The advantage of using nr_cpu_ids() is that this is one place less
to update when adding SMP support later...

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
