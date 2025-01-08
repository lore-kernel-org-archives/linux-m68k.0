Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16E821A83F9
	for <linux-m68k@lists.linux-m68k.org>; Wed,  8 Jan 2025 09:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736327014; cv=none; b=lR/PBTkmQGGCEAHzczj2OKcAtZbhvlwDtkN/TP2GPh2kay3cynKqDuc35Jkk6+aupgRcppEq9vL4yfAV81BxtdV6ZVNyKVaFM00N3KBbpzDSWwMKhqwbAB6J5rPu4khAlY/WZkjMaUu8TWYGzmkC7BhXNhrN8rdQCqP5Oihx/qM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736327014; c=relaxed/simple;
	bh=ou5g7yF5GGXIaS+xyyASROrIK3ksCfHMkioa+51ECbc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AHJIFV9CMZSuXdka184SmS70grwhS9Qj71r4uaFZgj+E6hI9PQdx3ocN2fObx6a0YYBOy87U/dYSZ857AnNBLW5Hj59+RJjfXovJ9F3dnJBFgXDdAEaoZqxhoHLViu8ZoxpbXHPFdsIWlooqjR0GB6P6vCvoniK+2JGAx1qUm30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-4b2c0a7ef74so9298370137.2
        for <linux-m68k@lists.linux-m68k.org>; Wed, 08 Jan 2025 01:03:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736327011; x=1736931811;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qQEG4wahl0MfjRpo+CkvPlSDTf/T9itnZTDwYbZYwOs=;
        b=NSzwL3IrOVH5v/DP+zH4enxPsjuXUA8v45wLrxvzgJp1gcJ4+op1qzXgXxFTHXcsaA
         KPfBl8eauPnEucey9FJWuhTTmw8+RXRwsURX5wQRP63kU192PKIsdGJLRE/XUbVN7k5G
         1/KV3FOXWWr6PjPTknctC4FHYgkYNdCESUn7e3Zm2rb85NsKNQ68oBseRQCdh5/5Yc6P
         cJX9tzxcW+k2WqwtS731DUtSS2F95jDSw2JfvAZPTiRukdT8IQkxtjdyN4mPW5kzHpbs
         sinjr9oNjX9JbX8qu24hI6akrktFb/R/J0P0KD7pUrDQAJ0NVccalfknWxkPWBPtA6RG
         kFow==
X-Gm-Message-State: AOJu0Yzt0GG0vwHSepPIXK6nk62nwB7Nx0UEwFCWW8mqCBdZzdmiNXGi
	HakR6Ht+F/Bs832Avel7BkIMP0Bv7wX9OpwlK1AruCdQ/XqoXWz4LH0YYxfj
X-Gm-Gg: ASbGnctCVucxBfFV0ptZNWNCw5LIR6+m2dnqsyWhg+GTxEcg9Sr5YVcL72dXLU/vHBF
	IUEmBnGTXrKBI6F2MOwRXPLm0L3xoVb1SpQJO5QyiOA4kTOz5spAonOB7id3Nzoauzl+i/zQysq
	tbg3H+VH0xmPQB0o3kEA4jn1GVk9bN5qK9jW21oAPlFSG/X4g1BgKyeyxGChz8hGerPGxlIjUol
	Fd72FQWKMcXdrQCsdQmlcdFnaGqNrguVU1WyeB3rhYJR1f9fHE0sxxaQVpoZrE8e16IcFe2NzbI
	1lng6tYT+FJ7NmPb+esLbyI=
X-Google-Smtp-Source: AGHT+IFPiRWP/JxwkyZ8x3eENn09I/lEJ4YAPAidUAJd+nQ0zIvu7O7hROkw/YnYgeuYnuRwDmZPcQ==
X-Received: by 2002:a05:6102:f0a:b0:4b1:1eb5:8ee5 with SMTP id ada2fe7eead31-4b3d0eef0d1mr1125889137.25.1736327011350;
        Wed, 08 Jan 2025 01:03:31 -0800 (PST)
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com. [209.85.221.169])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-8610ad3e9d6sm8180824241.23.2025.01.08.01.03.31
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jan 2025 01:03:31 -0800 (PST)
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-51623968932so8827570e0c.1
        for <linux-m68k@lists.linux-m68k.org>; Wed, 08 Jan 2025 01:03:31 -0800 (PST)
X-Received: by 2002:a05:6122:208a:b0:516:1106:4c1a with SMTP id
 71dfb90a1353d-51c6c32e1d0mr1143833e0c.12.1736327010887; Wed, 08 Jan 2025
 01:03:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241216-sysfs-const-bin_attr-zorro-v1-1-220a38d49507@weissschuh.net>
In-Reply-To: <20241216-sysfs-const-bin_attr-zorro-v1-1-220a38d49507@weissschuh.net>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 8 Jan 2025 10:03:19 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUV4SGenwcFK3MgfxF7Oasa3nG=BqYhxEoBtW-5iu+ApQ@mail.gmail.com>
X-Gm-Features: AbW1kvbL0IdxXRJVId6Z4X5Yo5gnKeAff6GUarfhF0TH3UGZWS0DeMNofLNiI9c
Message-ID: <CAMuHMdUV4SGenwcFK3MgfxF7Oasa3nG=BqYhxEoBtW-5iu+ApQ@mail.gmail.com>
Subject: Re: [PATCH] zorro: Constify 'struct bin_attribute'
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 16, 2024 at 1:30=E2=80=AFPM Thomas Wei=C3=9Fschuh <linux@weisss=
chuh.net> wrote:
> The sysfs core now allows instances of 'struct bin_attribute' to be
> moved into read-only memory. Make use of that to protect them against
> accidental or malicious modifications.
>
> Signed-off-by: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
i.e. will queue in the m68k tree for v6.14.

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
