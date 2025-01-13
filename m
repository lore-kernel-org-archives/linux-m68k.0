Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 049B322DFBA
	for <linux-m68k@lists.linux-m68k.org>; Mon, 13 Jan 2025 16:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=139.178.84.217
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736785574; cv=none; b=bJDGL6ov6nLYDkjE5y2Ois1Nl42ZTceqXYkalsuI4IndUQRwnWZtMshSbsXsU6BHyMGFYEnyjj4NylxZCzXpMU2xPdEeOPVjnctsquNzxbbf900VtpULJZjgvpD2cmy0VMDam8ink5vdcwjf9BV7fxMOPc2a5M2Ns1KpuCTr6sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736785574; c=relaxed/simple;
	bh=aIErGEJQ93Edr09sqGtwbrisP+GLeiu0+v58Z3b4+wg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CgjImXQ7nQHX3SoQxyxnAqa2m1ovFHkoc/TqGJFWIGgL7IicFuX4+A36fFOCigCPq3HQh7ihKGjKlj/be+m75Q3qXUe9pLi0MHZLJ5xiqAP+p+a2F7fZIZ9P2Ql66qRjmI9sQQYpBrvkQbgpXps0mYnxtw0PpWoWZDAeLdoF6/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f9OxD2cj; arc=none smtp.client-ip=139.178.84.217
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f9OxD2cj"
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 198035C51B3;
	Mon, 13 Jan 2025 16:25:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB06FC4CEE3;
	Mon, 13 Jan 2025 16:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736785571;
	bh=aIErGEJQ93Edr09sqGtwbrisP+GLeiu0+v58Z3b4+wg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f9OxD2cjCU02a1TFHaQkRJkHTJaf800j2ThaRkmaDO8PnvHYcKvQAfMic1HE/Vgu4
	 bhoThTemMYdDsEruG0k1HE1twIt5p+okmQ1Fme2xsmkJ1BQLD8H+Zp7QUSFbDk27Gn
	 B5ufSBakDorBmKAc7MajbPl5qEyM8Cvsp7UlPF7Qlqy8u3xJW5fG1y1vkiwGoluiPG
	 TaVdI6SpQBvsCUt754VDxKLXg9xhYJFxRfy3Q35WM4nn1s+LKSVLKt3udttwPvQ+n7
	 7RdzermO/y9ghDR77Ho+plqpTXITbyFwEjDbIrmeX2kZUFwI7wLBL/ndLmvBoivzIj
	 msVg4+kWAVaUA==
Date: Mon, 13 Jan 2025 16:26:01 +0000
From: Will Deacon <will@kernel.org>
To: Qi Zheng <zhengqi.arch@bytedance.com>
Cc: peterz@infradead.org, agordeev@linux.ibm.com, kevin.brodsky@arm.com,
	alex@ghiti.fr, andreas@gaisler.com, palmer@dabbelt.com,
	tglx@linutronix.de, david@redhat.com, jannh@google.com,
	hughd@google.com, yuzhao@google.com, willy@infradead.org,
	muchun.song@linux.dev, vbabka@kernel.org,
	lorenzo.stoakes@oracle.com, akpm@linux-foundation.org,
	rientjes@google.com, vishal.moola@gmail.com, arnd@arndb.de,
	aneesh.kumar@kernel.org, npiggin@gmail.com,
	dave.hansen@linux.intel.com, rppt@kernel.org, ryan.roberts@arm.com,
	linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, sparclinux@vger.kernel.org,
	linux-kernel@vger.kernel.org, x86@kernel.org,
	linux-arch@vger.kernel.org, linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org, linux-sh@vger.kernel.org,
	linux-um@lists.infradead.org
Subject: Re: [PATCH v5 05/17] arm64: pgtable: use mmu gather to free p4d
 level page table
Message-ID: <20250113162600.GA14101@willie-the-truck>
References: <cover.1736317725.git.zhengqi.arch@bytedance.com>
 <3fd48525397b34a64f7c0eb76746da30814dc941.1736317725.git.zhengqi.arch@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3fd48525397b34a64f7c0eb76746da30814dc941.1736317725.git.zhengqi.arch@bytedance.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Wed, Jan 08, 2025 at 02:57:21PM +0800, Qi Zheng wrote:
> Like other levels of page tables, also use mmu gather mechanism to free
> p4d level page table.
> 
> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
> Originally-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>
> Cc: linux-arm-kernel@lists.infradead.org
> ---
>  arch/arm64/include/asm/pgalloc.h |  1 -
>  arch/arm64/include/asm/tlb.h     | 14 ++++++++++++++
>  2 files changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/include/asm/pgalloc.h b/arch/arm64/include/asm/pgalloc.h
> index 2965f5a7e39e3..1b4509d3382c6 100644
> --- a/arch/arm64/include/asm/pgalloc.h
> +++ b/arch/arm64/include/asm/pgalloc.h
> @@ -85,7 +85,6 @@ static inline void pgd_populate(struct mm_struct *mm, pgd_t *pgdp, p4d_t *p4dp)
>  	__pgd_populate(pgdp, __pa(p4dp), pgdval);
>  }
>  
> -#define __p4d_free_tlb(tlb, p4d, addr)  p4d_free((tlb)->mm, p4d)
>  #else
>  static inline void __pgd_populate(pgd_t *pgdp, phys_addr_t p4dp, pgdval_t prot)
>  {
> diff --git a/arch/arm64/include/asm/tlb.h b/arch/arm64/include/asm/tlb.h
> index a947c6e784ed2..445282cde9afb 100644
> --- a/arch/arm64/include/asm/tlb.h
> +++ b/arch/arm64/include/asm/tlb.h
> @@ -111,4 +111,18 @@ static inline void __pud_free_tlb(struct mmu_gather *tlb, pud_t *pudp,
>  }
>  #endif
>  
> +#if CONFIG_PGTABLE_LEVELS > 4
> +static inline void __p4d_free_tlb(struct mmu_gather *tlb, p4d_t *p4dp,
> +				  unsigned long addr)
> +{
> +	struct ptdesc *ptdesc = virt_to_ptdesc(p4dp);
> +
> +	if (!pgtable_l5_enabled())
> +		return;
> +
> +	pagetable_p4d_dtor(ptdesc);
> +	tlb_remove_ptdesc(tlb, ptdesc);
> +}

Should we update p4d_free() to call the destructor, too? It looks like
it just does free_page() atm.

Will
