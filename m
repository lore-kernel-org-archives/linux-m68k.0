Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ABDD20297C
	for <linux-m68k@lists.linux-m68k.org>; Sun,  6 Jul 2025 10:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751797658; cv=none; b=oXv67gk4YQTun3oI9TiwYb7Ck4r+Tm95rLuR7GWFt4SNOnOK3YWCr8u+VPa81ThR0pquSZrK7d0koaFMSCgGFjp+VReSfzmDIgIIMKMGF1yST5UXmFWXq2X+n7f8RmNJ4PXm/RC70uSS02C2c7pSl2TEWWWWrxmTB+vpGGcLamk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751797658; c=relaxed/simple;
	bh=6uMSUsF4i7E2EkwCaC9wZQFxdNNM8J8izZHp0INrJIM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FE9BRCNiHYEOEmzNabI9KPpkMpsmmwPwwLN/VT7c7FQ/sEqOB6DSac1wLI2+SEouanT5c2aR0Ddxn/B9Y15gCy7E0hOeamB+67d3I5X+zZhDPs5DyWmAue/FTHk6we9DXZ11MKD8or7jKvmpH//ILubQHjcNQSEK0UWqlAgxzes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-53140c33563so1846776e0c.3
        for <linux-m68k@lists.linux-m68k.org>; Sun, 06 Jul 2025 03:27:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751797654; x=1752402454;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o8Wcac1yphsCtx5A+S7DbTVhEWfZCEpLCH1Zp2uzm3M=;
        b=YEQSQK+sYLfN/N9AP9vyW4JDrI9lN6B9lsbKMDojxIgRdUnfcPbKsL/y0Z+td7ibek
         wtjqd49rPRcW7kmUGHFglA5m6PQsGzB6wUphgBh7kQzC9EbOoUIc2LwGRijfm5Q3B12/
         1m0hQoX5XguiV8tf14ZQm2Cv2ThXbYOeZb3ZE+myMCQjTwYd2Wq3WCz5/5QN6S7rjLPJ
         huqoXSPVlsPgGPw3+jCyTUc9XxV4qUniCX6h0kqy6Ek+l/QDIOGkEoYk7o9y7Q2T5FKv
         klfkwknI9LE658pTHUpI+ovdxxwHEhuJBLFaTzzHRsNYNtdd3rqePU3bmhCWlTyPk5VO
         K9mA==
X-Forwarded-Encrypted: i=1; AJvYcCWAGJQKrKxlmPoc/DM6OssuVy2sykq9YTVXQe42sWxUMe5As2m3Ub9pBSdra3AK8f/458+V37xqmRAw@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YyKEIDYuXJ8+hAz9Wv7Gre3b/3uieKQdhBq4/YKWOHQFDhQa6MS
	g9nxEsdI3IdMT2n1c/CE4zJeGhMzyHKxT7hoH65UsdVPDaFb+DyfU3fqz1ngdbk3
X-Gm-Gg: ASbGnctemPzcxzRB4WcbI4AXS0kOynD417Xbji/XG1EsBdnZg9QiCIuYnnI/RHR0PwR
	xCdpv5z1g42l1GZaAZ940jMqDhZP4q9PKbQC/WWc+vypRCoxbsNpI9px6UvWM/ABGS3Zm5cVi+q
	GcnDpwl9LGysNsy3qbpx64H4WiTC7D6QmGmPFq3rzla1drJQ8Du/c7sci3gde8TV1srzDOFTH88
	vQBFkA8TYMALDXvgi+vodYGpArqv2GKWmomyHx9PKUbP7O34JpOSzKEIRrUFIqoQoToD7+ydD6t
	dwqQQvQKl2ldfO2LdDKWXXI3IYXehOQOrRnGj82alaszrVrZlNaDT/4M/xAhAS2miwC3YWv/eoc
	yH++YzIILqRJhE4HCr0XgAGeT7nj1
