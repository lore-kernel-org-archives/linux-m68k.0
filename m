Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA2B44A3407
	for <linux-m68k@lists.linux-m68k.org>; Wed, 23 Sep 2026 12:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.105.4.254
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790165051; cv=none; b=uEQSjSuBeIhGQofyHSboEImsrwirf8LcMAPyFE9pkD8qRH8JS3ydJGqp4zXJwoplMvv+BMimbyKH2+DWKyv6vJAEfkmxxk98nd18ZbXpnjhfgJFaUwl9Vd577WY7ulXT2fZPxyYtY44zBWw3nvk9GW7b2kwVR1yWhx1o8YKDSdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790165051; c=relaxed/simple;
	bh=O1byl75nyXgk1Xj7AS/Sdyk1a4bPSXL278xPHButlNc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IYjmpNNvDR+RsiVvDAicBZVlK+2OEzrDcJJNzdIbw2wBoI9GatR/TUcFtYrFXAgsITIB5QWBNfGC5tUQqiN3TIvsabxZNWxkPd2pJ24EzCNl/bxgZXxGIlwp7bJvRbfQlQg/mKA6Vau83qbR+pC+nx5imcMM/EijxenKtDOZ3FM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=kernel.org; arc=none smtp.client-ip=172.105.4.254
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 47378600AA;
	Wed, 23 Sep 2026 12:04:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E9611F000FF;
	Wed, 23 Sep 2026 12:04:05 +0000 (UTC)
Message-ID: <e135863e-3057-42ab-9019-bb397ef320e6@linux-m68k.org>
Date: Wed, 23 Sep 2026 22:04:06 +1000
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] m68k: Fix seccomp filtering on ColdFire and 68000
To: Christopher Lusk <clusk@northecho.dev>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Kees Cook <kees@kernel.org>, Andy Lutomirski <luto@kernel.org>,
 Will Drewry <wad@chromium.org>, Michael Schmitz <schmitzmic@gmail.com>,
 Andreas Schwab <schwab@linux-m68k.org>, linux-m68k@lists.linux-m68k.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260912230651.461269-1-clusk@northecho.dev>
 <20260913131753.605893-1-clusk@northecho.dev>
Content-Language: en-US
From: Greg Ungerer <gerg@linux-m68k.org>
In-Reply-To: <20260913131753.605893-1-clusk@northecho.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Christopher,

On 13/9/26 23:17, Christopher Lusk wrote:
> m68k selects HAVE_ARCH_SECCOMP_FILTER for all configurations, but the
> ColdFire and 68000 syscall entry paths only branch to
> syscall_trace_enter() for TIF_SYSCALL_TRACE. TIF_SECCOMP alone falls
> through to syscall dispatch, leaving installed filters ineffective.
> 
> Test the combined TIF_SYSCALL_TRACE and TIF_SECCOMP mask in both paths
> and route either flag through the existing slow path. Leave the classic
> MMU syscall entry implementation unchanged.
> 
> Validated the combined test under QEMU mcf5208evb (ColdFire): filters
> denying getpid, openat, unlinkat, and reboot each returned -EPERM. A
> classic-MMU control (q800) denied the filtered getpid syscall both before
> and after this change. The 68000 path shares the same source-level
> omission and receives the identical masked test but was not separately
> emulated. Compile-tested W=1 with CONFIG_SECCOMP_FILTER=y on both
> m5208evb_defconfig and a custom no-MMU UCSIMM configuration; the latter
> built arch/m68k/68000/entry.o and vmlinux.
> 
> Fixes: 6baaade15594 ("m68k: Add kernel seccomp support")
> Cc: stable@vger.kernel.org # v6.3+
> Suggested-by: Andreas Schwab <schwab@linux-m68k.org>
> Assisted-by: Claude:claude-opus-4-8
> Assisted-by: Codex:gpt-5.6-sol
> Signed-off-by: Christopher Lusk <clusk@northecho.dev>

Looks good, thanks for the v2. I will push this into the m68knommu git tree,
for-next branch.

Regards
Greg



> ---
> 
> Notes:
>     Changes in v2:
>     - Combine the TRACE/SECCOMP tests into a single masked branch per Andreas
>       Schwab; scoped to the ColdFire/68000 paths, classic MMU unchanged.
>     
>     No in-tree m68k defconfig selects the pure-68000/DragonBall path.
>     Compile-tested W=1 with a custom no-MMU UCSIMM configuration and
>     CONFIG_SECCOMP_FILTER=y; arch/m68k/68000/entry.o and vmlinux both built
>     successfully. The combined gate uses the same flags byte as the classic-MMU
>     entry path.
> 
>  arch/m68k/68000/entry.S    | 3 ++-
>  arch/m68k/coldfire/entry.S | 3 ++-
>  2 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/m68k/68000/entry.S b/arch/m68k/68000/entry.S
> index c257cc415..0d3cbeded 100644
> --- a/arch/m68k/68000/entry.S
> +++ b/arch/m68k/68000/entry.S
> @@ -79,7 +79,8 @@ ENTRY(system_call)
>  
>  	/* Doing a trace ? */
>  	getthreadinfo
> -	btst	#(TIF_SYSCALL_TRACE%8),%a2@(TINFO_FLAGS+(31-TIF_SYSCALL_TRACE)/8)
> +	moveb	%a2@(TINFO_FLAGS+2),%d1
> +	andl	#((_TIF_SYSCALL_TRACE + _TIF_SECCOMP) >> 8),%d1
>  	jne	do_trace
>  	cmpl	#NR_syscalls,%d0
>  	jcc	badsys
> diff --git a/arch/m68k/coldfire/entry.S b/arch/m68k/coldfire/entry.S
> index 4ea08336e..d658abdc5 100644
> --- a/arch/m68k/coldfire/entry.S
> +++ b/arch/m68k/coldfire/entry.S
> @@ -72,7 +72,8 @@ ENTRY(system_call)
>  	movel	%d2,%a0
>  	movel	%a0@,%a1		/* save top of frame */
>  	movel	%sp,%a1@(TASK_THREAD+THREAD_ESP0)
> -	btst	#(TIF_SYSCALL_TRACE%8),%a0@(TINFO_FLAGS+(31-TIF_SYSCALL_TRACE)/8)
> +	moveb	%a0@(TINFO_FLAGS+2),%d2
> +	andl	#((_TIF_SYSCALL_TRACE + _TIF_SECCOMP) >> 8),%d2
>  	bnes	1f
>  
>  	movel	%d3,%a0

