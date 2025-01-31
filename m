Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com [209.85.222.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CBD114A4C7
	for <linux-m68k@lists.linux-m68k.org>; Fri, 31 Jan 2025 07:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738309658; cv=none; b=KvvK2NrqHuAbsMtSgHC0o6C4IUttCQ9Q21Luzhrx1LE3xQZ+SnI5x+QR6Jrzlb/WyGJ52xCsqenF3gBQBcQCU/0Sk0Jwp6MaHBVmZDsOQyo+uufojUsA34k8cE2RL9tFnHi+lGf5A75423NOfq/jhxEESbdq/u9m1LLrySkYM8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738309658; c=relaxed/simple;
	bh=eBBg1iptajengVqdm0pmKZfYXz/Bu4Dc0woU7WS/8QQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=sWHJANQI5wVRaUsw2fh1+lRWs6ES+cLL3z6ZwQdQRARDuBTnxTAqUZCFYvsuW856bGQDgw4p7HmPN7hp2l0zD313SpTNrBYHCjkiMzQmxiNkq3h0BsXT3TOR8+BnSTW2DL24mEIspb5fVTRMKS6Kqor2mZS+85VAwUTzqe7XMlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f196.google.com with SMTP id af79cd13be357-7b6f8524f23so207495685a.2
        for <linux-m68k@lists.linux-m68k.org>; Thu, 30 Jan 2025 23:47:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738309655; x=1738914455;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8kQmZAAK+6ewvnmsf4szqYR99Nu9ojx8MPSG+efC0JQ=;
        b=oRi+F6pLDX3qfTxZAlwMMO6XTfNDvrMg67wIeRThFDAOjXtKIcOfqzA+qlM4W6hURU
         Want4YpUt6EK6Y6iFu02p4TbiO1AzKIIC8nolLq11TKCPGjFvh5iZvYsw3WOcRU7EEZZ
         cybLXFZopiyvBfVuFVx8nw2hLPEVzQWLokgXHzrTRKKQBRSAmj+7Ikh772USjceiMdvO
         7JQjbbVXIKHJjPB6qSiwf/6YX7uWAY6tAcZVNMui2rosbDmLh8vO+YcyTTb5zcVJ2B7z
         N0eC8BdskCFv4aOydcK3iFV0Pdtoy3OIwNbmLL2VtTrS3yre7kAL+BJxo16aj0pNZetp
         mvrw==
X-Forwarded-Encrypted: i=1; AJvYcCXA06q1Ad/3a1aA/C8Ucp1yTIXHHJyDKOS9/oq+ZGJ6ymCZuzjglfAXg6o3a/Yez/bMxynjk0u6TB9f@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YyUhYj0wVXhw+zKDQIBGqNLXXTdAIaNwZ7cgYFmYu+vd7GbYDzi
	GV2GYKLAV2n5jgH3UkCZ6eaq0/pqYcnr9vXLBPBjo8TL67Z23a1gHcGb2HpUpk3u3A==
X-Gm-Gg: ASbGncvXftRtUHPRwNMsbak+CWuhV3Ylqex3McqA1Eit+T++zV4BCckLR1qbRAdAW5a
	UOat4vZoOQ7KzZfn+t8kUhMSCLoHYFbM0nArN/det+udJ0Y+k2flMVkP32H3qrqvk080KBumv3g
	Upui87pGyGe0vPqPgvnpp8daKhfTPqA5x/5IjPWeYJusWYgB5xrsPZM0NLTidwZvhm2oYvbtUGd
	ax8SgVDGkudNiVaMWQP7iaTSdpKe2B3wJanS/NVlsfkB+i8xNyy0vZi4Cf/2ZbFMuLDGf6nuEmd
	9McxT5crMgZihlt35+Ug8Z4IUQrWQSh7XweSHllrLcj1syY31k0yrt9aog==
X-Google-Smtp-Source: AGHT+IGuQ3aC9lEfDiSl1kNuW82jPWu5gZPeNm/WyqxnH2Ch+riUWj3coeJ089cXwpOpthq2QvNufw==
X-Received: by 2002:a05:620a:d95:b0:7b6:dc74:82b1 with SMTP id af79cd13be357-7bffccc9f6emr1691911785a.7.1738309654545;
        Thu, 30 Jan 2025 23:47:34 -0800 (PST)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com. [209.85.160.178])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c00a9055ffsm165982285a.75.2025.01.30.23.47.34
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jan 2025 23:47:34 -0800 (PST)
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-467838e75ffso21570591cf.3
        for <linux-m68k@lists.linux-m68k.org>; Thu, 30 Jan 2025 23:47:34 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVfDQ1pbzrOPwzfpVgKqVbzxwkUn+eAoQ1OGcB/GHJeB2O21FFrZLBpptNnVW/ywg5ua4M6nlajrJRf@lists.linux-m68k.org
