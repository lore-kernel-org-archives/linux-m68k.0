Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 554A72DECDE
	for <linux-m68k@lists.linux-m68k.org>; Mon,  8 Jun 2026 10:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.234.252.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780916019; cv=none; b=JJt5SVFAEVvC9/0L0m83dAOpASUVVOeyCsPNi0IrVrlI3b1l1yjipJ37isGvUFw/jswpkXsCeEQOpHfhq5aH/c/tu4vOEJ4ijgWYhPiWfUn5ol+g/zhfeJgWyzrSc4pF5Ev7GDaPM/Pl7xCRCzKsWRA7/XX3F17QB//GFU03zto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780916019; c=relaxed/simple;
	bh=Ta1ZsCqpRUZti2Vq9Z+hPPEtIydKAG4B2o//fkeZ52g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sQjEJ8rtrWf3/LVaNLls5FopRICzjvQFKkh2mdnOEfj0Z+ULiyi5QNYuFKlpkJFyhB4E/8sbgqoi7E/b25QWLvYOcpW/2jy/4LC3FwSzM9KIsqec7VQwdlVnMhFGjxIVqIJRDPVygm0FpLyivYv3WowTFTRhb/51y2nxcYshtjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=kernel.org; arc=none smtp.client-ip=172.234.252.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id ED707437D3;
	Mon,  8 Jun 2026 10:53:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9BB21F00893;
	Mon,  8 Jun 2026 10:53:35 +0000 (UTC)
Message-ID: <5ef09276-0b04-4e5a-a472-c73d01ee6ac2@linux-m68k.org>
Date: Mon, 8 Jun 2026 20:53:31 +1000
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] m68k: hash: Use lower_16_bits() helper
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Heiko Stuebner <heiko@sntech.de>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org,
 kernel test robot <lkp@intel.com>
References: <b55e9bd0532c0cad519809c86e0a8400060d75a1.1780559561.git.geert@linux-m68k.org>
Content-Language: en-US
From: Greg Ungerer <gerg@linux-m68k.org>
In-Reply-To: <b55e9bd0532c0cad519809c86e0a8400060d75a1.1780559561.git.geert@linux-m68k.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Geert,

On 4/6/26 17:54, Geert Uytterhoeven wrote:
> When building for m68k with CONFIG_M68000=y and C=1:
> 
>      drivers/clk/rockchip/clk-rk3528.c: note: in included file (through include/linux/hash.h, include/linux/slab.h):
>      arch/m68k/include/asm/hash.h:57:24: warning: cast truncates bits from constant value (18720 becomes 8720)
>      arch/m68k/include/asm/hash.h:57:24: warning: cast truncates bits from constant value (1e8e8 becomes e8e8)
> 
> Sparse does not realize the truncation is intentional.
> Make this explicit by using the lower_16_bits() helper instead, which
> also masks the unwanted bits.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202605191434.PQkj2Rki-lkp@intel.com/
> Reported-by: Heiko Stuebner <heiko@sntech.de>
> Closes: https://lore.kernel.org/20260603213726.1025094-1-heiko@sntech.de/
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>

FWIW:

Acked-by: Greg Ungerer <gerg@linux-m68k.org>

Regards
Greg




> ---
> No change in generated code.
> 
>   arch/m68k/include/asm/hash.h | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/m68k/include/asm/hash.h b/arch/m68k/include/asm/hash.h
> index 6d0d0c893f16dd49..6dadf493706632f5 100644
> --- a/arch/m68k/include/asm/hash.h
> +++ b/arch/m68k/include/asm/hash.h
> @@ -2,6 +2,8 @@
>   #ifndef _ASM_HASH_H
>   #define _ASM_HASH_H
>   
> +#include <linux/wordpart.h>
> +
>   /*
>    * If CONFIG_M68000=y (original mc68000/010), this file is #included
>    * to work around the lack of a MULU.L instruction.
> @@ -54,7 +56,7 @@ static inline u32 __attribute_const__ __hash_32(u32 x)
>   	: "=&d,d" (a), "=&r,r" (b)
>   	: "r,roi?" (x));	/* a+b = x*0x8647 */
>   
> -	return ((u16)(x*0x61c8) << 16) + a + b;
> +	return (lower_16_bits(x * 0x61c8) << 16) + a + b;
>   }
>   
>   #endif	/* _ASM_HASH_H */

