Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ADC6337699
	for <linux-m68k@lists.linux-m68k.org>; Sat, 10 Oct 2026 17:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791653176; cv=none; b=s+qSm+Zbs3yqhhBlIS699VsmDtrv19VCfyD7uu48pIzk5O5v6rDXThU+ltOMC5K58vQu1wNlv8Cu5eE7RdbWtQ/jm8IsgFMRXv9y5EQcalLsOAKpq6DK3RWqvWX/mRECVmHdB8SBNq3XOTD+dAu/WJyrepgZanlUjVzYApMBz7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791653176; c=relaxed/simple;
	bh=pO2nhY0p/Pl6NJdTHpih7FB0gov9OGpJdNM7rwPn9XU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PunulKotqrknnFpS/bJJK0p6BabPKyGMdZjN2PxfTzIwE5mXx16U6RBEo4q5i9BIvqYa4w7mLePGt+8BfmPKyS1dmeG7nX/dhmhyP4hYnxGhWrsTj24hpRWRRSdFZadtKqq+pLkyjGv4hMzmHPhdVFOICSg0EVHqL6CsHAl1SyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OaMC3kVq; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OaMC3kVq"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-ccce6d9abfeso426521a12.1
        for <linux-m68k@lists.linux-m68k.org>; Sat, 10 Oct 2026 10:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791653175; x=1792257975; darn=lists.linux-m68k.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Aab5fv7PsWlNKwhoVHnjQ1wSbbAhmt/vHJ7yVdXXP80=;
        b=OaMC3kVq1naZz926DGYPiA2llPuZR9dC5Uw2382mn81une5OrG5JNCql48TrO+8eYP
         eIO0m7vMoUOu1QsNdG1/Pfr5IoT1UnoEhQjh4Jjd8zsoVbavsTq/n98f7pVKymq6UA0a
         c1FkisjBSQlC5JBdL5Hsf1UadGhErH9zg8y9fS1cs8PGOE05XScON2vMc79T2xOTRntn
         xtAXKFo2Mq5yRvEhKXxYxjn/EImbHsVb3k3mkGuw17QF9OJ7VotaEyXb5DWmIA4vQo26
         Wq/U4WYZsF1GpoPE+na7wLC7P3B9q3N1/EERIG0YLjtP+MkmySICC4cB4gDTAlT3aCQk
         zMwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791653175; x=1792257975;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Aab5fv7PsWlNKwhoVHnjQ1wSbbAhmt/vHJ7yVdXXP80=;
        b=K/IlKoykBJqG3y1A77zxKFTdY2lXcUv49Mom+t8IoUILELgiUTEGu5RxHxACzVYXWh
         /TFDTQBCMyktaQVa1nu0YLCY26Jg5cqyT4Cj6Vx8EQpDqH+/C7EJAlt+gN++yliQYLiX
         2Byrgn4uoia2l3zHGk0otbZvfGG1GbWv9ORpWmEqvCNrEylafD0hWipRPEpiMQgM/wmq
         jae44m7nXdeFcmijGZlQjTKNaQcDTln1kM9tPcgtClzOGmLMRDCxLTCDL/VK6j5blvCf
         Q8ZTAl/nfEJKJp5zEpMasRufbDDQXBtTbDHNLjxAoEfLi2VrW/88AX0ROGbONi9n/jhm
         DBBA==
X-Forwarded-Encrypted: i=1; AKwUvBxH+b61cBPuih4F2dzgJM29qXwTJQOnodeNtVHT9cZZEjtxhebLyiWkpXd5fdgbcPCcCoBxx9JgUsnG@lists.linux-m68k.org
X-Gm-Message-State: AFq9FYIjeE4BNEsbdDXqMLOW35rbKQIA4QKqFXoovHqBlaSrY+qqxhwD
	eoYKGpTjWMxWHiwzAmmA+QC9oaFhPTPw3aBF/sBJ5SoPRo30Orc0eXOk
X-Gm-Gg: AYBFou20e7t1yYEl7T+n2nMUHjQd4j0L7UYZMYk3evLSJLvlX3565wQ35tOOs5vozGW
	oEgmZimXoJHNfcJ9Sd6oXKVKtLrf66kjoaXNu2i580woli9oGRIuigw+qNrk1Ss5d0V4bcQOCzk
	Un1rW+VGq3ej5v0SRiihHjD6kgFN6UDWQ6MJp45NuBcKEMb1galsABZB0YQo4ok7g8ledL9D5+8
	6dDdwqVHoK4r4PEkopSVDliVEQAVYM85CUjOzOgCxJAVDFxYhcic3ji+IeP1FU8FvUwMqeSVUAW
	wJ/h0oU0KPmFedoHX/a+wffjLV8uE0Po77r7IgxryJiJg/lDCjWtCsKx7hK+0lhR3AWlw8TZaz0
	rOuPy5ErwlkeEvn0ZTdqaVhaV+x74He8HJNoud9g7uwDTAoyFj4iNVBmZU+Rf8vPPGYJKyeJ/uQ
	MvvOSg5sUeNT99FMjH6qTe5GNyKQ5N2Am2dwhv2BFplfUcmfNi28fYlyE1tFj4ITDwcwUHeoc2K
	qd9CXkdOsN7x0IbqPw40LKGcNPWrxgPfBPI6i9U3wT8
