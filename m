Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 680A83EFD13
	for <linux-m68k@lists.linux-m68k.org>; Thu, 26 Feb 2026 15:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772119868; cv=none; b=UFHwVhazJgGSVtzipuoeitOY6BdlA6+Fv1uOVjkRDI7uIGj1PpAyijiO78NU7jsCmMh50sc+VNUcMJFmvxF+1pX4q1QPWrhMrjzcaNMVqJzzNnq48l0pNz7d5JQ+3NyvXbHu34ExsbjDwd+otY+R0NHDYdXZj/MRm+ovyvYKttY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772119868; c=relaxed/simple;
	bh=W6cz4cNXddimTmvHvnLUt/GXnPXspMzemlZTksCzWUY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KcY3WTBbdCK7GfVNsCW8az6VoJ34ynlTwcAaUcOwUnwt2f/YSHHYekooNaVjE0YQqARH7cZ9cYVLmOrqlAXINVkBFg0M97/SiUPmoZh7JsaLV29trt5vWgNJ4w5n/iczix9CNmsMCdhVWKp3Fznayzsq53+yLwxfuRmwjDDkg54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b9358dd7f79so131394066b.1
        for <linux-m68k@lists.linux-m68k.org>; Thu, 26 Feb 2026 07:31:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772119866; x=1772724666;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q/7kJpx1RNz+WKaw23lDOcFWZbt7jdmNalLaKHH2YJE=;
        b=FYLeGJ+PLiHJyWdmo/KNNUI2G7n27sPwErH2D6zVtT5LF4lb3YyI0XjLQy8/SE1FdV
         3SxoNr78UgktksTwQ9d+8K3BFjWNrxE/lX9WLbvwiFn3uKWkw8VdOOEgPsxEOLqJlHNw
         sALXnQ/Bg3eWengWjUTdUQP2260HV4C+rZWKCoZdOAmTMbsrBuoW7cCewueUB3S53tpX
         rcoQMhlc7HbiGYBnXd1ju1+eL5SqdL20KYqu2thpwesPLsMd/5oV3HTzGFPKkCqhGZXV
         p/4GdVOGz+9ih5xZJumdcJ1/Hwu7JTCNWb/gNFOSXCeZST5Mte4WRLFdW5OqTySLh2i8
         tAtQ==
X-Forwarded-Encrypted: i=1; AJvYcCVTbegCK/9TtoSsR0GyWyTPQR3sPa9r/0dsX1+pBy+WDAZhK8BFTB4avMYcKewbMs5ndyQMH6dg+sLF@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yz+T5F61ULwpV2cti6DY5o6NPaBmwFwOGdTx5B3PR6u20FPj+/K
	t7gkHB+Dl1ntFeuFwUgYDuICtrrACn50cSKYsbNFHB/xz75diktxjPEh4dDvnJUmqLU=
X-Gm-Gg: ATEYQzxViORbV6BaLyiSamd+rQxkMgh4HYnnBSGBnEgEBK9v2hOK5g5HxaxtRr7Iamm
	3IDqH0CGQD0Q1KvPoChjpg6DXaz+O8Ku8SBgZmtt16tZ3P0iutW9Dlm6PwqJlXdlidIuBukYbcC
	M4ehalZQSI1Api18QzruGQTsRZq8S/vYR22lbHz4iqUL2RdVmE4ZPBhYgCIO2S+ZHBURdi0f1Wa
	NHQ4UGlIf1dkIm7O8zw0bTFhWAF11GaahBH5zuAwP7oDbhn4ZMCF03g6V/9JHwbQELQWMDMu1Cd
	+4Pmlnk7aqegjFMit5JD1esKi4HnPuFauvt8yZHZy7VzBj1DzGtgPw+3VM3hBfcykqYZB2JeGqz
	22mGRHWPVJ7IN0LyTJx68DtQD/q9gVvNvzSs2P6HBttoBzJA/WbVLWoUwcflEVGQmbnpfZyM5v8
	cCwUArqkhSosJl50uXaU4igAHig98KsLUsuOSxDlDcwjkBxWqdG6zJuR7Y07cN
X-Received: by 2002:a17:907:9345:b0:b8e:5e2:79fc with SMTP id a640c23a62f3a-b93514b7aabmr287787166b.14.1772119865525;
        Thu, 26 Feb 2026 07:31:05 -0800 (PST)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com. [209.85.218.49])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935ae6560asm72074666b.43.2026.02.26.07.31.03
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Feb 2026 07:31:04 -0800 (PST)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b93718302beso13111166b.3
        for <linux-m68k@lists.linux-m68k.org>; Thu, 26 Feb 2026 07:31:03 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVIUx0elGz8S5KLTYRcZ/yCBJbAwljkiz+5O+UgUCAulb4gv+FYWPEuCANkZ6kTK4YlPnukEFUY5tWl@lists.linux-m68k.org
