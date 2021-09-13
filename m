Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69C20C433EF
	for <linux-m68k@archiver.kernel.org>; Mon, 13 Sep 2021 05:42:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5070B60E8B
	for <linux-m68k@archiver.kernel.org>; Mon, 13 Sep 2021 05:42:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234727AbhIMFn5 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 13 Sep 2021 01:43:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:41952 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237027AbhIMFn4 (ORCPT <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 13 Sep 2021 01:43:56 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 26BDB60E90;
        Mon, 13 Sep 2021 05:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631511761;
        bh=n9yl017BhkPjD02zjh8LONCNgWylQUQSVnpao3fVoKU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=G5tW6yd1CwoOz7tQ8EtBuqVE37nTvJK1SaYDJoHDDNb/dudTqvLMqI0dDAzSY2txA
         PxQSCZ3bCaEvUcwPKuKg8d+Uealx8M3kEqk6TNt5nCAoHiPbGkT1sPjRG+zkd7eyqK
         jOK4DUJVHglhX2i2pXclGHLgAWOyEHcttc2MWoSY+YkHffRgUZLzf6zQXdRAmGkcVf
         DSXm8L9YGZOIXPxwtT9OONfyQ/UO8G5ZZDOOytPo5ApofkJtW48GYJgPZBlnoKwG/p
         0+OBg+aEDi80RP/da0jLJ1Pay29xESc1++JmKEG61D/Z1N3aGAzQbKoS4N2gtgnjT+
         aj0SY27uQZrKA==
Date:   Mon, 13 Sep 2021 08:42:35 +0300
From:   Mike Rapoport <rppt@kernel.org>
To:     Michael Schmitz <schmitzmic@gmail.com>
Cc:     Finn Thain <fthain@linux-m68k.org>, linux-m68k@lists.linux-m68k.org
Subject: Re: [RFC] m68k: Enable memtest kernel parameter
Message-ID: <YT7ky3zuUk5msHDs@kernel.org>
References: <9fac90da-18d5-7b89-96a5-3cf9dbc8bcf8@linux-m68k.org>
 <b1b630b8-d6b6-661b-b5c1-2a2831b5b8c2@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b1b630b8-d6b6-661b-b5c1-2a2831b5b8c2@gmail.com>
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Michael,

On Mon, Sep 13, 2021 at 03:40:12PM +1200, Michael Schmitz wrote:
> Hi Finn,
> 
> On 13/09/21 13:34, Finn Thain wrote:
> > 
> > This appears to work on Aranym, QEMU and the Quadra 630 I have here.
> > It is completely untested on Coldfire etc. I don't even know whether the
> > right memory mappings are in place for this to actually work as intended.
> 
> The comment just above the section from paging_init() in your patch states
> that all physical memory is mapped into kernel virtual address space. I
> don't think that mapping is contiguous though.

early_memtest() operates on physical ranges, so it does not matter what is
the virtual mapping.
 
> > Would someone take a look please?
> > 
> > diff --git a/arch/m68k/Kconfig b/arch/m68k/Kconfig
> > index 6e40f7f29ebc..d87e12b4855b 100644
> > --- a/arch/m68k/Kconfig
> > +++ b/arch/m68k/Kconfig
> > @@ -9,6 +9,7 @@ config M68K
> >  	select ARCH_HAVE_NMI_SAFE_CMPXCHG if RMW_INSNS
> >  	select ARCH_MIGHT_HAVE_PC_PARPORT if ISA
> >  	select ARCH_NO_PREEMPT if !COLDFIRE
> > +	select ARCH_USE_MEMTEST
> >  	select ARCH_WANT_IPC_PARSE_VERSION
> >  	select BINFMT_FLAT_ARGVP_ENVP_ON_STACK
> >  	select DMA_DIRECT_REMAP if HAS_DMA && MMU && !COLDFIRE
> > diff --git a/arch/m68k/mm/motorola.c b/arch/m68k/mm/motorola.c
> > index 3a653f0a4188..d6301a094fc1 100644
> > --- a/arch/m68k/mm/motorola.c
> > +++ b/arch/m68k/mm/motorola.c
> > @@ -455,6 +455,8 @@ void __init paging_init(void)
> > 
> >  	flush_tlb_all();
> > 
> > +	early_memtest(min_addr, max_addr);
> > +
> >  	/*
> >  	 * initialize the bad page table and bad page to point
> >  	 * to a couple of allocated pages
> > 
> 
> I'd rather start that from availmem, not from min_addr ... I'm amazed this
> works - I'd expect the kernel text segment to get trashed by the memory test
> routines.

early_memtest() checks only free memory ranges, i.e. those that were not
memblock_reserve()d, so as long as we reserve the range [min_addr,
availmem] the memtest will skip it.

-- 
Sincerely yours,
Mike.
