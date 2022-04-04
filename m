Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03E6CC41535
	for <linux-m68k@archiver.kernel.org>; Mon,  4 Apr 2022 21:38:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350697AbiDDVj1 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 4 Apr 2022 17:39:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1380147AbiDDTDV (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 4 Apr 2022 15:03:21 -0400
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EF7933A3D
        for <linux-m68k@lists.linux-m68k.org>; Mon,  4 Apr 2022 12:01:23 -0700 (PDT)
Received: from mail-wm1-f48.google.com ([209.85.128.48]) by
 mrelayeu.kundenserver.de (mreue012 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MVaQW-1nTik93OwG-00RYPW for <linux-m68k@lists.linux-m68k.org>; Mon, 04 Apr
 2022 21:01:21 +0200
Received: by mail-wm1-f48.google.com with SMTP id c190-20020a1c35c7000000b0038e37907b5bso155033wma.0
        for <linux-m68k@lists.linux-m68k.org>; Mon, 04 Apr 2022 12:01:21 -0700 (PDT)
X-Gm-Message-State: AOAM5331WvFpKm0DIPY+wc1B0djMi0np99KRdIUsWCXwi9LVXah5nNZS
        CYiV8nDyoGl9gu6cHHYF6jxNYiGLayv3ZYup0KQ=
X-Google-Smtp-Source: ABdhPJwz/M4LKrm3IRclV8UgrUcDHyP4nLiAeM9chnwMC8xte+ec0eWR310JC5CzRN6KPW7x0SBYcBjNd+/TV08TLsg=
X-Received: by 2002:a1c:f219:0:b0:38c:782c:3bb with SMTP id
 s25-20020a1cf219000000b0038c782c03bbmr474508wmc.94.1649098881420; Mon, 04 Apr
 2022 12:01:21 -0700 (PDT)
MIME-Version: 1.0
References: <Yib9F5SqKda/nH9c@infradead.org> <CAK8P3a1dUVsZzhAe81usLSkvH29zHgiV9fhEkWdq7_W+nQBWbg@mail.gmail.com>
 <YkmWh2tss8nXKqc5@infradead.org> <CAK8P3a0QdFOJbM72geYTWOKumeKPSCVD8Nje5pBpZWazX0GEnQ@mail.gmail.com>
 <CAMo8BfKgn0T5RtUTb89fPvygNJJYLy7r1=RZTmTTm=jiDfx1hQ@mail.gmail.com>
In-Reply-To: <CAMo8BfKgn0T5RtUTb89fPvygNJJYLy7r1=RZTmTTm=jiDfx1hQ@mail.gmail.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Mon, 4 Apr 2022 21:01:05 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0J1--WSyWY+TptFa0nn5d-mOxapadCE1csGRkfhSPbVw@mail.gmail.com>
Message-ID: <CAK8P3a0J1--WSyWY+TptFa0nn5d-mOxapadCE1csGRkfhSPbVw@mail.gmail.com>
Subject: Re: [RFC PULL] remove arch/h8300
To:     Max Filippov <jcmvbkbc@gmail.com>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Christoph Hellwig <hch@infradead.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arch <linux-arch@vger.kernel.org>,
        "moderated list:H8/300 ARCHITECTURE" 
        <uclinux-h8-devel@lists.sourceforge.jp>,
        "open list:TENSILICA XTENSA PORT (xtensa)" 
        <linux-xtensa@linux-xtensa.org>,
        Linux-sh list <linux-sh@vger.kernel.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        Damien Le Moal <damien.lemoal@wdc.com>,
        linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:YPf9T4aOJ7dGLqB0qQg/Q0NLKQ35jOB/EIzzPduDcILn3XZuMIw
 gubKyqwqFle6A79aIaFFz8M2+FcXvJbzc7fDFJzQTCMy7AEmChvLsE2fDqYG6R2cDHdyIEe
 17ZCln87gDD/ZCPj0nMyPYXRfMdsp6s9G4i+LKobsI6MdyiQ6PC54UNkpP1AhKcFtGDhYoG
 yJEFHw0aAxaIQAsxDtRJg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:kop8UHgUaD4=:ELQt08UnVbFb2f24UXbPl4
 U2VR/Ep1nFtqejSuzVa+DiXd+2+CgYbfUBBdCZwQNvzJQd3Ns30389DKIFW9g30xHE1RAPaY7
 QMS5beEV0B0rXvuG4WHyWPwIyUllEBQw9YQwJHnklvZrxBQ5eMFbzVz5HQlOuSm/U4ABwbJpt
 kB9AKMOPHquIi1q6foIr91VwsEHZ8cpw9G1Zyff/VJeA9/GffSRXSwCcjRgg9Mj23vdx46fyb
 JGzxUTqsUxJ+HYHfkkbQM5eKEKLUTFdJ0Y2kICVVHnbzowqt9/u2DKjmu8zT7/49435q0P/2G
 yNhTsht8aN26be57AgAn+AYbemgC/MOMM+uhaC4aJVAoNQtztZjWyuJtP+uylCPsWhEu76/zL
 h6s05daJFijDLEwsRMb2eLiFxO44UPDV1AoVR1oO2pK39SowYE9RJrpiCYG8Ia8Eq9je0G7m4
 ebnNGn3Z1zBfVg1iWjuzyjU06YjQpKc7DQrcbfdzf8yKmhDlk+5/biCdy4p64R0Pp9T/h54UE
 PVYIAAQKdGNRGpsLKVbEj2MIeHnCIWVrW9WtbS8QkN8oIIse3QcCKcgPG9PWBuv/hx4YJePRe
 Z1b0pWBs1TOXVC9Sla4JYggvn+jEkILzXVR837jUUvQcZFPgHJg0mGiuWvYFYi2vNd+mNADI1
 cR0XxGqxeOtuvTTR6Vkz2lJ80P2HVRjtNkVxVAM2oteynpo+wg+ij1AucfgHGc3WwZfU=
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Mon, Apr 4, 2022 at 7:57 PM Max Filippov <jcmvbkbc@gmail.com> wrote:
>
> Hi Arnd,
>
> On Mon, Apr 4, 2022 at 6:07 AM Arnd Bergmann <arnd@arndb.de> wrote:
> > 1. xtensa nommu has does not compile in mainline and as far as I can
> > tell never did
>
> I have a different picture here. If you look at the logs at
>   https://kerneltests.org/builders/qemu-xtensa-master/
>
> there's a line for noMMU config in every one of them:
>   Building xtensa:de212:kc705-nommu:nommu_kc705_defconfig ... running
> ............ passed
>
> Please let me know if you observe any specific build/runtime issues.

This is what I get:

$ make ARCH=xtensa O=build/xtensa nommu_kc705_defconfig vmlinux V=1
....
xtensa-linux-gcc-11.1.0 -DKCONFIG_SEED=
-Wp,-MMD,arch/xtensa/kernel/.head.o.d -nostdinc
-I/git/arm-soc/arch/xtensa/include -I./arch/xtensa/include/generated
-I/git/arm-soc/include -I./include
-I/git/arm-soc/arch/xtensa/include/uapi
-I./arch/xtensa/include/generated/uapi -I/git/arm-soc/include/uapi
-I./include/generated/uapi -include
/git/arm-soc/include/linux/compiler-version.h -include
/git/arm-soc/include/linux/kconfig.h -D__KERNEL__
-I/git/arm-soc/arch/xtensa/variants/de212/include
-I/git/arm-soc/arch/xtensa/platforms/xtfpga/include
-fmacro-prefix-map=/git/arm-soc/= -D__ASSEMBLY__ -fno-PIE -mlongcalls
-mtext-section-literals -Wa,--fatal-warnings -I
/git/arm-soc/arch/xtensa/kernel -I ./arch/xtensa/kernel    -c -o
arch/xtensa/kernel/head.o /git/arm-soc/arch/xtensa/kernel/head.S
/git/arm-soc/arch/xtensa/kernel/head.S: Assembler messages:
/git/arm-soc/arch/xtensa/kernel/head.S:87: Error: invalid register
'atomctl' for 'wsr' instruction

I think there were other errors in the past, but every time I tried
it, the build failed for me.

        Arnd
