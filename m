Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82A8F2D5C88
	for <linux-m68k@vger.kernel.org>; Fri, 13 Jun 2025 11:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749815735; cv=none; b=qaxawVJouhlN5ud9ZjadsP0MMfXpnANqNYNZCStY1Wdiw4d+78LpqlMw5UV+gQIjoz1sEnQU8h2wskB1yGV4hf5wUt1Zyepj6jxyfWsrzLklmtKfXgSOOMwV1IvONbtSSL82dSAYEuHEgHX+gaun/EIHNrp9bfWhAu8eQJygVus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749815735; c=relaxed/simple;
	bh=bVVOZo5Kb2uKPI1jFxeVMwppdfm0+bunQdvhedvHrSI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R+CSvoF90ZuahW6O2E8585HFpTOc6D4Vh7xNpFtwGfFSBh2+wjTJWpeRu72MPrzfx1FHuRdmTku1iET3ow6hImfJml1v/fKPT8Ric3aDe3sKdzJTQLiq5Vue2Tdj+CKRf9vOV+I1EUMK+VDXk+qYehrLZp+H3VLXodlrpqDCCeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-87f13aba2ccso93922241.3
        for <linux-m68k@vger.kernel.org>; Fri, 13 Jun 2025 04:55:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749815732; x=1750420532;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BtZKhc/OvbbPLabe9FsjJOtbqfuVy5VlXMAdpjg4PKM=;
        b=afKpa1VROUNtK9d8A1KsaofnhpACGdw/Yzbgp5+biiuaca4txvyunSB3hGiMLfvcH6
         GikRxiTrQ+mCDd1MgLld6R7FlatydhQ0IxeL3rmfyS8tbxSb08xKNckRl+yE9515fqiz
         nBAT59QU+xPi2EBPNRDg1jYk9hxBwdKSgUkdH/RhyGNIzAOrLxMKfPqrjuKlSYhrbm5V
         obIWUeRat1LcEbclmpCehRJ8MDMu69TkAy0A5m7PQWSSF0W0I0SRBQwGMHXXbZkjAuTI
         Ac2WirjmqZsirJU5VkdIUPJuSTUL9MkVyHkGMzPNngCQ3JaP3CSb+AUVv9YvarHzBvoI
         GQOQ==
X-Forwarded-Encrypted: i=1; AJvYcCWwuXoIArL7q1X0xVRRwFRKRka11cpI7KbprU0avPo2NsYgjVvdLF5Tib9SmCBmj87sS6qkSCeBJRYv@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0+g58f4rAIoaDhHeYzhsG+z1tz1zs51eH5wcreNG8lMM/v1IL
	oEo1ArVRmWD1p3Gs+V8kPr2VUyOnUyd/c+jLYKn4iHpz9/PclrTyl5ITpjDOME0m
X-Gm-Gg: ASbGnctgWFhRAFN5dK5jJX1ob808mUKw8fnDCj7lJGld/WQ8a7HrF83R8WbUU1KSItD
	MP870vEa17JhP2M9lE8k9DuKUNW12aUSK25T4DNq23tRwd09aWg13YXOUJ1Ea9Mvjz9320hhqp8
	sEFIfN1GbKf0xUJMA+mMuMLALIJp1eqv3jVgTnSFOTLYwBczEV8Y9rUKo/UrY1OK5XEgUAhDeIz
	e0ZPPOKjdkDLyAJ8b4yYgwq2cAVPqUPg2oOPB91LAePgsY6Fvv+mp8EByp6O0z1bt61iWbfYjlT
	zvWlok8BNRzZGfX9LYWaN+aVJtOSCbini+KDBFFbNy6dCyrvb1S/6y+a9KfwklSP0lQKXmGAYHM
	mM/j2IPiBXKrFGfx95mlN9Nec
X-Google-Smtp-Source: AGHT+IH7HsS3n/cHkqBCy53vVxKOkxg7vr8D7a6Il+Vpq1glTchOv7ogRWn6jGKi6OWX84yME/iMpQ==
X-Received: by 2002:a05:6102:418d:b0:4dd:b82d:e0de with SMTP id ada2fe7eead31-4e7e3bf819dmr1590711137.17.1749815731885;
        Fri, 13 Jun 2025 04:55:31 -0700 (PDT)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com. [209.85.217.51])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4e7e6e68aa9sm202425137.13.2025.06.13.04.55.30
        for <linux-m68k@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jun 2025 04:55:30 -0700 (PDT)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-4e7971effd6so564388137.1
        for <linux-m68k@vger.kernel.org>; Fri, 13 Jun 2025 04:55:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUrKrHlpjzKcD+spMhFSA1deKYALzcGDfzTXDRsXEcdP32vbIrH/9rDgAKEnr/BAxIRBWdDugUCXvnA@vger.kernel.org
