Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D1CF7441A
	for <linux-m68k@lists.linux-m68k.org>; Wed, 19 Jun 2024 07:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718780980; cv=none; b=WcyNtk7Qbkt4llHpn+eoF7emginIX7WhdAZarld8P0MpNvpDu62iP1SgUB/hBXc9xiNAzBUUfQACL/lzmtGO5/I0LNpuuzvPJGvRrEghu3mVcHufj5lpBnE6u+q5USIkGwoeka+YW6Sjn3GmjRB5YK1ppH6X5upTy3ymOCqFPHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718780980; c=relaxed/simple;
	bh=rFJdqYszRYReFAsTQw9Y1DHKIAJKdXnVrova/6d3nWY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jdEib4jmMurxFgHxhtIlUL1+f60BrFtx5rDcWZATfs0RCDRkQgmKR/lcpRQojVbN/GQC9mV3C9TXVaexdXKWHLM7dGPFtNuyUbSma7uyJ4rafWhBSoZ5frimrZGCX14FY8shU9zM18PUOLgX+wzEU/Tz01Q9EDf3qOvjeqbbglg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-6383f01d1deso27078937b3.0
        for <linux-m68k@lists.linux-m68k.org>; Wed, 19 Jun 2024 00:09:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718780977; x=1719385777;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1rOhArqBAHo+GTM+mMAn9uukwJ20fEVD7yV9+CYBKLY=;
        b=c6YhkrAPrYjf2nzrqMNXBdZ3Oi0iv/6PDC3vNRwVidWLYeEK7g5TaalxU4XaetHJoZ
         GAlJCmvKHaG/5XUXHHSccg38H/ktrRYT7ekRz+m0mDJOapCiuUYpILBu/0iC/z6sLHS3
         Ot53We3DqntKb+wLtzTz7r0jjGfjM9HRhDLDBSWjwIOPWGH22FVlIlyd1fcorL1mqmVM
         QhIk9Hx9XkVFW/Xq32sYNQ5R0kCDf6feO7vo2i9MzZqXACYVNtaJv3n0sGAzSfRKjknM
         A9H27AeZhRQPGA9GY5c0+/c6Yfu1hcfcN9eIN3leCpuzqUShb6dJLYk/EOmCOJvFdh5e
         CGkg==
X-Gm-Message-State: AOJu0YxBtdZcxkrNA6scmHIjjSueQyOy6Ieu5hbfj+8CrJmTSX+V+t+R
	NMqEHkV6I6FSrhc7610s4DT8HJOG1i7kum2GBvyMEiCBJm4wWBhTq4tiQZZd
X-Google-Smtp-Source: AGHT+IE4lVS6MkQISBkMlb2GOhlimDF60l+Ibjxxbd+YVIKio26kclnYo/DOHR4n2vSKX3C+TS2lFQ==
X-Received: by 2002:a81:83d2:0:b0:62c:f01a:17a3 with SMTP id 00721157ae682-63a8d923faemr22709927b3.15.1718780976618;
        Wed, 19 Jun 2024 00:09:36 -0700 (PDT)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com. [209.85.128.169])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-631183d79cbsm19952407b3.11.2024.06.19.00.09.36
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Jun 2024 00:09:36 -0700 (PDT)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-6383f01d1deso27078777b3.0
        for <linux-m68k@lists.linux-m68k.org>; Wed, 19 Jun 2024 00:09:36 -0700 (PDT)
X-Received: by 2002:a81:8845:0:b0:61b:3348:34c0 with SMTP id
 00721157ae682-63a8faf12fcmr17482047b3.50.1718780976284; Wed, 19 Jun 2024
 00:09:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240618073205.65303-1-jiapeng.chong@linux.alibaba.com>
In-Reply-To: <20240618073205.65303-1-jiapeng.chong@linux.alibaba.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 19 Jun 2024 09:09:24 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX4+hhav7U3ORdUuNj3+Hgwh754dU41SWOTeALXd_vEjQ@mail.gmail.com>
Message-ID: <CAMuHMdX4+hhav7U3ORdUuNj3+Hgwh754dU41SWOTeALXd_vEjQ@mail.gmail.com>
Subject: Re: [PATCH] zorro: Use str_plural() in amiga_zorro_probe()
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, 
	Abaci Robot <abaci@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jiapeng,

On Tue, Jun 18, 2024 at 9:32=E2=80=AFAM Jiapeng Chong
<jiapeng.chong@linux.alibaba.com> wrote:
> Use existing str_plural() function rather than duplicating its
> implementation.
>
> ./drivers/zorro/zorro.c:155:22-39: opportunity for str_plural(zorro_num_a=
utocon).
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=3D9350
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>

Thanks for your patch!

> --- a/drivers/zorro/zorro.c
> +++ b/drivers/zorro/zorro.c
> @@ -152,7 +152,7 @@ static int __init amiga_zorro_probe(struct platform_d=
evice *pdev)
>         platform_set_drvdata(pdev, bus);
>
>         pr_info("Zorro: Probing AutoConfig expansion devices: %u device%s=
\n",
> -                zorro_num_autocon, zorro_num_autocon =3D=3D 1 ? "" : "s"=
);
> +                zorro_num_autocon, str_plural(zorro_num_autocon));

Missing #include <linux/string_choices.h>

I will fix that up while applying.

Please try to at least compile-test your patches.
Thanks!

>
>         /* First identify all devices ... */
>         for (i =3D 0; i < zorro_num_autocon; i++) {

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
