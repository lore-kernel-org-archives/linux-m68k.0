Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BE0A15A4
	for <linux-m68k@vger.kernel.org>; Sun, 28 Jan 2024 12:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706446523; cv=none; b=Hd9ylgCKhHfPWkblkTbkbsyLlstd+rSZP699mLMS4/2Lrlb6PNtmhm66N/upT/Bs7Bn8WDQz7Bt7o2PGbNO4fYUhppoCgRxTBoN0uGqL+0PcuYNQ52oSpUTNcDWIqRLXbX05ebIuOPMOCT8sfei0ol6PesvVgWAKZ8Eu9JnXyNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706446523; c=relaxed/simple;
	bh=rx2HFDDSP/mcKBkegRkCspsIZWFLe2J4Y1/jcDqTvt8=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=MIpzy6yT9n6shQbHLwWMY2MI96MYJEuUQhA7MWJTdEfQKch5iuV4e0SaR2czRH89+k9hhNKm5rNXrNUpCkwv9knFUgwIaaHob061KIIgpq7VaIj7QXibUC4P52xocNa2rTWH0ptCuX6ofFVTgO2RJRPU3WklFt/ekb5FbZKv9T0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ahj1MR3V; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ahj1MR3V"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E222C43399;
	Sun, 28 Jan 2024 12:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706446522;
	bh=rx2HFDDSP/mcKBkegRkCspsIZWFLe2J4Y1/jcDqTvt8=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=ahj1MR3VgK6lE9Pd1x0y1DsYD7zwmSemxeewoHuQ33jg9lzNBpMT1mBCr1EFLjnaY
	 E4QZUnlhgnI+8KSb1fRhLk86sh3MmNCZvDGBy86Y4EzF75blFHiARWcT0tQzuTS5or
	 koxB7M6c6yf0emfr8u0yw2v7nO7CPEzjSHJthQsCuAxwuDeHKaidoiic+0a2rrRGLQ
	 zEbKSwklXMj96aXotrwpWvvXMkUcZHIBWTNKUjv0YRaZbKnieV8yVfL94r1szroSoD
	 XlNb36sH63262YIPrpdDsKkTffYe2iXImmNJEqJeFY82//c6M59Ryyd4rRZJGahSaE
	 +9rqVWZn6vwIg==
Message-ID: <5534a940-2346-4911-8395-aeefd3d50513@kernel.org>
Date: Sun, 28 Jan 2024 22:55:19 +1000
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: m68k fdpic toolchain?
Content-Language: en-US
To: Rob Landley <rob@landley.net>, linux-m68k@vger.kernel.org
References: <18232799-792d-e5c4-5483-00e84b8bd530@landley.net>
From: Greg Ungerer <gerg@kernel.org>
In-Reply-To: <18232799-792d-e5c4-5483-00e84b8bd530@landley.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 28/1/24 20:27, Rob Landley wrote:
> Now that we can build coldfire fdpic support in the kernel, does a _compiler_ exist?

No, no fdopic support has been added to bgcc for m68k/coldfire.


> https://lore.kernel.org/linux-mm/20220428033319.239341-1-gerg@linux-m68k.org/T/
> 
> I built buildroot's mcf5208evb defconfig and booted it under qemu, but it's
> binflt, which I'm not adding to my test system's package dependencies. According
> to fs/Kconfig.binfmt:
> 
>   config BINFMT_ELF_FDPIC
>          bool "Kernel support for FDPIC ELF binaries"
>          default y if !BINFMT_ELF
>          depends on ARM || ((M68K || RISCV || SUPERH || XTENSA) && !MMU)
> 
> So I can select it, but in gcc's current git "grep -irl fdpic gcc/config" only
> has hits in the sh, arm, frv, and bfin directories.

As-is today you can load and run PIE ELF binaries using this support.
No additional changes to binutils or gcc required for that.

Regards
Greg



> Two of those three (frv and blackfin) were jettisoned by linux-kernel due to
> loss of expertise in the development community. I've already got an sh2 fdpic
> test system, but only on real hardware, not qemu (which decided to add
> qemu-system-sh4 instead of qemu-system-sh way back when, and thus never
> populated the rest of the family).
> 
> I'm happy to use out-of-tree patches for m68k if that's what's available, but I
> haven't been able to find any. I assume that enabling fdpic means the ABI was
> documented specifying the registers for the extra segments...?
> 
> Rob
> 
