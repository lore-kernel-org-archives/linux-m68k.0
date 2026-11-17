Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794914125;
	b=czzQIh3khbBGyio9Ii9m0NIrh0l+ylqvYrF3hYuwyLdPZYfCSx/lgaHFnjMCY8jXVe7u
	 1g+ED+o1tkNeZHxr7zGLmDlkbQ2nD7ckNkD31wNxBA8Yx96V3aUIhrQDkVrkZYRKDU8LA
	 yvvQxzlghzS/chiiOsiNkKGC6lBnigJTJ6DIYI1tCn23igMeaIhZ3MC0cAWATaUYEdvDP
	 szQVk70zeCgw8ZeiZtmXZ4c0kC4NmzjN+r4r14bqxHPlSu2OEHSjtooYr6xUHEpTo0kW3
	 4Po3mEWNlNBPPE5bub+YXEFHkRhRmo9NplnTje95KkExE4LNwYlo9pscG8sDvoeNppg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794914125;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=wkAifCWBa4yQo783yHdWz6gkU6PjHxfZYINEMlx6l2I=;
	b=U9ywFGfZNj6jFDsBzjL5Tg3JbF39E4vqoYoolSNICwQw6JRTAOoLNEup+i+Js4AK/0A3
	 8CInM+Hw9HmprxuaMxiVt+nxSzfgyD6g6iBpkhM4URr5yrgeS7ruPtbnGUPVRP5qOWgor
	 cgat13BcJEkjYvQzyM2sjOVbdl734TZKYX/LwqkyxbLwu7qjFZPuQB3ezqOXhPdrC12bK
	 AbVdC+FI/xeQhWyMk/MJ9XpVNeMbIa/evxNKSlsM5XsVIPY27EnNTCrxLmNuyjlJpQfn2
	 sasPrLDsie1PrRLBwh76ILvQTd8/YEdq8NXEPXaKUkpRhDigbZXHFFqu+BhjzsRk/2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=px0DSYaM;
	arc=none smtp.remote-ip=209.85.210.178
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23486606A32A
	for <linux-m68k@lists.linux-m68k.org>; Tue, 17 Nov 2026 11:15:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23486606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=px0DSYaM
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8b2f59de176so4777969b3a.2
        for <linux-m68k@lists.linux-m68k.org>; Tue, 17 Nov 2026 03:15:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794914124; x=1795518924; darn=lists.linux-m68k.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wkAifCWBa4yQo783yHdWz6gkU6PjHxfZYINEMlx6l2I=;
        b=px0DSYaMbW0NjPhp4B1eZfemWxFbWD7FI0X7haDzf3hXHsen737LjNt3ZKaRMdFr0m
         6cra+nRQ4fXgjmTy4sBaXy1NO4IyJw+b7WZaUw/twT2SgVjpOdI/1unLSkNY+wtySCkP
         4GIOeDNz7eaQvWIxORCVD0p95zptvYXUK4PpkLrcX8DitfWBEQslzETXnWaqu81xrMtU
         qi27HqHv/KRVlqbsWqrHU1vzBvjPOLWPT0cQdMNycg91geicBf25E7HNkfSRxnVwM4cN
         uiuC6pnM+esGaqfcqT32+CKFOxDPCL+uXYG2e6SpW5b7/dlxf3IeL6mdOqISHidBCYss
         mRvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794914124; x=1795518924;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wkAifCWBa4yQo783yHdWz6gkU6PjHxfZYINEMlx6l2I=;
        b=ZIEz4QeoNOpZsUvrMcqsDUjp19kNHJdP8no2loJcDZaU4s3b3hSNNvE80h0BVHhqZ4
         MbEgnE80AFBeItiPu/FgkvueSP969sUAcQ8KjDCVa6CNASSdGIE54AS4inAtGxc+nuuG
         F2NfIM/qRzZ9IDp7n1BO7UYSpRMuUnjC8gACzWqPzv2/h+iB+KquzAoybbMZalcrWyds
         wUN53ZoDJQGZUhr7QdCriO9S9MKp1ve6jnU4q9CdCgBIl4vZwnhjpFQ1qvnCHIKi39TQ
         qh9ncJQSCqknko6FVf4zZhiOTw9ZU0MUgsT3HFf1rdqnz+RFkUvu8dnlZEGLuQV7qgui
         PJxg==
