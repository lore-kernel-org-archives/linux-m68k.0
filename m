Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A04538D6AD
	for <linux-m68k@lists.linux-m68k.org>; Wed, 24 Jun 2026 08:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782291077; cv=none; b=BVxP2GtBpP15Gtpa4BCE7GseSQ+TpewqaFAHUsfBvRl7S+LBbDlUeKGCdbA/c8KBfmLaXKql2DwuNiPhbaZ4HKcgAXCZO+WOd3eIrESeCaBjUPGbLHnyjujeQQ26Je2QHPKTFDZVIVeleWHk2JNYVLSZdEmDiDvhjIa8RY89IoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782291077; c=relaxed/simple;
	bh=I23H8PBd+djMh4SrB4v4JdwvU9KzRMoMagFE7hs+N1w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aBfs6JE5iFSjO7A+bnDyql57OPq48pu9FO2w/OJuSBJZC9bsNHfOejvKXR7PYHZ0Sz9XO0fi1LBCLPMRybTOm6tgAzKxYsrC2Ehjbvnb9fHDYFLn8R6H6726AHQEYe9dNQ19p0qt83wSKH2MXQrANINSCkpEfZLlHI+fhHi14Fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-59d4aa96ef2so499007e0c.1
        for <linux-m68k@lists.linux-m68k.org>; Wed, 24 Jun 2026 01:51:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782291076; x=1782895876;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BqytCPnwBH27Ys1F84xwvi9+7+D3fwtua39hc9A5h9k=;
        b=sI3/2DE4tnCDjH9xM0LyKyJeSvop7GUmqHwArFr22Wp+4fNypfYPqKT53vm3K5TAuQ
         5eNjwmvBL2/AbDKML9PPZJ+2CaqUd6Blp9s4DoD5WfmJMEyYqFQsXNGY96moKYlW2Gib
         Fv3SyUo9MxKa8GQKn8SlZBmTxGRv8ei4ZrY8xsbsRn3HLNl+/BPe9isLCmgz6UKLj7qC
         gMaG3Xa2DeJ3pRZG83ClDbKXVWg1iBcBVJtN6ktS/VbGMoHFlzEiradAyWmc7uI4dmGD
         /1120k/ynEIo+YlR/MrKtNEC7lnzxmuDlmtI2zUdSysHWEoJPFqflHbdN95kWk3mHkJP
         D/TA==
X-Forwarded-Encrypted: i=1; AFNElJ/I/8tfFILp4PrOOJWYNp68x36KydUSHwyznJfvid/3vUlv8beFst3yepd0IaaV44SOuzZjFhzCO8hx@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YxJAihuPyk/Ln4Ui1U6ZBYRyLCYpwHLhF1WlehIclzkOHP0pyxe
	OMKs+jqCmnN94nqOo+E7m4h4mi5lvrqhb8N9ffmK2/bwJv+twD6Pcl/YQ+7sIa5H
X-Gm-Gg: AfdE7ck1AraQ94Aa/puPFB8sX6IalQ6DmFPCTxgrFaULFISWxzxxve+A3vR23fgG15X
	FDoIJ3gUtGAJhvT/e9zTKFjVKSb6NZRH0SlBy6X9m+dRIbaQU9dY0zP9eA+m03fWwb+Xinqvwh9
	tyZf43/8Ad0ldpoxO5xEkiDYIDJcgwSyGws1ZPDF1QgDQGTcuBsFo/Yz7ClNJ3tQqh7q3nLX5AB
	yb30QEwVy1c2w6ni4d3VDu1qDa8hyV1LeHJ/1YQK8D8d0E2T1Id4K0Ct7RZkeuE9QqswT+ttwIn
	VzlD9wMPusPVIp1Ajm448XgF46tawlsskiH39rLqoogmPis3cn2SiXrDwZOd0xHMTEGpbP2nFzb
	S5yqG0BZWTb5Ig0NGQo8zkzcvnEC/E1TfWx+sr1v/TRDpGXzzQKz5sc+2ns7YUlQmAEuZKPL6je
	O9YDUHFrLSvo0uoSE7KnqhIhBskjLD+vQrlhCdWKmgDdrmHAQ48A==
