Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D9E93A2566
	for <linux-m68k@lists.linux-m68k.org>; Thu, 16 Apr 2026 10:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776335411; cv=none; b=LCjfMolUxMjOLeOGrCljvPskOVXnal2IbmhYdCWBQDDyK4t7+R20g7IqoJK90cB3Fe3IT0KDjy6uAInQJwla5yP4gAfsIJaOUFBWDmRjvya1FaXv48RcFlQ+b7jPEzMF7jF3gXg2jQ8sMD4VIn3DPcmbmMUI3cWKbGpOjWuqEPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776335411; c=relaxed/simple;
	bh=Il5EilNKbQmVM1qv4XgxLAe02Z9+zxydkwUqJc2BPRU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WQmcowWAy5ivbca5nWLwCW8/Hq5aHvvS3BvSAM+icf0UpMpCvh+yK07EfPO60USv0ENrq2KK+SG9Mm56QSKa9StQRyZSOwTIFSno2TfpPes/UIK72b20aVwZOYxXiZMWrzu44vWmDokkh+/BHMV+9NdZ9ouD96oq8nFGqfozM+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-4042905015cso4820478fac.0
        for <linux-m68k@lists.linux-m68k.org>; Thu, 16 Apr 2026 03:30:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776335407; x=1776940207;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z9HEDsaws+1AaPEcUyrGjtCss1Kv3jZQFAB8Oib7mmY=;
        b=J4gZd07Eri8OFtV7VvRy9qpG3mTmgQjAIZOuBOCxfLloqnADpglAEn+B1XGLZoVJzJ
         6ygqn13s7H4oxcyKoQE91O9dUA79nu+DTGDyMFJbkGz23zKv8reC3q/8HRB3OeZ4dLrc
         vwQH/6BAUBnvocEh8P08/Q/rgE9YPUjVLFhU0GxpmRmgx7EL8Qgd2FQl3Q5N88Jfvgkb
         ot4Fxk90JzK+1i/VHGOiSz7/RUf7pJi4UdT3baWj3AznZ06b2iv3WotBSuzLq8u7BUUd
         tpC8aEZBtZ1I4i7Ppk0GRUt6zFWYLxgVPu/sEQRhKLydwa8YpKUibiqfnsiMRImiA9D8
         g+Gw==
X-Forwarded-Encrypted: i=1; AFNElJ9YxJl/3RETn34I3Jki/PIun6tSf8ReNzcdR1kzv3cPPjFuCGhZf+b3Iu1NWdt9shMIa+6fKnT4b2JI@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yx/YOojYjukrww4YZqCnRBnyvE41/+cBOVGRiGcUwngJeo4AIny
	qHIY+IpoT55zzwcRCp7tHrZjYq3hdDtay/Ww82d3ttXysjZ11E6dXIvxXosR8+Cr
X-Gm-Gg: AeBDievfZcwjKowor5U/jom+H9YoCOHXCtu8fS6isaqDmM5bQEXgrfRBkMxLsXZTDVW
	fy8plqaoFDgyA15+EtIK/I7iFCXlMuLk9odwLaoTFINGZjH6nMbISzjHauqA6mA0ukflepoNO5E
	mLevNgo93gHMmIy3L+XF5fzrTSLqQO7f9iJK4K9VDmk5L26gLyuOnfj5yx44bgW0DHN2aARCIhB
	TtbxLusqTUkVqgldn9PSOH7VzrQjubEo5LUR3Ubhs6k5eda86BTDVflNpCyFGC2ZqmyngmhsL2F
	MWI88ygYYo82C6rmy+jQEnEHEPHHjegbXNh9D6YsJowfI6wQALcGA4CY+EYtbCdr5qaMijXkC/q
	52FOIol2kHEWK+5DEeMVzvAV4G+7GjUE4tv48zAaymZo0ebDXWgAOPKot06PAlaoG4T3wkubyr4
	VkCUi1OxhpYOa9Hv1eJQd5cTI1Gy+28BDKBHxSrX07LVUtOzN8o82mEKsfDh7dqqIX/R/kNJ8qc
	u1aaw5YxQ==
X-Received: by 2002:a05:6870:b28b:b0:417:2156:ffea with SMTP id 586e51a60fabf-423e0eb1375mr15145611fac.13.1776335407157;
        Thu, 16 Apr 2026 03:30:07 -0700 (PDT)
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com. [209.85.161.46])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-42666bcb7afsm3554783fac.7.2026.04.16.03.30.06
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2026 03:30:06 -0700 (PDT)
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-68207984e66so4333917eaf.2
        for <linux-m68k@lists.linux-m68k.org>; Thu, 16 Apr 2026 03:30:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/xwZee4sMcxl8KVMTNYNjsTaKmtXnVWJsxkng06eFVu4JN5nTKypnTLQ7y+WvCV4ZrXtHCgjmQ+8+e@lists.linux-m68k.org
X-Received: by 2002:a05:6102:c48:b0:608:cd24:354c with SMTP id
 ada2fe7eead31-609fe9b0d22mr11966750137.3.1776335071251; Thu, 16 Apr 2026
 03:24:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260410120044.031381086@kernel.org> <20260410120318.794680738@kernel.org>
