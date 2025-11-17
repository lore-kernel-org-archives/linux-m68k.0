Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5C23278E5D
	for <linux-m68k@lists.linux-m68k.org>; Mon, 17 Nov 2025 03:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.234.252.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763348687; cv=none; b=DYt54r2TSXWAqeRFm+P5uxm38AzAd6leub/nidKauZOJtJ2esgQZPhcxkEveEQMZXmfmPSOUKcCPsjzCpvqqtk27r91ZmhzCXe4jrmbPvuPjl13AE1a7VQ3+KpmCCdNkOFNq2DENcpK0jCWht1rvqHIAgyroupstt7bDd8qlYdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763348687; c=relaxed/simple;
	bh=cykkDvNiXSGPoa0hy0oyAHnJv5jaUu2jzuwHA8d1sX0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Rz2l1CkgWrFkYIPL5jTA+o0JEoqje4CzcBCRYsS7TtBwIbJGbVpg3MK6ATpIopv1kZNh/8wH3aJSuDEjDiAeCtoU+nZj3m1d432aAXqROcusHRq3fBN5+aHaMg40mGOakFzCtqModsBGmNZXBcXPr8BJq4SwNVpXdXzD8XDH6rU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c82W2XMk; arc=none smtp.client-ip=172.234.252.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c82W2XMk"
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5DDD74033A;
	Mon, 17 Nov 2025 03:04:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 350B5C116D0;
	Mon, 17 Nov 2025 03:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763348685;
	bh=cykkDvNiXSGPoa0hy0oyAHnJv5jaUu2jzuwHA8d1sX0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=c82W2XMkoX2sMU/Ri2OrkfS0shJwqfNu2+CF6e8WAzD4FxBkIrD78gGgACPeNn8cr
	 Th7WLZenq0953LL+lH9USeC02rzrAbZp0IBOhSJt5dEQFQYM+ZdsmDPH7/PJivSnyy
	 /clX0XrMONMV1Nir8/9FcaOp5sqwICbtyOz7lS1ypj3GMMIKZYCQbDhDrvL/Ik1xZj
	 RsPxlw2JqDLBs06KUcB6uLI2hoXlycAhZTYoWrnT28TetDeq11eQXKSrqkbZCNsD/y
	 G1UWwXQMCjZMpptB1gN6oicSeLXLUfiPRsXKTIyG2ucyfDIkJhVC5fuaPhuz4+E48T
	 y6jASI1PZ/6Vg==
Message-ID: <e5ff379e-b679-4513-b390-fa9b604999f4@kernel.org>
Date: Mon, 17 Nov 2025 13:04:39 +1000
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] m68k: Implement kernel memory protection
To: Daniel Palmer <daniel@thingy.jp>, geert@linux-m68k.org,
 linux-m68k@lists.linux-m68k.org
Cc: linux-kernel@vger.kernel.org
References: <20251116220508.1513445-1-daniel@thingy.jp>
Content-Language: en-US
From: Greg Ungerer <gerg@kernel.org>
In-Reply-To: <20251116220508.1513445-1-daniel@thingy.jp>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Daniel,

On 17/11/25 08:05, Daniel Palmer wrote:
> Every time I boot linux on my various m68k machines I see
> "This architecture does not have kernel memory protection."
> 
> I wondered why this was as some of my machines even have one of
> those fancy MMU doodads. I worked out it was because we don't have
> CONFIG_ARCH_HAS_STRICT_KERNEL_RWX, found kernel_set_cachemode()
> seemed like it had the code for setting some extra flags for
> kernel pages and turned that into something that sets write
> protect for kernel pages.
> 
> So now we can make CONFIG_ARCH_HAS_STRICT_KERNEL_RWX=y and
> provide mark_rodata_ro() to mark the kernel text and rodata
> as write protected.
> 
> The test enabled by CONFIG_DEBUG_RODATA_TEST=y says this is
> working, but I've only tested on the virt machine.
> 
> Signed-off-by: Daniel Palmer <daniel@thingy.jp>

Seems to work fine on real ColdFire hardware (tested on an M5475 -
that is one that has an MMU):

...
VFS: Mounted root (romfs filesystem) readonly on device 31:0.
Freeing unused kernel image (initmem) memory: 88K
Write protecting kernel text: 0x22000 - 0x393f70
Write protecting kernel read-only data: 0x394000 - 0x450000
Run /sbin/init as init process
Run /etc/init as init process
Run /bin/init as init process
process '/bin/init' started with executable stack
...

