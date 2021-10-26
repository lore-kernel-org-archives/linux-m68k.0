Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 747D5C433F5
	for <linux-m68k@archiver.kernel.org>; Tue, 26 Oct 2021 19:50:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5689C60C4A
	for <linux-m68k@archiver.kernel.org>; Tue, 26 Oct 2021 19:50:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237182AbhJZTwy (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 26 Oct 2021 15:52:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233642AbhJZTwy (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 26 Oct 2021 15:52:54 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F503C061570;
        Tue, 26 Oct 2021 12:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=shc+/NvHg/NcqVmYgURHASgtGulIua8OVbhJZJMa/OY=; b=h2scTVFQCKTqaThnNi+sQi6FNf
        TYuSImBkJQK3rNZLy356ezVStEbL1f3qyQPUSE4tkSAPeMxKOyIKv4nFvePDmdmyEBut4m2vNTQTo
        EyHvTGyQaAFDe61wM8DoK+02q11vl3ypl3t6jJhFAwHb+YOdhal0Fh8bpRPRSD2QZjMyxDh1qNqli
        takQyvaijMoRQvZn/jVD6uy4uokCh4Oxo8yPhskgCJBbAnMZVBkST9zH03/QERLhu+Cy7/pOuQsFw
        hi+ZCTXpluw6yM9ekPYE68dI2gKYLwOlIGwzscTYfSy0TPkXaRRBt3cCG2lx2HQ+Nbp3Ymi3H5ywF
        ENeF1uXA==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mfSRP-00H7SC-Jc; Tue, 26 Oct 2021 19:49:21 +0000
Date:   Tue, 26 Oct 2021 20:48:59 +0100
From:   Matthew Wilcox <willy@infradead.org>
To:     Pasha Tatashin <pasha.tatashin@soleen.com>
Cc:     linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        linux-m68k@lists.linux-m68k.org, anshuman.khandual@arm.com,
        akpm@linux-foundation.org, william.kucharski@oracle.com,
        mike.kravetz@oracle.com, vbabka@suse.cz, geert@linux-m68k.org,
        schmitzmic@gmail.com, rostedt@goodmis.org, mingo@redhat.com,
        hannes@cmpxchg.org, guro@fb.com, songmuchun@bytedance.com,
        weixugc@google.com, gthelen@google.com
Subject: Re: [RFC 1/8] mm: add overflow and underflow checks for
 page->_refcount
Message-ID: <YXhbq/6OIpIAr7Tx@casper.infradead.org>
References: <20211026173822.502506-1-pasha.tatashin@soleen.com>
 <20211026173822.502506-2-pasha.tatashin@soleen.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211026173822.502506-2-pasha.tatashin@soleen.com>
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Tue, Oct 26, 2021 at 05:38:15PM +0000, Pasha Tatashin wrote:
>  static inline void page_ref_add(struct page *page, int nr)
>  {
> -	atomic_add(nr, &page->_refcount);
> +	int ret;
> +
> +	VM_BUG_ON(nr <= 0);
> +	ret = atomic_add_return(nr, &page->_refcount);
> +	VM_BUG_ON_PAGE(ret <= 0, page);

This isn't right.  _refcount is allowed to overflow into the negatives.
See page_ref_zero_or_close_to_overflow() and the conversations that led
to it being added.

