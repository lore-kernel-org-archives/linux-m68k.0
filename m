Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC8A7C433E0
	for <linux-m68k@archiver.kernel.org>; Fri, 26 Mar 2021 02:41:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A6E9261A43
	for <linux-m68k@archiver.kernel.org>; Fri, 26 Mar 2021 02:41:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230158AbhCZClV (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 25 Mar 2021 22:41:21 -0400
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:59416 "EHLO
        kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230370AbhCZCku (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 25 Mar 2021 22:40:50 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
        by kvm5.telegraphics.com.au (Postfix) with ESMTP id 1D35629E0D;
        Thu, 25 Mar 2021 22:40:47 -0400 (EDT)
Date:   Fri, 26 Mar 2021 13:40:44 +1100 (AEDT)
From:   Finn Thain <fthain@telegraphics.com.au>
To:     Stan Johnson <userm57@yahoo.com>
cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Mike Rapoport <rppt@kernel.org>,
        linux-m68k@lists.linux-m68k.org, Greg Ungerer <gerg@linux-m68k.org>
Subject: Re: v5.11 (CONFIG_FLATMEM) boot crash
In-Reply-To: <c1fbde1b-0f2a-bda0-7bb3-44156031bf41@yahoo.com>
Message-ID: <9831b7d8-5b1b-872d-ab25-3967748553b2@telegraphics.com.au>
References: <25bd53c4-8d29-5457-13a4-2e34011d796@telegraphics.com.au> <YFxb0d94yV/635vT@kernel.org> <c1fbde1b-0f2a-bda0-7bb3-44156031bf41@yahoo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Thu, 25 Mar 2021, Stan Johnson wrote:

> On 3/25/21 3:45 AM, Mike Rapoport wrote:
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
> > 
> 
> Thanks. With the patch applied to v5.11, and using the same config file
> that Finn used earlier, the crash has gone away and the behavior is the
> same as v5.10 ...
> 

Good to know.
