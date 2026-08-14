Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D931F4334B8
	for <linux-m68k@vger.kernel.org>; Fri, 14 Aug 2026 08:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786694882; cv=none; b=SoHeVFNPd61DyXLwdKCcEC0xzEGrIumAPUYGsETHVIbn68Dcnh0EYkZWEI9mReYL5DPJW/k/Sp7oj9mTOwi6+5jzl9oD4Yw2GmUgcvcjjgA1N/5PWS151Y846bBuhBjvtjmoKQkpfOg14i9J8TzYApysDIdyb5+ywocTE9Ow3Qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786694882; c=relaxed/simple;
	bh=bccpNupSPa8xKsdSqmt/s4uSMRS8UYoNXbfH0Na+amc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HuOhhcudXltdGaIgqGPF8pc8Vc1xbv5oVsS4INHfrYrhgCyXTLduJdP+uHks9zr7V0lachT5kPXBkC66Jid/DjDVJsscaayhjrvii+X2same0KHTRRBNlTs38yCWUJKaGG/RxQ/uGklzabNP52kJTdEcv8bF89345z1u4MpTm3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-7466771f1caso230505137.0
        for <linux-m68k@vger.kernel.org>; Fri, 14 Aug 2026 01:08:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786694880; x=1787299680;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+HW23azMsHSlwMuNqTvs1EZg7tQBHXtsrNWlz9gKr5E=;
        b=Y/HU17o07dZ9T+leweOJpnT7fHB/nlN7tBGZiOsMJEUm8tIJ/RGj9O/XDjD2UpteiM
         mnyXE66l1qgpj+Ftgi8hPqjaT0P1GtE6rvwnLyGCJKkJyj4bhbqzy2r3wWpILBbcyus4
         uRo+dhT8C/YmHgPjM+1lCrmIHWhR8v1Q7faW5a7ehwXO1CQ7GjK064Ht7fg/ISmDJajI
         WYzeiI9kbbSpY5LUmaAFJFB9/Y34p98yAnZ3OPUzpn1IxpJsS9e0e2QTSNW/ZG2tepF1
         IxBDJXXVwzFodNj3N0JzIln9yPFdY3KPzefzbX2Y5laBjnEHsvMaCLGVV23xVNTdyNQs
         QZLQ==
X-Gm-Message-State: AOJu0YzmdXifBwgmrfD7kVuk99WWnKj/RZ2T8ylt/fKjsr7yjhOIy8b5
	mDqyp/5we5e738w3NlZZ25lIvhiN9BUqNN3oOPT1pmDgWKw3ft99yOB8DMz2I0H/egY=
X-Gm-Gg: AR+sD11pf1ly0O88o75NSqm6gjIwsDfr35BeHt3eewx95AMSdthVAT0XjzYLs7BpPwJ
	256joLxnLzk4Mw7cI5Q2vSrLoXMkYeV3N9K1uFmArmvoHLoJ/q+bFywKBeBPrf3rAyQjugp7EnR
	BoppaJxeicij3+1wcm4OCrFZORy6HBrU4PSwM0pSYh0O+1MEdwCfllibbd9MZrfwxJg1nmK5y+Y
	7dk/BDAZZUuiE9//CV5EFDkdSAWl1PWbzJhDIO7JOgkM0lgNBa2Urj2p6lDsNePawgZ3NwZrJA2
	i285cDQIfKOzq8YB7J6fMMfIzDAPVoBjeKjPEHZDUp3FKicEw0pc4UV7W/9/BZ+RQHCqT4Y2LOw
	hilxAZXXtc7zqQLYTKwHyMkGzrB0aInbYfNGSpsA/g4vfZF5zO2pLDxaN2lKi4P3OvGuMug91GV
	vDci98Mmfk0caenwPAyrHI2gxSI93jVie8/XC9f3UZLxEetM5UQPht+3ZFS06b9w2ntw31Zygo6
	f4lSxSbFXG+u7dASR/5ss8s3A==
X-Received: by 2002:a05:6102:3fa8:b0:76d:154:7f42 with SMTP id ada2fe7eead31-76f2b2fa5dfmr551716137.5.1786694879540;
        Fri, 14 Aug 2026 01:07:59 -0700 (PDT)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-76efab22359sm1010054137.12.2026.08.14.01.07.58
        for <linux-m68k@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Aug 2026 01:07:59 -0700 (PDT)
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-963f63fe025so163797241.0
        for <linux-m68k@vger.kernel.org>; Fri, 14 Aug 2026 01:07:58 -0700 (PDT)
X-Received: by 2002:a05:6102:548c:b0:740:177:f357 with SMTP id
 ada2fe7eead31-76f2b301b18mr649484137.6.1786694878515; Fri, 14 Aug 2026
 01:07:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260814031745.17140-1-schmitzmic@gmail.com> <20260814031745.17140-6-schmitzmic@gmail.com>
In-Reply-To: <20260814031745.17140-6-schmitzmic@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 14 Aug 2026 10:07:46 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXQJht5SZf0b2C-=dhYk9NTFZoQE_vKmptE+=TS1w=ZWw@mail.gmail.com>
X-Gm-Features: AcwNN1UA-NhTLI2LqlpH_0orbcV-pVGAaIBk6rZRoThwznKdYpmjMznckvUNd2s
Message-ID: <CAMuHMdXQJht5SZf0b2C-=dhYk9NTFZoQE_vKmptE+=TS1w=ZWw@mail.gmail.com>
Subject: Re: [PATCH 5/5] m68k: Add support for Svethlana
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: linux-m68k@vger.kernel.org, Miro Kropacek <miro.kropacek@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi Michael,

