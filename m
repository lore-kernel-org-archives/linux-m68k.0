Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 643402B9AA
	for <linux-m68k@lists.linux-m68k.org>; Sun,  8 Jun 2025 09:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749375393; cv=none; b=ddWRABGP6VDPTYWDV6w2taFfQr5jqONPn16K7XRvuZkFgqoUm+5R8d4jYljG+eEkLOb6vJqYRZVJRKWiLx7DBAWoxqhbIWxYyNn6LOqCv4UXw3KynhBfPBj8xU0b5eSxM7KR0FyT86JvhdAYxKr0Mz9nHq3LpK57KIIcMHSbomY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749375393; c=relaxed/simple;
	bh=VCLDuzrT1NpTtg6uPad5mV2mHCMOuncqCM44nHvvkz0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JRUM4w4dq5b3Bq9xsi0GjUOJZMhUE5uzTWnJme4HuAn5EZgd0ZPtlHDmpx5ti4wkCcfA4g2V5pgQqFInKMgu/Hh1dMbAaxDNaVG2R280kYv0W9Pjf2HF8xLxj4seci3e2HiHZ4z6iB5e52k+I03CTTxXZcxQk3WWZ9op+46Psb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-4e58d270436so1149535137.3
        for <linux-m68k@lists.linux-m68k.org>; Sun, 08 Jun 2025 02:36:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749375389; x=1749980189;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nmxOdpkXc8wFRgqF6mDzsfzWIfq2uzHJ8hAPDDQrOa0=;
        b=nahv7n+5cRdEVBGwW7pfMWLPuYMmV1gGBs8pa/lsDQ/wGbsel0Ex2X+RynsS+KzH7f
         RNN6DZOUEK8bJZ1h+xf7s49yBF4iGxPPSPNOv42gALtWWka6sKQIH2dQt1tfoRRjI//r
         DF6lTqMS4i1WmvRc7PxYmaXMh026ci6XsLAyxb5T9xuMJs2x4eKeo+2GSqFUJqmysGm1
         CDhfArVeNTjqMaxI7jmOhixUVV0ZDtTlaIjRn0+BgzqWckzje8EOMBKbnGL7vmj4NdYZ
         btRS4m+rqbHvjRH+Z3YCj2ekJ/vPbSXuAf/hnz5b9YAObDBpUpnRlXI78rgYeQ9XAoUu
         pIEA==
X-Forwarded-Encrypted: i=1; AJvYcCV29pbP+tNRltqxgn0HYKAGCqt7kEJHjefYfRAvz/2rnO/r28yMDmMlPwHRBzVNW31uSXRKRdaGTnk1@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YzQyk8/jDeXRvdACr4ievlmCuQE7JLcTTeQDYgiJ9y4j4ocYZlF
	zv1PxPq5tQOZOwRLLSWiYe4fT3GM0KYpAjbr2PTV5+w53WgTXIxlbunIp1dyh9mB
X-Gm-Gg: ASbGnctBIq9is6SdFaaGwDTCh4MhgLuh28mh94Cq/3Dx465UJU8HdWSs7J5pb1AmyJY
	mrorIneBfRI6UBsJMYBC756mnkRZbxIrUxdMgrtVrRfzNzgFMmoXJ1k99WZq3rc32+SdUGI7tPZ
	SqdcaL5swbu24nN9Nk8/WIDRlQGQ7JLhL2OlqJMFTS3LM7IXHIvA13ZXrEbqDSQ9wRtSMb6DaTO
	ru64cCinZajeVMQiFSuS6iqlup0o5ZkLMgjqKx3EgOdWJ7flcABWWzQkluydQuzGgSWGfyYDIl2
	BOyaKyKM45mYRkafA9g5CTRPXugxn6vDbPKdKNlzqPvJlBqqG4oxPXe6pXpyQSBchYys86nctHu
	JfGQneI85VJNl7w==
