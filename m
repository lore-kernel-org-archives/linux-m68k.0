Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FD43382395
	for <linux-m68k@lists.linux-m68k.org>; Mon, 18 May 2026 17:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779124892; cv=none; b=cgzW8TnewDkDd6/3IRdeCPmk17/hwo4IX5C8S/QxMhEIWAVVSjH/AjexA3jqqy/rH4OQmNx3vnvYV9jhYioliL/D3jPGNpFdnWzH4ejA/PhuEN1bsNIn+eQSMU/tVEQiPvUNHP789gTOEN4bvyNAOkCuKYvQPYz92vW8rV5Uo0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779124892; c=relaxed/simple;
	bh=lmIpfVH09uw6skieK6a7+eAdiOZHXfLwP/3VvLrBdkM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SfjLpgKhrLYMSP9Zwka9ENiaMhyzCEF/f9GK9eKcazu7SVviDhXmOOvuwH2URVD3iQ9KxrCRI9tod8iutsdnOVbWFCmc0uZHgK2pD4NVDU1DNsMPO4EwbfOEQ6fHmK9LLoKJUZH2vYGay558DNTx4sBF0i/pY4MYHM0dFqVL1Gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EVQABDFG; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EVQABDFG"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2b9fcf7c91bso27282315ad.0
        for <linux-m68k@lists.linux-m68k.org>; Mon, 18 May 2026 10:21:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779124891; x=1779729691; darn=lists.linux-m68k.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=byQGBQ0gkbnM4aMKl0MiGQ340VfWIeN70GJT/M+hFdU=;
        b=EVQABDFG5DdHQwatBvCrD9MIKmFFXI/QC28ALVAk300b1k62mOUPXGy7C5m7el4irz
         /1IkR+PCAAL3tNL7xQ0o5DWpM1Sv1ST4q8+N/xrv/Ippve1+X42JJAg3A0OkYuWfTxuO
         Hu+6xGYoeuTa536lnunQFnPdZgCcp1lzAAnnGE+gc/V9i63oZwRnK8u5S2KrzS5o8ZMV
         8bAfdWikagTDZy13wHHULuLmQi1DNzIaLenTBgsUkxhrmRGq1ccf7TjJ3v28u5jYUPzL
         rthbJQq/+fG3Hro8nFH63c0AVMJzAaCnZQBZ8BZLVIaudAP3MTAUsiyeJHX8gDhei9zm
         h8bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779124891; x=1779729691;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=byQGBQ0gkbnM4aMKl0MiGQ340VfWIeN70GJT/M+hFdU=;
        b=cO4+m6mAvVAduYceIuxvA3o9YtDm53/mXzHAr2uPg3PDrwvJ8enAgzN8JJdX6LI0Ne
         v6IPEiZZDWp4OF7C4Vq/W3HGDw9cfdAbK8a7ik1IBokC2D2JAIitKRSIxiQqoKvamjy2
         KRyu+nQ+saaCxuLsBTIgmqFNwMk1q7a9hBphWmSzlYrSorPPJt4CYFHwhS1TQakqJZp1
         7SBgBmf1SDQhnX9xsGRezys6TjTpa+t/OHMcDriJF359BGeWMGDodqqYCczGyzB4HOaT
         8Ey8IG73WHsZBtdv+ZJocoNXNK8aB9k50ywokHK8kBIKRkU0xWy4u6GvJNoJcz/FXNn3
         tbwg==
X-Forwarded-Encrypted: i=1; AFNElJ+PSx6aWuzV4H4322QEbV0xaewei1TsH7k19SIeN6jM3AuNDn6zVxHV5u4wyebaJkvHiqEhULfJckKo@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YzMy3dqscjji3jJIaNDYF+1/6yjjLl6SVAx1p8TQE6/jnndTZ2j
	kQ3oTEiyyS+EiOOPCU46rVd1wbgfZIrzyR5QubbEmg8DdGLe8mprDvpL
