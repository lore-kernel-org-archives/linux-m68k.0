Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7444C4F3939
	for <linux-m68k@lists.linux-m68k.org>; Tue, 13 Oct 2026 12:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.105.4.254
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791894973; cv=none; b=H/JUUB+XZFnaunOuzQ7f26KcW/D19Zoq4jJWUy89DtA47tS8eMhh23m5BrAK6M9OqQ/MtciK5ieWnFaGpxtYIeVHSnju2lf+XzSNq5J+5+mliZxX5y7mlhPaItouJEZTZmiH2uZikjl4CDztVPg43vE0LET1rV9blC3d0BQ6yys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791894973; c=relaxed/simple;
	bh=vi3Q+tyANX7KrVxzNdPg2ZoI0wNlvnYDnOkL6UppdJ4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BNKZraKfm2At0hCk7Q5NjysK+krzv1LnSzse4/37gNjY4l7JxiEVKzepHAWV/pWwhcWRxNTPX3R7FlopTZ3kPikQ/BWEPHfwmOUP/776NqdgAD0gdj4GnJMo7w6zRdVyuTTOlTvEC3VAR1S2FeRMCuS3sEUV06WVSoL0GotttS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fwjK71eP; arc=none smtp.client-ip=172.105.4.254
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fwjK71eP"
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 53CFA602C3;
	Tue, 13 Oct 2026 12:36:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D8D71F00893;
	Tue, 13 Oct 2026 12:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791894970;
	bh=oEil3e1L6jJl6udXi+FM4xrSVORRga1yBjAU1G8S+jk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=fwjK71eP4dWfmYwTZT1jklelDTNulBw65SnH/sqKmTuGVDTFB8P6UNuMA56q3UquW
	 aANq01HGTNewRB9J5FQLhf9gH7XSh97Tk2LcA5YKNzibCOcgqCTqk/V22rQhp96hf6
	 0Vsi7i5yINcOVhpCOHXNjq4lm2KBd+c7S/RtB26hZzEPzNHxDxfsuZ5vOpk7UmOzVU
	 EKsdQEBQJQ3ExLg56mD4GoMkbmTOQpFJgmMFYzizL5uXY+XSY6PXToBsrIDPuBUr9U
	 ZG/gw1gBkLYr+Px2xJufenZkSW3yoge6H3F20hiQ6JuW5n1nrE8RTEmsq+/Z51MsYo
	 /lfAPr3i8e/0A==
Message-ID: <49c48b88-783a-4955-ba4a-b9e854edc55f@kernel.org>
Date: Tue, 13 Oct 2026 22:36:07 +1000
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] m68knommu: coldfire: allow RAMBAR disable
To: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@lists.linux-m68k.org
References: <20261011233225.1300832-1-gerg@kernel.org>
 <20261012090032.2329891-1-jeanmichel.hautbois@yoseli.org>
Content-Language: en-US
From: Greg Ungerer <gerg@kernel.org>
In-Reply-To: <20261012090032.2329891-1-jeanmichel.hautbois@yoseli.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi JM,

On 12/10/26 19:00, Jean-Michel Hautbois wrote:
> Hi Greg,
> 
> On 12/10/26 09:32, Greg Ungerer wrote:
> 
>> Most ColdFire SoC parts have a small SRAM hardware block. Linux does not
>> use this in any way currently. Unfortunately some boot ROMs enable and
>> map this SRAM block in their startup code - and leave it enabled when
>> passing control to loaded code - such as the linux kernel. Typically this
>> is not a problem and the SRAM block is mapped into the 32bit address
>> space at a harmless location. But this is not always the case.
> 
> Two remarks, because I am about to post an RFC that makes the kernel the
> first in-tree user of that block. It pins the interrupt entry path and a
> list of hot functions in the 5441x SRAM, with RAMBAR programmed from
> config_BSP().

Ok, nice. This patch was designed to be the simplest disable of the
RAM region when absolutely required. There has not been any post boot
use for it up to now. But maybe we don't need it now.


> The quoted sentence is not quite true today though. On M53xx,
> PLATFORM_SETUP in asm/m53xxsim.h maps the SRAM at 0x80000000 through
> RAMBAR1 and runs the early stack from it, unconditionally. With
> RAMBAR_DISABLE=y that stack region is unmapped by your new hunk, and
> %sp is only reloaded after the bss clear. Nothing pushes in between as
> the code stands, so it does work, but a jsr added there later would be
> unpleasant to debug.

