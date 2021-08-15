Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B78BC4338F
	for <linux-m68k@archiver.kernel.org>; Sun, 15 Aug 2021 07:42:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5F3D560C40
	for <linux-m68k@archiver.kernel.org>; Sun, 15 Aug 2021 07:42:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235569AbhHOHnJ (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 15 Aug 2021 03:43:09 -0400
Received: from verein.lst.de ([213.95.11.211]:51288 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232774AbhHOHnI (ORCPT <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sun, 15 Aug 2021 03:43:08 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
        id 744F26736F; Sun, 15 Aug 2021 09:42:36 +0200 (CEST)
Date:   Sun, 15 Aug 2021 09:42:36 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Michael Schmitz <schmitzmic@gmail.com>
Cc:     Christoph Hellwig <hch@lst.de>,
        Andreas Schwab <schwab@linux-m68k.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        linux-m68k@lists.linux-m68k.org,
        Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: RFC: remove set_fs for m68k
Message-ID: <20210815074236.GA23777@lst.de>
References: <eb057cdd-e9f2-27ce-cf60-7b0d87cb6bce@gmail.com> <3acb1a9e-9133-50d4-a642-98d7046d6d4f@gmail.com> <65a95ae0-4734-68ce-ef71-7491b5534718@gmail.com> <8f470389-fe8a-90b0-19a5-68f85526b30e@gmail.com> <20210721170529.GA14550@lst.de> <a70d80f4-6034-e20b-26c5-76609c52c92a@gmail.com> <20210723051126.GA31274@lst.de> <e9fb28d4-405a-5cc6-b071-707a2edbce92@gmail.com> <8884e940-22e8-72a5-e9ec-f9b2628b6ef4@gmail.com> <251aa093-047a-b37c-4e88-d543c6fa8bc6@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <251aa093-047a-b37c-4e88-d543c6fa8bc6@gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Michael,

after your last mail I went back and looked very closely at the
set_fs removal and your debug patches below.  And one hunk stands out:

>  static inline void flush_tlb_page(struct vm_area_struct *vma, unsigned long addr)
>  {
> -	if (vma->vm_mm == current->active_mm)
> +	if (vma->vm_mm == current->active_mm) {
> +		unsigned long old_fc = force_user_fc_begin();
>  		__flush_tlb_one(addr);
> +		force_user_fc_end(old_fc);
> +	}

This is the only old user of force_uaccess_begin, and the only one
where this patch adds back a DFC/SFC access where there was none at
at all with the set_fs removal.  So I'd be curious if you just add this
hunk (plus the supporting infrastructure) on top of my tree for now to
see if there were some side effects of the instructions that were
important, be that seralization, timing or anything else.