X-Gm-Gg: Acq92OFP4A+dA1ZIKuGdqI8AxZxzyi2HQo+JqjxY8C7eulHv6mzVBEsdhj+oFITuQ2u
	qnpehi/lzDADr9l4F2JxxA9q7Z2EZyZJujA8m2rXoqdBtGE5ngUn1lh4k1T1b8WOrtJkmBJXIGD
	AG7HYWTHdT94Xyx/0Z+uuZ8SWBXka2N7ABKJV0SerqsNF4WOnqwRnYZsJvxd/oECNFQFTQniWlD
	SbWA574h+xLLUWJ0RKWJKiSPjjXIVa6fG7bAseX9MnGuXzgqYY47W1P6eAuSDH9xvd5ZP/0wZI7
	6ZCoG4gXoP97mcxkoPxW1AZZEvjSYE62//AQK0JNo0XcfXcl+rf3NUfOS4poz4aGcw0YVr66ugN
	ep/nDgrqCVJi24qRxX+tKOuMZl818q8zoAIZAPwoOd5TqngouSbHiWcK7iv2B0AMfv7Fild93vu
	AiY4IxUyGSfW0Bl+ePaM99vClvQ8oidOGq7k+pf+2k0hTR
X-Received: by 2002:a17:903:2284:b0:2b2:4bf9:1766 with SMTP id d9443c01a7336-2bd7e949015mr186264205ad.33.1779124890749;
        Mon, 18 May 2026 10:21:30 -0700 (PDT)
