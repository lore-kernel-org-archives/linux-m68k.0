Return-Path: <SRS0=djhu=EE=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8C97C55179
	for <linux-m68k@archiver.kernel.org>; Thu, 29 Oct 2020 00:24:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 956F4206DC
	for <linux-m68k@archiver.kernel.org>; Thu, 29 Oct 2020 00:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603931045;
	bh=zK9DfVuZHDzMdXj+yhDB8KulDOu8wW0+2VHqzzJ4VCs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=PiqPi2WhMErkZ3hOBNjnVZON9ViJ05qY/V06NbKZJ4hNT9l6PxVtha9DQjYR2uq3k
	 2+RtL83iLsoGZtwTOCUAKsXa3daoJiPFgpdwY5BE6CB3U+uScg7eA+3RJaGsHLESlY
	 /jk7R5S/DMVngIU/7f4hOepQQqvB0vF7CJJMRjrg=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727146AbgJ2AYF (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 28 Oct 2020 20:24:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:49600 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388465AbgJ1WhY (ORCPT <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 28 Oct 2020 18:37:24 -0400
Received: from kernel.org (unknown [87.70.96.83])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1B5552473E;
        Wed, 28 Oct 2020 18:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603911472;
        bh=zK9DfVuZHDzMdXj+yhDB8KulDOu8wW0+2VHqzzJ4VCs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=0wRwxQSg4yE6tWskIfT82ofwXzSEJ/5NZugomFl0MhuujRXgT16OkYNSNiruGCQgb
         4FmuFCHOOX4U7+tixFCp9eSridGpAq2f1ngfZ2ujosWNGX6mwHBQzCWsAku7+1/9jF
         4Ekc11AXMUb29fsDTzF2sQtG1jcmaJnC2BBUIYCs=
Date:   Wed, 28 Oct 2020 20:57:41 +0200
From:   Mike Rapoport <rppt@kernel.org>
To:     Michael Schmitz <schmitzmic@gmail.com>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Alexey Dobriyan <adobriyan@gmail.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Greg Ungerer <gerg@linux-m68k.org>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Jonathan Corbet <corbet@lwn.net>,
        Matt Turner <mattst88@gmail.com>, Meelis Roos <mroos@linux.ee>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Russell King <linux@armlinux.org.uk>,
        Tony Luck <tony.luck@intel.com>,
        Vineet Gupta <vgupta@synopsys.com>,
        Will Deacon <will@kernel.org>,
        alpha <linux-alpha@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux FS Devel <linux-fsdevel@vger.kernel.org>,
        "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Linux MM <linux-mm@kvack.org>,
        arcml <linux-snps-arc@lists.infradead.org>
Subject: Re: [PATCH 11/13] m68k/mm: make node data and node setup depend on
 CONFIG_DISCONTIGMEM
Message-ID: <20201028185741.GI1428094@kernel.org>
References: <20201027112955.14157-1-rppt@kernel.org>
 <20201027112955.14157-12-rppt@kernel.org>
 <CAMuHMdU4r4CJ1kBu7gx1jkputjDn2S8Lqkj7RPfa3XUnM1QOFg@mail.gmail.com>
 <20201028111631.GF1428094@kernel.org>
 <fd55643a-a17b-5a23-4c77-9e832c1e5128@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fd55643a-a17b-5a23-4c77-9e832c1e5128@gmail.com>
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Thu, Oct 29, 2020 at 07:14:38AM +1300, Michael Schmitz wrote:
> Hi Mike,
> 
> On 29/10/20 12:16 AM, Mike Rapoport wrote:
> > Hi Geert,
> > 
> > On Wed, Oct 28, 2020 at 10:25:49AM +0100, Geert Uytterhoeven wrote:
> > > Hi Mike,
> > > 
> > > On Tue, Oct 27, 2020 at 12:31 PM Mike Rapoport <rppt@kernel.org> wrote:
> > > > From: Mike Rapoport <rppt@linux.ibm.com>
> > > > 
> > > > The pg_data_t node structures and their initialization currently depends on
> > > > !CONFIG_SINGLE_MEMORY_CHUNK. Since they are required only for DISCONTIGMEM
> > > > make this dependency explicit and replace usage of
> > > > CONFIG_SINGLE_MEMORY_CHUNK with CONFIG_DISCONTIGMEM where appropriate.
> > > > 
> > > > The CONFIG_SINGLE_MEMORY_CHUNK was implicitly disabled on the ColdFire MMU
> > > > variant, although it always presumed a single memory bank. As there is no
> > > > actual need for DISCONTIGMEM in this case, make sure that ColdFire MMU
> > > > systems set CONFIG_SINGLE_MEMORY_CHUNK to 'y'.
> > > > 
> > > > Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
> > > Thanks for your patch!
> > > 
> > > > ---
> > > >   arch/m68k/Kconfig.cpu           | 6 +++---
> > > >   arch/m68k/include/asm/page_mm.h | 2 +-
> > > >   arch/m68k/mm/init.c             | 4 ++--
> > > >   3 files changed, 6 insertions(+), 6 deletions(-)
> > > Is there any specific reason you didn't convert the checks for
> > > CONFIG_SINGLE_MEMORY_CHUNK in arch/m68k/kernel/setup_mm.c
> > In arch/m68k/kernel/setup_mm.c the CONFIG_SINGLE_MEMORY_CHUNK is needed
> > for the case when a system has two banks, the kernel is loaded into the
> > second bank and so the first bank cannot be used as normal memory. It
> > does not matter what memory model will be used in this case.
> 
> 
> That case used to be detected just fine at run time (by dint of the second
> memory chunk having an address below the first; the chunk the kernel resides
> in is always listed first), even without using CONFIG_SINGLE_MEMORY_CHUNK.
 
Right, CONFIG_SINGLE_MEMORY_CHUNK in arch/m68k/kernel/setup_mm.c is used
to force using a single bank of memory regardless of run time detection. 

> Unless you changed that behaviour (and I see nothing in your patch that
> would indicate that), this is still true.
> 
> Converting the check as Geert suggested, without also adding a test for
> out-of-order memory bank addresses, would implicitly treat DISCONTIGMEM as 
> SINGLE_MEMORY_CHUNK, regardless of bank ordering. I don't think that is what
> we really want?

It is in a way the case now when !SINGLE_MEMORY_CHUNK == DISCONTIGMEM.
So forcing SIGNLE_MEMORY_CHUNK at compile time would also mean forcing
FLATMEM.

After these changes I think SINGLE_MEMORY_CHUNK is not needed at all.

> Cheers,
> 
>     Michael
> 
> 
> > 
> > > and arch/m68k/include/asm/virtconvert.h?
> > I remember I had build errors and troubles with include file
> > dependencies if I changed it there, but I might be mistaken. I'll
> > recheck again.
> > 
> > > Gr{oetje,eeting}s,
> > > 
> > >                          Geert
> > > 
> > > -- 
> > > Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> > > 
> > > In personal conversations with technical people, I call myself a hacker. But
> > > when I'm talking to journalists I just say "programmer" or something like that.
> > >                                  -- Linus Torvalds

-- 
Sincerely yours,
Mike.
