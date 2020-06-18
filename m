Return-Path: <SRS0=LIUq=77=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5ED15C433E0
	for <linux-m68k@archiver.kernel.org>; Thu, 18 Jun 2020 12:10:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3760E207DD
	for <linux-m68k@archiver.kernel.org>; Thu, 18 Jun 2020 12:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1592482203;
	bh=ApqRHaeTjmuj3BeuRjcLVRNqY9+HELKWiizUwhfMcDo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=LmDMCPVoNoWQHxtMXe6+YWIF874tB25ZgkikQGKQb2m8fEabrK/+iW4YECY94kOPr
	 QiStUNFfSEuxb/R2JyFnos4M5ehM4PjaVTo8FGoF1iBEvXPpxT3syVv4gxdGw0sqzA
	 FUs9Uk6gNG665wihnqTYq2aEgMTyQ0EGpOTsUxD0=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728338AbgFRMKD (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 18 Jun 2020 08:10:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:35004 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728017AbgFRMKC (ORCPT <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 18 Jun 2020 08:10:02 -0400
Received: from kernel.org (unknown [87.70.103.18])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 03255207D8;
        Thu, 18 Jun 2020 12:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592482202;
        bh=ApqRHaeTjmuj3BeuRjcLVRNqY9+HELKWiizUwhfMcDo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=rROhq80/VjbtrW3EYbKKiN6PGjWeGAwfi71ZaclGx6wvLJTGCAhxR6A3UoLVJ9eFs
         IwRix1dRmF/Pq5YigdB8rWYDepG5DN5KHJlYB3t/LldeeawbQCFedj6FjO0lfH1BFa
         Ts4YXKXkPMKoaB98Cl7m7JuLku4SufRViaelOjIU=
Date:   Thu, 18 Jun 2020 15:09:56 +0300
From:   Mike Rapoport <rppt@kernel.org>
To:     Greg Ungerer <gerg@linux-m68k.org>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k@lists.linux-m68k.org, Mike Rapoport <rppt@linux.ibm.com>
Subject: Re: [PATCH] m68k: mcfmmu: remove stale part of comment about
 steal_context
Message-ID: <20200618120956.GE6571@kernel.org>
References: <20200618081727.4741-1-rppt@kernel.org>
 <bb70270a-5634-f258-f144-9410e8baf068@linux-m68k.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bb70270a-5634-f258-f144-9410e8baf068@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Greg,

On Thu, Jun 18, 2020 at 09:48:42PM +1000, Greg Ungerer wrote:
> Hi Mike,
> 
> On 18/6/20 6:17 pm, Mike Rapoport wrote:
> > From: Mike Rapoport <rppt@linux.ibm.com>
> > 
> > The comment about steal_context() came from powerpc and a part of it
> > addresses differences between powerpc variants that are not really
> > relevant to m68k.
> > 
> > Remove that part of the comment.
> > 
> > Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
> 
> Acked-by: Greg Ungerer <gerg@linux-m68k.org>
> 
> Do you want me to carry that in my m68k (m68knommu) tree for v5.9?

Yes, please :)

> Regards
> Greg
> 
> 
> > ---
> > Hi,
> > 
> > I've found this by pure chance while grepping for pgalloc.h
> > It's been there since 2011, but I don't think it's a stable material, so I
> > didn't cc them.
> > 
> >   arch/m68k/mm/mcfmmu.c | 5 -----
> >   1 file changed, 5 deletions(-)
> > 
> > diff --git a/arch/m68k/mm/mcfmmu.c b/arch/m68k/mm/mcfmmu.c
> > index 29f47923aa46..cb9f8675d81b 100644
> > --- a/arch/m68k/mm/mcfmmu.c
> > +++ b/arch/m68k/mm/mcfmmu.c
> > @@ -214,11 +214,6 @@ void __init cf_mmu_context_init(void)
> >   /*
> >    * Steal a context from a task that has one at the moment.
> > - * This is only used on 8xx and 4xx and we presently assume that
> > - * they don't do SMP.  If they do then thicfpgalloc.hs will have to check
> > - * whether the MM we steal is in use.
> > - * We also assume that this is only used on systems that don't
> > - * use an MMU hash table - this is true for 8xx and 4xx.
> >    * This isn't an LRU system, it just frees up each context in
> >    * turn (sort-of pseudo-random replacement :).  This would be the
> >    * place to implement an LRU scheme if anyone was motivated to do it.
> > 

-- 
Sincerely yours,
Mike.
