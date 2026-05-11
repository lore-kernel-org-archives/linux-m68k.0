Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F80D4DB554
	for <linux-m68k@lists.linux-m68k.org>; Mon, 11 May 2026 22:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.105.4.254
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778537556; cv=none; b=lZNhxU05VoHwyDY+gZJMdQT+MUbZpjLqNICFKk5jqnx9piic8US/oXhHtjeUQeK4DtkN9sJQlsgr0T57o1HL3Qbn4ahNfH3PxpXtgb1gUEizZzTlqsExIFVQzRu60LYddY9oGj3XcrK43HxeEerS7kywQk55gNxunhUBrsR/wE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778537556; c=relaxed/simple;
	bh=O7KZZ/VQ/no/hjQ0J+ZC+pLvaMrnMEKgm6YZd4E745k=;
	h=Content-Type:MIME-Version:Message-Id:In-Reply-To:References:
	 Subject:From:To:Cc:Date; b=NJZa0MTCprkL6VSc65FYuPJgWEaJBepbFH0qVAsW9W1GRlI2Yn6zEwp6EL6geBoxL5J1jjw0IZGJ3hVjKVYGqnU19XNBtTarH2cCoK7CFLza4JGDrftjFobTTa2BExBkVdob/82dHq8zD+OHbBe2Cbwj+YKMcJva1Q+B+VBMcos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Oem8Ym9p; arc=none smtp.client-ip=172.105.4.254
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Oem8Ym9p"
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 41227600CB;
	Mon, 11 May 2026 22:12:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 103B7C2BCB0;
	Mon, 11 May 2026 22:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778537553;
	bh=O7KZZ/VQ/no/hjQ0J+ZC+pLvaMrnMEKgm6YZd4E745k=;
	h=In-Reply-To:References:Subject:From:To:Cc:Date:From;
	b=Oem8Ym9pQ0OHTg1aLtHJ+PEHz/nYRBybqBVd3AhZLiNMHO3fJ+PUqBlUeah9dEn7U
	 U+706zGz4vjC25gkO2Ve8tq3WuKGCZ2bJusNWW/qZehCLVzHG8BJyxnx7DvBki6zYh
	 dkGFVyAOaDewkaAd08XXoEn/tgpQZwz5+YmQP16AVdAXtjdQTOX/9TnwgGLhiNXKvs
	 7keAwyzuyEPuEe2wJCfWN670iO19OO2b+4Wl8G+52cM/pbsxnWzcddEvow8vZvsww1
	 Bsm8mRqVgN5R0P/fpD0SzuEFiubRyZYRdn0yW0CjAFGTq+tdATRTXcOZobwu4Olk6U
	 rY69mPKicYagw==
Content-Type: multipart/mixed; boundary="===============7240238835478354730=="
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <85662b75ba1f428629fcb97491d0abe8f3fd93b257cd90766cb4604144dfc331@mail.kernel.org>
In-Reply-To: <20260511212756.3163955-1-visitorckw@gmail.com>
References: <20260511212756.3163955-1-visitorckw@gmail.com>
Subject: Re: [PATCH bpf-next v3] m68k, bpf: Add initial BPF JIT compiler support
From: bot+bpf-ci@kernel.org
To: visitorckw@gmail.com,geert@linux-m68k.org,ast@kernel.org,daniel@iogearbox.net,andrii@kernel.org,eddyz87@gmail.com,memxor@gmail.com
Cc: martin.lau@linux.dev,song@kernel.org,yonghong.song@linux.dev,jolsa@kernel.org,jserv@ccns.ncku.edu.tw,eleanor15x@gmail.com,marscheng@google.com,linux-kernel@vger.kernel.org,linux-m68k@lists.linux-m68k.org,bpf@vger.kernel.org,visitorckw@gmail.com,daniel@thingy.jp,ast@kernel.org,andrii@kernel.org,daniel@iogearbox.net,martin.lau@kernel.org,eddyz87@gmail.com,yonghong.song@linux.dev,clm@meta.com,ihor.solodrai@linux.dev
Date: Mon, 11 May 2026 22:12:31 +0000 (UTC)

--===============7240238835478354730==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

> diff --git a/MAINTAINERS b/MAINTAINERS
> index b2040011a386..261cc1124685 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -4699,6 +4699,12 @@ L:	bpf@vger.kernel.org
>  S:	Maintained
>  F:	arch/loongarch/net/
>
> +BPF JIT for M68K

This isn't a bug, but the surrounding BPF JIT entries all use lowercase
'for': 'BPF JIT for ARM', 'BPF JIT for ARM64', 'BPF JIT for LOONGARCH',
'BPF JIT for MIPS', etc. For consistency, should this be
'BPF JIT for M68K'?

Reference: https://lore.kernel.org/bpf/20260429133910.6F6DCC19425@smtp.kernel.org/

> +M:	Kuan-Wei Chiu <visitorckw@gmail.com>
> +L:	bpf@vger.kernel.org
> +S:	Maintained
> +F:	arch/m68k/net/
> +
>  BPF JIT for MIPS (32-BIT AND 64-BIT)
>  M:	Johan Almbladh <johan.almbladh@anyfinetworks.com>
>  M:	Paul Burton <paulburton@kernel.org>

[ ... ]

> diff --git a/arch/m68k/net/bpf_jit_comp.c b/arch/m68k/net/bpf_jit_comp.c
> new file mode 100644
> index 000000000000..1531b321410a
> --- /dev/null
> +++ b/arch/m68k/net/bpf_jit_comp.c

[ ... ]

> +static int emit_call(const struct bpf_insn *insn, struct jit_ctx *ctx)
> +{
> +	const s8 arg_regs[] = { BPF_REG_5, BPF_REG_4, BPF_REG_3, BPF_REG_2, BPF_REG_1 };
> +	const s8 *tmp1 = bpf2m68k[TMP_REG_1];
> +	bool extra_pass = ctx->target != NULL;
> +	u64 func_addr;
> +	bool fixed;
> +	int i, err;
> +
> +	err = bpf_jit_get_func_addr(ctx->prog, insn, extra_pass, &func_addr, &fixed);
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
> +	emit_16(ctx, 0xc340);					/* exg %d0, %d1 */
> +
> +	return 0;
> +}

Does the exg %d0, %d1 swap the halves of the return value incorrectly
for BPF-to-BPF subprogram calls (BPF_PSEUDO_CALL)?

The emit_call() function unconditionally swaps %d0 and %d1 after all
calls, which appears correct for C ABI helper functions (where high 32
bits are in %d0, low in %d1). However, BPF subprograms place their 64-bit
return value in BPF_REG_0, which is mapped to %d1 and %d0.

If a BPF subprogram returns a value via BPF_REG_0:
    BPF subprogram: BPF_REG_0 -> %d1:%d0 (high:low)
    After exg:      %d0:%d1 (swapped - incorrect ordering)

Additionally, the prologue assumes C ABI and reads a context pointer
from 8(%fp):

arch/m68k/net/bpf_jit_comp.c:build_prologue() {
    emit_16(ctx, 0x202e);       /* move.l 8(%fp), %d0 */
    emit_16(ctx, 8);
}

But BPF-to-BPF calls pass arguments via the stack (pushed by emit_call),
not via the C calling convention. Wouldn't this cause the prologue to
read an incorrect context pointer for BPF subprogram entry points?

Reference: https://lore.kernel.org/bpf/6736ffb5.050a0220.11da83.0029.GAE@google.com/


---
AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md

CI run summary: https://github.com/kernel-patches/bpf/actions/runs/25698934894
--===============7240238835478354730==--
