Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F1E9343D7F
	for <linux-m68k@lists.linux-m68k.org>; Fri, 21 Nov 2025 10:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763719407; cv=none; b=SkrFg1Cepb3teIOyDOJuYa6LE+9TFtvt2nBaTa9TeOfRXJ2rAnsmgVQBHFCiCmIfr+Z/Re8HL+qPoY5G41WpXhLHhyljjp/FT1WO+pSgpcT8UoxCa6DR4t8EZE4RjJpwIV2PtfHJwZeD2iuRnsKbW+XJTilXcmtiVOb+4MO2WH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763719407; c=relaxed/simple;
	bh=TeUAIYoYe5WG9QPmEwZ5LJi25FDVtq2bv+Us8Wz9dgA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UhdEbooxpmhZAuBsWpdF+pYDQFvs59KoN18SNaYTbOojYygnyHz0zRpwSU/oAJczMU43ye28+rvm842ozm7CNGvHOixpuHJVG7ule91w3ZuLbljwIebvsl2fdftowCdIbA/QEHKR/Y+NvWlbTIp/9/67Odax0iznosKXkvbi0EA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-93516cbe2bbso528282241.2
        for <linux-m68k@lists.linux-m68k.org>; Fri, 21 Nov 2025 02:03:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763719404; x=1764324204;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wlBMUu/EpwAnMbRqR4FueGr8bEwdrvt/wf+TDoxxT9k=;
        b=ctJ9CkllWkDy3sfQc4cYmnPZk88HC2LmwRGE6iVqxqfsPHZU+1EXgxS+uAX1ASxpAv
         DbfHOUxG2IDapr+8fGM8uXhfuU5tsJ+mpRkOJYcvbPjEewjkVr+758hNx/v0rJXp0J1w
         4XDadCM5GEmnKaEDU6Vrc8reaQw/f8IpQLQ5Th1X3h02UNFjpJxsHEns1eDthh3RANoW
         JNBy21Q3G3xGDw85FVSd+D8UDP8eTc5d+2mrkV1BFHDIm7RzhDEo6Eo9SfGU+PIOZaUn
         P4bm+whulteskA/3WRUJ/GmfIbzh38ILRRZvveBj+K9niDANPQEpJXaXOCr8paIHhIlP
         wAvQ==
X-Forwarded-Encrypted: i=1; AJvYcCW/fvyLC+Kh7rUKKA3o83EaSFqULTheWv+fLZA1zPjoYK7D5Q6F3VfKwkpucg/W885zXtpIPLohut5z@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yyd0g5X1Hmk8SyZagfRSWC7Lfhdbvku2KZmKak2lrsmNZkO6M6o
	kEpxMTddsQaH4/je2O50VvZRr9s3ryvNPBpC7hG9/mbTulIH/XdRjtn52zspQVSi
X-Gm-Gg: ASbGncvrbRxX67R4GzFdL0Zu4N/oyQ5e8JS2mlAynFCnC9eFzk337UOL9VSm3huiEif
	xveLeFKGOvnTIjriQKgJmYtZQ6PLyu2ZaDTD96jj1Q42yRY/nlcToTIqsDLHl52/aRBo/BQxzpI
	2BbRstzVH1iw/nI6X1CLTYRb3D+moX59Q9xx8QrwWXa8y2YF3OWpKkPBoIjHcP+GLT1sArkTFip
	RP8T85bYkel9p4nZalLKbG+xRhbtD/IYGoGBv7XPI9tpTHhKdtXhddTtT8sMlaQP9hxO3PRzaWD
	8tKkJ/uN2V03+F3fYEv4QAwGRlgjaQc6n8YdDJ6995uL0xsVylA/+NW01G9WP5WHqLiqzaOEHRL
	c5aSYq+H6FRGU0nBwQDMKqHDUu8a0K8XJdSl97Vu//F0kPGq3aWgH/MxuKFwZ1DSl+d019xJHcI
	dSiIOnjpGRcU9I0UA2Fiu5cf5Guez/eso6tJx8U5q1CXF+9lGB
