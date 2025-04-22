Received: from mail-vk1-f193.google.com (mail-vk1-f193.google.com [209.85.221.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 339D618C930
	for <linux-m68k@lists.linux-m68k.org>; Tue, 22 Apr 2025 18:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745344875; cv=none; b=AT87LZ0cmtcPNn+PWsm5O6eFhGi1XlCXSvQ50TUjztr7Y3bSoyKoWTXiONZm/K2z4n/CPoaaqBSSjL6SuNtswPTMbAewBylHZYyDA69Zwl+EEoNh8bfYgmBGN19fsgDmj1Wt6FPMEcNb1u7ctRtkl7/AWlyuk4LV64yrRSv+bWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745344875; c=relaxed/simple;
	bh=tEzlwDLHawhk+m3M6na2HLVeCP9xpG0csglHofsTBHU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aTjeR3oHewrT/ptb+kofBOOQhIx741ObSrkznf3ss6od+nY2sgSZ8tV0ut0WB6Rd88pvSZ38YS1B9xLBys0FXqT8Iox3VmsecRd/Vaqub9qqVzpmxxnqRsnsbDAHs95chVshWWycHydg28AFI2mSxUVD+kvPATz4IKASMrx7IuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HopHe3Hb; arc=none smtp.client-ip=209.85.221.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HopHe3Hb"
Received: by mail-vk1-f193.google.com with SMTP id 71dfb90a1353d-527b70bd90dso2126990e0c.3
        for <linux-m68k@lists.linux-m68k.org>; Tue, 22 Apr 2025 11:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745344873; x=1745949673; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YhMRPxRHmIvpGOSvfB91vw3N4+/QYE7lPBXCJ/aGQA4=;
        b=HopHe3Hbw20TrwrT3FehXHHbRX3d+Oj7PZNrYBx+RUSiw1p0eTrZUvDtD6rgQJFLn0
         cX0hrAw/9sMjzCkKskwtJHAxoBTEwzXjZl/g3+GDU+od3CueVfdshWLDzVdH8idmNi41
         AHcAIygDTRe9C7NnWJQM7pXXF/cfbGBNK566upAoIY4UhinLH6+P/een2YoEhzJV56fq
         H6pxEtuSwqLfKGtv+XU/jxI4sT/wk4LBI/gN3Z60VnJYcmzabNeruCdh3GYSoHsS1lrd
         8litlLnCWCmPlxIf2UIV0fYR8PAMwMqMUqU+ljfx5+TG9GVnC5qh30h5rCDclpGObP4S
         mm1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745344873; x=1745949673;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YhMRPxRHmIvpGOSvfB91vw3N4+/QYE7lPBXCJ/aGQA4=;
        b=qPBALXEOKjyBacTn17JSnrrsyGG36aUX+nkmgdqyjklKyCJGe3hdQzHJxxzDJANHNN
         qnkhVSp0/50jqxgnW370jNH/3oHnfi1mrUryePOJex+uec52cJ6ULur2hL1JOYOuGxWj
         oDZwetBiSA7EfQ6xR9rUb5s9gjkOEvMj4/MdL84nzVs4RvrksRCdWVXoDDhkfThHdKbd
         gqyYdvVdS0wIKBV+uv28ll/IbDyzc71et9Xo0bFOyFYAv9aVJulDXpctD1ygWESZB99k
         KsndDe1jNzu2j2q0vbRrFVbjYzBFQ/br7j9/kSWAuW/EX82zo35ldUtoRnsZjYSI+U6K
         GJew==
X-Gm-Message-State: AOJu0YxNsVkog08mFFBH7/PhdwG6ZhKFQNbDFInVJl7c/C0gEhF1ebnc
	lZ4t1iFeUXv5XurykeERLOgTXrnifo2nZkB9FUfnKLysF+u6FIiqXgy33U09aV4FzZ4Io0zTlDg
	fylD5VXTanPP3OIkPnLmNOesAHKo=
X-Gm-Gg: ASbGncvIntcNB29zUNz56mB7i2uOINNjlrqp5b8wWhLMjQCOJAXNHmyYeCfE8FPr8P7
	b4Ig8Xu3U1dRpFi2cLhEhZPBKmFxqwvszJFm4Rd3sgBvu2oWw9QcD/fDa2cCtl8oXiiJECI125h
	lcpAo7hF6OEEn3omk2+GZSZw==
X-Google-Smtp-Source: AGHT+IFkdxMi5e5qmvvYcCfqmngYMAHWYS33NrUVukba7tzTgod5XNe4uisvvB/k2rlC2pt9A9cKLlfSxGjgOmyXHc4=
X-Received: by 2002:a05:6122:8d2:b0:526:1dde:c5 with SMTP id
 71dfb90a1353d-52925242315mr11366662e0c.0.1745344868174; Tue, 22 Apr 2025
 11:01:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250403181200.34418-1-m.mahdianbaraki@gmail.com>
In-Reply-To: <20250403181200.34418-1-m.mahdianbaraki@gmail.com>
From: mohammad mahdi anbaraki <m.mahdianbaraki@gmail.com>
Date: Tue, 22 Apr 2025 21:30:56 +0330
X-Gm-Features: ATxdqUFDZgbVSaKYq_TE4emkWXPXRc-UVFCIrTdnwAEXB3_QhwZ8Sg3sgqUGSpg
Message-ID: <CAEpZnwVW2x7oor+=9uRiJXyC_fHgZPet5eA0w4O-shc6Aimt2A@mail.gmail.com>
Subject: Re: [PATCH v2] m68k/kernel: replace strncpy() with strscpy()
To: geert@linux-m68k.org
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi
.Just a gentle follow-up on this patch
/s/m64k/m68k

=E2=80=AB=E2=80=AAMohammad Mahdi Anbaraki=E2=80=AC=E2=80=8F <=E2=80=AAm.mah=
dianbaraki@gmail.com=E2=80=AC=E2=80=8F> =D8=AF=D8=B1 =D8=AA=D8=A7=D8=B1=DB=
=8C=D8=AE
=D9=BE=D9=86=D8=AC=D8=B4=D9=86=D8=A8=D9=87 =DB=B3 =D8=A2=D9=88=D8=B1=DB=8C=
=D9=84 =DB=B2=DB=B0=DB=B2=DB=B5 =D8=B3=D8=A7=D8=B9=D8=AA =DB=B2=DB=B1:=DB=
=B4=DB=B2 =D9=86=D9=88=D8=B4=D8=AA:=E2=80=AC
>
> Swapped out strncpy() for strscpy() in parse_uboot_commandline() while
> copying to commandp. strscpy() makes sure the string is properly null-
> terminated and gives a more useful return value so it's just a safer
> choice overall.
>
> Link: https://github.com/KSPP/linux/issues/90
> Signed-off-by: Mohammad Mahdi Anbaraki <m.mahdianbaraki@gmail.com>
> ---
> Changes in v2:
> - s/m64/m68
>
>  arch/m68k/kernel/uboot.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/m68k/kernel/uboot.c b/arch/m68k/kernel/uboot.c
> index 5e52ea150..fa7c279ea 100644
> --- a/arch/m68k/kernel/uboot.c
> +++ b/arch/m68k/kernel/uboot.c
> @@ -73,7 +73,7 @@ static void __init parse_uboot_commandline(char *comman=
dp, int size)
>         uboot_cmd_end =3D sp[5];
>
>         if (uboot_cmd_start && uboot_cmd_end)
> -               strncpy(commandp, (const char *)uboot_cmd_start, size);
> +               strscpy(commandp, (const char *)uboot_cmd_start, size);
>
>  #if defined(CONFIG_BLK_DEV_INITRD)
>         uboot_initrd_start =3D sp[2];
> --
> 2.43.0
>
