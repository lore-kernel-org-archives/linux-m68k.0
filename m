Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A591C433F5
	for <linux-m68k@archiver.kernel.org>; Thu, 21 Apr 2022 07:12:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1385641AbiDUHP0 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 21 Apr 2022 03:15:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357106AbiDUHPX (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 21 Apr 2022 03:15:23 -0400
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCBE617057
        for <linux-m68k@lists.linux-m68k.org>; Thu, 21 Apr 2022 00:12:34 -0700 (PDT)
Received: from mail-wm1-f52.google.com ([209.85.128.52]) by
 mrelayeu.kundenserver.de (mreue106 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MhClw-1oLjYh0iiw-00eJ4j for <linux-m68k@lists.linux-m68k.org>; Thu, 21
 Apr 2022 09:12:33 +0200
Received: by mail-wm1-f52.google.com with SMTP id l3-20020a05600c1d0300b0038ff89c938bso3338571wms.0
        for <linux-m68k@lists.linux-m68k.org>; Thu, 21 Apr 2022 00:12:33 -0700 (PDT)
X-Gm-Message-State: AOAM533N6MA6WLjB6RUtnzAEt8KyfsKKJ9XawGrCupEpLby8xvwnl0Sv
        SnS7PP591RtrUlwh4TePw8vbhZeCRE4UYzjlaGY=
X-Google-Smtp-Source: ABdhPJyiDq8vDuHIbY6D8eienOMlm5JvlAwo2YuDKmIos2MBFwy3hSQ+D3GAoUjwkE1kjA32vI2wLWEQWYui85aMEb4=
X-Received: by 2002:a1c:f219:0:b0:38c:782c:3bb with SMTP id
 s25-20020a1cf219000000b0038c782c03bbmr6996684wmc.94.1650525152760; Thu, 21
 Apr 2022 00:12:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220414091018.896737-1-niklas.cassel@wdc.com>
 <f379cb56-6ff5-f256-d5f2-3718a47e976d@opensource.wdc.com> <Yli8voX7hw3EZ7E/@x1-carbon>
 <81788b56-5b15-7308-38c7-c7f2502c4e15@linux-m68k.org> <87levzzts4.fsf_-_@email.froward.int.ebiederm.org>
 <01b063d7-d5c2-8af0-ad90-ed6c069252c5@linux-m68k.org> <CAMuHMdXd94L=766usN4WG-hK2MpQLy50mJZ=9G9NGv03kx8V8Q@mail.gmail.com>
In-Reply-To: <CAMuHMdXd94L=766usN4WG-hK2MpQLy50mJZ=9G9NGv03kx8V8Q@mail.gmail.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Thu, 21 Apr 2022 09:12:16 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3Cjna7H_YxFvg6UEOqQf9ZqLp9EVOCFFewzWBHVT4nWg@mail.gmail.com>
Message-ID: <CAK8P3a3Cjna7H_YxFvg6UEOqQf9ZqLp9EVOCFFewzWBHVT4nWg@mail.gmail.com>
Subject: Re: [PATCH] binfmt_flat: Remove shared library support
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Greg Ungerer <gerg@linux-m68k.org>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        Kees Cook <keescook@chromium.org>,
        Niklas Cassel <Niklas.Cassel@wdc.com>,
        Damien Le Moal <damien.lemoal@opensource.wdc.com>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Mike Frysinger <vapier@gentoo.org>,
        "stable@vger.kernel.org" <stable@vger.kernel.org>,
        "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
        "linux-mm@kvack.org" <linux-mm@kvack.org>,
        "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
        Linux-Arch <linux-arch@vger.kernel.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux-sh list <linux-sh@vger.kernel.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Vladimir Murzin <vladimir.murzin@arm.com>,
        Jesse Taube <Mr.Bossman075@gmail.com>,
        Giulio Benetti <giulio.benetti@benettiengineering.com>,
        Patrice Chotard <patrice.chotard@st.com>,
        Pierre-Yves MORDRET <pierre-yves.mordret@st.com>,
        Alexandre Torgue <alexandre.torgue@st.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:83F7fVWomKkDpAFu5UBPAbzRt9lxPJ/8A8sfVUcEbGyrx4xHxgd
 zye6TfYTCdWc4rrITMbFKRXY1GgDpbRMzKQeYJI89BzXT/LgdwZqgyKpR5gI5ircEdgR2L+
 jGYozPwntKDa7b6qjZ1G5AyOmw61huXEmva77njCp68IBWHJD9sTvmng5NlSThGCLGpfHe+
 NxS4bUxWX/vLCvOB1Js7g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:EtmMqlTZawI=:YLpj1FsOdWq6E/DfB5gjVr
 h44Q1ZNBXb/lxK1nI4a955KqNZRGtUkPhYijEh5xO8vWyE6gIlInhp+ohJNGrZe/iAhFhy1QS
 EvfuEz5DpXZMB3doDLlw/UBZeLK5BMQq5xGNpHS9P2X0EQb1qL1UjPC6/FfUBHN3hArFd4+ur
 6OCr52A84GgPjkN/ICwqdarhzautJH8q1gPT9kHsJ3bnUaM/YslicOc86VGVIKb3ga9keunvZ
 R4c5a4NeQtUmTmrJ0V4xxIQRxiRQx/70LzUwDosSQzV8S4qE7ftaoOJMw3I3VGgWN6b6C4Brr
 SsOn8Zwie4nBQmHEzyoc9DLP4Abl3gOVllI2kKuHJnarP2meCg8cp1qWPVcUAEztQKyPCPfFo
 1UUxm52bKPp9489ngEQR4MGdGGFgTyo9C3inVjCGSQi95Edyrv3rs3ThtsLMgRT/waKv6ZF8Y
 GlWwkMFeA5TadRpGMnpneiW6KGVhdzKvekYACrSjCxHBpCFkAPoY+BJdY23WKdevCQouJRc6p
 dOEtYSgkFQxpUy4zeCJqzO9ljmd7BbVB4Ndgv122+Zw6touX0vJbkfwQVCDmNI+qVqbfYsAVr
 +uAonCe+FvhawxtNylClvY02E0WuqxGj1bIiW7pkKF9FvDluKiQHncZBRR6WGKlrFolWWA6BS
 ZLPBeddmG/zN/n7s0iwv3qcXMACOOgeTNym5kh5Zz9FBld0+zRXxFwKvQG2ZOl0kbTtkmqflN
 XEQmuDOoTF5VQr06sy36wB88qutGVP90oETWBjNp5XF6GPCHInnd+GrLCMSZp0fMj2brCb/Kv
 uSeqvoFIEgmGVBAZcXn92PNN4e7VhFXq0Xr217pG5DHJSvYwo8=
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Thu, Apr 21, 2022 at 8:52 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Thu, Apr 21, 2022 at 1:53 AM Greg Ungerer <gerg@linux-m68k.org> wrote:
> > On 21/4/22 00:58, Eric W. Biederman wrote:
> > > In a recent discussion[1] it was reported that the binfmt_flat library
> > > support was only ever used on m68k and even on m68k has not been used
> > > in a very long time.
> > >
> > > The structure of binfmt_flat is different from all of the other binfmt
> > > implementations becasue of this shared library support and it made
> > > life and code review more effort when I refactored the code in fs/exec.c.
> > >
> > > Since in practice the code is dead remove the binfmt_flat shared libarary
> > > support and make maintenance of the code easier.
> > >
> > > [1] https://lkml.kernel.org/r/81788b56-5b15-7308-38c7-c7f2502c4e15@linux-m68k.org
> > > Signed-off-by: "Eric W. Biederman" <ebiederm@xmission.com>
> > > ---
> > >
> > > Can the binfmt_flat folks please verify that the shared library support
> > > really isn't used?
> >
> > I can definitely confirm I don't use it on m68k. And I don't know of
> > anyone that has used it in many years.
> >
> >
> > > Was binfmt_flat being enabled on arm and sh the mistake it looks like?
>
> I think the question was intended to be
>
>     Was *binfmt_flat_shared_flat* being enabled on arm and sh the
>     mistake it looks like?
>
> > >
> > >   arch/arm/configs/lpc18xx_defconfig |   1 -
> > >   arch/arm/configs/mps2_defconfig    |   1 -
> > >   arch/arm/configs/stm32_defconfig   |   1 -
> > >   arch/arm/configs/vf610m4_defconfig |   1 -

Adding stm32, mps2 and imxrt maintainers to Cc, they are the most active
armv7-m users and should know if the shared library support is used anywhere.

     Arnd
