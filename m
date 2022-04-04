Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD7B6C3527D
	for <linux-m68k@archiver.kernel.org>; Mon,  4 Apr 2022 21:39:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1387130AbiDDVkc (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 4 Apr 2022 17:40:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1380345AbiDDTiD (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 4 Apr 2022 15:38:03 -0400
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94D3613EA3
        for <linux-m68k@lists.linux-m68k.org>; Mon,  4 Apr 2022 12:36:05 -0700 (PDT)
Received: from mail-wm1-f51.google.com ([209.85.128.51]) by
 mrelayeu.kundenserver.de (mreue009 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MBDva-1nidkz43Y6-00Ckt8 for <linux-m68k@lists.linux-m68k.org>; Mon, 04 Apr
 2022 21:36:04 +0200
Received: by mail-wm1-f51.google.com with SMTP id n63-20020a1c2742000000b0038d0c31db6eso217222wmn.1
        for <linux-m68k@lists.linux-m68k.org>; Mon, 04 Apr 2022 12:36:03 -0700 (PDT)
X-Gm-Message-State: AOAM531LDxh1rXciaqiz7zUIUhVp4G2n2Ti8ZiV7BlHceaMhod0NWW4e
        EMjkmTx7TvJFDLDEYkmEoDoCx/HisheEgsXnzQY=
X-Google-Smtp-Source: ABdhPJxpqVUnzSThWxFis0+czy1waV2fEyvClqHAXtfCqV11EeZgFuDvKELwz3h19yH6dPE8NNhk9binn9y/5RzmubM=
X-Received: by 2002:a7b:cd13:0:b0:38b:f39c:1181 with SMTP id
 f19-20020a7bcd13000000b0038bf39c1181mr626838wmj.20.1649100963560; Mon, 04 Apr
 2022 12:36:03 -0700 (PDT)
MIME-Version: 1.0
References: <Yib9F5SqKda/nH9c@infradead.org> <CAK8P3a1dUVsZzhAe81usLSkvH29zHgiV9fhEkWdq7_W+nQBWbg@mail.gmail.com>
 <YkmWh2tss8nXKqc5@infradead.org> <CAK8P3a0QdFOJbM72geYTWOKumeKPSCVD8Nje5pBpZWazX0GEnQ@mail.gmail.com>
 <CAMo8BfKgn0T5RtUTb89fPvygNJJYLy7r1=RZTmTTm=jiDfx1hQ@mail.gmail.com>
 <CAK8P3a0J1--WSyWY+TptFa0nn5d-mOxapadCE1csGRkfhSPbVw@mail.gmail.com> <CAMo8BfLT8vMw3aGQPs1+9ry7W63SQphmDc4Tt4A3JvADHJhxiQ@mail.gmail.com>
In-Reply-To: <CAMo8BfLT8vMw3aGQPs1+9ry7W63SQphmDc4Tt4A3JvADHJhxiQ@mail.gmail.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Mon, 4 Apr 2022 21:35:47 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3iFb+ZacZ40d8PC_xcJpLVFXT0Qc-oYEZNkFqXdsfNZw@mail.gmail.com>
Message-ID: <CAK8P3a3iFb+ZacZ40d8PC_xcJpLVFXT0Qc-oYEZNkFqXdsfNZw@mail.gmail.com>
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
X-Provags-ID: V03:K1:0Ipv8rRBVJkSl++3PKyWBESpXk33LP10X74FZGDvHkuRA5/VkFr
 W+5LvPv61sUnfX9NMEqs0uiRL+0LkZo2oL3LBjFkSXcrBfJ0HEmWBUdDMrhfNPJK0tWnQVl
 oLyC+WVnEa/xM91svxrr3XhCO5QOwG9qzrfjUbOCcUiZCy+iq1KxCD5Z9qKncQMBrZJILSu
 Cza1wvBndMNzW++WpjAfA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:YmYnNDuK07g=:gFyNiq7CyYMXBHXExak+YI
 dy8XJc/u/L9U82abzAzUycMnzrm1tlqqNXiKgs1oIUrx/WqLB1eU34mCauqdlRuxmLAo8m/lT
 qZxEx4PkOxdDK/eU/0DLLyUl6o0nRoNHqLudbaXRUHJ2jOg/q3s1f1WT/DNPdSDuaSa1V1KGn
 gsjqH/W9iFSnHdMiCAbz1rI22W4crJOezsU9rYH6xbsvq+O74Cnmk2naf38ptNbX5Sgl46g7s
 1VeCk1xGiIPW8SaXzIK1eJfLQgg6EElsrBcS1LUPR8PE0w3E6UKN+F+A4SfJfT4lZyS/vZ9ON
 gvhY6EqKoZoEn3A/9iYRZ2lzfry6B/mNtcTL2FkRroQU8R1kR1Zm+nql5aSd10OhRXgxck5WZ
 SuOZKVHsbbYl13jUotC3DLaQMo40Xuzjv7w8gpi2vEusFb3dN36i9Q1TH0yytzX6OdXOjmzrZ
 8ROwkjZI7fznDNV+3J9JeRSfPn2FHbbI4Xq2yXmrcnUhtZBQV6Y1P5EnYoV2vCs/nMuV4e4Fe
 GNcAihc8UhxrCiY397ULL1UtVmkx8EGxJ3NAqw8caEfjoqTasAQKxhotjE0iLH5vs12hDATwA
 pOTC7K0YzfZ45E53wcQ5872x9ULE6Vw992CrwCmu/IYFV9EZm7cJUOBRiqnDhT6hYVahMhOCU
 0/mG5MrB6uG21sFdZjyMImslgjtmF/Ae1tn+OfIZA5pt/JmnDQIF+yXpbDlXkvJyXFYsJHsi8
 NRsrjKLZuKMdR1aJSqau/xeivsv8C3Frx9+NBY6wv/3j+t0iOQ1/akHj8DOE4Qgn89sToZxmh
 v3EgxLbfpjb0lAI8qBckPfYMdyv45rw+S4EGuFr9bcHy7ojlsU=
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Mon, Apr 4, 2022 at 9:14 PM Max Filippov <jcmvbkbc@gmail.com> wrote:
> On Mon, Apr 4, 2022 at 12:01 PM Arnd Bergmann <arnd@arndb.de> wrote:
> > On Mon, Apr 4, 2022 at 7:57 PM Max Filippov <jcmvbkbc@gmail.com> wrote:
> > > Please let me know if you observe any specific build/runtime issues.
> > xtensa-linux-gcc-11.1.0 -DKCONFIG_SEED=
> ...
> > /git/arm-soc/arch/xtensa/kernel/head.S: Assembler messages:
> > /git/arm-soc/arch/xtensa/kernel/head.S:87: Error: invalid register
> > 'atomctl' for 'wsr' instruction
>
> Sure, one cannot use an arbitrary xtensa compiler for the kernel
> build, the compiler configuration must match the core variant selected
> in the linux configuration. Specifically, for the nommu_kc705_defconfig
> the following compiler can be used:
>
> https://github.com/foss-xtensa/toolchain/releases/download/2020.07/x86_64-2020.07-xtensa-de212-elf.tar.gz
>
> If you build the toolchain yourself using crosstool-ng or buildroot they
> accept the 'configuration overlay' parameter that does the compiler
> customization.
>
> Perhaps the documentation for this part is what needs to be improved.

It sounds like a bug in the kernel Makefile. On all other architectures,
you can generally just pick any (recent) compiler and build any kernel,
as the compiler arguments set the exact target machine type based
on the kernel config. You can't normally rely on the compiler defaults
for kernel builds.

         Arnd
