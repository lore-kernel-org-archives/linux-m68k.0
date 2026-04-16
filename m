Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1826396D10
	for <linux-m68k@lists.linux-m68k.org>; Thu, 16 Apr 2026 11:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776338537; cv=none; b=RJg6sIqm/IGLIDAfGRk6i4ww/9C71e74b9e1+IHHVHrrJNLYKXmuD5p3cw3b8elka7Vuys8LBqsz/SNu4xQw3JRZ88aiyGrckJsktMaTjybMOpCi5lNAxi5zlPNGD5ndRVQiO3lXmyQi2aTYxWuXN7tqzInQ3jbcdywU/AvowJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776338537; c=relaxed/simple;
	bh=FSgVIzpnraycKQsxAztrNgNSM9On/XU1ftEj+pCL/gg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NJP6RNzgWhnTUQfGwxUC0Eyo97XTt6Al9Nxyzb5B0R/onyjaNJG3rQsW+pxdcgXhsmkTZ8m9G5Qm5v4S3ixn3PRxYoPKEBppE4ZSihxEy9eoQvwQHLuUIPU0oMNQa2zNkvb0Ec8sQT0q0UWKTHroLm4xci9e6DJ1wCvNMr5RPl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-5637886c92aso3304264e0c.0
        for <linux-m68k@lists.linux-m68k.org>; Thu, 16 Apr 2026 04:22:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776338535; x=1776943335;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AptjVPQ97g683jPGYCmYUacoTRTAG/3/TQY5t1TSdkk=;
        b=hJT2dJT8wAvDmO2Y88QSW++kcyQthtQhkKAinv71kwPYZpUuRy3uHUNl4nUzM6swNH
         3S+khyoqE1kfIp/oxzVNeBwP7R8KhtbrJ252pbNeudEiYd/k7d6adsOHTYtTu8j/ZDtR
         9EA5NWoT4/feHNX0+R7WQa0LHRPZoJCshIHHyrGH+MqBsP0qnV/VSW3l6YbNZSEVEBTS
         WH1Xz7DznvAUrWiYNlw+R4DJBBFoneyBBvx5TuXwVzoa3rI7uf1IBWkIXEOPXfQalTbp
         gg3kPwOsrCHIkiIvWhIlejIH4dmsTP7I0tpikQxCROgYOd8/Ktn/24M7sjkzta+L3rAp
         FxLw==
X-Forwarded-Encrypted: i=1; AFNElJ9LUE6sOcRDp1VguDUMCf9clKv/8y9fYgcJvyvt/zkq3h/wwj5GHmrR0iA8WwZqWKo/4+n9oJu/fYWg@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YzcwZCCLstLfnOFGcINKUerqticv6/V2CeOErqBN9q6ebBNV10Z
	SpBzOS00ZChyQkEA0uL+y7A7MV4yBMGkLGc2cj1vEogH9fycdQqnlRp79WaVIibd
X-Gm-Gg: AeBDievymKrpFB7SUei6TkpDDn9BNvL1dIU6sO1GmEcqD38c3pAgMGAPzmrtZRpQAvG
	m7MoBUwj7q/ph38VsY25nIbuzGwvw7+mJiaFAAKvx6Q4iKAXpACGVLcQ99aO58TDp5Uf0kodzia
	FFxZkAyJ3FJqKpelJtBf9QnA7XhBNfOI6YovMESy177G7lGE4LcZ5iQx8RXhwww2kl2GjnygTyo
	/fqrrPK6mTGSgLvOqhR+A2Ds4siHBSUZvo75rqmtBMXdmvRVGvMcLtIhrkdjCDAY36OHvEd1BuQ
	SQ4JchvxBGNQeOeQzWjBpZ0oAhUPmAhMCn5/S3LlHRXKhqD6Ma8VU8Y0yH92nNwKA+7KQaJmE15
	/qA4lPiH2dQPsUiTKWjsEZ9HqqIyrzwJNHMXmwNfuG5QIPoE3GH+kfOt3tVn93RF1+DlG2CLZiM
	sD/AUDRWZQe8Gk6khPdcqivC29UZOaacz++96vccFOQX6nAx87Tdi8Q717jkMolNQEgd0t6VRIM
	S0=
X-Received: by 2002:a05:6102:3f86:b0:609:26c7:e4cc with SMTP id ada2fe7eead31-609ff3cc446mr11307908137.12.1776338534790;
        Thu, 16 Apr 2026 04:22:14 -0700 (PDT)
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com. [209.85.221.174])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-612c9c349bdsm2339156137.0.2026.04.16.04.22.13
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2026 04:22:13 -0700 (PDT)
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-56d89f35940so2673670e0c.2
        for <linux-m68k@lists.linux-m68k.org>; Thu, 16 Apr 2026 04:22:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/oOdE3C4ENd/SQxgz/eJCgbAe1s5WsVmJP1rFxL2UCKOb+ekXBsUv+AGDou5/6CqqCcJ3ikuXKJour@lists.linux-m68k.org
X-Received: by 2002:a05:6122:788:b0:56f:1ed6:1d29 with SMTP id
 71dfb90a1353d-56f3bca6059mr11244615e0c.9.1776338533353; Thu, 16 Apr 2026
 04:22:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260410120044.031381086@kernel.org> <20260410120317.910770161@kernel.org>
In-Reply-To: <20260410120317.910770161@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 16 Apr 2026 13:22:02 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX1aShz8esbYzJ7T-0Na6++_Yi315aCiUx0Cnsgod5uUg@mail.gmail.com>
X-Gm-Features: AQROBzBwwjc8yd10cT00Tu5Dl2qrCYQStWr3Lcobhh8coMrpPeCH9vhBSNokYJk
Message-ID: <CAMuHMdX1aShz8esbYzJ7T-0Na6++_Yi315aCiUx0Cnsgod5uUg@mail.gmail.com>
Subject: Re: [patch 05/38] treewide: Remove CLOCK_TICK_RATE
To: Thomas Gleixner <tglx@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, x86@kernel.org, 
	Lu Baolu <baolu.lu@linux.intel.com>, iommu@lists.linux.dev, 
	Michael Grzeschik <m.grzeschik@pengutronix.de>, netdev@vger.kernel.org, 
	linux-wireless@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>, 
	linux-crypto@vger.kernel.org, Vlastimil Babka <vbabka@kernel.org>, linux-mm@kvack.org, 
	David Woodhouse <dwmw2@infradead.org>, Bernie Thompson <bernie@plugable.com>, linux-fbdev@vger.kernel.org, 
	Theodore Tso <tytso@mit.edu>, linux-ext4@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, Uladzislau Rezki <urezki@gmail.com>, 
	Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>, kasan-dev@googlegroups.com, 
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

On Fri, 10 Apr 2026 at 14:18, Thomas Gleixner <tglx@kernel.org> wrote:
> This has been scheduled for removal more than a decade ago and the comments
> related to it have been dutifully ignored. The last dependencies are gone.
>
> Remove it along with various now empty asm/timex.h files.
>
> Signed-off-by: Thomas Gleixner <tglx@kernel.org>

>  arch/m68k/include/asm/timex.h       |   15 ---------------

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org> # m68k

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
