Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D9D614A629
	for <linux-m68k@vger.kernel.org>; Mon, 13 Jan 2025 08:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736755457; cv=none; b=kVCKmLn8SmCkO0LhIWNylx4+HMXT3Ch7pT25mCgrADfof9v6iH6P/aKTKjpsb/ue8ELFAevXAwGqhz7L+13/XZ2Lo3Gj/WSCMVJTYMgQLB9b/06P20OIEZ8gHJxg4NmyugpHHobuWPdG/cvT6OMKPSZuw3ZpmRhvaXtm2Z8zWPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736755457; c=relaxed/simple;
	bh=XvYCPyEzJQm8CHuu9SlXHb7+4PBmW6OMLPv0GgbSVng=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=myK6zPdpm8X+nvaBP2zsJVuf/+wqZGjUEGaapXP5r4pD+mF1OkcZ01UpZ2OSJBW8jSduw/8pQPEgZ7m/B6UCMRbP/vozxnPoGwPatbftjUtVQ8EWMHm6fR3hUDyGXBb9PRJUnqSSCYIRBapfd+ggJYB/Bl7lRWFFEo9BMYSaK8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-85c662ebbc3so782965241.0
        for <linux-m68k@vger.kernel.org>; Mon, 13 Jan 2025 00:04:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736755453; x=1737360253;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CgLZQ8ZRsbKB6w0MMdJqZ7TQlIoclyWoCr9cq7YJc5g=;
        b=bpN+Td41cWox6b2lbkNF1qf5uNfD3Qv6keW+IRe06o7ebwj35FiWFodZDHwS3X1Thq
         J+SX0cplqDvejGCIQ6bxJ++z7al/YNhb3lJJclfdDcCFxMORRqTQA5xjqq4UJKAdmYH+
         daELdFGx4VuYm777bRRQ1HSMrJBUM1P/RS9LnO2cjlaeRy6EvjH5uXZjQSFkO+9enafQ
         1hPy4QOVBhX4helDgVHdHV3lSsOe7X6jJP58rxJ8INNPuTIU2Z10Mv+zbj4SMj5nX4+Q
         mo0F/KAfKDxS/kOO6RkBUTaygocILSlT+fmxu6utDpm/b9+FYGHjoK8wnB+pKqpGpJTH
         dKhQ==
X-Gm-Message-State: AOJu0YxKHVfUqi1UFg/m8ckiuBASyMfzb09ltuAK9dO8Wzf6tk8GrPIy
	DxkkWJUfoB4o+5NV8CJ1Stys0s8N2Rm6kN8aKpEoHv+QUmorAsz1iFTFlmCv
X-Gm-Gg: ASbGncuH4+FgeWHtzPGQ2xlcgkBllyevDVAs7jw11n9QpWpFK3Us16SGetmWB+v+zua
	NCUzyqcWqV2EYW2V5CvsupsqEVg9KvSkDFwDmbA6xEhi7QFLaMZ32BYdnqw4w32p57MsyW4OCfP
	zp1rHEQHbtWk7ssjBF11gG6b04WhmltbuIvjBjkLHA4LWPijtq42FWsHK7OWMU/WXEoe41wOdCx
	rIyUQB420FhKgZP4vk3AqlDJ5cjepMl+nbImsjuVNIhhkh1dmn4tzQip5HlESdKbH5WS3DKAGNq
	Axp3UB/ffXQg7zXSqAo=
X-Google-Smtp-Source: AGHT+IFLc/9DsMHb9jec3v2oMETi+orUlxHof6JWLMxHjIzF8uKh1qPkBD1Bjybm5j2KsJ7kPQRoEw==
X-Received: by 2002:a05:6102:6f08:b0:4b2:4950:16fe with SMTP id ada2fe7eead31-4b3d0dbf862mr14568331137.14.1736755453055;
        Mon, 13 Jan 2025 00:04:13 -0800 (PST)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4b608f04e3esm4124895137.5.2025.01.13.00.04.12
        for <linux-m68k@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jan 2025 00:04:12 -0800 (PST)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-4afefc876c6so1439875137.2
        for <linux-m68k@vger.kernel.org>; Mon, 13 Jan 2025 00:04:12 -0800 (PST)
X-Received: by 2002:a05:6102:b11:b0:4b2:cc94:1877 with SMTP id
 ada2fe7eead31-4b3d0dbf23dmr16614342137.13.1736755452667; Mon, 13 Jan 2025
 00:04:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250112150542.413179-1-p.pisati@gmail.com>
In-Reply-To: <20250112150542.413179-1-p.pisati@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 13 Jan 2025 09:04:01 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUO0qms43yzQMA8hh1wd6VaDYV_0TYpggxE9S5ZVeoLVg@mail.gmail.com>
X-Gm-Features: AbW1kvYOjw-2VGmKOXzs6aJ-NifeViF6jK8s4x_n2wqyFjwBUEAZpCNmUjr1JbQ
Message-ID: <CAMuHMdUO0qms43yzQMA8hh1wd6VaDYV_0TYpggxE9S5ZVeoLVg@mail.gmail.com>
Subject: Re: [PATCH 0/1] [RFC] Commodore's Gayle pcmcia driver
To: Paolo Pisati <p.pisati@gmail.com>
Cc: linux-m68k <linux-m68k@vger.kernel.org>, Kars de Jong <jongk@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Paolo,

On Sun, Jan 12, 2025 at 4:05=E2=80=AFPM Paolo Pisati <p.pisati@gmail.com> w=
rote:
> Here is a second attempt to get the PCMCIA side of Gayle's to work: it me=
rges my
> previous attempt[1], some historical (e.g. v2.6.10 era) work from Kars de
> Jong[2](the set_io_map() and set_mem_map() are a blatant cut&paste), and =
it
> follows the NetBSD code[3] (when it made sense) - credit goes where credi=
t is due.

Thanks for your series!

> And, finally, the extremly sad part:
>
> 1) i've forced the word and long I/O helpers to be little endian, and thi=
s is
> clearly a big no (see io_mm.h).

Can't that be avoided by setting ISA_SEX/isa_sex appropriately?

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