Yes, that is not ideal. So my thinking is to move the configurable RAMBAR
setting code to before that PLATFORM_SETUP. That way platform code can
enable it and use it if they want - independently of this new option.


>> Create a Kconfig option and supporting code that allows the kernel
>> startup to disable the SRAM block completely. In practice some ColdFire
>> boards have boot ROMs that are not easily upgraded or changed, so this
>> option will allow running mainline built kernels without hacking code
>> in on top.
>>
>> The most commonly observed issue to date has been on MMU enabled
>> ColdFire parts where the SRAM block is mapped into the usual application
>> address space range. The SRAM block hardware has the highest priority
>> address decode and will supply its contents over that of virtually
>> mapped RAM.
> 
> That last paragraph is a useful statement to have from you, and it
> matches what I measured on the 5441x: RAMBAR is consulted before the
> ACRs and before the MMU, so a window placed in the user range wins over
> anything mapped there.

It is any interesting design, but that is the documented behavior.


>> Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>
>> ---
>>  arch/m68k/Kconfig.cpu     | 12 ++++++++++++
>>  arch/m68k/coldfire/head.S |  5 +++++
>>  2 files changed, 17 insertions(+)
>>
>> diff --git a/arch/m68k/Kconfig.cpu b/arch/m68k/Kconfig.cpu
>> index 5a58cc13229e..37669c91933e 100644
>> --- a/arch/m68k/Kconfig.cpu
>> +++ b/arch/m68k/Kconfig.cpu
>> @@ -553,6 +553,18 @@ config NR_CPUS
>>  	int
>>  	default "1"
>>
>> +config RAMBAR_DISABLE
>> +	bool "Disable the SRAM block at startup"
>> +	depends on COLDFIRE
>> +	help
>> +	  Most ColdFire SoC parts have a small SRAM block that can be mapped
>> +	  into the 32bit processor address space. Linux does not generally
>> +	  use this. But some board boot ROMs enable it, and often map it at
>> +	  odd address locations. It can cause boot up problems due to it being
>> +	  enabled and clashing with DRAM, or more often with enabled and
>> +	  mapped virtual memory space. Select this option for the kernel
>> +	  to disable it during system startup.
> 
> This is where a depends on !M53xx would fit, for the early stack above.
> My series adds an option that programs RAMBAR instead of clearing it,
> and the two exclude each other, but that dependency belongs in my
> Kconfig rather than yours.

I think I would rather move the disable code earlier in the startup sequence.
That way it remains applicable to all SoC types. Outside of running the kernel
from ROM/FLASH (which is what the current 53xx code appears to be doing) there
is just as easily use cases loading from a conventional boot loader where DRAM
has been enabled and the kernel is running from it.


>> +
>>  # Coldfire cores that do not have a data cache configured can do coherent DMA.
>>  config COLDFIRE_COHERENT_DMA
>>  	bool
>> diff --git a/arch/m68k/coldfire/head.S b/arch/m68k/coldfire/head.S
>> index c6d7fd28c602..2a53e087f57b 100644
>> --- a/arch/m68k/coldfire/head.S
>> +++ b/arch/m68k/coldfire/head.S
>> @@ -186,6 +186,11 @@ _start:
>>  	addl	%a7,%d0
>>  	movel	%d0,_ramend			/* set end ram addr */
>>
>> +#ifdef CONFIG_RAMBAR_DISABLE
>> +	movel	#0,%d0				/* Disable SRAM region */
>> +	movec	%d0,%RAMBAR
>> +#endif
> 
> Is the %RAMBAR alias what you want on every ColdFire? With binutils
> 2.43.1 it assembles to rambar0 on 5206e and 5307, and to rambar1 on
> 5208, 5329, 5407, 5475 and 54418. gas also accepts both names for 5475,
> so on a part that really has two blocks I would expect only one of them
> to end up disabled.

From my experimenting %RAMBAR is available and setable on all SoC types,
even if they have a RAMBAR1 region. So to keep things simple in this patch
it only disables that one bank.

There is no urgency on this - and it was your problem case that prompted it.
If you have something better cooking then I can just shelve this for now.

Regards
Greg


