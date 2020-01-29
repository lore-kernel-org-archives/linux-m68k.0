Return-Path: <SRS0=o3Zs=3S=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C78FC2D0DB
	for <linux-m68k@archiver.kernel.org>; Wed, 29 Jan 2020 13:15:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E94A020716
	for <linux-m68k@archiver.kernel.org>; Wed, 29 Jan 2020 13:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1580303726;
	bh=oUDmtxiN41VdcoNQ6eSO7UKsE16s05WPMjsBCDCEb+A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=OkaWb8ipfZXIPIPMAGOL9rOFfHqTYb+ljSl2oyJw6IbqJDhAo7bpOigz9yJVvOnW1
	 EmDT7kxH9TLquNEA/MGL1lY2/ClTGcSUOAmpZCAj+KR2Q8HFRwLEnsIFra3SqLj9LA
	 GEkepnQVYPLLqCRnH29yNCNfIFvY0HlQlTMGWJDI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726184AbgA2NPZ (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 29 Jan 2020 08:15:25 -0500
Received: from mail.kernel.org ([198.145.29.99]:60268 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726145AbgA2NPZ (ORCPT <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 29 Jan 2020 08:15:25 -0500
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 11B5520678;
        Wed, 29 Jan 2020 13:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1580303724;
        bh=oUDmtxiN41VdcoNQ6eSO7UKsE16s05WPMjsBCDCEb+A=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GZnnsUEW0A0w6MrbLPgKEx4obNfVoCWr0lIzKLoOtOtFb0MHecDoEgMGYrDV+A9z8
         l+d0Y91PCdTzDQ185BFTCZaIT1DheYHBiGfgyOEOH3AWZoRMqBwYc52t9TJRvXoIEM
         ZOqcs3zU1ZNbOB7TsbMIXjv9xG2WtwRGgcIwNfrk=
Date:   Wed, 29 Jan 2020 13:15:20 +0000
From:   Will Deacon <will@kernel.org>
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/5] m68k,mm: Extend table allocator for multiple sizes
Message-ID: <20200129131520.GA31774@willie-the-truck>
References: <20200129103941.304769381@infradead.org>
 <20200129104345.491163937@infradead.org>
 <20200129121752.GB31582@willie-the-truck>
 <20200129124352.GP14879@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200129124352.GP14879@hirez.programming.kicks-ass.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Wed, Jan 29, 2020 at 01:43:52PM +0100, Peter Zijlstra wrote:
> On Wed, Jan 29, 2020 at 12:17:53PM +0000, Will Deacon wrote:
> > On Wed, Jan 29, 2020 at 11:39:45AM +0100, Peter Zijlstra wrote:
> 
> > > +extern void *get_pointer_table(int type);
> > 
> > Could be prettier/obfuscated with an enum type?
> 
> Definitely, but then we get to bike-shed on names :-)

At least we don't need an emulator for *that*!

> enum m68k_table_type {
> 	TABLE_BIG = 0,
> 	TABLE_SMALL,
> };
> 
> Is not exactly _that_ much better, and while TABLE_PTE works,
> TABLE_PGD_PMD is a bit crap.

Some alternatives:

TABLE_PXD / TABLE_PTE
TABLE_BRANCH / TABLE_LEAF
TABLE_DIR / TABLE_PTE
TABLE_TI_AB / TABLE_TI_C

Will
