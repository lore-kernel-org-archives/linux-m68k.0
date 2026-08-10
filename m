Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FB953AFB13
	for <linux-m68k@lists.linux-m68k.org>; Mon, 10 Aug 2026 10:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786356371; cv=none; b=iHdYMbuy/dUHXgwKod+L/sdnOgx5px2OPLL+qGxxPDJd1B74mLFXnEQLGMYJ0LZ6j9XOpUYwtjt1OLg3b+X8v2Ow3sVP55dnTmJbV6GQHbeaOLFHwBBp/z+8r0AkcBRzgj3saTeD5prM9CmUckSmLnleFv6+qkZxwWJyUMwxcC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786356371; c=relaxed/simple;
	bh=aQHpiRjl0icNkVpp1P+G7C74NZmJcENImdYIpsFWJNU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XApSoycr5AEE6uetzrAO/NkM0WVjYY+fhalMAWe6RXgGNty2kwbEbDLRxYjxCVDOCtXl3SFaXsm6zkiFjj6/esTBCafJM/6wSLY1JS8OHdXJWnbaFnwNgnVoPpA0D5qTjE1LXEFkMbO8QsMPldpdIwzHmi9MICPac5K4k/F9EV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QOtrlqoA; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QOtrlqoA"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2cad8076b01so18204695ad.2
        for <linux-m68k@lists.linux-m68k.org>; Mon, 10 Aug 2026 03:06:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786356370; x=1786961170; darn=lists.linux-m68k.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0x+AUpFzadUQI8quUp3DhqqhtTFZGj3um66afBtdHw4=;
        b=QOtrlqoArXpxS+rVuHvkk0DwvylYLxofzlF3sLj0fgEoVn9hkyTkGm8hPm+6TDURdj
         zNiM/dZmMEosq27ckd17Irc+8tlFgNwRp3cA6e+cJcnGKVYj2BoVnurSxUOzRQaR4sTS
         OIBbfUlsGP8mD9PTKm9mYThHLfGajg2XFUG/+zJqfxxZ+yy4Ch3R0BypDpkmts02MdKY
         J1EnuvV6dtDCKONSLP2FUu/0izoP1n7WEhHRIMkqzO/ad5wz/rfoMSuUTfct+WIO8wvj
         h++S0BEUfVG2pTHFRBoN4pgg3S1z2l8FSX5ctyqnHPqe4vqRtR89eXFUKgyKCtCB+BYG
         UidQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786356370; x=1786961170;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0x+AUpFzadUQI8quUp3DhqqhtTFZGj3um66afBtdHw4=;
        b=Y0vOkh8L/+d0KvwFqPAivDUNrqKAjl7NIOC4dpu1Q441qUiqFptHwDG1KVpllYIU2v
         C7HtIIpGIliTuVWPDTItdnOrowSHjO1dxFo8nzz5KDVMtuuHYio+uOTM0K2zNTGfsQvr
         r6SintwCiUu40D/fZ0tZV57pvp8cN5K/TmbH37uXiVXEBDjLXMYCsIjKAnlgCg/TsDLW
         Wgah+WPkknfsYI6Zqtdhwv20A53B1YvhAgn5tYlcJZdBCk2qVcuf7R7DgkxRRYZMsXfM
         WSEqU7IPO5e28osNeuhFBAkEA7Sni/Abd+joqkpe0u0TWdUgRbSPfMcy3NQcZJUHP4gz
         +ysQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqez3f8+bKG418IKD8U2ZV6EkmBUx4SriCf8TdcHoukrmhleLN7QdcQ1KB0nPPGozBnyF2KpFauYElC@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YyDa8c2JDE78+ck7EGi15q48+Fdx3jdc7i6suWmVmruTLef3BzJ
	OMtfdXIR5hSu9KLPOsToOcxBd2Iw/CM2AvghlaBVUc9Pd4aR6BV1Lbq0
