Received: from mail-vk1-f194.google.com (mail-vk1-f194.google.com [209.85.221.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7751533D6
	for <linux-m68k@lists.linux-m68k.org>; Tue,  6 Jan 2026 11:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767700106; cv=none; b=phuWz5qAPhQe3gD8kC01ysGrFcShso79/MyU7xv4qz3POTKOuXmo5aTI+r2nUrItTikF/UDgxHgwsS09ZvCNHfFDL6MRRGgeDkAMmEBvy8lHB5UKPlUqEiEgHbK/hV8C5v2u85gcYJX3YluALL2S57jkwclFAbIBVuKTU8GIBYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767700106; c=relaxed/simple;
	bh=cy90DhPfHZ+Icz6r89LIwxLLHRAHP0I0oJNrsBe1qfk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NIQb+Nh+pvC/EUqlfDBNcZVVx8V4Ysm1RHT3tZXieySMSv7mDd0Fvkk73KoDn/DPz1qglabUmyLyB+jOKum0L1gEpDY/hgEx5qbfHvn/AMTbn5NlNQCLNGpijAI5ROESAjm7hxrqhuudX6BBeXu2rKYhZgctws8OJCFqEx5MQlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f194.google.com with SMTP id 71dfb90a1353d-55b2a09ff61so280869e0c.2
        for <linux-m68k@lists.linux-m68k.org>; Tue, 06 Jan 2026 03:48:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767700103; x=1768304903;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eme3GKSVVTwekk5ahSqs0LbJRLjiKfIn3cO6kiKk5PI=;
        b=vyAznfu3qLq5ch2PQLGETTOxoh5SCtO56GzAC4u+mRjxGfsLQgrN108yHh7qh8LfO9
         bpOxbmVzqZhpfccvRuJwdEjqRXv2dTQYY2/HSYN1laQ+yLgom37xq84wLSGUxVS83HRD
         iKaTk4NKJNXvEF3kVHL9tC0kdX8Pzl1wZcdJcHcMg04lnRloNLjPBCCpxZDmqd2Ki4NX
         iXZ/4fwnaK+faJbocuQqwRJacT/Avncw6RVolFDIKnBu/ItOe7wruw0dFbItAeCYlVVc
         iHYddC+OU5qPEEupRKYfWl/P6ZL1hQ3jYx29Sw0FBgi1POLh5FpOSS+zDHQd3JwWOXhv
         suTA==
X-Forwarded-Encrypted: i=1; AJvYcCVhsPnRehmlpyV3EnSK7jg4lJIHYsQ6LOwl3rwppK6P1PrB4Y1qGfM5civVulOAFSxJW2TlLXcTDLdG@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yx0EiSwNTvGkTorQ9bmwPssaqxvwxzUYUYlgSLRQuJAc4WrU5wK
	AhOOtxm51QCzpoQFfGWe7JeeDmuaM2Yit/pM8bWnau5nvhPsDw737xY/SBXst8Ba
X-Gm-Gg: AY/fxX4+xdSk4sRz+9nygtZAwwHENEkNhGONYdkwve27L1gZB6lWBg6iMd4o8cIMnK0
	hRYXSUrYpZtrRr4z4cTMgwfu02CiegRkzKE2JG9roJvdRSynxYIDFKoCRv+NUcD0eEwHeKZFdm/
	cnxiGP+5NdIAVdWaiecQHSPuOUIwly2AsVqVyoJN8d0M1BYiMJ2itEfYBCPnvgZkN8JT1wGtkDn
	qmzPjRyF5VDMou9eMBRLP0db7GB0nYxjBsKIjfYh6h+duyQ7p6S96dX288IfOKur3RBOmEeygjE
	0/LjVAnE18XUPQ3J0spZ1qdMtsw8ABWxjXs9Ixf3Rhu2q5HSZsWsWSeQ0UqWu22zutYC7vzWwZJ
	Vk9En9ncEp4A9nsynXSNEp6CrqxAHjqi+T0M0Jts2UHNuyVKXShRVONL4wdMEDDHKYRVap/KmUD
	YsuKH5Fb9dcfO07bRgcEZv9VkFSAhXs5ZKyH9E0UvLkQw560Qr
X-Google-Smtp-Source: AGHT+IG8wbfvfqT+janbqr8UqX+cqSY7P7/hIA7Ay2xLNw7qJfT+ARsUxBXhflezXdI6qJJ6uz+H5A==
X-Received: by 2002:a05:6122:3d06:b0:55b:9c3f:55f with SMTP id 71dfb90a1353d-5633958dc77mr673042e0c.18.1767700103337;
        Tue, 06 Jan 2026 03:48:23 -0800 (PST)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com. [209.85.222.41])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5633a1ea753sm581801e0c.4.2026.01.06.03.48.22
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jan 2026 03:48:22 -0800 (PST)
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-93f6bd3a8f4so245749241.3
        for <linux-m68k@lists.linux-m68k.org>; Tue, 06 Jan 2026 03:48:22 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUKZZW5E5Ycfj6EycAN4RofyefC7qf6KXrdbJ3adhYlPJ3M/jTVWba73td5c95eR6jwyrql9hC3QAk6@lists.linux-m68k.org
X-Received: by 2002:a05:6102:3588:b0:5db:d411:20cd with SMTP id
 ada2fe7eead31-5ec744a8304mr863867137.28.1767700102655; Tue, 06 Jan 2026
 03:48:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260101-custom-logo-v2-0-8eec06dfbf85@kernel.org> <20260101-custom-logo-v2-6-8eec06dfbf85@kernel.org>
In-Reply-To: <20260101-custom-logo-v2-6-8eec06dfbf85@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 6 Jan 2026 12:48:11 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVy48F5HAfqfJgbY83KDAztb9YWTqm8mT1ntTfj0311oA@mail.gmail.com>
X-Gm-Features: AQt7F2oMgVPDZ6yIPBL4v-hrcVUiy-32V0b_EbYL6M5HBMZvyW9vi5iymuHAylg
Message-ID: <CAMuHMdVy48F5HAfqfJgbY83KDAztb9YWTqm8mT1ntTfj0311oA@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] video/logo: move logo selection logic to Kconfig
To: Vincent Mailhol <mailhol@kernel.org>
Cc: Helge Deller <deller@gmx.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, linux-fbdev@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-sh@vger.kernel.org, linux-m68k <linux-m68k@lists.linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"

