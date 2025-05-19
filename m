Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 300AA268FF9
	for <linux-m68k@vger.kernel.org>; Mon, 19 May 2025 08:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747643168; cv=none; b=oaiqsDS0yubXNKZ3rv3yHfIDbGMdJCfA2Q2nthhaGSGPnEdzet8IZxwoCjG16H4zwplk+Ea5Lx6FwQnwvsqJ8BdTkzvveGjRl9LgnPzLxKHZKBijif0XPVUzzuutMzv+WI+Ey0c89NpzXHzrJxqi6P/VeHtPz+qYaKPAKri2ZnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747643168; c=relaxed/simple;
	bh=P53YB/cEAj6utE/pPgv6kFttPrkb1CeQ/P2u6ytW86s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=thKMxngudFNNNIT9cLd5zMSusXBhTbhn789DKhGwRrWYbz2S7YWM9fe7gVQhZit8awDdGX7Q7nMtulmlkJgI8Y4VIbvfftB5P2vr/F0hgm53P7y30dDClaPCwLDHN1UkQm7i/zlNsv1ajGCOfDtxOOmSVwZxAhS4wWWkw5hVH1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-52edc9ad68aso232838e0c.0
        for <linux-m68k@vger.kernel.org>; Mon, 19 May 2025 01:26:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747643165; x=1748247965;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xeG7DS0ZfRleSm1iu4zL3HMz4aUuono0+ES6pjb1pjE=;
        b=cjcoLcCHymuDDRQ7eVLHmjWhHXgdZS/ZhQKnP5ZLs93Scb869n8fqoulfCgFljn5/S
         kaOMMt3yDk9J1oA2ZcoxXFyoCdfcEhowU9hDoNO3k7FybK8AmRh2sVxPUtxy7Kt9tU8x
         5PM+jLgqQ2APWuH0V8tIX66yQ/Kyr4NwAZ1I7TkB6y9ac6OtRv6OLCJzpIv0yWIuEHUG
         UiG/LpuKbm+/IuQFXou8tkiEGlwIIQ44ZnyEV1/ghsmV/JmaJ2rbTS5u2n1F6GxHMDcf
         Az6W3yTRF59c3B6f5IHY/c/BA2wd5OI+jXvQrZBTgz6fl1eWjWmjDPVws/M79AITqb0X
         aXaw==
X-Forwarded-Encrypted: i=1; AJvYcCUzL30/CinrbzZE+nwD+FIa7hAdM6FN2v5TUD5jmAQbwlM8eYWiM0eZ0gaLIxlLcrhNgy2iSn7BT83k@vger.kernel.org
X-Gm-Message-State: AOJu0YxCqVce3nU+kIALJYLCwuEiLI2Aj/aUNksyjnoeZZC2A687stzD
	K7tXy/dGsDVpyP/XMx0UKbjaAtFmT1M5EXof+VMO801x2wYrAkfoa3mWL8jg5onQ
X-Gm-Gg: ASbGnctve3l7wZdv1pG51sGAUgj031S1yTn1HPr9vU5P9O53qEqcISvK6JrGEqenonj
	ZRy+wWBbaja9/l4hOmMvQ7L/zgSF3DmkpVzwcH2UlxaEHrMO75NyY2XSqNvdQCqzdGxxtHgJ3Fk
	SA+zf13HeH3cYK4rwBTIqvRnXYRJE1y+BcMTL1KRRVajPHM5FhaKf+IGfAW9yFcO6mi5z52dJse
	d6jGSved2etkK329113vwmM0A5SBdQ10AjLTa2rbJ5TrvGJ11YU2YjKNSYGhQrbx+e5cwtNfL2A
	Evi4FhRjyh5uV2ESt8wfzQHdXccWBVDaKuOCb08UrijLtcN4KlhC/DnbNFCm+RYBMuqMwZSO+QA
	EbLeh7pY6eUaxhQ==
