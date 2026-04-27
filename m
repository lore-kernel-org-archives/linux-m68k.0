Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A34703B0AE5
	for <linux-m68k@lists.linux-m68k.org>; Mon, 27 Apr 2026 11:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777290698; cv=none; b=EVmCLlIKe4kRIqPxPoRkP4P0f1MVYw09OZ6hhvgC0M7Xb8ILApvdUPgVobMj6xCTUDfbF1gZzeluhfkVsuInxBJ4q3ncIWs1PemZJsi+A+igaOvf3TZT3lYcajWeJ4wq4tmM7qQzmyMi/qs591DgGnj1QYTUcQ0nDLmeVe1dM2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777290698; c=relaxed/simple;
	bh=n+GYShFZltmq5kVKLHeNk06raTnAyMmBZZMAol4UafA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ghLeWp2gAbGNgV1EqdGJp/Y5B5+eGC+avWJ9/6dkIujAlNyTGMqkumqNVjGZkZK3iSZBkw09sebnx6Nvjq3iHRfgWVrubdDdl5wRk3ShRahOZR/It2ys9kbpq/cZh87kK0O3RvMLXL0YxjISNiKIwKRwKuswo+kj4Wf7xosYUaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-56739adfa1aso6893158e0c.0
        for <linux-m68k@lists.linux-m68k.org>; Mon, 27 Apr 2026 04:51:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777290695; x=1777895495;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lf4z4wGA14PfBosRZS445poJArh720oajEmNhHLf8uQ=;
        b=bxHPmunGeOeUl5nWabpLzJn2YfbQYnTe8OaC/ZcDqC5JUE7OtozpZXcEngn/Jx+3l4
         T3o/yK8xntbxSP8L2WfLNP5UstzkOA1PN7GD14eJo8k9kKMYclaS1o58V0ZmETDoJotY
         rfGgppFd4XWv+FhkP8gKqQBxbzxCM+wE8I2BcTydyJ3dhzgLF93+X3vqLxaahLfUV3ec
         3PcldlyT16VKAmabQAUCLadXMbJ+f5PLEyg5Amz6I5SEMJhlJtMluDXxqeM3onmONrfM
         NDPyS9vZqNENWX1+s8FF4t+7dLVkYTqofSntwCCwc5bzYfHmlVZttyDXrKcNM/umksqw
         +wSA==
X-Gm-Message-State: AOJu0YwaKzxNJpqImq+YB1RVaN6PthG3C8yaC5hJuU17FkG/G+RRr16/
	LsVCQ529qB5v3BtEVJErl741PTvxUFg9g/LdawgP9cyIZAHk/lFYc/2tEGe4mW3XlPY=
X-Gm-Gg: AeBDiesvT7lHxEa3f+ClKNcSifqlzglznXyVFJgXr/YT8VsHS2ErR7KXtph17Z0heq/
	X3WXF/nLJVB47W4vTVAXx3CK7HF5CBxZX2c6+4I+hO3gs+lPrPxRDqoRDcXFefv+L1P5ejClBEQ
	Vx5P7zKqH7Z8eMPXt4Jdbk55dCNYOxd6zUm354sN+4biYJNkIAjcM5x9/BMvzEC8nb30GxJCJLX
	GRYaFrSBd8XwW29jtPzhm4i537zWbDhuWz+xCszYqndR4oOqA0sRN7j0fV0vg8KVgr8zUcmPQ1x
	sY75p6/UmlyKni+bpvOccOFeCk2o9nkn9zo+4fkLmLOdvhvk1Ts4nCZLJ44tQbKug8mojDW+Vzs
	T1PWgfTK7pI+BnoTO9UZyxZUOlLHZ2uun+TglMZCT/gbWajeuBqMREiJDkDFJ/C+Ph+VtDn3kyZ
	gnOnIjBuunmQmt/ERnMgSoqbxAkZfIb67My0nXBiuwYFf0wLWy0t0U/t16E1npW2aYKYKVP2I=
X-Received: by 2002:a05:6123:5d9:10b0:56f:bb91:4861 with SMTP id 71dfb90a1353d-572278284b4mr8727827e0c.0.1777290695488;
        Mon, 27 Apr 2026 04:51:35 -0700 (PDT)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56fa93513c6sm18852823e0c.17.2026.04.27.04.51.34
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 04:51:34 -0700 (PDT)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-612d8a59ca0so6638970137.1
        for <linux-m68k@lists.linux-m68k.org>; Mon, 27 Apr 2026 04:51:34 -0700 (PDT)
X-Received: by 2002:a05:6102:4a92:b0:607:4fe2:d3e1 with SMTP id
 ada2fe7eead31-616f54a1970mr23123014137.13.1777290694494; Mon, 27 Apr 2026
 04:51:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260406172512.6693-1-pedratscher.stefan@gmail.com>
In-Reply-To: <20260406172512.6693-1-pedratscher.stefan@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 27 Apr 2026 13:51:23 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU9D7i5ty5Gdj=ynuezwLJg6qH3-rV7Kp1AWVv-7Maw1Q@mail.gmail.com>
X-Gm-Features: AVHnY4IPkjWnMM6atzuSnKH_4nOqYdi1dlOZ4afhBqY8q9Wzgfp2i7Pd7JCjxHI
Message-ID: <CAMuHMdU9D7i5ty5Gdj=ynuezwLJg6qH3-rV7Kp1AWVv-7Maw1Q@mail.gmail.com>
Subject: Re: [PATCH] zorro: sysfs: replace sprintf with sysfs_emit
To: Stefan Pedratscher <pedratscher.stefan@gmail.com>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Stefan,

On Mon, 6 Apr 2026 at 19:26, Stefan Pedratscher
<pedratscher.stefan@gmail.com> wrote:
> Convert sysfs show functions from sprintf to sysfs_emit as recommended
> by Documentation/filesystems/sysfs.rst. This ensures proper buffer
> handling and avoids potential buffer overflows.
>
> Signed-off-by: Stefan Pedratscher <pedratscher.stefan@gmail.com>

Thanks for your patch!

> --- a/drivers/zorro/zorro-sysfs.c
> +++ b/drivers/zorro/zorro-sysfs.c
> @@ -53,10 +54,10 @@ static ssize_t resource_show(struct device *dev, struct device_attribute *attr,
>  {
>         struct zorro_dev *z = to_zorro_dev(dev);
>
> -       return sprintf(buf, "0x%08lx 0x%08lx 0x%08lx\n",
> -                      (unsigned long)zorro_resource_start(z),
> -                      (unsigned long)zorro_resource_end(z),
> -                      zorro_resource_flags(z));
> +       return sysfs_emit(buf, "0x%08lx 0x%08lx 0x%08lx\n",
> +                       (unsigned long)zorro_resource_start(z),
> +                       (unsigned long)zorro_resource_end(z),
> +                       zorro_resource_flags(z));

Wrong indentation.

>  }
>  static DEVICE_ATTR_RO(resource);
>

The rest LGTM, so
Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
i.e. will queue in the m68k tree for v7.2, with the above fixed.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
