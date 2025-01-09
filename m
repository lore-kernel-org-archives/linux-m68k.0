Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 725841EBA19
	for <linux-m68k@lists.linux-m68k.org>; Thu,  9 Jan 2025 10:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736418577; cv=none; b=pKqeWRTxhfcZVF4xPZoMjd5ahsU+EM8FwMeb2/7EXHNuuKIoPCZcl64ouvsdHOKAYTrRumdEIBKPkxkFEFJNMzPekBCpow0hYVNXMnsRHJV14TB3/gbqsnr0l5XMZrYZ2gfeaxk7ZuBGEd1CqZXlnxDWTiRdyTgmtuyNLs8mF+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736418577; c=relaxed/simple;
	bh=j/0sZSjmPyS3G7SQkkptKFmiIcCpnTvkU+BUq2If5+o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eXhoiGeS9ZJjE7coP9pvNTDb+zHUDbrLOahQdJxLNQs1IUeqrqVU4NcWjcRCRsyji6fXEJpjbYLc0YRZcwxJ3xidW9kmnZnSZd05xY4rsLb+VLVMfsbLzhg4hTjrbRig8GGJYK5Mu0D3djsSTt5/69UmownMZ9yM04dCwpH4pMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-51619b06a1cso383112e0c.3
        for <linux-m68k@lists.linux-m68k.org>; Thu, 09 Jan 2025 02:29:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736418574; x=1737023374;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=452u71ufwl0Y/2rOKFBZrpBLlPe+WGBNJviber7abW8=;
        b=qQCaVbHvpBzIMlqIpO+rCyPApSTeKso0+RhrFyzVkASSOCCFYe6j0hPJnIHMhXbaIM
         dCziV1kj3AeIkIf4J6VWsHrYTZq5GR1A90G38BAbZoSL6l9lPnWVFM4aQG2hrZL471Ef
         /pu8zw13Een2pBLHA1JNfOobJQn2ouUKqka9yBWx0C5HCjXcE0n9ByCVICZAQrsFoZne
         MskqV5wKa5WeAuqEn9xY1jzYwZ953t61TVAzquBhhB9Kf8cP5hYRQVIHoX6XmZz4o8pD
         AtUHBpipvymm92kQDDF8XR3ORMtB5XYpMr/kvk2D+zLUNE8fl7bQnCnBzLJoGbESmJJn
         wIjQ==
X-Forwarded-Encrypted: i=1; AJvYcCXAVdl4Je+heTfbNCrePD8ojOnWYDdbuUQ+KY3KHLyJz64B2VeaDT3AngWTF5kFNQrpdxGrY5OMCdOj@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YxxJ4z1WIP/HYBhonrwMvxV/fwx0olO5k5kpjihhUqmRL17wO9Q
	12h849zgSGWhfTFQ3cmhv1P3FANoEQgSE6oLbmHNKpGFVfFxlkU5ekLwvfPo
X-Gm-Gg: ASbGncuOAAkUOo8eUo52U5pZICyv3ArOPNdn5wdfr8expM7pXtqAZFmGrqkHstg4p67
	8WLDPsWDrk4Lp0BZarpRAKwiCR4njLwRM5wANeiOizpFM9Ye/RuFTS1UFDHc74uU7icwt1K9gvZ
	GWLyLc/hz8SHUZzW01Wwxg9alA914nytvmHPxPALTckhJiKXJiOcHvygo5mwEuEmfzfcjFfYnYN
	+LYi2BcZYWzHUQ+fcacvtKORe8kBn+w+C65+mDy5o2z/zp7pYY7F5chQjlOg5WAglAyF1W4u58S
	1heE3CEF9GI5XrUv7xQ=
