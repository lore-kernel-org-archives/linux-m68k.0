Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDF071A304A
	for <linux-m68k@lists.linux-m68k.org>; Mon, 30 Dec 2024 09:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735552664; cv=none; b=nG4czgx5ETGNvrxUqZdo+lMR2tCNcJWG1E/eYilN6nosmtLNG3erVFquWt4gO4xN1NFZ2WOlpHOm1fVCj80PGx/YlbdfGzmuN0NA/gRrjZm3ITxPtX8GBz3Rffb/t0uyyhmuwF9zy1tWDbmWT/uA/ZWoDLuUVDMBjq3U9BONM34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735552664; c=relaxed/simple;
	bh=zWRJKkCsOyUhKtxUS5kNhP6d3C53HLbNVUpcjariBoc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dwt52EuZlXiPxgwX2zdGIhTHuLpWzO07JvXzB8ICYXCrjA6CzVxO8iTfkGnCB5DC06GKE3paFUppDIpDx6ioe0zpnWOnQwm3YLJxEexL3tsIZ0oKy2QbXx1YgJJDFSoTRHtjkaQpUQHH+dyxh32cNYPSc/PIQewz6O3o7kJcjvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-4aff620b232so2800239137.0
        for <linux-m68k@lists.linux-m68k.org>; Mon, 30 Dec 2024 01:57:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735552660; x=1736157460;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xxjMTldfrBVTA08tq/YNrsvyvgTECdjm0qFZ7d3BwxY=;
        b=EJS/sslAe+v+9Sg/Y7xADI0G9E+JTQiG71h55Qqi2GCGIgtDPjH4/9y8BJ/Qxz9IjA
         S5TN0FuObFMcejKXWjo1nK8/oW4IAhBZNgRDsCr6ujTzTaBElJxCJsfUhdonZQPL8ywt
         Ytur0Tr17EaRnzxfGlNUARmOHdpNM7n+o5U/FBgU/+JRsZhFOWaPXBa7DmHNhhIBii3U
         Hgzr4S3XFYQDJBDsdfcSL7FOCFQZhuZkvECOrTbbd6y023C20Klzps6NTQflqaiVDgHe
         6OvrAvIAo5jmoyQXrBz0G0HyPs1Sz6yoqHbJ9AKiz9WZvMgZGFrevp82PT/1CtmbNqmW
         79ug==
X-Forwarded-Encrypted: i=1; AJvYcCVY/F8msjIz/FAFZimrx22PDl02Azf2VcKNxYjZfTTL3Oreu0bFaXihrePWU96e9k+REltgno6MiWML@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YwaocTNtISnVlaFvGIa4wvPY5iwQoat8IL6Z7XUXrIx3ZNkJx8h
	97y7DSYWK1MyLNi+5zeTG0jBwr9e7nItyJErSKGLUjdZrxw3UaeFTnGcuj2c
X-Gm-Gg: ASbGncuCVs3P5Xm7z770z6rOccMunAz7hYPqpnZtbFh71955Ng6fld9FpYcJsFhK/kH
	FLvsGGnZBNbCAxeSSo5NKDVJP9vA/1/7y30PoIfEDrq5OPdFB8Id7gPOH04aVAsGpjZrjbFIbsT
	BXFbHxZ2fPVWRDIhUdOLGqS/uqUKvDEEBVPq2bBBwDM3wXZJue6kFnqbi9Zk4iKF+5ZU900Njl0
	LZQgsQ6WzrxgK9XBXQ5udr4lnJOxfgQCeJ4I46B7S8DfpsPTzh96h1ynZbSaRIWYoTc3Yz9rV2D
	sRHkTfM8CaFwI5Otiw8=
