Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACFCBF9FF
	for <linux-m68k@lists.linux-m68k.org>; Mon, 12 Feb 2024 08:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707726859; cv=none; b=p+BPQqbjJLb4aCD0oluWuz2wCu75jrBHu2r5fKZi00ac5Nr+k3VQvnFwbAe6c0tVceKj0VofajFKVfK/0R6lT03j1qn9cs47dRnZe0GP9Tltrk6t7JhL1B//x8PK+0SZ7IxgCpY4PiSBqOl60rtm6Te1rgcP0tuB5w5KnuNsgJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707726859; c=relaxed/simple;
	bh=TC7YkIUu5KcxgTcQjkswqfPLExSnc8VDRJFLg3B3zu8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OcozkOWpi3rmW12Vrvv/XwlHSTrgGY9UCM/tMG+WLSLwpW1l1eFdd8hMUfBzfimDSuAV9lh60rU/urtEBWDTYpe3RRbfn/BOV/cklw+wpiuUAM1k4Ex0RJAsdnfFlANV9XPODCtM/iOt1j4lRbRWH3iGifu4NSslmU2jnhsUlyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-dc742543119so2304082276.0
        for <linux-m68k@lists.linux-m68k.org>; Mon, 12 Feb 2024 00:34:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707726856; x=1708331656;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bQCv0JdYx3KO7ENBhTEo9fPqiTJK6xJp0dwgojv3j0A=;
        b=ljzcXLHfs82xCVGHCQ8RZ3FT+9VV69XRpAbxZLsbTxMb6WLfHFbmZ07VJVmly/pdT4
         /Hj+e/wvm9DRuHoGE8ut4Ez7of5wCMtKJFZsaHCmTH61IN34ny9nT2AHIQMoG1TjvZ18
         qsf9cWVCRrx8JTNFS0Tmj2759bXcG9wgggT9Yb6+hp3/yc469Pm5l18clApD7wQB2h91
         XRLANpQxB2fERqQyis9VXGYXaIjHBz9lNbjNTls7DIxOmtQnIl2AYsGEhQwL4ciHX2p/
         8+az5BfEQxHdwaMXS/gCKMV3/GMBVMqjxDkja+qQy5Rao8C8+dqgV1vv3FlhKwpeBUz2
         GZ9w==
X-Gm-Message-State: AOJu0Yz0mCbhW/DNf78qxo6BlX+Ia2Hj2bAphh4+nUjhM53OKKr750W0
	POqOp+wfBy0Jv76dOkeLqJaaRxDz1MFKAGlcrCae7121Ewxe0Ib62y3idbyz6Tk=
X-Google-Smtp-Source: AGHT+IED3Laiu/oetksCvWE0a95yUo8+XAv++CfsVDGcUnso6uXr1Eg+YU1nBWjcPAzhHpGShLV1WQ==
X-Received: by 2002:a25:d0d6:0:b0:dc7:2401:df4e with SMTP id h205-20020a25d0d6000000b00dc72401df4emr3221135ybg.39.1707726855512;
        Mon, 12 Feb 2024 00:34:15 -0800 (PST)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com. [209.85.219.170])
        by smtp.gmail.com with ESMTPSA id 129-20020a250b87000000b00dc701408c12sm1171518ybl.42.2024.02.12.00.34.15
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Feb 2024 00:34:15 -0800 (PST)
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-d9b9adaf291so1989307276.1
        for <linux-m68k@lists.linux-m68k.org>; Mon, 12 Feb 2024 00:34:15 -0800 (PST)
X-Received: by 2002:a25:b1a1:0:b0:dc3:71da:35b0 with SMTP id
 h33-20020a25b1a1000000b00dc371da35b0mr2937501ybj.16.1707726854983; Mon, 12
 Feb 2024 00:34:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <a0d10d50-2720-4ecd-a2c6-c2c5e5aeee65@roeck-us.net>
In-Reply-To: <a0d10d50-2720-4ecd-a2c6-c2c5e5aeee65@roeck-us.net>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 12 Feb 2024 09:34:02 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXMsxRRMV8g6+9vTy_4o8HF49SUh2deNdFjgKwDLEWrxQ@mail.gmail.com>
Message-ID: <CAMuHMdXMsxRRMV8g6+9vTy_4o8HF49SUh2deNdFjgKwDLEWrxQ@mail.gmail.com>
Subject: Re: stackinit unit test failures on m68k
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi G=C3=BCnter,

On Mon, Feb 12, 2024 at 12:06=E2=80=AFAM Guenter Roeck <linux@roeck-us.net>=
 wrote:
> I see the following stackinit unit test failures on m68k when running
> the q800 emulation.
>
>     # test_char_array_zero: ASSERTION FAILED at lib/stackinit_kunit.c:333
>     Expected stackinit_range_contains(fill_start, fill_size, target_start=
, target_size) to be true, but is false
> stack fill missed target!? (fill 16 wide, target offset by -12)
>
>     # test_char_array_none: ASSERTION FAILED at lib/stackinit_kunit.c:343
>     Expected stackinit_range_contains(fill_start, fill_size, target_start=
, target_size) to be true, but is false
> stack fill missed target!? (fill 16 wide, target offset by -12)
>
> Do you happen to know if this a problem with the test, with m68k, or mayb=
e
> with the configuration ? My configuration is based on mac_defconfig with
> various test options enabled. I use gcc 11.4 to build the image. I tried
> with qemu v8.1 and v8.2.

Thanks, I see the same failures in the logs of my last testrun on ARAnyM, t=
oo.
I haven't looked into the details yet.

Only two failures does look like a nice improvement, compared to the
previous time I ran that test ;-)

https://lore.kernel.org/all/CAMuHMdX_g1tbiUL9PUQdqaegrEzCNN3GtbSvSBFYAL4Tzv=
stFg@mail.gmail.com

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