X-Google-Smtp-Source: AGHT+IG7NKCxbp+TxAo35x2dKgeZfrxngjcUpXYnYAZ5WgeWmFJUfvR2frq0B8oIrP8WpwUOu+unfw==
X-Received: by 2002:a05:6122:318c:b0:518:a287:56e3 with SMTP id 71dfb90a1353d-51c6c304a09mr3688863e0c.7.1736418573750;
        Thu, 09 Jan 2025 02:29:33 -0800 (PST)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-51c7fd2d9c5sm517277e0c.46.2025.01.09.02.29.33
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jan 2025 02:29:33 -0800 (PST)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-4affbc4dc74so464581137.0
        for <linux-m68k@lists.linux-m68k.org>; Thu, 09 Jan 2025 02:29:33 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUFO4H6AbhrfTf9vDRnqbgEsDWPa7tUlgTpkKknfgAdlkinHsXatpYuzb2lVMJ2Pt33nuNAc1AylmGe@lists.linux-m68k.org
X-Received: by 2002:a05:6102:6e88:b0:4b4:27dc:ffe3 with SMTP id
 ada2fe7eead31-4b427dd0152mr3686760137.0.1736418573158; Thu, 09 Jan 2025
 02:29:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250105071433.3943289-1-daniel@0x0f.com> <c0428d69-2f18-45d3-8024-a9fe4170b23e@kernel.org>
 <20250106113749.GA32654@allandria.com> <980f40b3-fd1c-74c7-c651-b85040bbd3fc@linux-m68k.org>
In-Reply-To: <980f40b3-fd1c-74c7-c651-b85040bbd3fc@linux-m68k.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 9 Jan 2025 11:29:21 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVSGQNpsy7wtPVDksq01jW3QVRBR=zwmvOYddb1wdfAYw@mail.gmail.com>
X-Gm-Features: AbW1kvapaCtkyObFOD3mVm9HrVRRHFOeveCyQHVeo-jk7DZTmBs9C4ElYqGGal4
Message-ID: <CAMuHMdVSGQNpsy7wtPVDksq01jW3QVRBR=zwmvOYddb1wdfAYw@mail.gmail.com>
Subject: Re: [RFC PATCH 0/3] m68k goes DT
To: Finn Thain <fthain@linux-m68k.org>
Cc: Brad Boyer <flar@allandria.com>, Greg Ungerer <gerg@kernel.org>, Daniel Palmer <daniel@0x0f.com>, 
	linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Finn,

On Mon, Jan 6, 2025 at 11:14=E2=80=AFPM Finn Thain <fthain@linux-m68k.org> =
wrote:
> On Mon, 6 Jan 2025, Brad Boyer wrote:
> > There are a few drivers where we could eliminate complexity and #ifdef
> > trickery if it was all device tree based.
>
> Ideally, yes. But how would we get there from here?
>
> Should the kernel synthesize a device tree from the bootinfo data, so tha=
t
> an ideal no-ifdef pmac_zilog could work? (This seems like a maximum bloat
> solution.)

We can add a wrapper that starts from a basic Amiga/Atari/Mac/... FDT
and extends/modifies that, based on the bootinfo.
Modification can be done using libfdt, even from assembler.
See e.g. arch/arm/boot/compressed/*fdt*.

> Or should the mac platform abandon bootinfo, and require a new bootloader
> for all kernel releases after device tree adoption? (This seems maximally
> difficult, since it requires simultaneously merging many patches to many
> subsystems, even if the bootloader changes could be done in advance...)

Drivers can easily support both DT and non-DT, assuming they use proper
platform devices.  That means no more MACH_IS_* and *HW_PRESENT()
checks in the drivers themselves, but proper platform data setup
in arch/m68k/<mach>/*.

> I wonder whether any other architectures have attempted to retrofit devic=
e
> tree support (?)

ARM is the classical example.
Until recently, there was code under drivers/staging/board/ to support
mixed DT/non-DT systems, but I don't suggest going that way.
Conversion of SH to DT is still WIP (except for J-Core, which is
DT-only).

The largest initial step is usually irqchip, clocksource, and clock
drivers and DT bindings.  Existing drivers "just" need DT bindings
and DT support.

For e.g. Amiga, the clock driver would be rather simple.
Clocksource is much more complicated, as the timers are provided by
the CIAs, which are really multi-function-devices (MFD), providing
timer, gpio,spi, and irqchip functionalities.

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
