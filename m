Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19BD81B6CE0
	for <linux-m68k@lists.linux-m68k.org>; Mon, 10 Feb 2025 07:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739174075; cv=none; b=fXsXyx/p+8rHC5dR4KyuhXeCi1e8lT4PVNt5KpU4AxgBZA+oxTmwlEgf3DASCLvdOV3yroBJFOhLoEjLtKHgiNEcygKMvqJfu/JPxUIAORqfz+o95fHRx/Fbc2oYgpaLx5ANDi4glfMKLOR+uuuZvdum4hBYZKPTfVios99Ikws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739174075; c=relaxed/simple;
	bh=zGzqUTrmQ524+OgAqr4VcU42+3jZ2qDqqvvZ3J3P0v8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Qb6AOvp+atkVqkGLEPQeWpTa078A60ZbY0Pdz8LSBqfmPVWi9XRVfF4FNXrfBvSy4zXBN6DgzFbsGFfrwMDic06OFO/X5X/bCksl7CPApslniHiltV+89iHhsUdP0JKwYVt4eiTa6fdzwzzv/hb1cfrxF8WXtRKraGdNM6dJU4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-8670fd79990so638258241.3
        for <linux-m68k@lists.linux-m68k.org>; Sun, 09 Feb 2025 23:54:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739174071; x=1739778871;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6QVuU+Pj4WW7p8VfYDhUhfStFdnghuMaJHmBwZ02Z5o=;
        b=J2IGEmEGyFqGs875vkuTswfdKxffqasK7xPDwiq5mIX9fQ7vAfjHE1wSDgMWJ1xfaG
         aC+zGihAt3BbefVTpzGknxrZktYLSX15PtMbLKJM65o0ZJbYG9SBv+zEaOrJplWanZcE
         eXs+SYksaovqicZADTJ43gI7bpmdBtMlFHW011ggNc93IW+43kwihCKptkY7EMJ7LplC
         bOQcDfs6/VAiCWTCnpyBaa0HLcJgTyzYORC4/B0f4sCDuRAk6bRfHykiL1KaG6Pm8IxV
         6GJtG0U0hm7Tt0kg+05RXLQcjwhbH7Ft4J9QoSruLKYI4RB9wYYk7GqQBi+Ax+UBwxxZ
         GOcQ==
X-Forwarded-Encrypted: i=1; AJvYcCUsFnE6wsN9g53tB1fBzNA64m/C9RfWcgXomc9f6pHpI0sFDwlKrCflArxyAor+BG6wHsvxFcrpapYL@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YzEMa3bwgBJK1JgjumqlBLm9f4wlAaEIqsMUfxZb70HV5E1dM1Q
	NdlWhayH4vdcCFCwGXXN2sZEihQc6ELPAGakOWYZZ+PqcAJjNeJgJ6bfCEec
X-Gm-Gg: ASbGncuS6M/fNSn3BCHX76mQTrDkONn11knBBceAQrZnwEuKUrtT/nH+Y5X+5RjyCUy
	jiJOiHZtqPsMpCCsVhOZOva7W6ILBEemQy7BbGIvwTuaD3hOSDqH3ik1j4GYHkManIHhjykjnCi
	vnOqWG0ecfw1DL7TxVZYu0PUNE+Jz4KIlOAkcM0XADIG7ckJQr/iW7ZMLUTR1HemGGPxIenT3Zf
	wt+VKbvmwh+PBr3/vwswA4MwPIFL+WuwuWrLtZM0Mvrv784z5hJeUIwgL/9VGm7MhxBdkjrSXu9
	6Jg7fb8NjA0roquO5z90oAlmXY6e3oCk+i74bsLsC2SDjP1wpfNoRA==
