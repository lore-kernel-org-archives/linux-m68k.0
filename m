Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D671B1BB6BC
	for <linux-m68k@lists.linux-m68k.org>; Thu, 30 Jan 2025 14:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738247932; cv=none; b=nPty/EGcCqNfuPjb21BL5fTU6w/a7rCjcUCN/DZiVkQI55fFomq12fluFBaBfwsPsPAabayAukJjdjQOwPt1J/QT1s0HFo2bp1pSPcOf+/4z59Q++9QQiMwA2QrsPG2A0dQ3yLevHWmQLBc3hOacjZFzO8TcEhIz2hHM8FmWCrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738247932; c=relaxed/simple;
	bh=ndA1DqYJeLDgwxI0sFTIswtI2TRbJRaDwStsY7tYaU0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nNlBAJWPFUGKoMaPlNxxqDNPq6e9GppmJgMh9uWIH0omxLDopv2DMHBhje9B1MPHLs4qBuItbRy1+YrhNWLhu71D5+6B2ZTZPMDjHYIyL7Lc/hsVZ+j1hLvX2v6GVPzrI7kuHbdqvzyoN9Xk44sSrmoZNACHZXi2Ava0jolLFFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-518799f2828so452575e0c.0
        for <linux-m68k@lists.linux-m68k.org>; Thu, 30 Jan 2025 06:38:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738247929; x=1738852729;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3koQwFtsYEj+sBiSRxwOt8Kdl4P9BIA497a/eImNeSg=;
        b=fN+yyyf2l/NdmP4JIzXpMtGlDfmo8Xq/q3F8V0GwmPgN0valgRJonSMeAlqT2xgMfL
         iZQRARFBeIi74FyRR2cctFi2MGEu0WxUrzj78F8tJdZnAJk/Omm3SeQcM7snOhR0fIch
         Th+e6KxYfk0oPe5wvDzfDBAMixwxZ0cSMWyZYnbBc5gz/CUQptkwGAZSdt/olRV6whAz
         +ySl3ZvAALadQDjDiAzXAFjTobg3ba/YqBDTjDbQ84DYj9oA2mOjZmuvdgcQjgSt7LnA
         6//gKMfFu4JtMFmeLnTegd6TPXwKLTeUSaEOvum7tJrKVQfZss9cFzZQ+NROWEYUF2pr
         cooA==
X-Forwarded-Encrypted: i=1; AJvYcCUDWRIfr4alceql0HQnMoDD3xICXAl9xZ53xGiLXzCO9uKCSlmr3s0B3BH/CmGWvh1EolqbpyszLAFg@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YxYco0YJqq2GPTgtLHeiACYlRttjBkvyCzLB9pvrswlXdFh9azr
	nABoCpCYuG1fqVu9pw4EWINLL02RpkoBlrFhrk3GXISj9ujwahsdQRl7w1NAtqA=
X-Gm-Gg: ASbGnct6TMPk50ocr/EqVqCcO3lTyMP69Ivng3JGGZ9gBzSin+HcC6kRmc/haHi3cOw
	1u2Lo7isLXTv4rJTjogizLdS70PLds497bxvvI4UMQQEeSBvJAnFEnSF+yDtk5mqoNxu5l8MltL
	76XGrxavhsxrkeLqxkQpeQNj8mb90ibwd/AMhhv/PvEm2ro2vJmAAkAihTVZykpEig1sF2f1yV/
	KfA5cSe72xNIuDS9rWJ0xVUz4akOstH2+btxT6t9irZxvEf9OpzkghfvonH6UWtDi0Mb6GJUWru
	OTEtr8ABG9dTRuvpZN/4tHVj+6+R4tpC+UCUk2pri2StjZtz2jTP9w==
X-Google-Smtp-Source: AGHT+IHeQXwCp3dm1heeN854kTrWVj3Y4oW15o+n5GEx0nlZhS2tQRHMfDrQZVlWrjTMiiqgYYUccA==
X-Received: by 2002:a05:6122:d85:b0:515:d230:f2c6 with SMTP id 71dfb90a1353d-51eaf217758mr2638141e0c.7.1738247929474;
        Thu, 30 Jan 2025 06:38:49 -0800 (PST)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com. [209.85.217.43])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-86694051d48sm264569241.3.2025.01.30.06.38.49
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jan 2025 06:38:49 -0800 (PST)
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-4afe6a8d2e1so471619137.1
        for <linux-m68k@lists.linux-m68k.org>; Thu, 30 Jan 2025 06:38:49 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV63mehT7mjFN8h+qYYtKi7Sbm6IxG1kISu7z4veeonNdwjOt6Y0Gdy3IdG/ySwL01ywEWxZC+WisRC@lists.linux-m68k.org
