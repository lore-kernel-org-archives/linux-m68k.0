Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38C511FF61B
	for <linux-m68k@lists.linux-m68k.org>; Wed,  8 Jan 2025 18:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736359870; cv=none; b=PAyZcYDglJYC9A730wLlEUrNeEQw6IDnafYdy4JY7WwxzBwxRkWruqAq2qXynoslk7mg1GVUqufrQ7pOM+Gl9oRdbTI/LnXNbEjXtwqmkQF5P/q2KxqXIH7PKqzqKQM2Jb/0jBq637a5UIIlGh+VMDMxhRL6SFl3OK38FM33d5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736359870; c=relaxed/simple;
	bh=yRlykbKSn5jYsW8wxQz5WQX3Mpwcq2FfRltURMyGjwo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kpRuBGmdg6DdvkdmosreU8idBF/lFQKi+leFYx673OxmyNvMVDhUCTQ+Mjp2Nk0n/s7fXg3v57hbUKp5Uf/e/VCzoDld/iVQTwBRgZ1Ktw2vI1NIx/kaMgy3nLSP+gJ8655c7rBR/FtCrFPVH1u0vrVSf5E6ZGFlm14gFdoeEf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=f86TtJlL; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="f86TtJlL"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5d647d5df90so14457565a12.2
        for <linux-m68k@lists.linux-m68k.org>; Wed, 08 Jan 2025 10:11:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1736359866; x=1736964666; darn=lists.linux-m68k.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=g4L1kpXD4CvIKxF3DPmBbxJe2C0jfudiA06dORui5cI=;
        b=f86TtJlLJLOBliEl7iUmVEibrF1K2ElI1dZde1Zu2soAkheQaAsbjQq5rkQlSuCS6B
         c8VbVPNRs4mZdRv9ko63qEzQqaph5SlmWqUsMW7EsbRGOr6Il4UzweuoLXUQFiOf8du/
         3idTK4cuUfk+QQk/2gNi4l/BZmKl/+xPoZhes=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736359866; x=1736964666;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g4L1kpXD4CvIKxF3DPmBbxJe2C0jfudiA06dORui5cI=;
        b=hMORgRMRT++g+5brVXP+VT/sIeOgNeK9PWaB7+wpxLYWE3bCBPyX/geYccb4khyZGV
         Selw64hhz7/3A5hUQ2MIApVuppdhSPVuTbgsjF6RtptywallAfnVDrg/rehKHuoQk7RW
         pzQ1s8LproRE7XZv/n3J9gU/Yfr6sPA76ruD0Afc5P5yHx9rjAZH60jT0ARylgkslfQA
         gWfYIwFwgbpKLsznlfrF5tOMdJALUMBl8RabyIJx4iIdt2hQ0m414dk0BnXwM/uoODka
         vTEBYDbHMw5XInC8IYB+eyArDbAh4e+2EpuQ3jvHyMTWg3ztTN1jBfOGHe/NEgRiwlSA
         NXdQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/EhXLi/gMunbuXyR15djA9XUDW+jmG8/fCQSjt+Ebl0yqxgbpRhnH/YzlojwzskGxKLbNov6jAMnc@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yw3MQyu7yOoPW6sgMeno/W9NCbc0u/Jl7w/R7q+eVX/bhiJ7Oy1
	y52vsu3S+BpnKhqzlzgpio6grNGXqCpDgF5uZ8ft/t66bB6TYDoGr2QGOykgxsKDPb8QEPuF5HT
	IXk1erw==
X-Gm-Gg: ASbGncscDPDKotjBUy0p2IfTt25Fi21icCK13EEGAzZkXaditnJ18Tr4mD9XD1N2uF0
	sejQfFuSxalBWYnuyuimxqt9ZorPPLj9X1rCLT5P8mcQWzteqfQIg/Ue2Zgx4PqOtLHRPq8zCvz
	806Cd5Cgwl5NHW7mnJ0b+DO4MQXMr/VkwhgZISyLawRoW9CLh5nndPPoYMOJYb+ujy048Lr9z9y
	he8OyGui1mVW+YraYpiVszbfdLA5h39TVAiKEkrJ3qu3JqFndJq/rTwg6GxbUEpjtoFXlcbv3aN
	R7bqn0AWDoGZmDEmZPgdBPL1QegUAe4=