Hi Vincent,

CC linux-m68k

Thanks for your patch, which is now commit bd710b3da7308cb1
("video/logo: move logo selection logic to Kconfig") in fbdev/for-next.

On Thu, 1 Jan 2026 at 16:26, Vincent Mailhol <mailhol@kernel.org> wrote:
> Now that the path to the logo file can be directly entered in Kbuild,
> there is no more need to handle all the logo file selection in the
> Makefile and the C files.

This may do the wrong thing when booting a multi-platform kernel.

>
> The only exception is the logo_spe_clut224 which is only used by the
> Cell processor (found for example in the Playstation 3) [1]. This
> extra logo uses its own different image which shows up on a separate
> line just below the normal logo. Because the extra logo uses a
> different image, it can not be factorized under the custom logo logic.
>
> Move all the logo file selection logic to Kbuild (except from the
> logo_spe_clut224.ppm), this done, clean-up the C code to only leave
> one entry for each logo type (monochrome, 16-colors and 224-colors).
>
> [1] Cell SPE logos
> Link: https://lore.kernel.org/all/20070710122702.765654000@pademelon.sonytel.be/
>
> Signed-off-by: Vincent Mailhol <mailhol@kernel.org>

> --- a/drivers/video/logo/Kconfig
> +++ b/drivers/video/logo/Kconfig

> @@ -61,6 +63,12 @@ config LOGO_LINUX_CLUT224
>  config LOGO_LINUX_CLUT224_FILE
>         string "224-color logo .ppm file"
>         depends on LOGO_LINUX_CLUT224
> +       default "drivers/video/logo/logo_dec_clut224.ppm" if MACH_DECSTATION || ALPHA
> +       default "drivers/video/logo/logo_mac_clut224.ppm" if MAC

E.g. an m68k multi-platform kernel including Mac support will scare
non-Mac users into thinking their machine was assimilated by the
Apple Empire...

> +       default "drivers/video/logo/logo_parisc_clut224.ppm" if PARISC
> +       default "drivers/video/logo/logo_sgi_clut224.ppm" if SGI_IP22 || SGI_IP27 || SGI_IP32
> +       default "drivers/video/logo/logo_sun_clut224.ppm" if SPARC
> +       default "drivers/video/logo/logo_superh_clut224.ppm" if SUPERH
>         default "drivers/video/logo/logo_linux_clut224.ppm"
>         help
>           Takes a path to a 224-color logo in the portable pixmap file

> --- a/drivers/video/logo/logo.c
> +++ b/drivers/video/logo/logo.c
> @@ -48,59 +48,21 @@ const struct linux_logo * __ref fb_find_logo(int depth)
>         if (nologo || logos_freed)
>                 return NULL;
>
> -       if (depth >= 1) {
>  #ifdef CONFIG_LOGO_LINUX_MONO
> -               /* Generic Linux logo */
> +       if (depth >= 1)
>                 logo = &logo_linux_mono;
>  #endif
> -#ifdef CONFIG_LOGO_SUPERH_MONO
> -               /* SuperH Linux logo */
> -               logo = &logo_superh_mono;
> -#endif
> -       }
>
> -       if (depth >= 4) {
>  #ifdef CONFIG_LOGO_LINUX_VGA16
> -               /* Generic Linux logo */
> +       if (depth >= 4)
>                 logo = &logo_linux_vga16;
>  #endif
> -#ifdef CONFIG_LOGO_SUPERH_VGA16
> -               /* SuperH Linux logo */
> -               logo = &logo_superh_vga16;
> -#endif
> -       }
>
> -       if (depth >= 8) {
>  #ifdef CONFIG_LOGO_LINUX_CLUT224
> -               /* Generic Linux logo */
> +       if (depth >= 8)
>                 logo = &logo_linux_clut224;
>  #endif
> -#ifdef CONFIG_LOGO_DEC_CLUT224
> -               /* DEC Linux logo on MIPS/MIPS64 or ALPHA */
> -               logo = &logo_dec_clut224;
> -#endif
> -#ifdef CONFIG_LOGO_MAC_CLUT224
> -               /* Macintosh Linux logo on m68k */
> -               if (MACH_IS_MAC)

MACH_IS_MAC can be a runtime check.

> -                       logo = &logo_mac_clut224;
> -#endif
> -#ifdef CONFIG_LOGO_PARISC_CLUT224
> -               /* PA-RISC Linux logo */
> -               logo = &logo_parisc_clut224;
> -#endif
> -#ifdef CONFIG_LOGO_SGI_CLUT224
> -               /* SGI Linux logo on MIPS/MIPS64 */
> -               logo = &logo_sgi_clut224;
> -#endif
> -#ifdef CONFIG_LOGO_SUN_CLUT224
> -               /* Sun Linux logo */
> -               logo = &logo_sun_clut224;
> -#endif
> -#ifdef CONFIG_LOGO_SUPERH_CLUT224
> -               /* SuperH Linux logo */
> -               logo = &logo_superh_clut224;
> -#endif
> -       }
> +
>         return logo;
>  }
>  EXPORT_SYMBOL_GPL(fb_find_logo);

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
