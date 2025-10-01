Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 525031C861E
	for <linux-m68k@vger.kernel.org>; Wed,  1 Oct 2025 07:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759302513; cv=none; b=fiJbgg9awHTQkiaiX0fK3TDJ3dw2qzdkzL3/5o1nMbLtMl9KJTx9AQNIotshWvWDo1H1CUK9B7E1n2i0OnVHMQpSNwCsb6TniV6NaWD6XO8aa4PTYqiAO2I7cF9jmksaCQlSJfbsJFJwZrEg/lMpyjziczqAXeVVs/UsU1R7Ay8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759302513; c=relaxed/simple;
	bh=7ANDfXM38Gq8udquxdGN69lHmB9wggZcgP0ai0VsdIo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZQ6oENgIKayLxUbW2nTzUTADeUdXJAoPp6S71CyHvSaOBFeV4eenq/6t6ZUYcTLuXB1py4vcy02C8sTD7ZpAuh8TrieLLepianKL5f16D9WIAFFpnIQC23ZdNF1zVfPbPuSGONd547gdRimkPv8OpC3cvWk7SRWznQlyKHMO9i4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-54a8f6a2d80so2355543e0c.3
        for <linux-m68k@vger.kernel.org>; Wed, 01 Oct 2025 00:08:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759302511; x=1759907311;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z1Xe/yIXoUfwDHnypUCkmL2agWH96d+WyVy9U6y5GP4=;
        b=iRhyiHjD3m0bnE9JpADBH2T2oiUewQBJtH9sTkeJtqHsErxuNUHl9wTFYSxAuqYmwI
         IYeE9aNZWf9O0T0Op12b7A4n4h9vsIb4bzwhC+lhRGFBCoyOHPxpOSbRdK+KTToYqg2q
         BUJNxJGAE5LTZnyB1mghT8HpRzXzxYAEvEq2tNxH1LBfmRVmNlfXXrDp/NaWeLrraftD
         XknqSMA2+UoCh0hrKRorcKqn9VHmk6z7z4qPcN5WpstEAE7D4xwnLw+yDkw/h9AYgMso
         X+YNGmDC1gr7hJaSJ519JKG2YKxpR/JFxf7liyYBjEh70nIkesbPlqM2dieuFaicZeiV
         Z3dA==
X-Forwarded-Encrypted: i=1; AJvYcCUZ6hbK3mIqKnarYiCn24Q96ht3ymI2+B3F+OxTp8iczskMPPakw1K274u/5b1zBfRgxMb/vwdhqvT9@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0jGxCUMPp0ZvlAzHBb/cCUU5YsEEnE+YG0ZDnmix7U6oHSAZw
	KHfBjez86ZVisDeTqvz7E8mmkbtkwHsB+X/paOK+iOKLJob95psiJbFcc67M0aOU
X-Gm-Gg: ASbGnctPoUVYHJf1QXumFYMWidjKfvaEhN1tFAIv5TqZ09qZHQfA36TjnbhNdzpgzFN
	dEsQEtd4W1c1MQ/TekCuDyhmqVp08FllwudZg4gCOh6F8cGirPC3fHjbHGbglkl/SIXIFJOzQMi
	LzeTMVRJHkQI8Cp4IX9odOczJJ7m083JZFZ9fQRjhtTn26QH43/cBG7aEx59GFqROmsZJF+KIqf
	w3iAyRV1+wLyorBlTbB/xr8cwUIsTc3gUP2adY3sUnmFHR8fRZHdqmcGMxBWj6iKKjixt/4B6wv
	IklKeJRlOsf9HAqqpDvFS5ykIg8ngoLEZaqirUBxRtbZVO1w+sXBJlgtvrm3KClqvrbHxfVKX9T
	ixlyplhWAiB3xEYcNAOHYs105r4gShQauM3in3ezuUuZveZtqmixo/LkV04ZE6qp4EropDf01Jf
	3Ckng2qOMQ
