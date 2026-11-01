Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793571358;
	b=wYi50W8Ns4IHAINRvkgmgxo6RUB10qUSHiq/DnIKaC+qgWOAYeiMSoqxkYgVmXOxzeqf
	 TT0Rq3cdRlo1h8MyF/Q8c/QatNP+/fGVb5eZxHFfuim3Z84hfak2j9ZO9QaqoauddP3tz
	 qKEUNuBX/27dWBw3Tdg8BbOyjDZVQf2kxf061GDAf/39deIBR8F7WLSu3cdk+nSwbaWoF
	 xwCI7DYnZiwsUCX9AHen3jYzKxOCXTSwqqi5BL1ccdO0w6JHq0vFg0mgfhsxYnEmOIKT5
	 z49za4i6puFAaKN0Gtf/UmJgF2UAwkQuKS7e/DjnaPlcd2LlADnH3VHmxPYeN9O62fg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793571358;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Received:Content-Type:
	 MIME-Version:Content-Transfer-Encoding:Subject:From:Message-Id:Date:
	 References:In-Reply-To:To:Cc;
	bh=22yhHEiHUWVm81OxkB+6UNZ5/HC7Jn4HF5eln+k49OY=;
	b=EM9T0i013tqvrM2vkaLihXK9L3bizOn7bAwj5V//0D0V0Ptlw2tpz2a1GlwbSV12ChPF
	 6t3ZZHFzyVrwS5k0RIlFEAXM/oWkII0eOI0opDPAbNdMS7WP6LzuFcFInp8eevbh1mfLz
	 bH3qjO2O+mSjaH/U0loOsQldv100PqxNUUdclQr2COW+6cCvi+0tehDJ2YcY8ptJTnWjG
	 OEEaYBf642/MpyALt8rYhI/n+UbYM1tFWZwGZN5WqiGyF+Yntd5hCHausgENNjt1SSPYX
	 KRrbPJ2FLEfR7O27feOOi+EdvLGDprOmkksWhqNGgloUE2cRsYVf3hzFReezRRR9gJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AXmvtNOq;
	arc=none smtp.remote-ip=172.234.252.31
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E0FA60A3806
	for <linux-m68k@lists.linux-m68k.org>; Sun,  1 Nov 2026 22:15:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E0FA60A3806
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AXmvtNOq
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BE2954401A;
	Sun,  1 Nov 2026 22:15:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BEAA1F01578;
	Sun,  1 Nov 2026 22:15:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793571357;
	bh=22yhHEiHUWVm81OxkB+6UNZ5/HC7Jn4HF5eln+k49OY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=AXmvtNOqtLjopWWCQdkY1kf58r2tsshOv49SBa++XWevEZbozepPlSlFvrN1dcXpb
	 9cANlomEUPj0ZBiZL28+j2QgAXsMv3s2laIiduoGI+ce38Y8h1u9SB0tbHS5wH5wGm
	 +MC9Oi6Swj6nPVmYgaYL1CAKQ9ojJ66d0jdnEvjYS8ncAFvCnZtFlP7tikcjqtWDG5
	 Nh59YfDcc4DI14trFqfgqkMwwd0YKiYIlqlolp6obAZrN5CV473iUawTOR6ZCcdra9
	 V8ouXGtGQ2ZtYTopFX4ZriYxCryYodGD8Ier/J+MdgFsg9Z8lfVl/h7OVFyYY5TBQC
	 LvCqYqw3qq3fA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7D5B538003B8;
	Sun,  1 Nov 2026 22:15:57 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v5 00/12] mm: make userland page table freeing RCU-safe
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <179357135604.2624073.12750471724213497880.git-patchwork-notify@kernel.org>
Date: Sun, 01 Nov 2026 22:15:56 +0000
References: <20260925-rcu-pagetable-freeing-v5-0-31e91065fea4@kernel.org>
In-Reply-To: <20260925-rcu-pagetable-freeing-v5-0-31e91065fea4@kernel.org>
To: Lorenzo Stoakes (ARM) <ljs@kernel.org>
Cc: linux-riscv@lists.infradead.org, akpm@linux-foundation.org,
 david@kernel.org, ziy@nvidia.com, baolin.wang@linux.alibaba.com,
 liam@infradead.org, nico.pache@linux.dev, ryan.roberts@arm.com,
 dev.jain@arm.com, baohua@kernel.org, lance.yang@linux.dev,
 usama.arif@linux.dev, kas@kernel.org, guoren@kernel.org, bcain@kernel.org,
 geert@linux-m68k.org, dinguyen@kernel.org, schuster.simon@siemens-energy.com,
 jonas@southpole.se, stefan.kristiansson@saunalahti.fi, shorne@gmail.com,
 dalias@libc.org, glaubitz@physik.fu-berlin.de, pjw@kernel.org,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 linux@armlinux.org.uk, vgupta@kernel.org, monstr@monstr.eu, chris@zankel.net,
 jcmvbkbc@gmail.com, will@kernel.org, aneesh.kumar@kernel.org,
 npiggin@gmail.com, peterz@infradead.org, davem@davemloft.net,
 andreas@gaisler.com, richard.henderson@linaro.org, mattst88@gmail.com,
 linmag7@gmail.com, catalin.marinas@arm.com, mark.rutland@arm.com,
 chenhuacai@kernel.org, kernel@xen0n.name, tsbogend@alpha.franken.de,
 James.Bottomley@HansenPartnership.com, deller@gmx.de, maddy@linux.ibm.com,
 mpe@ellerman.id.au, chleroy@kernel.org, hca@linux.ibm.com, gor@linux.ibm.com,
 agordeev@linux.ibm.com, borntraeger@linux.ibm.com, svens@linux.ibm.com,
 richard@nod.at, anton.ivanov@cambridgegreys.com, johannes@sipsolutions.net,
 tglx@kernel.org, mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
 x86@kernel.org, hpa@zytor.com, arnd@arndb.de, vbabka@kernel.org,
 rppt@kernel.org, surenb@google.com, mhocko@suse.com, jgg@ziepe.ca,
 jhubbard@nvidia.com, peterx@redhat.com, ysato@users.sourceforge.jp,
 shakeel.butt@linux.dev, corbet@lwn.net, rdunlap@infradead.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org,
 linux-hexagon@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 linux-openrisc@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-snps-arc@lists.infradead.org,
 linux-arch@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-alpha@vger.kernel.org, loongarch@lists.linux.dev,
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
 linux-um@lists.infradead.org, hughd@google.com, qi.zheng@linux.dev,
 linux-doc@vger.kernel.org, gerg@linux-m68k.org