X-Google-Smtp-Source: AGHT+IHMu7qMGve6a7zPdfdZIhTvZcujVPsu0qFSHFuCdpvjD+jwy6CixDx2DeR2Rq1CyjOaEhXuiw==
X-Received: by 2002:a05:6122:a1f:b0:525:aeb7:f22e with SMTP id 71dfb90a1353d-52dbcda0399mr8978251e0c.7.1747643164917;
        Mon, 19 May 2025 01:26:04 -0700 (PDT)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-52dbab6b42esm6233736e0c.40.2025.05.19.01.26.04
        for <linux-m68k@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 May 2025 01:26:04 -0700 (PDT)
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-86715793b1fso1045452241.0
        for <linux-m68k@vger.kernel.org>; Mon, 19 May 2025 01:26:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXazB+vkAkVb8wwLNOwWo1ZZwp7gjjFt1W23O/Eos1oCcde9K/xEWImjfX9ugU1f1Ro9pU8op5vA1JL@vger.kernel.org
X-Received: by 2002:a05:6102:5f08:b0:4b9:bd00:454b with SMTP id
 ada2fe7eead31-4e049ea37c3mr9574977137.13.1747643163972; Mon, 19 May 2025
 01:26:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <e9035006d50933fb02727fa373629cc821784f6c.camel@aura-online.co.uk>
 <08ce465732a0eb0dce550978c98ef822abba5f96.camel@physik.fu-berlin.de>
 <CA+OL9jj_s3ek-_4fp5b5uq-Fxmdu3NpenW10RWkiPX8Jtmxq=A@mail.gmail.com>
 <ab38d00426f3a0be1d312d969ebc747a569ebc74.camel@physik.fu-berlin.de>
 <CAMuHMdURQAf=iQxwPh57_Xj-TO_cnqH=eNPKvYDv41o8SgJLKQ@mail.gmail.com>
 <75c912630ade4e05af08eab9584c6f56d7c0ca1f.camel@physik.fu-berlin.de>
 <mvm4ixhf2nj.fsf@linux-m68k.org> <08f471d5cb51ed0fe5a3eb64fad088f3072d4784.camel@physik.fu-berlin.de>
In-Reply-To: <08f471d5cb51ed0fe5a3eb64fad088f3072d4784.camel@physik.fu-berlin.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 19 May 2025 10:25:51 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU72u0iMnkivD-SXe3o1QCsKHLwjtHCeqR+XpRsCn444w@mail.gmail.com>
X-Gm-Features: AX0GCFtbWH6KJx42IBxOLqiSkUBGdDVXdl2aRRRHkWuT8nYPLLgDXDlHxD6DXZA
Message-ID: <CAMuHMdU72u0iMnkivD-SXe3o1QCsKHLwjtHCeqR+XpRsCn444w@mail.gmail.com>
Subject: Re: Tuple and changes for m68k with -malign-int
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Andreas Schwab <schwab@linux-m68k.org>, Antonio Vargas Gonzalez <windenntw@gmail.com>, 
	James Le Cuirot <chewi@aura-online.co.uk>, libc-help@sourceware.org, 
	debian-68k <debian-68k@lists.debian.org>, linux-m68k <linux-m68k@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Adrian,

On Mon, 19 May 2025 at 10:18, John Paul Adrian Glaubitz
<glaubitz@physik.fu-berlin.de> wrote:
> On Mon, 2025-05-19 at 10:03 +0200, Andreas Schwab wrote:
> > On Mai 19 2025, John Paul Adrian Glaubitz wrote:
> >
> > > Good idea. I will do that. My assumption is that on Linux, GCC developers
> > > actually just forgot to switch alignment from 2 to 4 bytes with the switch
> > > to ELF unlike NetBSD.
> >
> > The Linux developers care about backward compatilibity.
>
> That makes no sense though as a.out and ELF binaries are not compatible, are they?

The syscall ABI is.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
