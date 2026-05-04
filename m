Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07BFC2D780E
	for <linux-m68k@lists.linux-m68k.org>; Mon,  4 May 2026 07:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777879084; cv=none; b=aE2wzQTG0lELkpUBKF1kKVEEXttXX4bVC5uFMscE4XvZEgoChhJzpJY+lvoC678gUgoC6zdKmvPIx2iwaHZgqCZFVS6vSrHcpBiEmeKck5V+NhFPZrLJh2pO30gE1gAl6Cs5PJ57bkIxZH/rabOft7I7sfjGffXjVHITPL4etUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777879084; c=relaxed/simple;
	bh=CMrJsvIhP01E1Mw80JOSLylNMYl0j59WTaxBub2X+Tg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P9/VhLwS/xpFltR9WJzWxEmlzqMkfH9V7vXKnWN3F7UXZ3qypwbHHFuflJ1QVjw2A0rBBvpEabbMzxnPj3/LlIVjnWeMfO6bU9mx1IVxMz6xAGaTxvTJlMtZ4yWZzT0UcDZhGToUrOBtymGLX5Gh2SEvcuCcLn1E0xBH83Gpuc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5751136c561so1223773e0c.1
        for <linux-m68k@lists.linux-m68k.org>; Mon, 04 May 2026 00:18:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777879082; x=1778483882;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EqJnH27Nqs4Tge038gpHam0aW3zoxzMcWOn5yIYA1EE=;
        b=BcjY+dAygVDWCji2FHO/va1O4StL6L1HZuvMERbJLrzsPTC55VP3rdlcDK7RL8IlAj
         KOo8aKoV6PhnVVSZXGbXrkJ1pKfk2eHQzrbDOhQK8myO0RmDCL6MVWOD82TxcieAMJJH
         pqx01wtKWVgin+ucNjUUy6vhTyzOf4QSBMziPHlvahUo/bSC72L+kRh4LSOi7bZj1M7t
         YvAb24VHijWeANyPeZ9i2I/XQN/EFSQ4ksH28F515GUwDRYFLH2U0yirL+R04G0+9n7H
         SqlyxHhX6hGOV0G98pZ3U0bwh0LSiVBRxP95JnwpX9q358omjLjB8ZdX8bQz9s+dPB/7
         4mqw==
X-Forwarded-Encrypted: i=1; AFNElJ8+dZ+qdQWr15QX5WzVLEPki3xhn+ux1mkZJJRHZ3Pqwoec8o0x9n7w2IdW3C6bioP0OkTK2dIHvpyR@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YzHRHdG+xaICba9iC/vlJ0pxcelTR7U+FJNP7TB0lah+JftXXCL
	WdfFwEHHrEcypGjd3NMLOAGIoN9OqPfPYOWfRh58M+8k7S1Z08M9qGxbU1CPU5Jr
X-Gm-Gg: AeBDies/8F02uc4VXR1lo861KlnIFLedLJy/CYqoWc6rmQyOBIE07xYO81+ulr1lPch
	HHo0jeVk2gTzsA6QHaPH0khYZjfdGLBjBr/CPnba0weQxDL0mzpd4X6j66CmmpBvTyQodF4J3sh
	lb0QrHOrbjPcdXyZmqyoa3YZbd1Hjh/vKz2sLauR9CQNFoorlyI1hPkkONonJZDr6XY+9wZo1N7
	pcF5o/Kh4BNsDiq5q7W0bz6wIGQFYKTPHEXe4jca8KlXcGRYK0nST30YxyWqOTnqZ3wwNdBeABa
	2gk63O6g9c/nvJivSDYIgutU6He570vGBtikBhp/R6LxIaFTsZ88yet1VpE6s0bgF5CFCRfQ2h2
	5oqoyTOLhHQHa3ctWCYaThwWQW6T7d8c2VAOOlXIX4G0UMh2GFu42MoJM7YDi2GpOIBGWTKWeOJ
	sCcpOx5t6zjhaaHbtSOFLdTVLtHWRPmHo4DVKywXK7DylGUhjnpcNcf4uylOgAmgt89eKLct8=
