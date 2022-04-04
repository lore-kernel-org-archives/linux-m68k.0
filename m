Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1827C433FE
	for <linux-m68k@archiver.kernel.org>; Mon,  4 Apr 2022 21:39:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1387134AbiDDVkf (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 4 Apr 2022 17:40:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1380362AbiDDTqo (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 4 Apr 2022 15:46:44 -0400
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B91930F6A
        for <linux-m68k@lists.linux-m68k.org>; Mon,  4 Apr 2022 12:44:47 -0700 (PDT)
Received: from mail-wr1-f41.google.com ([209.85.221.41]) by
 mrelayeu.kundenserver.de (mreue011 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MNtGq-1nM0BB3JLE-00ODiF for <linux-m68k@lists.linux-m68k.org>; Mon, 04 Apr
 2022 21:44:45 +0200
Received: by mail-wr1-f41.google.com with SMTP id d29so10082071wra.10
        for <linux-m68k@lists.linux-m68k.org>; Mon, 04 Apr 2022 12:44:45 -0700 (PDT)
X-Gm-Message-State: AOAM532ziQ5yWLT9AP2x9Dy50DiyOHXtGH8TtkjUb/smAPM2apf5K9LM
        lhDEpessOIxiIr/1l5ufMX1jjafoAHDoVyQ/kAY=
X-Google-Smtp-Source: ABdhPJyRqH0qibkfjPRGnJDcURrE8ZPrQIGLNSwn/9l1FUg/Sz1o5iKs76jxTh4W551VdZ+S32lMVfdTx28z5w2iC30=
X-Received: by 2002:a05:6000:10c7:b0:206:135e:c84e with SMTP id
 b7-20020a05600010c700b00206135ec84emr984244wrx.12.1649101485314; Mon, 04 Apr
 2022 12:44:45 -0700 (PDT)
MIME-Version: 1.0
References: <Yib9F5SqKda/nH9c@infradead.org> <CAK8P3a1dUVsZzhAe81usLSkvH29zHgiV9fhEkWdq7_W+nQBWbg@mail.gmail.com>
 <YkmWh2tss8nXKqc5@infradead.org> <CAK8P3a0QdFOJbM72geYTWOKumeKPSCVD8Nje5pBpZWazX0GEnQ@mail.gmail.com>
 <CAMo8BfKgn0T5RtUTb89fPvygNJJYLy7r1=RZTmTTm=jiDfx1hQ@mail.gmail.com>
 <CAK8P3a0J1--WSyWY+TptFa0nn5d-mOxapadCE1csGRkfhSPbVw@mail.gmail.com>
 <CAMo8BfLT8vMw3aGQPs1+9ry7W63SQphmDc4Tt4A3JvADHJhxiQ@mail.gmail.com> <CAK8P3a3iFb+ZacZ40d8PC_xcJpLVFXT0Qc-oYEZNkFqXdsfNZw@mail.gmail.com>
In-Reply-To: <CAK8P3a3iFb+ZacZ40d8PC_xcJpLVFXT0Qc-oYEZNkFqXdsfNZw@mail.gmail.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Mon, 4 Apr 2022 21:44:29 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1goN3c772xiFtz13kHZs0XEDSxfXX=ub7OH3S98Mddsw@mail.gmail.com>
Message-ID: <CAK8P3a1goN3c772xiFtz13kHZs0XEDSxfXX=ub7OH3S98Mddsw@mail.gmail.com>
Subject: Re: [RFC PULL] remove arch/h8300
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Max Filippov <jcmvbkbc@gmail.com>,
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
X-Provags-ID: V03:K1:9ylzAQgRWXFIHAecCOlsyQ9rFg5VBIQ8UiHs1xdKh5Wbbax4Z41
 7KxYCy2FXFL6UZWQ4c2iShQAKOgwSBaH3tEy+1aoP/uj0HHfDlgtGrWF67dWWaAbaFra2ga
 TEbdP25UGANwB8d3XAfdDrqi0815JSPepw7uy/swzcuWjkvMpbLfcVba1BdjaEnCdTAKEV1
 WawcOu4ynDHMMDTcCIQZA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:OL3OE2kWbMU=:imqnd12EPu4fonwKZjJKLL
 7eJfDttMMkJroIa7qXzs9pxo6ybXEjd1jGUaRyarkpKQgH6cjm5DwYZeebgMDtf7FNhMj04X0
 VxQs2/iju09NphuOnkyVVM9Ljf3agJub7mpKP4a1IkTlx5uQBicaBdshagLIChYeaWdqvBTlM
 JOYmCNFI7ZVGnLp8u+Ch6PjJaDke3sWT8tAILrlYqhee/Vc6He3aBL21l2vVji5S0Gz2ZcF8u
 5qL/V2xIOW0MkTv6GfjxO3a5WKaH2QlJu9iiT9weLuAWp/BRxJP5HHnxQOihTjiHb583l2pmy
 tnYwUwaDgOlPVqVpBuaF6XdvOcCfX/GiDyX2yyyR1r74M/txwXzjhCdXpckCZytXdpzBEPqtv
 QChU8FfDLpEWcqr5R+qL67jDmIEq5h2Wpebq8e24QVGrWYbxPhrzAglEEMI67wez/vo9eC15r
 PvygnwBY4BuyqWmijkeTZnZ73iiqvl+rZuQgJRUn4S3DTKxFdt/3fNo8rm7ci1sU1iV/msR9q
 2aodiy58Xl/xP+kKCtzQm1JRByA3KeH0V+wp57D/ic1Anpo3ekahcSgsh15+gwcOuKPH9gVPv
 gWMdpWrYJ3nCv+065D6BwWib9LZFUiBE8WD4vF5cqZspnFgnXsqeYXmu132c6gnbtIN3ubtp9
 +WqMppIWrpqkBghlxdVqE83rqO6w0Pl41CwAhDbey5Z22Hb3fZrHbxevMZry7bHyPwh0TjYWn
 bREdWhlijjdqY7Z3Awi87H1K3RW+HTx6Gy3PnIoiOQmswUS5FopEgzJtPcJkQzGn6XFakAmJ2
 2tk33jZM7BrvvjytK1OnmV+JDJ1MrBRuoP/h3DWDbB1NLYeYe4=
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Mon, Apr 4, 2022 at 9:35 PM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Mon, Apr 4, 2022 at 9:14 PM Max Filippov <jcmvbkbc@gmail.com> wrote:
> > On Mon, Apr 4, 2022 at 12:01 PM Arnd Bergmann <arnd@arndb.de> wrote:
> > > On Mon, Apr 4, 2022 at 7:57 PM Max Filippov <jcmvbkbc@gmail.com> wrote:
> > > > Please let me know if you observe any specific build/runtime issues.
> > > xtensa-linux-gcc-11.1.0 -DKCONFIG_SEED=
> > ...
> > > /git/arm-soc/arch/xtensa/kernel/head.S: Assembler messages:
> > > /git/arm-soc/arch/xtensa/kernel/head.S:87: Error: invalid register
> > > 'atomctl' for 'wsr' instruction
> >
> > Sure, one cannot use an arbitrary xtensa compiler for the kernel
> > build, the compiler configuration must match the core variant selected
> > in the linux configuration. Specifically, for the nommu_kc705_defconfig
> > the following compiler can be used:
> >
> > https://github.com/foss-xtensa/toolchain/releases/download/2020.07/x86_64-2020.07-xtensa-de212-elf.tar.gz
> >
> > If you build the toolchain yourself using crosstool-ng or buildroot they
> > accept the 'configuration overlay' parameter that does the compiler
> > customization.
> >
> > Perhaps the documentation for this part is what needs to be improved.
>
> It sounds like a bug in the kernel Makefile. On all other architectures,
> you can generally just pick any (recent) compiler and build any kernel,
> as the compiler arguments set the exact target machine type based
> on the kernel config. You can't normally rely on the compiler defaults
> for kernel builds.

FWIW, the compiler I used is the one I built for kernel.org [1] using unmodified
upstream sources The config I used for this is

${SRCTREE}/configure ../log-gcc-configure /home/arnd/git/gcc/configure
--target=xtensa-linux --enable-targets=all
--prefix=/home/arnd/cross/x86_64/gcc-11.1.0-nolibc/xtensa-linux
--enable-languages=c --without-headers --disable-bootstrap
--disable-nls --disable-threads --disable-shared --disable-libmudflap
--disable-libssp --disable-libgomp --disable-decimal-float
--disable-libquadmath --disable-libatomic --disable-libcc1
--disable-libmpx --enable-checking=release

Let me know if I need to enable additional options to get a compiler
that works for all xtensa targets. Usually the --enable-targets=all
is meant to be sufficient.

        Arnd

[1] https://mirrors.edge.kernel.org/pub/tools/crosstool/files/bin/x86_64/11.1.0/
