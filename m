Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 471821DE2BD
	for <linux-m68k@lists.linux-m68k.org>; Thu,  9 Oct 2025 01:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.105.4.254
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759972041; cv=none; b=eff1wy2g/AFOa4y2Kslo7OpnzRHwKTlbkPdid5YEP/H95xm+Hdglib9QY7YZxsatbPKbqRe+9yy2Tgpp20iBNLKk9gRmGk+Cgvb+fN/lWpx6QVs/Gnr/8qt7FeE/wItINiy1z+nm/jp7W3ezYv6JqkwZrPBN20a7A7U8C38FOns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759972041; c=relaxed/simple;
	bh=uICwW+7JjdNTrdwYOThDjo78WSe40MG6kD2tcS8UCr0=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=CiaIGgUnAmffkoXEXCuhx5yYEqB8GfGwMeB8pgliwHawj8m9mdN3dVM4iH2C42V+nCNdpti96o8/8l1UodiNNtnkVd4HXUHRAeKeEW2kzwVfl56yp5o+vW61PPrZav0pEOKlbG9sH7NsyHPGHsML5IibwOIZZuot1AdQyNdqafE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cq+QIuaS; arc=none smtp.client-ip=172.105.4.254
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cq+QIuaS"
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E0B6E62139;
	Thu,  9 Oct 2025 01:07:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90DF0C4CEE7;
	Thu,  9 Oct 2025 01:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759972036;
	bh=uICwW+7JjdNTrdwYOThDjo78WSe40MG6kD2tcS8UCr0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Cq+QIuaSsbZ85Bye4hA95eTz3hsHytAX1GTFc9YGto55OBTrhSQts03gyTHo2eSvn
	 rNgYrFWU2souedJNKH6yF6ZCWEwY8jrNexNaitylW4ivlHpWVjhbYCAMV/nCTZ0CtL
	 oShIr9D42WzY/SRFilbT1mqkl6x9++jWyPnFwByoyG/Cut3jUlY64GzGWuzLpebMQz
	 w6uj0kRrCETVOXtVAqrz1jAM7/GJQA5bYn5s7PAlvZCkQNO3eOD7pPdDsew6svVkaE
	 TtclXcV4dI7gawm5GYhlHGNy+cRg3zhyB0uCj+rKzY1KwQUV3/WZTj4Wp3vrhYv/Dt
	 LmzPOKnu/WrKQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33DE73A41017;
	Thu,  9 Oct 2025 01:07:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 00/17] Add __attribute_const__ to ffs()-family
 implementations
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <175997202477.3661959.16005423815156173105.git-patchwork-notify@kernel.org>
Date: Thu, 09 Oct 2025 01:07:04 +0000
References: <20250804163910.work.929-kees@kernel.org>
In-Reply-To: <20250804163910.work.929-kees@kernel.org>
To: Kees Cook <kees@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org,
 linux-kernel@vger.kernel.org, x86@kernel.org, linux-alpha@vger.kernel.org,
 linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, llvm@lists.linux.dev,
 linux-hardening@vger.kernel.org

Hello:

This series was applied to riscv/linux.git (for-next)
by Kees Cook <kees@kernel.org>:

On Mon,  4 Aug 2025 09:43:56 -0700 you wrote:
> Hi,
> 
> While tracking down a problem where constant expressions used by
> BUILD_BUG_ON() suddenly stopped working[1], we found that an added static
> initializer was convincing the compiler that it couldn't track the state
> of the prior statically initialized value. Tracing this down found that
> ffs() was used in the initializer macro, but since it wasn't marked with
> __attribute_const__, the compiler had to assume the function might
> change variable states as a side-effect (which is not true for ffs(),
> which provides deterministic math results).
> 
> [...]

Here is the summary with links:
  - [01/17] KUnit: Introduce ffs()-family tests
    (no matching commit)
  - [02/17] bitops: Add __attribute_const__ to generic ffs()-family implementations
    (no matching commit)
  - [03/17] csky: Add __attribute_const__ to ffs()-family implementations
    (no matching commit)
  - [04/17] x86: Add __attribute_const__ to ffs()-family implementations
    (no matching commit)
  - [05/17] powerpc: Add __attribute_const__ to ffs()-family implementations
    (no matching commit)
  - [06/17] sh: Add __attribute_const__ to ffs()-family implementations
    (no matching commit)
  - [07/17] alpha: Add __attribute_const__ to ffs()-family implementations
    (no matching commit)
  - [08/17] hexagon: Add __attribute_const__ to ffs()-family implementations
    (no matching commit)
  - [09/17] riscv: Add __attribute_const__ to ffs()-family implementations
    https://git.kernel.org/riscv/c/c51c26e687a6
  - [10/17] openrisc: Add __attribute_const__ to ffs()-family implementations
    (no matching commit)
  - [11/17] m68k: Add __attribute_const__ to ffs()-family implementations
    (no matching commit)
  - [12/17] mips: Add __attribute_const__ to ffs()-family implementations
    (no matching commit)
  - [13/17] parisc: Add __attribute_const__ to ffs()-family implementations
    (no matching commit)
  - [14/17] s390: Add __attribute_const__ to ffs()-family implementations
    (no matching commit)
  - [15/17] xtensa: Add __attribute_const__ to ffs()-family implementations
    (no matching commit)
  - [16/17] sparc: Add __attribute_const__ to ffs()-family implementations
    (no matching commit)
  - [17/17] KUnit: ffs: Validate all the __attribute_const__ annotations
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


