Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35F9AEB64DC
	for <linux-m68k@archiver.kernel.org>; Fri, 21 Jul 2023 17:03:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230170AbjGURD2 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 21 Jul 2023 13:03:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230107AbjGURD1 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 21 Jul 2023 13:03:27 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D42C10CB
        for <linux-m68k@lists.linux-m68k.org>; Fri, 21 Jul 2023 10:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=n1pZVCbeW6IxyYCcx8p2OsXIxnP9QDyEu+DncDBfs68=; b=IYG7DtNemuEg5Dqzc7QTX+fpOQ
        +R55pFnFHAjR0MW0le1EuOnIfDe3TK/80ewkWF3QSdzM5n+a5hk5MQVyhlQHsKgHobEmg3OcpBxpk
        SP7eOa5Oq6M2m026XQZ8lGg/0sXEzYMYXEf3tX+EWwPDvLdjgnH6DI01W1eVm0UoMo9nYczymSkJt
        qj+9dLtLKvI39Ckic8pdpreqmFqpFpyye+BQm9SF1rSCz95QuMeK5Zr6ze+86T9x/PEQpgTZvF3ln
        DS9YiUR/dnp3qbOLcPEu/XfiPKI3DtawcigaqAlHQu6mZzpy7bRHMzkf1ZwTi3BiG6V1FTGhlP9Mf
        vhVn8jMQ==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
        id 1qMtXH-001IQK-Aa; Fri, 21 Jul 2023 17:03:23 +0000
Date:   Fri, 21 Jul 2023 18:03:23 +0100
From:   Matthew Wilcox <willy@infradead.org>
To:     Michael Schmitz <schmitzmic@gmail.com>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: Re: clear_bit_unlock_is_negative_byte
Message-ID: <ZLq6W1PB0Jh74gjD@casper.infradead.org>
References: <ZLmKq2VLjYGBVhMI@casper.infradead.org>
 <25b10d04-c6bf-8583-ee0d-84bf647ef0af@gmail.com>
 <5e3a36d1-13f0-9cc3-de44-cc045025b290@gmail.com>
 <ZLngEXDdrAKSw+90@casper.infradead.org>
 <2e4c5eda-671e-9fc8-17fc-7f4b894ef653@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2e4c5eda-671e-9fc8-17fc-7f4b894ef653@gmail.com>
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Fri, Jul 21, 2023 at 01:43:06PM +1200, Michael Schmitz wrote:
> > Ah, it's not supposed to be cleared.  The way this works is that bit 0
> > is the lock bit; if someone's waiting on the folio, they set bit 7.  If
> > bit 7 is set when we clear bit 0, we look on the wait queue.  If there's
> > nobody on the wait queue, we clear bit 7.
> 
> Right, that's what I meant to say. I'd only seen cases where bit 0 had been
> set and was cleared. This isn't an actual production system of sorts, just
> an ARAnyM instance I can fire up quickly to see patched kernels crash
> horribly.

Well, I appreciate the testing!

> This is what I have tests running on right now:
> 
> static inline bool clear_bit_unlock_is_negative_byte(unsigned int nr,
>                 volatile unsigned long *p)
> {
>         unsigned char *cp = (unsigned char *) p;
>         char result;
>         char mask = 1 << nr;    /* nr guaranteed to be < 7 */
> 
>         __asm__ __volatile__ ("eori.b %1, %2; smi %0"
>                 : "=d" (result)
>                 : "i" (mask), "o" (*(cp+3))
>                 : "memory");
>         return result;
> }

I thought it a little odd to use an unsigned char when we're testing
to see if it's negative, so I went with this:

static inline bool clear_bit_unlock_is_negative_byte(unsigned int nr,
                volatile unsigned long *p)
{
        char result;
        char mask = 1 << nr;            /* nr guaranteed to be < 7 */
        char *cp = (char *)p + 3;       /* m68k is big-endian */

        __asm__ __volatile__ ("eori.b %1, %2; smi %0"
                : "=d" (result)
                : "i" (mask), "o" (*cp)
                : "memory");
        return result;
}

> I'm sure you can do all the casting to char and increment by 3 in the asm
> argument...

I'd rather not.  I looked at doing the offset by three inside the asm,
but it seems like gcc is smart enough to do that without help:

000006e0 <folio_unlock>:
     6e0:       206f 0004       moveal %sp@(4),%a0
     6e4:       0a28 0001 0003  eorib #1,%a0@(3)
     6ea:       5bc0            smi %d0
     6ec:       4a00            tstb %d0
     6ee:       670a            beqs 6fa <folio_unlock+0x1a>
     6f0:       42a7            clrl %sp@-
     6f2:       2f08            movel %a0,%sp@-
     6f4:       4eba fcec       jsr %pc@(3e2 <folio_wake_bit>)
     6f8:       508f            addql #8,%sp
     6fa:       4e75            rts

You'll note the smi/tstb pair are unnecessary.  It could simply BPL to
the RTS instruction, but we can't tell GCC that because we don't have
the __GCC_ASM_FLAG_OUTPUTS__ feature.

By the way, before this optimisation, it was this:

000006fc <folio_unlock>:
     6fc:       206f 0004       moveal %sp@(4),%a0
     700:       08a8 0000 0003  bclr #0,%a0@(3)
     706:       2010            movel %a0@,%d0
     708:       4a00            tstb %d0
     70a:       6c0a            bges 716 <folio_unlock+0x1a>
     70c:       42a7            clrl %sp@-
     70e:       2f08            movel %a0,%sp@-
     710:       4eba fcd0       jsr %pc@(3e2 <folio_wake_bit>)
     714:       508f            addql #8,%sp
     716:       4e75            rts

which is the same number of instructions, but one more memory reference.
It's a read-after-write hazard, but I don't know if that affects any
m68k implementation; my impression is that even on an '060 there aren't
any real performance implications.  Kudos to gcc for figuring out that
testing bit 7 can be done with the tstb instruction.

> If there's a simple way to exercise this code path using standard Unix tools
> (or stress-ng which I ought to have somewhere), drop me a hint.

Oh, it's so common to have a waiter on a folio unlock that just making
it to the login prompt is enough to declare comfidently that this works.
CPU implementations with memory barriers and such fanciness are a little
harder to be confident in, but this looks good to me.  I generally run
xfstests, but that's just because I have it all set up and ready to go.

I'll drop your Tested-by on this if that's OK?  If you want a
Co-developed-by credit, that's fine with me too!