X-Received: by 2002:a05:6122:d87:b0:518:81aa:899b with SMTP id
 71dfb90a1353d-51e9e4e2f3cmr8999970e0c.6.1738309205451; Thu, 30 Jan 2025
 23:40:05 -0800 (PST)
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
 <CAMuHMdWDRLi8AE0PgfAnXundbS0hyTyovUH7yScrY7GtmYYPOQ@mail.gmail.com>
 <zlcagbwyskb4nkl4usbq4foc4vjcau3exp42zpfsl5b4tabr7u@o42mpfcsfygr>
 <CAMuHMdVUZQTgLpa9L9R117s39nEqxdGy=CJLyLQaTv_16EDhZg@mail.gmail.com> <ihl4bxs65uphmepoyw4xoa26mr4f3gci2mgtoq4osrzeyh3mup@hww2utbkxkfn>
In-Reply-To: <ihl4bxs65uphmepoyw4xoa26mr4f3gci2mgtoq4osrzeyh3mup@hww2utbkxkfn>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 31 Jan 2025 08:39:53 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVUrCfL+UheG56tEtT6K7vm++dNHDmcaL3cWWHyzAaZnw@mail.gmail.com>
X-Gm-Features: AWEUYZkH_w9tBM_pRW6Ohl7HsK0YqaRuQD-fO1ItmvH8HD9xdtZANpKrFhiastY
Message-ID: <CAMuHMdVUrCfL+UheG56tEtT6K7vm++dNHDmcaL3cWWHyzAaZnw@mail.gmail.com>
Subject: Re: [PATCH] xarray: port tests to kunit
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Sidhartha Kumar <sidhartha.kumar@oracle.com>, akpm@linux-foundation.org, 
	christophe.leroy@csgroup.eu, justinstitt@google.com, 
	linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
	linuxppc-dev@lists.ozlabs.org, llvm@lists.linux.dev, maddy@linux.ibm.com, 
	morbo@google.com, mpe@ellerman.id.au, nathan@kernel.org, naveen@kernel.org, 
	ndesaulniers@google.com, npiggin@gmail.com, 
	Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Liam,

On Thu, 30 Jan 2025 at 16:17, Liam R. Howlett <Liam.Howlett@oracle.com> wro=
te:
> * Geert Uytterhoeven <geert@linux-m68k.org> [250130 09:25]:
> > On Thu, 30 Jan 2025 at 15:06, Liam R. Howlett <Liam.Howlett@oracle.com>=
 wrote:
> > > > > it is to get m68k to build, you should probably know how to read =
a
> > > > > makefile.
> > > >
> > > > Like all other kernel cross-compilation? Usually you don't even hav=
e
> > > > to know where your cross-compiler is living:
> > > >
> > > >     make ARCH=3Dm68k
> > >
> > > Ignoring that I had to make a config - which asked challenging
> > > questions...
> >
> > make ARCH=3Dm68k defconfig
>
> That also prompts, defoldconfig did not.

Hmm, using a defconfig should never ask for questions.
Perhaps this might happen if it has an option enabled that depends on
specific compiler support?

> > > And ignoring the steps to get m68k compiler...
> >
> > apt install gcc-m68k-linux-gnu?
>
> There are a few compilers, multilib or such?  I've had issues with
> getting all the archs working for cross compile on the same machine
> (arm, arm64, riscv, m68k, ppc, ppc64, parisc).

I have installed all of the above (and more) from Ubuntu
(except for parisc, as Ubuntu does not have it), and more
from https://www.kernel.org/pub/tools/crosstool/.
All of them should work fine (for building kernels).

> > > > > > When trying the above, and ignoring failures due to missing pac=
kages
> > > > > > on my host:
> > > > > >   - there are several weird build errors,
> > > > > >   - this doesn't play well with O=3D,
> > > > > >   - lots of scary warnings when building for 32-bit,
> > > > > >   - ...
> > > > > >
> > >
> > > In file included from ./include/linux/sched.h:12,
> > >                  from arch/m68k/kernel/asm-offsets.c:15:
> > > ./arch/m68k/include/asm/current.h:7:30: error: invalid register name =
for =E2=80=98current=E2=80=99
> > >     7 | register struct task_struct *current __asm__("%a2");
> >
> > Which compiler are you using?
>
> I've had a hard time getting m68k to boot in qemu because of the lack of
> userspace.  I use m68k for nommu testing, but have a hard time getting
> the buildroot to work correctly to build what I need.

I only do m68k with MMU, and use Debian (ports) userland.
Perhaps https://landley.net/toybox/ might give you a nommu userland.

> More importantly, I think I get your point, you think that the testing
> should be integrated and complain if it's broken - at least by bots.  I
> don't think this is practical in all cases, unfortunately.

Exactly:
  - (cross)building kernel module tests is easy, and included in a
     kernel build, so build failures are detected early.
  - (cross)building the userland testing tools is cumbersome.
So there's an opportunity for improvement...

Thanks!

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
