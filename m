Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D318212C479
	for <linux-m68k@lists.linux-m68k.org>; Tue,  2 Jul 2024 07:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719904901; cv=none; b=OrGL8IeTkVVdaxBdvVbNIoL0DSVJVLaiKH47MlQesSNMxx1PIf77rhi/aTlslW83hDvE0YDLfedZHAK0ORFzz7JAeEn+oL/MZvmOkytZNKJefT201eDCBqK0DAeuRFyaksLA7Qr4/Y+ZrBtMyUDQ5YBd/25YtWlv7hQ2QQBv5S8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719904901; c=relaxed/simple;
	bh=LRMPTlL1WL15rUYBCdg61D13+t66ahvPx2FDr+bZay0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gFNxaw2UVLDxPAVw1T4+qhg/Nz9X1zw7W9DDtVXNpZkp+xNd15KyU37AswDADMruLJy0j1t+hUpbwx4u6imYn8A1D1xKYirVjeoh9iguSNUEF/YUyHaDm6OgJIbZNCpdI4OFA8iY07JbWK+zjoCEyIER0MD22zN6CPC98ZJMsNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-64b417e1511so34521817b3.3
        for <linux-m68k@lists.linux-m68k.org>; Tue, 02 Jul 2024 00:21:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719904898; x=1720509698;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PqjWNFuPVmOWg0A90n3DdVNAL3PKchg+JYQRnRVN8eI=;
        b=NubZqXHOJcLax87PDPi+uCHXdtukCOXL2b9JnJK1hW6EC2d0J/45DklKcryp5Fro4l
         JQe3vPgsXz1JPcES41Du5qPSQfNaQU/RkYPT3XFT9c5FfqRoNAaTrLP90C0AAdH7E9Oe
         pO1aaB2YcNWrJ2jLCR4RttZfDIlSV2+uC+kuxp79neGk0rKwSywZPmBKcsdGolau/RMD
         KLets1l1WHXLy0G4Xw4jWvlK8MoFr5h/UBSHXAB2u+0jo9JGoP4L5s1R4vJWbEPdNOWy
         DYOj9CAHZbPQgfBpFPI02lrLwHKl33TAo1yxLaCgI3AVtdVv3yrFk9DQ87Oej1k5YmwO
         96cg==
X-Forwarded-Encrypted: i=1; AJvYcCUZv6dK6a6C/Dr1hqF6LcYRpA2eZdjNl38xlX8mox9Jc+Bd5n2jTwHg80taEpA4dtzyHhsKNCAv+Uc/FQIqGRJcnhVXso5U05TlvgWw/FFx
X-Gm-Message-State: AOJu0Yyw9l/BUUYLRgKL0MxFg3wuuAe5JCxccsTezgllNP3L+iJWGLM1
	Y6mj83crbAr1b5lFKMdc+MP9ozbtXYwKuePIhCBH7NuuhI3hNOf8RYE85B58
X-Google-Smtp-Source: AGHT+IFbARRO5Z5vvUZNtK54Y9kd4qgvoLflakAkgP445lq3JdF+L6HiKf506POyO8WUXoV77xQ8zA==
X-Received: by 2002:a0d:ea43:0:b0:62f:4149:7604 with SMTP id 00721157ae682-64c7123bfdfmr76005647b3.4.1719904898349;
        Tue, 02 Jul 2024 00:21:38 -0700 (PDT)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com. [209.85.128.182])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-64b3a625488sm14623197b3.43.2024.07.02.00.21.38
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jul 2024 00:21:38 -0700 (PDT)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-64b417e1511so34521677b3.3
        for <linux-m68k@lists.linux-m68k.org>; Tue, 02 Jul 2024 00:21:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUDs0+b9kNJSmzrftD/NyIHbsg23zPR8Cisov9HE7j9mHWlQekaAFgQ5cu8asrGWCl8GxmJ7SiAJEMoWVUI65iY/KoMGtCC5euEoL6/z5Sg
X-Received: by 2002:a05:690c:711:b0:64a:564c:cfa4 with SMTP id
 00721157ae682-64c71804010mr80155787b3.20.1719904897835; Tue, 02 Jul 2024
 00:21:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240702034116.140234-2-thorsten.blum@toblux.com>
In-Reply-To: <20240702034116.140234-2-thorsten.blum@toblux.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 2 Jul 2024 09:21:26 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVTqsqrDTKGTGoLd_3FPk9S6wX-qXYzipJ+6yW0q0L11w@mail.gmail.com>
Message-ID: <CAMuHMdVTqsqrDTKGTGoLd_3FPk9S6wX-qXYzipJ+6yW0q0L11w@mail.gmail.com>
Subject: Re: [PATCH] m68k: cmpxchg: Fix return value for default case in __arch_xchg()
To: Thorsten Blum <thorsten.blum@toblux.com>
Cc: gerg@uclinux.org, dhowells@redhat.com, linux-m68k@lists.linux-m68k.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Thorsten,

On Tue, Jul 2, 2024 at 5:42=E2=80=AFAM Thorsten Blum <thorsten.blum@toblux.=
com> wrote:
> The return value of __invalid_xchg_size() is assigned to tmp instead of
> the return variable x. Assign it to x instead.

Thanks for your patch!

> Fixes: 803f69144f0d ("Disintegrate asm/system.h for M68K")

That is not the right commit.  The issue was introduced before:
Fixes: 2501cf768e4009a0 ("m68k: Fix xchg/cmpxchg to fail to link if
given an inappropriate pointer")

> Signed-off-by: Thorsten Blum <thorsten.blum@toblux.com>

> --- a/arch/m68k/include/asm/cmpxchg.h
> +++ b/arch/m68k/include/asm/cmpxchg.h
> @@ -32,7 +32,7 @@ static inline unsigned long __arch_xchg(unsigned long x=
, volatile void * ptr, in
>                 x =3D tmp;
>                 break;
>         default:
> -               tmp =3D __invalid_xchg_size(x, ptr, size);
> +               x =3D __invalid_xchg_size(x, ptr, size);
>                 break;
>         }

Although this was not a real bug (__invalid_xchg_size() does not exist,
but is referenced to cause a deliberate link error), it is good to
clean this up.

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
i.e. will queue in the m68k tree for v6.11.

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
