Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2114620DD48
	for <linux-m68k@lists.linux-m68k.org>; Sun, 27 Apr 2025 23:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=147.75.193.91
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745797033; cv=none; b=jTZmYLvezhfwMV9JHRmY9ytMW3eVltL5emGD+ek5zSv6kp/eFhYpXoZOhPDmoO8UeB5FRQKXDFepIweo6BCLPCTBoz4FDtn3OrPXy3BXbpuecSieoRZ6OuXbBToFd07llQ0DFyTCsMUZ1FDggANfa6qBSmmCnTBPclgCceW/qt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745797033; c=relaxed/simple;
	bh=qtRjSKLfiQMiS15ic3ebxNl4OsQFpBgv0v/cD3OGpQg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ru24suNCEvP8wEq+SZYV3wzXU5Pwy5quJxr5F9q/ZaCVgJ0KVyU0lP8Dmc8FVCzROqm4SSZcEjOfb1vS7BXVv+kS+tSKTA+6kcLHJZe0oPMC/SjKfxop2njgsQce6nwDluR07xubXwaZ2epnBxAccRwuEArHNk17qUNud2QIS7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=kernel.org; arc=none smtp.client-ip=147.75.193.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4C5F1A41B92;
	Sun, 27 Apr 2025 23:31:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2416C4CEE3;
	Sun, 27 Apr 2025 23:37:08 +0000 (UTC)
Message-ID: <ac188e54-7f23-4ecd-805c-c0437a53247a@linux-m68k.org>
Date: Mon, 28 Apr 2025 09:37:04 +1000
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] m68k: Enable dead code elimination
To: Daniel Palmer <daniel@0x0f.com>, geert@linux-m68k.org,
 linux-m68k@lists.linux-m68k.org
Cc: linux-kernel@vger.kernel.org
References: <20250416114240.2929832-1-daniel@0x0f.com>
Content-Language: en-US
From: Greg Ungerer <gerg@linux-m68k.org>
In-Reply-To: <20250416114240.2929832-1-daniel@0x0f.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Daniel,

On 16/4/25 21:42, Daniel Palmer wrote:
> Allow the experimental dead code elimination config to be enabled.
> 
> For my 68000 nommu config this frees up a few hundred K of memory
> so seems worth while.
> 
> Boot and build tested on nommu and mmu enabled configs.
> 
> Before:
> Memory: 5388K/8192K available (1986K kernel code, 114K rwdata,
> 244K rodata, 92K init, 41K bss, 2624K reserved, 0K cma-reserved)
> 
> After
> Memory: 5684K/8192K available (1714K kernel code, 112K rwdata,
> 228K rodata, 92K init, 37K bss, 2328K reserved, 0K cma-reserved)
> 
> Signed-off-by: Daniel Palmer <daniel@0x0f.com>

Nice. It worked fine on ColdFire builds as well (both nommu and mmu).

Acked-by: Greg Ungerer <gerg@linux-m68k.org>

I notice that some other architectures (arm and powerpc) have version
checks on gcc or ld in the config. Do you know if there is any version
limitations for m68k here?

Regards
Greg



> ---
>   arch/m68k/Kconfig | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/m68k/Kconfig b/arch/m68k/Kconfig
> index eb5bb6d36899..11835eb59d94 100644
> --- a/arch/m68k/Kconfig
> +++ b/arch/m68k/Kconfig
> @@ -32,6 +32,7 @@ config M68K
>   	select HAVE_ASM_MODVERSIONS
>   	select HAVE_DEBUG_BUGVERBOSE
>   	select HAVE_EFFICIENT_UNALIGNED_ACCESS if !CPU_HAS_NO_UNALIGNED
> +	select HAVE_LD_DEAD_CODE_DATA_ELIMINATION
>   	select HAVE_MOD_ARCH_SPECIFIC
>   	select HAVE_UID16
>   	select MMU_GATHER_NO_RANGE if MMU