X-Google-Smtp-Source: AGHT+IE6JClQbbJr7X6elZjlZB/xWXUTdXMwkdFBaC6/B4hEDj0K0q3L+NYjWJ4QonqXEkTNgc6Ovg==
X-Received: by 2002:a05:6102:50a7:b0:4b0:4d6:bff1 with SMTP id ada2fe7eead31-4b2cc387a3cmr25429316137.14.1735552659915;
        Mon, 30 Dec 2024 01:57:39 -0800 (PST)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-8610ad5a3fesm4001037241.33.2024.12.30.01.57.39
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Dec 2024 01:57:39 -0800 (PST)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-4afdd15db60so2413967137.1
        for <linux-m68k@lists.linux-m68k.org>; Mon, 30 Dec 2024 01:57:39 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUCGr8dqAXdZWKN9Is1+gx1+5eC/1HK98FqGwyjlzN6wKnNjEKuLy50pkQX2MUBVlA4xCRm2jAD8Zwn@lists.linux-m68k.org
X-Received: by 2002:a05:6102:3709:b0:4af:fc14:f138 with SMTP id
 ada2fe7eead31-4b2cc35f97bmr28818742137.7.1735552659541; Mon, 30 Dec 2024
 01:57:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241229134848.0a1d9719@windsurf> <CAMuHMdU-DB1kOymg3-E4nRN_8R8N_R3wVZq7MNYUGsQWLa3hrg@mail.gmail.com>
 <e30ab951-bdb6-09f1-0d3b-9a09220babe7@linux-m68k.org> <CAMuHMdWmYc4=-ZbFoNrD=2CjucxdUSqhfufJZ_UkL+wvun_jcg@mail.gmail.com>
 <20241230103552.61b67498@windsurf>
In-Reply-To: <20241230103552.61b67498@windsurf>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 30 Dec 2024 10:57:27 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUcZyW9OLO6nwxEVk04iWbBXgoRbLy5B_h_EZz2k24uxg@mail.gmail.com>
Message-ID: <CAMuHMdUcZyW9OLO6nwxEVk04iWbBXgoRbLy5B_h_EZz2k24uxg@mail.gmail.com>
Subject: Re: Build issue "Error: operands mismatch -- statement `movec
 %d2,%caar' ignored" on m68k
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Finn Thain <fthain@linux-m68k.org>, linux-m68k@lists.linux-m68k.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Thomas,

On Mon, Dec 30, 2024 at 10:35=E2=80=AFAM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
> On Mon, 30 Dec 2024 09:53:29 +0100
> Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> > > /usr/libexec/gcc/m68k-unknown-linux-musl/as -v -mcpu=3D68020 --pcrel =
-o a.o a.s
> >
> > Thanks, so it fails when -mcpu=3D68040 is passed to the assembler.
> >
> > Oh, I misread "caar" as "cacr". The latter exists on MC68040, the
> > former does not. However, that doesn't explain the failures for pflusha=
,
> > which is supported on 68040.
> >
> > After disabling CONFIG_680[236]0 in the kernel config, I can build
> > it fine using the buildroot toolchain.
> >
> > Conclusion: make sure your toolchain supports (a superset of) the
> > CPUs supported by your kernel config.
>
> Thanks for the investigation. How should the toolchain be configured to
> s upport multiple m68k CPUs? My understanding was that when you
> configure gcc with --with-cpu=3D<something>, it means gcc will by default
> emit code for <something>, but it can always be overridden when running
> gcc using -mcpu=3D<somethingelse>.

Sorry, it's been ages since I built my own cross-compiler.
IIRC, I always used the default, which gives a compiler targeting all
(non-Coldfire) variants.

The GCC documentation seems to be ambiguous
(https://gcc.gnu.org/install/configure.html):

    Example 1: to configure a compiler for SH4A only, but supporting
both endians, with little endian being the default:
       --with-cpu=3Dsh4a --with-endian=3Dlittle,big --with-multilib-list=3D

vs.

    --with-cpu=3Dcpu
    --with-cpu-32=3Dcpu
    --with-cpu-64=3Dcpu
        Specify which cpu variant the compiler should generate code
for by default

> How can one build this kernel/sys_m68k.c file if it uses instructions
> that are mutually incompatible on different m68k cores?

Each of the CPU-specific sections depends on CPU_IS_*(), which
expand to compile-time and/or run-time checks for the CPU type,
depending on which CONFIG_680*0 kernel config options are set.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
