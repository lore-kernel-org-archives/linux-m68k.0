Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFAED38838D
	for <linux-m68k@lists.linux-m68k.org>; Mon, 30 Mar 2026 09:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774864617; cv=none; b=Jtqper6UFdxrJXyvhiQPdhA/ULduM6Oe7x/Fc/N7QzJb3CWRG1mKFHczWO44RVv1tHJ6uZIwnwi/4Pj2bwhi5OjbmonXnFQngXR9JrZNEvEbvlSS4SWS99q2ukHHy3tMtQeHOwXoNyDYaUl+TP9dT5VCJF9iPs8D3GYDuOsgAeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774864617; c=relaxed/simple;
	bh=SNL1+qDcYKDWaZxcnqvPQEXydd0qnW983kFu84/NbN8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VI0ASNnUr/16/R8NPJvSQtrTN+uQL8Z4bXFGla1JgTcgcKlRJszL6KFPNRiJiaf6zj4tSWyre28vJ0GOBn5wZY2h9OnfGsxcIzaEjMo6eoR5g9DffCDRq2siomo6ZiDSd4SUCH3YIW2UpesTruwYL0a/Vy3Ti+PBNNAE/CVIZ9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-951c5ac6253so1202946241.0
        for <linux-m68k@lists.linux-m68k.org>; Mon, 30 Mar 2026 02:56:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774864614; x=1775469414;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LYMJub0EKNsIzACsl745uBUZFrvQfBVwY7iuBR4u77Q=;
        b=CE9Jl7ZF3vumm/+xwdr48pklvJieEY3nKkAWnABQgplhI7Zjgj4ZXod3uqyq1CVjtt
         6/549KLxZp9z2EimNXyuHxOH+pCWJitNQ+EtlaHOs9SqRD/ECXC8VwMvFGhnClvXFzXO
         QbmR501lkvUaNcYWegfwlldb9JIBk5ozJCpZQycwBIzAJlvuPKlU71iwGNNEhIWv7Ygm
         1aHwNFXQ5L/aF4NDjco4pqndNdxSYn4Ql9OrPwX4MlTCRk9B0fqFeHW02OXAIghNhF4X
         /c7ghvGIg/WTn0sxWf2TT2ERGN29ZsZM5BI2u9sOgAjZPcxvNYWNKm7cltIjnRo0d48+
         ZwuA==
X-Gm-Message-State: AOJu0YyY8HDz0+BgJnGGFXt20ql5snm6LLxrbu4dPlyFOLlBeIqu6J5P
	j7FhGgBy1RR9y2XLEYoEFRsXFTYs66ckkz8BvHYNSKPbAohVuhiyeUAMNKm8m2rt
X-Gm-Gg: ATEYQzwtsu41kJ6dkBtymwcVxRXT3G1nApMCPkYqdYrUDAseJAh0K7+8z+ASzFHZCLA
	uD7jttSh+Zc3Ln7VGM5dpWsqyv8ty2Dud2M8f1PRoatBZDPdGs9MVbIQVB5KFe/VB8HI6NdqHQv
	Vt46W1pA9+mlq7N3weD8/EJM6kFiF0UWeNgzsR8Km/zApeo0bXs3LqVxZzJ7BHaU2zOQWEaKXqF
	jlgVOtnAgeuSGdAGEcFhLw8Wdz0RXFYo8ffQfRAz70I3jghhdXh/yzM59D16Pzm4hcUttgc/Rsd
	ot9JfRgf2gyOEG0kN14uVbvLK8tCZ1l7TEvzophXjWEw0aZ4tS3FV+1fWfsvS7FxDwuKNNe+9ah
	U8jrrGynOsoKATQ6m7XG+3YqpS19Pdbve4XHgc/xocufTmrpAnZZJon90HveQ8yZv5XWSpSvIH1
	Y/oM8Xop5wtD5d0/w3+OGtPSUQg1MhSbtmR8ntC5AwdI0uYPBBJDyQcduxGxaH
X-Received: by 2002:a05:6102:370b:b0:604:ec90:ba14 with SMTP id ada2fe7eead31-604f90c6a37mr3620273137.11.1774864614426;
        Mon, 30 Mar 2026 02:56:54 -0700 (PDT)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com. [209.85.222.48])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9539e4be529sm6509992241.13.2026.03.30.02.56.53
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 02:56:53 -0700 (PDT)
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-953b7d2c820so254747241.3
        for <linux-m68k@lists.linux-m68k.org>; Mon, 30 Mar 2026 02:56:53 -0700 (PDT)
X-Received: by 2002:a05:6102:6049:b0:602:8b67:37db with SMTP id
 ada2fe7eead31-604f92e9c97mr3109656137.26.1774864613514; Mon, 30 Mar 2026
 02:56:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260314-uapi-ucontext-m68k-v1-1-1b8b0e082b79@weissschuh.net>
In-Reply-To: <20260314-uapi-ucontext-m68k-v1-1-1b8b0e082b79@weissschuh.net>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 30 Mar 2026 11:56:42 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUZ7Ms+DFmqL02i5HaQifp-5R6BGXszzXz-uv8XFRqr_A@mail.gmail.com>
X-Gm-Features: AQROBzBMhqw0AvUcy-rnxEIUfWy51h0Bxh6bZ_VQqBpkgPOICipHAqMADg-Aeac
Message-ID: <CAMuHMdUZ7Ms+DFmqL02i5HaQifp-5R6BGXszzXz-uv8XFRqr_A@mail.gmail.com>
Subject: Re: [PATCH] m68k: uapi: Add ucontext.h
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 14 Mar 2026 at 13:16, Thomas Wei=C3=9Fschuh <linux@weissschuh.net> =
wrote:
> ucontext.h should be an UAPI header as it is used for the kernel's
> signal handling interface.
>
> Move the header to the uapi/ directory.
>
> While at it, also add some necessary includes to the new header.
>
> Signed-off-by: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
i.e. will queue in the m68k tree for v7.1.

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
