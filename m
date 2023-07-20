Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11B92EB64DA
	for <linux-m68k@archiver.kernel.org>; Thu, 20 Jul 2023 19:27:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229679AbjGTT1p (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 20 Jul 2023 15:27:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229750AbjGTT1o (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 20 Jul 2023 15:27:44 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3976E171E
        for <linux-m68k@lists.linux-m68k.org>; Thu, 20 Jul 2023 12:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:Message-ID:
        Subject:To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
        Content-Description:In-Reply-To:References;
        bh=eBBe3q1Bee4Bg/s3z2yb84bzTpyQ6DRe9JuWUElJNJ4=; b=NqT4fhDlA4DgzFdwslGIIENmVP
        7M8u9OmQo7Ig/LcGcUuYtFQepgtQZrSA6QB/zR+PlxOHzubvjY4UZ3DgG42C7Jh+yBpQQ/bo3ygCm
        QNHQl/kDm/kxdoK/s0QHUfI8QE0ExfKP/B8fAqQ1zKSG2/bdAQeFkgHUqo4X8rm7q0pXW7Spr2x5J
        KoJ1osSIAjemF/iJCNfkJK8c55wNrNeYMcRJadgDlwXOq57MByV2caA1U41Ro2nkQR8IhVTCZLeh1
        ay+7oPOqzhHFZbRU/FfNzncGRnT+uMzHsDUyUimsiqksa3+2MbVmXc9GTr1FrSlPafkHfbzkHKngz
        Zfp1Agrw==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
        id 1qMZJL-000O8D-L4
        for linux-m68k@lists.linux-m68k.org; Thu, 20 Jul 2023 19:27:39 +0000
Date:   Thu, 20 Jul 2023 20:27:39 +0100
From:   Matthew Wilcox <willy@infradead.org>
To:     linux-m68k@lists.linux-m68k.org
Subject: clear_bit_unlock_is_negative_byte
Message-ID: <ZLmKq2VLjYGBVhMI@casper.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

I'm looking to implement clear_bit_unlock_is_negative_byte() on every
architecture so we can delete the ifdeffery around maybe-we-have-it
and remove the simple implementation from filemap.c.  Here's what I've
come up with for m68k:

+static inline bool clear_bit_unlock_is_negative_byte(unsigned int nr,
+               volatile unsigned long *p)
+{
+       char result;
+       char mask = 1 << nr;    /* nr guaranteed to be < 7 */
+
+       __asm__ __volatile__ ("eori %1, %2; smi %0"
+               : "=d" (result)
+               : "i" (mask), "o" (*p)
+               : "memory");
+       return result;
+}

It compiles, so I feel Very Pleased With Myself, since I haven't written
m68k assmbly in 25 years.  But I have questions.

First, m68k is big-endian, so I suspect I'm accessing the wrong byte.
Should something in there be adding 3 to 'p'?  Better to do it in the
asm, or in the constraints so the compiler can see it?

Second, have I properly communicated to the assembler that this is
a byte-size operation, and it needs to check bit 7 and not bits 15 or 31
to set the negative flag?

Third, can this be done better?  x86 has __GCC_ASM_FLAG_OUTPUTS__
so it doesn't need the equivalent of the SMI instruction to move the
condition to an output variable; it can just tell the compiler that
the N flag communicates the result that it's looking for.  Does m68k
have __GCC_ASM_FLAG_OUTPUTS__ or did nobody do that work yet?

Fourth, we could do this is with ANDI instead of EORI.  It's mildly
safer, but we really shouldn't have two threads clearing the lock bit
that race with each other.  We can't do it with BCLR because that
doesn't set the N flag.  If we do that, we'd need to invert the mask.

Appreciate your time looking at this.
