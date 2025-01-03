Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B7EC1C3BE2
	for <linux-m68k@lists.linux-m68k.org>; Fri,  3 Jan 2025 09:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735896107; cv=none; b=rO+kBh+OMiBUX7ihOt8TnDmNQiBHa6yhAcg2mb0tk1RkwwriJPvRSZfCjJEvvcJhAOLehTBEX7Sg7ZptjshWOH1mJnachSn4I5s06b0KYgeXKW0iDKCfZB0wVXSFlK9cYI+FOf/WIvrXenGn7JWTgjgaSaNPTUXhkHZT0dsN49c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735896107; c=relaxed/simple;
	bh=n/Lb1MC5YXbPQi/MvxoZMw34dEukKFqqg7Z7FZEyaWc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kUnG6+fGnelzitfX1d2rKbEOkhojUFEC2qdrWBR/nbMOa8s9UOWRy9WIqqevNiA6ojTPmJGlCYoOAmmTA+tETeezyjQR+iW5eQknDEx/jInJtiNQnx9q5eFx68Zy2aCaeCgaw10P9/9+S8Kfb0bySECv8P40wWQ2vv4mVQdC9TU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-518954032b2so3893163e0c.0
        for <linux-m68k@lists.linux-m68k.org>; Fri, 03 Jan 2025 01:21:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735896099; x=1736500899;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8Thojfix4iWawRcqBh7qgVLXXAozIA058kz1GrMnIvc=;
        b=BKrAlenNI0qDkoR6TxQJ3DxFGnpYOn1GwbXn7w0CC57T7zPcnLdv5IlfFrVQpFsFeB
         Ez2KiCdnFriGqAi25yUbZmAmPl7h1SJ8oaSoxPwQxYGq5MMTopH8i7htkqG3RYrqlEwS
         N2wP1rBipomwZNqCYlhQjR2TheN2hbySf5sNvv4MH5c9f7qXy4abgAcrq//k0wmGzTid
         BG+MlCGy/vHnBuEuHsgVe36I+MWlBTjrwtd3xj9pgi44q4LRjLJTquSN9j0y+e4JHJ6T
         JjETvaLhj+8KjqCX+Y08WvZg/N/D1VO0GA1uGyOF+bh8au511l/bViMHcXPFGm4bUXzN
         2GkQ==
X-Forwarded-Encrypted: i=1; AJvYcCWN8biXkKLG0AH7JdYLjwfPrIjE0DmzSnDcfs3dOrE0FWo+m012jbj7RmybGEsTCWsdnXLsqZ00MqtY@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YxPQTqTXjwuOyhIbEqMhH8+gPvlKfgG+YuKmytOLGPZxrN5qB+A
	o8St0wzSeOVtPppXx9LItQ8Vzr5jE/J4xbUgfN1FguO7vJcoekmhFt7ULu5t
X-Gm-Gg: ASbGnctUnYDAuPWg8DVtco5EgwUOZoI2eE8w5igoxvkQRsYKodMn1TId113zfu8QIuS
	31uC6sPC8uj8ulcVTLpSqd2pcB09PiuC0DHJ+ZlYu22moPB09GencNIv6EcuXU6e1vjXtx2a/t6
	HEzyhn4emiz++E1GxAqRMOA9T3yrUwCLRiPyXAcSwPTxvCk0ENwWdmkev3xofy+4HfuXJ43EADS
	GPwKEA/vrymy8skvlbG6QJIFqmVhfTxBqkcCDrlWsDbqso4yJQJLl/7PJTWTDEPQ15d9yC/UZE+
	ktBStoXUsK5JOi0TpAPOBa4=
X-Google-Smtp-Source: AGHT+IEbP2zmomxH31XxFI8HRvaKnnR60G4WYYoKOmuBiAUuvpguCKoygkI6CgbNdBnwuATHlmCQcQ==
X-Received: by 2002:a05:6122:8c5:b0:515:4b68:c37f with SMTP id 71dfb90a1353d-51b75c73d5fmr33912275e0c.6.1735896098506;
        Fri, 03 Jan 2025 01:21:38 -0800 (PST)
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com. [209.85.221.179])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-51b68b7d61csm3136849e0c.9.2025.01.03.01.21.37
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jan 2025 01:21:37 -0800 (PST)
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-518957b0533so3877402e0c.1
        for <linux-m68k@lists.linux-m68k.org>; Fri, 03 Jan 2025 01:21:37 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW51CEg00wkDiHW9YeN0oBWurqGOBGotysjomoMQ6z3CGEWNPcCwWg7Ea7b3klVpxcPp6t4infEfP5u@lists.linux-m68k.org
