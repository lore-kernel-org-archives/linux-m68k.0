Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FAFC1E3DFF
	for <linux-m68k@lists.linux-m68k.org>; Thu, 30 Jan 2025 13:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738243577; cv=none; b=iwLxYkihIcq52cj38uqMgpXLMFnENDYSRr9rcZzGFLQPluo7Hr9JUGiQ1SJjbB5uFzvEpuZbStwX1g4f3oOgUPoOCXuH6wiYAtRxB0V+nDEo8Hwx4t4ViTsNVTzDyXIUDdIiApzlGNJalVb/4dh0a/nspuStfVeUkN2Aicx45Aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738243577; c=relaxed/simple;
	bh=EluioHgTrDfBtlMLrqNjhpzUXx5fQlBJiL9K5UDjawM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p+2l5N+VEWc4iLj97y+Bjuh5hvqQVDrOZuFLFF9tv7PjQ0Eanz7r/QfnBph6AkFbV4/4fWGA4G6IoaNTrT8BcWDOcymFvjX+73syliuR3hRk+q9bLSkev3T8NHnItwf2o5u2VkDmSH00REmHo9JYKQZWpTTDPfyCPfnPhsVUp+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-4afe70b41a8so259932137.3
        for <linux-m68k@lists.linux-m68k.org>; Thu, 30 Jan 2025 05:26:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738243571; x=1738848371;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RcnCdea0Cg2xhZ905GiM0LEi2fn/A0TJy6vLZwAFU5g=;
        b=NqatW/GmmONniAXWmEU+3vv7nBHVhxRSTZZ8Bnd05AGzpT4ldouZJSW8lWnXYTBsbj
         hXcUMxSAhuKHmR0NibkNFOFEHHow/OQwSZIz85rO3Utr3w6DyErCFxM3rftqlz9xyoJF
         2PVIabGAhVafSofRuozxdhN9zc+z6rkwI8M4ZXHaENm78VfbpI6bskJcZP+XE6dFMmhu
         7ZwzVOQWZuo+xIznJob6cZbE4sZe+WNhNii8ZVD7rBc0OQVNAQAQcSOn+8CwuLtkhD8S
         tYQpRNBscnKQplNQf/3Q6022A6wlBVPPWPi7ELmkpq7DV1qCasR6/zVd/6O/yoAKY4hn
         pBqA==
X-Forwarded-Encrypted: i=1; AJvYcCV4ENjlHtYtyed+T7uagAR/IfviKHaa1zvmeTYAW9fAKk0K6TBmn35Ic2/Ola2DI8fQ8yCWpBhUZJyc@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YzVF1I542atG/4+icjYpqYAtlFTeI0VPNZmUcPH6X4wQivMQ3SK
	vznbkNSN4jcOLy2HySLJ/4n2/7InbUJqjHPYfAeeYH1iHoyKteLtL2C0Z0Ms
X-Gm-Gg: ASbGncsGzDrEwfJJcsWUVkd41wBuw5j4u9e9c6wwqP7tlExWpqnHNkJd3gRiqWYYnrD
	JbavL1FwLswByTop4C/3QE1PVehsrMmIER8UEuQpfPreBKpmwj86QKuds4X28HX3syZhRZu9WQq
	0CmDBzkRXQ4KFapIvwmLnsyip5pceoeHWMeD1dnN/B9bca/P2WgNOJkXEXF6fEeuZvawmiH48Sf
	7u671AEYjxQ/Jvf4iQfkckIoJMVnSRJlVTjBlEnnh9QI9nFC5DkD3TT9oj3g25r2iPrD4C695h0
	a9jTWJcJ+G6TllzS5qalbIDQ/Qg7c3/QRRzsc2O2ynbdAh9GG0Q3eQ==
X-Google-Smtp-Source: AGHT+IE/xM7NyUVISMh+Z5gM3ZWf/jHDAS+5MQF6qOpP3+PJA/hI2XvABLwUJwfEyZrsMTzifPyLaQ==
X-Received: by 2002:a05:6102:32d1:b0:4b9:bd43:9778 with SMTP id ada2fe7eead31-4b9bd43990amr623531137.8.1738243571172;
        Thu, 30 Jan 2025 05:26:11 -0800 (PST)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4b9baa18af4sm228260137.1.2025.01.30.05.26.09
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jan 2025 05:26:10 -0800 (PST)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-4affd0fb6adso291508137.1
        for <linux-m68k@lists.linux-m68k.org>; Thu, 30 Jan 2025 05:26:09 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV3Ax15zAwLK6ti21QvUcTF0mqe2rYfp2J18L54N4siHP7J+LvT0rw85QI3VC/LvGCSloGP5Tnqafzf@lists.linux-m68k.org