In-Reply-To: <20260410120318.794680738@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 16 Apr 2026 12:24:18 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVerN6Pz07CQH+hcvT=-ZD-r9VNrSrGzTQZBEsuecK_ig@mail.gmail.com>
X-Gm-Features: AQROBzDRGGELVSySTko37h6zEj8YoV3p6pwZDCVQUlUW6sZbw_W5mbJzFIh35nQ
Message-ID: <CAMuHMdVerN6Pz07CQH+hcvT=-ZD-r9VNrSrGzTQZBEsuecK_ig@mail.gmail.com>
Subject: Re: [patch 18/38] lib/tests: Replace get_cycles() with ktime_get()
To: Thomas Gleixner <tglx@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Uladzislau Rezki <urezki@gmail.com>, linux-mm@kvack.org, Arnd Bergmann <arnd@arndb.de>, x86@kernel.org, 
	Lu Baolu <baolu.lu@linux.intel.com>, iommu@lists.linux.dev, 
	Michael Grzeschik <m.grzeschik@pengutronix.de>, netdev@vger.kernel.org, 
	linux-wireless@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>, 
	linux-crypto@vger.kernel.org, Vlastimil Babka <vbabka@kernel.org>, 
	David Woodhouse <dwmw2@infradead.org>, Bernie Thompson <bernie@plugable.com>, linux-fbdev@vger.kernel.org, 
	Theodore Tso <tytso@mit.edu>, linux-ext4@vger.kernel.org, Marco Elver <elver@google.com>, 
	Dmitry Vyukov <dvyukov@google.com>, kasan-dev@googlegroups.com, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, Thomas Sailer <t.sailer@alumni.ethz.ch>, 
	linux-hams@vger.kernel.org, "Jason A. Donenfeld" <Jason@zx2c4.com>, 
	Richard Henderson <richard.henderson@linaro.org>, linux-alpha@vger.kernel.org, 
	Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Huacai Chen <chenhuacai@kernel.org>, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	Dinh Nguyen <dinguyen@kernel.org>, Jonas Bonn <jonas@southpole.se>, linux-openrisc@vger.kernel.org, 
	Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org, 
	Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org, 
	Paul Walmsley <pjw@kernel.org>, linux-riscv@lists.infradead.org, 
	Heiko Carstens <hca@linux.ibm.com>, linux-s390@vger.kernel.org, 
	"David S. Miller" <davem@davemloft.net>, sparclinux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Thomas,

On Fri, 10 Apr 2026 at 14:20, Thomas Gleixner <tglx@kernel.org> wrote:
> get_cycles() is the historical access to a fine grained time source, but it
> is a suboptimal choice for two reasons:
>
>    - get_cycles() is not guaranteed to be supported and functional on all
>      systems/platforms. If not supported or not functional it returns 0,
>      which makes benchmarking moot.
>
>    - get_cycles() returns the raw counter value of whatever the
>      architecture platform provides. The original x86 Time Stamp Counter
>      (TSC) was despite its name tied to the actual CPU core frequency.
>      That's not longer the case. So the counter value is only meaningful
>      when the CPU operates at the same frequency as the TSC or the value is
>      adjusted to the actual CPU frequency. Other architectures and
>      platforms provide similar disjunct counters via get_cycles(), so the
>      result is operations per BOGO-cycles, which is not really meaningful.
>
> Use ktime_get() instead which provides nanosecond timestamps with the
> granularity of the underlying hardware counter, which is not different to
> the variety of get_cycles() implementations.
>
> This provides at least understandable metrics, i.e. operations/nanoseconds,
> and is available on all platforms. As with get_cycles() the result might
> have to be put into relation with the CPU operating frequency, but that's
> not any different.
>
> This is part of a larger effort to remove get_cycles() usage from
> non-architecture code.
>
> Signed-off-by: Thomas Gleixner <tglx@kernel.org>

Thanks for your patch!

> --- a/lib/interval_tree_test.c
> +++ b/lib/interval_tree_test.c
> @@ -65,13 +65,13 @@ static void init(void)
>  static int basic_check(void)
>  {
>         int i, j;
> -       cycles_t time1, time2, time;
> +       ktime_t time1, time2, time;
>
>         printk(KERN_ALERT "interval tree insert/remove");
>
>         init();
>
> -       time1 = get_cycles();
> +       time1 = ktime_get();
>
>         for (i = 0; i < perf_loops; i++) {
>                 for (j = 0; j < nnodes; j++)
> @@ -80,11 +80,11 @@ static int basic_check(void)
>                         interval_tree_remove(nodes + j, &root);
>         }
>
> -       time2 = get_cycles();
> +       time2 = ktime_get();
>         time = time2 - time1;
>
>         time = div_u64(time, perf_loops);
> -       printk(" -> %llu cycles\n", (unsigned long long)time);
> +       printk(" -> %llu nsecs\n", (unsigned long long)time);

While cycles_t was unsigned long or long long, ktime_t is always s64,
so "%lld", and the cast can be dropped (everywhere).

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
