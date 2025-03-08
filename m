Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A222E19C552
	for <linux-m68k@lists.linux-m68k.org>; Sat,  8 Mar 2025 12:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741438409; cv=none; b=RNsmd1mQRzVJaDpBnkDe41hiVEV5/vv8qVFIs3I2drYO8RuupkQBaU6uukJMhpzxInluIH1dtvgRbl8GB9IyOdx+1qAdXj3o1b2z3fDk4vwZQtxg3XS2w0feisA/iMWLvWPi8ndyn56vhUb2uOfT1lmADqrt2jB5ClCSy97Bm1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741438409; c=relaxed/simple;
	bh=1sfeeTT7Gmak9LSwhS1Ra7os+FPKWlJywEkinY+5Hwo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JMsjcFXvkrpMqmHUNLvwbZZ0pg46jlyB/GijYxk/lU13HzAM3e0b7pV6wffy9qz53wuBLkeQbJ4D0TOOiNHhGUioxy1TO/qb5M+Ke4w4NmUoIyyZIDaseKNO8MpD0aVUb+nsKjNve9/2fMbMwXnrbQ1cNf49Kp275lC5dGoH5zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hZaSdHLX; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hZaSdHLX"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-30bf7d0c15eso15697831fa.0
        for <linux-m68k@lists.linux-m68k.org>; Sat, 08 Mar 2025 04:53:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741438406; x=1742043206; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1sfeeTT7Gmak9LSwhS1Ra7os+FPKWlJywEkinY+5Hwo=;
        b=hZaSdHLXZg6tkW1murry/dkzYLr+/K3AcRYiqOTBMw1b4lj8w+5oQk7k3PhTUEEG/k
         ROxI8t2z9GMQhSSwzAhDVwYMwDlVR/ab70jCsJX6hFEbvrltSuYbw863a1+5PVz55Yth
         ZLCUvOGeUD6vUORNNDbS3kxN+i0AkWWTbi8uX9RRPXV/Y61A24FG2ZUI+0fTFgu6DI4w
         Mu8FcsGiLpH0GLXU5lh8AuvxqytTzSNN9DMMbZytid3OU/iGPZWnXIUVUetr88Xruvz3
         uZyrboLxy6G3CZgF2qqQhZLcJm+zSr1zUu6EU18kdBA8a4JFhSTReNVwV9AbVle+OtHr
         4zGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741438406; x=1742043206;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1sfeeTT7Gmak9LSwhS1Ra7os+FPKWlJywEkinY+5Hwo=;
        b=unSyWeBu0Mu95x8Pj4fcFNQgN6t9GCzLOJR+Pmwsojs/a+9JTFt2LQClU+6qXaBUrR
         2bVeIMbsIyLLoOELytUdZG+GsYrgKCx/6vUwl2gb9NgiC3SzW07BrlsWS+kvGoOyhz/0
         jq2/bBEClg1tUnFoLZ7mU36l4AxBKKcIVqTDBysGtT7UNTMRwpnHFrVtqX3LGextiDnV
         +4cevL0cs7+lV9sf2qeG1vBn5etJ/1m7i5ev/7S3sLt/BohcdVjTFU5n06k11xdsWs9g
         /00AZfl3F8ZqT+X9yP+k9iIpZvwiAgctr0XZJnpeatP6y9vvyAJ7sR/wRb8WpwfgJ0O4
         o27g==
X-Forwarded-Encrypted: i=1; AJvYcCUHDroJbErzgq+P+F2vhHvBNBLKfdaInFOctHbFHgr6hTMH6rcymd9HQC/s7DUrOT+SWJAJ5lJHkZY5@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YwMfysrEqCUMiZkiagNUiuEyQh+byjvT7bG5lyZcU2WElMR5B5R
	q7i5zR21Mebsyyw4MZpq7N4LbYflk43xc3YAwJL8V8kZ0i3E44+zGP70qn8hwM5x99jSdl4vy+v
	NI2vZ7NSuUoc1bhmEuzOL1dvwk5mIfgu/jqY=
