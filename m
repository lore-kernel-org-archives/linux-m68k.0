Return-Path: <SRS0=bIMu=CD=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21529C433DF
	for <linux-m68k@archiver.kernel.org>; Tue, 25 Aug 2020 05:42:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E9F0220737
	for <linux-m68k@archiver.kernel.org>; Tue, 25 Aug 2020 05:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1598334164;
	bh=XnpwAbCTlDQWT2VaP/ywnHugL5tiy6RUZn378mENQ18=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=L4qwmKN5Aj56LeJ8LsqLskqE4zlNl6ejYlQzQoP0JqO3qnvcGTdFOpKckuns76wIX
	 qicNvEgyi53tbscyQwvvweEFw+7DlCnnHxeNketcodS8oMc0H+g/xFsp3Cwb19wVzr
	 UVDwQT+0opFvyioG60bvmP+KOCUPMMwGuhGchgLo=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728683AbgHYFmn (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 25 Aug 2020 01:42:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:41826 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728145AbgHYFmn (ORCPT <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 25 Aug 2020 01:42:43 -0400
Received: from kernel.org (unknown [87.70.91.42])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8EE16204FD;
        Tue, 25 Aug 2020 05:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598334162;
        bh=XnpwAbCTlDQWT2VaP/ywnHugL5tiy6RUZn378mENQ18=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=haVwFY9fuxOP47APJhopuqXcJbYLeBPIxt8xVrErkwedWzlmbBIUso1EAUm54r+ro
         boqp22Rkvh3M95CpZRsjFxTfSosVVOeUxvCvkkzaRsukxrvWSJb+D+gl0AvlhXa/+r
         CR7AQ62BSt1iQaejEhE/kK4Lf124yFwfT4uHWPmc=
Date:   Tue, 25 Aug 2020 08:42:36 +0300
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
Message-ID: <20200825054236.GA7303@kernel.org>
References: <20200718162651.26538-1-rppt@kernel.org>
 <20200820160334.GA752365@kernel.org>
 <5d16d058-a544-5f69-07e9-59da5ffafaf2@gmail.com>
 <20200821075636.GF752365@kernel.org>
 <9ea389e1-bd86-953b-8ae2-40278506e30a@gmail.com>
 <20200822095131.GG752365@kernel.org>
 <28567532-3406-5086-0f77-568af4bbabcf@gmail.com>
 <20200823080649.GH752365@kernel.org>
 <33f4e879-95ea-8302-f0ed-595beb8b98eb@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <33f4e879-95ea-8302-f0ed-595beb8b98eb@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Tue, Aug 25, 2020 at 08:47:41AM +1200, Michael Schmitz wrote:
> Hi Mike,
> 
> On 23/08/20 8:06 PM, Mike Rapoport wrote:
> > > > > 20 kB more total memory with sparsemem. Less memory used when booting
> > > > > to FastRAM, more used when booting to ST-RAM (checked right after boot
> > > > > on an idle system). The latter probably isn't significant.
> > > > When booting to FastRAM we still discard ST-RAM and only use it as
> > > > device memory for the framebuffer. So the total memory map size will be
> > > > smaller.
> > > Makes sense, but I was still surprised that replacing discontigmem by
> > > sparsemem saves 20 kB regardless of whether or not ST-RAM is used.
> > The problem with sparse, however, is the memory wasted for empty memmap.
> > For example, if the section size is 16M and there is, say, 17M of
> > FastRAM, the memory map will be created for 32M. This means that there
> > will be 3840 unused 'struct page' objects. :(
> 
> No such thing as a free lunch - that would be a case for the 1G VM limit
> (which I admit, I did not test!)?

For 1G physical memory limit the section size is 4M, so for a system
with 1M of RAM there will be 768 unused 'struct page' objects.
There is an option to free unused memmap, like ARM does [1], or even make
sparsemem to avoid allocating it from the beginning.
This should work, at least for the -mm case, because m68k has
pfn_valid() that does not depend on the memory model.

> In my case, ST-RAM is 14 MB, so only half of the last 4 MB wasted. Note that
> the top of the 16 MB physical area is mapped by early kernel startup as
> noncacheable (hardware registers). I hope this mapping is left alone by
> sparsemem.

Sparsmem will allocate an empty struct page for it, but it should not be
used and even initialized. And I didn't change the page table creation
code, at least not intentionally :)

> Now what would be required to allow use of the ST-RAM chunk (or any other
> memory area mapped out of order) by the kernel memory allocators?

Oh, that's a different story. This will require changes to the way we
create the virtual mapping of the physical memory and to __pa()/__va()
functions.

[1] https://elixir.bootlin.com/linux/latest/source/arch/arm/mm/init.c#L305


-- 
Sincerely yours,
Mike.
