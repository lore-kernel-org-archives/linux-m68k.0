Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F8553E639E
	for <linux-m68k@lists.linux-m68k.org>; Tue, 14 Apr 2026 12:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.234.252.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776169120; cv=none; b=rB0WU1B9ssO7Hrw67lbla1jylVqpZToOsAf74fgIiEEoPQMtbiOjefY8GFjUFrknDFEpuArYfI8BANzWFn2rPEpTQmf8OepIzd1/ZH7cNCA/BIbGyIPg/MjFILTer5M40Hxzb4gFICAXHNq9ekaxZyCkZyrDl4m4vjshX9gUNWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776169120; c=relaxed/simple;
	bh=MnGHHrPULjusC2Ko0o2DekT2/j7+qqDlEoSuWmAISm8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gKomGTVQ/h83ESZWK3QqUDqYcv5mvVG1iWEGNDKlEBSHH4BixCfNSOlhAu5zFdhtEANRqNdx/aAc1aTJplXaRvjrqYa8C+uqBrMl2nRLV7JTaLCOIB35Qgg+ojHfZGC39Gz/kMrN0f7S5F1IgNTgWnRxTjR/GAg3bJEFx7CGyys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=kernel.org; arc=none smtp.client-ip=172.234.252.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C819843DB8;
	Tue, 14 Apr 2026 12:18:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B65BC19425;
	Tue, 14 Apr 2026 12:18:37 +0000 (UTC)
Message-ID: <ec4945ec-84fd-4462-b35d-79a04673107d@linux-m68k.org>
Date: Tue, 14 Apr 2026 22:18:32 +1000
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] m68k: nommu: Fix behaviour of io macros on non-CF
To: Daniel Palmer <daniel@0x0f.com>
Cc: geert@linux-m68k.org, christoph.plattner@gmx.at,
 linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org,
 arnd@kernel.org
References: <20260404024658.2496519-1-daniel@0x0f.com>
Content-Language: en-US
From: Greg Ungerer <gerg@linux-m68k.org>
In-Reply-To: <20260404024658.2496519-1-daniel@0x0f.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Daniel,

On 4/4/26 12:46, Daniel Palmer wrote:
> Currently for 68000 readl() and friends are broken in that they
> return the value from the bus as-is but should be reading a little
> endian value and swapping it to big endian.
> 
> This was found using virtio-mmio on a 68000 virt machine. virtio-mmio
> is little endian even if the emulated machine is big endian. This works
> for MMU m68k because the io macros do what is expected there, but if
> the kernel was built for nommu it breaks.
> 
> Potentially this will break some stuff for nommu non-CF m68k users
> but since there are probably 2 or 3 of us in the world I think we
> can work it out.
> 
> Suggested-by: Arnd Bergmann <arnd@kernel.org>
> Link: https://lore.kernel.org/lkml/ada73dc9-edf5-458c-8849-9f9db23ff304@app.fastmail.com/
> Signed-off-by: Daniel Palmer <daniel@0x0f.com>
> ---
>   arch/m68k/include/asm/io_no.h | 9 ---------
>   1 file changed, 9 deletions(-)
> 
> diff --git a/arch/m68k/include/asm/io_no.h b/arch/m68k/include/asm/io_no.h
> index 516371d5587a..c39db8798ef2 100644
> --- a/arch/m68k/include/asm/io_no.h
> +++ b/arch/m68k/include/asm/io_no.h
> @@ -96,15 +96,6 @@ static inline void writel(u32 value, volatile void __iomem *addr)
>   		__raw_writel(swab32(value), addr);
>   }
>   
> -#else
> -
> -#define readb __raw_readb
> -#define readw __raw_readw
> -#define readl __raw_readl
> -#define writeb __raw_writeb
> -#define writew __raw_writew
> -#define writel __raw_writel
> -
>   #endif /* IOMEMBASE */
>   
>   #if defined(CONFIG_PCI)

This change, in this form at least, breaks most of the non-MMU ColdFire targets.
Try compiling any of m5208evb, m5249evb, m5272c3, m5275evb, m5307c3 or
m5407c3 defconfigs and you get build failures. Targets that do not have
a PCI bus and so do not define IOMEMBASE will fail, which is most of them.

Maybe something like this might be better. I think this ends up giving you the
same result for 68000 nommu targets.

diff --git a/arch/m68k/include/asm/io_no.h b/arch/m68k/include/asm/io_no.h
index 516371d5587a..b335fd4a18e9 100644
--- a/arch/m68k/include/asm/io_no.h
+++ b/arch/m68k/include/asm/io_no.h
@@ -33,7 +33,6 @@
  #include <asm/byteorder.h>
  #include <asm/coldfire.h>
  #include <asm/mcfsim.h>
-#endif /* CONFIG_COLDFIRE */
  
  #if defined(IOMEMBASE)
  /*
@@ -126,6 +125,7 @@ static inline void writel(u32 value, volatile void __iomem *addr)
  #define PCI_IOBASE     ((void __iomem *) PCI_IO_PA)
  #define PCI_SPACE_LIMIT        PCI_IO_MASK
  #endif /* CONFIG_PCI */
+#endif /* CONFIG_COLDFIRE */
  
  #include <asm/kmap.h>
  #include <asm/virtconvert.h>


Regards
Greg

