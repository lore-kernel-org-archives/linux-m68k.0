Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 313EA37C924
	for <linux-m68k@lists.linux-m68k.org>; Sun, 12 Apr 2026 13:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776000187; cv=pass; b=dSkJBpsmr+ZXR6Zaix9660tGMAHbMLZfyGwt3Sb1NeVh1J0TiUmTyTJr1QzPQmwElCrkpMK5Hzs8VU8SLbkNHWiv4JMe4RKUjcDMeRuFrA9uBjRmPojYfPy+AA+sQBgwKd8zbrNLTRNYNsQFYcV58if0449pUomYo15rDuzhvfw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776000187; c=relaxed/simple;
	bh=1p6x7PvyQL+5PGqdAnx23TY8v0cVXdqCOnUZdmPD2Po=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ng4tRDlopiGY1SIQhRNq8Jkv6BFMVVBNBzASKGygQFn8R8CGigqwaJ6q8OV/scKIoOReyrPtejx1XzeJ2cCw2cwpm5Xdzpm8ZodtxA6j97SpvxKAExfdXJ0vLx4yE8oE21TItu+yVX7+bOUjrjU6xVLwxRkY4XZjvswAkJNwfCg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XLM5pWGR; arc=pass smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XLM5pWGR"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b9bff57cb62so573840866b.2
        for <linux-m68k@lists.linux-m68k.org>; Sun, 12 Apr 2026 06:23:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776000183; cv=none;
        d=google.com; s=arc-20240605;
        b=XCtPgy+vOZaedMaYOZNUfiE98BNTwkSYM/jFsNmZDx5KViJyiAi2+UPOxbvuQLj4F7
         cw3t9/JZRhypswhzhEyDhGH1s87deNN0cTpIH7PyWWQ6IKS60TYWEXIdTLrHQEcWEtye
         xL5iy7L/6EVW/TiB6YxVjFjYGE7BmWAeJL9Ll/AaBPhmhk4QSV3FYVQBy0estGPPmG+w
         l8oFG54NKoZQ/jIh18Uwwr/J6duIYod+l+/LWoNwd6O5+qAixQYrUSFv307lnCHTm5dD
         um+jFjrZALcIbvcUkWLQX+JN6bWhMro2XK/xG8L3O6KGJzwwYyAjkbDievZtmT7EEE0p
         l+XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gDdA9vu4Fz00bgurrj0mXlyC2hJ8rRfiuCUxuR8xwe8=;
        fh=67p7triajxO59AWrvLBLtTl1ACWwbxgtnQs+Zrzp+KM=;
        b=S//wS3JyTXAwj87LB7XxGv3g8YWqCgonzQR5u840jUNO5Q4YvHvesBBd8SeXypKJQf
         fx7NRu9yx6SnuvoJCa+RnN88SN6vNew/4N4TJ0mzz47hkNgbuBRiaepKf7sSaQQn4/4I
         +GNeF4RoFLl42/xgotvyOAAkpHF00wyCh6YTrIG8UNvq7ecj054Bk596mLnoMzKGFz9F
         41oClVvhCiO+ZRUG31pjY1GnXt4JmcjQ0bcOlQFI0xzDBq8/8AMPhj/0N+1HEIQLV6FY
         wZ1EATUZZg5pNIzRH7rVswROE8XT+wH9MClT4I5ZqPkIDqhKXClKGtyIsO6trI8LO7B+
         P92A==;
        darn=lists.linux-m68k.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776000183; x=1776604983; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gDdA9vu4Fz00bgurrj0mXlyC2hJ8rRfiuCUxuR8xwe8=;
        b=XLM5pWGR9GWWtvKaDDNerl4H+yF5t036YyMNYy9+6nHt5aPwDDgaAjGeYUeJrCjtdu
         oYvf//VwIFHAS/5mnP138sAAVHIbP+m6Qv/nRJw83Hq6rim7gmxRPfji9ynOqYq84mqx
         Lpd1OaawdEb0mhM27kVO9pqgbPwgEzmKLpFgAYiM0a4foH/vYPGa0/Kb1zSu3/vnCgMP
         sOYAjcYSbVR2RQhfK7ms53uDqAN90ApToM/QUuk7qiaYvTvmo3qmY9zFRvOUhI3Y5baS
         maAC3z/nrP5BrSANp6WbyHByRIM/DnVqwM35nmvD5Gg+NEcUuf+beyapEIV5hHz0TumR
         3KZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776000183; x=1776604983;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gDdA9vu4Fz00bgurrj0mXlyC2hJ8rRfiuCUxuR8xwe8=;
        b=U0Za242hVqSyNj5jzs2DaFie1ei50BE9Ubq9bhz3ArOEEehimtG6iaPz6oFOHNncFh
         epOrV1kEkfE+rKBTP1Ew1SCIfPqVA4XMadsu0hK8iCCLhjwsen75g/T5jl1cS8DyF+nq
         y3TcsYiRME+M6QQAfrXzfg5LpmvZn6JPqCBk1BPEO2BuMchkg1pY25cqbUsA+BRyjktq
         4mq+OacxkkkfM2LEqaqkEOFfopS5brPVXd0veZo/GoM9k+IchCFqH7k//V120LcigZ09
         YADQ3mw5GFY2tdtTwgUjewtKHdHuER+1OVVMVfsPxb/R/LGGFX6az9ENroha5Q14Cazu
         MXyg==