X-Received: by 2002:a05:6122:46aa:b0:5a4:b637:286f with SMTP id 71dfb90a1353d-5bc3ef637damr873592e0c.12.1782291075570;
        Wed, 24 Jun 2026 01:51:15 -0700 (PDT)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com. [209.85.222.54])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5bbfb878c91sm10275615e0c.6.2026.06.24.01.51.13
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jun 2026 01:51:14 -0700 (PDT)
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-96710629eb1so537590241.2
        for <linux-m68k@lists.linux-m68k.org>; Wed, 24 Jun 2026 01:51:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/v15Zd0Bt5yX7b84Iz6TnYn3qqgYc73nHlaXIiNtjK5Bw3/ez+dTfK5OdtNwk1fWDiY8a0Vs10kERi@lists.linux-m68k.org
X-Received: by 2002:a05:6102:1628:b0:726:cd42:d039 with SMTP id
 ada2fe7eead31-7311593bc40mr980150137.24.1782291073707; Wed, 24 Jun 2026
 01:51:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260622064915.767194-1-haoxiang_li2024@163.com>
In-Reply-To: <20260622064915.767194-1-haoxiang_li2024@163.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 24 Jun 2026 10:51:02 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUSVacMR2Lb-VwkeZMrS=wKz9y+XtF=nAOCuSLbDs-HdQ@mail.gmail.com>
X-Gm-Features: AVVi8CdAnFBD23v1TZLF1N6maP__8rBsA0F0VCuhXPs6KKGubkqUcrjbf5oJASY
Message-ID: <CAMuHMdUSVacMR2Lb-VwkeZMrS=wKz9y+XtF=nAOCuSLbDs-HdQ@mail.gmail.com>
Subject: Re: [PATCH] video: hpfb: Unregister DIO driver on init failure
To: Haoxiang Li <haoxiang_li2024@163.com>
Cc: deller@gmx.de, linux-fbdev@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	Philip Blundell <philb@gnu.org>, Kars de Jong <jongk@linux-m68k.org>, 
	linux-m68k <linux-m68k@lists.linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"

Hi Haoxiang,

CC hp300

On Tue, 23 Jun 2026 at 06:41, Haoxiang Li <haoxiang_li2024@163.com> wrote:
> hpfb_init() registers the DIO driver via dio_register_driver().
> If a later error occurs, the function returns directly without
> unregistering the DIO driver. Unregister the DIO driver before
> returning from these error paths.
>
> Signed-off-by: Haoxiang Li <haoxiang_li2024@163.com>

Thanks for your patch, which is now commit d6c3e2402523ce01 ("fbdev:
hpfb: Unregister DIO driver on init failure") in fbdev/for-next

> --- a/drivers/video/fbdev/hpfb.c
> +++ b/drivers/video/fbdev/hpfb.c
> @@ -407,10 +407,13 @@ static int __init hpfb_init(void)

As per the comment out-of-context above, this driver supports devices
on two types of buses:

        /* Topcats can be on the internal IO bus or real DIO devices.
         * The internal variant sits at 0x560000; it has primary
         * and secondary ID registers just like the DIO version.
         * So we merge the two detection routines.

>         err = copy_from_kernel_nofault(&i, (unsigned char *)INTFBVADDR + DIO_IDOFF, 1);
>
>         if (!err && (i == DIO_ID_FBUFFER) && topcat_sid_ok(sid = DIO_SECID(INTFBVADDR))) {
> -               if (!request_mem_region(INTFBPADDR, DIO_DEVSIZE, "Internal Topcat"))
> +               if (!request_mem_region(INTFBPADDR, DIO_DEVSIZE, "Internal Topcat")) {
> +                       dio_unregister_driver(&hpfb_driver);
>                         return -EBUSY;
> +               }
>                 printk(KERN_INFO "Internal Topcat found (secondary id %02x)\n", sid);
>                 if (hpfb_init_one(INTFBPADDR, INTFBVADDR)) {
> +                       dio_unregister_driver(&hpfb_driver);
>                         return -ENOMEM;
>                 }
>         }

Hence if the detection or initialization on the internal bus fails,
other devices on the DIO bus must not be force-unbound.

This is also the reason why any error returned by
copy_from_kernel_nofault() is not considered fatal.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
