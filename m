Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EDDB45198A
	for <linux-m68k@lists.linux-m68k.org>; Mon, 12 Oct 2026 09:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791795638; cv=none; b=CXXgHurQQtCSbSKkL0yZrR07E20EQi5JbSo1QhS1b/7xT4fzCQW8616KgaIZUqIRTXJwfz4phpn2HCmqElbbsPKAz/kz7XbG6Cui334MTRLN+A2Rk75XpJpVfA1/SVQXgu0U/Akbt8K9zEhjeb2KI0az8Gw/acWuaeWTn66/Qqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791795638; c=relaxed/simple;
	bh=bxoIfhmKXy46j0HQOePb2/z5si/TOG//tnXgxzSvLdI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DetKrwa+Qd6LFHjPwZEmcIUbZWJIlW2PIXYlokVA0gUsI6qop16yy6RsF61GoRrBsKNrTq34B1JCyvoH9MOhj0gGO3q9hJmHxqUhjCx8oJe7/EiaVmggEzMoslaWvax3fU+wExi6v3srTtYJrSkwr4XKyHPGmKBXQjS9Bay3wlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yoseli.org; spf=pass smtp.mailfrom=yoseli.org; dkim=pass (2048-bit key) header.d=yoseli.org header.i=@yoseli.org header.b=EKU03W0r; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yoseli.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yoseli.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yoseli.org header.i=@yoseli.org header.b="EKU03W0r"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 214303EC73;
	Mon, 12 Oct 2026 09:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yoseli.org; s=gm1;
	t=1791795633;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Jp5Emz0wi7Bug7jncFTez2KsSy4m3LTWOy9mUwRaqK0=;
	b=EKU03W0rKnoeunHkjO8yfzxFvmCTsDfGGIdeN85skx1Eoww2mjl4bKdKHfe4/CNn0DdiFt
	cSxE5BEp3K1OH4LeFkTtqA9n8LWl+tMaVt4FJk4yYVWgk+D7bQw1VluxosB9tvlpydeoal
	st8lPeuouNGQ2ZrMNQfxt+P/cIsiDKYjfKLhMtxgYyXhECT/q0w4QCUDHmU6F7WBK+VdIh
	FPKjVS3ALoOuepOt8FlUcb1wiO7+fbTLDa7+cfs1ROiSv0KyKCQWAUHhXb8XkfNKKoohoZ
	+vVWCkviYEfp+pvPBQtp+qgvOtKoBtBEwBYc2CUt9EnlhlOWUW7djsuUAvVr+Q==
From: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
To: Greg Ungerer <gerg@kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-m68k@lists.linux-m68k.org
Subject: Re: [PATCH] m68knommu: coldfire: allow RAMBAR disable
Date: Mon, 12 Oct 2026 11:00:32 +0200
Message-Id: <20261012090032.2329891-1-jeanmichel.hautbois@yoseli.org>
In-Reply-To: <20261011233225.1300832-1-gerg@kernel.org>
References: <20261011233225.1300832-1-gerg@kernel.org>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: jeanmichel.hautbois@yoseli.org
X-GND-Score: -100
X-GND-Cause: dmFkZTGKGO/uu7BRoDVLScS4eBJZkA3aiLQWrdOeOpINvhAzMk0Hwoi08D3w8YfButr5E9D8gPY+nGotSxXsit37bkeqxTyOTsE+NAb8iCryIegrNZyWpDA9J5AuRURRDLH1mbKMrbtOHvE5tHA4oDdVKwgSIL191meI2KSxyX5+C9Yrgdfg7cw0WaQsqy7AeDcQdd8imPqaXAgReTO39BmZcKk0RbjCmhGatq+AjcLTgs/LxSQmGoDNwnLv/BIR3+GXCYNScnjQA3aWl44e20eggs4NtreC2yuTM9wLfNA0pSmLiqjmvdM8mlPLL8xd1PEVcTnFtBstmjWJnKvuIUPe/cvuR3FvEXHaUSRz1j2ip3pSBLSsDmzqBmR+m5u3RjgFWMrbWyxNcOr3kWzwzhXJFW7TB7ROfB9qt1aHWx7Lx6WZmYNRgvmOyxcwGQc3Qo3NGObcfeMl0gtBdD0N4J9S5igc4L1VBhyR2JpG9zMLySLmr+lsxOua+bQNLJw1sRhUV7zfX9IDQtp8jnM3WznGcZiqWgqgpQcygR7/8WIMioptdA0DUJwFDcTE7bC96oBXPkgfBwS23o/ebHNkzugJt/gqjQI7H1w331D+7VQ+18ZOsCubRqrooJEzoVX9KAWiTZYOgTckhk7Z6yL+dLcCK/+ilJG+kO59B2ZukK8rUdJEIA
X-GND-State: clean

