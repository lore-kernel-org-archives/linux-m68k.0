Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B274A35C6A1
	for <linux-m68k@vger.kernel.org>; Fri, 14 Aug 2026 07:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786694016; cv=none; b=q/JKcMOiBXvL8WVvKZPRoEhIde1p0QG/XM2wf/YuPTBfMll20v1uH/0wRgHYDuVQSw1S6DkxKHFsZZJWXL9OV8iiVyXnjzFLqpngPWmWHHSSCvlCDUr6nYC6REjb86eU3x5CBQkNB2Fp9wZg/jemRjfPU4Gu7MD6GfX+x5VHhcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786694016; c=relaxed/simple;
	bh=7BkQnfAIktusRlNjZWX17il+4/DC7tS0dUmvo6uz8uA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZOuzLxcNmHC7meWuc88OMDEeZiV6BPPihTUoqB8FW/b/1h2Lc6TvNS2Oq7FwUF4xLW87udkjj2iPd/LJHoWS4OTseXuaEMPo1EX+8D5ok7jWxMFafii8j90cWkAT7g3hPQ4tFgO3gPIoi9ZywR9OUMpES5XtBM7beNi1ESb/yLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-5c2c96286f0so243998e0c.3
        for <linux-m68k@vger.kernel.org>; Fri, 14 Aug 2026 00:53:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786694012; x=1787298812;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0qHVfNxtQY2Rdqk6vqe/0GBLwii5v18vOQzYi9aKNQI=;
        b=LdRGujlmVtnWr7KPRP0T7vSGEQ1S1b+W6ihYRQqAWGMV/xrfzKMAoLmkMZjYn76t4/
         A59Fu4GLQY2W9dEuDENPqM7amAwGIZIYp1otY7qthXsyekL4elvrnLm6uDX7cwmXtzZ6
         zzZmnc/v+/aMycmb7//+Bv1P3I9K9G1VuGdMTHl9ju3ozhcjTLLxehl6XypCRy/4aRDv
         pPuRGWWMfyoNJVVvwOL2SSFjE74EHRbu+aUP8DV60zE27TZX3e6/V0vac1NKhVaa06BD
         XpHXcL2LJ+S9QmCO7O+nBoOGCWkJTqvKqZL5Rl/Rq59j6jOu1XBkz0rgnFd2edWjEa4q
         0CNw==
X-Gm-Message-State: AOJu0Yyiwy/EAFcBUhl4w5sVgiEYvP/2SxA8u7dC8LBmucS8egBEPnro
	sdH6QZWDA4Oa6YKYDiWyFONSRXfvrGpvIy6+T4f1JARSrLsjqpYmcF2zU6eZSD3vd/Y=
X-Gm-Gg: AR+sD12aUj7XPTNhiW+Rwl01TJ0lFvRGUZnzzCfyQZZGxaJFBheBI1/ueOPhAUffKbi
	58jpWyIWaotYGLY3N1oup69tT75V3kwmeZ0ncJUnpBfs4qSzT6HLia5k1mSrdv8F6/5oooeC80L
	UgLiTJnV/YSQ2++Xbu20hX0xfyD9p+1vcUQm6ICp8znBGqB+LR2l4+7q8pQN1SKlJ+k6GEbdWQV
	IiFXKolSzlUEX0Iym0kBGx6+I+JL89a9q031P9q9JEgrFGyW7n/QfdqY63pEN8VHM1rVzKFxoPH
	AcD0Sr+QpTalpFZCzrmJ8/Z952e6YXX3xb6KXBb5oxLgq5ye1LQ8hKJIZHaG6BrqQQXVYC5q0xm
	MJdlz2d4Jm2pf1PqEkC2+/fbTHyAEJxvVHDvkql6TQcZ91XnnnOi/mYLFjYmQtt85U+1UjJGzYF
	WeWvUWmK38rCAJg5iTNT6WA+VSvAKUNhdbkbnNGMuxSp0Yo+KKE88hoQ3qcl1lOcMjbO4LQCAvE
	gRCHixDlXO9/LjgzVwq38zi5EqT7w==
X-Received: by 2002:a05:6122:d22:b0:5a0:370:f12c with SMTP id 71dfb90a1353d-5c591f368a3mr756127e0c.11.1786694012422;
        Fri, 14 Aug 2026 00:53:32 -0700 (PDT)
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com. [209.85.221.175])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c59472656csm555860e0c.5.2026.08.14.00.53.32
        for <linux-m68k@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Aug 2026 00:53:32 -0700 (PDT)
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-5c2c96286f0so243996e0c.3
        for <linux-m68k@vger.kernel.org>; Fri, 14 Aug 2026 00:53:32 -0700 (PDT)
X-Received: by 2002:a05:6122:caa:b0:5bd:cb34:1b70 with SMTP id
 71dfb90a1353d-5c591c98081mr656206e0c.1.1786694011698; Fri, 14 Aug 2026
 00:53:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260814031745.17140-1-schmitzmic@gmail.com> <20260814031745.17140-2-schmitzmic@gmail.com>
In-Reply-To: <20260814031745.17140-2-schmitzmic@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 14 Aug 2026 09:53:19 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUDvsqT5t93-ZO413pwS3rPYPB1_uy+5iRHsii8CYTdgA@mail.gmail.com>
X-Gm-Features: AcwNN1WMoINhecOvnhDTMgQZHz3bOdVXUcdM9Pmp4imwGjdsj-hjuib00geilxQ
Message-ID: <CAMuHMdUDvsqT5t93-ZO413pwS3rPYPB1_uy+5iRHsii8CYTdgA@mail.gmail.com>
Subject: Re: [PATCH 1/5] m68k: Fix atari mouse movement
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: linux-m68k@vger.kernel.org, Miro Kropacek <miro.kropacek@gmail.com>, 
	linux-input <linux-input@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Michael,

CC linux-input

On Fri, 14 Aug 2026 at 05:17, Michael Schmitz <schmitzmic@gmail.com> wrote:
> From: Miro Kropacek <miro.kropacek@gmail.com>
>
> Kernels are built with -funsigned-char since version 6.2, resulting
> in signed mouse position deltas getting misinterpreted as unsigned.
>
> Cast deltas passed in (unsigned) scancode buffer to correctly
> interpret sign.
>
> Fixes: 3bc753c06dd02a35 ("kbuild: treat char as always unsigned")
> Link: https://lists.debian.org/debian-68k/2026/08/msg00000.html
> Signed-off-by: Miro Kropacek <miro.kropacek@gmail.com>
> Reviewed-by: Michael Schmitz <schmitzmic@gmail.com>

Since you're now in the path to upstream, you should add your SoB here
(applies to all patches).

> --- a/drivers/input/mouse/atarimouse.c
> +++ b/drivers/input/mouse/atarimouse.c
> @@ -70,9 +70,12 @@ static void atamouse_interrupt(char *buf)

Alternative, you could change/restore the function's signature to take a
"signed char *".

>         atari_mouse_buttons = buttons;
>  #endif
>
> -       /* only relative events get here */
> -       dx = buf[1];
> -       dy = buf[2];
> +       /* only relative events get here; the IKBD sends signed 8-bit
> +        * deltas, and the kernel builds with -funsigned-char since 6.2,
> +        * so an explicit signed cast is required
> +        */
> +       dx = (s8)buf[1];
> +       dy = (s8)buf[2];
>
>         input_report_rel(atamouse_dev, REL_X, dx);
>         input_report_rel(atamouse_dev, REL_Y, dy);

Regardless:
Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
