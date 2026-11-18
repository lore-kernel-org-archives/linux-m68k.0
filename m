Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795017748;
	b=mFP3X/h1tdByEeCcFmmaSoeuaqHe7eK+VwPGbF2R1Jrjq2MINcEHzKESouWy4bvPkAbD
	 ewoqx1syeeG6Mo9pNdCqV7i6fe/pFHsswQPXJsrTeMONbME7PQNFcX5KWmrDbqFtan8Pz
	 WswpBZV+KsQmoWuQUKTtmcKQlGwuO2wAyQxFCqRl3o0bHqIronBAPC1CwqYBaGHj17qLV
	 BypftiMtD3dHpWZnT4j+WQ5ToZEIw3Qxpv6y76SFTjTD+kNzyxwbjS1/gqViO5mNM5+/8
	 2X8EV7o6gLKV8nRJ2UvGopEGnDzgsuDTjKTty3+PVKeFQbw8YgAA2d3z6r12aMzbOjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795017748;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Content-Type:
	 MIME-Version:Message-Id:In-Reply-To:References:Subject:From:To:Cc:
	 Date;
	bh=XrdabjoeKoqZWgiPzIuL3cPjSBYVcnxPS9RnfVz1GGs=;
	b=QS0IdOaMx1hWhDPFmtDp33RoZPFuC0Qz2aPD4g+b/Fjrd4QNv8AwDKA2SNSS6RaP+gEK
	 dWavChnDl0wBLVa5lDg3sis66PbxVTUKVwOBLRf0RdbztScbm7fljLewfqmfK1v9vztDR
	 6e43Kb2a2boTpSxT4DjzIc4CJHJ+rij1eyHhO577IxFODYhdKi1tDRIjCbBu42jxsxm/f
	 gfTXTfCawGEfPdeuEJuAGzfzc2GWvf6MGTm93uUQ8uypUPrYJ/6+lB135BXhGRjZctdP8
	 BGibF58O4ONT7rNmb+TB54qFH+RoKOTJAhalW+c4ip2x28vcuDFeQ43FbYaBVRK4HBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WU1Tfeou;
	arc=none smtp.remote-ip=172.105.4.254
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72FBA606A33E
	for <linux-m68k@lists.linux-m68k.org>; Wed, 18 Nov 2026 16:02:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72FBA606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WU1Tfeou
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 01E4F626F6;
	Wed, 18 Nov 2026 16:02:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA9531F000C5;
	Wed, 18 Nov 2026 16:02:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795017746;
	bh=XrdabjoeKoqZWgiPzIuL3cPjSBYVcnxPS9RnfVz1GGs=;
	h=In-Reply-To:References:Subject:From:To:Cc:Date;
	b=WU1TfeoutT9TRUjHxlvhGm9LpJKpy+H4cCwsKZ3CtgcKFzxOVt8QTF3OsSPY+3SqT
	 aAdu9dQt8z+RBpbVA/FbYcUwIRmBLVvlyc5kQrdWtafZ6KLOVJTvIPVYFojOIf30AZ
	 7lgsg7/pnxk15kCBZHn80H92G3q8ZpEvUEzxElp9QZrPkHSaLvjOYd5ZGhHU42H8G4
	 VyW/r0O/Bq1+6SqgxasiVU+YChY67/DuTQsRwj4ySZ3cbDQSvl1wIaiTAE/9/SSC/J
	 gb1Tik48CySE8lgtyKNxCxwfEza8wnMmpe0Cl9c0+K6Gt1nSwS89PVGSXbdeAhmNjx
	 j2BjueANmd9RA==
Content-Type: multipart/mixed; boundary="===============3130468370452098512=="
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-Id: <b65ecbc71f53e21edd402d078451459002dd39941b1dda46aaa0572bdd66b484@mail.kernel.org>
In-Reply-To: <20261118152054.999990-1-visitorckw@gmail.com>
References: <20261118152054.999990-1-visitorckw@gmail.com>
Subject: Re: [PATCH] m68k, bpf: Add initial BPF JIT compiler support
From: bot+bpf-ci@kernel.org
To: visitorckw@gmail.com,corbet@lwn.net,geert@linux-m68k.org,ast@kernel.org,daniel@iogearbox.net,andrii@kernel.org,eddyz87@gmail.com,memxor@gmail.com,gerg@linux-m68k.org
Cc: skhan@linuxfoundation.org,rdunlap@infradead.org,martin.lau@linux.dev,song@kernel.org,yonghong.song@linux.dev,jolsa@kernel.org,emil@etsalapatis.com,ihor.solodrai@linux.dev,marscheng@google.com,eleanor15x@gmail.com,jserv@ccns.ncku.edu.tw,linux-doc@vger.kernel.org,linux-kernel@vger.kernel.org,linux-m68k@lists.linux-m68k.org,bpf@vger.kernel.org,visitorckw@gmail.com,daniel@thingy.jp,ast@kernel.org,andrii@kernel.org,daniel@iogearbox.net,martin.lau@kernel.org,eddyz87@gmail.com,yonghong.song@linux.dev,mason@kernel.org,ihor.solodrai@linux.dev
Date: Wed, 18 Nov 2026 16:02:23 +0000 (UTC)

--===============3130468370452098512==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

> m68k, bpf: Add initial BPF JIT compiler support

TL;DR: Nit only: the "bne.s .+8" style comments in the m68k JIT's 64-bit
compare code are off by 2 (should be .+10); the emitted encoding looks
correct.

> diff --git a/arch/m68k/net/bpf_jit_comp.c b/arch/m68k/net/bpf_jit_comp.c
> new file mode 100644
> --- /dev/null
> +++ b/arch/m68k/net/bpf_jit_comp.c

[ ... ]

> +	} else {
> +		emit_16(ctx, 0xb080 | (d_hi << 9) | s_hi);	/* cmp.l s_hi, d_hi */
> +
> +		switch (op) {
> +		case BPF_JEQ:
> +			emit_16(ctx, 0x6608);			/* bne.s .+8 */
> +			emit_16(ctx, 0xb080 | (d_lo << 9) | s_lo); /* cmp.l s_lo, d_lo */
> +			EMIT_JMP32(0x6700);			/* beq.l */
> +			break;

[ ... ]

> +		case BPF_JGT:
> +			EMIT_JMP32(0x6200);			/* bhi.l */
> +			emit_16(ctx, 0x6508);			/* bcs.s .+8 */

This isn't a bug, but are the "bne.s .+8" style comments accurate?

In m68k assembler syntax "." is the address of the current instruction, so
"bne.s .+8" would assemble to 0x6606, since the 8-bit displacement is
relative to the opcode address + 2.

The emitted word 0x6608 has a displacement of 8, so the branch target is
".+10".  It skips the 2-byte cmp.l and the 6-byte b<cc>.l, so the code
looks correct and only the comment is off by 2.

The same comment pattern appears for bne.s, bcs.s, bhi.s, blt.s and bgt.s in
the other 64-bit compare cases of emit_jmp().  Would ".+10", or something
like "bne.s +8: skip cmp.l + b<cc>.l", match the encoding better?


---
AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md

CI run summary: https://github.com/kernel-patches/bpf/actions/runs/44337242298
--===============3130468370452098512==--
