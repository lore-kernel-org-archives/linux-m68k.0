Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 703732297FC
	for <linux-m68k@lists.linux-m68k.org>; Mon, 13 Jan 2025 16:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=139.178.84.217
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736785785; cv=none; b=geYoX8A2P5Gd3ED+ossaQ0vK4+Tk9Di49zMTSEQNzPxsl2qDnpYfGEo3+hGjhic7CsBD0Cu6rcQviP47bdCkDss8U5vWdR6gTDzveUCEfGu9pyp3bGl4z2kiGrvOx8VIndUAtAupM8wH0hFvjGhiE0Q+5hN8fXfWGeGgNBIWi9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736785785; c=relaxed/simple;
	bh=G/WL7za6/FhMEJQUPPYaVa5AR3im6p6zdx508VpTd8Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RlNheJG4cCstF7ihy5oRdMRg4jmPUT6bZXKd6ct1oL3teiJoPxEYIkw4wYVw8figl5fD6okr8nERReEVViGdgfiz/vZJtsza0TTWtNun1T7vyUsjWHFTMw9j6SEppeRjf1qnYsCwoj7+JFjqiwF4brLe72+UIsT2FVvf/ldIMfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lPMzoMzo; arc=none smtp.client-ip=139.178.84.217
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lPMzoMzo"
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D37DA5C56E5;
	Mon, 13 Jan 2025 16:29:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 749DDC4CED6;
	Mon, 13 Jan 2025 16:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736785782;
	bh=G/WL7za6/FhMEJQUPPYaVa5AR3im6p6zdx508VpTd8Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lPMzoMzonmm2uaOFLfrdzxlqYEZB9gyC4UNDIA7tmVyD1CdeiDw/0q7HTvvJaEdU9
	 O8zfvzFkV7uaD3Eeih9wt9NYEMgB9jFV0IHWkVr1H3T/eBEPpuOfFcMO/Ou4iLVDWQ
	 Hml2UsTpltlAGqg8dCV2vjov8Jfdy8hAWDfRY3MLkqHK6jF+OtTwqCUS2Mr7UtQJAG
	 LdHkSaSmCjlHGRuBlI0oL1FiCdYRvc0JfAH5RdDfH6z1lRwE3aqHCLNuC9IujuiGvW
	 +MOXpYRLwV7Hg46tyDx5cj6hTBCHBY3taAzyPWeFgdxktJaT7Of+Zg4hhGTcDn07vF
	 bC7Um3/mpT7aQ==
Date: Mon, 13 Jan 2025 16:29:32 +0000
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
Subject: Re: [PATCH v5 09/17] arm64: pgtable: move pagetable_dtor() to
 __tlb_remove_table()
Message-ID: <20250113162931.GB14101@willie-the-truck>
References: <cover.1736317725.git.zhengqi.arch@bytedance.com>
 <cf4b847caf390f96a3e3d534dacb2c174e16c154.1736317725.git.zhengqi.arch@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cf4b847caf390f96a3e3d534dacb2c174e16c154.1736317725.git.zhengqi.arch@bytedance.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Wed, Jan 08, 2025 at 02:57:25PM +0800, Qi Zheng wrote:
> Move pagetable_dtor() to __tlb_remove_table(), so that ptlock and page
> table pages can be freed together (regardless of whether RCU is used).
> This prevents the use-after-free problem where the ptlock is freed
> immediately but the page table pages is freed later via RCU.
> 
> Page tables shouldn't have swap cache, so use pagetable_free() instead of
> free_page_and_swap_cache() to free page table pages.
> 
> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
> Suggested-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>
> Cc: linux-arm-kernel@lists.infradead.org
> ---
>  arch/arm64/include/asm/tlb.h | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)

Acked-by: Will Deacon <will@kernel.org>

Will
