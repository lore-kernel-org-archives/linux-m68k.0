Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A992D246771
	for <linux-m68k@lists.linux-m68k.org>; Tue, 10 Jun 2025 16:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.105.4.254
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749572893; cv=none; b=QQ3edSj68hFu0hg28K5ZU5mqN08lyI/rmQS0dvt2jL6nkflm+RH5zi/yfFEMAkp5JGRqybY4ISjoWwWIqz4Ms13ulaP8+p0j60G7KkFtDjOcMEbgKgQ/zWLN1EtMQR9hHERdEh9LRAx+orHphS5TyT3G49XKy6v1L9BrH041Fn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749572893; c=relaxed/simple;
	bh=VGaA2UjcATw5usDRARWAGHoyvA3nRCcXodZF/+d4fPQ=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=eEtPh7UkAiPKDMGvPJJ3AxxNiSVsLdBUYVnmR+xFdrkCVkceCY7VakqVe00DCBp3riyuiacw7OEJkEOuKcvoXLmT3//IzOB4L4M7McKpzcFJpKmoPYrcpNCZNsopXFK1wQX6olU7AHzMpLPMIrKkGwYZAaBizgi9pt+YH3yig9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JJ1f2Y7N; arc=none smtp.client-ip=172.105.4.254
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JJ1f2Y7N"
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DB613629F9;
	Tue, 10 Jun 2025 16:28:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84AE9C4CEED;
	Tue, 10 Jun 2025 16:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749572889;
	bh=VGaA2UjcATw5usDRARWAGHoyvA3nRCcXodZF/+d4fPQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=JJ1f2Y7NQSd54tSszQLRiQIl7dD277rRFw5CD03cct8JsOIa9MeckGxwgeTNERJbY
	 /Aq7k/QdxMobJHlLVMWLaBVYiO7WUz7b5oZF8aZHHmpn5SGMFxfrabCx4zi/NelVA7
	 9tpmie/ZR7eRtm/GQUxR12kWA/MXW8KxThnLlIuGSON9FK96/TttZtzzrp91aMtCTf
	 nkrgxszvlyVUm0gGo8/i60pLDKogQxJCIy6qqOtv6fYwtbh3P8fqWAcjVqLwJncDb0
	 2wdFJTUv8YDSR+ksvQyqg1NCDe5af7sVQqmJb6cWow02fsajDICno0naOHZ+D1dFYd
	 UMToThilj3zfw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33D5B39D6540;
	Tue, 10 Jun 2025 16:28:41 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 2/2] arch: use always-$(KBUILD_BUILTIN) for vmlinux.lds
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <174957291974.2454024.16546912662876416180.git-patchwork-notify@kernel.org>
Date: Tue, 10 Jun 2025 16:28:39 +0000
References: <20250602181256.529033-2-masahiroy@kernel.org>
In-Reply-To: <20250602181256.529033-2-masahiroy@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kbuild@vger.kernel.org,
 aou@eecs.berkeley.edu, agordeev@linux.ibm.com, alex@ghiti.fr,
 andreas@gaisler.com, anton.ivanov@cambridgegreys.com, bp@alien8.de,
 bcain@kernel.org, catalin.marinas@arm.com, chris@zankel.net,
 borntraeger@linux.ibm.com, christophe.leroy@csgroup.eu,
 dave.hansen@linux.intel.com, davem@davemloft.net, dinguyen@kernel.org,
 geert@linux-m68k.org, guoren@kernel.org, hpa@zytor.com, hca@linux.ibm.com,
 deller@gmx.de, chenhuacai@kernel.org, mingo@redhat.com,
 James.Bottomley@HansenPartnership.com, johannes@sipsolutions.net,
 glaubitz@physik.fu-berlin.de, jonas@southpole.se, maddy@linux.ibm.com,
 mattst88@gmail.com, jcmvbkbc@gmail.com, mpe@ellerman.id.au, monstr@monstr.eu,
 naveen@kernel.org, npiggin@gmail.com, palmer@dabbelt.com,
 paul.walmsley@sifive.com, dalias@libc.org, richard.henderson@linaro.org,
 richard@nod.at, linux@armlinux.org.uk, shorne@gmail.com,
 stefan.kristiansson@saunalahti.fi, svens@linux.ibm.com,
 tsbogend@alpha.franken.de, tglx@linutronix.de, gor@linux.ibm.com,
 vgupta@kernel.org, kernel@xen0n.name, will@kernel.org,
 ysato@users.sourceforge.jp, linux-alpha@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
 linux-hexagon@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-um@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev,
 sparclinux@vger.kernel.org, x86@kernel.org

Hello:

This patch was applied to riscv/linux.git (fixes)
by Masahiro Yamada <masahiroy@kernel.org>:

On Tue,  3 Jun 2025 03:12:54 +0900 you wrote:
> The extra-y syntax is deprecated. Instead, use always-$(KBUILD_BUILTIN),
> which behaves equivalently.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
>  arch/alpha/kernel/Makefile      | 2 +-
>  arch/arc/kernel/Makefile        | 2 +-
>  arch/arm/kernel/Makefile        | 2 +-
>  arch/arm64/kernel/Makefile      | 2 +-
>  arch/csky/kernel/Makefile       | 2 +-
>  arch/hexagon/kernel/Makefile    | 2 +-
>  arch/loongarch/kernel/Makefile  | 2 +-
>  arch/m68k/kernel/Makefile       | 2 +-
>  arch/microblaze/kernel/Makefile | 2 +-
>  arch/mips/kernel/Makefile       | 2 +-
>  arch/nios2/kernel/Makefile      | 2 +-
>  arch/openrisc/kernel/Makefile   | 2 +-
>  arch/parisc/kernel/Makefile     | 2 +-
>  arch/powerpc/kernel/Makefile    | 2 +-
>  arch/riscv/kernel/Makefile      | 2 +-
>  arch/s390/kernel/Makefile       | 2 +-
>  arch/sh/kernel/Makefile         | 2 +-
>  arch/sparc/kernel/Makefile      | 2 +-
>  arch/um/kernel/Makefile         | 2 +-
>  arch/x86/kernel/Makefile        | 2 +-
>  arch/xtensa/kernel/Makefile     | 2 +-
>  21 files changed, 21 insertions(+), 21 deletions(-)

Here is the summary with links:
  - [2/2] arch: use always-$(KBUILD_BUILTIN) for vmlinux.lds
    https://git.kernel.org/riscv/c/e21efe833eae

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


