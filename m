Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B4DE22CBFE
	for <linux-m68k@lists.linux-m68k.org>; Thu, 27 Feb 2025 11:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740654343; cv=none; b=Y46DAOkPWUe0+L2OQQLNBLuGAK890Dbe2iM9N8HFRupCxzY2+dwPCichNpPV0OWXPZ01jiNV3q7/I7VKoiavDyhHN47GYkllgszxYi9j7Hbm/MdelA0VWOuQxo12c16TttN/jGqgRh7Z3riYoIpW0/K50jzGiIT45zoos/CxkVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740654343; c=relaxed/simple;
	bh=MhZ8GViVcNwezLnWisT12m9Ev684ayMaSWy/I8zydqc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Bybi/zPz6WEjFPzvDi4EjPkhO8gdPzvik7fJoYb3i8+Dt16aAH20fOqLMfTGvYWzck/ikbOV9WUdMWuWxSuWLvss9HQ/ESJl+9mlzbI+/QiT8UhkLAL9TY4dLAMir3JIyYhEIhgdsIUNUqy6F1mraSCaDLc6+M9+R6aidJU9MWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-51eb1818d4fso868613e0c.1
        for <linux-m68k@lists.linux-m68k.org>; Thu, 27 Feb 2025 03:05:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740654339; x=1741259139;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YOYklwSkIF61N5d7gWtZ1gNcm4VTd2AmRb5PcLCTllw=;
        b=XmAgRKgR4s5xSLAdZx8jrw7hFosHiFj1rShyOY2VGVKUhfaBrhF+wjEm5jItupvVkd
         y+i1xmibSJv0vXKRiXSZALIcepeSYK9morpxR1VN3n3bdYxmqU3L58ZSGwYfhawcvPtq
         hk2iL0tMVTSFtPkrb8AxMQe/eOJqr/r2/5lz5wBeiGd9TBt0KM1GHy0afDsZDrae120x
         rMol3PIu6fQTGVNMdrkcKXtrIDlbFKTc5Ln+yEgpa4ycEqkU71ZAlJL8U6JsHNz2N5kM
         Ootm09vXwwcvJJ4BQ1/bkF3ldh4rf+g0TyzIGR7I/myuJLCo/whVsRY974+ddIWBqKF/
         Q9IQ==
X-Gm-Message-State: AOJu0Yx8Lj6+78OPnHgmFHx93IaL05SdXNRcbgfcmBXDyv7jC2tCrSkC
	jP6T5K+8FdCcX+F1kyELv6Xy9k0hJ0+WIRefuVFy/6Z0VLb/o0cT3YS/QAky
X-Gm-Gg: ASbGncsMmMRNPP6+BFWXIxIqsxcLOR7i2G0Gtb29GT94OXPV/wM588ISK4Gc8ngYfE8
	cxpmc841bb0uztSZQX7iC1ss0dIuvVSHwbPG5lFMUGAhTL6oijyQkk3jb7wZmEckrRbGXJybnQG
	TU+20wh1v8CZc2xq0s8qMeJFuIm0R6EGuL7ihQ/f/BecZkODjApykwWwwdC6UjyETy6lKuBDlHY
	P52uaFYwAtHZsEwHC9Szv7Yfq3EG8WpmGJPNitDfwaKDSHf8JFfDTqQIBjmmqhIeesYPpTHA2sJ
	ktUt38aVMLNjBNZt/2EgE3iElkSEZoIe4I1b/cqDqt5UI2q0huBLLuiYyCY24One
X-Google-Smtp-Source: AGHT+IGLMdYM600uw1Tl4tQJoqu0EgCTPHfIrHsbV6VGq9TeIKPFRgGujbiNyXnNNcn3b1gvFKL00A==
X-Received: by 2002:a05:6122:32d5:b0:516:1ab2:9955 with SMTP id 71dfb90a1353d-5224cced0b6mr4056974e0c.6.1740654339165;
        Thu, 27 Feb 2025 03:05:39 -0800 (PST)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com. [209.85.222.48])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5234c08c73dsm173396e0c.33.2025.02.27.03.05.38
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Feb 2025 03:05:38 -0800 (PST)
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-86929964ed3so653049241.0
        for <linux-m68k@lists.linux-m68k.org>; Thu, 27 Feb 2025 03:05:38 -0800 (PST)
X-Received: by 2002:a05:6102:508f:b0:4bc:82f:b4bc with SMTP id
 ada2fe7eead31-4c01e30be50mr4589548137.22.1740654338310; Thu, 27 Feb 2025
 03:05:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250226-m68k-rtc-v1-0-404641ec62e6@igalia.com> <20250226-m68k-rtc-v1-2-404641ec62e6@igalia.com>
In-Reply-To: <20250226-m68k-rtc-v1-2-404641ec62e6@igalia.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 27 Feb 2025 12:05:26 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW_13wOxD0Q0PVCUXBwC9y8iKXTcwH=m5tvX856S9ZU1w@mail.gmail.com>
X-Gm-Features: AQ5f1Jo7H3mkaD1WVTZTrun2RLr9xWvAG0froFsy3cqeS4yVfaaDlHw2vtfEAEI
Message-ID: <CAMuHMdW_13wOxD0Q0PVCUXBwC9y8iKXTcwH=m5tvX856S9ZU1w@mail.gmail.com>
Subject: Re: [PATCH 2/2] m68k: rtc: dp8570a: make it a proper RTC class driver
To: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-rtc@vger.kernel.org, 
	kernel-dev@igalia.com
Content-Type: text/plain; charset="UTF-8"

Hi Thadeu,

On Wed, 26 Feb 2025 at 13:27, Thadeu Lima de Souza Cascardo
<cascardo@igalia.com> wrote:
> In the past, each rtc implementation had to rewrite the same ioctls in
> order to be compatible. But since 2006, a common RTC interface has been
> introduced. Use it for the last user of RTC_MINOR.
>
> Signed-off-by: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>

Thanks for your patch!

> --- a/arch/m68k/bvme6000/rtc.c
> +++ b/arch/m68k/bvme6000/rtc.c

>
>  static int __init rtc_DP8570A_init(void)
>  {
> +       struct platform_device *pdev;
> +
>         if (!MACH_IS_BVME6000)
>                 return -ENODEV;
>
>         pr_info("DP8570A Real Time Clock Driver v%s\n", RTC_VERSION);
> -       return misc_register(&rtc_dev);
> +
> +       pdev = platform_device_register_data(NULL, "rtc-generic", -1,
> +                                            &dp8570a_rtc_ops,
> +                                            sizeof(dp8570a_rtc_ops));

Doesn't this conflict with the creation of the same device in rtc_init()[1]?

On BVME6000, mach_hwclk is set:

    arch/m68k/bvme6000/config.c:    mach_hwclk           = bvme6000_hwclk;

> +
> +       return PTR_ERR_OR_ZERO(pdev);
>  }
>  module_init(rtc_DP8570A_init);

[1] https://elixir.bootlin.com/linux/v6.13.4/source/arch/m68k/kernel/time.c#L144

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