X-Forwarded-Encrypted: i=1; AL+hErE1svsowHPosiBUZlMoLcmqZRrXAxfddHBuTxF73BnFbmeFLGP4uGtIZ/50r+2aswVfmIHu+hnqGO2i@lists.linux-m68k.org
X-Gm-Message-State: APuU4Z9bwv4N5sY/7uTvDTqFHEza9OTLoiMjiU5XLatOhGUwrKUPOssd
	UEKnR3AFiGFpuiLsUG7UgtIrQCv0Pn/vOCiYaJtZmWLp2mb7N+dCswFc
X-Gm-Gg: AYBFou3oTn9yLLUyZxDUZ9XkNHkKcUBqeJhX1vSqmwUXGYPKYbqFsV1mLk+wmGm30xT
	gLwHswKMQAJn3+cExf6dilxz0r+MWxOixJGqnN9RpACbfRTCQRzwDFvgFqDSeQIBl1AcVxIP5Ix
	N7I9VwMEMMGWHYmAW0HH85RW0Ywow96pCLaI5E1vsCnt5HXIA+9DH4WLve8nmhe7a2C/+JvvOa+
	21CVh7lVq3+Wx80tdoPSFJmcamTCsr3WG/tJwoGAp6oncFROgl2oQ8831QV6e31Y+qbUn8PM+hM
	Nd6HwaKH+33xW4orinsMJ4VAfnio231h0DX4RKuMtnwWi7lbO/GhO5p4UoFOXvI4MjnERlkoDDw
	nazVQzDwWnWk59cCzVtMNQ+5Kwl2rMc95YZwMdy5AbrmVpxut4DPPLbEPkcaoxlijlfQU4g9HsL
	6REbKOdn3UlJ2+krq32nM2fVx3JFt7CzsynWnXC8PRKBmwq8CFBCZpkwraeCgaTkmnwZ6vlijmr
	/2Xu4lsSjl6ihkq1Q4mm7owFWl1sQ03nIC8tPbd8T8m6h8YABZlh0Oiyk9UQImG8aqS/zo4shKK
	nCJZAhorMT7VCaIylsBnJ9ntXqxdXsbhwyx6jycB/fiiml9DhcM6u6tx/QVRGcdP
X-Received: by 2002:a05:6a21:180a:b0:3eb:b103:6eb1 with SMTP id adf61e73a8af0-3f7a83b9fdemr13383267637.44.1794914124417;
        Tue, 17 Nov 2026 03:15:24 -0800 (PST)
Received: from google.com ([2a00:79e0:2039:4:4074:47bf:1530:a459])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde0f3f4c7bsm1237164a12.22.2026.11.17.03.15.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 03:15:23 -0800 (PST)
Date: Tue, 17 Nov 2026 19:15:16 +0800
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: bot+bpf-ci@kernel.org
Cc: corbet@lwn.net, geert@linux-m68k.org, ast@kernel.org,
	daniel@iogearbox.net, andrii@kernel.org, eddyz87@gmail.com,
	memxor@gmail.com, gerg@linux-m68k.org, skhan@linuxfoundation.org,
	rdunlap@infradead.org, martin.lau@linux.dev, song@kernel.org,
	yonghong.song@linux.dev, jolsa@kernel.org, emil@etsalapatis.com,
	ihor.solodrai@linux.dev, marscheng@google.com, eleanor15x@gmail.com,
	jserv@ccns.ncku.edu.tw, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
	bpf@vger.kernel.org, daniel@thingy.jp, martin.lau@kernel.org,
	mason@kernel.org
Subject: Re: [PATCH v10] m68k, bpf: Add initial BPF JIT compiler support
Message-ID: <avw3REBe9uzZG2HQ@google.com>
References: <20261117095110.2736779-1-visitorckw@gmail.com>
 <146c493fb3b8d5f5171ad146cdc23e4f2693e1e142ad11ca67db5eae60cd4abb@mail.kernel.org>
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
In-Reply-To: <146c493fb3b8d5f5171ad146cdc23e4f2693e1e142ad11ca67db5eae60cd4abb@mail.kernel.org>

