Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF5E2C433EF
	for <linux-m68k@archiver.kernel.org>; Sun, 12 Sep 2021 04:11:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8636560FC0
	for <linux-m68k@archiver.kernel.org>; Sun, 12 Sep 2021 04:11:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229533AbhILENG (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 12 Sep 2021 00:13:06 -0400
Received: from cynthia.allandria.com ([50.242.82.17]:33672 "EHLO
        cynthia.allandria.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229500AbhILENG (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Sun, 12 Sep 2021 00:13:06 -0400
X-Greylist: delayed 957 seconds by postgrey-1.27 at vger.kernel.org; Sun, 12 Sep 2021 00:13:06 EDT
Received: from flar by cynthia.allandria.com with local (Exim 4.84_2)
        (envelope-from <flar@allandria.com>)
        id 1mPGau-0006IP-S5; Sat, 11 Sep 2021 20:55:52 -0700
Date:   Sat, 11 Sep 2021 20:55:52 -0700
From:   Brad Boyer <flar@allandria.com>
To:     Finn Thain <fthain@linux-m68k.org>
Cc:     Michael Schmitz <schmitzmic@gmail.com>, linux-m68k@vger.kernel.org
Subject: Re: Mainline kernel crashes, was Re: RFC: remove set_fs for m68k
Message-ID: <20210912035552.GA23813@allandria.com>
References: <755e55ba-4ce2-b4e4-a628-5abc183a557a@linux-m68k.org>
 <b52a10fe-3e4b-5740-d3f8-52bce3bc988@linux-m68k.org>
 <31f27da7-be60-8eb-9834-748b653c2246@linux-m68k.org>
 <ed2ca322-b957-cd52-8d2f-a8edd2785625@linux-m68k.org>
 <977bb34f-6de9-3a9e-818f-b1aa0758f78f@gmail.com>
 <fa8682aa-c5f4-7995-166d-8fa899594b19@linux-m68k.org>
 <42b30d4f-b871-51ea-1b0e-479f4fe096eb@gmail.com>
 <7ac7a41a-53f9-b13c-83fa-2c6b8ef2b90@linux-m68k.org>
 <0477f373-86c9-dacb-a7b1-25fe4b3befd3@gmail.com>
 <2c624213-6a4-799c-45e-a1be578dd5f@linux-m68k.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2c624213-6a4-799c-45e-a1be578dd5f@linux-m68k.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Sun, Sep 12, 2021 at 10:51:21AM +1000, Finn Thain wrote:
> However, I did notice that preempt_count_add() and preempt_count_sub() and 
> the associated macros in linux/preempt.h produce very inefficient code in 
> the interrupt fast path. Here's one example (there are others).
> 
> 000323de <irq_enter_rcu>:
>    323de:       4e56 0000       linkw %fp,#0
>    323e2:       200f            movel %sp,%d0
>    323e4:       0280 ffff e000  andil #-8192,%d0
>    323ea:       2040            moveal %d0,%a0
>    323ec:       2028 000c       movel %a0@(12),%d0
>    323f0:       0680 0001 0000  addil #65536,%d0
>    323f6:       2140 000c       movel %d0,%a0@(12)
>    323fa:       082a 0001 000f  btst #1,%a2@(15)
>    32400:       670c            beqs 3240e <irq_enter_rcu+0x30>
>    32402:       2028 000c       movel %a0@(12),%d0
>    32406:       2028 000c       movel %a0@(12),%d0
>    3240a:       2028 000c       movel %a0@(12),%d0
>    3240e:       4e5e            unlk %fp
>    32410:       4e75            rts

If I'm reading the code correctly, this is due to the use of READ_ONCE
in a bunch of places. I'm pretty sure that forces the compiler to
produce a separate read instruction each time even if the value isn't
used or the operation could have otherwise been optimized. Reading
the result it's obvious this isn't useful (particularly the three
discarded reads of the same address), but I think the compiler is
just doing what we told it to do. Each time we load %a0@(12), that's
one of these instances (I think it's the preempt count in this case).
Obviously every one of them would be safe to optimize given the
context, but the compiler doesn't know that.

I suspect this could be optimized by defining alternate versions of
some of the relevant macros that do nothing for cases like this.
However, it might be tricky to figure out ways to do this that
won't break something else.

	Brad Boyer
	flar@allandria.com