X-Google-Smtp-Source: AGHT+IGSMjhsbjbSsh6Yvc75rXu8XXwiDWH1D89q7P6j12JoU6k+OSQbrz1JzRWb1j2fcJKXrxcqeA==
X-Received: by 2002:a05:6122:829e:b0:552:2c5a:c057 with SMTP id 71dfb90a1353d-5522d3e8ebfmr989414e0c.13.1759302510805;
        Wed, 01 Oct 2025 00:08:30 -0700 (PDT)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-54beddf9c76sm3498808e0c.28.2025.10.01.00.08.29
        for <linux-m68k@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Oct 2025 00:08:29 -0700 (PDT)
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-90f6d66e96dso1802715241.0
        for <linux-m68k@vger.kernel.org>; Wed, 01 Oct 2025 00:08:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUzCu3hGaQR8EjQ/Pj74zkWV/x8AexQ65f8o/RmtljHh6ZTrksBH5ajxElq06+qqC1Qh9h+Q4vpD2h9@vger.kernel.org
X-Received: by 2002:a05:6102:26c3:b0:558:72c1:2762 with SMTP id
 ada2fe7eead31-5d3fe5358bdmr972805137.11.1759302509044; Wed, 01 Oct 2025
 00:08:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1757810729.git.fthain@linux-m68k.org> <abf2bf114abfc171294895b63cd00af475350dba.1757810729.git.fthain@linux-m68k.org>
 <CAMuHMdUgkVYyUvc85_P9TyTM5f-=mC=+X=vtCWN45EMPqF7iMg@mail.gmail.com>
 <6c295a4e-4d18-a004-5db8-db2e57afc957@linux-m68k.org> <57ac401b-222b-4c85-b719-9e671a4617cf@app.fastmail.com>
 <86be5cf0-065e-d55d-fdb6-b9cf6655165e@linux-m68k.org> <ec2982e3-2996-918e-f406-32f67a0decfe@linux-m68k.org>
 <CAMuHMdV1eGkq_kOPTGbfDt4E2V5zCTdYc_BGJg-56-ZUS353YQ@mail.gmail.com> <7c2c4da1-57f6-23b6-dbff-6288ef3f2a4f@linux-m68k.org>
In-Reply-To: <7c2c4da1-57f6-23b6-dbff-6288ef3f2a4f@linux-m68k.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 1 Oct 2025 09:08:17 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVwYvJSoAWDTJJYOTt8mgtfa+sB_uevYR3NXFUK2fVS5A@mail.gmail.com>
X-Gm-Features: AS18NWD9LDo6xA5ckwXmlLEmk9kfyHz5Y83hVqr1eWllj9E1zqRP90XkriKsg1k
Message-ID: <CAMuHMdVwYvJSoAWDTJJYOTt8mgtfa+sB_uevYR3NXFUK2fVS5A@mail.gmail.com>
Subject: Re: [RFC v2 2/3] atomic: Specify alignment for atomic_t and atomic64_t
To: Finn Thain <fthain@linux-m68k.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Peter Zijlstra <peterz@infradead.org>, Will Deacon <will@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org, 
	Linux-Arch <linux-arch@vger.kernel.org>, linux-m68k@vger.kernel.org, 
	Lance Yang <lance.yang@linux.dev>
Content-Type: text/plain; charset="UTF-8"

Hi Finn,

On Wed, 1 Oct 2025 at 03:46, Finn Thain <fthain@linux-m68k.org> wrote:
> On Tue, 30 Sep 2025, Geert Uytterhoeven wrote:
> > > To silence the misalignment WARN from CONFIG_DEBUG_ATOMIC, for 64-bit
> > > atomic operations, for my small m68k .config, it was also necesary to
> > > increase ARCH_SLAB_MINALIGN to 8. However, I'm not advocating a
> >
> > Probably ARCH_SLAB_MINALIGN should be 4 on m68k.  Somehow I thought that
> > was already the case, but it is __alignof__(unsigned long long) = 2.
>
> I agree -- setting ARCH_SLAB_MINALIGN to 4 would be better style, and may
> avoid surprises in future. Right now that won't have any effect because
> that value gets increased to sizeof(void *) by calculate_alignment() and

Ah, so there it happens...

> gets increased to ARCH_KMALLOC_MINALIGN or ARCH_DMA_MINALIGN by
> __kmalloc_minalign().

Thanks for checking!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
