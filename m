Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57B27EB64DC
	for <linux-m68k@archiver.kernel.org>; Fri, 21 Jul 2023 09:31:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229651AbjGUJbQ (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 21 Jul 2023 05:31:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229557AbjGUJbQ (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 21 Jul 2023 05:31:16 -0400
X-Greylist: delayed 2037 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 21 Jul 2023 02:31:15 PDT
Received: from cynthia.allandria.com (cynthia.allandria.com [50.242.82.17])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DCB32726
        for <linux-m68k@lists.linux-m68k.org>; Fri, 21 Jul 2023 02:31:15 -0700 (PDT)
Received: from flar by cynthia.allandria.com with local (Exim 4.84_2)
        (envelope-from <flar@allandria.com>)
        id 1qMlwl-00029H-8a; Fri, 21 Jul 2023 01:57:11 -0700
Date:   Fri, 21 Jul 2023 01:57:11 -0700
From:   Brad Boyer <flar@allandria.com>
To:     Andreas Schwab <schwab@linux-m68k.org>
Cc:     Matthew Wilcox <willy@infradead.org>,
        linux-m68k@lists.linux-m68k.org
Subject: Re: clear_bit_unlock_is_negative_byte
Message-ID: <20230721085711.GA6785@allandria.com>
References: <ZLmKq2VLjYGBVhMI@casper.infradead.org>
 <87jzut6acw.fsf@linux-m68k.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87jzut6acw.fsf@linux-m68k.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
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

I presume the thing with byte is to try to save an extension word.
Using a long immediate argument makes the instruction take 6 bytes
instead of 4. Since we (apparently?) know we don't want to modify
the other three bytes, we can safely take shortcuts like that.
However, I would agree that using XOR here seems wrong. It
fundamentally presumes the bit was previously set. The other
architectures I checked with asm versions of this look like they
do the equivalent of andi with the inverted mask. We are also
presuming that nr is always a compile time constant, but it looks
like that should be true? If it can be immediate, the inversion
would be done by the compiler. The powerpc version doesn't appear to
make either assumption. It looks like it's loading and storing a
"word" (32-bit in that case) to do this. However, the instructions
it's using don't even have byte equivalents.

	Brad Boyer
	flar@allandria.com