On Tue, Nov 17, 2026 at 10:36:39AM +0000, bot+bpf-ci@kernel.org wrote:
> > m68k, bpf: Add initial BPF JIT compiler support
> 
> TL;DR: bpf_int_jit_compile() has no check for an already-JITed prog, so
> jit_subprogs()'s second pass may leak the first executable image, e.g. with an
> exception_callback tag, letting a CAP_BPF user exhaust JIT memory.
> 
> > diff --git a/arch/m68k/net/bpf_jit_comp.c b/arch/m68k/net/bpf_jit_comp.c
> > --- /dev/null
> > +++ b/arch/m68k/net/bpf_jit_comp.c
> 
> [ ... ]
> 
> > +struct bpf_prog *bpf_int_jit_compile(struct bpf_verifier_env *env, struct bpf_prog *prog)
> > +{
> > +	struct bpf_binary_header *header;
> > +	struct jit_ctx ctx;
> > +	unsigned int image_size;
> > +	u8 *image_ptr;
> > +
> > +	if (!prog->jit_requested)
> > +		return prog;
> > +
> 
> [ ... ]
> 
> > +	header = bpf_jit_binary_alloc(image_size, &image_ptr, 2, jit_fill_hole);
> > +	if (!header)
> > +		goto out_off;
> 
> [ ... ]
> 
> > +	prog->bpf_func = (void *)ctx.target;
> > +	prog->jited = 1;
> > +	prog->jited_len = image_size;
> > +	goto out_off;
> 
> If jit_subprogs() calls bpf_int_jit_compile() a second time on a func[i]
> that is already JITed, doesn't this allocate a new header and overwrite
> prog->bpf_func, leaving the first image unfreed?
> 
> jit_subprogs() in kernel/bpf/fixups.c calls bpf_int_jit_compile() twice
> for every subprog, once in the first loop and again in the extra pass:
> 
>     old_bpf_func = func[i]->bpf_func;
>     tmp = bpf_int_jit_compile(env, func[i]);
>     if (tmp != func[i] || func[i]->bpf_func != old_bpf_func) {
>         verbose(env, "JIT doesn't support bpf-to-bpf calls\n");
>         err = -ENOTSUPP;
>         goto out_free;
>     }
> 
> On the second call only prog->jit_requested is checked, which is still
> set, so both passes run again.  bpf_jit_binary_alloc() returns a new
> header and prog->bpf_func is overwritten.  The out_free path then calls
> bpf_jit_free(func[i]), which frees only the header that
> bpf_jit_binary_hdr(func[i]) finds, i.e. the new one.  The first image
> and its bpf_jit_charge_modmem() charge are never released.
> 
> Rejecting BPF_PSEUDO_CALL in emit_call() and BPF_PSEUDO_FUNC in
> build_insn() doesn't cover every path to the extra pass.  A program whose
> main function has an "exception_callback:" BTF decl tag gets a second
> subprog via bpf_find_exception_callback_insn_off() -> add_subprog() in
> kernel/bpf/verifier.c.  The main program doesn't need to call that
> subprog or use bpf_throw().  Both functions JIT successfully in the first
> loop since they contain no calls, and the extra pass then leaks func[0]'s
> first image on every load.  A CAP_BPF user (needed for BTF) loading such
> programs repeatedly could leak executable memory without bound and keep
> growing bpf_jit_current.
> 
> The JITs that support bpf-to-bpf calls (x86, arm64, riscv, powerpc,
> loongarch, parisc, arc) detect the extra pass via prog->jited or jit_data
> and reuse the image.  Would an early return when prog->jited is already
> set work here?  jit_subprogs() would then see the same bpf_func and
> finish, and that seems safe because any real call or callback has already
> made the first pass fail.

Since this initial JIT doesn't support subprogs anyway, I'll just
reject prog->is_func upfront in bpf_int_jit_compile() in v11.

Regards,
Kuan-Wei