Hello:

This series was applied to riscv/linux.git (fixes)
by Andrew Morton <akpm@linux-foundation.org>:

On Fri, 25 Sep 2026 21:09:35 +0100 you wrote:
> The majority of architectures in the kernel defer page table freeing until
> an RCU grace period has elapsed, this series converts all remaining
> architectures to do so too and eliminates CONFIG_MMU_GATHER_RCU_TABLE_FREE
> altogether.
> 
> This is important because it enables safe lockless page table walking under
> RCU alone.
> 
> [...]

Here is the summary with links:
  - [v5,01/12] mm/khugepaged: deposit a newly allocated page table on collapse
    https://git.kernel.org/riscv/c/eb823057e092
  - [v5,02/12] mm: enable MMU_GATHER_RCU_TABLE_FREE for most 2-level architectures
    https://git.kernel.org/riscv/c/d22254fd57f0
  - [v5,03/12] mm: enable MMU_GATHER_RCU_TABLE_FREE for MMU riscv
    https://git.kernel.org/riscv/c/5ae75414416f
  - [v5,04/12] mm: enable MMU_GATHER_RCU_TABLE_FREE for MMU arm
    https://git.kernel.org/riscv/c/8e645d98fb78
  - [v5,05/12] mm: enable MMU_GATHER_RCU_TABLE_FREE for arc, microblaze, xtensa
    https://git.kernel.org/riscv/c/799bd3c4be5f
  - [v5,06/12] mm: enable MMU_GATHER_RCU_TABLE_FREE for sparc64
    https://git.kernel.org/riscv/c/461a24a81215
  - [v5,07/12] mm: enable MMU_GATHER_RCU_TABLE_FREE for m68k-coldfire
    https://git.kernel.org/riscv/c/ccdaaf591664
  - [v5,08/12] mm: enable MMU_GATHER_RCU_TABLE_FREE for sh-X2
    https://git.kernel.org/riscv/c/a72df945113a
  - [v5,09/12] mm: enable MMU_GATHER_RCU_TABLE_FREE for m68k-motorola
    https://git.kernel.org/riscv/c/0f5cbeebe00e
  - [v5,10/12] mm: enable MMU_GATHER_RCU_TABLE_FREE for sparc32
    https://git.kernel.org/riscv/c/35dd856770f3
  - [v5,11/12] mm: userland pgtable freeing is RCU-safe now, remove leftover bits
    https://git.kernel.org/riscv/c/35e340a47888
  - [v5,12/12] mm: change the contract for free_pgtables(), update docs
    https://git.kernel.org/riscv/c/a5c0a39d0e57

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


