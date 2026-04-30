Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0043B345CDA
	for <linux-m68k@lists.linux-m68k.org>; Thu, 30 Apr 2026 03:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.234.252.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777519556; cv=none; b=gily4KqO2bZctorPJ3iGR/c6/3hA9RLGrZUWR7hc/eZFcn5FGFBGS4Z9V2OBD5e0ktdONaGQY8O/Zgcw3Hb3HoeGatNd4k2tXX0pZaQnXPIOD8Jvmsskn5u8gYn4KcauTMFfNlLawbmgRB33YCii2EYU3jcZlFYDTRsLhvNv49Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777519556; c=relaxed/simple;
	bh=7DUN2QuqQEe+BONI1ESG4SkIz1fzsjbqa3ckTuuKON0=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=f99BANFy3yTaDwDcGWOEAltBJKGOIa7X1w/og1ANN3OqU98KXHuz6n4oEL3p+WeoSgK0q1kYmopsHoc+nbNFBEF1ZHB4DhAJFlr4svEXF21449jTW+3gBEUndu6oF4rip8wh/a/IgNdUymamJF6DXlS5yMILKapuD2+Z6WwCM5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S3K5G1Xo; arc=none smtp.client-ip=172.234.252.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S3K5G1Xo"
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9D8204457C;
	Thu, 30 Apr 2026 03:25:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67F0EC2BCB8;
	Thu, 30 Apr 2026 03:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777519554;
	bh=7DUN2QuqQEe+BONI1ESG4SkIz1fzsjbqa3ckTuuKON0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=S3K5G1XovhD07R5O5Cfcy7lVvTxvdUAegkMVL4L8Mtzf9fKcNC7CadGfDm94ncYW3
	 /b3gcg0/YcLg9Als2F8ssWaUxHQUhQMOrsInNGp23YyNVEoZesnW9na1KfzAJGwADp
	 KTU1UQLuwoaLC0FxYgCBT9ErRd1+nqtKD6J1vJmiEmkbMPNMtG+lgotURJHsePS61S
	 RLCqfSNYiEnZojyCuQbicPLDo3ywac2PmflqikQdR6Ir9LNvsPRYjNWI6Ol8jDiw5K
	 s6K1opc7+K/SSJ8ToRvLUcMAZC9t1wDEJ2EBfwZ5oF2rytHLJHY/YtizCxlNq2AgJI
	 UMoMxqu7YBolw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id BA0123809A07;
	Thu, 30 Apr 2026 03:25:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v3 0/4] arch, mm: consolidate empty_zero_page
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <177751950929.2274119.3965174046465654804.git-patchwork-notify@kernel.org>
Date: Thu, 30 Apr 2026 03:25:09 +0000
References: <20260211103141.3215197-1-rppt@kernel.org>
In-Reply-To: <20260211103141.3215197-1-rppt@kernel.org>
To: Mike Rapoport <rppt@kernel.org>
Cc: linux-riscv@lists.infradead.org, akpm@linux-foundation.org,
 andreas@gaisler.com, bp@alien8.de, bcain@kernel.org, catalin.marinas@arm.com,
 chleroy@kernel.org, davem@davemloft.net, dave.hansen@linux.intel.com,
 david@kernel.org, dinguyen@kernel.org, geert@linux-m68k.org,
 guoren@kernel.org, deller@gmx.de, chenhuacai@kernel.org, mingo@redhat.com,
 johannes@sipsolutions.net, glaubitz@physik.fu-berlin.de,
 Liam.Howlett@oracle.com, lorenzo.stoakes@oracle.com, maddy@linux.ibm.com,
 linmag7@gmail.com, mattst88@gmail.com, jcmvbkbc@gmail.com,
 mpe@ellerman.id.au, mhocko@suse.com, monstr@monstr.eu, palmer@dabbelt.com,
 richard@nod.at, linux@armlinux.org.uk, shorne@gmail.com, surenb@google.com,
 tglx@kernel.org, vgupta@kernel.org, vbabka@suse.cz, will@kernel.org,
 linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
 loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
 linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-um@lists.infradead.org, linux-mm@kvack.org,
 x86@kernel.org

Hello:

This series was applied to riscv/linux.git (fixes)
by Andrew Morton <akpm@linux-foundation.org>:

On Wed, 11 Feb 2026 12:31:37 +0200 you wrote:
> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> 
> Hi,
> 
> These patches cleanup handling of ZERO_PAGE() and zero_pfn.
> 
> v3 changes:
> * move zero_page_pfn extern declaration back inside the helpers
> * add tags, thanks all!
> 
> [...]

Here is the summary with links:
  - [v3,1/4] mm: don't special case !MMU for is_zero_pfn() and my_zero_pfn()
    https://git.kernel.org/riscv/c/652d12bc74a0
  - [v3,2/4] mm: rename my_zero_pfn() to zero_pfn()
    https://git.kernel.org/riscv/c/9a1d0c738b45
  - [v3,3/4] arch, mm: consolidate empty_zero_page
    https://git.kernel.org/riscv/c/6215d9f4470f
  - [v3,4/4] mm: cache struct page for empty_zero_page and return it from ZERO_PAGE()
    https://git.kernel.org/riscv/c/26513781d1b3

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


