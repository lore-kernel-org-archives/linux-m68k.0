Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9945C433EF
	for <linux-m68k@archiver.kernel.org>; Sun, 17 Oct 2021 19:09:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AB9A761050
	for <linux-m68k@archiver.kernel.org>; Sun, 17 Oct 2021 19:09:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242524AbhJQTLe (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 17 Oct 2021 15:11:34 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:34989 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238471AbhJQTLd (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sun, 17 Oct 2021 15:11:33 -0400
Received: from mail-wr1-f52.google.com ([209.85.221.52]) by
 mrelayeu.kundenserver.de (mreue108 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MPXlM-1mPS4m1HCk-00MbE0 for <linux-m68k@lists.linux-m68k.org>; Sun, 17
 Oct 2021 21:09:22 +0200
Received: by mail-wr1-f52.google.com with SMTP id r7so37171181wrc.10
        for <linux-m68k@lists.linux-m68k.org>; Sun, 17 Oct 2021 12:09:22 -0700 (PDT)
X-Gm-Message-State: AOAM533xRBa1KU3G/KlhxtrO2up01ZIgl9zjr1Y/bQLCXW125eB29XEz
        VApKge8fUUjpPrhyVZn6Jcqdq52OlMfUeZEuVOg=
X-Google-Smtp-Source: ABdhPJyDj5QI06EOMNONdAE5GwD/ut/fii1dX06b8JHCA0YPirHmFsCDgxXb4szkdoWo0z9BllmdVI49vaK35YUrk8s=
X-Received: by 2002:adf:f481:: with SMTP id l1mr29223902wro.411.1634497761955;
 Sun, 17 Oct 2021 12:09:21 -0700 (PDT)
MIME-Version: 1.0
References: <20211017174905.18943-1-rdunlap@infradead.org>
In-Reply-To: <20211017174905.18943-1-rdunlap@infradead.org>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Sun, 17 Oct 2021 21:09:05 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3XDY5gMUA3h3tVmQuxSHn_J3qOw_rDurzBx-KFdGhCKA@mail.gmail.com>
Message-ID: <CAK8P3a3XDY5gMUA3h3tVmQuxSHn_J3qOw_rDurzBx-KFdGhCKA@mail.gmail.com>
Subject: Re: [PATCH] asm-generic: bug.h: add unreachable() in BUG() for
 CONFIG_BUG not set
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-arch <linux-arch@vger.kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:xVzZoZearTQTIeKJkIuZLaFCfO6bcwdkznP2IafIP1DNNbA/8fE
 ex4nNXUjFujUjoNY5RQ4M/qJ1g1sVbvO5u8O4TRcFChKEeZP8jFCwJ/qV3IP0M2i91F23Jb
 kC6bpewGrxJk1Jw/nwDa3A2mqaVo+E269Vr9IznaOZf8eO+m4ehRb+0RZZmWloA3/PyKNuF
 KgcyrCu9/ooFs67eWQjbw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:fnXW5GVQ7NU=:pbWeIfLHpNP/5pAKtumcSr
 D023f6Qe3E7922dPPA19X+QgfBz0XRRz8NzhjpGnlzNlK/x+7ilc3KvsGfUH+5zwBxBlgdNa6
 OsW6O0Rwsuv6ztB1HE+eusBMJPjO8szi4OnatrSEN7dBZ7YKLU0UcxctzJFXdj/f3gweMtjg6
 t1PWtvUjpbgcINYDDhA5GwSRkYqSPnQ3/nBpOzbS16Km3UE7n8RCidd2HAP+XbTbK6NPmELq8
 mMOx9PWKS7RaOJDN8UmBhZ6WK8EqzUbv1CkBdghAWuY77lGsrcx2Zrx6FlrjlATq/v4tegsZW
 obrFoqqufDbr+B0nGbuKTes9Mtm4IPdVbos5xinNmU/VMqK4MKcjvE6/QLIZT2jkpaYb0Gvdi
 4w1A04Ot6LdQiy1IeRKv6ozlgmbt+UvN6zDwvPIH6ddU7J6CoM+CWVVgeAeXrHHq/EJUcv241
 lbqOXEb7LekodXLdIM548PLd14CEtT/O0uK2Nb2wRIlo/weo4OiH4rP9XgJpBISZjrhLwsGv4
 3ToTyab0eGQsdDi86dZsXfbDVJuaJIobVX01xrqZsNaIa9XFR96lvAxagks+ikuJR3LUiRZba
 WZgyNs6/hz4w/NjhpEwCXhwq3u5ZTlCegM2UswkA8G7B+TaVcvhVqcHusY98hOK+nFGPCr00v
 /Y5AcwASL3dR4UxGAkelFk30u5XgHxTqJ9uRuAKOi20X3pdvlAtENEDHsjqT4wwrW3KXdT6Ge
 Jn5spCCzHzIN4/DSOOod1XbA2BSB35PI0pGxKw==
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Sun, Oct 17, 2021 at 7:49 PM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> When CONFIG_BUG is not set/enabled, there is a warning
> on ARCH=m68k, gcc version 11.1.0-nolibc from Arnd's crosstools:
>
> ../fs/afs/dir.c: In function 'afs_dir_set_page_dirty':
> ../fs/afs/dir.c:51:1: error: no return statement in function returning non-void [-Werror=return-type]
>
> Adding "unreachable()" in the BUG() macro silences the warning.

No, I don't think this is the right solution:

> -#define BUG() do {} while (1)
> +#define BUG() do {unreachable();} while (1)

Marking this code unreachable() means the compiler is free
to assume any code path leading here will never be entered,
which leads to additional undefined behavior and other warnings
rather than just hanging reproducibly.

The endless loop here should normally be sufficient to tell the
compiler that the function never returns, so it sounds like a
problem in gcc for m68k.

Did you see any other issues like this one on m68k, or the
same one on another architecture?

        Arnd