Hi Greg,

On 12/10/26 09:32, Greg Ungerer wrote:

> Most ColdFire SoC parts have a small SRAM hardware block. Linux does not
> use this in any way currently. Unfortunately some boot ROMs enable and
> map this SRAM block in their startup code - and leave it enabled when
> passing control to loaded code - such as the linux kernel. Typically this
> is not a problem and the SRAM block is mapped into the 32bit address
> space at a harmless location. But this is not always the case.

Two remarks, because I am about to post an RFC that makes the kernel the
first in-tree user of that block. It pins the interrupt entry path and a
list of hot functions in the 5441x SRAM, with RAMBAR programmed from
config_BSP().

The quoted sentence is not quite true today though. On M53xx,
PLATFORM_SETUP in asm/m53xxsim.h maps the SRAM at 0x80000000 through
RAMBAR1 and runs the early stack from it, unconditionally. With
RAMBAR_DISABLE=y that stack region is unmapped by your new hunk, and
%sp is only reloaded after the bss clear. Nothing pushes in between as
the code stands, so it does work, but a jsr added there later would be
unpleasant to debug.

> Create a Kconfig option and supporting code that allows the kernel
> startup to disable the SRAM block completely. In practice some ColdFire
> boards have boot ROMs that are not easily upgraded or changed, so this
> option will allow running mainline built kernels without hacking code
> in on top.
>
> The most commonly observed issue to date has been on MMU enabled
> ColdFire parts where the SRAM block is mapped into the usual application
> address space range. The SRAM block hardware has the highest priority
> address decode and will supply its contents over that of virtually
> mapped RAM.

That last paragraph is a useful statement to have from you, and it
matches what I measured on the 5441x: RAMBAR is consulted before the
ACRs and before the MMU, so a window placed in the user range wins over
anything mapped there.

> Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>
> ---
>  arch/m68k/Kconfig.cpu     | 12 ++++++++++++
>  arch/m68k/coldfire/head.S |  5 +++++
>  2 files changed, 17 insertions(+)
>
> diff --git a/arch/m68k/Kconfig.cpu b/arch/m68k/Kconfig.cpu
> index 5a58cc13229e..37669c91933e 100644
> --- a/arch/m68k/Kconfig.cpu
> +++ b/arch/m68k/Kconfig.cpu
> @@ -553,6 +553,18 @@ config NR_CPUS
>  	int
>  	default "1"
>
> +config RAMBAR_DISABLE
> +	bool "Disable the SRAM block at startup"
> +	depends on COLDFIRE
> +	help
> +	  Most ColdFire SoC parts have a small SRAM block that can be mapped
> +	  into the 32bit processor address space. Linux does not generally
> +	  use this. But some board boot ROMs enable it, and often map it at
> +	  odd address locations. It can cause boot up problems due to it being
> +	  enabled and clashing with DRAM, or more often with enabled and
> +	  mapped virtual memory space. Select this option for the kernel
> +	  to disable it during system startup.

This is where a depends on !M53xx would fit, for the early stack above.
My series adds an option that programs RAMBAR instead of clearing it,
and the two exclude each other, but that dependency belongs in my
Kconfig rather than yours.

> +
>  # Coldfire cores that do not have a data cache configured can do coherent DMA.
>  config COLDFIRE_COHERENT_DMA
>  	bool
> diff --git a/arch/m68k/coldfire/head.S b/arch/m68k/coldfire/head.S
> index c6d7fd28c602..2a53e087f57b 100644
> --- a/arch/m68k/coldfire/head.S
> +++ b/arch/m68k/coldfire/head.S
> @@ -186,6 +186,11 @@ _start:
>  	addl	%a7,%d0
>  	movel	%d0,_ramend			/* set end ram addr */
>
> +#ifdef CONFIG_RAMBAR_DISABLE
> +	movel	#0,%d0				/* Disable SRAM region */
> +	movec	%d0,%RAMBAR
> +#endif

Is the %RAMBAR alias what you want on every ColdFire? With binutils
2.43.1 it assembles to rambar0 on 5206e and 5307, and to rambar1 on
5208, 5329, 5407, 5475 and 54418. gas also accepts both names for 5475,
so on a part that really has two blocks I would expect only one of them
to end up disabled.

> +
>  	/*
>  	 *	Now that we know what the memory is, lets enable cache
>  	 *	and get things moving. This is Coldfire CPU specific. Not
> -- 
> 2.55.0

Thanks,
JM
