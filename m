Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65B361E98E0
	for <linux-m68k@lists.linux-m68k.org>; Wed, 14 May 2025 07:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747206634; cv=none; b=Jo7NBlmKjFzzWA2AkwivlJAEN4ffyeOgEWuAPNJ/RV5P2QPhZUnZDHm9QNd1hE7wgOuWzZOlwvSdbnbj2WqI1hVIm6b5Gkf2r+xqmvT9FO8+XrRDAD/4kyGD5rcswpLRYv6RIB2MJ0IANAXU9ozhi0HwyghggLLU30gZxvbf/B8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747206634; c=relaxed/simple;
	bh=/B+EwXmyrRAKb+rC7ELavWBH8AzZRPfvLMfeSNf7qgQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Hb0s4EVPB3lT1uO901/VKmqy3H2+lDNltCb4OWV4aUqcI8ppm+4zRAeYsUbVLTYGJy/xBM7de90++2P4kJhdrcLvYfbtVaXN/vKRZAGPQfleHUfW9hzBXF4X7/LEw/pMw5UuWX2fPssyxrJKMFqlkK+LbOb+9ovFytDvDyHk54k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-51eb1a714bfso5445380e0c.3
        for <linux-m68k@lists.linux-m68k.org>; Wed, 14 May 2025 00:10:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747206631; x=1747811431;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qEdCTK8Ua/3Kxw/UlKLJuxTv51uEZAV3qqkGRptSF+I=;
        b=M6W3YnSKsUD8XpNrTXBY2NIhsSvvoLG2FOo6VObui+jtHhMuqM54d0EgNwJjeqk2Oo
         4P0vWfL2F1dRm4l93yIhlGmqelXVuCB09ifUcWutDFPZ+MvYjh9+yOTByc0O/EdSQKBj
         IBZQBiQl4Q2m6vuByRztBH3VHY9RMM0rSn4cgmBS4mw2HGTMgSZfIK4iJQgdNeBEEowM
         6AO9f1sPiVkEm0tWkIhGcwmFXZICvTSxb+2UdgbAxBJ2OfBO5iZctIah8urLmrYryybt
         s/8VgV9w4gVSlnrrQMzm7aPIznlds2NLCFJJBK/gjCbI2cw7tcwGnyN2tEhd8RGyeI0x
         CE9A==
X-Gm-Message-State: AOJu0YxvRBR7qReqJheMc/sbq98WNvBfDGnaO0zU6f3oojCfp/iOoky+
	ERXE1ccWDgWxssxeda3c4DDv8rLVg0XPg2awpUw05XgscXir+go+XWRZwwkD
X-Gm-Gg: ASbGncsVp642jWaSAmk/vJ6ilQJXd+oH9qHVqmBUMp7Kb1Ek3LO4XdhMUWlGCyKoTOW
	aa6+VgxeMf1rCM3N6HLY6px4238WDHk0PWnYiLV11YGFAKHjRSrs4V01WGV5oL35nwcMt94KE+1
	NXupmOHajBIuVG/BHIk2LLE3WlXZrvBBgY7LKtYmajcR7wqGQI/v6MjZtNsShBGwu4aCKOF89Q8
	sKc39TW3XaharuLyEOB6Ezej50hjiLC0XvcYDUZAVD2n0Y9PfxFrvCyp8wEhqlSUJdIbZ1UuKCA
	YKKm9G3Mwn5PRpAfmSoRbmmaF2IZ7gupFelMHWrO2l/qgawdOMGZNV1NSRuAKcHeK/UNjM81YpJ
	C6KGmQT4n4YSEEEmQ+g==
X-Google-Smtp-Source: AGHT+IHvhfCMxoL+mc7gghFK97WtEN5lDPyX3ZXb8nNW3b9VfsWnZDSQ6WfkHT9BSE4IlqZqUfzn0A==
X-Received: by 2002:a05:6122:2506:b0:520:9688:d1bb with SMTP id 71dfb90a1353d-52d9c5674c6mr1934934e0c.2.1747206630691;
        Wed, 14 May 2025 00:10:30 -0700 (PDT)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com. [209.85.221.171])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-52c5372f0e0sm8956335e0c.19.2025.05.14.00.10.29
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 May 2025 00:10:30 -0700 (PDT)
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-52934f4fb23so5154824e0c.1
        for <linux-m68k@lists.linux-m68k.org>; Wed, 14 May 2025 00:10:29 -0700 (PDT)
X-Received: by 2002:a05:6122:8c2a:b0:52c:54fc:745 with SMTP id
 71dfb90a1353d-52d9c5d8acamr1925737e0c.5.1747206629577; Wed, 14 May 2025
 00:10:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250514052327.96537-1-siddarthsgml@gmail.com>
In-Reply-To: <20250514052327.96537-1-siddarthsgml@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 14 May 2025 09:10:17 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXxDPDQVwx_9Z6ngvs4sYro3cobE=YP0y-b0zs0ody2vg@mail.gmail.com>
X-Gm-Features: AX0GCFtFiSkMy3thsoXl2i-HHS-GqeqxowX3AK-tXVsLRnHiROCSZrI6s0ya3Vc
Message-ID: <CAMuHMdXxDPDQVwx_9Z6ngvs4sYro3cobE=YP0y-b0zs0ody2vg@mail.gmail.com>
Subject: Re: [PATCH] m68k: apollo: replace strcpy() with strscpy()
To: Siddarth Gundu <siddarthsgml@gmail.com>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Siddarth,

Thanks for your patch!

On Wed, 14 May 2025 at 07:23, Siddarth Gundu <siddarthsgml@gmail.com> wrote=
:
> strcpy() is deprecated; use strscpy() instead.
>
> strscpy was chosen because the code expects a NUL-terminated string
> without zero-padding.

... which are not sufficient reasons: there is no size information
about the destination buffer.

> Link: https://github.com/KSPP/linux/issues/88
> Signed-off-by: Siddarth Gundu <siddarthsgml@gmail.com>

> --- a/arch/m68k/apollo/config.c
> +++ b/arch/m68k/apollo/config.c
> @@ -218,7 +219,7 @@ static void dn_dummy_reset(void)
>
>  static void dn_get_model(char *model)
>  {
> -    strcpy(model, "Apollo ");
> +    strscpy(model, "Apollo ");

include/linux/compiler.h:197:62: error: static assertion failed: "must be a=
rray"
[...]
arch/m68k/apollo/config.c:222:5: note: in expansion of macro =E2=80=98strsc=
py=E2=80=99
  222 |     strscpy(model, "Apollo ");
      |     ^~~~~~~

Please try to (at least) test-compile your patches before submitting.

>      if (apollo_model >=3D APOLLO_DN3000 && apollo_model <=3D APOLLO_DN45=
00)
>          strcat(model, apollo_models[apollo_model - APOLLO_DN3000]);

FWIW, if the strscpy() would have prevented a buffer overflow, the
strcat() would still cause one.  But none of these can happen for real.
>  }

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
