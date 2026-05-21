Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89A2533EB1B
	for <linux-m68k@lists.linux-m68k.org>; Thu, 21 May 2026 15:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779377201; cv=pass; b=m2Rew0s2/8LgG0vClBxJwnCHCUXZHwyvKJaeKrbbBuS9IstxkdGLCqyO6nE4/E4QEsMD65KGotuCs75N3aO+cRcrtlzrF+hgSMXiAUzbLmHuz3dC3oiRfKgrd68CzAM9nCe/OtTa5iAvLBtL3Qk5zn1z4/T1BxOnTB6g28MrzwE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779377201; c=relaxed/simple;
	bh=wKeKVSivFpd2JOeCr3lRPqpM1PTnHIPaSLcgWPrvxt8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mzPHxuNRXGSzXmNF8tLBGH1gQCyNHoZW/pn74zMZxg66EjZy8KbKjihR6j6dvxKcBxj92OtPoOHIxe5cZABF05kuW1qA0YYM8aSNq/0Mb9PPI2EPVR8sucdgeai6lcErdCbXrh4Ph32Ia97QE/W0vqh8TBwXmMudVYZBLR15zIA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=C8+qwbta; arc=pass smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="C8+qwbta"
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1334825de43so5703724c88.0
        for <linux-m68k@lists.linux-m68k.org>; Thu, 21 May 2026 08:26:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779377200; cv=none;
        d=google.com; s=arc-20240605;
        b=eOoE9u05HCG/dzAI7U/wa36Y2XKLaEhBUMeejOeQcerYRk1B9mnsZ4PWSIBqZ9EC2B
         AGsByg0qRuh+W8y5I0a1O8560wnryjR3ImChT4Kk1NmXE49eQy5UaCenfr/UVBKZcSk6
         wkqGDLvQJ77gvNtrvfDrPGMcuPxAbCqttzxtESsbBFLPRmYkeMDfXIEiiKpwxl2+a9+r
         aF6+PBECvFJ7TohzggApGmvtG8T/b9Uz3YTft8tD/Nc3l01vbEPGqGbBSsFXiAicEsKg
         i65cGqmKW/mHKGgPbrgd3uP4H8U9Z3pq1K/Lo4XE0OSDmiEGDqaZ6HXNnngyZ98Lj+9r
         F7GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=RfpkoGHocn0dXzPu0obj+lUVc8aZ3HVQjDUKdWNdroM=;
        fh=GmMzWS0STBeD9Oj/XU6B9IEIcq1I3M2QqsO7TvlUKBM=;
        b=ZVrOyggvKr+aPnynqznXICvfRo5H/m3KILR8tnIWowvA/+mdUBw/P3hVd3z5fDdPg/
         OeZLviB2JJAj4c4Earh2k/x+lkrpRjpOQSgRdZOUkI7M2PXMOORNcd4GYto0YGk6lsHi
         hTXSJizDA3zJyQCNK7svrRkSiiug3dn2oxH5T9lAYT23W0CtEcCoMJn7gCvpnHvZrGwM
         qVBfVcB9y5g5FVS3UxVZE2q656DL9qvdGTy2IHOYukEimYjb7Ef8np8s7o9kUc/9GUZW
         ocnez2q5Ar/x/QRn3KStACjr9ht+FXQR3UtPvNX4U2y8EjHPuli1Vphhj6uGFpQSiMMB
         m/zQ==;
        darn=lists.linux-m68k.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779377200; x=1779982000; darn=lists.linux-m68k.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RfpkoGHocn0dXzPu0obj+lUVc8aZ3HVQjDUKdWNdroM=;
        b=C8+qwbtafaHLUtcQeQZqgdKaBrVCu7yoBYZjySvv9SNZdeChKwx4HBKUrojEjfqLOc
         qpVXun9WeD+xu24Yball1qNsFbPjkHQzWxf2dJyrRV4pbED2eeusuR4Whe3MUys35jPQ
         MXs+WE8yKxeN36/Tv8eD50ZXr0BUdyrX9dfApYjzrT/+GbPNZF6d/mxJCEpGkkYFwjDq
         BeVZ0GFJM6Z4KbCUE4qOuVZZHcagT8q7rLSFT570uYQc4v4TEb1Woohd/Qtg0zXoP6d1
         KnKa2RxKYXLhe3wLWu1+FHdsBq3HsmrPYWavvbju3ag/zqER0uIISTfndPOwxHK1+dE1
         wD+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779377200; x=1779982000;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RfpkoGHocn0dXzPu0obj+lUVc8aZ3HVQjDUKdWNdroM=;
        b=pK4khaJYkU8BQJaDpwBBHLvxvzpCC6SNfhj+8roilD9OihUd8HaFwIxZiSFrdE3jaV
         xpGidit0IgSKiE7trQJRUDOWtoK0Wdb3LsZ+9kRMZvW8zdYqV895BkSV2GAni9s4PVwE
         C+QVBGZImxHkCeQpj/UKvc1fC4HZ+DChUMb/SsIESjyICZB0vDXrO/KWBKnXn4tM480h
         KXtsx0KOSwV5fWseQcxI+UHc/1pcKjU9kEGgut/kHqvPhQ2dsXagVGTeXkhMs9MFqNmv
         A4fRtkuhPP//3jgYzqv9AA5r685OYQ2j86t5CAsA04Da72OLGk1lUbjICFj2efdtxuUW
         uYpQ==