X-Google-Smtp-Source: AGHT+IEYUH0OcwbsRizI29pEliNoaljG5wQbngHR/QHuPlzk70OiJ5YPD8JeaE+w4MleJABt0pcNSQ==
X-Received: by 2002:a05:6102:5112:b0:4df:9e8b:8cad with SMTP id ada2fe7eead31-4f2f23fe6dbmr4692312137.22.1751797653700;
        Sun, 06 Jul 2025 03:27:33 -0700 (PDT)
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com. [209.85.221.179])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-886e939c42dsm1036171241.17.2025.07.06.03.27.33
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Jul 2025 03:27:33 -0700 (PDT)
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-52b2290e290so1367481e0c.1
        for <linux-m68k@lists.linux-m68k.org>; Sun, 06 Jul 2025 03:27:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU0gMvRatRitNS7t6u2cJOC3JaKzXAkO69387sVehVxo8M8M36zz0zsVsCQma9SmfQsT7SvF/CaPHrP@lists.linux-m68k.org
X-Received: by 2002:a05:6102:cca:b0:4e9:c7c8:5e24 with SMTP id
 ada2fe7eead31-4f2f244f7e2mr4690242137.25.1751797652899; Sun, 06 Jul 2025
 03:27:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <d1d4328e5aa9a87bd8352529ce62b767731c0530.1743467205.git.fthain@linux-m68k.org>
In-Reply-To: <d1d4328e5aa9a87bd8352529ce62b767731c0530.1743467205.git.fthain@linux-m68k.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 6 Jul 2025 12:27:20 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXY5xv+aqZQmMQ0rDnDWjEF=O0dEaun8x8=J0kb1LZWBQ@mail.gmail.com>
X-Gm-Features: Ac12FXzwvaf9ptBZ91EIzsqZ1yptuiRs-rvpbLE-5KasykM-HyCxgAn1UjEkTKk
Message-ID: <CAMuHMdXY5xv+aqZQmMQ0rDnDWjEF=O0dEaun8x8=J0kb1LZWBQ@mail.gmail.com>
Subject: Re: [PATCH v2] m68k/mvme147: Don't unregister boot console needlessly
To: Finn Thain <fthain@linux-m68k.org>
Cc: Daniel Palmer <daniel@0x0f.com>, linux-m68k@lists.linux-m68k.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Finn,

On Tue, 1 Apr 2025 at 02:40, Finn Thain <fthain@linux-m68k.org> wrote:
> When MACH_IS_MVME147, the boot console calls mvme147_scc_write() to
> generate console output. That will continue to work even after
> debug_cons_nputs() becomes unavailable so there's no need to
> unregister the boot console.
>
> Take the opportunity to remove a repeated MACH_IS_* test. Use the
> actual .write method (instead of a wrapper) and test that pointer
> instead. This means adding an unused parameter to debug_cons_nputs() for
> consistency with the struct console API.
>
> early_printk.c is only built when CONFIG_EARLY_PRINTK=y. As of late,
> head.S is only built when CONFIG_MMU_MOTOROLA=y. So let the former symbol
> depend on the latter, to obviate some ifdef conditionals.
>
> Cc: Daniel Palmer <daniel@0x0f.com>
> Fixes: 077b33b9e283 ("m68k: mvme147: Reinstate early console")
> Signed-off-by: Finn Thain <fthain@linux-m68k.org>

Thanks for your patch!

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
i.e. will queue in the m68k tree for v6.17...

> --- a/arch/m68k/kernel/early_printk.c
> +++ b/arch/m68k/kernel/early_printk.c
> @@ -55,16 +46,12 @@ early_param("earlyprintk", setup_early_printk);
>   * debug_cons_nputs() defined in arch/m68k/kernel/head.S cannot be called
>   * after init sections are discarded (for platforms that use it).
>   */

... with the above comment moved just before the "if"-test below.

> -#if !(defined(CONFIG_SUN3) || defined(CONFIG_M68000) || \
> -      defined(CONFIG_COLDFIRE))
>
>  static int __init unregister_early_console(void)
>  {
> -       if (!early_console || MACH_IS_MVME16x)
> -               return 0;
> +       if (early_console && early_console->write == debug_cons_nputs)
> +               return unregister_console(early_console);
>
> -       return unregister_console(early_console);
> +       return 0;
>  }
>  late_initcall(unregister_early_console);
> -
> -#endif

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