Tested-by: Greg Ungerer <gerg@linux-m68k.org>

Regards
Greg



> ---
>   arch/m68k/Kconfig   |  1 +
>   arch/m68k/mm/init.c | 69 +++++++++++++++++++++++++++++++++++++++++++++
>   2 files changed, 70 insertions(+)
> 
> diff --git a/arch/m68k/Kconfig b/arch/m68k/Kconfig
> index 11835eb59d94..2137fd19ffbd 100644
> --- a/arch/m68k/Kconfig
> +++ b/arch/m68k/Kconfig
> @@ -8,6 +8,7 @@ config M68K
>   	select ARCH_HAS_CPU_FINALIZE_INIT if MMU
>   	select ARCH_HAS_CURRENT_STACK_POINTER
>   	select ARCH_HAS_DMA_PREP_COHERENT if M68K_NONCOHERENT_DMA && !COLDFIRE
> +	select ARCH_HAS_STRICT_KERNEL_RWX if MMU
>   	select ARCH_HAS_SYNC_DMA_FOR_DEVICE if M68K_NONCOHERENT_DMA
>   	select ARCH_HAVE_NMI_SAFE_CMPXCHG if RMW_INSNS
>   	select ARCH_MIGHT_HAVE_PC_PARPORT if ISA
> diff --git a/arch/m68k/mm/init.c b/arch/m68k/mm/init.c
> index 488411af1b3f..bc1147f25624 100644
> --- a/arch/m68k/mm/init.c
> +++ b/arch/m68k/mm/init.c
> @@ -123,3 +123,72 @@ void __init mem_init(void)
>   {
>   	init_pointer_tables();
>   }
> +
> +#ifdef CONFIG_MMU
> +/*
> + * Based on (basically copy/pasted) kernel_set_cachemode() because
> + * presumably that is correct and covers the required differences.
> + */
> +static void __mark_ro_data(unsigned long virtaddr, ssize_t size)
> +{
> +	pgd_t *pgd_dir;
> +	p4d_t *p4d_dir;
> +	pud_t *pud_dir;
> +	pmd_t *pmd_dir;
> +	pte_t *pte_dir;
> +
> +	while (size > 0) {
> +		pgd_dir = pgd_offset_k(virtaddr);
> +		p4d_dir = p4d_offset(pgd_dir, virtaddr);
> +		pud_dir = pud_offset(p4d_dir, virtaddr);
> +		if (pud_bad(*pud_dir)) {
> +			pud_clear(pud_dir);
> +			return;
> +		}
> +		pmd_dir = pmd_offset(pud_dir, virtaddr);
> +
> +#if CONFIG_PGTABLE_LEVELS == 3
> +		if (CPU_IS_020_OR_030) {
> +			unsigned long pmd = pmd_val(*pmd_dir);
> +
> +			if ((pmd & _DESCTYPE_MASK) == _PAGE_PRESENT) {
> +				*pmd_dir = __pmd(pmd | _PAGE_RONLY);
> +				virtaddr += PMD_SIZE;
> +				size -= PMD_SIZE;
> +				continue;
> +			}
> +		}
> +#endif
> +
> +		if (pmd_bad(*pmd_dir)) {
> +			pmd_clear(pmd_dir);
> +			return;
> +		}
> +		pte_dir = pte_offset_kernel(pmd_dir, virtaddr);
> +
> +		set_pte(pte_dir, pte_wrprotect(*pte_dir));
> +		virtaddr += PAGE_SIZE;
> +		size -= PAGE_SIZE;
> +	}
> +}
> +
> +void mark_rodata_ro(void)
> +{
> +	unsigned long start;
> +	unsigned long end;
> +
> +	/* kernel text - kernel_pg_dir lives in the first page, so skip that */
> +	start = (unsigned long) _stext + PAGE_SIZE;
> +	end = (unsigned long) _etext;
> +	pr_info("Write protecting kernel text: 0x%lx - 0x%lx\n", start, end);
> +	__mark_ro_data(start, end - start);
> +
> +	/* ro data */
> +	start = (unsigned long) __start_rodata;
> +	end = (unsigned long) __end_rodata;
> +	pr_info("Write protecting kernel read-only data: 0x%lx - 0x%lx\n", start, end);
> +	__mark_ro_data(start, end - start);
> +
> +	flush_tlb_all();
> +}
> +#endif

