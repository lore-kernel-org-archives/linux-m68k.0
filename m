Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21DAEC43334
	for <linux-m68k@archiver.kernel.org>; Wed,  6 Jul 2022 07:05:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231433AbiGFHFh (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 6 Jul 2022 03:05:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231423AbiGFHFW (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 6 Jul 2022 03:05:22 -0400
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C980222BB
        for <linux-m68k@lists.linux-m68k.org>; Wed,  6 Jul 2022 00:05:18 -0700 (PDT)
Received: from mail-yw1-f172.google.com ([209.85.128.172]) by
 mrelayeu.kundenserver.de (mreue009 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MPXpS-1nwOCM49UA-00MZlY for <linux-m68k@lists.linux-m68k.org>; Wed, 06 Jul
 2022 09:05:17 +0200
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-31cf1adbf92so3942057b3.4
        for <linux-m68k@lists.linux-m68k.org>; Wed, 06 Jul 2022 00:05:15 -0700 (PDT)
X-Gm-Message-State: AJIora+IqInAHIkb5N8t6aq3iogzBhQb4K/WTJzIkh1Vh2ogdhkHZUYX
        l1OxTtTa31+O2tAB+rsI5QtV5YQiXG9CHO27b3Q=
X-Google-Smtp-Source: AGRyM1sFkLoTiaaVIBkcDzO6lGV11chQSm3x6oRhEtv1xOtqIu5uDObFEe7OPQNG4jMZlSfDIkbGiGD4cv9otOB20XA=
X-Received: by 2002:a81:f8f:0:b0:31c:bd9f:31ce with SMTP id
 137-20020a810f8f000000b0031cbd9f31cemr10731679ywp.347.1657091114041; Wed, 06
 Jul 2022 00:05:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220630051630.1718927-1-anshuman.khandual@arm.com>
 <8a6ccbae-7d7c-6e08-cc28-eeb649f86112@arm.com> <85fff3f6-373f-3e6a-325e-0fa8ad46273a@csgroup.eu>
In-Reply-To: <85fff3f6-373f-3e6a-325e-0fa8ad46273a@csgroup.eu>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Wed, 6 Jul 2022 09:04:56 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1gb1Xrg4AGnncFpN=aDxVKfjkt1TmSvZXXADZTv7eE-g@mail.gmail.com>
Message-ID: <CAK8P3a1gb1Xrg4AGnncFpN=aDxVKfjkt1TmSvZXXADZTv7eE-g@mail.gmail.com>
Subject: Re: [PATCH V6 00/26] mm/mmap: Drop __SXXX/__PXXX macros from across platforms
To:     Christophe Leroy <christophe.leroy@csgroup.eu>
Cc:     Anshuman Khandual <anshuman.khandual@arm.com>,
        "linux-mm@kvack.org" <linux-mm@kvack.org>,
        "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
        "linux-xtensa@linux-xtensa.org" <linux-xtensa@linux-xtensa.org>,
        "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
        "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,
        "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
        "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>,
        "linux-hexagon@vger.kernel.org" <linux-hexagon@vger.kernel.org>,
        "x86@kernel.org" <x86@kernel.org>,
        "linux-um@lists.infradead.org" <linux-um@lists.infradead.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "hch@infradead.org" <hch@infradead.org>,
        "linux-m68k@lists.linux-m68k.org" <linux-m68k@lists.linux-m68k.org>,
        "openrisc@lists.librecores.org" <openrisc@lists.librecores.org>,
        "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>,
        "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
        "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
        "linux-snps-arc@lists.infradead.org" 
        <linux-snps-arc@lists.infradead.org>,
        "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:N6mtZ+Rnis/z3nCU2K4K+Swx1hY/l/82rZrUZhLAu1mVuE9RBBp
 L44MRo0OT6Lz8CfkZ0wHFuM0f5R8xrnaKp7rE2O1lKG/5SOJzrYIyHi/ybY+3qZlAHOoR/3
 yaQ5A2Z7vPvy0S8A1EhNQBDujwG4KQkEsi7ixFO02yv21kWd22SU5O+5rOQ2rM5l4lBjwBg
 b6fPwlJAOPcRlLsQpU0Rw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ZDMe4V2ybS4=:/UCVrqFZcvqFHxSCLuKNzZ
 xZdUNYW9W+RmY1VhpUHAZXL+ZEp0z4o1Vqj64RhVGlkbLXh1Je8wYN9NobyZoXDQcCbqLot0R
 9gSqTS1T7LmnQjvvAlW3vKUvxklzm+4NrcojFQl7uWc+P5tyzJ+auOEbOMrFWaQj4vFhKG86e
 VNOHpbJHzjLPYDc0yVGSoUtXLsIU0btN93HVLiIRuB868tpiifCvJ1jK2IGIJH76TPoLlt4dE
 75q01IgKCbB+H6VoYatnldvhziqoRlOIAXA81c7n7/EI0+mXWAFxSH5FunJT/Lil2hPQSXF+8
 w0HNPlE4D1l0U9UZw7xsi47Tunlb4W4VO83/mn3fnbj4cvVuKwjjTplJQAg7AhvsNPFxSb926
 RR/i3EFnzSYhZJwtKZzX/20Y5yfiBCipqnwRvjyCZelcrTBUp/iY1v4e4s9e2QzKOYrMbIq+Q
 +5UppIFadqNvgDaBvdtEhc9+ipnwT7S0uBA95NjGPGUn5Yh6DV6jUrwvaD5XT61OQ+FOWYIM/
 fNnZ4CxtAhunE37grx0P4uVqkwYu40B5j79+V6FYTEEwpE/h4oUIveIuG7PWdVucBjhX6Mbfx
 rMGdn4hzlyKUmn2ssQ450X0TAWtg/Gg5n+g7ZIQ1qphHUk5qDGVLLBhYJo51xxEtSHCQHbIus
 9FC5fSU18k8SWrWjGWQ19wBRweQV0GMdz5dvcYGw1rAer9IW066kiJNA3j2a4PUrMXTtKRuCd
 NY9UyjxIbfezvw96xs+Wbxujv6Iel+5x9H6LxMg6LaRUINcq14kOF017Pg/GS7tBcbrDoKChM
 09g5UcPuJjslDANK1lRzO23j9sju1MVAawJdX34QQ2o2NFQnLFNRi9ZL04UtEk3OHhzm+OjN1
 7zwhOm6idPKS6UpnFiwA==
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Wed, Jul 6, 2022 at 8:33 AM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:

> As far as I can see in Kconfig, CONFIG_MMU is user selectable on the
> following architectures:
> - ARM
> - M68K
> - RISCV
> - SH
>
> And is disabled by default on XTENSA.

Right, the list is complete, though it's also default-enabled for
every CPU core on xtensa, and you can only disable it for
"custom" CPU cores.

        Arnd
