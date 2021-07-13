Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B08E5C07E95
	for <linux-m68k@archiver.kernel.org>; Tue, 13 Jul 2021 08:54:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 928EA61351
	for <linux-m68k@archiver.kernel.org>; Tue, 13 Jul 2021 08:54:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234690AbhGMI5L (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 13 Jul 2021 04:57:11 -0400
Received: from verein.lst.de ([213.95.11.211]:57811 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234599AbhGMI5L (ORCPT <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 13 Jul 2021 04:57:11 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
        id D941C67373; Tue, 13 Jul 2021 10:54:19 +0200 (CEST)
Date:   Tue, 13 Jul 2021 10:54:19 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Michael Schmitz <schmitzmic@gmail.com>
Cc:     Christoph Hellwig <hch@lst.de>,
        Andreas Schwab <schwab@linux-m68k.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        linux-m68k@lists.linux-m68k.org
Subject: Re: RFC: remove set_fs for m68k
Message-ID: <20210713085419.GA22839@lst.de>
References: <20210709070132.3387689-1-hch@lst.de> <039e2f42-b9bc-d8ce-393a-c0896439f784@gmail.com> <87fswjomtm.fsf@igel.home> <969718aa-92d4-e77b-0630-f9da6c809178@gmail.com> <20210713054134.GA5880@lst.de> <90e30f50-f062-ac8d-68e7-1250c886d0e1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <90e30f50-f062-ac8d-68e7-1250c886d0e1@gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Tue, Jul 13, 2021 at 08:16:25PM +1200, Michael Schmitz wrote:
> I'll try that next. It certainly ran fine when I tried your earlier version 
> which still had the __constant_copy_from_user() (but modified to use 
> __get_user_asm() for the 1, 2 and 4 byte cases). That doesn't prove much 
> though - I may not have hit the exact same memory pressure (not sure how 
> often savelogs runs on that system, and I haven't checked how much the 
> kernel size differs between the two versions).
>
> Anyway, I'll try my previous version again, and I'll try with the WARN_ON 
> removed, but that'll take a few days (did I mention this 030 is clocked at 
> 16 MHz only?).

No problem.

> I suspect it may get called from an interrupt - not sure what interrupt 
> handler would call vm_map_ram(), or if that even is allowed though. Might 
> happen during a softirq, which is covered by in_interrupt as well ...

vm_map_ram isn't allowed to be called from interrupts, just like all the
vmalloc/vmap code.  But that doesn't mean it might not have crept in
somewhere.