X-Received: by 2002:a05:6102:2ad3:b0:4af:bb06:62d with SMTP id
 ada2fe7eead31-4b9a4f499c9mr6186530137.11.1738243569336; Thu, 30 Jan 2025
 05:26:09 -0800 (PST)
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
 <CAMuHMdVcuhzO57Qn-kcUJDM=HmkSwuheyNJPF1tx+gxRKnKZXA@mail.gmail.com> <mp6lnt3stfnfd74rwaza5xffh2ya5gylqnxotgrnqaqo3eh2zl@5g257jeiugfn>
In-Reply-To: <mp6lnt3stfnfd74rwaza5xffh2ya5gylqnxotgrnqaqo3eh2zl@5g257jeiugfn>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 30 Jan 2025 14:25:57 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWDRLi8AE0PgfAnXundbS0hyTyovUH7yScrY7GtmYYPOQ@mail.gmail.com>
X-Gm-Features: AWEUYZn0su9wB3Rua7xZlN_jsLurJgHhePP-DQxZFLycHjingwrtS3E5xZdT-fo
Message-ID: <CAMuHMdWDRLi8AE0PgfAnXundbS0hyTyovUH7yScrY7GtmYYPOQ@mail.gmail.com>
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

Hi Liam,

On Thu, 30 Jan 2025 at 13:52, Liam R. Howlett <Liam.Howlett@oracle.com> wrote:
> * Geert Uytterhoeven <geert@linux-m68k.org> [250130 03:21]:
> > On Wed, 29 Jan 2025 at 23:26, Liam R. Howlett <Liam.Howlett@oracle.com> wrote:
> > > I've never used the kunit testing of xarray and have used the userspace
> > > testing instead, so I can't speak to the obscure invocation as both
> > > commands seem insanely long and obscure to me.
> >
> > The long and obscure command line is a red herring: a simple
> > "modprobe test_xarray" is all it takes...
>
> That command worked before too...

Exactly, great!

> > > You should look at the userspace testing (that this broke) as it has
> > > been really useful in certain scenarios.
> >
> > BTW, how do I even build tools/testing/radix-tree?
> > "make tools/help" doesn't show the radix-tree test.
> > "make tools/all" doesn't seem to try to build it.
> > Same for "make kselftest-all".
>
> make

Where?

> Or look at the make file and stop guessing.  Considering how difficult

There is no Makefile referencing tools/testing/radix-tree or the
radix-tree subdir. That's why I asked...

Oh, I am supposed to run make in tools/testing/radix-tree/?
What a surprise!

Which is a pain when building in a separate output directory, as you
cannot just do "make -C tools/testing/radix-tree" there, but have to
type the full "make -C tools/testing/radix-tree O=..." (and optionally
ARCH=... and CROSS_COMPILE=...; oh wait, these are ignored :-( in the
source directory instead...

If these tests are not integrated into the normal build system (see
also [1]), I am not so surprised the auto-builders don't build them,
and breakages are introduced...

> it is to get m68k to build, you should probably know how to read a
> makefile.

Like all other kernel cross-compilation? Usually you don't even have
to know where your cross-compiler is living:

    make ARCH=m68k

> > When trying the above, and ignoring failures due to missing packages
> > on my host:
> >   - there are several weird build errors,
> >   - this doesn't play well with O=,
> >   - lots of scary warnings when building for 32-bit,
> >   - ...
> >
> > At least the kunit tests build (and run[1] ;-) most of the time...
>
> Do they?  How about you break something in xarray and then try to boot
> the kunit, or try to boot to load that module.

If you break the kernel beyond the point of booting, you can indeed
not run any test modules...

Which does _not_ mean the userspace tests are not useful, and that I
approve breaking the userspace tests...

[1] https://lore.kernel.org/all/CAK7LNASdA+5_pdTjr1dY-cKGSDq804Huc_CX_8-Gg+ypFCmajQ@mail.gmail.com/

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
