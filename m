Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26EC4EEAB
	for <linux-m68k@lists.linux-m68k.org>; Mon, 24 Mar 2025 08:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742804293; cv=none; b=FqNlu9l6yuequU1xSHxG0s14bgzT4LkI2b8GtAQDpu+MEXskFD1egJcf+fp5vKUZ1ooxus0x6R/huIlxlqXt0cefV3fqrYERgwqg/UkH/pLp8RanBVgnnU8C4E1lHyy6dsFcqsNNDrjBm+C3yZMP/5eVL6LOTByrfPf2TS55WPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742804293; c=relaxed/simple;
	bh=DR2GU7B7vKe1fRGpDrIOHaYbKAB0WyStucsjC/I0pWo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Owlf1Wzylx9vNK+qt8QD7hii6+BpMRph6SGBQhInnkQuxGkAkYxUR6P2t/xvmWCKUZvpR3io91ddoyERYTgwQlzeHMlCTJpcGaGFqkah7ZQ57KA/ZWgcUKr/p6DMVQvSeMIKaKeCukO128fyoz3ECAlzFeEjsEr+fF8E4eXpVVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-523eb86b31aso1697667e0c.0
        for <linux-m68k@lists.linux-m68k.org>; Mon, 24 Mar 2025 01:18:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742804290; x=1743409090;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8oPYt1XECdKKec9hLvTco+yrpmt9lTzEom5ts3R7JGY=;
        b=IDCOU+M6xn8GaLkJFH8VefUFeqV80EcAVTA1efvEGUgIr/BkoCrZ3PUz3Y2CpV1trL
         I59Glhkhcn6sWXIYupS+dUt3qdYw2APZ0lB7WsjqClvTyCWlb1skkMGQiIy+IdmiR8e6
         o5O642g69BvXXoWumaB04SgKR0pu0p/X0JkYENlVxNaa2DcYTOIuvMeExWm0bzZBpK8c
         GA6/Ius7WZv77amy/8DRqgjs87WNYkzEfwKcEHKwroePBkH7zah28V8ITPZprexPxMSY
         b6kdU5joxuPh2/Ax0779hDGzIJ0mB8JiibXhrT294LcmlsnYqjZKUvaMe6UVpi1J1sH5
         JiWQ==
X-Forwarded-Encrypted: i=1; AJvYcCV9vekAtXOTr8fsxm4aHaGfQWptTC2Bp6+AHM/JGtnLFWadvWc2tz2GccTLnpqoDnShwWS8t+fB95v6@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YyA2xJDqmd4nCrvr1EFPR/MG3Fl+nRbzMsilP+GLnMSFl9YT/GG
	x7wdR0xFn17E9t1Q0K8gRifc825M+rbFkCO6q5Nt7Lwel+9JJZq6ux/0Nq1q
X-Gm-Gg: ASbGncuLnXGXBMZbDcdQ3BudYFa+/l/06rkWw9N3l8o7Of5pi/3QoN01YGyWzYwNdMs
	2JYAiHKgSqw/NhH3W4rYjrYgOoDmgknfFIFttN0YGyIIa7cPBz8aJ1EOEdFYyAureS+uEmKDfRn
	nQ9qf3Fg3na0RLZVJRqLxcp/E5LWR8zq9LAApPGPPbplJVUETP69Aa4/K+IkLxqrKf7ayOGlb54
	QBoNgjs3lMXjl+R5ZtFkId3/JKmUx6vxKVxhcyLtwgoRfqhI8lGrAhxz/XwmRzaK3o1t93oBWee
	ypOvxr8LDHvVykO+eNKtOh+SXnQtrlA02xURwZG8ckqiFu+65iWTMveoyH6BiQFyrMQDnuq2TYq
	qVq2ki10=
X-Google-Smtp-Source: AGHT+IGhv68zBLMp87j5G3qrBWxr3ANnAayRwSP0eiDvAYir07MXMSRC4tYg1LGS5X5/WVn3y1OhZQ==
X-Received: by 2002:a05:6122:1781:b0:520:42d3:91bc with SMTP id 71dfb90a1353d-525a82e6a35mr8966207e0c.2.1742804290322;
        Mon, 24 Mar 2025 01:18:10 -0700 (PDT)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-525a7667711sm1327407e0c.39.2025.03.24.01.18.09
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Mar 2025 01:18:09 -0700 (PDT)
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-86b9ea43955so1689794241.2
        for <linux-m68k@lists.linux-m68k.org>; Mon, 24 Mar 2025 01:18:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWy5RGSyMhw8LWzLx7K0IUX/udaDmgMha2Rm1oL5iwdNftSAQjfgvmyqEj/hgtoqzOiKSPsB+9Za8PV@lists.linux-m68k.org
X-Received: by 2002:a05:6102:32c5:b0:4bb:e36f:6a30 with SMTP id
 ada2fe7eead31-4c50d5471femr5760952137.15.1742804289678; Mon, 24 Mar 2025
 01:18:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250321151416.338756-1-p.pisati@gmail.com> <20250321151416.338756-3-p.pisati@gmail.com>
