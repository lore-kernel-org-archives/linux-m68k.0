Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795015638;
	b=bj5Rv5+xlhsE4qjvIfbfouSbACyf1/Q2QyacZqtaP78clFhhp5CWlP088A40YZhHOemX
	 Fz4urTip+LUT88P6shfQrTwc1TN3kzpujw+eKd86fbzdDhqkMBcIiO4gwz4hkM6a2BUaQ
	 AZuY2oXxpTZT4rUDGevYtNp8Cxby5d8IhSMwKaBzcegRnjSWwANfyg+H9HKdhE7+RdJFh
	 HlnTukMGrPOPXPeZjfpODSRfjdUh+FoeumdpZjVOOoM3mCcbeT0mFvYgxH8gpuIESYpsY
	 KvZQXLon7x6Kdpz8i6wlMevLIslK51pN0FyLO971VZq/TBK1upFExc1XvRgjEtBsUGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795015638;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=mFk9ffEQwfi5l0PZTUOqT9PZyrNzQzcNlty4a9EpoYo=;
	b=IUG1qpJ2KPOldYIOYSksN2v815c73eFuRjMXrQHSYwscsWR+5feuWElV8MibroJBjRfV
	 J4Gd0zF+pkR714KBbu+TQV12hQcXZyJU1jhUumQ8dhPOMkUbQodJb9JNxui+NpHrVpL+9
	 iH4KfJvBPnbg71GpmcV0G1o12L1a9w+qGyqh5sBq/3GZIGuy7kwXMjfZUFh59Y+BiddzV
	 gYlWeuy2TIcGN55O5V1qYM4XCNM0ET8j3lPFl8L8R3n6RjKD40duJjzDGI/R5ZzEzvVdL
	 wLvvCu9H+RnlZfnn5ajhAgxSVRPA7kgzU+WFGvLcCBPuZEEkCIo/BGn35rAcoLyrBQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Fq1TxK6f;
	arc=none smtp.remote-ip=209.85.161.49
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3909A606A336
	for <linux-m68k@lists.linux-m68k.org>; Wed, 18 Nov 2026 15:27:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3909A606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Fq1TxK6f
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-6e560e00a86so704267eaf.1
        for <linux-m68k@lists.linux-m68k.org>; Wed, 18 Nov 2026 07:27:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795015635; x=1795620435; darn=lists.linux-m68k.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mFk9ffEQwfi5l0PZTUOqT9PZyrNzQzcNlty4a9EpoYo=;
        b=Fq1TxK6fMdbpMSGOupUw9rR8PF17MwDWjS2X+x3oJt5gx2u4wall6OzZLQiTmydPWl
         L+ua0rtaoOm3JwG6o4Y/fnGghWfp7s0ZCuadyVKFdbW8uo2jQRkTRUGraRC7lE3fCfIt
         MNKIkFn3ESN/aor5sQazV6XDe9j8y0BSZvyA2kL8epFSO/A+KqXPv2tCvBtjcexzrr66
         8f1Z1jKrSCG5twnPf5cRRoVE5Sl16CBobBRFf68vdRXcEQCTTD0ESVubzws0lGkIKAbv
         U6EuDRVjeviNStjMcWmHmEyQg+7fJ9Mgh9lN39tckCni6MVKM4QuGKOFXYEEr4GVXbT6
         iWAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795015635; x=1795620435;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mFk9ffEQwfi5l0PZTUOqT9PZyrNzQzcNlty4a9EpoYo=;
        b=ogELF23/cL0enndXUgwI8uFqBqj3cWyYHy8XhUCTWhtY453MGq6aghRxzR4gz2PjyI
         KAsk4VJDNI3a6JEKPohoPQpYkVb+M2wSnmo4f5htvpR3KW2Ur/qizQGllqHgXljBytq4
         tqzKMqZCVUFe2zzL7XSzfRd3QcNJqQkOGRsTjnS+Qr1900rQgvKl9RLcMzm/H57qM7co
         QKFGOrlSYmlwvBzO1uwySrVq3tIPzdytxOM/MycNDSaph6SnOSA16xtI7wJk6LorA+Di
         ioq2n8mB6Cc+mogpLNrXb3WVdTA7ASoS/3wTyB84Y/XkAs6C1yUUs4Zw6KIJiMdZB229
         RS+Q==
X-Forwarded-Encrypted: i=1; AL+hErE0uMkSVgqw11uqCUgIb36/YmugpR6uneNgxocypCYR5qnEGSwGkU+9tfC9iylG9/QgrWSK5pAKXEfE@lists.linux-m68k.org
X-Gm-Message-State: APuU4Z9rO+0s0KaH7fHeYYJ2PFkurqkR0ZJ+mvAU3dkcO2KMwYNe0JsH
	b4wW9//pCyICVdybObKeH0GqwQLCBao0XyOKsFsDUEEJGfW5Ok2ZCP7o
X-Gm-Gg: AYBFou1LJPrzWElXvsWnWWsHjzQp4Ra1W8ah82Fy54hT1JVOytU002zyc3wd5FIGApC
	4ZYFE0X/EnBqrqBGrIiTXebhmdTGuLbOHvStVVYgqK2N4pdgynbtHXGdVjUDHBXeCl0ZLfgVn4r
	Z/OfGmrH1ViLfsxA/+baHAZYc3gEwLD/dWuJG6Yid746pfeBiMclOofc/846USI9Vr50Oqfgqnn
	AJbStTVuUyf9SGM5Bp2PYECH1ulaEMqoPLek4bBxmFhNsN6uKgMKZ0sv0/FBqoCVj8mr5e4DxXy
	BFcG/cScUaPdFPco4EOKocW+lwtCNTfDkT7yPvvjUON1p4EUMb4i3gexxif+OCksR05AW4+/m8g
	e33wXhTzzRiGF+9VmjzSIvLqepw3YTm9YV232wJEoZLmB+la27XfFIEU//SAt3y6G5u/a0lkDy4
	Ntz7oLxIFYfYa/9aku20b7kTDu9NUCET64vrnfQZuRQuOKZJJbMR0YP7BQLtgLdLTk9ntDzPEcs
	qwGt/nMmriYv7S8LADraruUWVUaFr1lDva1agvWqZvkiiJzu/emp/e4tZg42SsTImPuNDKjex4X
	gdvaRnYd4Ql/TeeJCRqb0mc6siXtyJvb66x8fCNT/FAM3rWA2As=
X-Received: by 2002:a05:6820:a744:10b0:71a:ee95:bfe5 with SMTP id 006d021491bc7-71b18476d1emr1520821eaf.26.1795015634576;
        Wed, 18 Nov 2026 07:27:14 -0800 (PST)
Received: from google.com ([118.150.148.19])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-862f024e1b1sm2226796a34.25.2026.11.18.07.27.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 07:27:14 -0800 (PST)
Date: Wed, 18 Nov 2026 23:27:06 +0800
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: corbet@lwn.net, geert@linux-m68k.org, ast@kernel.org,
	daniel@iogearbox.net, andrii@kernel.org, eddyz87@gmail.com,
	memxor@gmail.com, gerg@linux-m68k.org
Cc: skhan@linuxfoundation.org, rdunlap@infradead.org, martin.lau@linux.dev,
	song@kernel.org, yonghong.song@linux.dev, jolsa@kernel.org,
	emil@etsalapatis.com, ihor.solodrai@linux.dev, marscheng@google.com,
	eleanor15x@gmail.com, jserv@ccns.ncku.edu.tw,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org, bpf@vger.kernel.org,
	Daniel Palmer <daniel@thingy.jp>
Subject: Re: [PATCH] m68k, bpf: Add initial BPF JIT compiler support
Message-ID: <av3DyuPwR6BFH-5t@google.com>
References: <20261118152054.999990-1-visitorckw@gmail.com>
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261118152054.999990-1-visitorckw@gmail.com>

On Wed, Nov 18, 2026 at 03:20:54PM +0000, Kuan-Wei Chiu wrote:
> Add a BPF JIT compiler for the m68k architecture.
> 
> The JIT generates m68k machine code targeting m68020+ processors and
> coldfire parts with an mmu (ISA_B/ISA_C). It excludes plain 68000/68010
> and non-mmu coldfire processors, as it relies on 32-bit branch
> displacements (b<cc>.l) to handle large bpf programs.
> 
> Tested with bpf selftests jit_insns and jit_insns_blinded, excluding
> 64 bit, kfunc, and bpf subprogram call subtests:
> Summary: 2/41 PASSED, 0 SKIPPED, 0/0 FAILED
> 
> Tested-by: Daniel Palmer <daniel@thingy.jp>
> Co-developed-by: Greg Ungerer <gerg@linux-m68k.org>
> Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>
> Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
> ---
> Changes in v11:
> - Move the tail call counter decrement after the NULL prog check in
> emit_tail_call().
> - Reject subprograms upfront in bpf_int_jit_compile() via prog->is_func

Ah I forgot to mark the patch as v11.
Sorry about that.

Regards,
Kuan-Wei

