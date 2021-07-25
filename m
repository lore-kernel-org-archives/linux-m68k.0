Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3B0DC4338F
	for <linux-m68k@archiver.kernel.org>; Sun, 25 Jul 2021 15:27:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 87FED606A5
	for <linux-m68k@archiver.kernel.org>; Sun, 25 Jul 2021 15:27:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231280AbhGYOqf (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 25 Jul 2021 10:46:35 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:59741 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231289AbhGYOqe (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sun, 25 Jul 2021 10:46:34 -0400
Received: from mail-wr1-f45.google.com ([209.85.221.45]) by
 mrelayeu.kundenserver.de (mreue010 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1Mxlio-1l9gnB1lHC-00zDDY for <linux-m68k@lists.linux-m68k.org>; Sun, 25 Jul
 2021 17:27:03 +0200
Received: by mail-wr1-f45.google.com with SMTP id n12so4353772wrr.2
        for <linux-m68k@lists.linux-m68k.org>; Sun, 25 Jul 2021 08:27:03 -0700 (PDT)
X-Gm-Message-State: AOAM5337IZwrMPgoYoWYEXWGGFXMkGQ2EaE7XMkc0wZNEGp+BJyhIaaE
        XGI4Q1CjWhrNthaYCzK9pj43eJpeqCN3shoY2A0=
X-Google-Smtp-Source: ABdhPJz+LrpWMcr3RgdECxl1tgvMH+HHI4zaLgGuepPsN9p5W1KckSbFbCirQqp5ev5fQBZ2kkE16ia/luyBzT/FH68=
X-Received: by 2002:adf:e107:: with SMTP id t7mr14882265wrz.165.1627226823080;
 Sun, 25 Jul 2021 08:27:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210725104618.365790-1-geert@linux-m68k.org>
In-Reply-To: <20210725104618.365790-1-geert@linux-m68k.org>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Sun, 25 Jul 2021 17:26:46 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2qD3LFic8L_3-KCnuVL6J8M_SLFsdj0c-n258MsUPKuQ@mail.gmail.com>
Message-ID: <CAK8P3a2qD3LFic8L_3-KCnuVL6J8M_SLFsdj0c-n258MsUPKuQ@mail.gmail.com>
Subject: Re: [PATCH] m68k: Fix asm register constraints for atomic ops
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Greg Ungerer <gerg@uclinux.org>, Will Deacon <will@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Boqun Feng <boqun.feng@gmail.com>,
        Brendan Jackman <jackmanb@google.com>,
        kernel test robot <lkp@intel.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:e/VG1XC3v1rG6PcopAiyeoGiiQCAuhrhAz/Ii2DLcCZYdhvgmzV
 Y6Zf7i06p8YA/JbV1iKzOc3KjvlyeWKx0ooUJCKLrWvcbZvJAWsedza3rqecM+jVhTdgYZd
 PW/ONvTmGPRBeKuP/MKaMQGdxdfgGZDqv3AdPF2ewmDsFdnqzUEGZ0ALALPgjOp4PcRCMPz
 x0Sj74HCIpSLmeOwzNQAw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:rQo9P/X0vgc=:/nP19Gjnb8kfA/NgOSOOpe
 g6aIeQ/936G0dFpZq+zyxYre0Nyv5uxldsSl30Vl51ArVFh0Yf+trcLNveAPTLEQ2Gveju3uU
 pOeaOXgqndzfWSMrXsdhTWE2gjGHKK3xHTdVxx346pMJven/ifwDDDd/WEmDT19d83tnkUGye
 tPji/Gm0tJFV4A5mWFSdGhP4AZ1U5y76s+yKgZk3McI/1vzZF9Ipnqoo5aI8jQAjTQ7VVij4D
 i+DxqcpsWArzFNR5EtoaN5va53YBqyXIkCbhj+ka0pjGe+iEH54aDrTQHGDohBYFogM2kTvF+
 r5BjcRifBG+fo5FCFUatqGScIDigek9MRi5fDPBc6tVsOIr/A4m9Q5sWQ6Adh89ZDgd43fS9g
 1SFgJZKoyJpwo8+84zoksDZG69Cwp3rREfkGtW7vaOVwN/fKsU7VrwO1moZjzVxiwHaKFKPrH
 +q4r8+D3op317oHgdJf3G4x8qTF5Mau0VqGJ7yIo0aLqmXMNL0dSyyBHtB0E8fIhVms19QC9m
 XQ3SHpbACaXDjoVoV/tLGa83OKSndzLDBZE79fTDOL3KfK35PDnL9DQBuAGGai/l3P+pPDgsw
 +B0a+MYcQdTfRJVZtPv+naSOd9USiWB04OS5waXiTWGw9JVivU+90wHiO1bn6f9X3IDPHginU
 +EK7oJDghcWlSZ/6CmIvryYS/wnTPzjk8DyLalQ1PsS9yIyrt1vUemQHdsxKYoMLCyxdH/D0f
 /SJpfPj5i4LtOc4GjL+QdcIfAPkwWgBOnZvfe9bjcNIxUFMv3dhkCILA2GS1crJ+rCE8jU69z
 FqXFh7FUqnyHTEny1J5zZbKuxi8Cpmpd5DZZiuosKJ6lK94AhuuqZOGwhEDWDkeLF/XuTZI5a
 rgy3qpUbR/FpsfGpaNU9Cmp1Vwp7UuInQBZa6zx90NOMhkIjgewv3J4ffwlpcGbGqMW+Redkm
 ntyzMH6hpjUsT1Pmhe+O4PRAd5ZWI7lHpW7LabpoEjU54uuBonMXl
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Sun, Jul 25, 2021 at 12:46 PM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
>
> Depending on register assignment by the compiler:
>
>     {standard input}:3084: Error: operands mismatch -- statement `andl %a1,%d1' ignored
>     {standard input}:3145: Error: operands mismatch -- statement `orl %a1,%d1' ignored
>     {standard input}:3195: Error: operands mismatch -- statement `eorl %a1,%d1' ignored
>
> Indeed, the first operand must not be an address register.  Fix this by
> adjusting the register constraint from "g" (general purpose register) to
> "d" (data register).
>
> Fixes: e39d88ea3ce4a471 ("locking/atomic, arch/m68k: Implement atomic_fetch_{add,sub,and,or,xor}()")
> Fixes: d839bae4269aea46 ("locking,arch,m68k: Fold atomic_ops")
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Arnd Bergmann <arnd@arndb.de>
> Reported-by: Alexander Viro <viro@zeniv.linux.org.uk>
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
> Personally, I have never seen this failure in an 68020+ build, but I can
> reproduce it on Coldfire with the config provided by lkp (with bogus
> CONFIG_RMW_INSNS=y).

This fixed the problem for me in the 68020 build with all compiler versions.

Tested-by: Arnd Bergmann <arnd@arndb.de>
