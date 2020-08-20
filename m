Return-Path: <SRS0=riIg=B6=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1269BC433DF
	for <linux-m68k@archiver.kernel.org>; Thu, 20 Aug 2020 16:03:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E0B6E206B5
	for <linux-m68k@archiver.kernel.org>; Thu, 20 Aug 2020 16:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1597939432;
	bh=xLgoRbQVgKMocCdLUxGMTvI4ObihLR90ycX4a0RkEBo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=GiQCtS4Eqr8OeiByQwtyHfwBUirazCb8VDsCYdVA76PqkOarQ+TyRyx1G4Ebn1Z25
	 nifQgUif90Gn9FFqn8fGziV89Xn/XLf3Xzh54M7q6WDJLFN6sTxXSvtbxogRZgg25M
	 og/1YKwdmCo6wRu1fLZNTli0g/1kwIvo+Xi9oxww=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729583AbgHTQDw (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 20 Aug 2020 12:03:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:51156 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728047AbgHTQDl (ORCPT <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 20 Aug 2020 12:03:41 -0400
Received: from kernel.org (unknown [87.70.91.42])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 68FC4206B5;
        Thu, 20 Aug 2020 16:03:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597939420;
        bh=xLgoRbQVgKMocCdLUxGMTvI4ObihLR90ycX4a0RkEBo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gRrHgxusOf3xA6if5uO/Xml+oc/gx7mPvwX89VRMSDzJjK/Anr38SPu7hFfZargqd
         Vat1Gx6TI+Qmm7p1fxVoZ1DLnkFyzt21uJtvudlcgvChsJZHKZZms5lpNt/J6BMPTT
         AXc6hd1YyPrSZA9W7FBD89QIGFYi1YNX7Ktk9/ew=
Date:   Thu, 20 Aug 2020 19:03:34 +0300
From:   Mike Rapoport <rppt@kernel.org>
To:     linux-m68k@lists.linux-m68k.org
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        Andreas Schwab <schwab@linux-m68k.org>,
        Finn Thain <fthain@telegraphics.com.au>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Michael Schmitz <schmitzmic@gmail.com>,
        Mike Rapoport <rppt@linux.ibm.com>
Subject: Re: [PATCH v3 0/3] m68k/mm: switch from DISCONTIGMEM to SPARSEMEM
Message-ID: <20200820160334.GA752365@kernel.org>
References: <20200718162651.26538-1-rppt@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200718162651.26538-1-rppt@kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Gentle ping :)

On Sat, Jul 18, 2020 at 07:26:48PM +0300, Mike Rapoport wrote:
> From: Mike Rapoport <rppt@linux.ibm.com>
> 
> Hi,
> 
> It took me a while to get back to this, but better late than never :)
> 
> These patches replace DISCONTIGMEM with SPARSEMEM on m68k for systems with
> !SINGLE_MEMORY_CHUNK set.
> 
> With SPARSEMEM there is a single node for the entire physical memory and to
> cope with holes in the physical address space it is divided to sections of
> several megabytes.
> 
> Each section has it's own memory map which size depends on actual populated
> memory.
> 
> The section size of 16M was chosen pretty much arbitrarily as I couldn't
> find specs for systems with e.g. Zorro memory extensions. 
> Yet, we cannot use smaller sections and still be able to address the entire
> 4G of the physical memory because the section number is encoded in the page
> flags and there are only 8 bits available.
> 
> For systems with several small memory chunks and with small (several megs)
> holes between them, 16M section size would cause wasted parts in the memory
> map and it is desirable to allow smaller section size at the expense of
> limiting the addressable memory.
> 
> I've hesitated between adding Kconfig option as Finn suggested [1] and
> other options like SPARSE_VMEMMAP or ARCH_HAS_HOLES_MEMORYMODEL. In the
> end, I think Kconfig is the simplest one from the implementation point of
> view and would work fine for people that run mainline kernels on vintage
> hardware.
> 
> For the systems with ST-RAM and FastRAM, the switch to SPARSEMEM does not
> change the limitation that if the kernel is loaded into the FastRam the
> ST-RAM remains unmapped. It only ensures that if the kernel is loaded in
> ST-RAM, the memory map is allocated from high physical addresses and then
> atari/stram.c is able to reserve the frame buffer memory. If the kernel is
> loaded to FastRAM, the ST-RAM remains unmapped as with DISCONTIGMEM and the
> atari/stram.c maps it as IOMEM.
> 
> [1] https://marc.info/?l=linux-m68k&m=156309170500921&w=2
> 
> v3 changes:
> * rebase on the current upstream
> * alias ARCH_PFN_BASE to m68k_memory[0].addr
> * add configuration option to allow two variants of section size.
> 
> v2 changes:
> * rebase on the current upstream
> * make ColdFire MMU select SINGLE_MEMORY_CHUNK in Kconfig.cpu
> 
> Mike Rapoport (3):
>   m68k/mm: make node data and node setup depend on CONFIG_DISCONTIGMEM
>   m68k/mm: enable use of generic memory_model.h for !DISCONTIGMEM
>   m68k/mm: switch from DISCONTIGMEM to SPARSEMEM
> 
>  arch/m68k/Kconfig.cpu               | 14 ++++++--
>  arch/m68k/include/asm/page.h        |  2 ++
>  arch/m68k/include/asm/page_mm.h     |  6 +++-
>  arch/m68k/include/asm/sparsemem.h   |  8 +++++
>  arch/m68k/include/asm/virtconvert.h |  2 +-
>  arch/m68k/mm/init.c                 |  8 ++---
>  arch/m68k/mm/motorola.c             | 64 ++++++++++++++++++++++++++++++-------
>  7 files changed, 84 insertions(+), 20 deletions(-)
>  create mode 100644 arch/m68k/include/asm/sparsemem.h
> 
> -- 
> 2.7.4
> 
> 
> *** BLURB HERE ***
> 
> Mike Rapoport (3):
>   m68k/mm: make node data and node setup depend on CONFIG_DISCONTIGMEM
>   m68k/mm: enable use of generic memory_model.h for !DISCONTIGMEM
>   m68k/mm: switch from DISCONTIGMEM to SPARSEMEM
> 
>  arch/m68k/Kconfig.cpu               | 23 ++++++++++++++---
>  arch/m68k/include/asm/page.h        |  2 ++
>  arch/m68k/include/asm/page_mm.h     |  7 +++++-
>  arch/m68k/include/asm/virtconvert.h |  2 +-
>  arch/m68k/mm/init.c                 |  8 +++---
>  arch/m68k/mm/motorola.c             | 39 ++++++++++++++++++++++++++---
>  6 files changed, 69 insertions(+), 12 deletions(-)
> 
> -- 
> 2.26.2
> 

-- 
Sincerely yours,
Mike.
