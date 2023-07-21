Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E2FFEB64DC
	for <linux-m68k@archiver.kernel.org>; Fri, 21 Jul 2023 11:59:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229453AbjGUL7y (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 21 Jul 2023 07:59:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229809AbjGUL7x (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 21 Jul 2023 07:59:53 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B342C171B
        for <linux-m68k@lists.linux-m68k.org>; Fri, 21 Jul 2023 04:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=uPd7SbdK0Q1DT4WQiOj0ffQ8jJvj/8MKm8DahokqzEk=; b=g9se6vZBCPHSSYC/aPkz4MiW6/
        Ekl+63UfyzGYzFGNFaqvCcsMKKVw5Watig+t/pAdGmoaYgTlcfdJaCqzxzxTHQEMvVpiQE44unoQ1
        Q2b5tSRP3fpvsWAVC9HOCxxF/dxW+PRJaun5st50LO2qCFaQqUrA3N5yURoDzEEBZRTHwTP1c1eRv
        iFiOnz8YBfsMKMIfWHw6UrL0cK4ODgiwE5l5wTqynB2j3qYOwjW7ib9CdnS9ks0fmoGso1NacM87U
        AdwaSCYvlLpyjmYhW7tzpklpgm1zgUD7tVpTfonN3HGBrZrc+L5xhO2mPqET10rI+68k+nOeaTaX3
        5HbbrMXA==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
        id 1qMonU-0015Px-SE; Fri, 21 Jul 2023 11:59:48 +0000
Date:   Fri, 21 Jul 2023 12:59:48 +0100
From:   Matthew Wilcox <willy@infradead.org>
To:     Andreas Schwab <schwab@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: Re: clear_bit_unlock_is_negative_byte
Message-ID: <ZLpzNAIVVLH9JYZ1@casper.infradead.org>
References: <ZLmKq2VLjYGBVhMI@casper.infradead.org>
 <87jzut6acw.fsf@linux-m68k.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87jzut6acw.fsf@linux-m68k.org>
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Fri, Jul 21, 2023 at 08:34:55AM +0200, Andreas Schwab wrote:
> On Jul 20 2023, Matthew Wilcox wrote:
> 
> > +static inline bool clear_bit_unlock_is_negative_byte(unsigned int nr,
> > +               volatile unsigned long *p)
> > +{
> > +       char result;
> > +       char mask = 1 << nr;    /* nr guaranteed to be < 7 */
> > +
> > +       __asm__ __volatile__ ("eori %1, %2; smi %0"
> 
> Why are you using XOR if you want to clear a bit?  If it operates on a
> byte, why does it receive a pointer to long?

It's a clever hack.  This function has exactly one user, and it's an
important one -- folio_unlock().  Bit 7 is set if there are other
threads waiting for this folio to be unlocked.  There are two reasonable
implementations, depending what kind of CPU you have; you can either
load-locked; clear the bottom bit, store-conditional, test bit 7.  Or
x86 and m68k have the perfect instruction to clear a bit and set the
Negative flag if bit 7 is set.

As I said in the earlier email, BCLR doesn't affect the N flag, but
EORI and ANDI do.  We are guaranteed that the bit we're clearing is set,
so EORI will work.  ANDI would also work.

Do you happen to know if __GCC_ASM_FLAG_OUTPUTS__ is implemented for
m68k so we can save the SMI instruction?
