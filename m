Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 238E329C343
	for <linux-m68k@lists.linux-m68k.org>; Wed,  3 Dec 2025 08:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764749225; cv=none; b=GTVEKmJ+EEeWGNR7cyRHY06FOMpLXGUuRjsdr10fdcnqSi+dr5YZQdjVoZm+rmR/iDxb117tfxuQsbyDD6GQvVMb3F4HZn93yRkk1gdyEYi5CZtB2BDbmk8QrbyZtFBJFGDjj0xhQiTTp5jzRSU4gsJr0/CWGMmrBuSLrBX8zuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764749225; c=relaxed/simple;
	bh=XmJumtI+ZX1fKQfNtehDcFq+vRT9lsWZ957G0wow+s0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=to9+k2fNRoLj1kA/Xks9dhtUJOR1iCyJgvSqWNLt0DoDqnjZtQFkCBqjKgmg3Dg/Bqp5fHiUJBpD4bLkfiEFF+Hsa76sl5y86Ezy2RDTad1OVD0+Xt4YfdMgjG8pwy/8Ei6K5rUhIfecatvp0YCKXbIW0Yu2eef+mvE4uRfpiFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=thingy.jp header.i=@thingy.jp header.b=QkpldsBO; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thingy.jp header.i=@thingy.jp header.b="QkpldsBO"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3437af8444cso7512549a91.2
        for <linux-m68k@lists.linux-m68k.org>; Wed, 03 Dec 2025 00:07:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thingy.jp; s=google; t=1764749223; x=1765354023; darn=lists.linux-m68k.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XmJumtI+ZX1fKQfNtehDcFq+vRT9lsWZ957G0wow+s0=;
        b=QkpldsBOvx6Fe0o3RitAeucvqJBkKWHf3vJIfwuoxdX9R220sdiRzoxsCQ5jh9Bhjr
         4oGo42TeNqggGRMu1LgijT0GYhnZax/hDZBSZFTr2efHA6/P9r6C/Lhzvd9tkF7WP/kA
         mi0gIyy8ILJwfZm7rY3LfHnJV1qpAgW75l8Ww=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764749223; x=1765354023;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XmJumtI+ZX1fKQfNtehDcFq+vRT9lsWZ957G0wow+s0=;
        b=W2MiujVTFa5aamKc17JEfxlnCwLuONNw3R9QGgkrgpJsUfDJZbV8Fhiracl7nqCPx7
         AzzsGkjTEOyEoMzk0X/ssN/CnlezRYqI4Gs6kOcjGCrXbLFbpAAjCT0yoKBjDIjOzd8A
         rLE0zS5wixxUf/KtqZhPxqd9wegZG3ptObsvkVT4p1e7CeY5dS677PQK2UJwNcaxtJGP
         /ayiicoOOwcNR2lRalAIsr2Jv3nA/mzeXYPFWYEx400EsC0e2cuPFEGLiafPgT9+edrE
         ONHccs/Ts5GrdQS14HKIOMeF1e//Snz9MepQYY/8/o0HZkSCqhISfSxTnCK1qcl8Bbgy
         A1FA==
X-Forwarded-Encrypted: i=1; AJvYcCWqqDVwkokfp/3x13aZIyoryshhGgR+6ibSKuMkDdrTeaT91tWnZes5aH2ZrCuv474wjgeqmBYoAdgE@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YzRUGSlQhO46k+ciqBhOcvi2H23hNo0qlEffCPmPhmWzKVmdt8s
	kpNb4BPhIv9s+uxwpvpfivueww2BjDwViiXnRcnLAh78BOgLUNfHG5Db+gf9P7hRLoofIzWPN6U
	VRA76R+mM5DYzcTpty6yPI6ESrW8RFQuD3Id5Zra01w==
X-Gm-Gg: ASbGnctvj92AEM+KQcXInBp3o1DmJzMgZ1f8vhg49CHHgq7uDIPFnyqc73Rmb+xrFuA
	gX1oMNtdhoqYdlQ12PzPugNiXWIllhIXsa8hMBoBDT7O07xy9StFSePUn59TMjzrIR1fNba2W+s
	BjZ8RSzZ05nOS3CtVW4WNcstlxTqc7u9j038VHrmxUAGxi8NnKAYnaG7eArnoLSL2zHqeXxU6up
	QB0+w0ug4vel3kpybz/7FP6v1awYYO93ge6N4gzUfdJTGxO41vIOjrDgyc4wFURjwk2DrAd
X-Google-Smtp-Source: AGHT+IEkhPS/1t5aWn66HdrhuKIufecStZBHy4HAaA+gH5GymYQAa2QcZdly0X0LFCKmADzkkz/N+CfyjLmyH6GwNyQ=
X-Received: by 2002:a17:90b:534e:b0:32b:9750:10e4 with SMTP id
 98e67ed59e1d1-349126f0736mr1811981a91.27.1764749223337; Wed, 03 Dec 2025
 00:07:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251127000505.2117956-1-daniel@thingy.jp> <202511270956.hzGiPzdZ-lkp@intel.com>
 <CAFr9PXngrVvcQ2yO0JUj6ve1T39rWftwECnKfUcV3PcKUCPPmg@mail.gmail.com> <CAMuHMdXMA4seUXqJsoVpuYNVS8wEFWYJKRBSWOZ=vS2Js6Bh3g@mail.gmail.com>
In-Reply-To: <CAMuHMdXMA4seUXqJsoVpuYNVS8wEFWYJKRBSWOZ=vS2Js6Bh3g@mail.gmail.com>
From: Daniel Palmer <daniel@thingy.jp>
Date: Wed, 3 Dec 2025 17:06:52 +0900
X-Gm-Features: AWmQ_bnS9BDxaDFZorffwfoU6u2xuAk1McRav0PjgsGRdFzJ_fhtggnUthokDX8
Message-ID: <CAFr9PXm_8Lyk5rPMWw+mAzu97RRfjLj8NLqz5K0Po4p9PM6FOw@mail.gmail.com>
Subject: Re: [PATCH] m68k: implement runtime consts
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, kas@kernel.org, 
	mingo@kernel.org, seanjc@google.com, bp@alien8.de, 
	linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Geert,

On Thu, 27 Nov 2025 at 19:22, Geert Uytterhoeven <geert@linux-m68k.org> wrote:

>
> Replacing the macros by static inline functions should fix that.

Thanks. I've done that now. Any comments on the rest of this?
I have a few things like implementing jump labels, a vDSO to get
around the sys_get_thread_area() bottleneck to come after this.

Cheers,

Daniel
