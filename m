Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50F813D6692
	for <linux-m68k@lists.linux-m68k.org>; Mon, 29 Jun 2026 07:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782717965; cv=none; b=h92FrO3MjinE2fO8KkEbqYDxss8pL7UyEDNsV3MTKiaTyAZLDKFngR8aPg7DXsTHlA8l6QGRNvN0ntwiLtExmSeQBYd5AVznQR2j/bwKqS4fLtSn25cemF+hnn4pN9S3JQAo/nZBKKtHV3QrkNiKY3kLrNX+zy+p6UtTSn+yazw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782717965; c=relaxed/simple;
	bh=6mj11ONA82swByvI86CZ50z/i5eqn92TdarhP941L9E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SQHABAWXXmasKbH7Jdm+5/TG+Djknuc6Y1+S6KZqPkZZfXquFivBbjqY6D5SA/xPUUHiCVwn22KAi8TXDmIgATlSBtrAZKkbYVqvBPNqgdGfxATm6zBgKe4oz50tFbqWTetC3gd9YI+LTjF8FtuiGLkKERSia++2I2dI7o3aTEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-59d4aa96ef2so2482046e0c.1
        for <linux-m68k@lists.linux-m68k.org>; Mon, 29 Jun 2026 00:26:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782717961; x=1783322761;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fby5dyw2GEEKWbuN7p+fOm3O26YgBvyosItdnIdm+7Y=;
        b=acuECsqS4YX4tBFHEZP5UwBUNFnNavvA+XI5/FZO3MtsowETs5UwwMti7qHyXBRKjm
         bWVDkKN2vSFF24/NqDAo4MCYQFGbjD4+Tz4Z+bsBTowW7GgDkZZO506TBax+HmEFYADj
         Z56QKnxz0+c0K1lqYu7z8zMmWG2IpVpfQme+5+JtwUnk826a9OcrV6BXxdNVVmP6N2D1
         LeW6m4GOS3XaU3xei1BnjknOfSUVykaYesvYtewVxLtkDRGrK4GuOIHD+IMF3qPhTvGA
         xvEEmYt0sB6fjuxeflWesdyVioQ1wqe62h+X7x2v2zEiP0XAXVj0buPbbsWVevY8LCbw
         hYEA==
X-Forwarded-Encrypted: i=1; AHgh+RpXYxy9Whhjwf1mXWRt8qk5lSeue0HTRtpR+nrbT1r412l7RliBzgtJX3cMuE9Co7WBNPt9sw8DnszO@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YxUSfysyin4A/iWtwdIflL84Eg/K+V+SHKKfLR+ct7W2T6yAYEX
	Z84WbkfdxgZ9esS2U8uYhWDGQtM6Ahjw+aiVdtIAEx3IZFBRndyK2E/H2Dpw33d+
X-Gm-Gg: AfdE7cnFvaVmD/D8Cuc3eDSl6XpG0YsLFR5L18HCm2ikamuMnJS6Us7AUQBVwl0V4dx
	dwiiE9C9yWClEt+qp4IFPeTGl/eYR60aB3vkKYnqUh0Wg+4JkPlL47GSJHAwU/o0e/t5lCvHWjR
	BnpgSaYadP6GUnqACp59oy/TJNo1zrO/CPOBUSG/HqHEb2EKHzhIf4BcM8wzjfIveUMaU1y+o4w
	AcZqpSv2e0uakHkBtMG70exh2akQ+wogpVgjDgJeMnCbnzNa2LOFEmw7kWfbUGCQxS6F2Wra6np
	8s46eKB7lNIhKBnco3181vwwo3OWr76J5UK4BL8X4+fgVBKt+CKqlkiOs8rGW46qua674OGCxhs
	0zYvaqFbUkjqRaXTfcM8RN3g13z9dX3+upFecUGdMFXzNtbWLvUDxrN+HR4jsFvEE5FjYndteuW
	SvlrInwrGdfkj3emCPFKcDi3JwPBdfq+94kH9u8ro8zrV7uW+uFw==
X-Received: by 2002:a05:6122:1782:b0:5a0:2018:4dfa with SMTP id 71dfb90a1353d-5bd69c2f7e2mr6713670e0c.3.1782717960839;
        Mon, 29 Jun 2026 00:26:00 -0700 (PDT)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com. [209.85.222.45])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-969220da94asm4044470241.1.2026.06.29.00.26.00
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 00:26:00 -0700 (PDT)
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-96358d0a024so2953834241.3
        for <linux-m68k@lists.linux-m68k.org>; Mon, 29 Jun 2026 00:26:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqBNV7Huv3LSMpxYzI0xLJVLPsUhy5Bdl+D98A0XNWSyhlERkOVQZXddxQNMiMGXSyiNEF/HDKAsUoZ@lists.linux-m68k.org
X-Received: by 2002:a05:6102:41a4:b0:738:2a8c:736b with SMTP id
 ada2fe7eead31-7382a8c74aamr1680948137.20.1782717960187; Mon, 29 Jun 2026
 00:26:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260626145731.64010-2-thorsten.blum@linux.dev>
In-Reply-To: <20260626145731.64010-2-thorsten.blum@linux.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 29 Jun 2026 09:25:48 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVMkDOK6baAm9cjYyuUCOWxu_OHE8+ftNwEU1rFfet7Ag@mail.gmail.com>
X-Gm-Features: AVVi8CcS_eySQlDOYUMs7W30gXP1il4aqNVm1H49E6NomfTSErsOLRB0nSlUuCc
Message-ID: <CAMuHMdVMkDOK6baAm9cjYyuUCOWxu_OHE8+ftNwEU1rFfet7Ag@mail.gmail.com>
Subject: Re: [PATCH v2] m68k: amiga: Mark amiga_reset() as __noreturn
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: Daniel Palmer <daniel@0x0f.com>, linux-m68k@lists.linux-m68k.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Thorsten,

Thanks for your patch!

On Fri, 26 Jun 2026 at 16:58, Thorsten Blum <thorsten.blum@linux.dev> wrote:
> [PATCH v2] m68k: amiga: Mark amiga_reset() as __noreturn

This is not what this patch does, as amiga_reset() is already marked
__noreturn.

> Mark both the forward declaration and the function definition as
> __noreturn, and remove the redundant redeclaration.

Why both? No other static function (except for xen_pv_play_dead)
is tagged __noreturn in both the forward declaration and the
implementation.

> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>

> --- a/arch/m68k/amiga/config.c
> +++ b/arch/m68k/amiga/config.c
> @@ -96,7 +96,7 @@ static char amiga_model_name[13] = "Amiga ";
>  static void amiga_sched_init(void);
>  static void amiga_get_model(char *model);
>  static void amiga_get_hardware_list(struct seq_file *m);
> -static void amiga_reset(void);
> +static void __noreturn amiga_reset(void);
>  static void amiga_mem_console_write(struct console *co, const char *b,
>                                     unsigned int count);
>  #ifdef CONFIG_HEARTBEAT
> @@ -543,9 +543,7 @@ static u64 amiga_read_clk(struct clocksource *cs)
>         return ticks;
>  }
>
> -static void amiga_reset(void)  __noreturn;
> -
> -static void amiga_reset(void)
> +static void __noreturn amiga_reset(void)
>  {
>         unsigned long jmp_addr040 = virt_to_phys(&&jmp_addr_label040);
>         unsigned long jmp_addr = virt_to_phys(&&jmp_addr_label);

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