X-Received: by 2002:a67:f318:0:b0:4af:d48d:5142 with SMTP id
 ada2fe7eead31-4b9b70f3a0bmr2755704137.3.1738247929070; Thu, 30 Jan 2025
 06:38:49 -0800 (PST)
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
 <CAMuHMdWDRLi8AE0PgfAnXundbS0hyTyovUH7yScrY7GtmYYPOQ@mail.gmail.com> <9636ed9d-3bfb-4dda-98dc-f945c9d53698@lucifer.local>
In-Reply-To: <9636ed9d-3bfb-4dda-98dc-f945c9d53698@lucifer.local>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 30 Jan 2025 15:38:36 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUFbhzi8J3rmyvVn7HmrxbeyoOwu97w8cnuKJxksa8iaw@mail.gmail.com>
X-Gm-Features: AWEUYZmOwEzWB0gEceqhOwmudbYpt2s9uwC-1Re-pPG58BUZxS-FmbWZ_JWw55Q
Message-ID: <CAMuHMdUFbhzi8J3rmyvVn7HmrxbeyoOwu97w8cnuKJxksa8iaw@mail.gmail.com>
Subject: Re: [PATCH] xarray: port tests to kunit
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>, Sidhartha Kumar <sidhartha.kumar@oracle.com>, 
	akpm@linux-foundation.org, christophe.leroy@csgroup.eu, 
	justinstitt@google.com, linux-kernel@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linuxppc-dev@lists.ozlabs.org, 
	llvm@lists.linux.dev, maddy@linux.ibm.com, morbo@google.com, 
	mpe@ellerman.id.au, nathan@kernel.org, naveen@kernel.org, 
	ndesaulniers@google.com, npiggin@gmail.com, 
	Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"

Hi Lorenzo,

On Thu, 30 Jan 2025 at 15:09, Lorenzo Stoakes
<lorenzo.stoakes@oracle.com> wrote:
> Having written a ton of test code, I've unfortunately encountered a lot of
> this sort of push-back and it's HUGELY off-putting. Writing test code
> should be ENCOURAGED not litigated against.

I am not discouraging nor pushing back on any testing code (on the
contrary, I test every single new kunit test that appears upstream).
My apologies if I gave the impression.

> The truth is far too little kernel code is tested to any degree, and this
> is part of why.
>
> On kunit collaboration, I attended an in-person talk at LPC on kunit
> userland testing where it was broadly agreed that at this point in time,
> the xarray/radix tree tests weren't really suited to the framework.
>
> Therefore I think the healthy means of pushing forward with integration is
> in sensible discussion and if patches, RFC patches in collaboration with
> authors.

Good.

> The unhealthy approach is to needle one of the biggest contributors to core
> test code in the kernel on a thread because you don't seem to want to cd to
> a directory and run make.

My initial issue was that I could not find out where that is documented.

    $ make help
    ...
    Userspace tools targets:
      use "make tools/help"
      or  "cd tools; make help"

    $ make tools/help
    Possible targets:
    ...
    You can do:
      ...
      $ make tools/all

      builds all tools.

But that command does not build tools/testing/radix-tree, so I was
completely lost.

> Why is this relevant to me? I am the author of the VMA test suite, on which
> I spent countless hours + relied heavily on Liam's work to do so, and
> equally there you have to cd to a directory and run make.

Thanks for your work!  One suggestion for improvement: tools/testing/vma
does not seem to be built by "make tools/all" either.

> But at the same time in both cases, testability of key internal components
> is ENORMOUSLY improved and allows for REALLY exciting possibilities in test
> coverage, really isolating functions for unit testing, enormously fast
> iteration speed, etc. etc.
>
> I ask you to weigh up the desire to enumerate your misgivings about the
> testing approach used here vs. all of the above.

I repeat: I am not against these tests.

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
