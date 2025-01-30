Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AFC11E7C27
	for <linux-m68k@lists.linux-m68k.org>; Thu, 30 Jan 2025 14:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738247108; cv=none; b=Op5yBI+0q/8C8NidY0BX0o0C98peawKcHo8Sp08Cx+Tmtt8t8d7ZOpyWNnEnH+xdzSAZDQQeLMutbwsCnL0T0xo5GOvlFSb9KOk4BUHVl2PD8RQgr25YPoHU38sjPloDl8Vst7Ld2aI4EtVeiMafthHuyRwjSH1M5thYYVBZVaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738247108; c=relaxed/simple;
	bh=Iy/xG3SkC+UDJNTJyBx1NonxLGE6Q/iYylKG6XvhG1g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kQoE7owCd3QL9fhfaUBzCjKbgRWXJaI0acBqMvNvDMniUtIUwK0G5JYe28rxRjykSIWflBlTeQWuAoemiHU+dZqq5MzyG4AqR7O0cy5Us8APvx217opdomqwiStobfaHsQRF67x9Bbw46rP1cu+gdEBDbc9ayBCKZm2XbxbUDL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-aaeef97ff02so155463066b.1
        for <linux-m68k@lists.linux-m68k.org>; Thu, 30 Jan 2025 06:25:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738247100; x=1738851900;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3OqrPZhmeATdEa/SarwcrPzfDvhKK4nRH2GJQ3Y2/Ao=;
        b=wcMmqe2EHQqqRzTtDmisNZBmTzay7oOnzY2Om0vSoFeDZ98viGxp3tOoQ3J1M5aeF0
         k7KmBP363fAqll6gaRYIv6fke9mWJ2l+6WIldF3syNliB4kX/g1EWJFHqXFDStdl1N49
         L0bZkTTyAamDCP355Z7X/5Vg2c5u7yPNj3LjlD78r6pzUVl1FWS52redGGAjIVUVf19m
         q9yhHrntrcI5oDcXTfkAg7cL2zfiT5Jdq8LMWiNl6aXzeyntk9Q63e7lbjXNDWSW2Pax
         8sirUk9bb/yF/vH2k3aL1ZUwrnVLkz8/iWuXmb0D1Ph8BXxU+hnh3jgueHDRhhbQnObr
         xcXg==
X-Forwarded-Encrypted: i=1; AJvYcCUHMFfhyWWrj/iywr+C3JS2CSKlIZ2aK+tX3dMRPsxeVfiJukFSb9OVabdqbhDcNg4YwI3zSyqdWpH1@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yy9yFkGK2fydTKp2QuTGEdhjT3l9LvM+PilR5504zM38lyXOByG
	0jUglo2peCZ0pqeUh22vsxqBiJ78BAXnfk3IxyHGI3k8KXjyyvdgOxnDOcpelGY=
X-Gm-Gg: ASbGnctHpNPvbOoNJg2DlL4o53qcReKmV36p/O32qiknY/GVVot064s/86bDaowFN+x
	N4Vp55W9Ovaiga1aVmB15vLX9iJ9vAIBHJfQVBtvAAlxmk2FRNjAV2Xl5fRzgi/r5t9Zui4VASk
	VQS6nNkA6ESkfnq++JYt4Sd1eWvlDwKnwCVfrEaTK3t0UsCdXT0YGrvfVrnzO1yGnHyArR+x79h
	CUODuCn4xwFW/nxAiC44UgmNgE7EyffuJw4yK1tVa7CMq9GqRSOjda9k7/b2tE0vzWUd7mst65s
	NgpfBLhy5GdIyCM82tj8UG++Azl2T/r9nQzXLXXBIAroFwy6uv9vyA==
X-Google-Smtp-Source: AGHT+IF7trFrGMAR7hqHfSbyv8a7deIjjsv7XzOJXU4+Ky89JYlSraqoZEBvS6B89w3x6phzq7gm9Q==
X-Received: by 2002:a17:906:6b17:b0:ab6:d575:9541 with SMTP id a640c23a62f3a-ab6d57596fcmr500864666b.19.1738247100021;
        Thu, 30 Jan 2025 06:25:00 -0800 (PST)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com. [209.85.208.48])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6e47d1eabsm128231066b.73.2025.01.30.06.24.59
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jan 2025 06:24:59 -0800 (PST)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5dc7eba78e6so137425a12.3
        for <linux-m68k@lists.linux-m68k.org>; Thu, 30 Jan 2025 06:24:59 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW3ETT+/OUOWNtxCYYghHxXJPiH0pNUcWtu0glyuWo/Ty+FJVcEk6uR/pjy764fFS+iLXcuL1vyDL/Q@lists.linux-m68k.org
X-Received: by 2002:a05:6402:40c9:b0:5d0:efaf:fb73 with SMTP id
 4fb4d7f45d1cf-5dc5efc5baamr7107488a12.15.1738247099100; Thu, 30 Jan 2025
 06:24:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241205-xarray-kunit-port-v1-1-ee44bc7aa201@gmail.com>
 <07cf896e-adf8-414f-a629-a808fc26014a@oracle.com> <qdq4k6323orqifgzo7pbg5vakezr3gptfdehghxsyfrhc4kwvb@d4fxbwcl4gjm>
 <CAJ-ks9=U4PZv4NgyH8B7SbHkecGLy+M=G639hSTv-hnPySqk6w@mail.gmail.com>
 <xf3445vgszstqfwycf5wc5owhnifxb3mny5xjjaihghqgnozmd@3h7hnifir4vu>
 <CAMuHMdVcuhzO57Qn-kcUJDM=HmkSwuheyNJPF1tx+gxRKnKZXA@mail.gmail.com>
 <mp6lnt3stfnfd74rwaza5xffh2ya5gylqnxotgrnqaqo3eh2zl@5g257jeiugfn>
 <CAMuHMdWDRLi8AE0PgfAnXundbS0hyTyovUH7yScrY7GtmYYPOQ@mail.gmail.com> <zlcagbwyskb4nkl4usbq4foc4vjcau3exp42zpfsl5b4tabr7u@o42mpfcsfygr>