X-Received: by 2002:a17:907:26c4:b0:b8f:a724:8704 with SMTP id
 a640c23a62f3a-b9351725707mr318151066b.42.1772119863346; Thu, 26 Feb 2026
 07:31:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260226145441.3606201-1-daniel@thingy.jp>
In-Reply-To: <20260226145441.3606201-1-daniel@thingy.jp>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Feb 2026 16:30:50 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV_SpynGesz3yT9ahN76re9cfRa9C_nETF8VhZ0L8-JPg@mail.gmail.com>
X-Gm-Features: AaiRm50j9nNeAhFWbruo-n9pWRuC9wLPrHenSmjbiLJu6Ugj_ZR3Vf6feq2I5j0
Message-ID: <CAMuHMdV_SpynGesz3yT9ahN76re9cfRa9C_nETF8VhZ0L8-JPg@mail.gmail.com>
Subject: Re: [PATCH] parport: mfc3: Convert to a modern zorro driver
To: Daniel Palmer <daniel@thingy.jp>
Cc: sudipm.mukherjee@gmail.com, joerg@dorchain.net, 
	linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Daniel,

Thanks for your patch!

On Thu, 26 Feb 2026 at 16:07, Daniel Palmer <daniel@thingy.jp> wrote:
> Currently this driver causes my Amiga 4000 to crash if it
> is not a module because it tries to iterate over the zorro
> devices before that has been setup.

Interesting, that is not supposed to happen.

> Convert the driver over to the modern zorro driver API so
> it probes like the other zorro drivers and doesn't crash
> my machine.

Thanks, doing the conversion is definitely worthwhile!

> Claude was able to do the manual work of moving the original
> code but I had to fix up some mistakes, clean up the
> allocations to use devm versions and so on.
>
> Only build, boot, and "checked the driver is registered correctly"
> tested as I don't have the card and it seems to be one of the
> few things winuae doesn't emulate. Using claude to fix it up
> seemed better than just deleting it considering all of the effort
> Joerg put in to documenting the hardware etc.
>
> Assisted-by: Claude:claude-4.6-sonnet
> Signed-off-by: Daniel Palmer <daniel@thingy.jp>

> --- a/drivers/parport/parport_mfc3.c
> +++ b/drivers/parport/parport_mfc3.c
> @@ -66,17 +66,19 @@
>  #include <asm/irq.h>
>  #include <asm/amigaints.h>
>
> -/* Maximum Number of Cards supported */
> -#define MAX_MFC 5
> -
>  #undef DEBUG
>
> -static struct parport *this_port[MAX_MFC] = {NULL, };
>  static volatile int dummy; /* for trigger readds */
>
>  #define pia(dev) ((struct pia *)(dev->base))
>  static struct parport_operations pp_mfc3_ops;
>
> +struct mfc3_card {
> +       struct parport *port;
> +       unsigned long piabase;
> +       bool has_irq;
> +};
> +
>  static void mfc3_write_data(struct parport *p, unsigned char data)
>  {
>         pr_debug("write_data %c\n", data);
> @@ -173,14 +175,18 @@ static int use_cnt;
>
>  static irqreturn_t mfc3_interrupt(int irq, void *dev_id)
>  {
> -       int i;
> +       struct zorro_dev *z = NULL;
>
> -       for( i = 0; i < MAX_MFC; i++)
> -               if (this_port[i] != NULL)
> -                       if (pia(this_port[i])->crb & 128) { /* Board caused interrupt */
> -                               dummy = pia(this_port[i])->pprb; /* clear irq bit */
> -                               parport_generic_irq(this_port[i]);
> -                       }
> +       while ((z = zorro_find_device(ZORRO_PROD_BSC_MULTIFACE_III, z))) {

Please no such while loops in an interrupt handler.
I guess you can just register multiple interrupt handlers (IRQF_SHARED,
fwiw), one per instance, and pass the mfc3_card structure as dev_id
instead? That would let you get rid of has_irq and use_cnt, too.

> +               struct mfc3_card *card = zorro_get_drvdata(z);
> +
> +               if (!card || !card->port)
> +                       continue;
> +               if (pia(card->port)->crb & 128) { /* Board caused interrupt */
> +                       dummy = pia(card->port)->pprb; /* clear irq bit */
> +                       parport_generic_irq(card->port);
> +               }
> +       }
>         return IRQ_HANDLED;

Pre-existing: the handler should return IRQ_NONE if
parport_generic_irq() was not called.

>  }

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
