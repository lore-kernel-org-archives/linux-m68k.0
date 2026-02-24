Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39248378805
	for <linux-m68k@lists.linux-m68k.org>; Tue, 24 Feb 2026 10:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771929148; cv=none; b=HlwKHHk8GkdWp0v32VCnqp8a4Dy/LlXslUnIeEPTmzToR7Pi5LM2rIohJsmSRy2jdey6bF6v1AvSsE9/gJ4M4dBWa4QM3erHJJ7T1PotAQqZdvL1kZXUXeI0MLwvmvh5UGlMh48WVFmhxuuTha8OCQYxi3RtstS2tEBQJveJF/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771929148; c=relaxed/simple;
	bh=1GwAU01i1Cp85CJMb4RNqTa2xdPel81JZPOeaCOEgRs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Jzl+G9mzd0pb7EWOMzHO8ELsEXNBHtgCY20dtTXkNo5rsDpy1Qu3OcaHdpcX2qKblp1cFXBnNkHJvFSTq/bmoRyr8kLlVB0W/j47jkTEijhnifnWgeTC/hiQhB/nFGWD7POiW8AViatxKIOdt3mMJOM/OjAVopb5p3n5GolA0Fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5675d609621so4273842e0c.2
        for <linux-m68k@lists.linux-m68k.org>; Tue, 24 Feb 2026 02:32:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771929144; x=1772533944;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o0ECHy7IIkSoMlwhMz4EvuWOcX52LNjoZN4A9XL4RMI=;
        b=aIkuF1lB54lbll+XVZzai0BdgvJqv0llu6485Lvglux4DlUUFMzQtAdzcY8xqsdhhS
         Bv95F8ZbtaeWHWmfkYO88TIs0DmVfTJWW9olJzCIaELAkdUAvpfwQ3ThkVdhgfxiLjvS
         /4ES67iWW5Ed/vox+EO0JqKDAoe50cS+y6bc02g3xawh2JyIxvoz4T3MMUFZQlIc5j1j
         X5iJ8QBvcW98tC9uOe+3s/k3uBCuzUw69SZlu0mJs7Jaa7+pmeHOjLJO3XDAuSFYlMwU
         1nzD/gyEMA9m/knzKCo0Z4UU1iCTRddKwbgPa/Vcf9gGmoOVu0pRY6JvqIGytldFqEID
         qlbA==
X-Forwarded-Encrypted: i=1; AJvYcCWLB7CPsKSYUkKjJFd1JAywxk0qK+o2ilScDOytFre1TY0aaT9RgR9ok8oIPRsvnlaOZ1A+MyrHs2BH@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YykNiicXRY0feZa84R32TGAC8QzvE8IZRNbqxRSXhJbGeYHsPuO
	lqap18C1Sn90ecNsArAcrQJnpw9OKtaPl2A/nEqNcG57AlUKi1qHGjNo3bvTX9Uk
X-Gm-Gg: ATEYQzwYJig6puTNklyTF3tSGM2pn1W5lGOz6xvfsA4aAALVBfQVf3vSnCvU/nNOiyz
	Dz3qFL/p3YXRKmn0x5VPZABacR5ly6ocXnbIiJ8e24OzVljO+Ew9ooMZJAx3eTt/xYDVhpp5haJ
	fv19/yyMDl8cvFL+2jRm0l7m5/VZ3BHHUShzYdyVb5pVQ2C/JbXZz3nALfDA/Er86bO44/q7BWG
	uyAO48/DrZ7q1VkHFekxaJPrqnMg6yFlCBWLo5xdBKr7cnOTOqzulGlxVCH6qvVvlsU2AAZnY7g
	ShKb3pnu+EFlrSV0F9UmcAGpjbGZ4j0YhNNNGvDgtSYhJ4Jo5yU3oZGO5pVzhY2IFu2XRXcc27e
	uAU15BwWQeMIZUMlJhGqrOhVwGelBtaeS9jYAeVxAV690HvRYqH/bxG+fAKmLsfxtVYbgu27IJF
	nEO64GOP7OXUsm0g47Ogvn9Lh8KVybFIQEE3qQrJ1It09Ftk06zHHqSmM7k1mTznQs