X-Google-Smtp-Source: AGHT+IGVaDobEc45OozSFTZcwq2IOrUVN6n453a1fkfBDD31crE4uFLJLcdvLtjXrf3y3onj5xYb+g==
X-Received: by 2002:a05:6122:da2:b0:559:6960:bdf9 with SMTP id 71dfb90a1353d-55b8d7b1658mr396761e0c.16.1763719403549;
        Fri, 21 Nov 2025 02:03:23 -0800 (PST)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-55b7f60308csm2170850e0c.2.2025.11.21.02.03.23
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Nov 2025 02:03:23 -0800 (PST)
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-93a9f6efebbso543779241.0
        for <linux-m68k@lists.linux-m68k.org>; Fri, 21 Nov 2025 02:03:23 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWqRiVxM0Vy42GcbqQ+85Prm5Iuy8ZxcGRQSpd8ODSBIicYXnyefLYjsbNBHV/tikwiN94DX80wc2di@lists.linux-m68k.org
X-Received: by 2002:a05:6102:579a:b0:5db:33f9:adce with SMTP id
 ada2fe7eead31-5e1de3d42camr385692137.41.1763719402998; Fri, 21 Nov 2025
 02:03:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251120180233.763975-1-hsukrut3@gmail.com>
In-Reply-To: <20251120180233.763975-1-hsukrut3@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 21 Nov 2025 11:03:11 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV3UvDHT0uu8oeiCGc9pURaLPDPmG-Fu9kC9H8DQyqRDw@mail.gmail.com>
X-Gm-Features: AWmQ_bkayHVM_Ddsfirz9lK5uUvThJmyJwFAo8HPyX8vy-dtp3QKVrq4J4AGcFo
Message-ID: <CAMuHMdV3UvDHT0uu8oeiCGc9pURaLPDPmG-Fu9kC9H8DQyqRDw@mail.gmail.com>
Subject: Re: [RFC/RFT PATCH] fbdev: q40fb: request memory region
To: Sukrut Heroorkar <hsukrut3@gmail.com>
Cc: Helge Deller <deller@gmx.de>, 
	"open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>, 
	"open list:FRAMEBUFFER LAYER" <dri-devel@lists.freedesktop.org>, open list <linux-kernel@vger.kernel.org>, 
	shuah@kernel.org, david.hunter.linux@gamil.com, 
	linux-m68k <linux-m68k@lists.linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"

Hi Sukrut,

CC linux-m68k

On Thu, 20 Nov 2025 at 19:03, Sukrut Heroorkar <hsukrut3@gmail.com> wrote:
> The q40fb driver uses a fixed physical address but never reserves
> the corresponding I/O region. Reserve the range  as suggested in
> Documentation/gpu/todo.rst ("Request memory regions in all fbdev drivers").
>
> If the memory cannot be reserved, fail probe with -EBUSY to avoid
> conflicting with another user of the same address.
>
> Signed-off-by: Sukrut Heroorkar <hsukrut3@gmail.com>

Thanks for your patch!

> ---
> Testing: This patch is sent as RFT since Q40 hardware is unavilable and
> QEMU does not emulated a Q40 platform. The change is therefore compile-tested
> only.

I would suggest not to apply this, unless it is tested on real
hardware.  It wouldn't be the first time an innocent-looking change like
this breaks a system. See e.g.
https://lore.kernel.org/all/Y5I2oQexHNdlIbsQ@shell.armlinux.org.uk

> --- a/drivers/video/fbdev/q40fb.c
> +++ b/drivers/video/fbdev/q40fb.c
> @@ -101,6 +101,13 @@ static int q40fb_probe(struct platform_device *dev)
>         info->par = NULL;
>         info->screen_base = (char *) q40fb_fix.smem_start;
>
> +       if (!request_mem_region(q40fb_fix.smem_start, q40fb_fix.smem_len,
> +                               "q40fb")) {
> +               dev_err(&dev->dev, "cannot reserve video memory at 0x%lx\n",
> +                       q40fb_fix.smem_start);
> +               return -EBUSY;
> +       }
> +
>         if (fb_alloc_cmap(&info->cmap, 256, 0) < 0) {
>                 framebuffer_release(info);
>                 return -ENOMEM;

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
