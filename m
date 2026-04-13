Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80B7B3AEF2E
	for <linux-m68k@lists.linux-m68k.org>; Mon, 13 Apr 2026 09:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.234.252.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776071225; cv=none; b=kvVm4/GTDh39DW6S8BY0M9w9IuYuAi8+yuk4ajxj0p93MoXT2aXL2XvZhz5YdqQ+OY5XBBPngvGltDRhvYoDjajARvAvG+v8oeb9mR6kWCHcwLA6zSJ+QZpaMcEACVq6BYEwzQOCvflXAjrAF2ejPADARRXFoXTp9QiAO0tS7TU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776071225; c=relaxed/simple;
	bh=cS2/Y+fD/C6Fj1LtxcJRcP0gMiu198023wVz+PX5eN8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tc1Ku0XkAiJX9BqUv9k5/u3rEZ8zJEJkGwLpZYd9vQQUdbZUuyBIKvY6CvCijsoNOX2PkgvtUZopghkYK2+WMMbHzJ3WP9FFNhbMoH+S6bTKnzioUX/NLF8+QHDPybGagGIgnaEp6AHeFdwSjeyr5NhrMkjcIrOHMguGZ3VArz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G3inY+8J; arc=none smtp.client-ip=172.234.252.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G3inY+8J"
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 21BFF43A69;
	Mon, 13 Apr 2026 09:07:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95C51C116C6;
	Mon, 13 Apr 2026 09:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776071224;
	bh=cS2/Y+fD/C6Fj1LtxcJRcP0gMiu198023wVz+PX5eN8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G3inY+8JxkEibVwYUFszuCWlat+2WMkdb9cxQNukGQ5jOO4YosRVw/teIPjzkykJe
	 VBaoK4GWe1nSvdZccXGItvVBbCBawDxBQYXoSn8ku3lctCl78nWa1bXrv8Cz5ii5WC
	 gS594pXSn/PDkAlQW1x8pf1/M/IPGL/2AZ9s3tUP2y+EEht32F5HbttQfHidlVLFR9
	 SB3RrQSSOyCGHY83n0fRRZdud5Xcyx9d8MmEOZogxSk4gxdYZjmVHZxvo/hzD3ige5
	 KqFGmCdWJVKzfE5LlEz9DNkdZh7AXZJZD7MdmFDUG+6QJAH+W76oJ0Vl3ycqghmmEe
	 IWEm9rwhj2q9g==
Date: Mon, 13 Apr 2026 18:07:01 +0900
From: "Harry Yoo (Oracle)" <harry@kernel.org>
To: Thomas Gleixner <tglx@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>, linux-mm@kvack.org,
	Arnd Bergmann <arnd@arndb.de>, x86@kernel.org,
	Lu Baolu <baolu.lu@linux.intel.com>, iommu@lists.linux.dev,
	Michael Grzeschik <m.grzeschik@pengutronix.de>,
	netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
	Herbert Xu <herbert@gondor.apana.org.au>,
	linux-crypto@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>,
	Bernie Thompson <bernie@plugable.com>, linux-fbdev@vger.kernel.org,
	Theodore Tso <tytso@mit.edu>, linux-ext4@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Uladzislau Rezki <urezki@gmail.com>, Marco Elver <elver@google.com>,
	Dmitry Vyukov <dvyukov@google.com>, kasan-dev@googlegroups.com,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Thomas Sailer <t.sailer@alumni.ethz.ch>, linux-hams@vger.kernel.org,
	"Jason A. Donenfeld" <Jason@zx2c4.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	linux-alpha@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-m68k@lists.linux-m68k.org, Dinh Nguyen <dinguyen@kernel.org>,
	Jonas Bonn <jonas@southpole.se>, linux-openrisc@vger.kernel.org,
	Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	linuxppc-dev@lists.ozlabs.org, Paul Walmsley <pjw@kernel.org>,
	linux-riscv@lists.infradead.org, Heiko Carstens <hca@linux.ibm.com>,
	linux-s390@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
	sparclinux@vger.kernel.org, Hao Li <hao.li@linux.dev>,
	Christoph Lameter <cl@gentwo.org>,
	David Rientjes <rientjes@google.com>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shengming Hu <hu.shengming@zte.com.cn>
Subject: Re: [patch 14/38] slub: Use prandom instead of get_cycles()
Message-ID: <adyyNeVTkXQlnh_2@hyeyoo>
References: <20260410120044.031381086@kernel.org>
 <20260410120318.525653921@kernel.org>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260410120318.525653921@kernel.org>

[Resending after fixing broken email headers]

