Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F0A61C5F27
	for <linux-m68k@lists.linux-m68k.org>; Wed,  7 Jan 2026 10:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767781203; cv=none; b=R6nO6LrDYx73a33JOupkt1RtD8EZ6LmPBHeQvMwiOiRzb33aSq0TjAFl9R9UNHJDY8VyI1ZnEDQ3VXsa9klNf9/yU2JIgQstNyHT55fCmf9ULdcmwhkQL3gyprWmU7XbQY/xMZVpA+EfBrzLor91X9krEV7I9fkccx23gi5yBqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767781203; c=relaxed/simple;
	bh=LHpq31jb131mLfSGnY4Ziq9pimILVbLw9BqnoqFcvrk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=szUXjwSYkByOOZ9lzk/OPPuA5GIdV0ZMouSQXG1dscX7ADDCZ7UfHZkHWJi5dHWGJ7TJ4GYZ+oNETwdWwSvbSMHWY1LzNvW32AmeC0yHk9ClnGxqKLfrcmE+w/jHcT5FHvVDv4aR87obIC5EO17b8z2KA3SBUeEQTSVqdsjkUEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5597330a34fso1282092e0c.2
        for <linux-m68k@lists.linux-m68k.org>; Wed, 07 Jan 2026 02:20:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767781200; x=1768386000;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cczIBCc+dLHuZXTLgaBKViNuxTCEGSUaGSx91WGct5I=;
        b=sd90uWd946fz/MUoArZ0sUGbwo4d7IIcmaXnsK10SAXmeHScF4YN2kC1Ys9Ly9eowi
         ClFhnrF60eCKQY9b6agNwxDkbAUYIZitK4HaGEfpH96xEhcuWweGWgLv3SVll7wcHAJB
         LM35lr0l2MjjjLHQ16XgIaxW4Yx1t15mOEszqkJeaI4JyBUUJdDT8u2Zi/9TSuCU3Ug/
         cttiWUyhGOzfE9VWUlgFfwh//dVuRZgvT1W/BJwwoZeyzf5F/QQ1IGtKmafm70tG5g2j
         Nflb3Ph3kHg5EZ1ghMuQqhkKckkelsOec9lWthwYzsgs51XIzoOjzOUBwXL6qvayaTxh
         oiqQ==
X-Gm-Message-State: AOJu0YzH5QYXChFRmUN2/BVu34dAW7XqbX6e5n5i3/mgoxfMgzx9C9HV
	TvDHXQDv/O4cwnHIQXMbay+gVH1xiXYK0OQUtPPW5dvkRa1U0dRvPmKjdNUhdp+3
X-Gm-Gg: AY/fxX5jGSrKVh8fbSJQtJK3EUKPRDuGncczIxevwwVFZPknTg4nNeHyXBFtoDqJAsK
	lGN8CE9OFOfiL4gPSOo2HxuacePx9Gbz5fd/12rc89i/L9DNgruqhqctDEOeJHyrEyeDoQETii+
	ce+Yv/YSNZ7x+6IajlpYTxV23vFUg9c2e1a0jrj1P37bYRDBfw4BvVFN1I0yilkgXMZ43wffddJ
	XkxgsZnG0masq/YE5Qg2PhyN9iJmNjAamNG8u+UrHRlfsXjBJD1AE+MHChTUjQG4nXA2B72lQ2j
	V6KHMsfEFPib6U32/Ey+oSCDfLdAG+6BtW9ZaHJ9xLxfjq3run9CwlodVCuCV0uFYFaEULF37Z5
	JAX5OQLqi5tg1a8nPZTlxGWTJb8e7X8bioHMeAVdizQo933RbD7KShWHevirMmW/xBDiDfEsC5/
	Zl8sn9t6w2rkYogZfdbSw4oObXszuPWsuEDrRkh+ux1P8I5zE7
X-Google-Smtp-Source: AGHT+IHczUE32eg8D7gtB/VldGc9qL/AJy5NK5yN88I4z0oTvf8CDrkyqYeSv0GKg4Bc2oF+vfmieA==
X-Received: by 2002:a05:6122:d1d:b0:559:77c0:d46f with SMTP id 71dfb90a1353d-5634735bcf3mr674092e0c.0.1767781199929;
        Wed, 07 Jan 2026 02:19:59 -0800 (PST)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5634ca16da7sm834053e0c.17.2026.01.07.02.19.59
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jan 2026 02:19:59 -0800 (PST)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-5ebe501b49dso1254464137.1
        for <linux-m68k@lists.linux-m68k.org>; Wed, 07 Jan 2026 02:19:59 -0800 (PST)
X-Received: by 2002:a05:6102:38c6:b0:5db:d487:2ef8 with SMTP id
 ada2fe7eead31-5ecb69382e9mr732064137.20.1767781199325; Wed, 07 Jan 2026
 02:19:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260107092101.24545-1-lukas.bulwahn@redhat.com>
