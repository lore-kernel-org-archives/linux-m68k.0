Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE3E639F166
	for <linux-m68k@lists.linux-m68k.org>; Sun,  3 May 2026 18:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.234.252.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777834616; cv=none; b=Zq6Uiy7LOwZrDV3Zojpn1e5PftI4dnpND2ZXcIC2wbDkNogxZn8Uhipf3LCLwkG4IcRkG3WTBMstaBVfx1nJHGz5umnNERiWemyeh+f4BTWnX4pBo5qnHSPWZmozWSj8ObIDjlqK81gCCG5As9drtw4kfgPiHbzl+GyKebb7bko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777834616; c=relaxed/simple;
	bh=j0cGVdSb3OeGntjLHUrj1ZEV10ZXbzcrg9F87RGjd3k=;
	h=Content-Type:MIME-Version:Message-Id:In-Reply-To:References:
	 Subject:From:To:Cc:Date; b=MyPjdFuQLOs5THemLcFtBDwOA2v3bT8kt4mVvA5EeOqde2V6mhLdN/F5uxQwCNj8Ni2dorcJDVHiKoteLYuQVIRYF+fef+EVEwf4c9Iev6DtdpzB2Eyl22oi5MgvQLrxqj7vm5uuH/XBLICKclTjQgQpDYBRVEKVf9+ERWVAxqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HZD4DbOC; arc=none smtp.client-ip=172.234.252.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HZD4DbOC"
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7B2574001F;
	Sun,  3 May 2026 18:56:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76D34C2BCB4;
	Sun,  3 May 2026 18:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777834614;
	bh=j0cGVdSb3OeGntjLHUrj1ZEV10ZXbzcrg9F87RGjd3k=;
	h=In-Reply-To:References:Subject:From:To:Cc:Date:From;
	b=HZD4DbOCPrrmz1ovHQ3NoWLxws92xtp8vIscxMR6R7KwaZEcERTeWd5MK0mWVd8rc
	 vChhWKAhnnpHsDRXVaoBw6b6Fn70s2dk1Wd3Xh1XZy/9D90Km4z4nhRb+KPG1IaC7T
	 nK8VpkMDwZjVjsuQxfXF0tVHRXRSpjpgNAHk5V4YPmPo7/Bd/CE9wEDOzz+MXMHYay
	 47TeWTAV9nQEPr1eJ0bNwQDwK7rAoWs/Drc1DNVXZaA4JNZ2pck/EoL9qvTcZHGALv
	 9/CSp2DGZcLsDhjNFzqpkBMHpwWLDtLSbobQcOmcgyumOf4ZPbN0S8PDWbhIC1X73l
	 1VAho1nmQfE9A==
Content-Type: multipart/mixed; boundary="===============3581486322790846567=="
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <035d5a7abbcdf71699e0252146338f553088d642979676250306c47d55aa4003@mail.kernel.org>
In-Reply-To: <20260503181504.1037640-1-visitorckw@gmail.com>
References: <20260503181504.1037640-1-visitorckw@gmail.com>
Subject: Re: [PATCH bpf-next v2] m68k, bpf: Add initial BPF JIT compiler support
From: bot+bpf-ci@kernel.org
To: visitorckw@gmail.com,geert@linux-m68k.org,ast@kernel.org,daniel@iogearbox.net,andrii@kernel.org,eddyz87@gmail.com,memxor@gmail.com
Cc: martin.lau@linux.dev,song@kernel.org,yonghong.song@linux.dev,jolsa@kernel.org,jserv@ccns.ncku.edu.tw,eleanor15x@gmail.com,marscheng@google.com,daniel@0x0f.com,linux-kernel@vger.kernel.org,linux-m68k@lists.linux-m68k.org,bpf@vger.kernel.org,visitorckw@gmail.com,ast@kernel.org,andrii@kernel.org,daniel@iogearbox.net,martin.lau@kernel.org,eddyz87@gmail.com,yonghong.song@linux.dev,clm@meta.com,ihor.solodrai@linux.dev
Date: Sun,  3 May 2026 18:56:52 +0000 (UTC)

--===============3581486322790846567==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

> diff --git a/arch/m68k/net/bpf_jit_comp.c b/arch/m68k/net/bpf_jit_comp.c
> new file mode 100644
> index 000000000000..98cef53c6f39
> --- /dev/null
> +++ b/arch/m68k/net/bpf_jit_comp.c

[ ... ]

> +static void emit_alu64_k(const struct bpf_insn *insn, struct jit_ctx *ctx)
> +{

[ ... ]

> +	switch (BPF_OP(insn->code)) {

[ ... ]

> +	case BPF_XOR:
> +		emit_16(ctx, 0xb180 | (s_lo << 9) | d_lo);		/* eor.l d_lo, s_lo */
> +		emit_16(ctx, 0xb180 | (s_hi << 9) | d_hi);		/* eor.l d_hi, s_hi */
> +		break;

This isn't a bug, but the operand order in these comments is reversed.
The m68k encoding 0xb180 | (s_lo << 9) | d_lo represents 'eor.l s_lo,
d_lo', not 'eor.l d_lo, s_lo'. Compare with the identical bytecode in
emit_alu64_x's BPF_XOR case which correctly comments it as 'eor.l s_lo,
d_lo', and emit_alu32_x's BPF_XOR which uses 'eor.l src, dst'.


---
AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md

CI run summary: https://github.com/kernel-patches/bpf/actions/runs/25287107687
--===============3581486322790846567==--
