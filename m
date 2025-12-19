Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E00D32E729
	for <linux-m68k@lists.linux-m68k.org>; Fri, 19 Dec 2025 11:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.105.4.254
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766145543; cv=none; b=MPYZWmZnY3n7X6ei/zc+OEjLKS9Gd3R/24M44fNs3BmGG2mpfjMgNyY/cbepXVBic2GpCS/+BCP6sMspIdpFkyOpKkO1TSHbdsfS6eIfYuJ1KXBdc3XwNnty+eaDjOja4rSlN0kxoUe+7E4g/G+kI2/Twn4qWbQIKKMWvJqvDUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766145543; c=relaxed/simple;
	bh=BPaaj0qgJf0jJsVT7Vn/xyMT+bl/9lrzOQdk7gVbpR4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p3GMEjS8HuBWPiH28r3laZEaotp01tshm29iXXDG8dcQHWDZRgmHCrW7p8NJRY0HQizt6g19yHlUS0ovSO+S5q342v5bLz2uDXpSzIdMsme7WaWlF9kXSCxF08oaIQJ9VqQD/onx6y3t1u+aQgcShqCiePIkbL8qUiHkVnM4SX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=kernel.org; arc=none smtp.client-ip=172.105.4.254
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1469860018;
	Fri, 19 Dec 2025 11:59:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEFA9C4CEF1;
	Fri, 19 Dec 2025 11:58:58 +0000 (UTC)
Message-ID: <d36788e2-52be-42b1-bb99-e2a18f99f7ce@linux-m68k.org>
Date: Fri, 19 Dec 2025 21:58:54 +1000
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] m68k: nommu: fix memmove() with differently aligned src
 and dest for 68000
To: Daniel Palmer <daniel@thingy.jp>, geert@linux-m68k.org
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
References: <20251213120401.3992567-1-daniel@thingy.jp>
Content-Language: en-US
From: Greg Ungerer <gerg@linux-m68k.org>
In-Reply-To: <20251213120401.3992567-1-daniel@thingy.jp>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Daniel,

On 13/12/25 22:04, Daniel Palmer wrote:
> 68000 has different alignment needs to 68020+.
> memcpy() checks if the destination is aligned and does a smaller copy
> to fix the alignment and then critically for 68000 it checks if the
> source is still unaligned and if it is reverts to smaller copies.
> 
> memmove() does not currently do the second part and malfunctions if
> one of the pointers is aligned and the other isn't.

What is the nature of the failure, is it a trap?


> This is apparently getting triggered by printk. If I put breakpoints
> into the new checks added by this commit the first hit looks like this:
> 
> memmove (n=205, src=0x2f3971 <printk_shared_pbufs+205>, dest=0x2f3980 <printk_shared_pbufs+220>) at arch/m68k/lib/memmove.c:82
> 
> Signed-off-by: Daniel Palmer <daniel@thingy.jp>

Seems to make sense from what we have in memcpy.c.

Acked-by: Greg Ungerer <gerg@linux-m68k.org>

Geert: if you are ok with this I can take it via the m68knommu tree?

Regards
Greg



> ---
> 
> This is from my "make 68000 work again" backlog.
> 
> I have had this fix for years and I think the few other people that
> have various 68000 hobby builds must have something similar.
> 
> /root # uname -a
> uClinux buildroot 6.18.0-12420-gdc1a468a2724 #120 Sat Dec 13 20:42:45 JST 2025 m68k GNU/Linux
> /root # cat /proc/cpuinfo
> CPU:            68000
> MMU:            none
> FPU:            none
> Clocking:       1179.1MHz
> BogoMips:       1758.00
> Calibration:    879001600 loops
> /root #
> 
>   arch/m68k/lib/memmove.c | 18 ++++++++++++++++++
>   1 file changed, 18 insertions(+)
> 
> diff --git a/arch/m68k/lib/memmove.c b/arch/m68k/lib/memmove.c
> index 6519f7f349f6..e33f00b02e4c 100644
> --- a/arch/m68k/lib/memmove.c
> +++ b/arch/m68k/lib/memmove.c
> @@ -24,6 +24,15 @@ void *memmove(void *dest, const void *src, size_t n)
>   			src = csrc;
>   			n--;
>   		}
> +#if defined(CONFIG_M68000)
> +		if ((long)src & 1) {
> +			char *cdest = dest;
> +			const char *csrc = src;
> +			for (; n; n--)
> +				*cdest++ = *csrc++;
> +			return xdest;
> +		}
> +#endif
>   		if (n > 2 && (long)dest & 2) {
>   			short *sdest = dest;
>   			const short *ssrc = src;
> @@ -66,6 +75,15 @@ void *memmove(void *dest, const void *src, size_t n)
>   			src = csrc;
>   			n--;
>   		}
> +#if defined(CONFIG_M68000)
> +		if ((long)src & 1) {
> +			char *cdest = dest;
> +			const char *csrc = src;
> +			for (; n; n--)
> +				*--cdest = *--csrc;
> +			return xdest;
> +		}
> +#endif
>   		if (n > 2 && (long)dest & 2) {
>   			short *sdest = dest;
>   			const short *ssrc = src;

