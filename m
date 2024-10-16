Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B77DB18C03E
	for <linux-m68k@lists.linux-m68k.org>; Wed, 16 Oct 2024 06:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729061830; cv=none; b=Yl90QDmvOFRB0w500cH2omousroqX9FNSV3X/iBJfrnDMBD18y7qMgk4lOQaSTI7q2zu7nFIICahtFjP9PvE+9uNw/TvheG+4vPSJqK3QFkELJt3rVt3Ds7VmNn4xmYRK5b0ylRxRE+QoHxNce0yC81dNne8Fsiz4wJWhbS09WQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729061830; c=relaxed/simple;
	bh=/Pw7Lk19rpr5qs/y7YRHB+eljjtpGRyvbk/W8F7QdUU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U1qGIsoyj4U2M5ae1X8cb45rJERV4MSZajZUfmiJAp4DyxJ8OOiBDtlFph8sTkH22GU6B1KZFm6G2Jb64gW2uQkk6q7qvE0s9wKFUa8JHV2YFCFoDOXsw/fOWsnjdECfHWn10/7H/AfIng3DQ5gVuqZGr778Bn0tPkCCJpaXbN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-e29267b4dc4so4204728276.0
        for <linux-m68k@lists.linux-m68k.org>; Tue, 15 Oct 2024 23:57:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729061827; x=1729666627;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4ULg06Dva0WoBj0m6VE1kEFmhnHFLA053b6bZA0CjUQ=;
        b=LQI7kxgDcajiwdqPVMI13LJmRYJhL0R/swHBqFZYGSRv8oP7EYoqRt/RzlapvLz/Fr
         CXKo0J8tVPcXJ1pLM4euvvw8BKTRUVpjYcbjobkwOb2GKdDXrKhSMoYE60R0UvRzop0u
         W/hw15a3ztltAtIvjYC/4H1k/liHbmpz/PnBP024+w46zu9rDvyGn9zaWydAGGSVWVJl
         Go75s17sav+8FoItDqeWc9/6BmQRFYf2+S0+GXkg/NkAJYL8VNZcU+Pv17qVacv4n9YG
         o1mZfafFDAeuE4d+tA+y2Vl0iGBxiXfTMxNe253Syy9yLXb2U60D/WxXXjzWekq8QXVX
         Dp0w==
X-Forwarded-Encrypted: i=1; AJvYcCUHnmf5a59jySlIcVv015kky6l/vcz+c7ujhoiUCMv/0iO+m0nonLfQf0IsQo+tOKyR6eK9gHgISM1A@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YwIzl5plMmToW40JQOd7znXdmLEaLxLs/dNnVWuoSNCwOHQPA6/
	17rpsapKABhCgTCFxwf1CoWlrczEXI4CvC2bPN3T+qJmeq3RESPN+GDSeBfP
X-Google-Smtp-Source: AGHT+IGwjkPKK7FDAJVFvl0NoVYfRBxdxPjoXh+DfycGCgYij+CkzT5QEoxQ8CK7OoZhKDL/gwbVIg==
X-Received: by 2002:a05:6902:2e0d:b0:e28:f2b3:1a3d with SMTP id 3f1490d57ef6-e2931b15419mr10543472276.6.1729061826451;
        Tue, 15 Oct 2024 23:57:06 -0700 (PDT)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com. [209.85.128.180])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e296cc23c63sm532877276.39.2024.10.15.23.57.05
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Oct 2024 23:57:05 -0700 (PDT)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-6e2e4d16c2fso51770487b3.3
        for <linux-m68k@lists.linux-m68k.org>; Tue, 15 Oct 2024 23:57:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVHIqqMDmgMaBXSBDq+572HgMvNzvGiO+uJzeY+nloWBH48YmlfxAehTXMkNHP8EY17CTZlGF5Z4Lr9@lists.linux-m68k.org
X-Received: by 2002:a05:690c:6305:b0:6e3:3a22:7205 with SMTP id
 00721157ae682-6e3644c0082mr125754047b3.44.1729061825389; Tue, 15 Oct 2024
 23:57:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241016-fix-m5441x-gpio-v1-1-0a29befd4b8d@yoseli.org>
In-Reply-To: <20241016-fix-m5441x-gpio-v1-1-0a29befd4b8d@yoseli.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 16 Oct 2024 08:56:52 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVktMFfPQZqvB6cdMOmxwBuG7CW9rqm1kU+p9MnrF1SWA@mail.gmail.com>
Message-ID: <CAMuHMdVktMFfPQZqvB6cdMOmxwBuG7CW9rqm1kU+p9MnrF1SWA@mail.gmail.com>
Subject: Re: [PATCH] m68k: mcfgpio: Fix incorrect register offset for CONFIG_M5441x
To: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
Cc: Greg Ungerer <gerg@uclinux.org>, linux-m68k@lists.linux-m68k.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jean-Michel,

Thanks for your patch!

On Wed, Oct 16, 2024 at 8:45=E2=80=AFAM Jean-Michel Hautbois
<jeanmichel.hautbois@yoseli.org> wrote:
> Fix a typo in the CONFIG_M5441x preprocessor condition, where the GPIO
> register offset was incorrectly set to 8 instead of 0. This prevented
> proper GPIO configuration for m5441x targets.
>
> Fixes: 83c6bdb827c9 ("m68knommu: Implement gpio support for m54xx.")

The typo was introduced in a different commit, so the correct tag would be
Fixes: bea8bcb12da09bd3 ("m68knommu: Add support for the Coldfire m5441x.")

> Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>

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