In-Reply-To: <20260107092101.24545-1-lukas.bulwahn@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 7 Jan 2026 11:19:48 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW5nz33Or4Ygi8CQ2zT+qCp2r20w5xk9PB9y8N7HRPf3w@mail.gmail.com>
X-Gm-Features: AQt7F2rQTCG-Z1jjSRVwvE9mi0RLGpBvUlwI-btWe4ni3tZhuIEHpZY6d0UY4q0
Message-ID: <CAMuHMdW5nz33Or4Ygi8CQ2zT+qCp2r20w5xk9PB9y8N7HRPf3w@mail.gmail.com>
Subject: Re: [PATCH] m68k: defconfig: Clean up references to non-existing configs
To: Lukas Bulwahn <lbulwahn@redhat.com>
Cc: linux-m68k@lists.linux-m68k.org, kernel-janitors@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Lukas Bulwahn <lukas.bulwahn@redhat.com>, 
	Greg Ungerer <gerg@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"

CC gerg (coldfire/m68knommu)

On Wed, 7 Jan 2026 at 10:21, Lukas Bulwahn <lbulwahn@redhat.com> wrote:
> From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
>
>   - Drop 'CONFIG_I2C_COMPAT is not set' (removed in commit 7e722083fcc3
>     ("i2c: Remove I2C_COMPAT config symbol and related code"))
>   - Drop 'CONFIG_SCHED_DEBUG is not set' (removed in commit b52173065e0a
>     ("sched/debug: Remove CONFIG_SCHED_DEBUG"))
>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
> ---
>  arch/m68k/configs/amcore_defconfig   | 2 --
>  arch/m68k/configs/m5475evb_defconfig | 1 -
>  arch/m68k/configs/stmark2_defconfig  | 1 -
>  3 files changed, 4 deletions(-)
>
> diff --git a/arch/m68k/configs/amcore_defconfig b/arch/m68k/configs/amcore_defconfig
> index 88832e9cd7cb..f310b5dacfd8 100644
> --- a/arch/m68k/configs/amcore_defconfig
> +++ b/arch/m68k/configs/amcore_defconfig
> @@ -61,7 +61,6 @@ CONFIG_SERIAL_MCF_BAUDRATE=115200
>  CONFIG_SERIAL_MCF_CONSOLE=y
>  # CONFIG_HW_RANDOM is not set
>  CONFIG_I2C=y
> -# CONFIG_I2C_COMPAT is not set
>  CONFIG_I2C_CHARDEV=y
>  # CONFIG_I2C_HELPER_AUTO is not set
>  CONFIG_I2C_IMX=y
> @@ -83,7 +82,6 @@ CONFIG_ROMFS_BACKED_BY_BOTH=y
>  CONFIG_PRINTK_TIME=y
>  # CONFIG_SECTION_MISMATCH_WARN_ONLY is not set
>  CONFIG_PANIC_ON_OOPS=y
> -# CONFIG_SCHED_DEBUG is not set
>  # CONFIG_DEBUG_BUGVERBOSE is not set
>  # CONFIG_CRYPTO_ECHAINIV is not set
>  # CONFIG_CRYPTO_HW is not set
> diff --git a/arch/m68k/configs/m5475evb_defconfig b/arch/m68k/configs/m5475evb_defconfig
> index 2473dc30228e..9be4dae84ebf 100644
> --- a/arch/m68k/configs/m5475evb_defconfig
> +++ b/arch/m68k/configs/m5475evb_defconfig
> @@ -46,6 +46,5 @@ CONFIG_EXT2_FS=y
>  # CONFIG_PROC_PAGE_MONITOR is not set
>  CONFIG_ROMFS_FS=y
>  CONFIG_ROMFS_BACKED_BY_MTD=y
> -# CONFIG_SCHED_DEBUG is not set
>  CONFIG_BOOTPARAM=y
>  CONFIG_BOOTPARAM_STRING="root=/dev/mtdblock0"
> diff --git a/arch/m68k/configs/stmark2_defconfig b/arch/m68k/configs/stmark2_defconfig
> index f9ecb1dcc060..515d9b208b10 100644
> --- a/arch/m68k/configs/stmark2_defconfig
> +++ b/arch/m68k/configs/stmark2_defconfig
> @@ -90,4 +90,3 @@ CONFIG_PRINTK_TIME=y
>  # CONFIG_SECTION_MISMATCH_WARN_ONLY is not set
>  CONFIG_SLUB_DEBUG_ON=y
>  CONFIG_PANIC_ON_OOPS=y
> -# CONFIG_SCHED_DEBUG is not set
> --
> 2.52.0

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
