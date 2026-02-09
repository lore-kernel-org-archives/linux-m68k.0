Received: from mail-qv1-f68.google.com (mail-qv1-f68.google.com [209.85.219.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55D0940855
	for <linux-m68k@lists.linux-m68k.org>; Mon,  9 Feb 2026 01:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770601527; cv=pass; b=OefkApRQ9qARQUPXGBhFfBY5fasUv4IwG9Xj67DfkTwshLO7vGJjqkB18RtsyQXfUzri5o+9YuV0oIJEXQb+C8C3T3snkvW9vam/8iDn1g/wisKER6BEB8H6ibsqmCDrJ9Y3tIilTayNX1RACSs+wqUnVDO5gix9a14dzz8+/Tg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770601527; c=relaxed/simple;
	bh=MS5zmnFRe+061TRkfzkniEZhajw9BVKNtmxCHscKhUI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZSrDfUNaadPlzl3B2dnH2vSNL9P0soJhfuSFKCRWnqqTe2ikwsQcjm1a0DfDaxiAtCmUUqAWqVYXmsIykFXG2EUTZYs2iBcIy38wTn79kmTfbyeqvo2zKScpR9GIpsMHg5QbGhl6KroTPWiZk5/CCyrt9JXT8nU4485Y7+SKfTI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C/4yFuaS; arc=pass smtp.client-ip=209.85.219.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C/4yFuaS"
Received: by mail-qv1-f68.google.com with SMTP id 6a1803df08f44-8966bd9da41so10512436d6.2
        for <linux-m68k@lists.linux-m68k.org>; Sun, 08 Feb 2026 17:45:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770601526; cv=none;
        d=google.com; s=arc-20240605;
        b=DDVdztnuywTCN1VcaWHG/OdZoTtSY/Rw5IM1viMcQPhctXJSWMEYgQd6WqFKTNthKQ
         z4dpejQO17v6XrAu5h8ctmINzlNNE3b50xz/C9axDFEIntA4s7BPfsrB0L3STzfXZQUf
         Ktmg9qRVx5G/UbA+DfK5De0z0Exv9oyFVy3ilKzDhdPJVniYCHxOKhMjoyscTE3YoTzL
         H9TqsDBE3wen2OX2JAMJWLHjKcRvj7k1UlBslEFwHtf+8s1mqyWkXD/CKLCKhG9nn9NR
         gwIXVSc5Qd9YwCUOJ89Mv9beUBs0DMkMVOSqdDbGsefYaT5wEPKaWTRJnfnuVlCNMemW
         YFmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MS5zmnFRe+061TRkfzkniEZhajw9BVKNtmxCHscKhUI=;
        fh=vUu1hX7ZlXdcTkiZs/8ci7/r3AtpkL6XqbJK1zWQjeY=;
        b=hr4EcjyfvcefUU+4ftBLeZq3Q+mkCWwUzHEPLwQZqJUe07p/TT3fPtmohvxzN52Frp
         2bM+a70PKciCgk/FOgtIfFyI74n9R7Yjm7Rf9sNAj/1mAdrjzgAhDQsTzyoL7FPVWZUB
         V4HwF5U0bYaNd6fbFSaV3BOzPB0pFan1oMKZpjmcNkZfDBSXkwD0XAHztNpI20tzNJHO
         8QIjIvjfNrmkI5fxYSJgqvCn/Wkh4I2RoK//g9W9ThKxln3MD5a+2NYywV393tkskxC/
         9SdyNk6FTrekUpBXPa9rQjA3XF5+GC09fUiaNxPuIlPoJ5DwdgMO46QD3FY7g+Om66d+
         89qg==;
        darn=lists.linux-m68k.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770601526; x=1771206326; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MS5zmnFRe+061TRkfzkniEZhajw9BVKNtmxCHscKhUI=;
        b=C/4yFuaSq1hycbKZwacSkMvX4FLd2EP5aQKruRAsJRrvgDMfGS4qEUuaQSphzHNUFB
         F5aqWpkslrA//2J48jJaiTSXEJSRGCbYeB4sDoNIIzaKFy0s4TPDsGyBtLXgCJSCJJK/
         mphfOn1vaZfUq+Lv597GFXAw8/Ry1eN7KN+1ipwn27g34K9NiMTSTegnn+FHMMnQBTiF
         rQpthxLlAro2gjuSaWWHH8tTaWeWDv+ltycBGdJ2J1/CIXc3li6C9SeB6CiWVYP+31S4
         kueYld2alRAWVtmfU3JHiXTQC4Y3QODizI3TskCFOxGtus3eCc57kPNEt7go3DeXmOPc
         aJdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770601526; x=1771206326;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MS5zmnFRe+061TRkfzkniEZhajw9BVKNtmxCHscKhUI=;
        b=T1jnJ3wGgYdYHOrEVuVHJqLKs+oINT+opNCXVucXQucdclyrswz40oW5I4UF3mGfJX
         uTBdy7w6UquYTdze7f2aNVBlfNBoMXWN6ct9zw/OLT1sk7CqenhxsxlDlMOyxGK3/mMG
         Ap8ncTQ9SCwVKFoekhqRKS/KqIaddDpOwcJRjfMWpoNKoqXLy6y8OJEiY3Y1nGuxmfpo
         NkwBUpln9YhhZtwMw0SLTjjZUUVvlSDwQr9kQ/aMAXOAzzQ+exBxFcgEZwBIg95n4+u+
         4qVroQgnIVfLW5udGMj8pSk03uE07Wlhc5o1iwzcqm1VhCh0j738nT+XzvNtSHQhVm4B
         Brxw==
X-Forwarded-Encrypted: i=1; AJvYcCXbMlHOR4B0+qpEm9t+Q4bcbYPHBLkiyFIy4I8lLlv86jGQ/o498FkJopbauOHaoKH96q2bR2Tl+uPY@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YxPQQTwQuQmXGn48d6aRbloVNuw+STBj0Ob97GRsFWkR8H6YD4x
	7tMq80EvE58Agt8YZfL7nIJzN4ckTnJwPoybCSG+/+BsLmBnqdWDT6XXGKut1GsbPJ1u6LDx/UC
	XI5b2skvbFDH0NPXLPB3iPcIyVBsLg+8=
X-Gm-Gg: AZuq6aLmb9ZK0PM8vDSuWbBnuwFEfEowJ7l9hc5WTSs0WIeNkHODIFwLvXqjQGqTTlf
	0qPVlDdSvXh/dcAzLkbDhhlMftWI4opjQTaHrsQn7qiqvW6p5W7TWBmvO0568GrRBk9NTZiG8Mz
	BNvwH1HE6QHoOhwdzx1Jg5i7PRpPH3HfNEi8Dul09nv5k5f1et9IQuC1pewNbBkK0kTEkC8hk7k
	aYFqwveIiNw3Wj1W6BPefoUR9tLW585HbANqNgovpTVH8nq34QF6+A6LzYhUz71Mxe2xygG/P9C
	NFPj+OwZOar3wd+phz57kTO+kiosmz7UMzGrBOTofBdZTh8tzmu8c3vJHbdnAQpcA9PH
X-Received: by 2002:a05:6214:d46:b0:88a:2707:58e1 with SMTP id
 6a1803df08f44-8953c7e49a3mr145879386d6.20.1770601526345; Sun, 08 Feb 2026
 17:45:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260209013041.37536-1-enelsonmoore@gmail.com> <017a28fe-6c0e-48ec-8b1b-10e0d3b0a04e@infradead.org>
In-Reply-To: <017a28fe-6c0e-48ec-8b1b-10e0d3b0a04e@infradead.org>
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Date: Sun, 8 Feb 2026 17:45:15 -0800
X-Gm-Features: AZwV_QjcUPyrEBqSJ5p-7XFq-EUqJYyOszX2WADnCTdXFOE-v-jyClIPieD5e2E
Message-ID: <CADkSEUhoj2Hfix3SsW4LJqYxrN294CT449MLVtjpE9t2okAk+A@mail.gmail.com>
Subject: Re: [PATCH] arch: m68k: remove incomplete, unusable Apollo hardware support
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-api@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>, 
	linux-m68k@lists.linux-m68k.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Randy,

On Sun, Feb 8, 2026 at 5:40=E2=80=AFPM Randy Dunlap <rdunlap@infradead.org>=
 wrote:
> There is an M68K maintainer who should be Cc-ed on this patch.
> (now done)

I already did this in my first email - this email does not have anyone
CC'd because it is just sent to linux-api because I forgot to do so
initially.
The original email with linux-m68k and maintainers included is here:
https://lore.kernel.org/all/20260209005212.32370-1-enelsonmoore@gmail.com/

Ethan
