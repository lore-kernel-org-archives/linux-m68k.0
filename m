Received: from smtpout.efficios.com (smtpout.efficios.com [167.114.26.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A17347FBBD
	for <linux-m68k@lists.linux-m68k.org>; Mon,  6 May 2024 13:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=167.114.26.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715003335; cv=none; b=iVFOyxlin6XKIOe3ADdtJzdRFUrf7fb+weQgWMz5nblhZ4NcmpxhTYBk8ohuSN5V+jbESgOxoLpk1vWA8tZJpG65Zs1vSo/WW5eRMvuXYGjBAwM4zVmwey7O49jdZWmRF0MiZruZ/TptZIXpdPGQzT1scw0wPXTA7lJpzVc0dXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715003335; c=relaxed/simple;
	bh=gDzXcB5Dc0LFkO3c2ESxbU5H4cY5L8i4wRWwQSM7IBc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g3DiYH5yGl9dShO3s4Gjqe6EngHbubvAAd8YDNL/1tMnzlX3LR20teYMee7DooovgdHs+JdYNKVFb6PavICaTBBSq8RoW3rGPVM4hVD7dPBcnq8R0pC9v2mJleJnGI0m7tAbUrSgltCra+F7ASg0H5oukam5+zI9QikH8XSNwuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com; spf=pass smtp.mailfrom=efficios.com; dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b=sJ7kVAPZ; arc=none smtp.client-ip=167.114.26.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=efficios.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b="sJ7kVAPZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=efficios.com;
	s=smtpout1; t=1715003325;
	bh=gDzXcB5Dc0LFkO3c2ESxbU5H4cY5L8i4wRWwQSM7IBc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=sJ7kVAPZCRo+PwO73LDTZ3phGYd+ApfFT95E3KGf+VNddPF5H+h/eCZ6poqpKG3LI
	 iSoI6VV/82U7TyYVgXDrB/fjqMWszb4sFuZNlC2HoLyRbn2iuC5cOFxj2d5rCoPSWg
	 H0ho8TsBZf7eUG6+YMRDfBzB65DPtmizSnakHWYD7+iQ6t5haRRyPsRD+wSHIIREYZ
	 VwWqQbJJR5dN/GPT6qrSX5nc+/l5GzrJxiM9C7CQyVkLJYLWQsCGFIZrnp2wmXsFwT
	 +i4EPJ+vg/VUp4xCIh/CiQrD+6cGJckFUnUZlQEGHP8vk2vH8HfIQMW6f3zdZqKODp
	 Zp2n66PoOA4GA==
Received: from [172.16.0.134] (192-222-143-198.qc.cable.ebox.net [192.222.143.198])
	by smtpout.efficios.com (Postfix) with ESMTPSA id 4VY2n90132zy8y;
	Mon,  6 May 2024 09:48:44 -0400 (EDT)
Message-ID: <d542207e-4022-4958-9571-375dbcae476a@efficios.com>
Date: Mon, 6 May 2024 09:49:05 -0400
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] m68k: Move ARCH_HAS_CPU_CACHE_ALIASING
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
References: <4574ad6cc1117e4b5d29812c165bf7f6e5b60773.1714978406.git.geert@linux-m68k.org>
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Content-Language: en-US
In-Reply-To: <4574ad6cc1117e4b5d29812c165bf7f6e5b60773.1714978406.git.geert@linux-m68k.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2024-05-06 03:06, Geert Uytterhoeven wrote:
> Move the recently added ARCH_HAS_CPU_CACHE_ALIASING to restore
> alphabetical sort order.
> 
> Fixes: 8690bbcf3b7010b3 ("Introduce cpu_dcache_is_aliasing() across all architectures")
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>

Reviewed-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>

> ---
> To be queued in the m68k tree for v6.10.
> 
>   arch/m68k/Kconfig | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/m68k/Kconfig b/arch/m68k/Kconfig
> index c68fbc59787ab59d..e0b4f6e9fe4ce1f4 100644
> --- a/arch/m68k/Kconfig
> +++ b/arch/m68k/Kconfig
> @@ -3,8 +3,8 @@ config M68K
>   	bool
>   	default y
>   	select ARCH_32BIT_OFF_T
> -	select ARCH_HAS_CPU_CACHE_ALIASING
>   	select ARCH_HAS_BINFMT_FLAT
> +	select ARCH_HAS_CPU_CACHE_ALIASING
>   	select ARCH_HAS_CPU_FINALIZE_INIT if MMU
>   	select ARCH_HAS_CURRENT_STACK_POINTER
>   	select ARCH_HAS_DMA_PREP_COHERENT if M68K_NONCOHERENT_DMA && !COLDFIRE

-- 
Mathieu Desnoyers
EfficiOS Inc.
https://www.efficios.com