Received: from google.com ([118.150.148.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5bd5fb0csm145325175ad.17.2026.05.18.10.21.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 10:21:30 -0700 (PDT)
Date: Tue, 19 May 2026 01:21:24 +0800
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: bot+bpf-ci@kernel.org
Cc: geert@linux-m68k.org, ast@kernel.org, daniel@iogearbox.net,
	andrii@kernel.org, eddyz87@gmail.com, memxor@gmail.com,
	martin.lau@linux.dev, song@kernel.org, yonghong.song@linux.dev,
	jolsa@kernel.org, jserv@ccns.ncku.edu.tw, eleanor15x@gmail.com,
	marscheng@google.com, linux-kernel@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org, bpf@vger.kernel.org,
	daniel@thingy.jp, martin.lau@kernel.org, clm@meta.com,
	ihor.solodrai@linux.dev
Subject: Re: [PATCH bpf-next v3] m68k, bpf: Add initial BPF JIT compiler
 support
Message-ID: <agtKlJgezZCmAdcq@google.com>
References: <20260511212756.3163955-1-visitorckw@gmail.com>
 <85662b75ba1f428629fcb97491d0abe8f3fd93b257cd90766cb4604144dfc331@mail.kernel.org>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <85662b75ba1f428629fcb97491d0abe8f3fd93b257cd90766cb4604144dfc331@mail.kernel.org>

On Mon, May 11, 2026 at 10:12:31PM +0000, bot+bpf-ci@kernel.org wrote:
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index b2040011a386..261cc1124685 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -4699,6 +4699,12 @@ L:	bpf@vger.kernel.org
> >  S:	Maintained
> >  F:	arch/loongarch/net/
> >
> > +BPF JIT for M68K
> 
> This isn't a bug, but the surrounding BPF JIT entries all use lowercase
> 'for': 'BPF JIT for ARM', 'BPF JIT for ARM64', 'BPF JIT for LOONGARCH',
> 'BPF JIT for MIPS', etc. For consistency, should this be
> 'BPF JIT for M68K'?

I think this is an AI hallucination, as my patch already uses a
lowercase 'for'.

> 
> Reference: https://lore.kernel.org/bpf/20260429133910.6F6DCC19425@smtp.kernel.org/
> 
> > +M:	Kuan-Wei Chiu <visitorckw@gmail.com>
> > +L:	bpf@vger.kernel.org
> > +S:	Maintained
> > +F:	arch/m68k/net/
> > +
> >  BPF JIT for MIPS (32-BIT AND 64-BIT)
> >  M:	Johan Almbladh <johan.almbladh@anyfinetworks.com>
> >  M:	Paul Burton <paulburton@kernel.org>
> 
> [ ... ]
> 
> > diff --git a/arch/m68k/net/bpf_jit_comp.c b/arch/m68k/net/bpf_jit_comp.c
> > new file mode 100644
> > index 000000000000..1531b321410a
> > --- /dev/null
> > +++ b/arch/m68k/net/bpf_jit_comp.c
> 
> [ ... ]
> 
> > +static int emit_call(const struct bpf_insn *insn, struct jit_ctx *ctx)
> > +{
> > +	const s8 arg_regs[] = { BPF_REG_5, BPF_REG_4, BPF_REG_3, BPF_REG_2, BPF_REG_1 };
> > +	const s8 *tmp1 = bpf2m68k[TMP_REG_1];
> > +	bool extra_pass = ctx->target != NULL;
> > +	u64 func_addr;
> > +	bool fixed;
> > +	int i, err;
> > +
> > +	err = bpf_jit_get_func_addr(ctx->prog, insn, extra_pass, &func_addr, &fixed);
> > +	if (err)
> > +		return err;
> > +
> > +	for (i = 0; i < 5; i++) {
> > +		const s8 *reg = bpf2m68k[arg_regs[i]];
> > +		s8 d_lo = bpf_get_reg32(reg[1], tmp1[1], ctx);
> > +		s8 d_hi = bpf_get_reg32(reg[0], tmp1[0], ctx);
> > +
> > +		emit_16(ctx, 0x2f00 | d_lo);			/* move.l d_lo, -(%sp) */
> > +		emit_16(ctx, 0x2f00 | d_hi);			/* move.l d_hi, -(%sp) */
> > +	}
> > +
> > +	emit_16(ctx, 0x207c);					/* movea.l #func_addr, %a0 */
> > +	emit_32(ctx, (u32)func_addr);
> > +
> > +	emit_16(ctx, 0x4e90);					/* jsr (%a0) */
> > +
> > +	emit_16(ctx, 0x4fef);					/* lea 40(%sp), %sp */
> > +	emit_16(ctx, 40);
> > +
> > +	emit_16(ctx, 0xc340);					/* exg %d0, %d1 */
> > +
> > +	return 0;
> > +}
> 
> Does the exg %d0, %d1 swap the halves of the return value incorrectly
> for BPF-to-BPF subprogram calls (BPF_PSEUDO_CALL)?
> 
> The emit_call() function unconditionally swaps %d0 and %d1 after all
> calls, which appears correct for C ABI helper functions (where high 32
> bits are in %d0, low in %d1). However, BPF subprograms place their 64-bit
> return value in BPF_REG_0, which is mapped to %d1 and %d0.
> 
> If a BPF subprogram returns a value via BPF_REG_0:
>     BPF subprogram: BPF_REG_0 -> %d1:%d0 (high:low)
>     After exg:      %d0:%d1 (swapped - incorrect ordering)
> 
> Additionally, the prologue assumes C ABI and reads a context pointer
> from 8(%fp):
> 
> arch/m68k/net/bpf_jit_comp.c:build_prologue() {
>     emit_16(ctx, 0x202e);       /* move.l 8(%fp), %d0 */
>     emit_16(ctx, 8);
> }
> 
> But BPF-to-BPF calls pass arguments via the stack (pushed by emit_call),
> not via the C calling convention. Wouldn't this cause the prologue to
> read an incorrect context pointer for BPF subprogram entry points?
> 

I think currently it works because pseudo calls will fail at
bpf_jit_get_func_addr() and fall back to the interpreter anyway.

I might try to fix this issue, test it, and submit a v4.

Regards,
Kuan-Wei

> Reference: https://lore.kernel.org/bpf/6736ffb5.050a0220.11da83.0029.GAE@google.com/
> 
> 
> ---
> AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
> See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md
> 
> CI run summary: https://github.com/kernel-patches/bpf/actions/runs/25698934894

