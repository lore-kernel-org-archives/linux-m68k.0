Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F340EB64DA
	for <linux-m68k@archiver.kernel.org>; Sat, 22 Jul 2023 14:45:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229469AbjGVOpR (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sat, 22 Jul 2023 10:45:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229640AbjGVOpQ (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sat, 22 Jul 2023 10:45:16 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8842A273E
        for <linux-m68k@lists.linux-m68k.org>; Sat, 22 Jul 2023 07:45:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=bj4j31u33OvAKpbOV4XCZOyJXLuSEWFbZ5hPLAKHdmQ=; b=WGprQfDDrli7HzMrTxdzqXI37f
        fldKBtNIuLQ1igsrqLArkw0BMsyl/ZuTFgrZZmJAl35LUn+VSu1xw8IaP61kANNYW7gNjlshP5jk0
        r+DxJsbj6fBFRilZhChrF+3F1A6NB52mdCLLc5Zp1KzoyqKp+0qnoHjJXybjqpuDkQKQevL6wo0pr
        lnSPnCvKmnf4+Hxf45Puo+PYGcnlw+4h2TTnUD2jP/zetXtBoJMBp1fpYdvYwBkGJJyvUT4Ak2D1G
        KwsHqKg9cXAcfGkm7z4mU7Q1+jl9dIl+49bmFc2VbqX/bda3wJDnM250lJdZ917BOo2Bq9+Dc82vn
        8PrkQMHw==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
        id 1qNDr5-0026i4-G9; Sat, 22 Jul 2023 14:45:11 +0000
Date:   Sat, 22 Jul 2023 15:45:11 +0100
From:   Matthew Wilcox <willy@infradead.org>
To:     Andreas Schwab <schwab@linux-m68k.org>
Cc:     Michael Schmitz <schmitzmic@gmail.com>,
        linux-m68k@lists.linux-m68k.org
Subject: Re: clear_bit_unlock_is_negative_byte
Message-ID: <ZLvrd+tk6HiqB2Qk@casper.infradead.org>
References: <ZLmKq2VLjYGBVhMI@casper.infradead.org>
 <25b10d04-c6bf-8583-ee0d-84bf647ef0af@gmail.com>
 <5e3a36d1-13f0-9cc3-de44-cc045025b290@gmail.com>
 <ZLngEXDdrAKSw+90@casper.infradead.org>
 <2e4c5eda-671e-9fc8-17fc-7f4b894ef653@gmail.com>
 <87edl0lazh.fsf@linux-m68k.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87edl0lazh.fsf@linux-m68k.org>
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Sat, Jul 22, 2023 at 08:24:34AM +0200, Andreas Schwab wrote:
> On Jul 21 2023, Michael Schmitz wrote:
> 
> > static inline bool clear_bit_unlock_is_negative_byte(unsigned int nr,
> >                 volatile unsigned long *p)
> > {
> >         unsigned char *cp = (unsigned char *) p;
> >         char result;
> >         char mask = 1 << nr;    /* nr guaranteed to be < 7 */
> >
> >         __asm__ __volatile__ ("eori.b %1, %2; smi %0"
> >                 : "=d" (result)
> >                 : "i" (mask), "o" (*(cp+3))
> 
> That should use "id" as constraint, so that the compiler can share the
> constant with other insns.  Also, the third operand is modified, so it
> needs to be marked as in/out.

The "o" constraint is shared with bfset_mem_set_bit,
bfclr_mem_test_and_clear_bit and a few other functions.  Should they
all be changed?  Some use "+m".
