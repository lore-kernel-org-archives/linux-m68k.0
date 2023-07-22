Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EC5EEB64DA
	for <linux-m68k@archiver.kernel.org>; Sat, 22 Jul 2023 03:42:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229552AbjGVDmo (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 21 Jul 2023 23:42:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229534AbjGVDmm (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 21 Jul 2023 23:42:42 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01D1030F1
        for <linux-m68k@lists.linux-m68k.org>; Fri, 21 Jul 2023 20:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=r53ZW8D82q7aAJHcMD25AkfN6/iYay7dN8qaCd0wxb0=; b=ixMSM2IvsXuK9k4c4DWYSv/rO5
        Gq1jjRZ5es65VVYC6gtg0ex7OqL/tjJONPqroBbxEQWG6zHhcxjVVpDgFqaaLyc55KpabiiKZzEuM
        rCQWgXxLQ+9GTqVofNit68EwoS42Ecejoz9cniP6Zd+Xf4LcZrQOe0Szl85R6s6RI4wYJqI2Yh9FO
        POyyv2eZODyKCbYHmeZ/jZl0k+f8afOaOjZXcdWh1Js6cGDWlFh2vj9nYDL6paypVINYoWtMDRhqk
        xfbRYdtlyFIVwis7oHo2w9v5B2BTpNNYXIHbSaBBm5KyAW/jvqZaJjjxKgSa4vMD0i6Xwy3wEWtX/
        fXDFXJRg==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
        id 1qN3Vp-001iPM-Th; Sat, 22 Jul 2023 03:42:34 +0000
Date:   Sat, 22 Jul 2023 04:42:33 +0100
From:   Matthew Wilcox <willy@infradead.org>
To:     Brad Boyer <flar@allandria.com>
Cc:     Andreas Schwab <schwab@linux-m68k.org>,
        linux-m68k@lists.linux-m68k.org
Subject: Re: clear_bit_unlock_is_negative_byte
Message-ID: <ZLtQKfMDDGQdtsaR@casper.infradead.org>
References: <ZLmKq2VLjYGBVhMI@casper.infradead.org>
 <87jzut6acw.fsf@linux-m68k.org>
 <ZLpzNAIVVLH9JYZ1@casper.infradead.org>
 <20230721202904.GA12851@allandria.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230721202904.GA12851@allandria.com>
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Fri, Jul 21, 2023 at 01:29:04PM -0700, Brad Boyer wrote:
> On Fri, Jul 21, 2023 at 12:59:48PM +0100, Matthew Wilcox wrote:
> > On Fri, Jul 21, 2023 at 08:34:55AM +0200, Andreas Schwab wrote:
> > > Why are you using XOR if you want to clear a bit?  If it operates on a
> > > byte, why does it receive a pointer to long?
> > 
> > It's a clever hack.  This function has exactly one user, and it's an
> > important one -- folio_unlock().  Bit 7 is set if there are other
> > threads waiting for this folio to be unlocked.  There are two reasonable
> > implementations, depending what kind of CPU you have; you can either
> > load-locked; clear the bottom bit, store-conditional, test bit 7.  Or
> > x86 and m68k have the perfect instruction to clear a bit and set the
> > Negative flag if bit 7 is set.
> > 
> > As I said in the earlier email, BCLR doesn't affect the N flag, but
> > EORI and ANDI do.  We are guaranteed that the bit we're clearing is set,
> > so EORI will work.  ANDI would also work.
> 
> There shouldn't be any performance difference between using eori.b and
> andi.b, since the compiler would fully generate the immediate mask
> value either way. Wouldn't readability suggest that we should use the
> AND operation to make it more obvious what the code is doing and make
> it more consistent with the other implementations of this function?

That brings me to the next phase of this which is not yet fully baked,
so I wasn't proposing it for discussion at this time.

https://git.infradead.org/users/willy/pagecache.git/shortlog/refs/heads/folio-flags

What I want to do is allow us to set/clear multiple bits in the same
instruction that unlocks the folio.  The obvious one is
folio_mark_uptodate(); this is commonly paired with folio_unlock(),
and it's a crucial part of page cache reads.  There are some less
obvious ones like folio_start_writeback() and folio_unlock(),
which isn't included in this patch series.  If we're going to set
one bit and clear another bit, we have to use the xor/eor instruction,
and that's what we do.

On some architectures, such as MIPS, there's actually a
separate function to implement all of this and so passing it a
(constant) mask (instead of calculating that mask from what
is now a variable bit) makes sense, and we can then use that
function to implement both clear_bit_unlock_is_negative_byte() and
change_and_unlock_is_negative_byte().  I'm still going around on this.
I might change the API to always pass in a mask from folio_set_unlock().

And maybe we actualy get rid of clear_bit_unlock_is_negative_byte()
since it's essentially a subset of change_and_unlock_is_negative_byte().
But I can change m68k to use andi.b for now if you feel strongly.
