Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E24C61DC994
	for <linux-m68k@vger.kernel.org>; Mon, 22 Sep 2025 07:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758524804; cv=none; b=qvMO0b2BiQEfxmTu664KjqUswqI6sGwcDlV5ya4ThSri9ySsWQqIgHy98c57YkkmFByWAeqJXxvIYmyXRgJpnTj8KHqvSY1jnxH8UwSDR7qJ3AqgFdbc+hIl0hxGtTt+qcL2bxv05zSs8Gl09QTfIZrgmu9Htg+lA95aYtgp1r8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758524804; c=relaxed/simple;
	bh=wMF9oky7UmEQJ4boi4TyOd7REJFcUI4wE8M3KLv+D7M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=moh1lBHAfE9XnHqQ89FKODdpioEZNOfrAYly5t6bCwN7PmeY91/poAhXsY9QMWgBaa4Dxf8CN9tcKcRbF/Kk07cvIYb7K1qPm8G7pAUBocTtS4+W7PfaGSn/sBt42vu+M18y6M0hv+RfTQiCGEvpHcUZX/DSchr/iqVZlCgZb/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-54a86cc950dso1215912e0c.2
        for <linux-m68k@vger.kernel.org>; Mon, 22 Sep 2025 00:06:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758524802; x=1759129602;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=otSOcFmqfS8pvi0Xz9Z+1wbPbvnTdFmAW97wMweoytQ=;
        b=eMtJpBEkQP/YvE2uZR342IdD1rqfiBZpZaaPsjLNMmB1a1jmmK15cZlUCeG8Ue3TBg
         Z2zTMeIq17XbT8JZOUDkGtrEKuj9BVv37FF5V9LguTBItdal5AIbdDGjDMjgQnDr92YK
         ZU6xHuqm0xj++OQz4f4ooIiRoSwGykwXkgqUq9PkrJgVlnpIieGwx1LMQgNCGEUxFysn
         GNJ9noosFQ76oT8YkKPkXOfyzQTc4RLKqKDOAQejcLQmvl9b9aG6vmi2lvdIxhhb4xih
         Zbh2q1fx1ReJl1iGco7f3EqQB/JAa2lIDu0RFRl0axyoZXH+leLIpU967nTRyJ5K5Yj2
         o9eQ==
X-Forwarded-Encrypted: i=1; AJvYcCUMdOHjLbiOXqWLY/iU193hWpykN1ZEAhFA3cywv36rhk1OLg1Dz+rNgnzEDvDvzq3Z9CLKFqL0dvO3@vger.kernel.org
X-Gm-Message-State: AOJu0YwKU/1l5zEjgM7syIimg7DRWN7BYjDgILqNXnVkDqWNoAt5uZy7
	lzsLpaPk6SPLSqJfflS7oehUePcwgc3jWVnsnn0AoKl3jvfKU3JtQveciWqD6kqc
X-Gm-Gg: ASbGncvhjZK2VfzaC4Gz1Vvu+LEKRnqH4v07DsQF9UlaPneqmVjyzLPS48vjxf9YOJQ
	2MElxeETCR/1KB/hO1BZ3fE9rpYDH0MD54vepq9rGYv1Cv0KwpmgqFe0Y/bg6Ga46/Bx61BKkK5
	Fsa+rtI0OYrPF2tUlRQsaX7d+LhTQu7mTgbVuVFom1ux0degBRShk1xPmFYNzLgnG35f+lUaXZ6
	T2jrGKEHc7/LYNTah6IB1Tr/LsTKolXWNf5PjEnIkGKmLlyW/fzHTl/Pz1UDY95CwnNmP+/in+O
	GVj2sqgxt52dYUT1TVTFL1wwDakT7Uysybb5PGKymtM6uTth8blYF3TU/NCUdy7xbJrIOsEgJlM
	C6TQ42yb1ej73zPEwOX23ltY35pKvzPeuOnN0mlTtziQALLIInWc/imW0EvCJ
X-Google-Smtp-Source: AGHT+IGtACbucG9/8aMuYxNuasA80CKYkzoz2ptLWXnZGtIGfeF4taFDMEh+Bm+MQalONJEOVx98+A==
X-Received: by 2002:a05:6122:1d92:b0:54b:c31b:9380 with SMTP id 71dfb90a1353d-54bc31b9538mr36862e0c.10.1758524801545;
        Mon, 22 Sep 2025 00:06:41 -0700 (PDT)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-54a8d9f286asm1632792e0c.0.2025.09.22.00.06.41
        for <linux-m68k@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Sep 2025 00:06:41 -0700 (PDT)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-5a392946c4aso80052137.2
        for <linux-m68k@vger.kernel.org>; Mon, 22 Sep 2025 00:06:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVA9hcVsBmQv9M2L+evMOEBWFeVc5TbBL03xNobmf4Vs93pwLkvIUT65QVonrvdjTfZTkBPD6wQNizw@vger.kernel.org
