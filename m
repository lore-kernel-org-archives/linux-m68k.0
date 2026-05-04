Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C020037C10F
	for <linux-m68k@lists.linux-m68k.org>; Mon,  4 May 2026 09:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777887191; cv=none; b=h7fOOYphWtubuTX60sHFMyW0Ita3EV96yfKGW1wHNRtx986NqiFOJXDGiw4BlEmoIpHusYo/psUp6gmvP9Sw9Hhl7XQc9Ir6hiDRF08M1OZTS5xiebJSsbzjrz0GGHGyuvzSw9AZBCn+rSEOMXHv86ML5ShSIyJ3OrTF88uGjWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777887191; c=relaxed/simple;
	bh=jllwNsND66xBzjAhJOme0uCuQjUfDMH/Jo+MERCSl5Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=owWmIDVbqWL+PXo/hmmStBahM54Jkj8XxCpTpsQyTrjOCE9B0UrcTCDSMKAp731+T8KQ8EvZrlS6Zdi98/rd9ZCwuOTJlrwJNo68ORb60uvhi2bIIH/Aalyb185U5RPdPrjTN35HqjDQLt6wPT169Aei4ULXzGn7fXvGBgL2GlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-56f6afbd205so1968662e0c.0
        for <linux-m68k@lists.linux-m68k.org>; Mon, 04 May 2026 02:33:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777887188; x=1778491988;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YGOdspsWOmyAowYfcsZN7rMwaAkc19rS/RWVvvTcM+I=;
        b=Iqw18S+jHgQMygbOa2RBeieH1nvP7PMdk2Su3Vd4tFJZly8kI3fz8poIwbsDImH/2h
         dkzNLtBmmmNlSg6sX47AqRCgq2f3WWfhRm2GEdWtt1B+vkx02w7544u5cJJN9Zk7uMya
         Ee9yPSlrsfl0a/B2M8kGjGza9pzMTcaZiSOlVeTzP5K34q3QsouKSmmoLSMNmv/1rqij
         ODS174AXsIPqgkJnCWGmWqEcTnDrz0T36sVQsUjvskqMBuNb5QP7wTaE/I/uSCofbPhn
         RMPCyZCjp3cQqs3H0fz7mtOIjjjeuw9TCw5y/AILw5jzCOmV1prYgH17hIWILpxgL/Si
         rVYg==
X-Forwarded-Encrypted: i=1; AFNElJ+5SIliH23P9FkVgNCKwREina4FQWL6B2b+whHSpzoRAxLsJmzmf54nD9R5hARkrNf7VCJNFNvkiIoF@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YwwPWZejQpZaQK9C28d1Au07S55gOJ773d9Xe17Se+r4vdtlu/C
	8a1tbo1rGvRTT1HJi6Fz5HVmLmtHMk3RHPigONsMaBNPCIYmpRQyWAFzch8okpUh
X-Gm-Gg: AeBDievzjMPqyg80TV9z8+WWzFcSvSpGjloUoqqu92gMctnLuNijV+nxiYbT+7RHd/L
	xy88lDE3y5sQeENM1NWqlxd2Qcx3Ii+J5oxtqn+A3/hecbmRqNnaLkDvjQbdQDzgZmGcFS74Dmn
	gzLbfMADRP9tdJ5T2WHqlzGTEXjlVId5wB+/NU23zZXPEz1sPknRpucQTePgpiom4wQ4ioi+XxX
	wuJgzwfRozQ4l0KngnoEeFjKettjTKsjQlDqYuE29wGuGix541Ba+Nl6ibVkiiF6CCYrjDJ11cr
	TWL5B7BKvgKHPWBHh/RfHs7SLVgXblCpW+1gy8Rz0dpR0638WBwpbXIA+gRHhf4k8Ov//TgCA9V
	rEuG3m8WaLuMlTxi8PP5z0c/VbJ/J41w89vvWf/GgwHxUbyNBuPhi4OhTKOShZqVusUNXt8QBM/
	6bRVL5QL5NQt5lDf8H/CUrqyFiJNFMTcwOVxsjWi9gq1Dn8UM0zfqQ7SlLkYO5Al/eqebtK+4=
X-Received: by 2002:a05:6122:1d8f:b0:575:20ca:573f with SMTP id 71dfb90a1353d-57520cab59fmr1365514e0c.8.1777887188460;
        Mon, 04 May 2026 02:33:08 -0700 (PDT)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5749f7e9400sm5756944e0c.4.2026.05.04.02.33.08
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 May 2026 02:33:08 -0700 (PDT)
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-95d18b33f93so349577241.1
        for <linux-m68k@lists.linux-m68k.org>; Mon, 04 May 2026 02:33:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+rJflTRpHqP0GKAy++nIUfmWpH7L3Sfh80jylT20VGgf1N+ngbs0BBKbcMhV+yTzirJ7qIxkiD0JDe@lists.linux-m68k.org
X-Received: by 2002:a05:6102:3906:b0:60f:b19b:e52c with SMTP id
 ada2fe7eead31-62afef10c73mr6466827137.17.1777887187864; Mon, 04 May 2026
 02:33:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260504081804.3260-3-thorsten.blum@linux.dev> <20260504081804.3260-5-thorsten.blum@linux.dev>
In-Reply-To: <20260504081804.3260-5-thorsten.blum@linux.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 4 May 2026 11:32:56 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXOR7OL8HrWhAn5N+=Wgv2j8iz3EY4qqiGWOX3UkgxTog@mail.gmail.com>
X-Gm-Features: AVHnY4I9fTM7lE2hbH8F01QKuZD3cuIYNQ0mEdyrcr5qYQxF2oPnohNfoP8DbAQ
Message-ID: <CAMuHMdXOR7OL8HrWhAn5N+=Wgv2j8iz3EY4qqiGWOX3UkgxTog@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] drivers: dio: use tabs and avoid continuation
 logging in dio_init
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org
Content-Type: text/plain; charset="UTF-8"

Hi Thorsten,

On Mon, 4 May 2026 at 10:18, Thorsten Blum <thorsten.blum@linux.dev> wrote:
> Indent multiple lines using tabs instead of spaces. Use pr_info() and
> avoid continuation logging.
>
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
i.e. will queue in the m68k tree for v7.2.

> --- a/drivers/dio/dio.c
> +++ b/drivers/dio/dio.c

> @@ -248,17 +248,18 @@ static int __init dio_init(void)
>
>                 dev->ipl = DIO_IPL(va);
>                 strscpy(dev->name, dio_getname(dev->id));
> -                printk(KERN_INFO "select code %3d: ipl %d: ID %02X", dev->scode, dev->ipl, prid);
>                 if (DIO_NEEDSSECID(prid))
> -                        printk(":%02X", secid);
> -                printk(": %s\n", dev->name);
> +                       pr_info("select code %3d: ipl %d: ID %02X:%02X: %s\n",
> +                               dev->scode, dev->ipl, prid, secid, dev->name);
> +               else
> +                       pr_info("select code %3d: ipl %d: ID %02X: %s\n",
> +                               dev->scode, dev->ipl, prid, dev->name);

I'll change these "%d" to print dev->ipl to "%u" while applying.

>
>                 if (scode >= DIOII_SCBASE)
>                         iounmap(va);

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
