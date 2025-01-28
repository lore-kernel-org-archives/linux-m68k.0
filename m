Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B06AC18B476
	for <linux-m68k@lists.linux-m68k.org>; Tue, 28 Jan 2025 06:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738046608; cv=none; b=fjDegjvLJkYFLpa8bNS3DhZ2+YU1Bp2qu3dBniegKEM5Vgpku5ZyIqsWfgkaKKjMQXpsGhH3qtW1Wg38aV6ua4di8LW65ySKDQ5P0cO0h5m616xi/2Ulkzo7tGKIfMj1OavqUmQeMRXD11WdeRbPhwlUtglDM7To5rY31hn4Mw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738046608; c=relaxed/simple;
	bh=W8gxclYZAsbYpIvWLzkIZlRSj22EEFiHGWKFDhkmoog=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Iu6HP8PZ2sqZGnTNlmZYqbxpuyfGGg5xHY7cFFnM9JXmtxb1HUvIVGx7R+8pmZNTHiW8bIkhTR1jZ2/SbAZ6QSxzrGwDP+Ow5oHUJhmoL5g59uz82ZtR4K8uk9C4QcYYBekEsFp8NIsGupbJP6WyXDXplia+9j7gEvoziyfy3C4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=yoseli.org; spf=none smtp.mailfrom=yoseli.org; dkim=pass (2048-bit key) header.d=yoseli.org header.i=@yoseli.org header.b=F+9R1Mo+; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=yoseli.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=yoseli.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yoseli.org header.i=@yoseli.org header.b="F+9R1Mo+"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 56B25C0003;
	Tue, 28 Jan 2025 06:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yoseli.org; s=gm1;
	t=1738046604;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yygj+q/qiP40rYwR8cwiSaMV7puwIqzVWwCVTIFpSoc=;
	b=F+9R1Mo+jg/aQQr8ap+n3mXJJ+3SLgAodj8rz30VoUs/kHGs4N6tYS97tlr97FRE2JAHeT
	e6lx93aEmMSvaI4wfPrUPieiB6hVltomq6UCfAng1Ex29+mD7JdANHtv1B2WehhwD/3UoO
	tIDGILQYG9TYSvKM+AjbmemrxowXgEXrQbWWZxiX59IGajdcGQktzCz6/wB7C8WT/Tye/v
	qcuVZ7NuPkTOBNHfEACepPQFWcFUqslLzYvqbUH3JFYk7FcZldsfd0tx4vyZVrhETGmKNP
	omP9pTgTfh+hD3FVEhzlxrbXsGEcoxIO4ElpTeMAnF9WoaYMqnzVfINvanresg==
Message-ID: <8b453664-13b6-430c-a865-9675edcdf369@yoseli.org>
Date: Tue, 28 Jan 2025 07:43:23 +0100
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arch: m68k: Add DMA mapping operations for Coldfire
 M5441x
To: Christoph Hellwig <hch@infradead.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 Greg Ungerer <gerg@linux-m68k.org>, linux-m68k@lists.linux-m68k.org,
 linux-kernel@vger.kernel.org
References: <20250121-coldfire-global-pool-v1-0-382a7235c2aa@yoseli.org>
 <20250121-coldfire-global-pool-v1-2-382a7235c2aa@yoseli.org>
 <Z5h0vvL0B5ktd3sM@infradead.org>
 <ba7ea0f0-be38-49a7-b416-3dc62c7e7425@yoseli.org>
 <Z5h70TL6lSWzGA4f@infradead.org>
Content-Language: en-US
From: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
In-Reply-To: <Z5h70TL6lSWzGA4f@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: jeanmichel.hautbois@yoseli.org

On 28/01/2025 07:40, Christoph Hellwig wrote:
> On Tue, Jan 28, 2025 at 07:33:37AM +0100, Jean-Michel Hautbois wrote:
>>> Arch dma code should not implement DMA OPS, but use the generic
>>> dma-direct code with the right helpes for handling coherency.  This
>>> variant looks like it should be using the DMA_COHERENT_POOL allocator
>>> for dma coherent memory.
>>
>> Thanks for your answer.
>> I am not sure to understand it though :-) because I can see a few
>> dma_map_ops implementations in arch code.
> 
> The last one left for the direct mapping are arm32 and parisc, and
> they should go away eventually.
> 
>> I tried to let dma_direct do the
>> work, I can't remember exactly what happened but it was not great :-).
>> I can give it a second try.
> 
> It really should not be hard.  The dynamic mappings already work fine
> as m68k is using the generic code.  So the only thing you want is
> to dip into the glonal pool for coherent allocations. For that you
> need to select the DMA_GLOBAL_POOL config option and fill the pool
> with dma_init_global_coherent().
> 

Isn't it done in patch 1/2 ? Or did I miss something ?

JM
