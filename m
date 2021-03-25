Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E48CC433E1
	for <linux-m68k@archiver.kernel.org>; Thu, 25 Mar 2021 09:57:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 21D4E61A27
	for <linux-m68k@archiver.kernel.org>; Thu, 25 Mar 2021 09:57:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230062AbhCYJ5D (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 25 Mar 2021 05:57:03 -0400
Received: from mail-vs1-f50.google.com ([209.85.217.50]:36455 "EHLO
        mail-vs1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229788AbhCYJ5B (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 25 Mar 2021 05:57:01 -0400
Received: by mail-vs1-f50.google.com with SMTP id i126so559374vsi.3
        for <linux-m68k@lists.linux-m68k.org>; Thu, 25 Mar 2021 02:57:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3izIRO2P6lVq16KgWQm29PPAFIO6lyr+CrTSgzYOJm8=;
        b=C/7fVzu0z37iXTcbTygPfnmrpV6VXQ65eCNfHZ8Q4y4E+hWGV6p4yGXGYzBczCLqcq
         /Ag3JkAdBSL4p+xd+K4M9ZE6c+TOrWi6MMTe63VpCHBhK3j8G5flX4bNyBAXecWVWoqR
         kFnCzWfnxNVUJEpmg8UzjSocN1CA+Xxh5rOb73pE4ZRTtn1rdv9IeuBBrY/IHORjYWaB
         vwwuLv4Dl6grCr0s2BpJ9VI1Xs94ey51OSSPC6g2xeatMPFIIiKmvsD3gn3uf96pmGJK
         uxymmGbqGr0RGxX6K8yLwgb+/A7R0zV7diCObxJDc+JvfPsKl0SnoUTvs7iitIL6rwZv
         DjUA==
X-Gm-Message-State: AOAM533VTgm4cWibSffZjSYEgvkxCHg1diGiRo/RMIPwBJZJ70UK8GEC
        Ya2zbBOJq/gjpiVKyZWg1NhvgnrotsmPXa6/djI=
X-Google-Smtp-Source: ABdhPJz0LTCZ6tYbBxpRuO1BoGJC+ZddC53izM6TYCVw+Nomu4gOP8CQ8JBMatyfFcbSa3IVgT8/reQ/0cKK/cDbL6Y=
X-Received: by 2002:a67:8883:: with SMTP id k125mr4487054vsd.18.1616666220770;
 Thu, 25 Mar 2021 02:57:00 -0700 (PDT)
MIME-Version: 1.0
References: <25bd53c4-8d29-5457-13a4-2e34011d796@telegraphics.com.au> <YFxb0d94yV/635vT@kernel.org>
In-Reply-To: <YFxb0d94yV/635vT@kernel.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 25 Mar 2021 10:56:49 +0100
Message-ID: <CAMuHMdX+t1_GQuL_EDPa4YdXNZiCVwsNf8tGs9NdosERSpJA1Q@mail.gmail.com>
Subject: Re: v5.11 (CONFIG_FLATMEM) boot crash
To:     Mike Rapoport <rppt@kernel.org>
Cc:     Finn Thain <fthain@telegraphics.com.au>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Stan Johnson <userm57@yahoo.com>,
        Greg Ungerer <gerg@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Mike,

On Thu, Mar 25, 2021 at 10:46 AM Mike Rapoport <rppt@kernel.org> wrote:
> On Thu, Mar 25, 2021 at 02:03:25PM +1100, Finn Thain wrote:
> > Stan has sent me a series of logs from v5.10 and v5.11 showing a
> > regression apparently caused by the deprecation of CONFIG_DISCONTIGMEM.
> >
> > This v5.11 kernel build has CONFIG_FLATMEM=y and
> > CONFIG_FORCE_MAX_ZONEORDER=11 which is now the default. The 5.10 build has
> > CONFIG_DISCONTIGMEM=y.
> >
> > This system is a Mac IIci, which has two RAM banks. Bank A has physical
> > address 0 and bank B has 0x04000000. This model often has two
> > discontiguous RAM chunks. However, installing 64 MB in bank A does avoid
> > that.
> >
> > There is a bootloader issue in play here. The bootloader (Penguin) prefers
> > to locate the kernel and initrd in the largest bank. Hence it may fail to
> > choose the lowest bank even when that bank is sufficiently large. When
> > that happens, Linux is unable to use the RAM in bank A.
> >
> > Linux has always complained about this situation but now it crashes. This
> > seems to be a regression in v5.11. Can anyone help debug this?
>
> There was a bug in the definition of ARCH_PFN_OFFSET that's quite probably
> causes the crashes when the kernel is located in the second memory bank.
>
> The fix was posted a while ago:
>
> https://lore.kernel.org/linux-m68k/20210228190828.392974-1-angelo@kernel-space.org
>
> Can you check if this helps?

Thank you!

I hadn't realized this applies to classic m68k, too.
One more reason to annotate #else and #endif keywords, to avoid
people guessing wrong...

Greg: This is in linux-next, and still destined for v5.12, I assume?
Thanks!

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