X-Google-Smtp-Source: AGHT+IFf3zcdypdUOsRfU4iYWLhpAYykeqgAHbF/I8emWGy8x5y62Q38bAvXM54jqJtZpuxZziBtDA==
X-Received: by 2002:a05:6102:3f88:b0:4bb:c76d:39ec with SMTP id ada2fe7eead31-4bbc76d3dcemr1567511137.21.1739174070722;
        Sun, 09 Feb 2025 23:54:30 -0800 (PST)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com. [209.85.217.45])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-866f9802f25sm1577413241.30.2025.02.09.23.54.29
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Feb 2025 23:54:30 -0800 (PST)
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-4aff31b77e8so1106180137.1
        for <linux-m68k@lists.linux-m68k.org>; Sun, 09 Feb 2025 23:54:29 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXe5bbQZP6DNk68uUi134Wpv4+a2oGTNM0Yrvmi1EV1tpkLtbKrEEA3rrxD4NPyBPm2zlf4ffnhg4ib@lists.linux-m68k.org
X-Received: by 2002:a05:6102:41a0:b0:4ba:7b06:7e68 with SMTP id
 ada2fe7eead31-4ba85f54226mr8216593137.23.1739174069469; Sun, 09 Feb 2025
 23:54:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250207-bitmap-kunit-convert-v1-0-c520675343b6@gmail.com> <Z6eaDuXnT_rjVSNS@thinkpad>
In-Reply-To: <Z6eaDuXnT_rjVSNS@thinkpad>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Feb 2025 08:54:16 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUsq_39kgBa8oanXeTzv44HuhS1e5MK7K2jxkVXQ7uWdw@mail.gmail.com>
X-Gm-Features: AWEUYZm5Xr2vD3ubUCPEj8UL7Ai7XR-3LWBLYpLEYOvMDEsJZO3nw3gZxZYFUGk
Message-ID: <CAMuHMdUsq_39kgBa8oanXeTzv44HuhS1e5MK7K2jxkVXQ7uWdw@mail.gmail.com>
Subject: Re: [PATCH 0/3] bitmap: convert self-test to KUnit
To: Yury Norov <yury.norov@gmail.com>
Cc: Tamir Duberstein <tamird@gmail.com>, David Gow <davidgow@google.com>, 
	John Hubbard <jhubbard@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Naveen N Rao <naveen@kernel.org>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	Shuah Khan <shuah@kernel.org>, Kees Cook <kees@kernel.org>, 
	Muhammad Usama Anjum <usama.anjum@collabora.com>, linux-kernel@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linuxppc-dev@lists.ozlabs.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Yuri,

On Sat, 8 Feb 2025 at 18:53, Yury Norov <yury.norov@gmail.com> wrote:
> On Fri, Feb 07, 2025 at 03:14:01PM -0500, Tamir Duberstein wrote:
> > On 7/27/24 12:35 AM, Shuah Khan wrote:
> > > Please make sure you aren't taking away the ability to run these tests during
> > > boot.
> > >
> > > It doesn't make sense to convert every single test especially when it
> > > is intended to be run during boot without dependencies - not as a kunit test
> > > but a regression test during boot.
> > >
> > > bitmap is one example - pay attention to the config help test - bitmap
> > > one clearly states it runs regression testing during boot. Any test that
> > > says that isn't a candidate for conversion.
> > >
> > > I am going to nack any such conversions.
> >
> > The crux of the argument seems to be that the config help text is taken
> > to describe the author's intent with the fragment "at boot". I think

IMO, "at boot" is a misnomer, as most tests can be either builtin
or modular.

> KUNIT is disabled in defconfig, at least on x86_64. It is also disabled
> on my Ubuntu 24.04 machine. If I take your patches, I'll be unable to

I think distros should start setting CONFIG_KUNIT=m.

> boot-test bitmaps. Even worse, I'll be unable to build the standalone
> test from sources as a module and load it later.

If you could build the standalone test from sources as a module,
surely you can build the converted standalone test and KUNIT itself as
modules, and load both of them later?

> Or I misunderstand it, and there's a way to build some particular KUNIT
> test without enabling KUNIT in config and/or re-compiling the whole kernel?
> Please teach me, if so
>
> Unless you give me a way to build and run the test in true
> production environment, I'm not going with KUNITs. Sorry.

FTR, this is why I've been advocating for making all tests modular, and
for not letting any test select (possibly unwanted) extra functionality.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