X-Received: by 2002:a05:6122:e450:b0:563:667f:9f98 with SMTP id 71dfb90a1353d-568e4867cc7mr5908460e0c.9.1771929144055;
        Tue, 24 Feb 2026 02:32:24 -0800 (PST)
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com. [209.85.221.180])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-568e58f8d17sm11866488e0c.12.2026.02.24.02.32.23
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Feb 2026 02:32:23 -0800 (PST)
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5675d609621so4273828e0c.2
        for <linux-m68k@lists.linux-m68k.org>; Tue, 24 Feb 2026 02:32:23 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVTD1GIYLouNoOFjQoW8bO1V+gtY4xc+iavLl/sMcz8Dq2dkZXY7UAJlOtpBhHkrhDsZCvG0JRVN0sq@lists.linux-m68k.org
X-Received: by 2002:a05:6122:928:b0:55b:305b:4e31 with SMTP id
 71dfb90a1353d-568e48e2688mr5412576e0c.17.1771929143232; Tue, 24 Feb 2026
 02:32:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251213120401.3992567-1-daniel@thingy.jp>
In-Reply-To: <20251213120401.3992567-1-daniel@thingy.jp>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 24 Feb 2026 11:32:12 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWqFfusk_23FBX0YcrkhygjcN=DX25ys6cDyP1_ja2qmQ@mail.gmail.com>
X-Gm-Features: AaiRm53_r1uCks844XnhWZw2-XpoqBE3FDFs5PQtJK-ST0JMVyDOTdyS02-nZXU
Message-ID: <CAMuHMdWqFfusk_23FBX0YcrkhygjcN=DX25ys6cDyP1_ja2qmQ@mail.gmail.com>
Subject: Re: [PATCH] m68k: nommu: fix memmove() with differently aligned src
 and dest for 68000
To: Daniel Palmer <daniel@thingy.jp>
Cc: gerg@linux-m68k.org, linux-m68k@lists.linux-m68k.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Daniel,

On Sat, 13 Dec 2025 at 13:04, Daniel Palmer <daniel@thingy.jp> wrote:
> 68000 has different alignment needs to 68020+.
> memcpy() checks if the destination is aligned and does a smaller copy
> to fix the alignment and then critically for 68000 it checks if the
> source is still unaligned and if it is reverts to smaller copies.
>
> memmove() does not currently do the second part and malfunctions if
> one of the pointers is aligned and the other isn't.
>
> This is apparently getting triggered by printk. If I put breakpoints
> into the new checks added by this commit the first hit looks like this:
>
> memmove (n=205, src=0x2f3971 <printk_shared_pbufs+205>, dest=0x2f3980 <printk_shared_pbufs+220>) at arch/m68k/lib/memmove.c:82
>
> Signed-off-by: Daniel Palmer <daniel@thingy.jp>

Thanks for your patch, which is now commit 590fe2f46c8698bb ("m68k:
nommu: fix memmove() with differently aligned src and dest for
68000") in v7.0-rc1.

> --- a/arch/m68k/lib/memmove.c
> +++ b/arch/m68k/lib/memmove.c
> @@ -24,6 +24,15 @@ void *memmove(void *dest, const void *src, size_t n)
>                         src = csrc;
>                         n--;
>                 }
> +#if defined(CONFIG_M68000)

Ideally, these (and the few existing other checks) should check for
CONFIG_CPU_HAS_NO_UNALIGNED instead.

> +               if ((long)src & 1) {
> +                       char *cdest = dest;
> +                       const char *csrc = src;
> +                       for (; n; n--)
> +                               *cdest++ = *csrc++;
> +                       return xdest;
> +               }
> +#endif
>                 if (n > 2 && (long)dest & 2) {
>                         short *sdest = dest;
>                         const short *ssrc = src;
> @@ -66,6 +75,15 @@ void *memmove(void *dest, const void *src, size_t n)
>                         src = csrc;
>                         n--;
>                 }
> +#if defined(CONFIG_M68000)
> +               if ((long)src & 1) {
> +                       char *cdest = dest;
> +                       const char *csrc = src;
> +                       for (; n; n--)
> +                               *--cdest = *--csrc;
> +                       return xdest;
> +               }
> +#endif
>                 if (n > 2 && (long)dest & 2) {
>                         short *sdest = dest;
>                         const short *ssrc = src;

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