X-Gm-Gg: AR+sD13z25Nws3O6vewV3z+aCiEPQcvDhJCxih8S+D4ltDheY6ufABiA8ZqG4gT2/Ql
	ACTp9xcP+LFa5055T9MdZfdelZyOeVYbQLkJlXEY9CL5KxXbwLR39T7WH9IztZn66pJcfkzQ5JK
	UMDfnTnq1P31XbIosPygyaRXIJb3HhAAaL5ISeDKqXU/wkcdmEZIJERJfZHYCf1MgdDkPAR9NbR
	cNwQmmmdQwkkBt2aMkcq2LU07zSDMi4iEUoOSBacTjpyVhDTmlgV0Qi/T8NnURLoCRjw5xT0oP6
	CCBVGoPMuF9ctQqads5am+DcrqUBj2VIaQC+V9TvUe2AB10hUDsDMzhUClchtS6/EphGu9kU/oR
	+jfEcI+oWYIzYl173tw8GtYsHaQJcX0HOaV8k/WjrDbj0i1ap8+Hlk//c0eJqlqQeHUWfJDhto9
	FXnJ7b4OADb5xpooGB7PPVRP1eTtVf0CFm41imHH+xkx9hYVAY2s0ShEbaDOXBgA==
X-Received: by 2002:a17:90b:528c:b0:380:9f17:6df3 with SMTP id 98e67ed59e1d1-3903c5448dcmr43485347a91.4.1786356369796;
        Mon, 10 Aug 2026 03:06:09 -0700 (PDT)
Received: from google.com ([103.137.210.175])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39085de9f6asm14176805a91.7.2026.08.10.03.06.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 03:06:09 -0700 (PDT)
Date: Mon, 10 Aug 2026 18:05:58 +0800
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: geert@linux-m68k.org, ast@kernel.org, daniel@iogearbox.net,
	andrii@kernel.org, eddyz87@gmail.com, memxor@gmail.com,
	martin.lau@linux.dev, song@kernel.org, yonghong.song@linux.dev,
	jolsa@kernel.org, jserv@ccns.ncku.edu.tw, eleanor15x@gmail.com,
	marscheng@google.com, linux-kernel@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org, bpf@vger.kernel.org,
	Daniel Palmer <daniel@thingy.jp>
Subject: Re: [PATCH bpf-next v4 RESEND] m68k, bpf: Add initial BPF JIT
 compiler support
Message-ID: <anmihq6bmwufwTOs@google.com>
References: <20260729002737.1008358-1-visitorckw@gmail.com>
 <871pclresq.fsf@igel.home>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <871pclresq.fsf@igel.home>

Hi Andreas,

On Wed, Jul 29, 2026 at 05:33:41PM +0200, Andreas Schwab wrote:
> On Jul 29 2026, Kuan-Wei Chiu wrote:
> 
> > +static void emit_alu32_k(const struct bpf_insn *insn, struct jit_ctx *ctx)
> > +{
> > +	const s8 *dst = bpf2m68k[insn->dst_reg];
> > +	const s8 *tmp1 = bpf2m68k[TMP_REG_1];
> > +	const s8 *tmp2 = bpf2m68k[TMP_REG_2];
> > +	s8 d_reg;
> > +
> > +	d_reg = bpf_get_reg32(dst[1], tmp1[1], ctx);
> > +
> > +	switch (BPF_OP(insn->code)) {
> > +	case BPF_MOV:
> > +		emit_16(ctx, 0x203c | (d_reg << 9));		/* move.l #imm, dst */
> > +		emit_32(ctx, insn->imm);
> > +		break;
> > +	case BPF_ADD:
> > +		emit_16(ctx, 0x0680 | d_reg);			/* addi.l #imm, dst */
> > +		emit_32(ctx, insn->imm);
> > +		break;
> > +	case BPF_SUB:
> > +		emit_16(ctx, 0x0480 | d_reg);			/* subi.l #imm, dst */
> > +		emit_32(ctx, insn->imm);
> > +		break;
> > +	case BPF_AND:
> > +		emit_16(ctx, 0x0280 | d_reg);			/* andi.l #imm, dst */
> > +		emit_32(ctx, insn->imm);
> > +		break;
> > +	case BPF_OR:
> > +		emit_16(ctx, 0x0080 | d_reg);			/* ori.l #imm, dst */
> > +		emit_32(ctx, insn->imm);
> > +		break;
> > +	case BPF_XOR:
> > +		emit_16(ctx, 0x0a80 | d_reg);			/* eori.l #imm, dst */
> > +		emit_32(ctx, insn->imm);
> > +		break;
> > +	case BPF_LSH:
> > +	case BPF_RSH:
> > +	case BPF_ARSH:
> > +		emit_16(ctx, 0x203c | (tmp2[1] << 9));		/* move.l #imm, count */
> > +		emit_32(ctx, insn->imm & 0x1f);
> 
> That can be moveq.  Also, for the other cases, if imm is in the range of
> moveq it is worthwhile to load it into a temporary register.
> 
Thanks for the suggestions.
I will include these optimizations in v5.

Regards,
Kuan-Wei