X-Received: by 2002:a05:6102:91c:b0:529:b446:1743 with SMTP id
 ada2fe7eead31-588e0e8a553mr3474082137.11.1758524801110; Mon, 22 Sep 2025
 00:06:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1757810729.git.fthain@linux-m68k.org> <abf2bf114abfc171294895b63cd00af475350dba.1757810729.git.fthain@linux-m68k.org>
In-Reply-To: <abf2bf114abfc171294895b63cd00af475350dba.1757810729.git.fthain@linux-m68k.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 22 Sep 2025 09:06:29 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUgkVYyUvc85_P9TyTM5f-=mC=+X=vtCWN45EMPqF7iMg@mail.gmail.com>
X-Gm-Features: AS18NWB31RoWEM5tCRYcbUAZXcSpEG_-VNOK-4sGk7R95MgJVOOdlhgttn5Zi70
Message-ID: <CAMuHMdUgkVYyUvc85_P9TyTM5f-=mC=+X=vtCWN45EMPqF7iMg@mail.gmail.com>
Subject: Re: [RFC v2 2/3] atomic: Specify alignment for atomic_t and atomic64_t
To: Finn Thain <fthain@linux-m68k.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Will Deacon <will@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>, 
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-m68k@vger.kernel.org, Lance Yang <lance.yang@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Finn,

On Sun, 14 Sept 2025 at 02:59, Finn Thain <fthain@linux-m68k.org> wrote:
> Some recent commits incorrectly assumed 4-byte alignment of locks.
> That assumption fails on Linux/m68k (and, interestingly, would have
> failed on Linux/cris also). Specify the minimum alignment of atomic
> variables for fewer surprises and (hopefully) better performance.
>
> Consistent with i386, atomic64_t is not given natural alignment here.
>
> Cc: Lance Yang <lance.yang@linux.dev>
> Link: https://lore.kernel.org/lkml/CAMuHMdW7Ab13DdGs2acMQcix5ObJK0O2dG_Fx=
zr8_g58Rc1_0g@mail.gmail.com/

Thanks for your patch!

> --- a/include/asm-generic/atomic64.h
> +++ b/include/asm-generic/atomic64.h
> @@ -10,7 +10,7 @@
>  #include <linux/types.h>
>
>  typedef struct {
> -       s64 counter;
> +       s64 counter __aligned(sizeof(long));
>  } atomic64_t;
>
>  #define ATOMIC64_INIT(i)       { (i) }
> diff --git a/include/linux/types.h b/include/linux/types.h
> index 6dfdb8e8e4c3..cd5b2b0f4b02 100644
> --- a/include/linux/types.h
> +++ b/include/linux/types.h
> @@ -179,7 +179,7 @@ typedef phys_addr_t resource_size_t;
>  typedef unsigned long irq_hw_number_t;
>
>  typedef struct {
> -       int counter;
> +       int counter __aligned(sizeof(int));
>  } atomic_t;
>
>  #define ATOMIC_INIT(i) { (i) }

This triggers a failure in kernel/bpf/rqspinlock.c:

kernel/bpf/rqspinlock.c: In function =E2=80=98bpf_res_spin_lock=E2=80=99:
include/linux/compiler_types.h:572:45: error: call to
=E2=80=98__compiletime_assert_397=E2=80=99 declared with attribute error: B=
UILD_BUG_ON
failed: __alignof__(rqspinlock_t) !=3D __alignof__(struct
bpf_res_spin_lock)
  572 |         _compiletime_assert(condition, msg,
__compiletime_assert_, __COUNTER__)
      |                                             ^
include/linux/compiler_types.h:553:25: note: in definition of macro
=E2=80=98__compiletime_assert=E2=80=99
  553 |                         prefix ## suffix();
         \
      |                         ^~~~~~
include/linux/compiler_types.h:572:9: note: in expansion of macro
=E2=80=98_compiletime_assert=E2=80=99
  572 |         _compiletime_assert(condition, msg,
__compiletime_assert_, __COUNTER__)
      |         ^~~~~~~~~~~~~~~~~~~
include/linux/build_bug.h:39:37: note: in expansion of macro
=E2=80=98compiletime_assert=E2=80=99
   39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg=
)
      |                                     ^~~~~~~~~~~~~~~~~~
include/linux/build_bug.h:50:9: note: in expansion of macro =E2=80=98BUILD_=
BUG_ON_MSG=E2=80=99
   50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condit=
ion)
      |         ^~~~~~~~~~~~~~~~
kernel/bpf/rqspinlock.c:695:9: note: in expansion of macro =E2=80=98BUILD_B=
UG_ON=E2=80=99
  695 |         BUILD_BUG_ON(__alignof__(rqspinlock_t) !=3D
__alignof__(struct bpf_res_spin_lock));
      |         ^~~~~~~~~~~~

I haven't investigated it yet.

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