In-Reply-To: <zlcagbwyskb4nkl4usbq4foc4vjcau3exp42zpfsl5b4tabr7u@o42mpfcsfygr>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 30 Jan 2025 15:24:45 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVUZQTgLpa9L9R117s39nEqxdGy=CJLyLQaTv_16EDhZg@mail.gmail.com>
X-Gm-Features: AWEUYZmmaZQOtaNUMvBrswZCS49ixh1s35CzIVK-s4dUf7w23LLrATAr9KprGzw
Message-ID: <CAMuHMdVUZQTgLpa9L9R117s39nEqxdGy=CJLyLQaTv_16EDhZg@mail.gmail.com>
Subject: Re: [PATCH] xarray: port tests to kunit
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>
Cc: Sidhartha Kumar <sidhartha.kumar@oracle.com>, akpm@linux-foundation.org, 
	christophe.leroy@csgroup.eu, justinstitt@google.com, 
	linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
	linuxppc-dev@lists.ozlabs.org, llvm@lists.linux.dev, maddy@linux.ibm.com, 
	morbo@google.com, mpe@ellerman.id.au, nathan@kernel.org, naveen@kernel.org, 
	ndesaulniers@google.com, npiggin@gmail.com, 
	Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Liam,

On Thu, 30 Jan 2025 at 15:06, Liam R. Howlett <Liam.Howlett@oracle.com> wro=
te:
> * Geert Uytterhoeven <geert@linux-m68k.org> [250130 08:26]:
> > On Thu, 30 Jan 2025 at 13:52, Liam R. Howlett <Liam.Howlett@oracle.com>=
 wrote:
> > > * Geert Uytterhoeven <geert@linux-m68k.org> [250130 03:21]:
> > > > On Wed, 29 Jan 2025 at 23:26, Liam R. Howlett <Liam.Howlett@oracle.=
com> wrote:
> > > > > I've never used the kunit testing of xarray and have used the use=
rspace
> > > > > testing instead, so I can't speak to the obscure invocation as bo=
th
> > > > > commands seem insanely long and obscure to me.
> > > >
> > > > The long and obscure command line is a red herring: a simple
> > > > "modprobe test_xarray" is all it takes...
> > >
> > > That command worked before too...
> >
> > Exactly, great!
> >
> > > > > You should look at the userspace testing (that this broke) as it =
has
> > > > > been really useful in certain scenarios.
> > > >
> > > > BTW, how do I even build tools/testing/radix-tree?
> > > > "make tools/help" doesn't show the radix-tree test.
> > > > "make tools/all" doesn't seem to try to build it.
> > > > Same for "make kselftest-all".
> > >
> > > make
> >
> > Where?
> > > > BTW, how do I even build tools/testing/radix-tree?
>                                 ^^^^^^^^^^^^^^^^^^^^^^^

Things like "make -C drivers/net/ethernet/" stopped working
ca. 20y ago.

> > > Or look at the make file and stop guessing.  Considering how difficul=
t
> >
> > There is no Makefile referencing tools/testing/radix-tree or the
> > radix-tree subdir. That's why I asked...
> >
> > Oh, I am supposed to run make in tools/testing/radix-tree/?
> > What a surprise!
> >
> > Which is a pain when building in a separate output directory, as you
> > cannot just do "make -C tools/testing/radix-tree" there, but have to
> > type the full "make -C tools/testing/radix-tree O=3D..." (and optionall=
y
> > ARCH=3D... and CROSS_COMPILE=3D...; oh wait, these are ignored :-( in t=
he
> > source directory instead...
>
> I'll await your patch to link all this together.  Please Cc the authors.

I gave it a try for kselftests a few years ago.
https://lore.kernel.org/all/20190114135144.26096-1-geert+renesas@glider.be
Unfortunately only one patch was applied...

> > > it is to get m68k to build, you should probably know how to read a
> > > makefile.
> >
> > Like all other kernel cross-compilation? Usually you don't even have
> > to know where your cross-compiler is living:
> >
> >     make ARCH=3Dm68k
>
> Ignoring that I had to make a config - which asked challenging
> questions...

make ARCH=3Dm68k defconfig

> And ignoring the steps to get m68k compiler...

apt install gcc-m68k-linux-gnu?

> > > > When trying the above, and ignoring failures due to missing package=
s
> > > > on my host:
> > > >   - there are several weird build errors,
> > > >   - this doesn't play well with O=3D,
> > > >   - lots of scary warnings when building for 32-bit,
> > > >   - ...
> > > >
>
> In file included from ./include/linux/sched.h:12,
>                  from arch/m68k/kernel/asm-offsets.c:15:
> ./arch/m68k/include/asm/current.h:7:30: error: invalid register name for =
=E2=80=98current=E2=80=99
>     7 | register struct task_struct *current __asm__("%a2");

Which compiler are you using?

> > > > At least the kunit tests build (and run[1] ;-) most of the time...
> > >
> > > Do they?  How about you break something in xarray and then try to boo=
t
> > > the kunit, or try to boot to load that module.
> >
> > If you break the kernel beyond the point of booting, you can indeed
> > not run any test modules...
>
> Which is extremely easy when you are changing code that runs so early in
> the boot.
>
> My code found a compiler issue because it's the first function that
> returns a boolean.  This is stupid.

Sorry. I don't understand this comment.

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
