Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D136AEB64DD
	for <linux-m68k@archiver.kernel.org>; Fri, 21 Jul 2023 01:32:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229783AbjGUBcF (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 20 Jul 2023 21:32:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229528AbjGUBcE (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 20 Jul 2023 21:32:04 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CADD2733
        for <linux-m68k@lists.linux-m68k.org>; Thu, 20 Jul 2023 18:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=PSx2A+gPGAEBQXEanuoCquzlgTs4W/VYB04SKNDk4Tc=; b=AiyEsjYBmIthk1x3CkQsK4Zofq
        iEq+108vcDursutdmWSTY/UsHIvODi3B09/BuYXKfKoa4f1nbEkq9j+qfWohj6Kx8KHkcLlpbv+D/
        Ir3ed9HwzaRgtnBOu196Pc/OY+WMNfdEalrPT9rbB3yKCLR+vT6AROJfCYZPPqTTvS9vlveKf6H3Z
        q2hpICV7E68Ya878SCqNR4fcBoWRsjow/Tc+/B6cbGZICUbESEr71+2Bxvuvj7aWfmrgb56Sxt45K
        FxZseORPINpqcRtniLsuEaIKlwPQlJzHsTirk6j2SYLlAxBS2hJ4KZFJ9pj36wKLm4lrWXtKvpJIE
        8yEYfrZQ==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
        id 1qMezx-000dTr-9k; Fri, 21 Jul 2023 01:32:01 +0000
Date:   Fri, 21 Jul 2023 02:32:01 +0100
From:   Matthew Wilcox <willy@infradead.org>
To:     Michael Schmitz <schmitzmic@gmail.com>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: Re: clear_bit_unlock_is_negative_byte
Message-ID: <ZLngEXDdrAKSw+90@casper.infradead.org>
References: <ZLmKq2VLjYGBVhMI@casper.infradead.org>
 <25b10d04-c6bf-8583-ee0d-84bf647ef0af@gmail.com>
 <5e3a36d1-13f0-9cc3-de44-cc045025b290@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5e3a36d1-13f0-9cc3-de44-cc045025b290@gmail.com>
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Fri, Jul 21, 2023 at 01:12:48PM +1200, Michael Schmitz wrote:
> Logging the bit nr. and value passed in:
> 
> nfhd8: found device with 20971440 blocks (512 bytes)
> cbu_inb memval mismatch: 2004 12005 2005 0
> cbu_inb memval mismatch: 2004 12005 2005 0
>  nfhd8: AHDI p1 p2
> cbu_inb memval mismatch: 36 10037 37 0
> cbu_inb memval mismatch: 36 10037 37 0

I'm not quite sure what values you're printing here?  And whether
they're hex or decimal.  Could you show me the printk string?

> The instruction you need is eori.b, and you'll have to increase the mem
> pointer by 3 bytes. With that change, I see no further mismatches until the
> return values begin to differ once disk access begins:

Ah thanks.  The perils of working from Motorola official docs and then
trying to use the GNU assembler ...

> sd 0:0:1:0: [sdb] Preferred minimum I/O size 512 bytes
> cbu_inb retval mismatch: 1 ff 2084 2084 2085 0
> rtc-generic rtc-generic: registered as rtc0
> cbu_inb retval mismatch: 1 ff 2094 2094 2095 0
> ...
> sd 0:0:0:0: [sda] Attached SCSI disk
> probe of 0:0:0:0 returned 0 after 58395182 usecs
> cbu_inb retval mismatch: 1 ff 2094 2094 2095 0
>  sdb: RDSK (512) sdb1 (DOS^G)(res 2 spb 2) sdb2 (SFS^B)(res 2 spb 1) sdb3
> (SFS^B)(res 2 spb 2) sdb4 ((res 2 spb 1)
> sdb: p4 size 18446744071971831216 extends beyond EOD, enabling native
> capacity
> cbu_inb retval mismatch: 1 ff 2084 2084 2085 0
> 
> (return value from old and new code, value of mem from old and new code,
> original value, bit nr).

OK, so the new code would set the byte to 0xff (that's how Sxx works).
But it's returning a bool, so that shouldn't matter.  2084/2084/2085
would make sense; one of the two functions has cleared the bottom bit.

> Bit 7 was already set before xor, and wasn't cleared. I suspect that's why
> the return value is no longer 1?

Ah, it's not supposed to be cleared.  The way this works is that bit 0
is the lock bit; if someone's waiting on the folio, they set bit 7.  If
bit 7 is set when we clear bit 0, we look on the wait queue.  If there's
nobody on the wait queue, we clear bit 7.

So ... I think you've fixed it!
