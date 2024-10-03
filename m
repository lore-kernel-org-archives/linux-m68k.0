Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61CD881AB6
	for <linux-m68k@lists.linux-m68k.org>; Thu,  3 Oct 2024 07:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727941630; cv=none; b=CVLZgKQSKMBbofWyEmtDMqUjzwzXUB801mWgHONZ4oN6z95smK6sDjAbQX0oj9lhTML6y9sJu3xEE+y7tr+T4pdECoXPgBwoWf4qmjjAq9a2fIOItZA/PNqFzR9TSQU7yQp9a+cpvLdXMDbbQ938QmGSljvk1VDv/e3T1H43E1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727941630; c=relaxed/simple;
	bh=9kXNgXMlo+O9GxWSVjx22mYlm0TpHo7i0ZBexdpOinc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q3d5o5NAijQ0iAKWnLjuW3se3cFDqTNsSF58ZhtBWKBxFB0z3hnyyo6m+aDa4nEZ/T6aoot2GG+qXfmy8qd2K8VzSOURNVI9XIZ3ZvV7CoGyMiTm5X6U2+OVZ7fLBijuPpAVDHu1bM5H8QcwWopRQTiT5J0xrUL8yrUeD13r1Wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-6db836c6bd7so5775517b3.3
        for <linux-m68k@lists.linux-m68k.org>; Thu, 03 Oct 2024 00:47:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727941626; x=1728546426;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PL8aD+MG/imNTw34D01xIQdM1gaKMtSmA7IYK6O19Hg=;
        b=WwMLtIpU+5hWlLSwRd4obFIgv0HiFYTvnqJRv0B1TjBsYsN0TILvkY1D2+fPtpV9kB
         eS7sJLmUYqvpCymjPLeCou3fT7RiFuQeKH0ldtD+6l+3Yn4PC3FwIXGmdLt3De06RH1D
         twttvQLi/p5W7ex45r/6aWav2HegYWOy/5Bf83URC8fjGYKMAXpQCM6Zvk67CW5g0E6B
         w1Vp12lq3cBMuJaiFcXVMvV+4Fe3cCjUzLwEph/Bx6NUmEQW+Vjuh/7Jusg/4vLee2V1
         SbfsxMKO8P1XVVoO5VngEdDdLR7QaYhiXP6BcSA3YRz2byMlT/pbJ/eDkEhVhmBSz+UM
         8m+A==
X-Forwarded-Encrypted: i=1; AJvYcCWEjdxXilbAnCfE3GR+KWkPyvp5u72MtEePG31MIG94eBJOarDOcmH23IsRrCpBw2LXSSexVT78f3kS@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yw368dHNdBSOyg++hTmnrcAkrL6MEm3F9dIutjr3ipeBa/TBYDR
	ynDsQFWbkJHMUFRFqkyyrTSVwBRARhT6DNWPGWmu1TdsWjpYI8DXYfVFcS60
X-Google-Smtp-Source: AGHT+IEgCA0PJBk7DVR91D/cBYSiOMwddezwP25+thZO4PHHzTTYQv4T05kUkgAgSlxjuNtYyJhY7w==
X-Received: by 2002:a05:6902:1003:b0:e20:805b:9686 with SMTP id 3f1490d57ef6-e2638394b94mr4626518276.8.1727941626343;
        Thu, 03 Oct 2024 00:47:06 -0700 (PDT)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com. [209.85.128.180])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e2885d2b9c2sm144639276.21.2024.10.03.00.47.04
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Oct 2024 00:47:04 -0700 (PDT)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-6dbb24ee34dso5380657b3.2
        for <linux-m68k@lists.linux-m68k.org>; Thu, 03 Oct 2024 00:47:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW4+N3viDaov5iz9IffWIoLyK14Gjq/SYsFgLjuqGTZMtqh5KY0F0NAZXMTw8oiQjDI+aaoeJz2Pi95@lists.linux-m68k.org
X-Received: by 2002:a05:690c:388:b0:6db:4536:85b9 with SMTP id
 00721157ae682-6e2a2e053eamr54840377b3.23.1727941624625; Thu, 03 Oct 2024
 00:47:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1727925802.git.fthain@linux-m68k.org> <f9eedf61f64906006f57ac88bdc160e55bc40c8a.1727925802.git.fthain@linux-m68k.org>
In-Reply-To: <f9eedf61f64906006f57ac88bdc160e55bc40c8a.1727925802.git.fthain@linux-m68k.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 3 Oct 2024 09:46:52 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWkcocokX7fgyt6baQdnr11F9a-apwNCAwTUf9Q2Ypauw@mail.gmail.com>
Message-ID: <CAMuHMdWkcocokX7fgyt6baQdnr11F9a-apwNCAwTUf9Q2Ypauw@mail.gmail.com>
Subject: Re: [PATCH 1/2] rtc: m48t59: Accommodate chips that lack a century bit
To: Finn Thain <fthain@linux-m68k.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Daniel Palmer <daniel@0x0f.com>, 
	Michael Pavone <pavone@retrodev.com>, linux-m68k@lists.linux-m68k.org, 
	linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Finn,

On Thu, Oct 3, 2024 at 5:27=E2=80=AFAM Finn Thain <fthain@linux-m68k.org> w=
rote:
> The m48t59 driver is needed by both SPARC and MVME systems. Linux on
> MVME uses 1970 as "year zero" rather than 1968 that's used on SPARC.
> Add support for the MVME convention. Otherwise, the RTC on non-SPARC
> systems can only read and write dates between 1900 and 1999.
>
> Tested-by: Daniel Palmer <daniel@0x0f.com>
> Signed-off-by: Finn Thain <fthain@linux-m68k.org>

Thanks for your patch!

> --- a/drivers/rtc/rtc-m48t59.c
> +++ b/drivers/rtc/rtc-m48t59.c
> @@ -57,6 +57,17 @@ m48t59_mem_readb(struct device *dev, u32 ofs)
>         return readb(m48t59->ioaddr+ofs);
>  }
>
> +/*
> + * Sun SPARC machines count years since 1968. MVME machines running Linu=
x
> + * count years since 1970.
> + */
> +
> +#ifdef CONFIG_SPARC
> +#define YEAR0 68
> +#else
 +#define YEAR0 70
> +#endif

This causes a change in behavior on other non-SPARC platforms,
if any out-of-tree platform exists that uses this driver.

So I'd rather use:

    #elif defined(CONFIG_VME)
    #define YEAR0 70
    #else
    #define YEAR0 0
    #endif

> +
>  /*
>   * NOTE: M48T59 only uses BCD mode
>   */
> @@ -82,10 +93,7 @@ static int m48t59_rtc_read_time(struct device *dev, st=
ruct rtc_time *tm)
>                 dev_dbg(dev, "Century bit is enabled\n");
>                 tm->tm_year +=3D 100;     /* one century */
>         }
> -#ifdef CONFIG_SPARC
> -       /* Sun SPARC machines count years since 1968 */
> -       tm->tm_year +=3D 68;
> -#endif
> +       tm->tm_year +=3D YEAR0;

Upon closer look, the driver uses platform data, so a better solution
would be to add the year0 offset to struct m48t59_plat_data.

Another suggestion for improvement, not related to this patch,
would be to differentiate among M48T59, M48T02, and M48T08 by using
platform_driver.id_table and platform_device_id.driver_data, instead
of m48t59_plat_data.type.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
