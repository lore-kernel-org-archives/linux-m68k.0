Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FB07C433EF
	for <linux-m68k@archiver.kernel.org>; Thu, 14 Jul 2022 06:59:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234878AbiGNG7x (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 14 Jul 2022 02:59:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235364AbiGNG7u (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 14 Jul 2022 02:59:50 -0400
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06A2E2B62E
        for <linux-m68k@lists.linux-m68k.org>; Wed, 13 Jul 2022 23:59:48 -0700 (PDT)
Received: from mail-yw1-f174.google.com ([209.85.128.174]) by
 mrelayeu.kundenserver.de (mreue010 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1M2w0K-1o8ZRP0G7Q-003IoY for <linux-m68k@lists.linux-m68k.org>; Thu, 14 Jul
 2022 08:59:47 +0200
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-31c89111f23so8336917b3.0
        for <linux-m68k@lists.linux-m68k.org>; Wed, 13 Jul 2022 23:59:46 -0700 (PDT)
X-Gm-Message-State: AJIora8jPUY43UvO6Kp6Ak2grKTg/N3QRvUKKegtDQr/IRD2prgeSoeJ
        rxgm8IfhnoOSEsYSZj42TeiBHaHU+neA9A+w9ac=
X-Google-Smtp-Source: AGRyM1tgxYSVD/gYAxs1WCM6JhzELwA8WwTUgiYEaMRwN6Q6Zg/uUd6yRx65tlEIUnIRkovs/IpphI7wi/ZKPISkkKw=
X-Received: by 2002:a81:f8f:0:b0:31c:bd9f:31ce with SMTP id
 137-20020a810f8f000000b0031cbd9f31cemr8121384ywp.347.1657781985894; Wed, 13
 Jul 2022 23:59:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220712075255.1345991-1-chenhuacai@loongson.cn>
 <20220712075255.1345991-3-chenhuacai@loongson.cn> <CAMuHMdUazqHLbc80vpZ+Msg9A3j5aPJ3fx+CdCG3kuWDSf8WSw@mail.gmail.com>
 <CAAhV-H775jXMbcR9j=oLBuHo1PfFziZSUQWttJAEw20sUt+GAA@mail.gmail.com>
 <CAMuHMdUHbepd974u5iox3BcOyo_Q2ZgT-znruk+WCt+HMQ_Lgw@mail.gmail.com>
 <CAAhV-H78Fi0aE-h5MOgRa5L+Jt7D0wG0nLcYzx45jVney8T1BQ@mail.gmail.com>
 <CAMuHMdVXFmKR4LuXHYRrSk3Q0VRqATGbsM512DxayWCPCE-wvg@mail.gmail.com>
 <c8c959fa-f17d-f0dd-6a8d-e0b0ce622f3a@xen0n.name> <CAAhV-H6g5nLGJMz0ZsZqC5-73VSGffVdc6r0=3HHBo3Z8PQOBg@mail.gmail.com>
In-Reply-To: <CAAhV-H6g5nLGJMz0ZsZqC5-73VSGffVdc6r0=3HHBo3Z8PQOBg@mail.gmail.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Thu, 14 Jul 2022 08:59:28 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0GUPSYBai3Z9vzw0wrXGLFiik6hdY3zc6nQ6mQs7yHvQ@mail.gmail.com>
Message-ID: <CAK8P3a0GUPSYBai3Z9vzw0wrXGLFiik6hdY3zc6nQ6mQs7yHvQ@mail.gmail.com>
Subject: Re: [PATCH 3/6] M68K: cpuinfo: Fix a warning for CONFIG_CPUMASK_OFFSTACK
To:     Huacai Chen <chenhuacai@gmail.com>
Cc:     WANG Xuerui <kernel@xen0n.name>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Huacai Chen <chenhuacai@loongson.cn>,
        Arnd Bergmann <arnd@arndb.de>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Michal Simek <monstr@monstr.eu>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>, Jeff Dike <jdike@addtoit.com>,
        Richard Weinberger <richard@nod.at>,
        Anton Ivanov <anton.ivanov@cambridgegreys.com>,
        loongarch@lists.linux.dev, Linux-Arch <linux-arch@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Guo Ren <guoren@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Linux-sh list <linux-sh@vger.kernel.org>,
        linux-um <linux-um@lists.infradead.org>,
        stable <stable@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:DNyCeH1FYM1zklKDPzAoCaWYxmBsxZIMEmM3f7w7R8GKgciidX6
 qoq/TowRdVzzwwE5d2HgB6sQ4GLEy08xjZDOdhneA0zO3CW9nSCAYANHAOZKNBVbOGBUWyx
 NY5Po+WVaiXlYMJsLhskFTTIGO+2liRtUOocAc3+Q/c1gksvJbhR2YLsKsIaSKkRWhbEaXE
 3+Crs1ybeKG5h6+UK11YQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:DHktf3iKTTM=:nEMgJg/Kzj3+X2c67tvEsB
 Rw7Ni8tnfMlLr3aD+PSv6ySS2NHIB9Qm42pwFc2VYNVLCdusFYrVDuM9xfw4dsBwy3mrQMMx3
 Hdp5Ncm4UKnGutWyTxPXekQHRFtH8SbumwymyE0zKWvipZmPQvrc/M9+YT+9Tui8NJw6l/W8x
 qwCglBVgs5W0w04eRH/KUltACsCx/9y3bC6o5cZ0EKnUddQ7/qGvlc/uU7j54ERmiBp+VPI/P
 rW3WXqqq2/bnJ94p4M9Y9glEvBqAKRRCgFT3UlDTl33zbMOIoym2vjhRxB7SsAjx+Ad/xwal3
 7KTA76YMxj73tQ0TPapQJe5XAFZ6OfzColVxn9ojKVIcF1asR9zKozJUs4lstdPGQ0dA+4DZ0
 DFG20w7xno67rQ8cFdrxQNZ0mzJvnpsurtXJ5fikx/mt0XsA8kGo34JlXRIyGwBj00Ye2ZMrJ
 TARAPnTeLqbg6NZNphgPiVftLqlx8Ge+uY935EZC4dCioPQpcYdjeR83xQf8dJPxq8UG4KVh9
 ZHdEGnUvISTMnYyvJSXbwUCtltufwVLv0gMk2ECJUAbNp55kLx09jhLV1aB3QAcOxFz47PnsF
 0X5jvZd5yMO5suB6wNuDczwqjcXxumUHHMh3cRixhN4Gf0YIAdivS3huLHB6l6FZdY2iyWKwX
 JZ9zQFHlS4YVw7RI6Dq7ZkkArVFDjhdFUPRb+T/pylinIIhcc8roAwUm5u6iOuSc62A7K/NFJ
 +omKOxGz2oN10eLW1RMtU0oe52B9oemsiFv5eiFQiGkO28U/SKSY0udEIO8TFWFcuKMMZKH1o
 anxYZyQcUHtTGOnqG8SRQdB7ZhAKG2nP4UxPebqterd+fQuxI1m7qBgnKEo47AZ/JjHL2LGu/
 W5pwLCIdkqaYbRIpdspA==
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Thu, Jul 14, 2022 at 4:07 AM Huacai Chen <chenhuacai@gmail.com> wrote:
> On Tue, Jul 12, 2022 at 6:15 PM WANG Xuerui <kernel@xen0n.name> wrote:
> > On 2022/7/12 17:13, Geert Uytterhoeven wrote:
> >
> > But judging from the intent of this patch series (fixing WARNs on
> > certain configs), and that the triggering condition is currently
> > impossible on m68k (and other non-SMP) platforms, I think cleanups for
> > such arches could come as a separate patch series later. I think the
> > m68k refactoring is reasonable after all, due to my observation above,
> > but for the other non-SMP arches we may want to wait for the respective
> > maintainers' opinions.
>
> It seems that the best solution is only fix architectures with SMP
> support and leave others (m68k, microblaze, um) as is. :)

I think it probably makes sense to do this as a combined cleanup patch,
which I can merge through the asm-generic tree, for all architectures
whose maintainer does not pick it up directly. For SMP architectures,
it's a bugfix that we probably want backported into stable kernels, while
for non-SMP targets it is just a minor cleanup for consistency.

        Arnd
