Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D06D12E92DA
	for <linux-m68k@lists.linux-m68k.org>; Tue, 15 Jul 2025 13:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.105.4.254
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752587669; cv=none; b=MQvlj1hwCZyGFVVdkk8sHfYFi4xRALz5352qqpWvJrRJ5dqFEpV5BGImu5/Wrkuud9WM5LAVNW2URc//H9lIozKCRlWg9Z8XuUmvPzIABBzayc5/IQkBl72cS/A1XZVbSd9vf+QTO8ZlPldWP6vqK9wYgNtcqvaHY/MVrGW0rE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752587669; c=relaxed/simple;
	bh=BbW46wPXuETQUGt3Z1/ORJj85+W6uydh64nbL3ZPUD0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dqf5j9ui8aOPysJJXa0cwrIZ6TuEo5pFH/w18zyv8T1PoxfvN5VVWWLWClk8HFWGcZbNaVqVtKyeLs5/RTjJvZBiZtDPpg234MxfMJK4YR7s6n1BSIvMuFC5nUeZ062boXnkqrxu7UoiM0NUquCf9Y3z2+f92IVrTYVVSMrPhrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=kernel.org; arc=none smtp.client-ip=172.105.4.254
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8E09D61360;
	Tue, 15 Jul 2025 13:54:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A7CEC4CEE3;
	Tue, 15 Jul 2025 13:54:24 +0000 (UTC)
Message-ID: <f2582a94-1bbc-41a0-9a21-17e77f3979a3@linux-m68k.org>
Date: Tue, 15 Jul 2025 23:54:21 +1000
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: nommu and folios
To: Matthew Wilcox <willy@infradead.org>
Cc: linux-m68k@lists.linux-m68k.org, linux-mm@kvack.org
References: <aHVY3PIBI0M7Whi7@casper.infradead.org>
Content-Language: en-US
From: Greg Ungerer <gerg@linux-m68k.org>
In-Reply-To: <aHVY3PIBI0M7Whi7@casper.infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Matthew,

On 15/7/25 05:22, Matthew Wilcox wrote:
> Hi Greg!
> 
> The last user of add_to_page_cache_lru() is fs/ramfs/file-nommu.c I
> think I need your advice about how best to proceed with nommu and folios.
> 
> The basic idea behind folios is that they represent a physically,
> logically and virtually contiguous block of memory that is a power-of-2
> bytes in size >= PAGE_SIZE.  struct page is going to be shrunk and it'll
> be most efficient if we can arrange for allocations to be larger in size.
> 
> UCLinux obviously has very different performance requirements from the
> kinds of systems I usually work on -- memory usage minimisation is much
> more important.  So ideally we wouldn't split the allocation all the way
> to order-0 in ramfs_nommu_expand_for_mapping(), but do a split at just
> the break point.  eg if we have a 40kB file, we'd allocate an order-4
> folio, split it into an order-3 folio and add that to the page cache;
> split the order-2 page from the end and free it; split the remainder
> into one order-1 folio, add it to the page cache and free the remaining
> order-1 page.
> 
> The problem here is that all the code for handling large folios is
> currently gated by CONFIG_TRANSPARENT_HUGEPAGE, which I'm guessing is
> not enabled by any uclinux configs ;-)

Yeah, pretty sure that is right :-)
Interestingly there is one architecture that is by default 64bit, RISCV.
It has good support for running nommu. Though I don't think in practice
that you would see nommu systems using it with largish memory sizes.
Even then I doubt they would be using TRANSPARENT HUPGEPAGES either.


> Something I've been wanting to do for a while is split out the code
> for handling PMD-sized folios from the code for splitting large folios
> into smaller folios.  That's necessarily going to increase the size of
> the text section for uclinux, but hopefully it'll be worthwhile because
> it'll decrease how much memory is allocated at runtime.

That sounds like a win overall. Anyone using modern kernels on nommu
has to accept the ever increasing kernel text section anyway.


> Of course if uclinux files are typically PAGE_SIZE or smaller, this isn't
> going to help at all.

Average file size is probably larger than PAGE_SIZE. All the standard
application binaries will be much larger.


>  Which brings me to the really sticky question
> ... how much do you care about uclinux support in a 2025 and later kernel?
> I have no idea how actively microcontroller people use Linux or update
> to recent kernels.  I'm not trying to push uclinux out, just don't want
> to do work that nobody will ever use ;-)

That is really hard to answer. My gut feeling is that it may not be used
that much any more. But then I keep getting surprised when people show up
with new silicon that has no MMU (RISCV being a case in point). From what
I can tell it is still popular with the ARM/Cortex-M variants as well.
Not really sure about the Xtensa community, they may be active too.

Regards
Greg