X-Received: by 2002:a05:6102:6e88:b0:4b2:cca8:88d0 with SMTP id
 ada2fe7eead31-4b2cca889d7mr31721757137.1.1735896097341; Fri, 03 Jan 2025
 01:21:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <202501030516.uZrwnuQQ-lkp@intel.com>
In-Reply-To: <202501030516.uZrwnuQQ-lkp@intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 3 Jan 2025 10:21:25 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW-DYPp_2nAaBdvgoa6Yr9et2cNS_260H-9H_CT4yEasw@mail.gmail.com>
Message-ID: <CAMuHMdW-DYPp_2nAaBdvgoa6Yr9et2cNS_260H-9H_CT4yEasw@mail.gmail.com>
Subject: Re: [geert-m68k:master 2/2] lib/muldi3.c:53:28: sparse: sparse: asm
 output is not an lvalue
To: kernel test robot <lkp@intel.com>
Cc: Greg Ungerer <gerg@linux-m68k.org>, oe-kbuild-all@lists.linux.dev, 
	linux-m68k@lists.linux-m68k.org, Arnd Bergmann <arnd@arndb.de>, 
	linux-sparse@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Kernel test robot,

CC linux-sparse

On Thu, Jan 2, 2025 at 10:40=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:
> First bad commit (maybe !=3D root cause):
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.=
git master
> head:   17810b1de0e9e5c1000cf8f5b4787ad930b0353e
> commit: e96424b86d5098f44279399b85551e0f84a1c9e9 [2/2] m68k: Use kernel's=
 generic muldi3 libgcc function
> config: m68k-randconfig-r122-20250101 (https://download.01.org/0day-ci/ar=
chive/20250103/202501030516.uZrwnuQQ-lkp@intel.com/config)
> compiler: m68k-linux-gcc (GCC) 14.2.0
> reproduce: (https://download.01.org/0day-ci/archive/20250103/202501030516=
.uZrwnuQQ-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202501030516.uZrwnuQQ-lkp=
@intel.com/
>
> sparse warnings: (new ones prefixed by >>)
> >> lib/muldi3.c:53:28: sparse: sparse: asm output is not an lvalue
> >> lib/muldi3.c:53:28: sparse: sparse: asm output is not an lvalue
> >> lib/muldi3.c:53:28: sparse: sparse: not addressable
> >> lib/muldi3.c:53:28: sparse: sparse: generating address of non-lvalue (=
11)
> >> lib/muldi3.c:53:28: sparse: sparse: generating address of non-lvalue (=
11)
>
> vim +53 lib/muldi3.c
>
> b35cd9884fa5d81 Palmer Dabbelt 2017-05-23  48
> b35cd9884fa5d81 Palmer Dabbelt 2017-05-23  49  long long notrace __muldi3=
(long long u, long long v)
> b35cd9884fa5d81 Palmer Dabbelt 2017-05-23  50  {
> b35cd9884fa5d81 Palmer Dabbelt 2017-05-23  51   const DWunion uu =3D {.ll=
 =3D u};
> b35cd9884fa5d81 Palmer Dabbelt 2017-05-23  52   const DWunion vv =3D {.ll=
 =3D v};
> b35cd9884fa5d81 Palmer Dabbelt 2017-05-23 @53   DWunion w =3D {.ll =3D __=
umulsidi3(uu.s.low, vv.s.low)};
>
> :::::: The code at line 53 was first introduced by commit
> :::::: b35cd9884fa5d81c9d5e7f57c9d03264ae2bd835 lib: Add shared copies of=
 some GCC library routines

Thanks for the report!

Comparing m68k to the other two architectures that use
GENERIC_LIB_MULDI3 (csky and xtensa), and to microblaze (which has
its own arch/microblaze/lib/muldi3.c), that don't trigger this error,
the difference is that m68k uses inline assembler in its umul_ppmm()
implementation. I don't see anything that's wrong with it, though.

Perhaps this is an issue with sparse?

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
