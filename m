Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4C73C48BCF
	for <linux-m68k@archiver.kernel.org>; Wed,  9 Jun 2021 11:32:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BF649613B6
	for <linux-m68k@archiver.kernel.org>; Wed,  9 Jun 2021 11:32:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238103AbhFILe3 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 9 Jun 2021 07:34:29 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:35217 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231162AbhFILe1 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 9 Jun 2021 07:34:27 -0400
Received: from mail-wm1-f41.google.com ([209.85.128.41]) by
 mrelayeu.kundenserver.de (mreue106 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MDy54-1m0noh3l24-009zZc for <linux-m68k@lists.linux-m68k.org>; Wed, 09
 Jun 2021 13:32:31 +0200
Received: by mail-wm1-f41.google.com with SMTP id l11-20020a05600c4f0bb029017a7cd488f5so3999803wmq.0
        for <linux-m68k@lists.linux-m68k.org>; Wed, 09 Jun 2021 04:32:31 -0700 (PDT)
X-Gm-Message-State: AOAM532oCaTQfJP+NjpFg4/yAayKI2TMb0IFtb1gtc5MoCah2dB2j7qd
        SxSY59EH0yaabobbHHtR8SXFNfEfL5atwqWB/y8=
X-Google-Smtp-Source: ABdhPJzoAPnjJWGlDyxsxVrxhheEMZ1P753dKM++est77A1JSiUJC5TRRvOf+sTRALv47GHRkLWv+YzLbHb9Ukp7IwY=
X-Received: by 2002:a1c:7d15:: with SMTP id y21mr9135927wmc.120.1623238351528;
 Wed, 09 Jun 2021 04:32:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210604064916.26580-1-rppt@kernel.org>
In-Reply-To: <20210604064916.26580-1-rppt@kernel.org>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Wed, 9 Jun 2021 13:30:39 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2tZDJDqgr9-1vJrnbDhd_36eKq8LMEznDkU7rvuAnAag@mail.gmail.com>
Message-ID: <CAK8P3a2tZDJDqgr9-1vJrnbDhd_36eKq8LMEznDkU7rvuAnAag@mail.gmail.com>
Subject: Re: [PATCH v2 0/9] Remove DISCINTIGMEM memory model
To:     Mike Rapoport <rppt@kernel.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Jonathan Corbet <corbet@lwn.net>,
        Matt Turner <mattst88@gmail.com>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Richard Henderson <rth@twiddle.net>,
        Vineet Gupta <vgupta@synopsys.com>, kexec@lists.infradead.org,
        alpha <linux-alpha@vger.kernel.org>,
        linux-arch <linux-arch@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        linux-ia64@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        Linux-MM <linux-mm@kvack.org>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        linux-s390 <linux-s390@vger.kernel.org>,
        Linux-sh list <linux-sh@vger.kernel.org>,
        "open list:SYNOPSYS ARC ARCHITECTURE" 
        <linux-snps-arc@lists.infradead.org>,
        "open list:TENSILICA XTENSA PORT (xtensa)" 
        <linux-xtensa@linux-xtensa.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        sparclinux <sparclinux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:SFd4Jyn5spMADADsBsIjI4XXTJUcNhs8ewC0rJhXF1+IOUg9Yi9
 OjXu6wYbJavJOnB9ca03oIwjfpFB6kSfAFpjAeGh/aBV3eti4y/uzhwJPgTzj1yN/zYCpbo
 JyT5kLQYZRWk6RLm7m6BRHfvwV5voP5pvwb0LKI5nYDzqt1Qp67j9HeUSJmwaExF3OFNdSD
 mupd7wdx7UFQNJjOoOfSg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:bi3ekusigyA=:JQ6ZjhJ70YCBrITFo3Veb+
 Sj/YUchNW4t/Z3ufEyF0x1pwdDQnPyJevfhoarTTvM8n2kuMKJ8wr8IkrjQWVbmufLj4QYK+M
 kA0CMBB3fZF0uu/OXdJt9y63bMbbYAw+QMyGusyKyUg9i1+LmK/nGCvUsTbqOQNGl6vQ5i/Zm
 0AknLO0m88uWyvjqZF1mTKD4t1f9jlPr7wValyW4/eZihDLDBXgmX2y+mx5sp7AOEa5T7JZ2D
 ZMmqhqFbMwY1JMRi7kuOLIbC2E9nfOoNHIP1HdjDCk6Vt6LlMLRS/qzqAx2gfny3xiGfbG6Ti
 gfhHn34JZY+HPnUEUIAteL+lnADkvHrPow+lLK87G5Ut2/TNe9PiKxxfrzGZkP0oU0/u/emDP
 wcTpf11s/xulfWIbytk5l6cucJmL6nF8Xfabm2GlHvIfmoig0sCzPsOPjz2GgEbtpCB0tgmUB
 sU4xGrjW74iXAPbrhyegF3d42oS2+5PY2lNAZl+vzeFyDKZplll3NhNx5bYhIWVVvGlkycFDI
 mglNSqAQ7I1Wv8BiMdZSSk=
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Fri, Jun 4, 2021 at 8:49 AM Mike Rapoport <rppt@kernel.org> wrote:
>
> From: Mike Rapoport <rppt@linux.ibm.com>
>
> Hi,
>
> SPARSEMEM memory model was supposed to entirely replace DISCONTIGMEM a
> (long) while ago. The last architectures that used DISCONTIGMEM were
> updated to use other memory models in v5.11 and it is about the time to
> entirely remove DISCONTIGMEM from the kernel.
>
> This set removes DISCONTIGMEM from alpha, arc and m68k, simplifies memory
> model selection in mm/Kconfig and replaces usage of redundant
> CONFIG_NEED_MULTIPLE_NODES and CONFIG_FLAT_NODE_MEM_MAP with CONFIG_NUMA
> and CONFIG_FLATMEM respectively.
>
> I've also removed NUMA support on alpha that was BROKEN for more than 15
> years.
>
> There were also minor updates all over arch/ to remove mentions of
> DISCONTIGMEM in comments and #ifdefs.

Hi Mike and Andrew,

It looks like everyone is happy with this version so far. How should we merge it
for linux-next? I'm happy to take it through the asm-generic tree, but linux-mm
would fit at least as well. In case we go for linux-mm, feel free to add

Acked-by: Arnd Bergmann <arnd@arndb.de>

for the whole series.