X-Received: by 2002:a05:6102:2d03:b0:4e2:bacd:9f02 with SMTP id
 ada2fe7eead31-4e7e39d7d05mr1515126137.16.1749815730498; Fri, 13 Jun 2025
 04:55:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ae61eb01a3d323b61ee340919971725bed59ddef.camel@physik.fu-berlin.de>
 <442267d5-241e-44a5-9b54-fee06bc5c03b@yoseli.org> <9013836044f8bfb7f0cd62ba536f6a1c75034465.camel@physik.fu-berlin.de>
 <80f5c684-638b-4486-9026-1f8689a7f147@yoseli.org> <95e56d983ace4976143c7e1180ffe5606c0ee3fe.camel@physik.fu-berlin.de>
 <CAMuHMdXNF5OCjdK7+AHWTCqSEDa-n-dYdESVVSP5Jn9UqA6feA@mail.gmail.com>
 <d1d407e4df2b3558efd5769de746645823e73513.camel@physik.fu-berlin.de>
 <758f14d8-6d03-2aab-468b-170b0bbb7d2a@linux-m68k.org> <8e0186f61cc9bbed2373ae215e80ab7e70042793.camel@physik.fu-berlin.de>
In-Reply-To: <8e0186f61cc9bbed2373ae215e80ab7e70042793.camel@physik.fu-berlin.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 13 Jun 2025 13:55:18 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUACa7Z-BV077H+G0Hd=mTBqLw7VdshbYCixeVtsuHYeg@mail.gmail.com>
X-Gm-Features: AX0GCFsE1yytAtznHz8hdIIrUR6QuQp5CYOciCGrFoZvDEWZ7nj6ROHXz2cn46Q
Message-ID: <CAMuHMdUACa7Z-BV077H+G0Hd=mTBqLw7VdshbYCixeVtsuHYeg@mail.gmail.com>
Subject: Re: Question on BIGGEST_ALIGNMENT in GCC on NetBSD/m68k
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Finn Thain <fthain@linux-m68k.org>, 
	Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>, port-m68k <port-m68k@netbsd.org>, 
	debian-68k <debian-68k@lists.debian.org>, linux-m68k <linux-m68k@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Adrian,

On Sat, 7 Jun 2025 at 11:44, John Paul Adrian Glaubitz
<glaubitz@physik.fu-berlin.de> wrote:
> On Fri, 2025-06-06 at 20:20 +1000, Finn Thain wrote:
> > Whereas, the ability to use old binaries is proof that we care about rule
> > #1 don't break userspace.
>
> Who is "we"? The official(!) ABI says that pointers are supposed to be aligned
> with 4 bytes, not 2 bytes. It's the current implementation that violates the
> ABI, not what I want to achieve which is make Linux/m68k adhere to the official
> specification.

"The official(!) ABI"...

Official according to what and to who?
There are de jure and de facto standards.

There's a lot of discussion and talking next to each other about
"the ABI", and which ABI applies to what...

The SVR4 ABI applies to systems claiming compatibility with SVR4, which
was (AFAIK) never a goal for Linux. Before that, there were other ABIs
used by various UNIX systems (BSD, SYSV, ...) and non-Unix systems
(AmigaOS, Atari TOS, MacOS, ...).

From its inception, Linux/m68k used an ABI compatible with SunOS,
which dates back to the MC68000, and was probably the most popular
UNIX OS running on m68k at that time.  Several other UNIX vendors
followed a similar path, starting from the MC68000.  E.g. the HP-UX
Portability Guide[1] states that HP-UX on HP9000/300 (based on SVR2
at that time, apparently) uses an alignment of 2 bytes, too.

SVR4 was an attempt to consolidate the various flavors of UNIX at
that time (with BSD and SYSV being the two largest flavours), and
"rebooted" the ABI.  Binary-compatibility with older versions was
ignored, as the UNIX landscape was wildly differing anyway, and
people cared mostly about source-compatibility.

Linux has a strong history of not breaking the ABI between kernel and
user space, so changing that ABI is a no-go.  What you do in the layers
above (in the kernel), or above (in userspace) is something different...

[1] http://www.bitsavers.org/pdf/hp/9000_hpux/7.x/98794-90047_HP-UX_Portability_Guide_Sep89.pdf

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
