Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795715110;
	b=EGO34Bud102yHGGF/6AUI5EYp9tjkSmID43tGUGNJVsYDtFXsf2oPh2CQ8MUVpuCxmJ1
	 lGxXqfQlI69ZX4yEMI+/EYME+J4v/gze4nEerrffCP2+VQPNbohUlKVlZ/iWE11XfMFME
	 UBsFDCW0MMfWktRR2W9htV7wp7zvLLaRHc9SS7/lgkMoCtAG6hlydQ9og9KKE7HJ7Gp6Y
	 h0W69PNVTOdorjVgcHnVDvHU5pFAe7VxTH57vwbxfwTgEgPj67uW2Oma2RvWnJd3MXDTo
	 8JY3ZS0J9v6M5y3OJUgzT4emU6zexjG4oIgg3UuaYEPSq9K5yw6S+OYYECaHvTxqxNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795715110;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Content-Type:
	 MIME-Version:Message-Id:In-Reply-To:References:Subject:From:To:Cc:
	 Date;
	bh=UVwKvUqZc3YTIGZQosfwnsDxlaSdrCZ8Jhlv1YMbjOM=;
	b=apqrCCUPzhbcrfsEQHCO0X2HWjor8CamgHNd74xM4AqXzweUIZu68CmGA49rCt6+sgIp
	 wKn6WoYlvhjF9jKRORQicFYyFDbsqsuC5omx6TWENfSGmzo7qwJS4aXXiEMgSrOXj0Lsf
	 h33RaX/Hov4H3fdqt+7UosyqhY9v61ZgomsVntu14yIWzQdcpc0jNWW4WodS0gNtQ34as
	 dVv087MvLHTSghu8piYGEsHWWFar7p9wnfc96NbvAS5ENx8g1idaqUYFv0BHfx53UKclZ
	 2mMXD515lFqsbaNv+PMniFBHaYoD1T/e6PP5DYmYLulpWD8ZfvWFSbg2QHqVCu0JTXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=B9KoWkCz;
	arc=none smtp.remote-ip=172.105.4.254
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0B2D606A339
	for <linux-m68k@lists.linux-m68k.org>; Thu, 26 Nov 2026 17:45:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0B2D606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=B9KoWkCz
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2966760CDF;
	Thu, 26 Nov 2026 17:45:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02F411F000C6;
	Thu, 26 Nov 2026 17:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795715108;
	bh=UVwKvUqZc3YTIGZQosfwnsDxlaSdrCZ8Jhlv1YMbjOM=;
	h=In-Reply-To:References:Subject:From:To:Cc:Date;
	b=B9KoWkCz5lur7rU3+m/m0+34kzI7sd3+putoPB8nGh8af+bYaAqekCFoAHTTDTpTL
	 ZsLUQQ56kuB289CSTCGySB/Nina/JbyRyZ68huuATJcYmq4quRmbRbbZbAyPENQaTB
	 721r0/pqCreV8UMwFOSrd5GIrup56RPy2FDHsDeDB6bmCVukJFFBp6eanbSxnuyyG9
	 g0Irzy2agVNA1W6bN2lZJ5C4OTVcKekAucDEZTtMeWNjHmGZSp8s6AHEwTh9XSuHDu
	 SdmDi8WtP3LP0PT5NHhvQIVDNWEJIKBTTYFujFOLJB90Xq3M8rjaNHlpuIO3ns7rfv
	 8n703OMD6826A==
Content-Type: multipart/mixed; boundary="===============4556629013773228158=="
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-Id: <0eb06d3a00f2e4d56c2f25db16eb8b02160387281fe455b0e0e5d7466492657e@mail.kernel.org>
In-Reply-To: <20261126170538.3471057-1-visitorckw@gmail.com>
References: <20261126170538.3471057-1-visitorckw@gmail.com>
Subject: Re: [PATCH v12] m68k, bpf: Add initial BPF JIT compiler support
From: bot+bpf-ci@kernel.org
To: visitorckw@gmail.com,corbet@lwn.net,geert@linux-m68k.org,ast@kernel.org,daniel@iogearbox.net,andrii@kernel.org,eddyz87@gmail.com,memxor@gmail.com,gerg@linux-m68k.org
Cc: skhan@linuxfoundation.org,rdunlap@infradead.org,martin.lau@linux.dev,song@kernel.org,yonghong.song@linux.dev,jolsa@kernel.org,emil@etsalapatis.com,ihor.solodrai@linux.dev,marscheng@google.com,eleanor15x@gmail.com,jserv@ccns.ncku.edu.tw,linux-doc@vger.kernel.org,linux-kernel@vger.kernel.org,linux-m68k@lists.linux-m68k.org,bpf@vger.kernel.org,visitorckw@gmail.com,daniel@thingy.jp,ast@kernel.org,andrii@kernel.org,daniel@iogearbox.net,martin.lau@kernel.org,eddyz87@gmail.com,yonghong.song@linux.dev,mason@kernel.org,ihor.solodrai@linux.dev
Date: Thu, 26 Nov 2026 17:45:05 +0000 (UTC)

--===============4556629013773228158==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

> m68k, bpf: Add initial BPF JIT compiler support

TL;DR: Nits only, no bug found: the m68k JIT hardcodes the tail-call limit
(0x7021) and the 44/48-byte prologue jump offset; suggests named constants and
a check so later edits don't quietly break tail calls.

> diff --git a/arch/m68k/net/bpf_jit_comp.c b/arch/m68k/net/bpf_jit_comp.c
> new file mode 100644
> index 000000000000..96305a8478c7
> --- /dev/null
> +++ b/arch/m68k/net/bpf_jit_comp.c

[ ... ]

> +	emit_16(ctx, (u16)STACK_OFFSET(BPF_TC_LO));
> +
> +	emit_16(ctx, 0x2068);					/* movea.l d16(%a0), %a0 */
> +	emit_16(ctx, offsetof(struct bpf_prog, bpf_func));
> +
> +	emit_16(ctx, 0x4ee8);					/* jmp d16(%a0) */
> +	emit_16(ctx, CPU_IS_COLDFIRE ? 48 : 44);
> +

[ ... ]

> +static void build_prologue(struct jit_ctx *ctx)
> +{
> +	int total_stack = SCRATCH_SIZE + MAX_BPF_STACK + 8;
> +
> +	emit_16(ctx, 0x7021);					/* moveq #33, %d0 */
> +

this isn't a bug, but could the tail-call counter be emitted as
0x7000 | MAX_TAIL_CALL_CNT instead of the literal 0x7021, so that a grep
for MAX_TAIL_CALL_CNT finds this place if the limit ever changes?

Similarly, emit_tail_call() jumps to bpf_func + (CPU_IS_COLDFIRE ? 48 : 44),
which only holds while build_prologue() emits exactly 44 or 48 bytes.  Could
that offset be a named constant that is checked against ctx->idx at the end
of build_prologue(), so a later edit to the prologue cannot quietly break
tail calls?


---
AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md

CI run summary: https://github.com/kernel-patches/bpf/actions/runs/45866130532
--===============4556629013773228158==--