X-Gm-Gg: ASbGncuznCcv6q6sHfIzx4Lgebf5Uh4CEr5MDygbKXTXxh9idxWmzZksuQHp40Ms9oO
	WBjDFd/EUfsEINJ3sHDLTEXnbZIdsDq8XxkB8zOzKdSfTLmpLrR5yqHThu3dDk4uJ411EnBCbVW
	GMP0XzFP/WXqvVzaz+6Rzz0Cc4ecGmVMN4RG9r6zzzZ9o4Wiv8/thK1oK+Q9W6pfvX+SEG5Lc=
X-Google-Smtp-Source: AGHT+IGBc+05qVuuXjaeI2ZzjZWIrRA4Fj6//dVvSffSqc3+iAQQVbEHM/psLC4ti7AS6LxNuas3m+DVljjO7VA71i0=
X-Received: by 2002:a2e:a58b:0:b0:30b:8e06:86a3 with SMTP id
 38308e7fff4ca-30bf452d9c5mr25912651fa.16.1741438405382; Sat, 08 Mar 2025
 04:53:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250307-printf-kunit-convert-v6-0-4d85c361c241@gmail.com>
 <202503072046.34DAF614E6@keescook> <CAJ-ks9kTO-u+Wqp0K-vdMLAs08fBeoovSeb_pGkMjSHFnBKysA@mail.gmail.com>
In-Reply-To: <CAJ-ks9kTO-u+Wqp0K-vdMLAs08fBeoovSeb_pGkMjSHFnBKysA@mail.gmail.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Sat, 8 Mar 2025 07:52:49 -0500
X-Gm-Features: AQ5f1Jo-nlWUK8722g4g1onlCZtycc6IeZsxrVSNnIky0DEy506UFGHSg9dFWWw
Message-ID: <CAJ-ks9=zHBmOApsqa=UZcKtg1cH0tp34Kt9_5AEJ7vzwt2QeOA@mail.gmail.com>
Subject: Re: [PATCH v6 0/3] printf: convert self-test to KUnit
To: Kees Cook <kees@kernel.org>
Cc: Arpitha Raghunandan <98.arpi@gmail.com>, David Gow <davidgow@google.com>, 
	Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Naveen N Rao <naveen@kernel.org>, Brendan Higgins <brendan.higgins@linux.dev>, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
	linuxppc-dev@lists.ozlabs.org, workflows@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 8, 2025 at 7:51=E2=80=AFAM Tamir Duberstein <tamird@gmail.com> =
wrote:
>
> On Fri, Mar 7, 2025 at 11:49=E2=80=AFPM Kees Cook <kees@kernel.org> wrote=
:
> >
> > On Fri, Mar 07, 2025 at 05:08:55PM -0500, Tamir Duberstein wrote:
> > > This is one of just 3 remaining "Test Module" kselftests (the others
> > > being bitmap and scanf), the rest having been converted to KUnit.
> > >
> > > I tested this using:
> > >
> > > $ tools/testing/kunit/kunit.py run --arch arm64 --make_options LLVM=
=3D1 printf
> > >
> > > I have also sent out a series converting scanf[0].
> > >
> > > Link: https://lore.kernel.org/all/20250204-scanf-kunit-convert-v3-0-3=
86d7c3ee714@gmail.com/T/#u [0]
> > >
> > > Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> > > ---
> > > Changes in v6:
> > > - Use __printf correctly on `__test`. (Petr Mladek)
> > > - Rebase on linux-next.
> >
> > Thanks for doing this!
> >
> > If Petr, Rasmus, Andy, and/or others Ack this I can carry it in my
> > "lib/ kunit tests move to lib/tests/" tree, as that's where all the
> > infrastructure in lib/tests/ exists.
>
> I think the plan is to take it through the printk tree. We're still
> working on it, here's v6:
> https://lore.kernel.org/all/20250307-printf-kunit-convert-v6-0-4d85c361c2=
41@gmail.com/
> where I've rebased and put the test in lib/tests.

Whoops, this is already the v6 thread! Does the layout here look correct to=
 you?
