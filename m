Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E64937BE7E
	for <linux-m68k@lists.linux-m68k.org>; Mon, 18 May 2026 17:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779124366; cv=none; b=ocZp+/Q1NzfBoKqUwA4Y75toOpGRqFHjY6VARcraHvd/8lkdRUspKVVjbbguJLUHSFa04qz2Q/ic0W9bDOBSPiwuNiGgBDwApD406hqpD5IQ6hehUnWaoNA7TNy7gIiZAUtokfhXM+zrW26WvSKx0Jo9aWr6CZ3+wUvAyr5cxzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779124366; c=relaxed/simple;
	bh=E/4WeoAntZmDMnfV7zG8H+Yk5WfL6D2Nd73+uPfhq8o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AeAuNaUnSFmzm8B2OL+YxtcKZHRNKuFm1xid7q00Mjl/wCfeUXIg2wPL7VVdjI4NZjrKXWNWqSVuPeB6BaB6EOcT5OjNUPVBl+SZi6kvJO3A/b4tV0pvdeSsYatbl0qM2LPU5OcOtvFTtqViifmLKtAuUHsmWVxuuTCaPCVZkcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fbqE7Uj3; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fbqE7Uj3"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-c80167f5716so1024754a12.2
        for <linux-m68k@lists.linux-m68k.org>; Mon, 18 May 2026 10:12:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779124365; x=1779729165; darn=lists.linux-m68k.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nyPh44NnAjI+9jKQI9q0bPTcCqGC6CGNFE37YibG8X8=;
        b=fbqE7Uj3fT0TFk1t8uAq0QlyWTyLEj7SxEUnqobqbGcv2sUAdC5lAO2VV3qoLmBjPh
         bT64sto1DfnDcXHR15s+tpPLXEKEm0LAq5H0uk+7TLjJGisZnqansCz60kHo6iVJ7GPn
         1H0+IkXsjhDUjaapJeP7EI5nRvh7g7L/l4eI5itz2GTKZEQgC6KivAjRVNY1sBbAEBJe
         lGRZca5gw58pb4vH5zQpZObBixdWf+wNCf4YJaEPgwdPdEhLlEbiAgeCOVG37Jxlp7xb
         MlNLu9GW+Fzl3RA8X3n1IMCBFp1l12xYgKaMcdLum3rUOR01bJyv+7XAnVENIcacgPIj
         g0lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779124365; x=1779729165;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nyPh44NnAjI+9jKQI9q0bPTcCqGC6CGNFE37YibG8X8=;
        b=Esd0FnRgetaPDI1Fzl/sG6xGjBkOwovdyX9uXykxxl4FG6+F/0abEQThde6ON2h7dN
         FqQk580oRPwPICR3ri9lVfyvW3s2IOYnF/xsyGodNELAQdBqaCov3vEbqo15OIU/8Fg/
         2cgkJrmPOFhUfnwGvW/DKtzMRv+bsI+uVR1DVTQ9P3Vzivemk1bV+bRDuCRM8UgmJA++
         Jkhfxq0xR4CThh9Ar/fqVKULtuy3aq9sJiQ+643FfNDbKzjcnjZ4mxxkKPGNyTsh+fMF
         j1EO/gfWXe9ie3xWMy240RXvAlcYZMpccSbzYQ3lEqdmGBpLem5j/Cy6cOMLb3EHlnQZ
         9GDg==
X-Forwarded-Encrypted: i=1; AFNElJ9MRaRk1dBGKaRPAVll3VSvDibFKZIQ02UG9P8rN1+oPNPV2MhSujXDwlFsHr/6U9UFs52pitjcjRRj@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YxFlBxKqIg2lmVzI/fSomDEG7WUbVpfZcgrMXAlbQwUmAYMFGzd
	aBt5M8T6hx+9J+FOVkqz/X0O3LAcENwtjSsAuILIlG+eNhrHeoTHJi1d
X-Gm-Gg: Acq92OEMhmLvHSy+Xbit3AI0qe1Qv8x14R2Mv2ZCSEiESWFXgl104X1cdZhycVnaJxw
	8GS2dOybQbx/bPokGky+GfTq0hq5ZjDMgh3nqtbZAiPiNCDcR+dcD/uPzX0koj+W3q4+Pg094lL
	Sokjmspsmv0xN0X8CkwfCZtRDyQykqloy8526jRsWDusrlRS17cogbVpmWX3gzkDQQxmOj9EGgX
	tfgTVfeSp9WhDGO2z10UXQla9nQvATfQ+RatlwJzmj7X1lAO9pFVMEYqQxMIADNe/DSv6Vd+aQP
	AV0kCQToNpszJA16HE6txveqT0QZEH4Mq8K90n5oVjG3cQEGICo6fQUUpJ/2n8LaqLz+Y7qkTDa
	kU97n6v8W+fKcAOs9PubSYK2CQGvROXmPr0roe0EI2FF8eTNufClIT11VMMgzYjh5nhoVCWxHRj
	AHYCj51eYwOFXnldSsK34giwRYLwRp4K76fA==
X-Received: by 2002:a05:6a20:734a:b0:398:6bb5:54c4 with SMTP id adf61e73a8af0-3b22e815a13mr17993040637.5.1779124364750;
        Mon, 18 May 2026 10:12:44 -0700 (PDT)
Received: from google.com ([118.150.148.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19c7f202sm14646616b3a.43.2026.05.18.10.12.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 10:12:44 -0700 (PDT)
Date: Tue, 19 May 2026 01:12:40 +0800
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: geert@linux-m68k.org, ast@kernel.org, daniel@iogearbox.net,
	andrii@kernel.org, eddyz87@gmail.com, memxor@gmail.com,
	martin.lau@linux.dev, song@kernel.org, yonghong.song@linux.dev,
	jolsa@kernel.org, jserv@ccns.ncku.edu.tw, eleanor15x@gmail.com,
	marscheng@google.com, linux-kernel@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org, bpf@vger.kernel.org,
	Daniel Palmer <daniel@thingy.jp>
Subject: Re: [PATCH bpf-next v3] m68k, bpf: Add initial BPF JIT compiler
 support
Message-ID: <agtIiKuoTlp-4XAO@google.com>
References: <20260511212756.3163955-1-visitorckw@gmail.com>
 <87h5oc4jpf.fsf@igel.home>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87h5oc4jpf.fsf@igel.home>

Hi Andreas,

On Tue, May 12, 2026 at 07:32:44PM +0200, Andreas Schwab wrote:
> On Mai 11 2026, Kuan-Wei Chiu wrote:
> 
> > +
> > +			emit_16(ctx, 0x4a80 | d_lo);			/* tst.l d_lo */
> > +			emit_16(ctx, 0x6b04);				/* bmi.s .+6 */
> > +			emit_16(ctx, 0x7000 | (d_hi << 9));		/* moveq #0, d_hi */
> > +			emit_16(ctx, 0x6002);				/* bra.s .+4 */
> > +			emit_16(ctx, 0x70ff | (d_hi << 9));		/* moveq #-1, d_hi */
> 
> I think this could be "tst.l d_lo; smi d_hi; extb.l d_hi".
> 
Sorry for the late reply, and thanks for the review.

This makes sense.
I initially kept things simple to focus on correctness first, but since
you pointed it out, I will include this optimization in the next
respin.

Thanks!

Regards,
Kuan-Wei
