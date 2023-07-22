Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 229B6EB64DA
	for <linux-m68k@archiver.kernel.org>; Sat, 22 Jul 2023 15:38:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229684AbjGVPiw (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sat, 22 Jul 2023 11:38:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229679AbjGVPiw (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sat, 22 Jul 2023 11:38:52 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEA281A1
        for <linux-m68k@lists.linux-m68k.org>; Sat, 22 Jul 2023 08:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=UvLXHtXMoOuYC/w29DMxvtvIetq9yupsRHM0FicCGLk=; b=rQ8O/L7AomDnN4BBS2X4YFiuI+
        M4TllHPrQESmYkcS0kHuZyUQv+6CPAly4nshe1/wZwfu8QG9wjtlrnhAF8zGvjkEtDr+XwSR/SpwB
        SLXvPcY38fhNXX7b/AGg2mu0WWpkr7LcndhSLXnLVuWevNQBmv/HBhD9b2xafQTm/NVLDQnJZF8TO
        vzq82AiOlVAZSSf6rr/rChWcVNOHfPflU28icj1dudcKWQ8/2jaeF6pqDdo+FaLM05pXqM/DI6/Sj
        KCXTN99R8F7/LDU3Lo+hQZ5pN9Pg3YvHfM5zfExxDslrjZoXZ1MHZMbJfUDKjwWUsesHxf89cYYx5
        Ti9qK5ZA==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
        id 1qNEgx-0028vt-Mw; Sat, 22 Jul 2023 15:38:47 +0000
Date:   Sat, 22 Jul 2023 16:38:47 +0100
From:   Matthew Wilcox <willy@infradead.org>
To:     Andreas Schwab <schwab@linux-m68k.org>
Cc:     Michael Schmitz <schmitzmic@gmail.com>,
        linux-m68k@lists.linux-m68k.org
Subject: Re: clear_bit_unlock_is_negative_byte
Message-ID: <ZLv4BwzkO8tieKHQ@casper.infradead.org>
References: <ZLmKq2VLjYGBVhMI@casper.infradead.org>
 <25b10d04-c6bf-8583-ee0d-84bf647ef0af@gmail.com>
 <5e3a36d1-13f0-9cc3-de44-cc045025b290@gmail.com>
 <ZLngEXDdrAKSw+90@casper.infradead.org>
 <2e4c5eda-671e-9fc8-17fc-7f4b894ef653@gmail.com>
 <87edl0lazh.fsf@linux-m68k.org>
 <ZLvrd+tk6HiqB2Qk@casper.infradead.org>
 <87tttwezn4.fsf@igel.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87tttwezn4.fsf@igel.home>
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Sat, Jul 22, 2023 at 05:26:07PM +0200, Andreas Schwab wrote:
> On Jul 22 2023, Matthew Wilcox wrote:
> 
> > On Sat, Jul 22, 2023 at 08:24:34AM +0200, Andreas Schwab wrote:
> >> On Jul 21 2023, Michael Schmitz wrote:
> >> 
> >> > static inline bool clear_bit_unlock_is_negative_byte(unsigned int nr,
> >> >                 volatile unsigned long *p)
> >> > {
> >> >         unsigned char *cp = (unsigned char *) p;
> >> >         char result;
> >> >         char mask = 1 << nr;    /* nr guaranteed to be < 7 */
> >> >
> >> >         __asm__ __volatile__ ("eori.b %1, %2; smi %0"
> >> >                 : "=d" (result)
> >> >                 : "i" (mask), "o" (*(cp+3))
> >> 
> >> That should use "id" as constraint, so that the compiler can share the
> >> constant with other insns.  Also, the third operand is modified, so it
> >> needs to be marked as in/out.
> >
> > The "o" constraint is shared with bfset_mem_set_bit,
> > bfclr_mem_test_and_clear_bit and a few other functions.  Should they
> > all be changed?
> 
> They use a memory clobber, because the "o" constraint cannot accurately
> describe the situation there.

My understanding is that clear_bit_unlock_is_negative_byte() also
needs the "memory" clobber because it has "release" semantics (ie
all previous stores must be visible before this store is visible).

static inline bool clear_bit_unlock_is_negative_byte(unsigned int nr,
                volatile unsigned long *p)
{
        char result;
        char mask = 1 << nr;            /* nr guaranteed to be < 7 */
        char *cp = (char *)p + 3;       /* m68k is big-endian */

        __asm__ __volatile__ ("eori.b %1, %2; smi %0"
                : "=d" (result)
                : "di" (mask), "o" (*cp)
                : "memory");
        return result;
}

is what I currently have.
