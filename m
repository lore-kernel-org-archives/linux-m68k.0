Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C33B7C433C1
	for <linux-m68k@archiver.kernel.org>; Fri, 26 Mar 2021 03:13:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 89652619E5
	for <linux-m68k@archiver.kernel.org>; Fri, 26 Mar 2021 03:13:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230247AbhCZDNP (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 25 Mar 2021 23:13:15 -0400
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:60572 "EHLO
        kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230216AbhCZDMq (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 25 Mar 2021 23:12:46 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
        by kvm5.telegraphics.com.au (Postfix) with ESMTP id 9C87429F4C;
        Thu, 25 Mar 2021 23:12:43 -0400 (EDT)
Date:   Fri, 26 Mar 2021 14:12:41 +1100 (AEDT)
From:   Finn Thain <fthain@telegraphics.com.au>
To:     Greg Ungerer <gerg@linux-m68k.org>
cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Mike Rapoport <rppt@kernel.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Stan Johnson <userm57@yahoo.com>,
        Angelo Dureghello <angelo@kernel-space.org>
Subject: Re: v5.11 (CONFIG_FLATMEM) boot crash
In-Reply-To: <CAMuHMdX+t1_GQuL_EDPa4YdXNZiCVwsNf8tGs9NdosERSpJA1Q@mail.gmail.com>
Message-ID: <5a8b344-dbf-58a0-ac3-ebfe47a69c@telegraphics.com.au>
References: <25bd53c4-8d29-5457-13a4-2e34011d796@telegraphics.com.au> <YFxb0d94yV/635vT@kernel.org> <CAMuHMdX+t1_GQuL_EDPa4YdXNZiCVwsNf8tGs9NdosERSpJA1Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Thu, 25 Mar 2021, Geert Uytterhoeven wrote:

> On Thu, Mar 25, 2021 at 10:46 AM Mike Rapoport <rppt@kernel.org> wrote:
> >
> > There was a bug in the definition of ARCH_PFN_OFFSET that's quite 
> > probably causes the crashes when the kernel is located in the second 
> > memory bank.
> >
> > The fix was posted a while ago:
> >
> > https://lore.kernel.org/linux-m68k/20210228190828.392974-1-angelo@kernel-space.org
> >
> > Can you check if this helps?
> 
> Thank you!
> 
> I hadn't realized this applies to classic m68k, too.
> One more reason to annotate #else and #endif keywords, to avoid
> people guessing wrong...
> 
> Greg: This is in linux-next, and still destined for v5.12, I assume?
> Thanks!
> 

That message seems to have omitted 'Cc: stable@vger.kernel.org' and the 
commit in linux-next seems to lack a 'Fixes' tag:
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/arch/m68k?id=06c5fa9b2168fcf185ca6807982bb97b72c0cfdb 
It may be worthwhile to add the missing tag before pushing.
