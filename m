Return-Path: <SRS0=Z8Xl=CB=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0D2CC433DF
	for <linux-m68k@archiver.kernel.org>; Sun, 23 Aug 2020 08:06:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9444820767
	for <linux-m68k@archiver.kernel.org>; Sun, 23 Aug 2020 08:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1598170017;
	bh=2G45Ofnpum3131crANl2feGpiRegagYrqhrFOHPjYa0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=I+lCydPkpweuXfYvdb18Lpmy3EdRRT+Dd/9mi9q2HSZAMuUUsk7JRsI8slDn/jAFY
	 BR8X4mLPsmoY1w856RHizSAw/16uoAAAA+qQQXoierKPNlwayw/CCjyT90FhXS6GUp
	 mrN3D/UzHk+Z00E1eaiWyfQUfVLbUvU8SbkadTGE=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725904AbgHWIG5 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 23 Aug 2020 04:06:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:39948 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725876AbgHWIG4 (ORCPT <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sun, 23 Aug 2020 04:06:56 -0400
Received: from kernel.org (unknown [87.70.91.42])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BAA6D2075B;
        Sun, 23 Aug 2020 08:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598170015;
        bh=2G45Ofnpum3131crANl2feGpiRegagYrqhrFOHPjYa0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=iccJfLmBbzDQf0PghDqaJRqeINAebj3KGAvVqqhn2bmbvwn/LDHq1VSkJzEbES7A9
         WeTHBkRck4Igvk+uV+H3z3+E3dgQIt1rFv7S9w8exk9YKI+LbYXvwWQNga4hwBr57P
         Alz+VrWBFZ+CHp2oMVsViwuyGY6VaMKptGZmkQs4=
Date:   Sun, 23 Aug 2020 11:06:49 +0300
From:   Mike Rapoport <rppt@kernel.org>
To:     Michael Schmitz <schmitzmic@gmail.com>
Cc:     linux-m68k@lists.linux-m68k.org,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        Andreas Schwab <schwab@linux-m68k.org>,
        Finn Thain <fthain@telegraphics.com.au>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Mike Rapoport <rppt@linux.ibm.com>
Subject: Re: [PATCH v3 0/3] m68k/mm: switch from DISCONTIGMEM to SPARSEMEM
Message-ID: <20200823080649.GH752365@kernel.org>
References: <20200718162651.26538-1-rppt@kernel.org>
 <20200820160334.GA752365@kernel.org>
 <5d16d058-a544-5f69-07e9-59da5ffafaf2@gmail.com>
 <20200821075636.GF752365@kernel.org>
 <9ea389e1-bd86-953b-8ae2-40278506e30a@gmail.com>
 <20200822095131.GG752365@kernel.org>
 <28567532-3406-5086-0f77-568af4bbabcf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <28567532-3406-5086-0f77-568af4bbabcf@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Sun, Aug 23, 2020 at 07:16:45AM +1200, Michael Schmitz wrote:
> Hi Mike,
> 
> Am 22.08.2020 um 21:51 schrieb Mike Rapoport:
> > Hi Michael,
> > 
> > On Sat, Aug 22, 2020 at 11:27:18AM +1200, Michael Schmitz wrote:
> > > Hi Mike,
> > > 
> > > only tested on ARAnyM, but appears to work (after adding sparsemem.h and
> > > changing memblocks_present() to non-static).
> > 
> > Cool, thanks!
> > memblocks_present() is now called from sparse_init() and can be simply
> > dropped.
> 
> Right you are - I missed that in the hurry.
> 
> > 
> > > 20 kB more total memory with sparsemem. Less memory used when booting
> > > to FastRAM, more used when booting to ST-RAM (checked right after boot
> > > on an idle system). The latter probably isn't significant.
> > 
> > When booting to FastRAM we still discard ST-RAM and only use it as
> > device memory for the framebuffer. So the total memory map size will be
> > smaller.
> 
> Makes sense, but I was still surprised that replacing discontigmem by
> sparsemem saves 20 kB regardless of whether or not ST-RAM is used.

The problem with sparse, however, is the memory wasted for empty memmap.
For example, if the section size is 16M and there is, say, 17M of
FastRAM, the memory map will be created for 32M. This means that there
will be 3840 unused 'struct page' objects. :(


> > How many FastRAM do you have in your configuration?
> 
> Only 256 MB. Can't use much more on my old Powerbook.
> 
> Cheers,
> 
> 	Michael
> 

-- 
Sincerely yours,
Mike.
