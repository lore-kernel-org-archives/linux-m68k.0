Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42820EE49A6
	for <linux-m68k@archiver.kernel.org>; Sat, 19 Aug 2023 03:38:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230107AbjHSDef (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 18 Aug 2023 23:34:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229644AbjHSDe1 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 18 Aug 2023 23:34:27 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B9264218
        for <linux-m68k@lists.linux-m68k.org>; Fri, 18 Aug 2023 20:34:26 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-2681223aaacso1084851a91.0
        for <linux-m68k@lists.linux-m68k.org>; Fri, 18 Aug 2023 20:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692416065; x=1693020865;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vOjVxX/Eg0iGmCqhVv5cIZBql9TtO2CXYAj6O50hbSE=;
        b=IqtJwsF0pUQX7izyHeTreyTJTJhKy5hiG0L5LG7pklRm5ruz2z314lR30cJBIft8IF
         lHOgWqUBHxsrHRZ/n+H1wKK9DAmo6l6M6vOqnptgdlcjmAJVnPdA6vRI0gXUbNjLjw2O
         HaCa2GQWI2H3P/PJF/kO6bmYeR/Nyn9f2ZprmcA/D0k+kc6aE9gt4/58CgSA7F801jjd
         XX+T7G5Lv1/7anA6wENrFajkkBfdYnNLgzsdEjOaJ3u6npvNqyydM0GqNQ4HtJ58/8Bk
         W4eV1DvzXq38mo16H9W9Oyvm8s/Iciep4KukBQTEpuiauG6fJdSHO4J2dBeLWJsNSNRu
         GvHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692416065; x=1693020865;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vOjVxX/Eg0iGmCqhVv5cIZBql9TtO2CXYAj6O50hbSE=;
        b=DrpJcZs9LbeHlaQMaatdjq+eEJpg5cODgHogxlNqa3DwveuFcPGT9BrwMpGkD54ZD0
         D0FtiqfHskZLuMG131i5RtUp2/OR8YmJgqZicKJJgNUinVE/M3nVSVHJlHt6s0a2HkyN
         Re3oR9oq06J2nQJojiSLgVJYVcDXFmQi0M1nfzartfmFF7LPRp5LL/bOlwJTVpGwqQSM
         fsSQDA3e+6dscP6NUH9Z4UhxQkOeg7wfqvJ0Ocug9hVM4ty1l+erMAjnWNpdqwW6pg4k
         321e7aHbmDXC8HvarbJf4QvfMQJwzTiry9zad6pa9NaNi0L/PmhZQCBhxExBGbvWEKoE
         F4ng==
X-Gm-Message-State: AOJu0Yw9LuW8iXdu0I2sa8WMEM4ExCOupYFEjkrXsyaMfIBnrD7/RCW3
        XakvmXLHWQOsG+jIxjIfcx0sAlCSoH7RI9BmJ9M=
X-Google-Smtp-Source: AGHT+IFpp0VHvCZv9YQH2C6BH14eA1+BcCpaZ1w5QpKfP5/3cQ/4jDAUwPVhdHrKttxLAuvWHcInuMfoJccdrJLxiGs=
X-Received: by 2002:a17:90a:64ca:b0:25d:d224:9fb9 with SMTP id
 i10-20020a17090a64ca00b0025dd2249fb9mr1389535pjm.24.1692416065235; Fri, 18
 Aug 2023 20:34:25 -0700 (PDT)
MIME-Version: 1.0
References: <38e1a01b-1e8b-7c66-bafc-fc5861f08da9@gmail.com>
 <86e329b1-c8d7-47bf-8be8-3326daf74eb5@infradead.org> <78a802c5-3f0d-e199-d974-e586c00180eb@infradead.org>
In-Reply-To: <78a802c5-3f0d-e199-d974-e586c00180eb@infradead.org>
From:   Jesse T <mr.bossman075@gmail.com>
Date:   Fri, 18 Aug 2023 23:33:49 -0400
Message-ID: <CAJFTR8T-Fdu_aKapP+Lb6pLYo_ykXwXw6rFZNGR5=WKU1QwUPQ@mail.gmail.com>
Subject: Re: [PATCH] treewide: drop CONFIG_EMBEDDED
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     linux-kernel@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
        linux-arm-kernel@lists.infradead.org,
        Arnd Bergmann <arnd@arndb.de>,
        "Jason A . Donenfeld" <Jason@zx2c4.com>, wireguard@lists.zx2c4.com,
        linux-arch@vger.kernel.org, linux-snps-arc@lists.infradead.org,
        Vineet Gupta <vgupta@kernel.org>,
        Brian Cain <bcain@quicinc.com>, linux-hexagon@vger.kernel.org,
        Greg Ungerer <gerg@linux-m68k.org>,
        linux-m68k@lists.linux-m68k.org, Michal Simek <monstr@monstr.eu>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Dinh Nguyen <dinguyen@kernel.org>,
        Jonas Bonn <jonas@southpole.se>,
        Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
        Stafford Horne <shorne@gmail.com>,
        linux-openrisc@vger.kernel.org, linux-mips@vger.kernel.org,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        linux-sh@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>,
        Josh Triplett <josh@joshtriplett.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-kbuild@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Fri, Aug 18, 2023 at 7:44=E2=80=AFPM Randy Dunlap <rdunlap@infradead.org=
> wrote:
>
> Hi Jesse,
>
> I replied to your comment a few days ago, but for some reason
> your email to me contains:
> Reply-To: 20230816055010.31534-1-rdunlap@infradead.org
> so it wasn't sent directly to you.

Sorry about that I messed up the email headers...
>
> My former reply is below.
>
> On 8/16/23 20:15, Randy Dunlap wrote:
> > Hi Jesse,
> >
> > On 8/16/23 15:45, Jesse Taube wrote:
> >> Hi, Randy
> >>
> >>> diff -- a/init/Kconfig b/init/Kconfig
> >>> --- a/init/Kconfig
> >>> +++ b/init/Kconfig
> >>> @@ -1790,14 +1790,6 @@ config DEBUG_RSEQ
> >>>
> >>>         If unsure, say N.
> >>>
> >>> -config EMBEDDED
> >>> -    bool "Embedded system"
> >>> -    select EXPERT
> >>> -    help
> >>> -      This option should be enabled if compiling the kernel for
> >>> -      an embedded system so certain expert options are available
> >>> -      for configuration.
> >>
> >> Wouldn't removing this break many out of tree configs?
> >
> > I'm not familiar with out-of-tree configs.
> > Do you have some examples of some that use CONFIG_EMBEDDED?
> > (not distros)

Buildroot has a few.
It won't immediately break Buildroot and Yocto as they have a set version,
but it could be confusing for anyone updating the kernel.

> >
> >> Should there be a warning here to update change it instead of removal?
> >
> > kconfig doesn't have a warning mechanism AFAIK.
> > Do you have an idea of how this would work?

No, unfortunately. As you said without a warning it would be overlooked so
a change would not be necessary.

A possible solution is to check in a header file with:

#ifdef CONFIG_EMBEDDED
#warning "CONFIG_EMBEDDED has changed to CONFIG_EXPERT"
#endif

Does anyone else have an opinion on this?
Since kconfig doesn't have a warning mechanism the patch seems fine as is.

Thanks,
Jesse Taube
> >
> > We could make a smaller change to init/Kconfig, like so:
> >
> >  config EMBEDDED
> > -     bool "Embedded system"
> > +     bool "Embedded system (DEPRECATED)"
> >       select EXPERT
> >       help
> > -       This option should be enabled if compiling the kernel for
> > -       an embedded system so certain expert options are available
> > -       for configuration.
> > +       This option is being removed after Linux 6.6.
> > +       Use EXPERT instead of EMBEDDED.
> >
> > but there is no way to produce a warning message. I.e., even with this
> > change, the message will probably be overlooked.
> >
> > ---
> > ~Randy
>
> --
> ~Randy
