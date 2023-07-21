Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5DBDEB64DD
	for <linux-m68k@archiver.kernel.org>; Fri, 21 Jul 2023 20:29:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229643AbjGUU3Z (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 21 Jul 2023 16:29:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229566AbjGUU3Y (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 21 Jul 2023 16:29:24 -0400
Received: from cynthia.allandria.com (cynthia.allandria.com [50.242.82.17])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 687203A8E
        for <linux-m68k@lists.linux-m68k.org>; Fri, 21 Jul 2023 13:29:11 -0700 (PDT)
Received: from flar by cynthia.allandria.com with local (Exim 4.84_2)
        (envelope-from <flar@allandria.com>)
        id 1qMwkK-0003Rp-Qd; Fri, 21 Jul 2023 13:29:04 -0700
Date:   Fri, 21 Jul 2023 13:29:04 -0700
From:   Brad Boyer <flar@allandria.com>
To:     Matthew Wilcox <willy@infradead.org>
Cc:     Andreas Schwab <schwab@linux-m68k.org>,
        linux-m68k@lists.linux-m68k.org
Subject: Re: clear_bit_unlock_is_negative_byte
Message-ID: <20230721202904.GA12851@allandria.com>
References: <ZLmKq2VLjYGBVhMI@casper.infradead.org>
 <87jzut6acw.fsf@linux-m68k.org>
 <ZLpzNAIVVLH9JYZ1@casper.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZLpzNAIVVLH9JYZ1@casper.infradead.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Fri, Jul 21, 2023 at 12:59:48PM +0100, Matthew Wilcox wrote:
> On Fri, Jul 21, 2023 at 08:34:55AM +0200, Andreas Schwab wrote:
> > Why are you using XOR if you want to clear a bit?  If it operates on a
> > byte, why does it receive a pointer to long?
> 
> It's a clever hack.  This function has exactly one user, and it's an
> important one -- folio_unlock().  Bit 7 is set if there are other
> threads waiting for this folio to be unlocked.  There are two reasonable
> implementations, depending what kind of CPU you have; you can either
> load-locked; clear the bottom bit, store-conditional, test bit 7.  Or
> x86 and m68k have the perfect instruction to clear a bit and set the
> Negative flag if bit 7 is set.
> 
> As I said in the earlier email, BCLR doesn't affect the N flag, but
> EORI and ANDI do.  We are guaranteed that the bit we're clearing is set,
> so EORI will work.  ANDI would also work.

There shouldn't be any performance difference between using eori.b and
andi.b, since the compiler would fully generate the immediate mask
value either way. Wouldn't readability suggest that we should use the
AND operation to make it more obvious what the code is doing and make
it more consistent with the other implementations of this function?

	Brad Boyer
	flar@allandria.com

