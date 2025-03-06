Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2110427183F
	for <linux-m68k@lists.linux-m68k.org>; Thu,  6 Mar 2025 21:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=139.178.84.217
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741296008; cv=none; b=YEXd7U9BWvK3NCDvE1FOOUTRuHfLUhxcvCiCSc66k3lubD+n2zMBgawWB9k04vpDqwF7TL0Hul1jG3TD0Ztpsra3yOZCWTfC8b1KE2IlSqobOa2h944a/6GLksYr9X3VeEVI2q1Rd2u4ytTv1yzIwFqtOsm5qw3VF3llHmK9b+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741296008; c=relaxed/simple;
	bh=cZDw6Poc4BDrQ+UyFQkoa8sDIiciZub+M7TYHo89aq4=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=gRhn+4eeES8hRbsYTWndxL9FX+yVXyxiGzCoKlQBZYVp4G3LCSkI70Bl4DjBsq8LYpVp83lNyQGAWTSP1KuG+al9mMjPTsIL/txGlviSmsbbfwVcdqgPvSoM22ivbJryJEOee5Kx5oYdSO2bO4TyWhfWybTQuQh+6wkSjKBypsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linux-foundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=fCD2eitP; arc=none smtp.client-ip=139.178.84.217
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="fCD2eitP"
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E60865C57C8;
	Thu,  6 Mar 2025 21:17:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9335C4CEE0;
	Thu,  6 Mar 2025 21:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1741296005;
	bh=cZDw6Poc4BDrQ+UyFQkoa8sDIiciZub+M7TYHo89aq4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=fCD2eitPTHFzv+QGanXjZD4bENnmRFCyuGnOvEmFo3oZUyxfGbz0e9/waUKJcay/B
	 ulqAAqZ8fT7ST4z1YZd+B5XSm85iLoKo7BN7tD3KTLECZ4zAMHYgvB+TmrABW752ri
	 sqVT0tKHdBGtciAetPrknw/7LiV2aVP98DL5X7zA=
Date: Thu, 6 Mar 2025 13:20:03 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Mike Rapoport <rppt@kernel.org>
Cc: Alexander Gordeev <agordeev@linux.ibm.com>, Andreas Larsson
 <andreas@gaisler.com>, Andy Lutomirski <luto@kernel.org>, Arnd Bergmann
 <arnd@arndb.de>, Borislav Petkov <bp@alien8.de>, Brian Cain
 <bcain@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen
 <dave.hansen@linux.intel.com>, "David S. Miller" <davem@davemloft.net>,
 Dinh Nguyen <dinguyen@kernel.org>, Geert Uytterhoeven
 <geert@linux-m68k.org>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
 Guo Ren <guoren@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, Helge
 Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar
 <mingo@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, Johannes Berg
 <johannes@sipsolutions.net>, John Paul Adrian Glaubitz
 <glaubitz@physik.fu-berlin.de>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Matt Turner <mattst88@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Michal Simek <monstr@monstr.eu>,
 Palmer Dabbelt <palmer@dabbelt.com>, Peter Zijlstra <peterz@infradead.org>,
 Richard Weinberger <richard@nod.at>, Russell King <linux@armlinux.org.uk>,
 Stafford Horne <shorne@gmail.com>, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>, Thomas Gleixner <tglx@linutronix.de>, Vasily
 Gorbik <gor@linux.ibm.com>, Vineet Gupta <vgupta@kernel.org>, Will Deacon
 <will@kernel.org>, linux-alpha@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
 linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-um@lists.infradead.org,
 linux-arch@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org
Subject: Re: [PATCH 00/13] arch, mm: reduce code duplication in mem_init()
Message-Id: <20250306132003.0066f109dae75f74711f9432@linux-foundation.org>
In-Reply-To: <20250306185124.3147510-1-rppt@kernel.org>
References: <20250306185124.3147510-1-rppt@kernel.org>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu,  6 Mar 2025 20:51:10 +0200 Mike Rapoport <rppt@kernel.org> wrote:

> Every architecture has implementation of mem_init() function and some
> even more than one. All these release free memory to the buddy
> allocator, most of them set high_memory to the end of directly
> addressable memory and many of them set max_mapnr for FLATMEM case.
> 
> These patches pull the commonalities into the generic code and refactor
> some of the mem_init() implementations so that many of them can be just
> dropped.

Thanks, I added this series to mm.git.