X-Received: by 2002:a05:6102:104f:b0:62f:365c:fa00 with SMTP id ada2fe7eead31-62f365cfd3bmr663601137.12.1777879081690;
        Mon, 04 May 2026 00:18:01 -0700 (PDT)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com. [209.85.222.50])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-62ef2b9720asm2016811137.6.2026.05.04.00.18.01
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 May 2026 00:18:01 -0700 (PDT)
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-95ce0cf2d4bso1658235241.0
        for <linux-m68k@lists.linux-m68k.org>; Mon, 04 May 2026 00:18:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9yOLZKMX4FiA/THGVPLlA5p8e7KPHFfH/CDsQiQXrkcQEbv+HcwxufBRpCHtLIDPWrDmK8LHdWdQ7u@lists.linux-m68k.org
X-Received: by 2002:a05:6102:5793:b0:5ff:ecd0:1d1f with SMTP id
 ada2fe7eead31-62aff203d00mr6650977137.19.1777879081069; Mon, 04 May 2026
 00:18:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260430120532.305308-3-thorsten.blum@linux.dev>
In-Reply-To: <20260430120532.305308-3-thorsten.blum@linux.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 4 May 2026 09:17:50 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUiMMXrWtsZ5erkoQoYh_4dq1CYD-RiSkZXSVwQAtxo6A@mail.gmail.com>
X-Gm-Features: AVHnY4KAWLEHTrfWUh9qfqDhcLkCBJuZ6fXDZ0LL_eTxBV38W6Tbr9dm-7gys74
Message-ID: <CAMuHMdUiMMXrWtsZ5erkoQoYh_4dq1CYD-RiSkZXSVwQAtxo6A@mail.gmail.com>
Subject: Re: [PATCH] drivers: dio: replace deprecated strcpy with strscpy in dio_init
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: Kees Cook <kees@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org
Content-Type: text/plain; charset="UTF-8"

Hi Thorsten,

On Thu, 30 Apr 2026 at 14:09, Thorsten Blum <thorsten.blum@linux.dev> wrote:
> strcpy() has been deprecated [1] because it performs no bounds checking
> on the destination buffer, which can lead to buffer overflows. While the
> current code works correctly, replace strcpy() with the safer strscpy()
> to follow secure coding best practices.
>
> Indent multiple lines using tabs instead of spaces, and use pr_info()
> and avoid continuation logging while at it.
>
> [1] https://www.kernel.org/doc/html/latest/process/deprecated.html#strcpy
>
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>

Thanks for your patch!

Please split this in two patches, as the "while at it" became much
larger than the main change.

> --- a/drivers/dio/dio.c
> +++ b/drivers/dio/dio.c
> @@ -178,7 +178,7 @@ static int __init dio_init(void)
>         if (!MACH_IS_HP300)
>                 return 0;
>
> -        printk(KERN_INFO "Scanning for DIO devices...\n");
> +       pr_info("Scanning for DIO devices...\n");
>
>         /* Initialize the DIO bus */
>         INIT_LIST_HEAD(&dio_bus.devices);
> @@ -247,18 +247,19 @@ static int __init dio_init(void)
>                         dev->id = prid;
>
>                 dev->ipl = DIO_IPL(va);
> -               strcpy(dev->name, dio_getname(dev->id));
> -                printk(KERN_INFO "select code %3d: ipl %d: ID %02X", dev->scode, dev->ipl, prid);
> +               strscpy(dev->name, dio_getname(dev->id));
>                 if (DIO_NEEDSSECID(prid))
> -                        printk(":%02X", secid);
> -                printk(": %s\n", dev->name);
> +                       pr_info("select code %3d: ipl %d: ID %02X:%02X: %s\n",
> +                               dev->scode, dev->ipl, prid, secid, dev->name);
> +               else
> +                       pr_info("select code %3d: ipl %d: ID %02X: %s\n",
> +                               dev->scode, dev->ipl, prid, dev->name);

Looks like a good opportunity to start using "%u" to print dev->ipl,
which is u8.

>
>                 if (scode >= DIOII_SCBASE)
>                         iounmap(va);

The rest LGTM to me.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
