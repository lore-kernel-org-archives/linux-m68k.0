Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4BBDC433EF
	for <linux-m68k@archiver.kernel.org>; Sun, 17 Oct 2021 19:20:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7A37E60F36
	for <linux-m68k@archiver.kernel.org>; Sun, 17 Oct 2021 19:20:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344473AbhJQTXH (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 17 Oct 2021 15:23:07 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:33877 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234164AbhJQTXG (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sun, 17 Oct 2021 15:23:06 -0400
Received: from mail-wm1-f54.google.com ([209.85.128.54]) by
 mrelayeu.kundenserver.de (mreue109 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1M72wT-1me63M3Uul-008b7d for <linux-m68k@lists.linux-m68k.org>; Sun, 17
 Oct 2021 21:20:55 +0200
Received: by mail-wm1-f54.google.com with SMTP id o24-20020a05600c511800b0030d9da600aeso6674271wms.4
        for <linux-m68k@lists.linux-m68k.org>; Sun, 17 Oct 2021 12:20:55 -0700 (PDT)
X-Gm-Message-State: AOAM531koygWLAtVplSmeCjyOikNCFFwGCFOdiwLTLcopKbYWcgbIWAq
        +rRpGc4BeLsGlCQbeFMXYH1qs4+g6BjoTQxMWZ0=
X-Google-Smtp-Source: ABdhPJyUlFebsGacqn/DbORh+me3VGF2rJiA/LeldArqxN3agfF/M3+TgUm3ShSK4jjOvlyCwRLNkS5pXcgtKPXtbJI=
X-Received: by 2002:a1c:4b08:: with SMTP id y8mr27612763wma.98.1634498455480;
 Sun, 17 Oct 2021 12:20:55 -0700 (PDT)
MIME-Version: 1.0
References: <20211017175949.23838-1-rdunlap@infradead.org>
In-Reply-To: <20211017175949.23838-1-rdunlap@infradead.org>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Sun, 17 Oct 2021 21:20:39 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1WHPnLNE7=4872iaVcL708NcVmMhRvAR0OLujP=Y3Tjw@mail.gmail.com>
Message-ID: <CAK8P3a1WHPnLNE7=4872iaVcL708NcVmMhRvAR0OLujP=Y3Tjw@mail.gmail.com>
Subject: Re: [PATCH] mmc: winbond: don't build on M68K
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Pierre Ossman <pierre@ossman.eu>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-mmc <linux-mmc@vger.kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:fq1nEWkG0CqZd0AjFDEykVs/W7JRzABsPHQqci5DQ/JZx+oQ8eg
 eIswMvlV0zgaXoUcwbY0zWgxpsyLN8lGK5d/Zc60X7qLP1lY6TN7ACwuFMu029RHPtg1n9G
 1Lzawehd8Coo4bHQCqPar741C8bdYy0VCSPChyNa4E8SYIoxLc8rn4b2yQdhDKxtaLM+juI
 kHI0swgF5vYenYgw87sZg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:JxHpaf3N89o=:j+bb3NsiWN+o0NAVcjCbYP
 mjHSaVTaQKZ8YKwULdS0Hr70HreL6zTcbqTjPduaXbygEbMkrfQELaXUZxEnqbr2Yf++u+Wbz
 Zn8DAJg3uLSw7Me1YObG+f/3Jd9KB/mE3xTXdNGu3PFskDbtbY0VCORRKMKeIy8Y+K7fM2fWv
 Lp7N3muFXfnRTGU8vn/G4XQqupixj53G9vgkSBVKMEFIoQgAzr5nhjdTMFYMqefwqA9+cteHn
 K6owO4Z/imOU96rA1k9bhgT9KZlLsKRdpIN32SAwN2dST6Yk8JBtoUtXAYAyMCFdqQ6NrOEkA
 xn66llwQALO9PccBzjSQjDrbgdIDe+qthqMwIwhWcByW2oG8NfszZHyA8rVYGWkTMJdDS709G
 EcSE3RQaMrl8laS8rsHxy5hRuIKRJ2hmEwDX6DpJRpF3gB3Gb4cPTmMJyP6uYZnW1Pl323PI0
 mzfycQsaezVBs6wCQzr3jc8b4SVOgYT89sr1Xyqzw6Z/SJDw1iREv8lv9GRtV0oNf3EIhrdiR
 outN24TeFAV1w90osLEmanKZMWvbIEEWftDWxeFfSqNbCWAwmQucb3cqUEFaEFEzMX5o0R3DW
 DHcyeqx876Ynr93DJOmEaUSaLh135947CV+ORHCnOwJJkyGzeWQb3Rb2uBFggq9hC4zt9+L3A
 AwWLRPBWccDtr83w78Txu0aXt0QfPLTzmPEseOvh2zL+VY/dIU2tUSUx+J7Zc31MS7L8YaWKc
 Rafiou300U+aECtyBJgNb3CA3urDhi6KkknsCN4x9+2QFoo/rj+deWrbIKYBasmyctVbd0KHn
 zryLko6Du77e075t1PmfnugZddYhWINQrbLA3qrq0LEiyHmpeR2AhLJVx04QXVHzUL+BIsikq
 jt0BZC+HJ/BBOznhYH6w==
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Sun, Oct 17, 2021 at 7:59 PM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> The Winbond MMC driver fails to build on ARCH=m68k so prevent
> that build config. Silences these build errors:
>
> ../drivers/mmc/host/wbsd.c: In function 'wbsd_request_end':
> ../drivers/mmc/host/wbsd.c:212:28: error: implicit declaration of function 'claim_dma_lock' [-Werror=implicit-function-declaration]
>   212 |                 dmaflags = claim_dma_lock();
> ../drivers/mmc/host/wbsd.c:215:17: error: implicit declaration of function 'release_dma_lock'; did you mean 'release_task'? [-Werror=implicit-function-declaration]
>   215 |                 release_dma_lock(dmaflags);
>

It looks like m68k and sparc declare this function in asm/floppy.h,
while everyone
else has it in asm/dma.h.

Not sure if it's worth fixing in a better way, but I suspect sparc
would have the
same issue here.

      Arnd