X-Google-Smtp-Source: AGHT+IF4BxuWO+b7SMyjFd4ILGakgcccCNpVLi9KvnRBjgbE1ja9YDHLgbjlovM1CdBxbdCoCmEwQA==
X-Received: by 2002:a05:6402:2550:b0:5d3:bc03:cb7a with SMTP id 4fb4d7f45d1cf-5d972e4c9b2mr3814693a12.27.1736359866319;
        Wed, 08 Jan 2025 10:11:06 -0800 (PST)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com. [209.85.218.47])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e82f178sm2496124966b.38.2025.01.08.10.11.05
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jan 2025 10:11:05 -0800 (PST)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-aaf900cc7fbso23707966b.3
        for <linux-m68k@lists.linux-m68k.org>; Wed, 08 Jan 2025 10:11:05 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUuQj7FpPcMTZ9kuNEW3cdnuQpCCm7QaJAo/CxYxf5SvzqBTPEEjGlpSI6WXuf9q6/M7N9R4mWth/5l@lists.linux-m68k.org
X-Received: by 2002:a17:907:1c93:b0:aae:8692:902b with SMTP id
 a640c23a62f3a-ab2ab748eeamr327286666b.31.1736359864937; Wed, 08 Jan 2025
 10:11:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <202501030516.uZrwnuQQ-lkp@intel.com> <CAMuHMdW-DYPp_2nAaBdvgoa6Yr9et2cNS_260H-9H_CT4yEasw@mail.gmail.com>
 <CAHk-=wj4tYCytRshQGkWSNmZS=59PtKEUpG7f4Sy_46n+WYtXw@mail.gmail.com> <CAMuHMdVLQ2z=U1YJ18GsnJcej2mwGg02GVtKQLQKr0yNtA-7Hg@mail.gmail.com>
In-Reply-To: <CAMuHMdVLQ2z=U1YJ18GsnJcej2mwGg02GVtKQLQKr0yNtA-7Hg@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 8 Jan 2025 10:10:48 -0800
X-Gmail-Original-Message-ID: <CAHk-=whmhoFfty4GoAnN6u1K2EsjhWkoS767fa-+Lsf1Ya6A+w@mail.gmail.com>
X-Gm-Features: AbW1kvaDHAgFTamUSR1ieUMfa_7UpkwDHNwGJjelV-I2cxYJy3aNc-RISQlIhjU
Message-ID: <CAHk-=whmhoFfty4GoAnN6u1K2EsjhWkoS767fa-+Lsf1Ya6A+w@mail.gmail.com>
Subject: Re: [geert-m68k:master 2/2] lib/muldi3.c:53:28: sparse: sparse: asm
 output is not an lvalue
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: kernel test robot <lkp@intel.com>, Greg Ungerer <gerg@linux-m68k.org>, oe-kbuild-all@lists.linux.dev, 
	linux-m68k@lists.linux-m68k.org, Arnd Bergmann <arnd@arndb.de>, 
	linux-sparse@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 8 Jan 2025 at 06:19, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> That leaves us with the "not addressable" sparse error.

Hmm. That one is actually a sparse mis-feature.

Sparse sees that

          "dmi" ((USItype)(v))

input, and the 'm' makes it go "it's a memory location" and that makes
sparse go "it must be addressable".

But for asm inputs, it just means that the compiler should *put* the
thing in memory to be an input.

And this is hidden on x86, because sparse recognizes "r" for register,
and says "if it can be either a register or memory, I don't require
memory". So there's various x86 inline asm that does something like

        "rm" (0)

and sparse won't complain about the zero not being addressable.

But in your case, just making the inputs lvalues will fix the sparse
problem, so I guess that's the right thing to do. I sadly don't see
sparse being fixed because we don't have a maintainer..

                 Linus