In-Reply-To: <20250321151416.338756-3-p.pisati@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 24 Mar 2025 09:17:57 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU0yDSXoeDoK0yUrJ-cD_4BChEXcvteJW5Ra6afKzciMQ@mail.gmail.com>
X-Gm-Features: AQ5f1JoW7bheJCVVukIRWHNfiQ7Vyomh3BRmOcBVJ1orzSt7F7GUHpg-m56AkvU
Message-ID: <CAMuHMdU0yDSXoeDoK0yUrJ-cD_4BChEXcvteJW5Ra6afKzciMQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] amiga: cslab ata support
To: Paolo Pisati <p.pisati@gmail.com>
Cc: Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>, linux-ide@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org
Content-Type: text/plain; charset="UTF-8"

Hi Paolo,

On Fri, 21 Mar 2025 at 16:14, Paolo Pisati <p.pisati@gmail.com> wrote:
> Driver for the on-board IDE interface on CS-Lab Warp Expansion Card
> (NOTE that idemode=native has to be set in Warp Configuration)
>
> Signed-off-by: Paolo Pisati <p.pisati@gmail.com>

Thanks for your patch!

> --- /dev/null
> +++ b/drivers/ata/pata_cswarp.c

> +/*
> + * We cannot have a modalias for X-Surf boards, as it competes with the
> + * zorro8390 network driver. As a stopgap measure until we have proper
> + * MFD support for this board, we manually attach to it late after Zorro
> + * has enumerated its boards.

I started working on Zorro MFD a long time ago, but never finished...
https://web.git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git/log/?h=zorro-mfd

> + */
> +static int __init pata_cswarp_late_init(void)
> +{
> +       struct zorro_dev *z = NULL;
> +
> +       /* Auto-bind to regular boards */
> +       zorro_register_driver(&pata_cswarp_driver);
> +
> +       /* Manually bind to all boards */
> +       while ((z = zorro_find_device(ZORRO_PROD_CSLAB_WARP_CTRL, z))) {
> +               static struct zorro_device_id cswarp_ent = {
> +                       ZORRO_PROD_CSLAB_WARP_CTRL, 0
> +               };
> +
> +               pata_cswarp_probe(z, &cswarp_ent);

This looks very hackish to me...
I guess it blows up when trying to unbind either the zorro8390 or
cswarp driver?

> +       }
> +       return 0;
> +}
> +late_initcall(pata_cswarp_late_init);
> +
> +MODULE_AUTHOR("Andrzej Rogozynski");
> +MODULE_DESCRIPTION("low-level driver for CSWarp PATA");
> +MODULE_LICENSE("GPL");
> +MODULE_VERSION(DRV_VERSION);
> diff --git a/drivers/zorro/zorro.ids b/drivers/zorro/zorro.ids
> index 119abea8c6cb..33418af7488a 100644
> --- a/drivers/zorro/zorro.ids
> +++ b/drivers/zorro/zorro.ids
> @@ -400,6 +400,11 @@
>         0100  ISDN Blaster Z2 [ISDN Interface]
>         0200  HyperCom 4 [Multi I/O]
>         0600  HyperCom 4+ [Multi I/O]
> +1400 CSLab
> +       6000  Warp DDR3 Memory
> +       0001  Warp Video Memory
> +       0101  Warp Control Registers
> +       0201  Warp Flash ROM

This change belongs to the previous patch.
Why don't the product IDs match with the definitions below?

>  157c  Information
>         6400  ISDN Engine I [ISDN Interface]
>  2017  Vortex
> diff --git a/include/uapi/linux/zorro_ids.h b/include/uapi/linux/zorro_ids.h
> index 0be1fb0c3915..5736d2bf0295 100644
> --- a/include/uapi/linux/zorro_ids.h
> +++ b/include/uapi/linux/zorro_ids.h
> @@ -455,6 +455,12 @@
>  #define ZORRO_PROD_CSLAB_WARP_CTRL                             ZORRO_ID(CSLAB, 0x65, 0)
>  #define ZORRO_PROD_CSLAB_WARP_XROM                             ZORRO_ID(CSLAB, 0x66, 1)
>
> +#define ZORRO_MANUF_CSLAB                   0x1400
> +#define ZORRO_PROD_CSLAB_WARP_DDR3          ZORRO_ID(CSLAB, 0x3c, 0)
> +#define ZORRO_PROD_CSLAB_WARP_VRAM          ZORRO_ID(CSLAB, 0x64, 0)
> +#define ZORRO_PROD_CSLAB_WARP_CTRL          ZORRO_ID(CSLAB, 0x65, 0)
> +#define ZORRO_PROD_CSLAB_WARP_XROM          ZORRO_ID(CSLAB, 0x66, 1)
> +

This does not belong in this patch, and adds duplicates?

>  #define ZORRO_MANUF_INFORMATION                                        0x157C
>  #define  ZORRO_PROD_INFORMATION_ISDN_ENGINE_I                  ZORRO_ID(INFORMATION, 0x64, 0)



Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