X-Received: by 2002:a17:90b:134d:b0:3ab:2236:6b3d with SMTP id 98e67ed59e1d1-3ab3a94f0a2mr4730803a91.27.1791653174796;
        Sat, 10 Oct 2026 10:26:14 -0700 (PDT)
Received: from google.com (61-230-52-229.dynamic-ip.hinet.net. [61.230.52.229])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab38b9639bsm8513378a91.4.2026.10.10.10.26.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 10:26:14 -0700 (PDT)
Date: Sun, 11 Oct 2026 01:26:07 +0800
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: corbet@lwn.net, skhan@linuxfoundation.org, geert@linux-m68k.org,
	daniel@iogearbox.net, eddyz87@gmail.com, memxor@gmail.com,
	andrii@kernel.org, gerg@linux-m68k.org, rdunlap@infradead.org,
	martin.lau@linux.dev, song@kernel.org, yonghong.song@linux.dev,
	jolsa@kernel.org, emil@etsalapatis.com, ihor.solodrai@linux.dev,
	jserv@ccns.ncku.edu.tw, marscheng@google.com, eleanor15x@gmail.com,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org, bpf@vger.kernel.org,
	Daniel Palmer <daniel@thingy.jp>
Subject: Re: [PATCH v7] m68k, bpf: Add initial BPF JIT compiler support
Message-ID: <asp1LyCLB8J5Dh_q@google.com>
References: <20261005185251.2422114-1-visitorckw@gmail.com>
 <DM199Y25XQ6Q.X5YFLA8I7RSJ@gmail.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DM199Y25XQ6Q.X5YFLA8I7RSJ@gmail.com>

On Sat, Oct 10, 2026 at 03:16:04PM +0000, Alexei Starovoitov wrote:
> On Mon, Oct 05, 2026 at 06:52 PM Kuan-Wei Chiu <visitorckw@gmail.com> wrote:
> > Tested with the test_bpf.ko:
> > test_bpf: Summary: 1061 PASSED, 0 FAILED, [1049/1049 JIT'ed]
> > test_bpf: test_tail_calls: Summary: 10 PASSED, 0 FAILED, [10/10 JIT'ed]
> 
> test_bpf.ko doesn't go through the verifier.
> It has no bpf-to-bpf calls and no callbacks.
> 
> > Changes in v7:
> > - Size subprog stack frames from stack_depth instead of MAX_BPF_STACK.
> > - Preserve callee's r2 across BPF_PSEUDO_CALL for aggregate returns.
> > - Clean up state on extra_pass failure in bpf_int_jit_compile().
> 
> So these are fixes for bot findings in the code that was never run.
> It doesn't work. See below.
> 
> [...]
> 
> > +	emit_16(ctx, 0x4ee8);					/* jmp d16(%a0) */
> > +	emit_16(ctx, CPU_IS_COLDFIRE ? 48 : 44);
> 
> When the target prog has subprogs its prologue is the is_func flavor.
> It's 110 bytes, and 44 is in the middle of
> move.l %d0, BPF_R2_LO(%fp). The cpu executes 0xfff0.
> 
> > +static void build_prologue(struct jit_ctx *ctx)
> > +{
> > +	int bpf_stack = ctx->prog->is_func ?
> > +			round_up(ctx->prog->aux->stack_depth, 4) : MAX_BPF_STACK;
> 
> stack_depth can be more than MAX_BPF_STACK.
> may_goto adds 8 bytes on top of what the prog uses.
> See stack_depth_extra in bpf_do_misc_fixups().
> When the prog uses 512 bytes the counter is at r10 - 520.
> That's where movem.l saved %d4 and %d5, so the C caller of the prog
> gets them back corrupted.
> The target of a tail call reuses the frame, so every frame needs
> that extra space.
> 
> > +	if (ctx->prog->is_func) {
> > +		const s8 arg_regs[] = { BPF_REG_1, BPF_REG_2, BPF_REG_3, BPF_REG_4, BPF_REG_5 };
> > +
> > +		for (i = 0; i < 5; i++) {
> > +			int offset = 8 + i * 8;
> 
> jit_subprogs() sets is_func for func[0] too, which is the main prog.
> It's called from C as bpf_func(ctx, insnsi), so 8(%fp) is ctx and
> 12(%fp) is insnsi. This loop makes R1 = (u64)ctx << 32 | insnsi.
> Every prog that has a subprog or a callback reads its ctx
> out of prog->insnsi.
> 
> arm32 and x86-32 JITs don't support bpf-to-bpf calls.
> Drop them from this patch.
> Add them in a follow up when you can run test_progs.

Thanks for the review and the detailed explaination.

My initial patch didn't include subprog support, but I endedd up trying
to deal with it after the bots complained about it.

I'll reject BPF_PSEUDO_CALL, and reserve the extra 8 bytes on the
stack.

Regards,
Kuan-Wei