X-Forwarded-Encrypted: i=1; AFNElJ9PDtmhH3k5DD4LLeoDt+AI6u7W21lu0rp3iOx/o7nTDyY34olozxjm/tVq0c+GnuO8zpA78qzInUg2@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yy33W2tRcLzxzj0IB6iXLIGzdp+r6iikbAUN8RKjgTdRU14Xhar
	mOJcI2FW3H1tbQTDQ9a5LZZGR2RTU33wNJYXjG25eaKaqoN32qFH2mA4DEMpFt2+tu9HDEcISZX
	Eq+oTytkgIHwoJ+YZik4YtqAp+nSqoKIUKZNA1j9f
X-Gm-Gg: Acq92OF1hf20CRHGaAp81XGKxjjKOn26mNZK3mEVwmoqVjWHBRZxRq1oZsHzdhXDrjm
	vgks67jgkWMmGIXzZVOwVZ7ZOKsdgAIQURiuTdItEhUjgG6HskXRChEtysh2SXrElBKBPe8xF5S
	8h48RNzFhUq+XLLse0pe7opDCuMX0dhmEDdB+N18XjZiFEgN/d0JGkCZs/PD+fSNfKr+GEu+Y3d
	IKxYoZ+/yVDbbnOiDQ8JwUpCSl7xVURA0hDt4bdodxtDrxBgxYPqHXhZUx5iEGV2LbiPVXnobYw
	FTiCb8EA9weCBLvylFN0N5qqbjmx3GD2wA4YVPRcR1vAYVs=
X-Received: by 2002:a05:7022:fd08:b0:135:245e:48ff with SMTP id
 a92af1059eb24-13632c2ea24mr1585579c88.19.1779377199085; Thu, 21 May 2026
 08:26:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260521123438.147789-1-elver@google.com> <87h5o0zteu.fsf@igel.home>
In-Reply-To: <87h5o0zteu.fsf@igel.home>
From: Marco Elver <elver@google.com>
Date: Thu, 21 May 2026 17:26:02 +0200
X-Gm-Features: AVHnY4IZn6lRh51XBEB8VZWT_h0p81Hl70_TRPYZmTdqhsyxpxPptcOkurD05TY
Message-ID: <CANpmjNODXLyV3E62v-52Py5SbvpTjhf3iFiSWAHaFM=G5D=tEg@mail.gmail.com>
Subject: Re: [PATCH] m68k: Implement _THIS_IP_ using inline asm
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@lists.linux-m68k.org, 
	linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

On Thu, 21 May 2026 at 17:14, Andreas Schwab <schwab@linux-m68k.org> wrote:
>
> On Mai 21 2026, Marco Elver wrote:
>
> > version. Additionally, avoiding taking the address of a label prevents
> > compilers from emitting spurious indirect branch targets (e.g. ENDBR or
> > BTI) under control-flow integrity schemes.
>
> Ignoring the fact that m68k will never gain such a feature, dot is still
> a label.  If you want to avoid a label, you need to use %pc(0) (or
> %pc(-2) for an address at insn boundary).

The problematic label here is a C-label.
The inline asm can use labels just fine, and would never affect
codegen as stated.

If this version looks correct to you, feel free to strip the CFI
sentence from the patch description.

Thanks,
-- Marco
