Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 847D1C001B0
	for <linux-m68k@archiver.kernel.org>; Sat, 22 Jul 2023 23:49:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229477AbjGVXtK (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sat, 22 Jul 2023 19:49:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229468AbjGVXtJ (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sat, 22 Jul 2023 19:49:09 -0400
Received: from cynthia.allandria.com (cynthia.allandria.com [50.242.82.17])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8743B122
        for <linux-m68k@lists.linux-m68k.org>; Sat, 22 Jul 2023 16:49:08 -0700 (PDT)
Received: from flar by cynthia.allandria.com with local (Exim 4.84_2)
        (envelope-from <flar@allandria.com>)
        id 1qNMLO-0007rp-Cf; Sat, 22 Jul 2023 16:49:02 -0700
Date:   Sat, 22 Jul 2023 16:49:02 -0700
From:   Brad Boyer <flar@allandria.com>
To:     Matthew Wilcox <willy@infradead.org>
Cc:     Andreas Schwab <schwab@linux-m68k.org>,
        linux-m68k@lists.linux-m68k.org
Subject: Re: clear_bit_unlock_is_negative_byte
Message-ID: <20230722234902.GA29173@allandria.com>
References: <ZLmKq2VLjYGBVhMI@casper.infradead.org>
 <87jzut6acw.fsf@linux-m68k.org>
 <ZLpzNAIVVLH9JYZ1@casper.infradead.org>
 <20230721202904.GA12851@allandria.com>
 <ZLtQKfMDDGQdtsaR@casper.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZLtQKfMDDGQdtsaR@casper.infradead.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Sat, Jul 22, 2023 at 04:42:33AM +0100, Matthew Wilcox wrote:
> What I want to do is allow us to set/clear multiple bits in the same
> instruction that unlocks the folio.  The obvious one is
> folio_mark_uptodate(); this is commonly paired with folio_unlock(),
> and it's a crucial part of page cache reads.  There are some less
> obvious ones like folio_start_writeback() and folio_unlock(),
> which isn't included in this patch series.  If we're going to set
> one bit and clear another bit, we have to use the xor/eor instruction,
> and that's what we do.
> 
> On some architectures, such as MIPS, there's actually a
> separate function to implement all of this and so passing it a
> (constant) mask (instead of calculating that mask from what
> is now a variable bit) makes sense, and we can then use that
> function to implement both clear_bit_unlock_is_negative_byte() and
> change_and_unlock_is_negative_byte().  I'm still going around on this.
> I might change the API to always pass in a mask from folio_set_unlock().
> 
> And maybe we actualy get rid of clear_bit_unlock_is_negative_byte()
> since it's essentially a subset of change_and_unlock_is_negative_byte().
> But I can change m68k to use andi.b for now if you feel strongly.

I do prefer to be consistent. We already have strange inconsistencies
for bad reasons or no reason at all. However, if it's temporary, I
suppose it doesn't matter that much. With the new code in the diff in
your git tree, the use of eori is now consistent if you get rid of the
old clear bit version as separate code. If there's a decent chance it
will be a while before that next stage, I would personally recommend
using the andi. However, I would defer to the others on the list if
people think it's fine.

	Brad Boyer
	flar@allandria.com