> 
>  .../features/core/eBPF-JIT/arch-support.txt   |    2 +-
>  MAINTAINERS                                   |    6 +
>  arch/m68k/Kbuild                              |    2 +-
>  arch/m68k/Kconfig                             |    1 +
>  arch/m68k/net/Makefile                        |    2 +
>  arch/m68k/net/bpf_jit_comp.c                  | 1752 +++++++++++++++++
>  6 files changed, 1763 insertions(+), 2 deletions(-)
>  create mode 100644 arch/m68k/net/Makefile
>  create mode 100644 arch/m68k/net/bpf_jit_comp.c
> 
> diff --git a/Documentation/features/core/eBPF-JIT/arch-support.txt b/Documentation/features/core/eBPF-JIT/arch-support.txt
> index 83f77f55fc87..dacb50aef055 100644
> --- a/Documentation/features/core/eBPF-JIT/arch-support.txt
> +++ b/Documentation/features/core/eBPF-JIT/arch-support.txt
> @@ -13,7 +13,7 @@
>      |        csky: | TODO |
>      |     hexagon: | TODO |
>      |   loongarch: |  ok  |
> -    |        m68k: | TODO |
> +    |        m68k: |  ok  |
>      |  microblaze: | TODO |
>      |        mips: |  ok  |
>      |       nios2: | TODO |
> diff --git a/MAINTAINERS b/MAINTAINERS
> index d738990161bd..bf5ded204037 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -4997,6 +4997,12 @@ L:	bpf@vger.kernel.org
>  S:	Maintained
>  F:	arch/loongarch/net/
>  
> +BPF JIT for M68K
> +M:	Kuan-Wei Chiu <visitorckw@gmail.com>
> +L:	bpf@vger.kernel.org
> +S:	Maintained
> +F:	arch/m68k/net/
> +
>  BPF JIT for MIPS (32-BIT AND 64-BIT)
>  M:	Johan Almbladh <johan.almbladh@anyfinetworks.com>
>  M:	Paul Burton <paulburton@kernel.org>
> diff --git a/arch/m68k/Kbuild b/arch/m68k/Kbuild
> index 7762af9f6def..058ad41a728c 100644
> --- a/arch/m68k/Kbuild
> +++ b/arch/m68k/Kbuild
> @@ -1,5 +1,5 @@
>  # SPDX-License-Identifier: GPL-2.0-only
> -obj-y				+= kernel/ mm/
> +obj-y				+= kernel/ mm/ net/
>  obj-$(CONFIG_Q40)		+= q40/
>  obj-$(CONFIG_AMIGA)		+= amiga/
>  obj-$(CONFIG_ATARI)		+= atari/
> diff --git a/arch/m68k/Kconfig b/arch/m68k/Kconfig
> index eb84c3af92c0..b403a1b5c9ff 100644
> --- a/arch/m68k/Kconfig
> +++ b/arch/m68k/Kconfig
> @@ -32,6 +32,7 @@ config M68K
>  	select HAVE_ARCH_TLB_REMOVE_TABLE if MMU_MOTOROLA
>  	select HAVE_ASM_MODVERSIONS
>  	select HAVE_DEBUG_BUGVERBOSE
> +	select HAVE_EBPF_JIT if MMU
>  	select HAVE_EFFICIENT_UNALIGNED_ACCESS if !CPU_HAS_NO_UNALIGNED
>  	select HAVE_LD_DEAD_CODE_DATA_ELIMINATION
>  	select HAVE_MOD_ARCH_SPECIFIC
> diff --git a/arch/m68k/net/Makefile b/arch/m68k/net/Makefile
> new file mode 100644
> index 000000000000..ec5b14763316
> --- /dev/null
> +++ b/arch/m68k/net/Makefile
> @@ -0,0 +1,2 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +obj-$(CONFIG_BPF_JIT) += bpf_jit_comp.o
> diff --git a/arch/m68k/net/bpf_jit_comp.c b/arch/m68k/net/bpf_jit_comp.c
> new file mode 100644
> index 000000000000..bf95d03ebb20
> --- /dev/null
> +++ b/arch/m68k/net/bpf_jit_comp.c
> @@ -0,0 +1,1752 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * BPF JIT compiler for m68k
> + *
> + * Copyright (C) 2026 Kuan-Wei Chiu <visitorckw@gmail.com>
> + */
> +
> +#include <linux/bpf.h>
> +#include <linux/filter.h>
> +#include <linux/irqflags.h>
> +#include <linux/slab.h>
> +#include <asm/cacheflush.h>
> +#include <linux/math64.h>
> +#include <linux/limits.h>
> +
> +#define STACK_OFFSET(k) (-4 - (4 * (k)))
> +
> +enum {
> +	BPF_R1_HI, BPF_R1_LO,
> +	BPF_R2_HI, BPF_R2_LO,
> +	BPF_R3_HI, BPF_R3_LO,
> +	BPF_R4_HI, BPF_R4_LO,
> +	BPF_R5_HI, BPF_R5_LO,
> +	BPF_R6_HI, BPF_R6_LO,
> +	BPF_R7_HI, BPF_R7_LO,
> +	BPF_R8_HI, BPF_R8_LO,
> +	BPF_R9_HI, BPF_R9_LO,
> +	BPF_R10_HI, BPF_R10_LO,
> +	BPF_AX_HI, BPF_AX_LO,
> +	BPF_TC_HI, BPF_TC_LO,
> +	BPF_JIT_SCRATCH_REGS,
> +};
> +
> +#define SCRATCH_SIZE (BPF_JIT_SCRATCH_REGS * 4)
> +
> +#define TMP_REG_1 14
> +#define TMP_REG_2 15
> +
> +#define M68K_D0 0
> +#define M68K_D1 1
> +#define M68K_D2 2
> +#define M68K_D3 3
> +#define M68K_D4 4
> +#define M68K_D5 5
> +
> +static const s8 bpf2m68k[16][2] = {
> +	[BPF_REG_0]  = {M68K_D1, M68K_D0},
> +	[BPF_REG_1]  = {STACK_OFFSET(BPF_R1_HI),  STACK_OFFSET(BPF_R1_LO)},
> +	[BPF_REG_2]  = {STACK_OFFSET(BPF_R2_HI),  STACK_OFFSET(BPF_R2_LO)},
> +	[BPF_REG_3]  = {STACK_OFFSET(BPF_R3_HI),  STACK_OFFSET(BPF_R3_LO)},
> +	[BPF_REG_4]  = {STACK_OFFSET(BPF_R4_HI),  STACK_OFFSET(BPF_R4_LO)},
> +	[BPF_REG_5]  = {STACK_OFFSET(BPF_R5_HI),  STACK_OFFSET(BPF_R5_LO)},
> +	[BPF_REG_6]  = {STACK_OFFSET(BPF_R6_HI),  STACK_OFFSET(BPF_R6_LO)},
> +	[BPF_REG_7]  = {STACK_OFFSET(BPF_R7_HI),  STACK_OFFSET(BPF_R7_LO)},
> +	[BPF_REG_8]  = {STACK_OFFSET(BPF_R8_HI),  STACK_OFFSET(BPF_R8_LO)},
> +	[BPF_REG_9]  = {STACK_OFFSET(BPF_R9_HI),  STACK_OFFSET(BPF_R9_LO)},
> +	[BPF_REG_10] = {STACK_OFFSET(BPF_R10_HI), STACK_OFFSET(BPF_R10_LO)},
> +	[BPF_REG_AX] = {STACK_OFFSET(BPF_AX_HI),  STACK_OFFSET(BPF_AX_LO)},
> +	[TMP_REG_1]  = {M68K_D3, M68K_D2},
> +	[TMP_REG_2]  = {M68K_D5, M68K_D4},
> +};
> +
> +struct jit_ctx {
> +	const struct bpf_prog *prog;
> +	u16 *target;
> +	unsigned int idx;
> +	int *offsets;
> +};
> +
> +static noinline u32 jit_mul32(u32 a, u32 b)
> +{
> +	return a * b;
> +}
> +
> +static noinline u32 jit_div32(u32 a, u32 b)
> +{
> +	return b ? a / b : 0;
> +}
> +
> +static noinline u32 jit_mod32(u32 a, u32 b)
> +{
> +	return b ? a % b : a;
> +}
> +
> +static noinline s32 jit_sdiv32(s32 a, s32 b)
> +{
> +	if (b == 0)
> +		return 0;
> +	if (a == S32_MIN && b == -1)
> +		return S32_MIN;
> +	return a / b;
> +}
> +
> +static noinline s32 jit_smod32(s32 a, s32 b)
> +{
> +	if (b == 0)
> +		return a;
> +	if (a == S32_MIN && b == -1)
> +		return 0;
> +	return a % b;
> +}
> +
> +static noinline u64 jit_mul64(u64 a, u64 b)
> +{
> +	return a * b;
> +}
> +
> +static noinline u64 jit_div64(u64 a, u64 b)
> +{
> +	return b ? div64_u64(a, b) : 0;
> +}
> +
> +static noinline s64 jit_sdiv64(s64 a, s64 b)
> +{
> +	if (b == 0)
> +		return 0;
> +	if (a == S64_MIN && b == -1)
> +		return S64_MIN;
> +	return div64_s64(a, b);
> +}
> +
> +static noinline u64 jit_mod64(u64 a, u64 b)
> +{
> +	u64 rem;
> +
> +	if (b == 0)
> +		return a;
> +	div64_u64_rem(a, b, &rem);
> +	return rem;
> +}
> +
> +static noinline s64 jit_smod64(s64 a, s64 b)
> +{
> +	if (b == 0)
> +		return a;
> +	if (a == S64_MIN && b == -1)
> +		return 0;
> +	return a - div64_s64(a, b) * b;
> +}
> +
> +static u32 jit_atomic32(u32 *ptr, u32 val, u32 op, u32 cmp)
> +{
> +	unsigned long flags;
> +	u32 old;
> +
> +	local_irq_save(flags);
> +	old = *ptr;
> +	switch (op) {
> +	case BPF_ADD:
> +	case BPF_ADD | BPF_FETCH:
> +		*ptr += val;
> +		break;
> +	case BPF_AND:
> +	case BPF_AND | BPF_FETCH:
> +		*ptr &= val;
> +		break;
> +	case BPF_OR:
> +	case BPF_OR | BPF_FETCH:
> +		*ptr |= val;
> +		break;
> +	case BPF_XOR:
> +	case BPF_XOR | BPF_FETCH:
> +		*ptr ^= val;
> +		break;
> +	case BPF_XCHG:
> +		*ptr = val;
> +		break;
> +	case BPF_CMPXCHG:
> +		if (old == cmp)
> +			*ptr = val;
> +		break;
> +	}
> +	local_irq_restore(flags);
> +
> +	return old;
> +}
> +
> +static u64 jit_atomic64(u32 *ptr, u32 val_hi, u32 val_lo, u32 op, u32 cmp_hi, u32 cmp_lo)
> +{
> +	unsigned long flags;
> +	u64 old, val, cmp;
> +	u64 *ptr64 = (u64 *)ptr;
> +
> +	val = ((u64)val_hi << 32) | val_lo;
> +	cmp = ((u64)cmp_hi << 32) | cmp_lo;
> +
> +	local_irq_save(flags);
> +	old = *ptr64;
> +	switch (op) {
> +	case BPF_ADD:
> +	case BPF_ADD | BPF_FETCH:
> +		*ptr64 += val;
> +		break;
> +	case BPF_AND:
> +	case BPF_AND | BPF_FETCH:
> +		*ptr64 &= val;
> +		break;
> +	case BPF_OR:
> +	case BPF_OR | BPF_FETCH:
> +		*ptr64 |= val;
> +		break;
> +	case BPF_XOR:
> +	case BPF_XOR | BPF_FETCH:
> +		*ptr64 ^= val;
> +		break;
> +	case BPF_XCHG:
> +		*ptr64 = val;
> +		break;
> +	case BPF_CMPXCHG:
> +		if (old == cmp)
> +			*ptr64 = val;
> +		break;
> +	}
> +	local_irq_restore(flags);
> +
> +	return old;
> +}
> +
> +static inline void emit_16(struct jit_ctx *ctx, u16 inst)
> +{
> +	if (ctx->target)
> +		ctx->target[ctx->idx] = inst;
> +	ctx->idx++;
> +}
> +
> +static inline void emit_32(struct jit_ctx *ctx, u32 val)
> +{
> +	emit_16(ctx, val >> 16);
> +	emit_16(ctx, val & 0xffff);
> +}
> +
> +static inline bool is_stacked(s8 reg)
> +{
> +	return reg < 0;
> +}
> +
> +static s8 bpf_get_reg32(s8 bpf_reg, s8 tmp_reg, struct jit_ctx *ctx)
> +{
> +	if (is_stacked(bpf_reg)) {
> +		emit_16(ctx, 0x202e | (tmp_reg << 9));		/* move.l d16(%fp), reg */
> +		emit_16(ctx, (u16)bpf_reg);
> +		return tmp_reg;
> +	}
> +	return bpf_reg;
> +}
> +
> +static void bpf_put_reg32(s8 bpf_reg, s8 src_reg, struct jit_ctx *ctx)
> +{
> +	if (is_stacked(bpf_reg)) {
> +		emit_16(ctx, 0x2d40 | src_reg);			/* move.l reg, d16(%fp) */
> +		emit_16(ctx, (u16)bpf_reg);
> +	} else if (bpf_reg != src_reg) {
> +		emit_16(ctx, 0x2000 | (bpf_reg << 9) | src_reg); /* move.l src, dst */
> +	}
> +}
> +
> +static void emit_alu32_neg(const struct bpf_insn *insn, struct jit_ctx *ctx)
> +{
> +	const s8 *dst = bpf2m68k[insn->dst_reg];
> +	const s8 *tmp1 = bpf2m68k[TMP_REG_1];
> +	s8 d_reg = bpf_get_reg32(dst[1], tmp1[1], ctx);
> +
> +	emit_16(ctx, 0x4480 | d_reg);				/* neg.l d_reg */
> +
> +	bpf_put_reg32(dst[1], d_reg, ctx);
> +	emit_16(ctx, 0x7000 | (tmp1[0] << 9));			/* moveq #0, tmp1 */
> +	bpf_put_reg32(dst[0], tmp1[0], ctx);
> +}
> +
> +static void emit_alu64_neg(const struct bpf_insn *insn, struct jit_ctx *ctx)
> +{
> +	const s8 *dst = bpf2m68k[insn->dst_reg];
> +	const s8 *tmp1 = bpf2m68k[TMP_REG_1];
> +	s8 d_lo = bpf_get_reg32(dst[1], tmp1[1], ctx);
> +	s8 d_hi = bpf_get_reg32(dst[0], tmp1[0], ctx);
> +
> +	emit_16(ctx, 0x4480 | d_lo);				/* neg.l d_lo */
> +	emit_16(ctx, 0x4080 | d_hi);				/* negx.l d_hi */
> +
> +	bpf_put_reg32(dst[1], d_lo, ctx);
> +	bpf_put_reg32(dst[0], d_hi, ctx);
> +}
> +
> +static void emit_alu32_x(const struct bpf_insn *insn, struct jit_ctx *ctx)
> +{
> +	const s8 *dst = bpf2m68k[insn->dst_reg];
> +	const s8 *src = bpf2m68k[insn->src_reg];
> +	const s8 *tmp1 = bpf2m68k[TMP_REG_1];
> +	const s8 *tmp2 = bpf2m68k[TMP_REG_2];
> +	s8 d_reg, s_reg;
> +
> +	d_reg = bpf_get_reg32(dst[1], tmp1[1], ctx);
> +	s_reg = bpf_get_reg32(src[1], tmp2[1], ctx);
> +
> +	switch (BPF_OP(insn->code)) {
> +	case BPF_MOV:
> +		if (insn->off == 8 || insn->off == 16) {
> +			if (d_reg != s_reg)
> +				emit_16(ctx, 0x2000 | (d_reg << 9) | s_reg); /* move.l src, dst */
> +			if (insn->off == 8)
> +				emit_16(ctx, 0x49c0 | d_reg);	/* extb.l d_reg */
> +			else
> +				emit_16(ctx, 0x48c0 | d_reg);	/* ext.l d_reg */
> +		} else {
> +			if (d_reg != s_reg)
> +				emit_16(ctx, 0x2000 | (d_reg << 9) | s_reg); /* move.l src, dst */
> +		}
> +		break;
> +	case BPF_ADD:
> +		emit_16(ctx, 0xd080 | (d_reg << 9) | s_reg);	/* add.l src, dst */
> +		break;
> +	case BPF_SUB:
> +		emit_16(ctx, 0x9080 | (d_reg << 9) | s_reg);	/* sub.l src, dst */
> +		break;
> +	case BPF_AND:
> +		emit_16(ctx, 0xc080 | (d_reg << 9) | s_reg);	/* and.l src, dst */
> +		break;
> +	case BPF_OR:
> +		emit_16(ctx, 0x8080 | (d_reg << 9) | s_reg);	/* or.l src, dst */
> +		break;
> +	case BPF_XOR:
> +		emit_16(ctx, 0xb180 | (s_reg << 9) | d_reg);	/* eor.l src, dst */
> +		break;
> +	case BPF_LSH:
> +	case BPF_RSH:
> +	case BPF_ARSH: {
> +		s8 count_reg = tmp2[1];
> +
> +		if (s_reg != count_reg)
> +			emit_16(ctx, 0x2000 | (count_reg << 9) | s_reg); /* move.l src, count */
> +
> +		emit_16(ctx, 0x0280 | count_reg);		/* andi.l #imm, count */
> +		emit_32(ctx, 0x1f);
> +
> +		if (BPF_OP(insn->code) == BPF_LSH)
> +			emit_16(ctx, 0xe1a8 | (count_reg << 9) | d_reg); /* lsl.l count, dst */
> +		else if (BPF_OP(insn->code) == BPF_RSH)
> +			emit_16(ctx, 0xe0a8 | (count_reg << 9) | d_reg); /* lsr.l count, dst */
> +		else
> +			emit_16(ctx, 0xe0a0 | (count_reg << 9) | d_reg); /* asr.l count, dst */
> +		break;
> +	}
> +	}
> +
> +	bpf_put_reg32(dst[1], d_reg, ctx);
> +	emit_16(ctx, 0x7000 | (tmp1[0] << 9));			/* moveq #0, tmp1 */
> +	bpf_put_reg32(dst[0], tmp1[0], ctx);
> +}
> +
> +static void emit_alu32_k(const struct bpf_insn *insn, struct jit_ctx *ctx)
> +{
> +	const s8 *dst = bpf2m68k[insn->dst_reg];
> +	const s8 *tmp1 = bpf2m68k[TMP_REG_1];
> +	const s8 *tmp2 = bpf2m68k[TMP_REG_2];
> +	s8 d_reg;
> +	s32 imm = insn->imm;
> +	bool is_moveq = (imm >= -128 && imm <= 127);
> +
> +	d_reg = bpf_get_reg32(dst[1], tmp1[1], ctx);
> +
> +	switch (BPF_OP(insn->code)) {
> +	case BPF_MOV:
> +		if (is_moveq) {
> +			emit_16(ctx, 0x7000 | (d_reg << 9) | (imm & 0xff)); /* moveq #imm, dst */
> +		} else {
> +			emit_16(ctx, 0x203c | (d_reg << 9));		/* move.l #imm, dst */
> +			emit_32(ctx, imm);
> +		}
> +		break;
> +	case BPF_ADD:
> +		if (is_moveq) {
> +			emit_16(ctx, 0x7000 | (tmp2[1] << 9) | (imm & 0xff)); /* moveq #imm, tmp2 */
> +			emit_16(ctx, 0xd080 | (d_reg << 9) | tmp2[1]);	/* add.l tmp2, dst */
> +		} else {
> +			emit_16(ctx, 0x0680 | d_reg);			/* addi.l #imm, dst */
> +			emit_32(ctx, imm);
> +		}
> +		break;
> +	case BPF_SUB:
> +		if (is_moveq) {
> +			emit_16(ctx, 0x7000 | (tmp2[1] << 9) | (imm & 0xff)); /* moveq #imm, tmp2 */
> +			emit_16(ctx, 0x9080 | (d_reg << 9) | tmp2[1]);	/* sub.l tmp2, dst */
> +		} else {
> +			emit_16(ctx, 0x0480 | d_reg);			/* subi.l #imm, dst */
> +			emit_32(ctx, imm);
> +		}
> +		break;
> +	case BPF_AND:
> +		if (is_moveq) {
> +			emit_16(ctx, 0x7000 | (tmp2[1] << 9) | (imm & 0xff)); /* moveq #imm, tmp2 */
> +			emit_16(ctx, 0xc080 | (d_reg << 9) | tmp2[1]);	/* and.l tmp2, dst */
> +		} else {
> +			emit_16(ctx, 0x0280 | d_reg);			/* andi.l #imm, dst */
> +			emit_32(ctx, imm);
> +		}
> +		break;
> +	case BPF_OR:
> +		if (is_moveq) {
> +			emit_16(ctx, 0x7000 | (tmp2[1] << 9) | (imm & 0xff)); /* moveq #imm, tmp2 */
> +			emit_16(ctx, 0x8080 | (d_reg << 9) | tmp2[1]);	/* or.l tmp2, dst */
> +		} else {
> +			emit_16(ctx, 0x0080 | d_reg);			/* ori.l #imm, dst */
> +			emit_32(ctx, imm);
> +		}
> +		break;
> +	case BPF_XOR:
> +		if (is_moveq) {
> +			emit_16(ctx, 0x7000 | (tmp2[1] << 9) | (imm & 0xff)); /* moveq #imm, tmp2 */
> +			emit_16(ctx, 0xb180 | (tmp2[1] << 9) | d_reg);	/* eor.l tmp2, dst */
> +		} else {
> +			emit_16(ctx, 0x0a80 | d_reg);			/* eori.l #imm, dst */
> +			emit_32(ctx, imm);
> +		}
> +		break;
> +	case BPF_LSH:
> +	case BPF_RSH:
> +	case BPF_ARSH:
> +		emit_16(ctx, 0x7000 | (tmp2[1] << 9) | (imm & 0x1f));	/* moveq #imm, count */
> +
> +		if (BPF_OP(insn->code) == BPF_LSH)
> +			emit_16(ctx, 0xe1a8 | (tmp2[1] << 9) | d_reg);	/* lsl.l count, dst */
> +		else if (BPF_OP(insn->code) == BPF_RSH)
> +			emit_16(ctx, 0xe0a8 | (tmp2[1] << 9) | d_reg);	/* lsr.l count, dst */
> +		else
> +			emit_16(ctx, 0xe0a0 | (tmp2[1] << 9) | d_reg);	/* asr.l count, dst */
> +		break;
> +	}
> +
> +	bpf_put_reg32(dst[1], d_reg, ctx);
> +	emit_16(ctx, 0x7000 | (tmp1[0] << 9));				/* moveq #0, tmp1 */
> +	bpf_put_reg32(dst[0], tmp1[0], ctx);
> +}
> +
> +static void emit_alu64_x(const struct bpf_insn *insn, struct jit_ctx *ctx)
> +{
> +	const s8 *dst = bpf2m68k[insn->dst_reg];
> +	const s8 *src = bpf2m68k[insn->src_reg];
> +	const s8 *tmp1 = bpf2m68k[TMP_REG_1];
> +	const s8 *tmp2 = bpf2m68k[TMP_REG_2];
> +	s8 d_lo, d_hi, s_lo, s_hi;
> +
> +	d_lo = bpf_get_reg32(dst[1], tmp1[1], ctx);
> +	d_hi = bpf_get_reg32(dst[0], tmp1[0], ctx);
> +	s_lo = bpf_get_reg32(src[1], tmp2[1], ctx);
> +	s_hi = bpf_get_reg32(src[0], tmp2[0], ctx);
> +
> +	switch (BPF_OP(insn->code)) {
> +	case BPF_MOV:
> +		if (insn->off == 8 || insn->off == 16 || insn->off == 32) {
> +			if (d_lo != s_lo)
> +				emit_16(ctx, 0x2000 | (d_lo << 9) | s_lo); /* move.l src, dst */
> +
> +			if (insn->off == 8)
> +				emit_16(ctx, 0x49c0 | d_lo);		/* extb.l d_lo */
> +			else if (insn->off == 16)
> +				emit_16(ctx, 0x48c0 | d_lo);		/* ext.l d_lo */
> +
> +			emit_16(ctx, 0x4a80 | d_lo);			/* tst.l d_lo */
> +			emit_16(ctx, 0x5bc0 | d_hi);			/* smi d_hi */
> +			emit_16(ctx, 0x49c0 | d_hi);			/* extb.l d_hi */
> +		} else {
> +			if (d_lo != s_lo)
> +				emit_16(ctx, 0x2000 | (d_lo << 9) | s_lo); /* move.l s_lo, d_lo */
> +			if (d_hi != s_hi)
> +				emit_16(ctx, 0x2000 | (d_hi << 9) | s_hi); /* move.l s_hi, d_hi */
> +		}
> +		break;
> +	case BPF_ADD:
> +		emit_16(ctx, 0xd080 | (d_lo << 9) | s_lo);		/* add.l s_lo, d_lo */
> +		emit_16(ctx, 0xd180 | (d_hi << 9) | s_hi);		/* addx.l s_hi, d_hi */
> +		break;
> +	case BPF_SUB:
> +		emit_16(ctx, 0x9080 | (d_lo << 9) | s_lo);		/* sub.l s_lo, d_lo */
> +		emit_16(ctx, 0x9180 | (d_hi << 9) | s_hi);		/* subx.l s_hi, d_hi */
> +		break;
> +	case BPF_AND:
> +		emit_16(ctx, 0xc080 | (d_lo << 9) | s_lo);		/* and.l s_lo, d_lo */
> +		emit_16(ctx, 0xc080 | (d_hi << 9) | s_hi);		/* and.l s_hi, d_hi */
> +		break;
> +	case BPF_OR:
> +		emit_16(ctx, 0x8080 | (d_lo << 9) | s_lo);		/* or.l s_lo, d_lo */
> +		emit_16(ctx, 0x8080 | (d_hi << 9) | s_hi);		/* or.l s_hi, d_hi */
> +		break;
> +	case BPF_XOR:
> +		emit_16(ctx, 0xb180 | (s_lo << 9) | d_lo);		/* eor.l s_lo, d_lo */
> +		emit_16(ctx, 0xb180 | (s_hi << 9) | d_hi);		/* eor.l s_hi, d_hi */
> +		break;
> +	}
> +
> +	bpf_put_reg32(dst[1], d_lo, ctx);
> +	bpf_put_reg32(dst[0], d_hi, ctx);
> +}
> +
> +static void emit_alu64_k(const struct bpf_insn *insn, struct jit_ctx *ctx)
> +{
> +	const s8 *dst = bpf2m68k[insn->dst_reg];
> +	const s8 *tmp1 = bpf2m68k[TMP_REG_1];
> +	const s8 *tmp2 = bpf2m68k[TMP_REG_2];
> +	s8 d_lo, d_hi, s_lo, s_hi;
> +	u32 imm_lo = insn->imm;
> +	u32 imm_hi = insn->imm < 0 ? 0xffffffff : 0;
> +
> +	d_lo = bpf_get_reg32(dst[1], tmp1[1], ctx);
> +	d_hi = bpf_get_reg32(dst[0], tmp1[0], ctx);
> +
> +	if (BPF_OP(insn->code) == BPF_MOV) {
> +		emit_16(ctx, 0x203c | (d_lo << 9));			/* move.l #imm, d_lo */
> +		emit_32(ctx, imm_lo);
> +		emit_16(ctx, 0x203c | (d_hi << 9));			/* move.l #imm, d_hi */
> +		emit_32(ctx, imm_hi);
> +		bpf_put_reg32(dst[1], d_lo, ctx);
> +		bpf_put_reg32(dst[0], d_hi, ctx);
> +		return;
> +	}
> +
> +	s_lo = tmp2[1];
> +	s_hi = tmp2[0];
> +
> +	emit_16(ctx, 0x203c | (s_lo << 9));				/* move.l #imm, s_lo */
> +	emit_32(ctx, imm_lo);
> +	emit_16(ctx, 0x203c | (s_hi << 9));				/* move.l #imm, s_hi */
> +	emit_32(ctx, imm_hi);
> +
> +	switch (BPF_OP(insn->code)) {
> +	case BPF_ADD:
> +		emit_16(ctx, 0xd080 | (d_lo << 9) | s_lo);		/* add.l s_lo, d_lo */
> +		emit_16(ctx, 0xd180 | (d_hi << 9) | s_hi);		/* addx.l s_hi, d_hi */
> +		break;
> +	case BPF_SUB:
> +		emit_16(ctx, 0x9080 | (d_lo << 9) | s_lo);		/* sub.l s_lo, d_lo */
> +		emit_16(ctx, 0x9180 | (d_hi << 9) | s_hi);		/* subx.l s_hi, d_hi */
> +		break;
> +	case BPF_AND:
> +		emit_16(ctx, 0xc080 | (d_lo << 9) | s_lo);		/* and.l s_lo, d_lo */
> +		emit_16(ctx, 0xc080 | (d_hi << 9) | s_hi);		/* and.l s_hi, d_hi */
> +		break;
> +	case BPF_OR:
> +		emit_16(ctx, 0x8080 | (d_lo << 9) | s_lo);		/* or.l s_lo, d_lo */
> +		emit_16(ctx, 0x8080 | (d_hi << 9) | s_hi);		/* or.l s_hi, d_hi */
> +		break;
> +	case BPF_XOR:
> +		emit_16(ctx, 0xb180 | (s_lo << 9) | d_lo);		/* eor.l s_lo, d_lo */
> +		emit_16(ctx, 0xb180 | (s_hi << 9) | d_hi);		/* eor.l s_hi, d_hi */
> +		break;
> +	}
> +
> +	bpf_put_reg32(dst[1], d_lo, ctx);
> +	bpf_put_reg32(dst[0], d_hi, ctx);
> +}
> +
> +static inline void emit_lsh64(struct jit_ctx *ctx, s8 d_lo, s8 d_hi)
> +{
> +	if (CPU_IS_COLDFIRE) {
> +		emit_16(ctx, 0xd080 | (d_lo << 9) | d_lo);		/* add.l d_lo, d_lo */
> +		emit_16(ctx, 0xd180 | (d_hi << 9) | d_hi);		/* addx.l d_hi, d_hi */
> +	} else {
> +		emit_16(ctx, 0xe388 | d_lo);				/* lsll #1, d_lo */
> +		emit_16(ctx, 0xe390 | d_hi);				/* roxl.l #1, d_hi */
> +	}
> +}
> +
> +static inline void emit_rsh64(struct jit_ctx *ctx, s8 d_lo, s8 d_hi)
> +{
> +	if (CPU_IS_COLDFIRE) {
> +		emit_16(ctx, 0xe288 | d_lo);				/* lsr.l #1, d_lo */
> +		emit_16(ctx, 0xe288 | d_hi);				/* lsr.l #1, d_hi */
> +		emit_16(ctx, 0x6400);					/* bcc 1f */
> +		emit_16(ctx, 0x0006);
> +		emit_16(ctx, 0x08c0 | d_lo);				/* bset #31, d_lo */
> +		emit_16(ctx, 0x001f);
> +	} else {
> +		emit_16(ctx, 0xe288 | d_hi);				/* lsrl #1, d_hi */
> +		emit_16(ctx, 0xe290 | d_lo);				/* roxr.l #1, d_lo */
> +	}
> +}
> +
> +static inline void emit_arsh64(struct jit_ctx *ctx, s8 d_lo, s8 d_hi)
> +{
> +	if (CPU_IS_COLDFIRE) {
> +		emit_16(ctx, 0xe288 | d_lo);				/* lsr.l #1, d_lo */
> +		emit_16(ctx, 0xe280 | d_hi);				/* asr.l #1, d_hi */
> +		emit_16(ctx, 0x6400);					/* bcc 1f */
> +		emit_16(ctx, 0x0006);
> +		emit_16(ctx, 0x08c0 | d_lo);				/* bset #31, d_lo */
> +		emit_16(ctx, 0x001f);
> +	} else {
> +		emit_16(ctx, 0xe280 | d_hi);				/* asrl #1, d_hi */
> +		emit_16(ctx, 0xe290 | d_lo);				/* roxr.l #1, d_lo */
> +	}
> +}
> +
> +static void emit_alu64_shift(const struct bpf_insn *insn, struct jit_ctx *ctx, bool is_imm)
> +{
> +	const s8 *dst = bpf2m68k[insn->dst_reg];
> +	const s8 *tmp1 = bpf2m68k[TMP_REG_1];
> +	const s8 *tmp2 = bpf2m68k[TMP_REG_2];
> +	s8 d_lo, d_hi, count_reg;
> +	int loop_start, done_idx;
> +
> +	d_lo = bpf_get_reg32(dst[1], tmp1[1], ctx);
> +	d_hi = bpf_get_reg32(dst[0], tmp1[0], ctx);
> +	count_reg = tmp2[1];
> +
> +	if (is_imm) {
> +		emit_16(ctx, 0x203c | (count_reg << 9));		/* move.l #imm, count_reg */
> +		emit_32(ctx, insn->imm);
> +	} else {
> +		const s8 *src = bpf2m68k[insn->src_reg];
> +		s8 s_lo = bpf_get_reg32(src[1], tmp2[1], ctx);
> +
> +		if (count_reg != s_lo)
> +			emit_16(ctx, 0x2000 | (count_reg << 9) | s_lo);	/* move.l s_lo, count_reg */
> +	}
> +
> +	emit_16(ctx, 0x0280 | count_reg);			/* andi.l #0x3f, count_reg */
> +	emit_32(ctx, 0x3f);
> +
> +	emit_16(ctx, 0x4a80 | count_reg);				/* tst.l count_reg */
> +	emit_16(ctx, 0x6700);						/* beq.w done_idx */
> +	done_idx = ctx->idx;
> +	emit_16(ctx, 0);
> +
> +	loop_start = ctx->idx;
> +
> +	if (BPF_OP(insn->code) == BPF_LSH)
> +		emit_lsh64(ctx, d_lo, d_hi);
> +	else if (BPF_OP(insn->code) == BPF_RSH)
> +		emit_rsh64(ctx, d_lo, d_hi);
> +	else if (BPF_OP(insn->code) == BPF_ARSH)
> +		emit_arsh64(ctx, d_lo, d_hi);
> +
> +	emit_16(ctx, 0x5380 | count_reg);				/* subq.l #1, count_reg */
> +	emit_16(ctx, 0x6600);						/* bne.w loop_start */
> +	emit_16(ctx, (loop_start - (int)ctx->idx) * 2);
> +
> +	if (ctx->target)
> +		ctx->target[done_idx] = (ctx->idx - done_idx) * 2;
> +
> +	bpf_put_reg32(dst[1], d_lo, ctx);
> +	bpf_put_reg32(dst[0], d_hi, ctx);
> +}
> +
> +static inline void emit_cf_swap16(struct jit_ctx *ctx, s8 d_lo, s8 d_hi)
> +{
> +	emit_16(ctx, 0x71c0 | (d_lo << 9) | d_lo);			/* mvz.w d_lo, d_lo */
> +	emit_16(ctx, 0x7180 | (d_hi << 9) | d_lo);			/* mvz.b d_lo, d_hi */
> +	emit_16(ctx, 0xe088 | d_lo);					/* lsr.l #8, d_lo */
> +	emit_16(ctx, 0xe188 | d_hi);					/* lsl.l #8, d_hi */
> +	emit_16(ctx, 0x8080 | (d_lo << 9) | d_hi);			/* or.l d_hi, d_lo */
> +}
> +
> +static inline void emit_to_le16(struct jit_ctx *ctx, s8 d_lo, s8 d_hi)
> +{
> +	if (CPU_IS_COLDFIRE) {
> +		emit_cf_swap16(ctx, d_lo, d_hi);
> +	} else {
> +		emit_16(ctx, 0x0280 | d_lo);				/* andi.l #0xffff, d_lo */
> +		emit_32(ctx, 0xffff);
> +		emit_16(ctx, 0xe058 | d_lo);				/* ror.w #8, d_lo */
> +	}
> +
> +	emit_16(ctx, 0x7000 | (d_hi << 9));				/* moveq #0, d_hi */
> +}
> +
> +static inline void emit_cf_swap32(struct jit_ctx *ctx, s8 d_lo, s8 d_hi)
> +{
> +	emit_16(ctx, 0x2f00 | d_lo);					/* move.l d_lo, -(%sp) */
> +	emit_16(ctx, 0x4840 | d_lo);					/* swap d_lo */
> +	emit_cf_swap16(ctx, d_lo, d_hi);
> +	emit_16(ctx, 0x2000 | (d_hi << 9) | d_lo);			/* move.l d_lo, d_hi */
> +	emit_16(ctx, 0x2017 | (d_lo << 9));				/* move.l (%sp), d_lo */
> +	emit_16(ctx, 0x2e80 | d_hi);					/* move.l d_hi, (%sp) */
> +	emit_cf_swap16(ctx, d_lo, d_hi);
> +	emit_16(ctx, 0x4840 | d_lo);					/* swap d_lo */
> +	emit_16(ctx, 0x809f | (d_lo << 9));				/* or.l (%sp)+, d_lo */
> +}
> +
> +static inline void emit_to_le32(struct jit_ctx *ctx, s8 d_lo, s8 d_hi)
> +{
> +	if (CPU_IS_COLDFIRE) {
> +		emit_cf_swap32(ctx, d_lo, d_hi);
> +	} else {
> +		emit_16(ctx, 0xe058 | d_lo);				/* ror.w #8, d_lo */
> +		emit_16(ctx, 0x4840 | d_lo);				/* swap d_lo */
> +		emit_16(ctx, 0xe058 | d_lo);				/* ror.w #8, d_lo */
> +	}
> +
> +	emit_16(ctx, 0x7000 | (d_hi << 9));				/* moveq #0, d_hi */
> +}
> +
> +static inline void emit_to_le64(struct jit_ctx *ctx, s8 d_lo, s8 d_hi)
> +{
> +	if (CPU_IS_COLDFIRE) {
> +		emit_16(ctx, 0x2f00 | d_hi);				/* move.l d_hi, -(%sp) */
> +		emit_cf_swap32(ctx, d_lo, d_hi);
> +		emit_16(ctx, 0x2000 | (d_hi << 9) | d_lo);		/* move.l d_lo, d_hi */
> +		emit_16(ctx, 0x2017 | (d_lo << 9));			/* move.l (%sp), d_lo */
> +		emit_16(ctx, 0x2e80 | d_hi);				/* move.l d_hi, (%sp) */
> +		emit_cf_swap32(ctx, d_lo, d_hi);
> +		emit_16(ctx, 0x201f | (d_hi << 9));			/* move.l (%sp)+, d_hi */
> +	} else {
> +		emit_16(ctx, 0xe058 | d_lo);				/* ror.w #8, d_lo */
> +		emit_16(ctx, 0x4840 | d_lo);				/* swap d_lo */
> +		emit_16(ctx, 0xe058 | d_lo);				/* ror.w #8, d_lo */
> +
> +		emit_16(ctx, 0xe058 | d_hi);				/* ror.w #8, d_hi */
> +		emit_16(ctx, 0x4840 | d_hi);				/* swap d_hi */
> +		emit_16(ctx, 0xe058 | d_hi);				/* ror.w #8, d_hi */
> +
> +		emit_16(ctx, 0xc140 | (d_hi << 9) | d_lo);		/* exg d_lo, d_hi */
> +	}
> +}
> +
> +static void emit_bpf_end(const struct bpf_insn *insn, struct jit_ctx *ctx)
> +{
> +	const s8 *dst = bpf2m68k[insn->dst_reg];
> +	const s8 *tmp1 = bpf2m68k[TMP_REG_1];
> +	s8 d_lo, d_hi;
> +	bool to_le = BPF_SRC(insn->code) == BPF_TO_LE;
> +	int imm = insn->imm;
> +
> +	d_lo = bpf_get_reg32(dst[1], tmp1[1], ctx);
> +	d_hi = bpf_get_reg32(dst[0], tmp1[0], ctx);
> +
> +	if (to_le) {
> +		switch (imm) {
> +		case 16:
> +			emit_to_le16(ctx, d_lo, d_hi);
> +			break;
> +		case 32:
> +			emit_to_le32(ctx, d_lo, d_hi);
> +			break;
> +		case 64:
> +			emit_to_le64(ctx, d_lo, d_hi);
> +			break;
> +		}
> +	} else {
> +		switch (imm) {
> +		case 16:
> +			emit_16(ctx, 0x0280 | d_lo);			/* andi.l #0xffff, d_lo */
> +			emit_32(ctx, 0xffff);
> +			emit_16(ctx, 0x7000 | (d_hi << 9));		/* moveq #0, d_hi */
> +			break;
> +		case 32:
> +			emit_16(ctx, 0x7000 | (d_hi << 9));		/* moveq #0, d_hi */
> +			break;
> +		case 64:
> +			break;
> +		}
> +	}
> +
> +	bpf_put_reg32(dst[1], d_lo, ctx);
> +	bpf_put_reg32(dst[0], d_hi, ctx);
> +}
> +
> +static void emit_math_call(const struct bpf_insn *insn, struct jit_ctx *ctx, bool is_64)
> +{
> +	const s8 *dst = bpf2m68k[insn->dst_reg];
> +	const s8 *src = bpf2m68k[insn->src_reg];
> +	const s8 *tmp1 = bpf2m68k[TMP_REG_1];
> +	const s8 *tmp2 = bpf2m68k[TMP_REG_2];
> +	s8 d_lo, d_hi, s_lo, s_hi = 0;
> +	void *func = NULL;
> +	u8 op = BPF_OP(insn->code);
> +
> +	d_lo = bpf_get_reg32(dst[1], tmp1[1], ctx);
> +	d_hi = bpf_get_reg32(dst[0], tmp1[0], ctx);
> +
> +	if (BPF_SRC(insn->code) == BPF_X) {
> +		s_lo = bpf_get_reg32(src[1], tmp2[1], ctx);
> +		if (is_64)
> +			s_hi = bpf_get_reg32(src[0], tmp2[0], ctx);
> +	} else {
> +		s_lo = tmp2[1];
> +		emit_16(ctx, 0x203c | (s_lo << 9));			/* move.l #imm, s_lo */
> +		emit_32(ctx, insn->imm);
> +		if (is_64) {
> +			s_hi = tmp2[0];
> +			emit_16(ctx, 0x203c | (s_hi << 9));		/* move.l #imm, s_hi */
> +			emit_32(ctx, insn->imm < 0 ? 0xffffffff : 0);
> +		}
> +	}
> +
> +	if (is_64) {
> +		switch (op) {
> +		case BPF_MUL:
> +			func = (void *)jit_mul64;
> +			break;
> +		case BPF_DIV:
> +			func = insn->off == 1 ? (void *)jit_sdiv64 : (void *)jit_div64;
> +			break;
> +		case BPF_MOD:
> +			func = insn->off == 1 ? (void *)jit_smod64 : (void *)jit_mod64;
> +			break;
> +		}
> +	} else {
> +		switch (op) {
> +		case BPF_MUL:
> +			func = (void *)jit_mul32;
> +			break;
> +		case BPF_DIV:
> +			func = insn->off == 1 ? (void *)jit_sdiv32 : (void *)jit_div32;
> +			break;
> +		case BPF_MOD:
> +			func = insn->off == 1 ? (void *)jit_smod32 : (void *)jit_mod32;
> +			break;
> +		}
> +	}
> +
> +	if (is_64) {
> +		emit_16(ctx, 0x2f01);					/* move.l d1, -(%sp) */
> +		emit_16(ctx, 0x2f00);					/* move.l d0, -(%sp) */
> +
> +		emit_16(ctx, 0x2f00 | s_lo);				/* move.l s_lo, -(%sp) */
> +		emit_16(ctx, 0x2f00 | s_hi);				/* move.l s_hi, -(%sp) */
> +		emit_16(ctx, 0x2f00 | d_lo);				/* move.l d_lo, -(%sp) */
> +		emit_16(ctx, 0x2f00 | d_hi);				/* move.l d_hi, -(%sp) */
> +
> +		emit_16(ctx, 0x207c);					/* movea.l #func, %a0 */
> +		emit_32(ctx, (u32)func);
> +		emit_16(ctx, 0x4e90);					/* jsr (%a0) */
> +
> +		emit_16(ctx, 0x4fef);					/* lea 16(%sp), %sp */
> +		emit_16(ctx, 16);
> +
> +		emit_16(ctx, 0x2601);					/* move.l %d1, %d3 */
> +		emit_16(ctx, 0x2400);					/* move.l %d0, %d2 */
> +
> +		emit_16(ctx, 0x201f);					/* move.l (%sp)+, d0 */
> +		emit_16(ctx, 0x221f);					/* move.l (%sp)+, d1 */
> +	} else {
> +		emit_16(ctx, 0x2f01);					/* move.l d1, -(%sp) */
> +		emit_16(ctx, 0x2f00);					/* move.l d0, -(%sp) */
> +
> +		emit_16(ctx, 0x2f00 | s_lo);				/* move.l s_lo, -(%sp) */
> +		emit_16(ctx, 0x2f00 | d_lo);				/* move.l d_lo, -(%sp) */
> +
> +		emit_16(ctx, 0x207c);					/* movea.l #func, %a0 */
> +		emit_32(ctx, (u32)func);
> +		emit_16(ctx, 0x4e90);					/* jsr (%a0) */
> +
> +		emit_16(ctx, 0x4fef);					/* lea 8(%sp), %sp */
> +		emit_16(ctx, 8);
> +
> +		emit_16(ctx, 0x2600);					/* move.l %d0, %d3 */
> +		emit_16(ctx, 0x7400);					/* moveq #0, %d2 */
> +
> +		emit_16(ctx, 0x201f);					/* move.l (%sp)+, d0 */
> +		emit_16(ctx, 0x221f);					/* move.l (%sp)+, d1 */
> +	}
> +
> +	bpf_put_reg32(dst[1], M68K_D3, ctx);
> +	bpf_put_reg32(dst[0], M68K_D2, ctx);
> +}
> +
> +static void emit_ldx(const struct bpf_insn *insn, struct jit_ctx *ctx)
> +{
> +	const s8 *dst = bpf2m68k[insn->dst_reg];
> +	const s8 *src = bpf2m68k[insn->src_reg];
> +	const s8 *tmp1 = bpf2m68k[TMP_REG_1];
> +	s8 d_lo, d_hi;
> +	bool is_mem_sx = BPF_MODE(insn->code) == BPF_MEMSX;
> +
> +	if (is_stacked(src[1])) {
> +		emit_16(ctx, 0x206e);				/* movea.l d16(%fp), %a0 */
> +		emit_16(ctx, (u16)src[1]);
> +	} else {
> +		emit_16(ctx, 0x2040 | src[1]);			/* movea.l src, %a0 */
> +	}
> +
> +	d_lo = is_stacked(dst[1]) ? tmp1[1] : dst[1];
> +	d_hi = is_stacked(dst[0]) ? tmp1[0] : dst[0];
> +
> +	switch (BPF_SIZE(insn->code)) {
> +	case BPF_B:
> +		if (!is_mem_sx)
> +			emit_16(ctx, 0x7000 | (d_lo << 9));	/* moveq #0, d_lo */
> +		emit_16(ctx, 0x1028 | (d_lo << 9));		/* move.b d16(%a0), d_lo */
> +		emit_16(ctx, insn->off);
> +		if (is_mem_sx)
> +			emit_16(ctx, 0x49c0 | d_lo);	/* extb.l d_lo */
> +		break;
> +	case BPF_H:
> +		if (!is_mem_sx)
> +			emit_16(ctx, 0x7000 | (d_lo << 9));	/* moveq #0, d_lo */
> +		emit_16(ctx, 0x3028 | (d_lo << 9));		/* move.w d16(%a0), d_lo */
> +		emit_16(ctx, insn->off);
> +		if (is_mem_sx)
> +			emit_16(ctx, 0x48c0 | d_lo);	/* ext.l d_lo */
> +		break;
> +	case BPF_W:
> +		emit_16(ctx, 0x2028 | (d_lo << 9));		/* move.l d16(%a0), d_lo */
> +		emit_16(ctx, insn->off);
> +		break;
> +	case BPF_DW:
> +		emit_16(ctx, 0x2028 | (d_hi << 9));		/* move.l d16(%a0), d_hi */
> +		emit_16(ctx, insn->off);
> +		emit_16(ctx, 0x41e8);				/* lea 4(%a0), %a0 */
> +		emit_16(ctx, 4);
> +		emit_16(ctx, 0x2028 | (d_lo << 9));		/* move.l d16(%a0), d_lo */
> +		emit_16(ctx, insn->off);
> +		break;
> +	}
> +
> +	if (BPF_SIZE(insn->code) != BPF_DW) {
> +		if (is_mem_sx) {
> +			emit_16(ctx, 0x4a80 | d_lo);			/* tst.l d_lo */
> +			emit_16(ctx, 0x5bc0 | d_hi);			/* smi d_hi */
> +			emit_16(ctx, 0x49c0 | d_hi);			/* extb.l d_hi */
> +		} else {
> +			emit_16(ctx, 0x7000 | (d_hi << 9));	/* moveq #0, d_hi */
> +		}
> +	}
> +
> +	bpf_put_reg32(dst[1], d_lo, ctx);
> +	bpf_put_reg32(dst[0], d_hi, ctx);
> +}
> +
> +static void emit_stx(const struct bpf_insn *insn, struct jit_ctx *ctx)
> +{
> +	const s8 *dst = bpf2m68k[insn->dst_reg];
> +	const s8 *src = bpf2m68k[insn->src_reg];
> +	const s8 *tmp2 = bpf2m68k[TMP_REG_2];
> +	s8 s_lo, s_hi;
> +
> +	if (is_stacked(dst[1])) {
> +		emit_16(ctx, 0x206e);				/* movea.l d16(%fp), %a0 */
> +		emit_16(ctx, (u16)dst[1]);
> +	} else {
> +		emit_16(ctx, 0x2040 | dst[1]);			/* movea.l dst, %a0 */
> +	}
> +
> +	s_lo = bpf_get_reg32(src[1], tmp2[1], ctx);
> +
> +	switch (BPF_SIZE(insn->code)) {
> +	case BPF_B:
> +		emit_16(ctx, 0x1140 | s_lo);			/* move.b s_lo, d16(%a0) */
> +		emit_16(ctx, insn->off);
> +		break;
> +	case BPF_H:
> +		emit_16(ctx, 0x3140 | s_lo);			/* move.w s_lo, d16(%a0) */
> +		emit_16(ctx, insn->off);
> +		break;
> +	case BPF_W:
> +		emit_16(ctx, 0x2140 | s_lo);			/* move.l s_lo, d16(%a0) */
> +		emit_16(ctx, insn->off);
> +		break;
> +	case BPF_DW:
> +		s_hi = bpf_get_reg32(src[0], tmp2[0], ctx);
> +		emit_16(ctx, 0x2140 | s_hi);			/* move.l s_hi, d16(%a0) */
> +		emit_16(ctx, insn->off);
> +		emit_16(ctx, 0x41e8);				/* lea 4(%a0), %a0 */
> +		emit_16(ctx, 4);
> +		emit_16(ctx, 0x2140 | s_lo);			/* move.l s_lo, d16(%a0) */
> +		emit_16(ctx, insn->off);
> +		break;
> +	}
> +}
> +
> +static void emit_st(const struct bpf_insn *insn, struct jit_ctx *ctx)
> +{
> +	const s8 *dst = bpf2m68k[insn->dst_reg];
> +	const s8 *tmp = bpf2m68k[TMP_REG_1];
> +
> +	if (is_stacked(dst[1])) {
> +		emit_16(ctx, 0x206e);				/* movea.l d16(%fp), %a0 */
> +		emit_16(ctx, (u16)dst[1]);
> +	} else {
> +		emit_16(ctx, 0x2040 | dst[1]);			/* movea.l dst, %a0 */
> +	}
> +
> +	emit_16(ctx, 0x203c | (tmp[1] << 9));			/* move.l #imm, tmp */
> +	emit_32(ctx, insn->imm);
> +
> +	switch (BPF_SIZE(insn->code)) {
> +	case BPF_B:
> +		emit_16(ctx, 0x1140 | tmp[1]);			/* move.b tmp, d16(%a0) */
> +		emit_16(ctx, insn->off);
> +		break;
> +	case BPF_H:
> +		emit_16(ctx, 0x3140 | tmp[1]);			/* move.w tmp, d16(%a0) */
> +		emit_16(ctx, insn->off);
> +		break;
> +	case BPF_W:
> +		emit_16(ctx, 0x2140 | tmp[1]);			/* move.l tmp, d16(%a0) */
> +		emit_16(ctx, insn->off);
> +		break;
> +	case BPF_DW:
> +		emit_16(ctx, 0x203c | (tmp[0] << 9));		/* move.l #imm, tmp */
> +		emit_32(ctx, insn->imm < 0 ? 0xffffffff : 0);
> +
> +		emit_16(ctx, 0x2140 | tmp[0]);			/* move.l tmp, d16(%a0) */
> +		emit_16(ctx, insn->off);
> +		emit_16(ctx, 0x41e8);				/* lea 4(%a0), %a0 */
> +		emit_16(ctx, 4);
> +		emit_16(ctx, 0x2140 | tmp[1]);			/* move.l tmp, d16(%a0) */
> +		emit_16(ctx, insn->off);
> +		break;
> +	}
> +}
> +
> +static int emit_atomic(const struct bpf_insn *insn, struct jit_ctx *ctx)
> +{
> +	const s8 *dst = bpf2m68k[insn->dst_reg];
> +	const s8 *src = bpf2m68k[insn->src_reg];
> +	const s8 *tmp2 = bpf2m68k[TMP_REG_2];
> +
> +	switch (insn->imm) {
> +	case BPF_ADD:
> +	case BPF_ADD | BPF_FETCH:
> +	case BPF_AND:
> +	case BPF_AND | BPF_FETCH:
> +	case BPF_OR:
> +	case BPF_OR | BPF_FETCH:
> +	case BPF_XOR:
> +	case BPF_XOR | BPF_FETCH:
> +	case BPF_XCHG:
> +	case BPF_CMPXCHG:
> +		break;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +
> +	if (is_stacked(dst[1])) {
> +		emit_16(ctx, 0x206e);				/* movea.l d16(%fp), %a0 */
> +		emit_16(ctx, (u16)dst[1]);
> +	} else {
> +		emit_16(ctx, 0x2040 | dst[1]);			/* movea.l dst, %a0 */
> +	}
> +
> +	if (insn->off) {
> +		emit_16(ctx, 0x41e8);				/* lea d16(%a0), %a0 */
> +		emit_16(ctx, insn->off);
> +	}
> +
> +	if (BPF_SIZE(insn->code) == BPF_W) {
> +		s8 s_lo = bpf_get_reg32(src[1], tmp2[1], ctx);
> +
> +		if (insn->imm != BPF_CMPXCHG) {
> +			emit_16(ctx, 0x2f01);			/* move.l d1, -(%sp) */
> +			emit_16(ctx, 0x2f00);			/* move.l d0, -(%sp) */
> +		}
> +
> +		emit_16(ctx, 0x2f00 | M68K_D0);			/* move.l %d0, -(%sp) */
> +		emit_16(ctx, 0x2f3c);				/* move.l #imm, -(%sp) */
> +		emit_32(ctx, insn->imm);
> +		emit_16(ctx, 0x2f00 | s_lo);			/* move.l s_lo, -(%sp) */
> +		emit_16(ctx, 0x2f08);				/* move.l %a0, -(%sp) */
> +
> +		emit_16(ctx, 0x207c);				/* movea.l #func, %a0 */
> +		emit_32(ctx, (u32)jit_atomic32);
> +		emit_16(ctx, 0x4e90);				/* jsr (%a0) */
> +
> +		emit_16(ctx, 0x4fef);				/* lea 16(%sp), %sp */
> +		emit_16(ctx, 16);
> +
> +		if (insn->imm == BPF_CMPXCHG) {
> +			emit_16(ctx, 0x7200);			/* moveq #0, %d1 */
> +		} else {
> +			bool is_fetch = (insn->imm & BPF_FETCH) || insn->imm == BPF_XCHG;
> +
> +			if (is_fetch)
> +				emit_16(ctx, 0x2600);		/* move.l %d0, %d3 */
> +
> +			emit_16(ctx, 0x201f);			/* move.l (%sp)+, d0 */
> +			emit_16(ctx, 0x221f);			/* move.l (%sp)+, d1 */
> +
> +			if (is_fetch) {
> +				bpf_put_reg32(src[1], M68K_D3, ctx);
> +				emit_16(ctx, 0x7400);		/* moveq #0, %d2 */
> +				bpf_put_reg32(src[0], M68K_D2, ctx);
> +			}
> +		}
> +
> +	} else if (BPF_SIZE(insn->code) == BPF_DW) {
> +		s8 s_lo = bpf_get_reg32(src[1], tmp2[1], ctx);
> +		s8 s_hi = bpf_get_reg32(src[0], tmp2[0], ctx);
> +
> +		if (insn->imm != BPF_CMPXCHG) {
> +			emit_16(ctx, 0x2f01);			/* move.l d1, -(%sp) */
> +			emit_16(ctx, 0x2f00);			/* move.l d0, -(%sp) */
> +		}
> +
> +		emit_16(ctx, 0x2f00 | M68K_D0);			/* move.l %d0, -(%sp) */
> +		emit_16(ctx, 0x2f00 | M68K_D1);			/* move.l %d1, -(%sp) */
> +		emit_16(ctx, 0x2f3c);				/* move.l #imm, -(%sp) */
> +		emit_32(ctx, insn->imm);
> +		emit_16(ctx, 0x2f00 | s_lo);			/* move.l s_lo, -(%sp) */
> +		emit_16(ctx, 0x2f00 | s_hi);			/* move.l s_hi, -(%sp) */
> +		emit_16(ctx, 0x2f08);				/* move.l %a0, -(%sp) */
> +
> +		emit_16(ctx, 0x207c);				/* movea.l #func, %a0 */
> +		emit_32(ctx, (u32)jit_atomic64);
> +		emit_16(ctx, 0x4e90);				/* jsr (%a0) */
> +
> +		emit_16(ctx, 0x4fef);				/* lea 24(%sp), %sp */
> +		emit_16(ctx, 24);
> +
> +		if (insn->imm == BPF_CMPXCHG) {
> +			if (CPU_IS_COLDFIRE) {
> +				emit_16(ctx, 0x2f00);		/* move.l %d0, -(%sp) */
> +				emit_16(ctx, 0x2001);		/* move.l %d1, %d0 */
> +				emit_16(ctx, 0x221f);		/* move.l (%sp)+, %d1 */
> +			} else {
> +				emit_16(ctx, 0xc141);		/* exg %d0, %d1 */
> +			}
> +		} else {
> +			bool is_fetch = (insn->imm & BPF_FETCH) || insn->imm == BPF_XCHG;
> +
> +			if (is_fetch) {
> +				emit_16(ctx, 0x2600);		/* move.l %d0, %d3 */
> +				emit_16(ctx, 0x2401);		/* move.l %d1, %d2 */
> +			}
> +
> +			emit_16(ctx, 0x201f);			/* move.l (%sp)+, d0 */
> +			emit_16(ctx, 0x221f);			/* move.l (%sp)+, d1 */
> +
> +			if (is_fetch) {
> +				bpf_put_reg32(src[1], M68K_D2, ctx);
> +				bpf_put_reg32(src[0], M68K_D3, ctx);
> +			}
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static void emit_tail_call(const struct bpf_insn *insn, struct jit_ctx *ctx)
> +{
> +	const s8 *r2 = bpf2m68k[BPF_REG_2];
> +	const s8 *r3 = bpf2m68k[BPF_REG_3];
> +	int jmp_out_1, jmp_out_2, jmp_out_3;
> +
> +	if (is_stacked(r2[1])) {
> +		emit_16(ctx, 0x206e);				/* movea.l d16(%fp), %a0 */
> +		emit_16(ctx, (u16)r2[1]);
> +	} else {
> +		emit_16(ctx, 0x2040 | r2[1]);			/* movea.l r2, %a0 */
> +	}
> +
> +	if (is_stacked(r3[1])) {
> +		emit_16(ctx, 0x242e);				/* move.l d16(%fp), %d2 */
> +		emit_16(ctx, (u16)r3[1]);
> +	} else {
> +		emit_16(ctx, 0x2400 | r3[1]);			/* move.l r3, %d2 */
> +	}
> +
> +	emit_16(ctx, 0xb4a8);					/* cmp.l d16(%a0), %d2 */
> +	emit_16(ctx, offsetof(struct bpf_array, map.max_entries));
> +	emit_16(ctx, 0x6400);					/* bcc.w jmp_out_1 */
> +	jmp_out_1 = ctx->idx;
> +	emit_16(ctx, 0);
> +
> +	emit_16(ctx, 0x262e);					/* move.l d16(%fp), %d3 */
> +	emit_16(ctx, (u16)STACK_OFFSET(BPF_TC_LO));
> +	emit_16(ctx, 0x4a83);					/* tst.l %d3 */
> +	emit_16(ctx, 0x6700);					/* beq.w jmp_out_2 */
> +	jmp_out_2 = ctx->idx;
> +	emit_16(ctx, 0);
> +
> +	emit_16(ctx, 0xd482);					/* add.l %d2, %d2 */
> +	emit_16(ctx, 0xd482);					/* add.l %d2, %d2 */
> +	emit_16(ctx, 0x43e8);					/* lea d16(%a0), %a1 */
> +	emit_16(ctx, offsetof(struct bpf_array, ptrs));
> +	emit_16(ctx, 0xd3c2);					/* adda.l %d2, %a1 */
> +
> +	emit_16(ctx, 0x2051);					/* movea.l (%a1), %a0 */
> +
> +	emit_16(ctx, 0x2408);					/* move.l %a0, %d2 */
> +	emit_16(ctx, 0x4a82);					/* tst.l %d2 */
> +	emit_16(ctx, 0x6700);					/* beq.w jmp_out_3 */
> +	jmp_out_3 = ctx->idx;
> +	emit_16(ctx, 0);
> +
> +	emit_16(ctx, 0x5383);					/* subq.l #1, %d3 */
> +	emit_16(ctx, 0x2d43);					/* move.l %d3, d16(%fp) */
> +	emit_16(ctx, (u16)STACK_OFFSET(BPF_TC_LO));
> +
> +	emit_16(ctx, 0x2068);					/* movea.l d16(%a0), %a0 */
> +	emit_16(ctx, offsetof(struct bpf_prog, bpf_func));
> +
> +	emit_16(ctx, 0x4ee8);					/* jmp d16(%a0) */
> +	emit_16(ctx, CPU_IS_COLDFIRE ? 48 : 44);
> +
> +	if (ctx->target) {
> +		ctx->target[jmp_out_1] = (ctx->idx - jmp_out_1) * 2;
> +		ctx->target[jmp_out_2] = (ctx->idx - jmp_out_2) * 2;
> +		ctx->target[jmp_out_3] = (ctx->idx - jmp_out_3) * 2;
> +	}
> +}
> +
> +static int emit_jmp(const struct bpf_insn *insn, struct jit_ctx *ctx, int curr_i)
> +{
> +	const s8 *dst = bpf2m68k[insn->dst_reg];
> +	const s8 *src = bpf2m68k[insn->src_reg];
> +	const s8 *tmp1 = bpf2m68k[TMP_REG_1];
> +	const s8 *tmp2 = bpf2m68k[TMP_REG_2];
> +	s8 d_lo, d_hi = 0, s_lo, s_hi = 0;
> +	bool is_jmp32 = BPF_CLASS(insn->code) == BPF_JMP32;
> +	u8 op = BPF_OP(insn->code);
> +	int target_insn;
> +
> +	if (is_jmp32 && op == BPF_JA)
> +		target_insn = curr_i + 1 + insn->imm;
> +	else
> +		target_insn = curr_i + 1 + insn->off;
> +
> +	if (target_insn < 0 || target_insn > ctx->prog->len)
> +		return -EOPNOTSUPP;
> +
> +	#define EMIT_JMP32(op_base) \
> +		do { \
> +			int disp = (ctx->offsets[target_insn] - (ctx->idx + 1)) * 2; \
> +			emit_16(ctx, (op_base) | 0x00ff); \
> +			emit_32(ctx, disp); \
> +		} while (0)
> +
> +	if (op == BPF_JA) {
> +		EMIT_JMP32(0x6000);				/* bra.l */
> +		return 0;
> +	}
> +
> +	d_lo = bpf_get_reg32(dst[1], tmp1[1], ctx);
> +	if (!is_jmp32)
> +		d_hi = bpf_get_reg32(dst[0], tmp1[0], ctx);
> +
> +	if (BPF_SRC(insn->code) == BPF_X) {
> +		s_lo = bpf_get_reg32(src[1], tmp2[1], ctx);
> +		if (!is_jmp32)
> +			s_hi = bpf_get_reg32(src[0], tmp2[0], ctx);
> +	} else {
> +		s_lo = tmp2[1];
> +		emit_16(ctx, 0x203c | (s_lo << 9));		/* move.l #imm, s_lo */
> +		emit_32(ctx, insn->imm);
> +		if (!is_jmp32) {
> +			s_hi = tmp2[0];
> +			emit_16(ctx, 0x203c | (s_hi << 9));	/* move.l #imm, s_hi */
> +			emit_32(ctx, insn->imm < 0 ? 0xffffffff : 0);
> +		}
> +	}
> +
> +	if (op == BPF_JSET) {
> +		emit_16(ctx, 0x2000 | (tmp1[1] << 9) | d_lo);	/* move.l d_lo, tmp1_lo */
> +		emit_16(ctx, 0xc080 | (tmp1[1] << 9) | s_lo);	/* and.l s_lo, tmp1_lo */
> +
> +		if (!is_jmp32) {
> +			EMIT_JMP32(0x6600);			/* bne.l */
> +			emit_16(ctx, 0x2000 | (tmp1[0] << 9) | d_hi); /* move.l d_hi, tmp1_hi */
> +			emit_16(ctx, 0xc080 | (tmp1[0] << 9) | s_hi); /* and.l s_hi, tmp1_hi */
> +		}
> +		EMIT_JMP32(0x6600);				/* bne.l */
> +		return 0;
> +	}
> +
> +	if (is_jmp32) {
> +		emit_16(ctx, 0xb080 | (d_lo << 9) | s_lo);	/* cmp.l s_lo, d_lo */
> +		switch (op) {
> +		case BPF_JEQ:
> +			EMIT_JMP32(0x6700);			/* beq.l */
> +			break;
> +		case BPF_JNE:
> +			EMIT_JMP32(0x6600);			/* bne.l */
> +			break;
> +		case BPF_JGT:
> +			EMIT_JMP32(0x6200);			/* bhi.l */
> +			break;
> +		case BPF_JGE:
> +			EMIT_JMP32(0x6400);			/* bcc.l */
> +			break;
> +		case BPF_JLT:
> +			EMIT_JMP32(0x6500);			/* bcs.l */
> +			break;
> +		case BPF_JLE:
> +			EMIT_JMP32(0x6300);			/* bls.l */
> +			break;
> +		case BPF_JSGT:
> +			EMIT_JMP32(0x6e00);			/* bgt.l */
> +			break;
> +		case BPF_JSGE:
> +			EMIT_JMP32(0x6c00);			/* bge.l */
> +			break;
> +		case BPF_JSLT:
> +			EMIT_JMP32(0x6d00);			/* blt.l */
> +			break;
> +		case BPF_JSLE:
> +			EMIT_JMP32(0x6f00);			/* ble.l */
> +			break;
> +		}
> +	} else {
> +		emit_16(ctx, 0xb080 | (d_hi << 9) | s_hi);	/* cmp.l s_hi, d_hi */
> +
> +		switch (op) {
> +		case BPF_JEQ:
> +			emit_16(ctx, 0x6608);			/* bne.s .+8 */
> +			emit_16(ctx, 0xb080 | (d_lo << 9) | s_lo); /* cmp.l s_lo, d_lo */
> +			EMIT_JMP32(0x6700);			/* beq.l */
> +			break;
> +		case BPF_JNE:
> +			EMIT_JMP32(0x6600);			/* bne.l */
> +			emit_16(ctx, 0xb080 | (d_lo << 9) | s_lo); /* cmp.l s_lo, d_lo */
> +			EMIT_JMP32(0x6600);			/* bne.l */
> +			break;
> +		case BPF_JGT:
> +			EMIT_JMP32(0x6200);			/* bhi.l */
> +			emit_16(ctx, 0x6508);			/* bcs.s .+8 */
> +			emit_16(ctx, 0xb080 | (d_lo << 9) | s_lo); /* cmp.l s_lo, d_lo */
> +			EMIT_JMP32(0x6200);			/* bhi.l */
> +			break;
> +		case BPF_JGE:
> +			EMIT_JMP32(0x6200);			/* bhi.l */
> +			emit_16(ctx, 0x6508);			/* bcs.s .+8 */
> +			emit_16(ctx, 0xb080 | (d_lo << 9) | s_lo); /* cmp.l s_lo, d_lo */
> +			EMIT_JMP32(0x6400);			/* bcc.l */
> +			break;
> +		case BPF_JLT:
> +			EMIT_JMP32(0x6500);			/* bcs.l */
> +			emit_16(ctx, 0x6208);			/* bhi.s .+8 */
> +			emit_16(ctx, 0xb080 | (d_lo << 9) | s_lo); /* cmp.l s_lo, d_lo */
> +			EMIT_JMP32(0x6500);			/* bcs.l */
> +			break;
> +		case BPF_JLE:
> +			EMIT_JMP32(0x6500);			/* bcs.l */
> +			emit_16(ctx, 0x6208);			/* bhi.s .+8 */
> +			emit_16(ctx, 0xb080 | (d_lo << 9) | s_lo); /* cmp.l s_lo, d_lo */
> +			EMIT_JMP32(0x6300);			/* bls.l */
> +			break;
> +		case BPF_JSGT:
> +			EMIT_JMP32(0x6e00);			/* bgt.l */
> +			emit_16(ctx, 0x6d08);			/* blt.s .+8 */
> +			emit_16(ctx, 0xb080 | (d_lo << 9) | s_lo); /* cmp.l s_lo, d_lo */
> +			EMIT_JMP32(0x6200);			/* bhi.l */
> +			break;
> +		case BPF_JSGE:
> +			EMIT_JMP32(0x6e00);			/* bgt.l */
> +			emit_16(ctx, 0x6d08);			/* blt.s .+8 */
> +			emit_16(ctx, 0xb080 | (d_lo << 9) | s_lo); /* cmp.l s_lo, d_lo */
> +			EMIT_JMP32(0x6400);			/* bcc.l */
> +			break;
> +		case BPF_JSLT:
> +			EMIT_JMP32(0x6d00);			/* blt.l */
> +			emit_16(ctx, 0x6e08);			/* bgt.s .+8 */
> +			emit_16(ctx, 0xb080 | (d_lo << 9) | s_lo); /* cmp.l s_lo, d_lo */
> +			EMIT_JMP32(0x6500);			/* bcs.l */
> +			break;
> +		case BPF_JSLE:
> +			EMIT_JMP32(0x6d00);			/* blt.l */
> +			emit_16(ctx, 0x6e08);			/* bgt.s .+8 */
> +			emit_16(ctx, 0xb080 | (d_lo << 9) | s_lo); /* cmp.l s_lo, d_lo */
> +			EMIT_JMP32(0x6300);			/* bls.l */
> +			break;
> +		}
> +	}
> +	#undef EMIT_JMP32
> +	return 0;
> +}
> +
> +static int emit_call(const struct bpf_insn *insn, struct jit_ctx *ctx)
> +{
> +	const s8 arg_regs[] = { BPF_REG_5, BPF_REG_4, BPF_REG_3, BPF_REG_2, BPF_REG_1 };
> +	const s8 *tmp1 = bpf2m68k[TMP_REG_1];
> +	u64 func_addr;
> +	bool fixed;
> +	int i, err;
> +
> +	if (insn->src_reg == BPF_PSEUDO_CALL)
> +		return -EOPNOTSUPP;
> +
> +	err = bpf_jit_get_func_addr(ctx->prog, insn, false, &func_addr, &fixed);
> +	if (err)
> +		return err;
> +
> +	for (i = 0; i < 5; i++) {
> +		const s8 *reg = bpf2m68k[arg_regs[i]];
> +		s8 d_lo = bpf_get_reg32(reg[1], tmp1[1], ctx);
> +		s8 d_hi = bpf_get_reg32(reg[0], tmp1[0], ctx);
> +
> +		emit_16(ctx, 0x2f00 | d_lo);			/* move.l d_lo, -(%sp) */
> +		emit_16(ctx, 0x2f00 | d_hi);			/* move.l d_hi, -(%sp) */
> +	}
> +
> +	emit_16(ctx, 0x207c);					/* movea.l #func_addr, %a0 */
> +	emit_32(ctx, (u32)func_addr);
> +
> +	emit_16(ctx, 0x4e90);					/* jsr (%a0) */
> +
> +	emit_16(ctx, 0x4fef);					/* lea 40(%sp), %sp */
> +	emit_16(ctx, 40);
> +
> +	if (CPU_IS_COLDFIRE) {
> +		emit_16(ctx, 0x2f00);				/* move.l %d0, -(%sp) */
> +		emit_16(ctx, 0x2001);				/* move.l %d1, %d0 */
> +		emit_16(ctx, 0x221f);				/* move.l (%sp)+, %d1 */
> +	} else {
> +		emit_16(ctx, 0xc340);				/* exg %d0, %d1 */
> +	}
> +
> +	return 0;
> +}
> +
> +static void build_prologue(struct jit_ctx *ctx)
> +{
> +	int total_stack = SCRATCH_SIZE + MAX_BPF_STACK + 8;
> +
> +	emit_16(ctx, 0x7021);					/* moveq #33, %d0 */
> +
> +	emit_16(ctx, 0x4e56);					/* link %a6, #-total_stack */
> +	emit_16(ctx, -total_stack);
> +
> +	if (CPU_IS_COLDFIRE) {
> +		emit_16(ctx, 0x4fef);				/* lea -16(%sp), %sp */
> +		emit_16(ctx, 0xfff0);
> +		emit_16(ctx, 0x48d7);				/* movem.l d2-d5, (%sp) */
> +		emit_16(ctx, 0x003c);
> +	} else {
> +		emit_16(ctx, 0x48e7);				/* movem.l d2-d5, -(%sp) */
> +		emit_16(ctx, 0x3c00);
> +	}
> +
> +	emit_16(ctx, 0x2d40);					/* move.l %d0, off(%fp) */
> +	emit_16(ctx, (u16)STACK_OFFSET(BPF_TC_LO));
> +
> +	emit_16(ctx, 0x202e);					/* move.l 8(%fp), %d0 */
> +	emit_16(ctx, 8);
> +	bpf_put_reg32(bpf2m68k[BPF_REG_1][1], M68K_D0, ctx);
> +
> +	emit_16(ctx, 0x7000 | (M68K_D0 << 9));			/* moveq #0, %d0 */
> +	bpf_put_reg32(bpf2m68k[BPF_REG_1][0], M68K_D0, ctx);
> +
> +	emit_16(ctx, 0x41ee);					/* lea -SCRATCH_SIZE(%fp), %a0 */
> +	emit_16(ctx, -SCRATCH_SIZE);
> +	emit_16(ctx, 0x2008);					/* move.l %a0, %d0 */
> +
> +	bpf_put_reg32(bpf2m68k[BPF_REG_10][1], M68K_D0, ctx);
> +	emit_16(ctx, 0x7000 | (M68K_D0 << 9));			/* moveq #0, %d0 */
> +	bpf_put_reg32(bpf2m68k[BPF_REG_10][0], M68K_D0, ctx);
> +}
> +
> +static void build_epilogue(struct jit_ctx *ctx)
> +{
> +	if (CPU_IS_COLDFIRE) {
> +		emit_16(ctx, 0x4cd7);				/* movem.l (%sp), d2-d5 */
> +		emit_16(ctx, 0x003c);
> +		emit_16(ctx, 0x4fef);				/* lea 16(%sp), %sp */
> +		emit_16(ctx, 0x0010);
> +	} else {
> +		emit_16(ctx, 0x4cdf);				/* movem.l (%sp)+, d2-d5 */
> +		emit_16(ctx, 0x003c);
> +	}
> +
> +	emit_16(ctx, 0x4e5e);					/* unlk %fp */
> +	emit_16(ctx, 0x4e75);					/* rts */
> +}
> +
> +static int build_insn(const struct bpf_insn *insn, struct jit_ctx *ctx, int i)
> +{
> +	u8 code = insn->code;
> +
> +	switch (code) {
> +	case BPF_ALU | BPF_NEG:
> +		emit_alu32_neg(insn, ctx);
> +		break;
> +	case BPF_ALU64 | BPF_NEG:
> +		emit_alu64_neg(insn, ctx);
> +		break;
> +
> +	case BPF_ALU | BPF_MOV | BPF_X:
> +	case BPF_ALU | BPF_ADD | BPF_X:
> +	case BPF_ALU | BPF_SUB | BPF_X:
> +	case BPF_ALU | BPF_AND | BPF_X:
> +	case BPF_ALU | BPF_OR  | BPF_X:
> +	case BPF_ALU | BPF_XOR | BPF_X:
> +	case BPF_ALU | BPF_LSH | BPF_X:
> +	case BPF_ALU | BPF_RSH | BPF_X:
> +	case BPF_ALU | BPF_ARSH | BPF_X:
> +		emit_alu32_x(insn, ctx);
> +		break;
> +
> +	case BPF_ALU | BPF_MOV | BPF_K:
> +	case BPF_ALU | BPF_ADD | BPF_K:
> +	case BPF_ALU | BPF_SUB | BPF_K:
> +	case BPF_ALU | BPF_AND | BPF_K:
> +	case BPF_ALU | BPF_OR  | BPF_K:
> +	case BPF_ALU | BPF_XOR | BPF_K:
> +	case BPF_ALU | BPF_LSH | BPF_K:
> +	case BPF_ALU | BPF_RSH | BPF_K:
> +	case BPF_ALU | BPF_ARSH | BPF_K:
> +		emit_alu32_k(insn, ctx);
> +		break;
> +
> +	case BPF_ALU64 | BPF_MOV | BPF_X:
> +	case BPF_ALU64 | BPF_ADD | BPF_X:
> +	case BPF_ALU64 | BPF_SUB | BPF_X:
> +	case BPF_ALU64 | BPF_AND | BPF_X:
> +	case BPF_ALU64 | BPF_OR  | BPF_X:
> +	case BPF_ALU64 | BPF_XOR | BPF_X:
> +		emit_alu64_x(insn, ctx);
> +		break;
> +
> +	case BPF_ALU64 | BPF_MOV | BPF_K:
> +	case BPF_ALU64 | BPF_ADD | BPF_K:
> +	case BPF_ALU64 | BPF_SUB | BPF_K:
> +	case BPF_ALU64 | BPF_AND | BPF_K:
> +	case BPF_ALU64 | BPF_OR  | BPF_K:
> +	case BPF_ALU64 | BPF_XOR | BPF_K:
> +		emit_alu64_k(insn, ctx);
> +		break;
> +
> +	case BPF_ALU64 | BPF_LSH | BPF_X:
> +	case BPF_ALU64 | BPF_RSH | BPF_X:
> +	case BPF_ALU64 | BPF_ARSH | BPF_X:
> +		emit_alu64_shift(insn, ctx, false);
> +		break;
> +
> +	case BPF_ALU64 | BPF_LSH | BPF_K:
> +	case BPF_ALU64 | BPF_RSH | BPF_K:
> +	case BPF_ALU64 | BPF_ARSH | BPF_K:
> +		emit_alu64_shift(insn, ctx, true);
> +		break;
> +
> +	case BPF_ALU | BPF_MUL | BPF_X:
> +	case BPF_ALU | BPF_DIV | BPF_X:
> +	case BPF_ALU | BPF_MOD | BPF_X:
> +	case BPF_ALU | BPF_MUL | BPF_K:
> +	case BPF_ALU | BPF_DIV | BPF_K:
> +	case BPF_ALU | BPF_MOD | BPF_K:
> +		emit_math_call(insn, ctx, false);
> +		break;
> +
> +	case BPF_ALU64 | BPF_MUL | BPF_X:
> +	case BPF_ALU64 | BPF_DIV | BPF_X:
> +	case BPF_ALU64 | BPF_MOD | BPF_X:
> +	case BPF_ALU64 | BPF_MUL | BPF_K:
> +	case BPF_ALU64 | BPF_DIV | BPF_K:
> +	case BPF_ALU64 | BPF_MOD | BPF_K:
> +		emit_math_call(insn, ctx, true);
> +		break;
> +
> +	case BPF_ALU | BPF_END | BPF_TO_BE:
> +	case BPF_ALU | BPF_END | BPF_TO_LE:
> +	case BPF_ALU64 | BPF_END | BPF_TO_BE:
> +	case BPF_ALU64 | BPF_END | BPF_TO_LE:
> +		emit_bpf_end(insn, ctx);
> +		break;
> +
> +	case BPF_LD | BPF_IMM | BPF_DW: {
> +		const struct bpf_insn *insn1 = insn + 1;
> +		const s8 *dst = bpf2m68k[insn->dst_reg];
> +		const s8 *tmp1 = bpf2m68k[TMP_REG_1];
> +		s8 d_lo = bpf_get_reg32(dst[1], tmp1[1], ctx);
> +		s8 d_hi = bpf_get_reg32(dst[0], tmp1[0], ctx);
> +
> +		if (insn->src_reg == BPF_PSEUDO_FUNC)
> +			return -EOPNOTSUPP;
> +
> +		emit_16(ctx, 0x203c | (d_lo << 9));			/* move.l #imm, d_lo */
> +		emit_32(ctx, insn->imm);
> +		emit_16(ctx, 0x203c | (d_hi << 9));			/* move.l #imm, d_hi */
> +		emit_32(ctx, insn1->imm);
> +
> +		bpf_put_reg32(dst[1], d_lo, ctx);
> +		bpf_put_reg32(dst[0], d_hi, ctx);
> +		break;
> +	}
> +
> +	case BPF_LDX | BPF_MEM | BPF_B:
> +	case BPF_LDX | BPF_MEM | BPF_H:
> +	case BPF_LDX | BPF_MEM | BPF_W:
> +	case BPF_LDX | BPF_MEM | BPF_DW:
> +	case BPF_LDX | BPF_MEMSX | BPF_B:
> +	case BPF_LDX | BPF_MEMSX | BPF_H:
> +	case BPF_LDX | BPF_MEMSX | BPF_W:
> +		emit_ldx(insn, ctx);
> +		break;
> +
> +	case BPF_STX | BPF_MEM | BPF_B:
> +	case BPF_STX | BPF_MEM | BPF_H:
> +	case BPF_STX | BPF_MEM | BPF_W:
> +	case BPF_STX | BPF_MEM | BPF_DW:
> +		emit_stx(insn, ctx);
> +		break;
> +
> +	case BPF_ST | BPF_MEM | BPF_B:
> +	case BPF_ST | BPF_MEM | BPF_H:
> +	case BPF_ST | BPF_MEM | BPF_W:
> +	case BPF_ST | BPF_MEM | BPF_DW:
> +		emit_st(insn, ctx);
> +		break;
> +
> +	case BPF_ST | BPF_NOSPEC:
> +		break;
> +
> +	case BPF_STX | BPF_ATOMIC | BPF_W:
> +	case BPF_STX | BPF_ATOMIC | BPF_DW:
> +		return emit_atomic(insn, ctx);
> +
> +	case BPF_JMP | BPF_TAIL_CALL:
> +		emit_tail_call(insn, ctx);
> +		break;
> +
> +	case BPF_JMP | BPF_JA:
> +	case BPF_JMP32 | BPF_JA:
> +	case BPF_JMP | BPF_JEQ | BPF_X:
> +	case BPF_JMP | BPF_JEQ | BPF_K:
> +	case BPF_JMP | BPF_JNE | BPF_X:
> +	case BPF_JMP | BPF_JNE | BPF_K:
> +	case BPF_JMP | BPF_JGT | BPF_X:
> +	case BPF_JMP | BPF_JGT | BPF_K:
> +	case BPF_JMP | BPF_JGE | BPF_X:
> +	case BPF_JMP | BPF_JGE | BPF_K:
> +	case BPF_JMP | BPF_JLT | BPF_X:
> +	case BPF_JMP | BPF_JLT | BPF_K:
> +	case BPF_JMP | BPF_JLE | BPF_X:
> +	case BPF_JMP | BPF_JLE | BPF_K:
> +	case BPF_JMP | BPF_JSGT | BPF_X:
> +	case BPF_JMP | BPF_JSGT | BPF_K:
> +	case BPF_JMP | BPF_JSGE | BPF_X:
> +	case BPF_JMP | BPF_JSGE | BPF_K:
> +	case BPF_JMP | BPF_JSLT | BPF_X:
> +	case BPF_JMP | BPF_JSLT | BPF_K:
> +	case BPF_JMP | BPF_JSLE | BPF_X:
> +	case BPF_JMP | BPF_JSLE | BPF_K:
> +	case BPF_JMP | BPF_JSET | BPF_X:
> +	case BPF_JMP | BPF_JSET | BPF_K:
> +	case BPF_JMP32 | BPF_JEQ | BPF_X:
> +	case BPF_JMP32 | BPF_JEQ | BPF_K:
> +	case BPF_JMP32 | BPF_JNE | BPF_X:
> +	case BPF_JMP32 | BPF_JNE | BPF_K:
> +	case BPF_JMP32 | BPF_JGT | BPF_X:
> +	case BPF_JMP32 | BPF_JGT | BPF_K:
> +	case BPF_JMP32 | BPF_JGE | BPF_X:
> +	case BPF_JMP32 | BPF_JGE | BPF_K:
> +	case BPF_JMP32 | BPF_JLT | BPF_X:
> +	case BPF_JMP32 | BPF_JLT | BPF_K:
> +	case BPF_JMP32 | BPF_JLE | BPF_X:
> +	case BPF_JMP32 | BPF_JLE | BPF_K:
> +	case BPF_JMP32 | BPF_JSGT | BPF_X:
> +	case BPF_JMP32 | BPF_JSGT | BPF_K:
> +	case BPF_JMP32 | BPF_JSGE | BPF_X:
> +	case BPF_JMP32 | BPF_JSGE | BPF_K:
> +	case BPF_JMP32 | BPF_JSLT | BPF_X:
> +	case BPF_JMP32 | BPF_JSLT | BPF_K:
> +	case BPF_JMP32 | BPF_JSLE | BPF_X:
> +	case BPF_JMP32 | BPF_JSLE | BPF_K:
> +	case BPF_JMP32 | BPF_JSET | BPF_X:
> +	case BPF_JMP32 | BPF_JSET | BPF_K:
> +		return emit_jmp(insn, ctx, i);
> +
> +	case BPF_JMP | BPF_CALL:
> +		return emit_call(insn, ctx);
> +
> +	case BPF_JMP | BPF_EXIT:
> +		build_epilogue(ctx);
> +		break;
> +
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +
> +	return 0;
> +}
> +
> +static int build_body(struct jit_ctx *ctx)
> +{
> +	const struct bpf_prog *prog = ctx->prog;
> +	int i;
> +
> +	for (i = 0; i < prog->len; i++) {
> +		const struct bpf_insn *insn = &prog->insnsi[i];
> +		int ret;
> +
> +		if (!ctx->target)
> +			ctx->offsets[i] = ctx->idx;
> +
> +		ret = build_insn(insn, ctx, i);
> +		if (ret < 0)
> +			return ret;
> +
> +		if (insn->code == (BPF_LD | BPF_IMM | BPF_DW)) {
> +			i++;
> +			if (!ctx->target)
> +				ctx->offsets[i] = ctx->idx;
> +		}
> +	}
> +
> +	if (!ctx->target)
> +		ctx->offsets[prog->len] = ctx->idx;
> +
> +	return 0;
> +}
> +
> +static void jit_fill_hole(void *area, unsigned int size)
> +{
> +	u16 *ptr;
> +
> +	for (ptr = area; size >= 2; size -= 2)
> +		*ptr++ = 0x4afc;
> +}
> +
> +struct bpf_prog *bpf_int_jit_compile(struct bpf_verifier_env *env, struct bpf_prog *prog)
> +{
> +	struct bpf_binary_header *header;
> +	struct jit_ctx ctx;
> +	unsigned int image_size;
> +	u8 *image_ptr;
> +
> +	if (!prog->jit_requested || prog->is_func)
> +		return prog;
> +
> +	memset(&ctx, 0, sizeof(ctx));
> +	ctx.prog = prog;
> +
> +	ctx.offsets = kvcalloc(prog->len + 1, sizeof(int), GFP_KERNEL);
> +	if (!ctx.offsets)
> +		return prog;
> +
> +	build_prologue(&ctx);
> +	if (build_body(&ctx) < 0)
> +		goto out_off;
> +	build_epilogue(&ctx);
> +
> +	image_size = ctx.idx * 2;
> +	header = bpf_jit_binary_alloc(image_size, &image_ptr, 2, jit_fill_hole);
> +	if (!header)
> +		goto out_off;
> +
> +	ctx.target = (u16 *)image_ptr;
> +	ctx.idx = 0;
> +
> +	build_prologue(&ctx);
> +	if (build_body(&ctx) < 0)
> +		goto out_free_hdr;
> +	build_epilogue(&ctx);
> +
> +	flush_icache_range((u32)header, (u32)(ctx.target + ctx.idx));
> +
> +	if (bpf_jit_enable > 1)
> +		bpf_jit_dump(prog->len, image_size, 2, ctx.target);
> +
> +	if (bpf_jit_binary_lock_ro(header))
> +		goto out_free_hdr;
> +
> +	prog->bpf_func = (void *)ctx.target;
> +	prog->jited = 1;
> +	prog->jited_len = image_size;
> +	goto out_off;
> +
> +out_free_hdr:
> +	bpf_jit_binary_free(header);
> +out_off:
> +	kvfree(ctx.offsets);
> +	return prog;
> +}
> -- 
> 2.56.1.703.gf848ed807c-goog
> 