X-Google-Smtp-Source: AGHT+IH0AdV0UChSCQ83Oxw0QpmqEh/UXXideCuuRX4qsu4gyO9yktqRH7LRHBkJ7AzutAL2QRznmA==
X-Received: by 2002:a05:6102:c50:b0:4e1:52fa:748d with SMTP id ada2fe7eead31-4e7729e2ed9mr7939193137.15.1749375388847;
        Sun, 08 Jun 2025 02:36:28 -0700 (PDT)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4e7737d3474sm3622970137.4.2025.06.08.02.36.28
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Jun 2025 02:36:28 -0700 (PDT)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-4e58a9bb8fcso1112415137.2
        for <linux-m68k@lists.linux-m68k.org>; Sun, 08 Jun 2025 02:36:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWwT5Syh/r9jHPmWbAVHySbqv6qjHT8Ce6mz7TaZFUfaQd8FWrfF1Jjmh54ffrtXMNEsEsEG6Xcfrt6@lists.linux-m68k.org
X-Received: by 2002:a05:6102:3ca4:b0:4e5:5f29:baac with SMTP id
 ada2fe7eead31-4e772aa0fe3mr7547400137.18.1749375388278; Sun, 08 Jun 2025
 02:36:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250416114240.2929832-1-daniel@0x0f.com> <ac188e54-7f23-4ecd-805c-c0437a53247a@linux-m68k.org>
 <CAFr9PXmrVUL1HubP04iHR1ObhaNo+mObg7FC+-HpTF7QR0og3g@mail.gmail.com>
 <42674c5a-42fe-4846-bf90-340310393fea@linux-m68k.org> <5bc4ad99-3432-c7e1-32a7-e9f9db86f94a@linux-m68k.org>
In-Reply-To: <5bc4ad99-3432-c7e1-32a7-e9f9db86f94a@linux-m68k.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 8 Jun 2025 11:36:16 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXuuTnDk-snc4NipM1xYOom_uiDHtek1UkxuxhETJEeQA@mail.gmail.com>
X-Gm-Features: AX0GCFurA39txgMwJUlMsxaYBEzkQJOCgUrg-8vEcHy7l3MZSE04h5oOKTiCj9c
Message-ID: <CAMuHMdXuuTnDk-snc4NipM1xYOom_uiDHtek1UkxuxhETJEeQA@mail.gmail.com>
Subject: Re: [PATCH] m68k: Enable dead code elimination
To: Finn Thain <fthain@linux-m68k.org>
Cc: Greg Ungerer <gerg@linux-m68k.org>, Daniel Palmer <daniel@0x0f.com>, 
	linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Finn,

On Sun, 8 Jun 2025 at 10:32, Finn Thain <fthain@linux-m68k.org> wrote:
> On Tue, 29 Apr 2025, Greg Ungerer wrote:
> > On 29/4/25 10:04, Daniel Palmer wrote:
> > > On Mon, 28 Apr 2025 at 08:37, Greg Ungerer <gerg@linux-m68k.org> wrote:
> > >> I notice that some other architectures (arm and powerpc) have version
> > >> checks on gcc or ld in the config. Do you know if there is any
> > >> version limitations for m68k here?
> > >
> > > I'm not sure about that. I'll try to work out why they have the checks
> > > and see if that affects m68k too. I'm using GCC13 so probably new
> > > enough that most things work.
> >
> > FWIW, the oldest toolchain I had lying around was based on gcc 8.3.0 and
> > binutils 2.32. This patch worked fine on that.
> >
>
> I was going to try the patch with gcc-6.4.0 but apparently that's too old
> to build stock linux-6.15 (see below). Documentation/admin-guide/README.rst
> says I should have "at least gcc 5.1".

Someone forgot to update that file...
Anyway, it has just been increased again for v6.16-rc1 by Arnd in
commit 118c40b7b50340bf ("kbuild: require gcc-8 and binutils-2.30").

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
