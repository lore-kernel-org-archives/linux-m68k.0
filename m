Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F2DD13B280
	for <linux-m68k@lists.linux-m68k.org>; Tue, 24 Sep 2024 07:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727164044; cv=none; b=ohbG6tWR+iHySR2WnfnM3f/BJC72U3ifBwu0KgN6fRshPZn8/n3GUenMBgiTQXC78+q7YD/yPraSVuHYWOk8b/rf4T9jYJkkXAdQKlQNikVIEWyeTq1p1u94rl8Vb6j9t23SLSfdDeh5OBHhrXOIIrVbqeKv9+TR/eDRmk70G+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727164044; c=relaxed/simple;
	bh=lUiC8pPeAdjEEhjbLYsIogH+t4nNjZ104qOhbL4yMYc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MFDnWMCSR+D1++TKi+NOLBCXZaMQO0ZjibaL3P84RJfDkfg7D3gFcYceG9DmSHq+eaYQlg18v4TtQDg5mVCIaW87bLCiXHQKK/TssxxCJwvLWYo2DQjH+Wd90/gLL4cLRwswaftPSBtbF51JsFBc4xL3ESBnW1r+Jh+wyQtVV+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-6db67400db4so46880047b3.1
        for <linux-m68k@lists.linux-m68k.org>; Tue, 24 Sep 2024 00:47:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727164041; x=1727768841;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cNw2DhrwTm2AW4f1N12CXbt6M5JazA1VutRgcAZxBHM=;
        b=PnqqWwI0nuMH9pAFQ5k8T4c5QxiNkIfgZtq4oH1+th5AU7RJiuVpwrt8KRJIrbsT80
         U9WaWPuVwZeW9G15XKK0YBL6q6SV/a1vnGc8M4vD/W51Bkwy50lW/RjcUOX1q8kliHsH
         6YFC7ZobH4lThGGS+5o0pFdyHyh4am+zFSwnjvXxDl9X3UM1xx4vQKoFO5FbQePkJNTT
         G5UAwP0mdTaECMflsZHlhpkdfW9lCYSOTmlCfU8A8hkXH2poefmDi1vNM4XSC5t89XaW
         skMAua9iJUNvUxDzocj/ikavNGb0BUDz1NKcj66TzxVnXUDZTXMBGrUFzbvT+fSMpe+h
         rJaw==
X-Gm-Message-State: AOJu0YyGsOKK/FHHLeSyGoK2GUHHMlIEM59jY2G1FWkWV2UbhENaDcpE
	GY58aQJ4hOFzZHj0dT1o0Mgjw64Av7dASdFrmh48SqA7enLaq3Bl6h0HUvtO
X-Google-Smtp-Source: AGHT+IH1FcGabg0NoWGRlbqSNAu0NsyYRD08qfId9UWRJTyMluqnmcKlcqBXM47xpIXl+9E6tYVEsg==
X-Received: by 2002:a05:690c:6381:b0:6e2:767:8a64 with SMTP id 00721157ae682-6e2076791efmr29902897b3.37.1727164040784;
        Tue, 24 Sep 2024 00:47:20 -0700 (PDT)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com. [209.85.128.181])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e20d04411bsm1674577b3.46.2024.09.24.00.47.20
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Sep 2024 00:47:20 -0700 (PDT)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-6db67400db4so46879927b3.1
        for <linux-m68k@lists.linux-m68k.org>; Tue, 24 Sep 2024 00:47:20 -0700 (PDT)
X-Received: by 2002:a05:690c:6189:b0:6d4:b774:e503 with SMTP id
 00721157ae682-6dff2b291a6mr113715397b3.41.1727164040274; Tue, 24 Sep 2024
 00:47:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240923235617.1584056-1-linux@roeck-us.net>
In-Reply-To: <20240923235617.1584056-1-linux@roeck-us.net>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 24 Sep 2024 09:47:08 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUkMWjzT_vT3E7yLgopPWWP=BS_G8Ui22M_b8sZaCWSxQ@mail.gmail.com>
Message-ID: <CAMuHMdUkMWjzT_vT3E7yLgopPWWP=BS_G8Ui22M_b8sZaCWSxQ@mail.gmail.com>
Subject: Re: [PATCH v2] m68k: Define NR_CPUS
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, 
	David Hildenbrand <david@redhat.com>, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi G=C3=BCnter,

Thanks for your patch!

On Tue, Sep 24, 2024 at 1:56=E2=80=AFAM Guenter Roeck <linux@roeck-us.net> =
wrote:
> SPLIT_PTE_PTLOCKS depends on "NR_CPUS >=3D 4". Unfortunately, that evalua=
tes
> to true if there is no NR_CPUS configuration option. This results in
> CONFIG_SPLIT_PTE_PTLOCKS=3Dy for mac_defconfig. This in turn causes the m=
68k
> "q800" and "virt" machines to crash in qemu if debugging options are
> enabled.
>
> Making CONFIG_SPLIT_PTE_PTLOCKS dependent on the existence of NR_CPUS
> does not work since a dependency on the existence of a numeric Kconfig
> entry always evaluates to false. Example:
>
> config HAVE_NO_NR_CPUS
>        def_bool y
>        depends on !NR_CPUS
>
> After adding this to a Kconfig file, "make defconfig" includes:
> $ grep NR_CPUS .config
> CONFIG_NR_CPUS=3D64
> CONFIG_HAVE_NO_NR_CPUS=3Dy
>
> Define NR_CPUS for m68k instead to solve the problem.
>
> Fixes: 394290cba966 ("mm: turn USE_SPLIT_PTE_PTLOCKS / USE_SPLIT_PTE_PTLO=
CKS into Kconfig options")
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> Acked-by: David Hildenbrand <david@redhat.com>

I think it's a bit premature to add David's tag, as v2 is completely
different from v1.

> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
> v2: Instead of trying to make SPLIT_PTE_PTLOCKS depend on the
>     existence of NR_CPUS, define NR_CPUS for m68k.
>
> v1: https://lore.kernel.org/lkml/202409240546.SJwj9tUj-lkp@intel.com/T/#t

I replied on v1 why I think this is not the right solution.

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
