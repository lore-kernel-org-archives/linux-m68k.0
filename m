Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B009EAD2
	for <linux-m68k@lists.linux-m68k.org>; Tue,  5 Nov 2024 14:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730818136; cv=none; b=RtR6BmilA63tf+4QcIypGSEECx7bQAfQhchOZg4l0WEnbNWk3NSHg6tK94V7C0W6qmV9Yf1kg5or4OaIfPOJRk3IOunhx05T1t8sn1531CQ3Yh+npiVfApN+nhI3XqdEB4Bxq9z2MMbrpyHCx5qQo404TEqRBxmfaF9/Fq6+wJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730818136; c=relaxed/simple;
	bh=f4xXPtr/rczFDWSCXCnLBmqWV3vrsWDra9h8vOvQoLk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Hx3u9G2z1HYVPnpSuBSa8DIHlsZqTiutxyPMMjg4vpO8zVJhYXu08eBt4RGjjUIfl1H83epKkwPsJoT3HwT1+rCDrBIpSsHWRoBMA8LJxJgGthutUmD2q3/RE+2n8zu10tY6AotYZy9NmlL55EmKlYmeFQEANDwtuJ4ig20ttCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-6ea7c9227bfso9322717b3.2
        for <linux-m68k@lists.linux-m68k.org>; Tue, 05 Nov 2024 06:48:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730818133; x=1731422933;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=062wwg7reCXnZ2jiwUr0t2popBMcfyNM3miSTWB1lmU=;
        b=TPGNNY/GcwoQrl3ywsh0hZzJE5T96h/d10xsTnTKul3V1+sVP/j9nyj8/DupT4LrQ2
         UXNXhxgHGUWMYVphQcQnQ3HLSXTUQMgs86FQelY/lUaOOs7DByKw1sLWJ2mrq2uxbmcs
         jHJuhYGw4DVMfZDR9+abVVHJfPcpZ5Fp5eQ0VSxfqUUOxOWcI/ek9635ei36okbfFnOj
         rLEJjnBbo64YOekzamkLhRA8uRAnc3zL3gbqjqsx8h1U9ZKpzpkWr41g9zQDDK5a31q/
         JZfYE2+Lu1+va+TS62R95HGsRBFp/IDwnD/VtYHUY5lKCJBun9ZTcbz/HxsChql/LfUJ
         BTXQ==
X-Forwarded-Encrypted: i=1; AJvYcCX7sSP6Q9S3FkHxGDXV0pyibvERDvGj2/QEOCoqoCUZYsiqLR5asoKWB+nNtqo932bFmwuSqIkVl2yN@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yyk9JFbqYs2GtMl8Q+oDQIK4i36kG+0tOMG2sA80sFUZbp4EUIv
	+EfBG0BwonhRbMrbpDZEwTTpOSH5msGmyamQ2IEHdQcnRphKAgO66XxU1E67
X-Google-Smtp-Source: AGHT+IGe3nBe+kljHvhegbPjyXYeuXAyBJcG2REMmyXUkp8xOZpDQFWDZk00DHaxmteWJwYBJ3xXZA==
X-Received: by 2002:a05:690c:f06:b0:6e9:e097:718c with SMTP id 00721157ae682-6e9e09774ecmr337216407b3.6.1730818132857;
        Tue, 05 Nov 2024 06:48:52 -0800 (PST)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com. [209.85.219.173])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea7434f73fsm16743907b3.23.2024.11.05.06.48.52
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Nov 2024 06:48:52 -0800 (PST)
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-e30d0d84d23so4512320276.3
        for <linux-m68k@lists.linux-m68k.org>; Tue, 05 Nov 2024 06:48:52 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVVSJGI1iDM5ui8O4C7TM3dUOcSwtsoPTH0AOXB7p5hRKawtC4HZ158h9ipTnWuJL10I1DcV9Wd/9xt@lists.linux-m68k.org
X-Received: by 2002:a05:690c:ed3:b0:6e2:1527:446b with SMTP id
 00721157ae682-6e9d896200bmr337335377b3.3.1730818131998; Tue, 05 Nov 2024
 06:48:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <b6112556472c657762f064ec5328f153e3ed03cd.1727926187.git.fthain@linux-m68k.org>
In-Reply-To: <b6112556472c657762f064ec5328f153e3ed03cd.1727926187.git.fthain@linux-m68k.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 5 Nov 2024 15:48:39 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXR6gN44MiE3Nc-bU6u92_RA2PWx37ndBKA7AD+gKErTQ@mail.gmail.com>
Message-ID: <CAMuHMdXR6gN44MiE3Nc-bU6u92_RA2PWx37ndBKA7AD+gKErTQ@mail.gmail.com>
Subject: Re: [PATCH] m68k: mvme147: Reinstate early console
To: Finn Thain <fthain@linux-m68k.org>, Daniel Palmer <daniel@0x0f.com>
Cc: stable@kernel.org, linux-m68k@lists.linux-m68k.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Finn, Daniel,

On Thu, Oct 3, 2024 at 5:32=E2=80=AFAM Finn Thain <fthain@linux-m68k.org> w=
rote:
> From: Daniel Palmer <daniel@0x0f.com>
>
> Commit a38eaa07a0ce ("m68k/mvme147: config.c - Remove unused functions"),
> removed the console functionality for the mvme147 instead of wiring it
> up to an early console. Put the console write function back and wire it u=
p
> like mvme16x does so it's possible to see Linux boot on this fine hardwar=
e
> once more.

Thanks for your patch!

> Cc: Daniel Palmer <daniel@0x0f.com>
> Cc: stable@kernel.org
> Fixes: a38eaa07a0ce ("m68k/mvme147: config.c - Remove unused functions")
> Signed-off-by: Daniel Palmer <daniel@0x0f.com>
> Reviewed-by: Finn Thain <fthain@linux-m68k.org>

As this patch differs from Daniel's original, I guess you want

    Co-deloped-by: Daniel Palmer <daniel@0x0f.com>
    Signed-off-by: Daniel Palmer <daniel@0x0f.com>
    Co-deloped-by: Finn Thain <fthain@linux-m68k.org>
    Signed-off-by: Finn Thain <fthain@linux-m68k.org>

instead?

> --- a/arch/m68k/mvme147/config.c
> +++ b/arch/m68k/mvme147/config.c
> @@ -33,6 +33,7 @@
>  #include <asm/mvme147hw.h>
>  #include <asm/config.h>
>
> +#include "mvme147.h"
>
>  static void mvme147_get_model(char *model);
>  extern void mvme147_sched_init(void);
> @@ -177,3 +178,29 @@ static u64 mvme147_read_clk(struct clocksource *cs)
>
>         return ticks;
>  }
> +
> +#define SCC_DELAY do { __asm__ __volatile__ ("nop; nop;"); } while (0)

Please keep on using a static (inline) function instead of a macro.

> +
> +static void scc_write(char ch)
> +{
> +       do {
> +               SCC_DELAY;
> +       } while (!(in_8(M147_SCC_A_ADDR) & BIT(2)));
> +       SCC_DELAY;
> +       out_8(M147_SCC_A_ADDR, 8);
> +       SCC_DELAY;
> +       out_8(M147_SCC_A_ADDR, ch);
> +}

The rest LGTM, so
Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>

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
