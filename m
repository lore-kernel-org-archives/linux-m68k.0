Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE8D43D47CF
	for <linux-m68k@lists.linux-m68k.org>; Wed, 27 May 2026 13:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779887943; cv=none; b=QkHqlb1uQhHIROCC+gBT1/IUHMfpNyt1JJRp53vwPd4GaaeOyJZqIeWZkC1upplk/Tzw4k7WDsR4riN+3cHVewFViVCSPdZ3+Npx7CvjFBECYFZOT8mHj7tlX+7vfA1rQMVhwnXY/rAgl2h8MO09dN31moh6zJbpo6qDEu9K4gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779887943; c=relaxed/simple;
	bh=c4k2FbaT4ZE5BrlqmEG2KGVxbA/hohu/6d2zR26S1jA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IPObPUoKzHFphN8xcqLTmkyoz8uz2RuvYIhJK/DQeNfVs41Ov9n8Ot6L5l+bmraJjp9VMUV3iDgop1d0tfhatBJ0/i3CBO5qgu0fYspw+lCbPdBOcBWPpSrDtvMlf3UsexbFHoGK2p6O3n7IcZ69DvaKbLG2zK0T1JE13k33yoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-57602a2d80aso3773276e0c.2
        for <linux-m68k@lists.linux-m68k.org>; Wed, 27 May 2026 06:19:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779887942; x=1780492742;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QCy1VyfY2ZbNrTfHelvIjzn2O+2cJZLSUf7eYXBf/sc=;
        b=VQGB4enSCxDjQJLm33LMw4fkVDKG7ANXXzO2dvD93X4OgXpTKIiE6OwU2VX9fi+LC/
         bRxjI/LS2YkLrGMNdLjLHAUIvF0AAgDnvb+lnnNQmaizfiYl02ZUhZquKuEq4bUO5ury
         LqzT8o5AI56uFWA2HGxDEMcf2irNZnGkGJvoLDxEBTLbBqQI/i7LpNBIXNPyoKRD7zAq
         OAJVXYDlH431z5c9X9oBHCmsDVmkHpfNWgB2zPIomya+g6XMWcq+7/ywjYv+dRTF6P6p
         y9Tt1SOuASEtRKlE47MAUUkGNyW1LBqROn5Smc9I6YAFdaR4xxF5CyKFrz9h3/AST/VC
         Gaxw==
X-Forwarded-Encrypted: i=1; AFNElJ9Tc1RyQP1yxVCCsViNNwsDFHUKKXDhsVsSk0iBpgVphyiAIBaRfMkDzd5gt1U+2GnEbsOYkwrGHrgM@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yzb7U+a+y66Pa+hLKMyQape0KmjACtYzI6juuxetaD3bZvcucqD
	n3uRFCQfTxqUAMYsLLGRSJ1ZgthfBBnhqytIT9XB5RIbXStnRgwMgO5BOm0WRE5O3Aw=
X-Gm-Gg: Acq92OFaQLYQYdWa4MbYcg0jk/ioB82J0NAU3u/P2KCZjniZq8RPS6YCzvi4wALij/K
	juApB+ivOY2OYXXBCMYonTcqwlwt0D89j0yRGQbVj4tj/HI0vdZusqFYPIANmIOTnZcolQ9uOY0
	ulfDHGrjXK2vd1FqGtjtSF/bKYUvoy9olozGCFLTLUUvNVtVOpqS/rqAsSBqLpNyop933HushUl
	a36BPwRsABgVCuXZLMSGgd1m18c/t27VgEliR6GdLYAU5HpZLwTwWkqP+rNVOQreYuoG4AzsSTB
	PrKQKdDIvhY/hrjzWasFprro9ASTY2xrtWxLaJ8+DVN8MLXCPmNhbXE0VTuJ1UBMaLQNlzPjHaA
	yDIt8SWBlaeiyRkOJFnsuW/qUcBXm7Hs2NLnnx6Mhcn88Um//y1E+JKxr3HnZUwwQTYGwbB/z9k
	6IsInmqFnW8r3lleY2K8qxIJ91Kcm4+R4FM3w41zML5wpQBzoTloC5xYFGKxfpZcX2CJ2FKUDHl
	tI=
X-Received: by 2002:a05:6122:4587:b0:577:51e4:ef1e with SMTP id 71dfb90a1353d-586616414fcmr11829067e0c.9.1779887941582;
        Wed, 27 May 2026 06:19:01 -0700 (PDT)
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com. [209.85.221.169])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-586f8f6cd40sm21202638e0c.16.2026.05.27.06.18.59
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 May 2026 06:19:00 -0700 (PDT)
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-57602a2d80aso3773247e0c.2
        for <linux-m68k@lists.linux-m68k.org>; Wed, 27 May 2026 06:18:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ95QKH44sWkz+dNM1baVeVM/3uaWqdqz5PHghiEJIpMC25NhaCYqBTs7tTxEfowyID09UhU3sx9foC5@lists.linux-m68k.org
X-Received: by 2002:a05:6122:3402:b0:56a:fff5:b4d6 with SMTP id
 71dfb90a1353d-5865e2b5250mr12331762e0c.4.1779887939678; Wed, 27 May 2026
 06:18:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1779803053.git.u.kleine-koenig@baylibre.com> <b7f3b4bfa5daabf8a3043177341b8dbb4e4d980e.1779803053.git.u.kleine-koenig@baylibre.com>
In-Reply-To: <b7f3b4bfa5daabf8a3043177341b8dbb4e4d980e.1779803053.git.u.kleine-koenig@baylibre.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 27 May 2026 15:18:47 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW=8CinkPvBzY1JXJcy_7BGzS=t=T739sDbbJsFoiiW2w@mail.gmail.com>
X-Gm-Features: AVHnY4LVf2HmV7NEUt4hHqvz3XHWWTYsnrOn4NRK1knY3FTiRsXYFw6-dPyILKg
Message-ID: <CAMuHMdW=8CinkPvBzY1JXJcy_7BGzS=t=T739sDbbJsFoiiW2w@mail.gmail.com>
Subject: Re: [PATCH v1 7/8] scsi: zorro7xx: Make use of struct zorro_device_id::driver_data_ptr
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, 
	"Christian A. Ehrhardt" <christian.ehrhardt@codasip.com>, "Christian A. Ehrhardt" <lk@c--e.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 26 May 2026 at 16:18, Uwe Kleine-K=C3=B6nig (The Capable Hub)
<u.kleine-koenig@baylibre.com> wrote:
> Usage of .driver_data_ptr allows to drop several casts. A nice upside of
> that is that now the constness of the linked structures is kept and the
> compiler warns about zdd missing a const. So add this missing const, too.
>
> While touching the zorro_device_id array, drop an unneeded explicit zero
> in the list terminator.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koenig@b=
aylibre.com>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>

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