On Fri, Apr 10, 2026 at 02:19:37PM +0200, Thomas Gleixner wrote:
> The decision whether to scan remote nodes is based on a 'random' number
> retrieved via get_cycles(). get_cycles() is about to be removed.
> 
> There is already prandom state in the code, so use that instead.
> 
> Signed-off-by: Thomas Gleixner <tglx@kernel.org>
> Cc: Vlastimil Babka <vbabka@kernel.org>
> Cc: linux-mm@kvack.org
> ---

Acked-by: Harry Yoo (Oracle) <harry@kernel.org>

Is this for this merge window?

This may conflict with upcoming changes on freelist shuffling [1]
(not queued for slab/for-next yet though), but it should be easy to
resolve.

[Cc'ing Shengming and SLAB ALLOCATOR folks]
[1] https://lore.kernel.org/linux-mm/20260409204352095kKWVYKtZImN59ybO6iRNj@zte.com.cn

-- 
Cheers,
Harry / Hyeonggon

>  mm/slub.c |   37 +++++++++++++++++++++++--------------
>  1 file changed, 23 insertions(+), 14 deletions(-)
> 
> --- a/mm/slub.c
> +++ b/mm/slub.c
> @@ -3302,6 +3302,25 @@ static inline struct slab *alloc_slab_pa
>  	return slab;
>  }
>  
> +#if defined(CONFIG_SLAB_FREELIST_RANDOM) || defined(CONFIG_NUMA)
> +static DEFINE_PER_CPU(struct rnd_state, slab_rnd_state);
> +
> +static unsigned int slab_get_prandom_state(unsigned int limit)
> +{
> +	struct rnd_state *state;
> +	unsigned int res;
> +
> +	/*
> +	 * An interrupt or NMI handler might interrupt and change
> +	 * the state in the middle, but that's safe.
> +	 */
> +	state = &get_cpu_var(slab_rnd_state);
> +	res = prandom_u32_state(state) % limit;
> +	put_cpu_var(slab_rnd_state);
> +	return res;
> +}
> +#endif
> +
>  #ifdef CONFIG_SLAB_FREELIST_RANDOM
>  /* Pre-initialize the random sequence cache */
>  static int init_cache_random_seq(struct kmem_cache *s)
> @@ -3365,8 +3384,6 @@ static void *next_freelist_entry(struct
>  	return (char *)start + idx;
>  }
>  
> -static DEFINE_PER_CPU(struct rnd_state, slab_rnd_state);
> -
>  /* Shuffle the single linked freelist based on a random pre-computed sequence */
>  static bool shuffle_freelist(struct kmem_cache *s, struct slab *slab,
>  			     bool allow_spin)
> @@ -3383,15 +3400,7 @@ static bool shuffle_freelist(struct kmem
>  	if (allow_spin) {
>  		pos = get_random_u32_below(freelist_count);
>  	} else {
> -		struct rnd_state *state;
> -
> -		/*
> -		 * An interrupt or NMI handler might interrupt and change
> -		 * the state in the middle, but that's safe.
> -		 */
> -		state = &get_cpu_var(slab_rnd_state);
> -		pos = prandom_u32_state(state) % freelist_count;
> -		put_cpu_var(slab_rnd_state);
> +		pos = slab_get_prandom_state(freelist_count);
>  	}
>  
>  	page_limit = slab->objects * s->size;
> @@ -3882,7 +3891,7 @@ static void *get_from_any_partial(struct
>  	 * with available objects.
>  	 */
>  	if (!s->remote_node_defrag_ratio ||
> -			get_cycles() % 1024 > s->remote_node_defrag_ratio)
> +	    slab_get_prandom_state(1024) > s->remote_node_defrag_ratio)
>  		return NULL;
>  
>  	do {
> @@ -7102,7 +7111,7 @@ static unsigned int
>  
>  	/* see get_from_any_partial() for the defrag ratio description */
>  	if (!s->remote_node_defrag_ratio ||
> -			get_cycles() % 1024 > s->remote_node_defrag_ratio)
> +	    slab_get_prandom_state(1024) > s->remote_node_defrag_ratio)
>  		return 0;
>  
>  	do {
> @@ -8421,7 +8430,7 @@ void __init kmem_cache_init_late(void)
>  	flushwq = alloc_workqueue("slub_flushwq", WQ_MEM_RECLAIM | WQ_PERCPU,
>  				  0);
>  	WARN_ON(!flushwq);
> -#ifdef CONFIG_SLAB_FREELIST_RANDOM
> +#if defined(CONFIG_SLAB_FREELIST_RANDOM) || defined(CONFIG_NUMA)
>  	prandom_init_once(&slab_rnd_state);
>  #endif
>  }
> 
> 
