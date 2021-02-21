Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDCACC4332B
	for <linux-m68k@archiver.kernel.org>; Sun, 21 Feb 2021 17:16:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B784064EF1
	for <linux-m68k@archiver.kernel.org>; Sun, 21 Feb 2021 17:16:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229844AbhBURQc (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 21 Feb 2021 12:16:32 -0500
Received: from conssluserg-02.nifty.com ([210.131.2.81]:45470 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230170AbhBURQ1 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sun, 21 Feb 2021 12:16:27 -0500
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id 11LHFQVg017440
        for <linux-m68k@lists.linux-m68k.org>; Mon, 22 Feb 2021 02:15:27 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 11LHFQVg017440
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1613927727;
        bh=+E+JRgKeitH5eFBx4Z/rh8FyWasix1MSTNAEXqizMQU=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=bMuBhHK7G0jarpKwNRXWEMYT5MtPlzuF5j6jQhR0vKMbsbDlQYSfL7y4bC3BtKc+c
         +x9fwA0r9GMAlg25UIIjgntPPxvjQKVJXrieXIEBqLwSYbUOMLRJs/BBjg9S5lDoJe
         YFO+UWc6yok8wxWw5YHFcsaU+oWdY9hhIKQUV+1Vo8/hPo5kHU17wmhY2kmMkthXx1
         Aac2tia/pqlRCEWpFaoNZu15eFP3XovGAJdZrNhdopztTSxTvNrTvSYUa/Wc0pUBjc
         49b1LTdcahp1zJ37gWLuAPMixQeM/MK89EqDPRXF7Syn76qh20IGYMFKLKVDrjW2PT
         Ro+SpRajqEwHw==
X-Nifty-SrcIP: [209.85.167.179]
Received: by mail-oi1-f179.google.com with SMTP id f3so11621722oiw.13
        for <linux-m68k@lists.linux-m68k.org>; Sun, 21 Feb 2021 09:15:27 -0800 (PST)
X-Gm-Message-State: AOAM530U6cJrUgQvrT30IIjkoRy9GPnmaQRiKccl5/gf00USuL7OLXRa
        /q3uNb3/1d/iIircOLO3JNSQl1C6JPl7jTeqFc0=
X-Google-Smtp-Source: ABdhPJxczjkYYwfFedULPavyehBQNlTo4yyE2oDz3aAz68ppY9EMF/VKLUDXMsDnW+fSNSL17VJtx2kpM0VX1zgRRK4=
X-Received: by 2002:a17:90a:609:: with SMTP id j9mr19512007pjj.198.1613927724902;
 Sun, 21 Feb 2021 09:15:24 -0800 (PST)
MIME-Version: 1.0
References: <20210215004823.440102-1-masahiroy@kernel.org>
In-Reply-To: <20210215004823.440102-1-masahiroy@kernel.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Mon, 22 Feb 2021 02:14:47 +0900
X-Gmail-Original-Message-ID: <CAK7LNATvCAyHSUQNTdSck3JM1MfHNFcanjn0i4835okWE9Km5w@mail.gmail.com>
Message-ID: <CAK7LNATvCAyHSUQNTdSck3JM1MfHNFcanjn0i4835okWE9Km5w@mail.gmail.com>
Subject: Re: [PATCH 1/2] arch: syscalls: add missing FORCE and fix 'targets'
 to make if_changed work
To:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Andy Lutomirski <luto@kernel.org>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Borislav Petkov <bp@alien8.de>,
        Chris Zankel <chris@zankel.net>,
        "David S. Miller" <davem@davemloft.net>,
        Fenghua Yu <fenghua.yu@intel.com>,
        "H. Peter Anvin" <hpa@zytor.com>, Helge Deller <deller@gmx.de>,
        Ingo Molnar <mingo@redhat.com>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        Matt Turner <mattst88@gmail.com>,
        Max Filippov <jcmvbkbc@gmail.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Michal Simek <monstr@monstr.eu>,
        Paul Mackerras <paulus@samba.org>,
        Rich Felker <dalias@libc.org>,
        Richard Henderson <rth@twiddle.net>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Tony Luck <tony.luck@intel.com>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        linux-alpha@vger.kernel.org, linux-ia64@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
        Linux-sh list <linux-sh@vger.kernel.org>,
        "open list:TENSILICA XTENSA PORT (xtensa)" 
        <linux-xtensa@linux-xtensa.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        sparclinux <sparclinux@vger.kernel.org>, X86 ML <x86@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Mon, Feb 15, 2021 at 9:50 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> The rules in these Makefiles cannot detect the command line change
> because the prerequisite 'FORCE' is missing.
>
> Adding 'FORCE' will result in the headers being rebuilt every time
> because the 'targets' additions are also wrong; the file paths in
> 'targets' must be relative to the current Makefile.
>
> Fix all of them so the if_changed rules work correctly.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>


Both applied to linux-kbuild.


-- 
Best Regards
Masahiro Yamada