X-Forwarded-Encrypted: i=1; AJvYcCUkpGXJNc9discOZvYTSI0mbrDmaUuP3CrrGiNlu/UnpvbcR6ybHdG/HYgwrFrmfQApxmfk9tUBz9Sv@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yx6fGkZiQ7Nyghqgj1TZfsdsfdi5hehOWpBjRiXXr9a3rZEzHvb
	57ZDn1MINvnmiuljwvu+aphnvk4uxPJzSpdVqx7O3+/l14Ef5orIAojcKPw7aHfwDjpp7ekrrcv
	ozyLYINFMzK/YyivGwrcppTmylPVsdUY=
X-Gm-Gg: AeBDieuXEp1QK4ApHB42o6D487eBJcpfA7W+jEm2cGjBsp0icX1s9xeTCYrOfjdF2kR
	C2u6YEGorc4fgs0qplUpUgerzOT0XadZXgCdSElDd6Mpi0WarZIXL4a2GRi3Jg6YZqm94kqZ+IA
	R+tvyG7S5ECoTgznvcEeQIFV73cZReGovWcLhzr3ZZRW2UKx6o2i/Fc3jw6GlOIDMlch1in9R9M
	95kxfTH3cAYeEBMurp95DXH11nQX5eUA+9NvDCA/yX9jGlg69ENFk5Fl6tg/TqPB5CA+chesO0M
	aBVpvPbZ48H0NJDKca3Shhmd75tx4UrJc9uxjOMt
X-Received: by 2002:a17:907:e113:b0:b9c:6ef1:ed18 with SMTP id
 a640c23a62f3a-b9d727aa4fdmr352963766b.25.1776000183133; Sun, 12 Apr 2026
 06:23:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260410120044.031381086@kernel.org> <20260410120319.131582521@kernel.org>
In-Reply-To: <20260410120319.131582521@kernel.org>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Sun, 12 Apr 2026 15:22:51 +0200
X-Gm-Features: AQROBzAeMsaeSVePCJ__tEd4f2rWAY6MixXzp_fii2b8vyUpLt4xjSbtYzENFaw
Message-ID: <CA+=Fv5S68wZQapeaYTspOfsuGk=nBj60sx-ojHBSqrxV59Q+ZA@mail.gmail.com>
Subject: Re: [patch 23/38] alpha: Select ARCH_HAS_RANDOM_ENTROPY
To: Thomas Gleixner <tglx@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, 
	Richard Henderson <richard.henderson@linaro.org>, linux-alpha@vger.kernel.org, 
	Arnd Bergmann <arnd@arndb.de>, x86@kernel.org, Lu Baolu <baolu.lu@linux.intel.com>, 
	iommu@lists.linux.dev, Michael Grzeschik <m.grzeschik@pengutronix.de>, netdev@vger.kernel.org, 
	linux-wireless@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>, 
	linux-crypto@vger.kernel.org, Vlastimil Babka <vbabka@kernel.org>, linux-mm@kvack.org, 
	David Woodhouse <dwmw2@infradead.org>, Bernie Thompson <bernie@plugable.com>, linux-fbdev@vger.kernel.org, 
	Theodore Tso <tytso@mit.edu>, linux-ext4@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, Uladzislau Rezki <urezki@gmail.com>, 
	Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>, kasan-dev@googlegroups.com, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, Thomas Sailer <t.sailer@alumni.ethz.ch>, 
	linux-hams@vger.kernel.org, "Jason A. Donenfeld" <Jason@zx2c4.com>, 
	Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Huacai Chen <chenhuacai@kernel.org>, 
	loongarch@lists.linux.dev, Geert Uytterhoeven <geert@linux-m68k.org>, 
	linux-m68k@lists.linux-m68k.org, Dinh Nguyen <dinguyen@kernel.org>, 
	Jonas Bonn <jonas@southpole.se>, linux-openrisc@vger.kernel.org, 
	Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org, 
	Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org, 
	Paul Walmsley <pjw@kernel.org>, linux-riscv@lists.infradead.org, 
	Heiko Carstens <hca@linux.ibm.com>, linux-s390@vger.kernel.org, 
	"David S. Miller" <davem@davemloft.net>, sparclinux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 10, 2026 at 2:36=E2=80=AFPM Thomas Gleixner <tglx@kernel.org> w=
rote:
>
> The only remaining usage of get_cycles() is to provide
> random_get_entropy().
>
> Switch alpha over to the new scheme of selecting ARCH_HAS_RANDOM_ENTROPY
> and providing random_get_entropy() in asm/random.h.
>
> Remove asm/timex.h as it has no functionality anymore.
>
> Signed-off-by: Thomas Gleixner <tglx@kernel.org>
> Cc: Richard Henderson <richard.henderson@linaro.org>
> Cc: linux-alpha@vger.kernel.org
> ---
>  arch/alpha/Kconfig              |    1 +
>  arch/alpha/include/asm/random.h |   14 ++++++++++++++
>  arch/alpha/include/asm/timex.h  |   26 --------------------------
>  3 files changed, 15 insertions(+), 26 deletions(-)

Hi,

The Alpha side looks fine to me.

I've applied this patch on top of v7.0-rc7, built a kernel successfully,
boot-tested it on an Alpha UP2000+ (SMP) without issues.

Acked-by: Magnus Lindholm <linmag7@gmail.com>
Tested-by: Magnus Lindholm <linmag7@gmail.com>
