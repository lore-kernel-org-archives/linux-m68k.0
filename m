Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01F55194136
	for <linux-m68k@lists.linux-m68k.org>; Thu,  5 Sep 2024 07:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=147.75.193.91
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725522761; cv=none; b=T9aUjeQgfhi8wRpj9RejqxWbhTL8fQIJk6jqJO9rmw2+BQpo05fqVZ3n0ObN7pgBAkSyRgx26txYcQFeu6uwKsSp1TwsDra4ycMVwq+DV4E8rpzXXUlimVS/WP7MWCLT4e8Xg7tLHCzfF9uxyNbhRtJ/iaffI7arxVZ/CSpsDvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725522761; c=relaxed/simple;
	bh=QruOEX77o4IzM0/p+F25QvRXbfV+dn+E1QX9bbaGKgM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t22CDcoTbBYgLbwMhUAPoU8SmeVt2jCLdAhGk7orh7JdMUzWA84r+br+joxo0NER25stFORhoAemKBJoXS7WEQhOCf2GzWzj0OMU6gh4UXL2koPjgIfsYoUL0lJ4YIv8ymWaReILXo09k+9i3FWmr70kDG70erZmtkAgfCmGBPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=kernel.org; arc=none smtp.client-ip=147.75.193.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 518FFA442EA;
	Thu,  5 Sep 2024 07:52:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DA39C4CEC3;
	Thu,  5 Sep 2024 07:52:36 +0000 (UTC)
Message-ID: <30445b83-50eb-40ae-a2db-43b98d0c3224@linux-m68k.org>
Date: Thu, 5 Sep 2024 17:52:33 +1000
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] m68k: disable SRAM at startup
To: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
References: <20240904-fix-cf-virt-mem-sram-v1-1-fb007028d717@yoseli.org>
Content-Language: en-US
From: Greg Ungerer <gerg@linux-m68k.org>
In-Reply-To: <20240904-fix-cf-virt-mem-sram-v1-1-fb007028d717@yoseli.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi JM,

On 5/9/24 00:26, Jean-Michel Hautbois wrote:
> Some of the internal SoC registers have a higher priority over the MMU
> virtual mappings. The SRAM bank is one of them. If the bootloader
> enables the internal SRAM at address 0x80000000, virtual memory access
> at this address will not hit the MMU - so no TLB data misses would
> occurr.
> 
> Since 0x80000000 is the virtual start address of all applications that
> bit of memory is getting stomped over with inconsistent code and data
> access.
> 
> Fix it by disabling the internal SRAM at startup.
> 
> Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>
> Tested-by: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
> Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>

I know this change fixed your specific problem, but it is not going
to work as a general solution.

For one not all ColdFire parts have an SRAM region and thus not all have
a valid %rambar register. Secondly some ColdFire parts (like the 5249)
have 2 SRAM regions, with mapping control registers named %rambar0
and %rambar1.

Some ColdFire uClinux applications use the mapped SRAM, so a blanket
disable is not the best idea in any case.

I am thinking it would be better to have a new Kconfig option that
allows disabling by the startup code for those ColdFire parts that
have SRAM (so appropriate "depends on"). That way it will only be
disable when that is what is needed. Maybe also have that configuration
allowing to configure and set the rambars so that a mapping
can be forced on if wanted.

Regards
Greg


> ---
>   arch/m68k/coldfire/head.S | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/arch/m68k/coldfire/head.S b/arch/m68k/coldfire/head.S
> index c6d7fd28c6023..3901a49c47c89 100644
> --- a/arch/m68k/coldfire/head.S
> +++ b/arch/m68k/coldfire/head.S
> @@ -207,6 +207,10 @@ _start:
>   	movec	%d0,%CACR
>   	nop
>   
> +	movel   #0,%d0
> +	movec   %d0,%rambar
> +	nop
> +
>   #ifdef CONFIG_MMU
>   	/*
>   	 *	Identity mapping for the kernel region.
> 
> ---
> base-commit: 431c1646e1f86b949fa3685efc50b660a364c2b6
> change-id: 20240904-fix-cf-virt-mem-sram-abadb27fff2f
> 
> Best regards,