Thanks for your patch!

On Fri, 14 Aug 2026 at 05:18, Michael Schmitz <schmitzmic@gmail.com> wrote:
> From: Miro Kropacek <miro.kropacek@gmail.com>
>
> The SuperVidel FPGA contains an OpenCore ethernet package. Add
> platform device data and other necessary definitions to support
> this device on Atari.
>
> The ethoc module must be enabled separately by the user.
>
> Signed-off-by: Miro Kropacek <miro.kropacek@gmail.com>
> Reviewed-by: Michael Schmitz <schmitzmic@gmail.com>
> Link: https://lists.debian.org/debian-68k/2026/08/msg00000.html

Since you're now in the path to upstream, you should add your SoB here

> --- a/arch/m68k/atari/config.c
> +++ b/arch/m68k/atari/config.c
> @@ -34,6 +34,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/usb/isp116x.h>
>  #include <linux/module.h>
> +#include <net/ethoc.h>
>
>  #include <asm/bootinfo.h>
>  #include <asm/bootinfo-atari.h>
> @@ -748,6 +749,62 @@ static struct platform_device *atari_ethernat_devices[] __initdata = {
>  };
>  #endif /* CONFIG_ATARI_ETHERNAT */
>
> +#ifdef CONFIG_ATARI_SVETHLANA
> +/*
> + * SVEthlana: OpenCores 10/100 Mbps Ethernet MAC in the SuperVidel FPGA,
> + * handled by the ethoc driver. Requires SuperVidel firmware version 10
> + * or newer (Ethernet DMA).
> + *
> + * The MAC can only DMA within the SuperVidel DDR RAM, so the packet
> + * buffers are carved out of the top of the DDR; the framebuffer lives
> + * at the bottom.
> + */
> +
> +#define ATARI_SVETHLANA_PHYS_ADDR      0x80012000
> +#define ATARI_SVETHLANA_IRQ            141     /* vector 0xc5 */
> +
> +#define ATARI_SV_VERSION_PHYS_ADDR     0x8001007c
> +#define ATARI_SV_DDR_END               0xa8000000
> +/* 128 packet buffers of 1536 bytes each, the maximum ethoc supports */
> +#define SVETHLANA_BUF_SIZE             (128 * 1536)
> +
> +static struct resource svethlana_resources[] = {
> +       [0] = {
> +               .name   = "ethoc-regs",
> +               .start  = ATARI_SVETHLANA_PHYS_ADDR,
> +               .end    = ATARI_SVETHLANA_PHYS_ADDR + 0x7ff,
> +               .flags  = IORESOURCE_MEM,
> +       },
> +       [1] = {
> +               .name   = "ethoc-buf",
> +               .start  = ATARI_SV_DDR_END - SVETHLANA_BUF_SIZE,
> +               .end    = ATARI_SV_DDR_END - 1,
> +               .flags  = IORESOURCE_MEM,
> +       },
> +       [2] = {
> +               .name   = "ethoc-irq",
> +               .start  = ATARI_SVETHLANA_IRQ,
> +               .end    = ATARI_SVETHLANA_IRQ,
> +               .flags  = IORESOURCE_IRQ,
> +       },
> +};
> +
> +static struct ethoc_platform_data svethlana_platform_data = {
> +       .phy_id         = -1,
> +       .big_endian     = true,

Does SVEthlana contain a unique MAC address?  Without this, you probably
get a different random MAC, and thus a different IP address from DHCP.

> +};
> +
> +static struct platform_device svethlana_device = {
> +       .name           = "ethoc",
> +       .id             = -1,
> +       .num_resources  = ARRAY_SIZE(svethlana_resources),
> +       .resource       = svethlana_resources,
> +       .dev            = {
> +               .platform_data  = &svethlana_platform_data,
> +       },
> +};
> +#endif /* CONFIG_ATARI_SVETHLANA */
> +
>  #ifdef CONFIG_ATARI_ETHERNEC
>  /*
>   * EtherNEC: RTL8019 (NE2000 compatible) Ethernet chipset,
> @@ -892,6 +949,20 @@ static int __init atari_platform_init(void)
>         }
>  #endif
>
> +#ifdef CONFIG_ATARI_SVETHLANA
> +       {
> +               void __iomem *sv_version;
> +
> +               sv_version = ioremap(ATARI_SV_VERSION_PHYS_ADDR, 4);
> +               if (sv_version) {
> +                       if (hwreg_present(sv_version) &&
> +                           (__raw_readl(sv_version) & 0x3ff) >= 10)
> +                               rv = platform_device_register(&svethlana_device);

This unconditionally writes to rv, potentially overwriting an error
code stored by a failed EtherNAT registration attempt.

> +                       iounmap(sv_version);
> +               }
> +       }
> +#endif
> +
>  #ifdef CONFIG_ATARI_ETHERNEC
>         {
>                 int error;

The rest LGTM.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
