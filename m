Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFE903DA7F4
	for <linux-m68k@lists.linux-m68k.org>; Fri, 10 Apr 2026 15:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775835133; cv=pass; b=bcn7/oBiQDPDpm/2oRS1uGpTQS2vYQWdfDfc104sqJegT9sOVZsnFgI33JFdAfZ4bExsqF213Xr9UspTg53TUGBTwAF0OUBDe9gvfkPxbjJR7AyYyjcXIjdB+yGC85ZNn4tLFxAS560bvUiBs/A2X6AHn0eAnxxW4VsYQxF/wBg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775835133; c=relaxed/simple;
	bh=OBQJPBhzAm5teFuL1it4zrQEsej5woZw67yMwyO4d8U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mQEcVluRzq/5194PqeO3Fq4KS1hdM8QQklAzH6EXvmELEJOkk/1IUrKU/qYvXcFoet0d7se4RccrkB3GE7w5l5NDLSDXahzDWE1z8wKbl6vuv4Rsp5wqhp1cDf/GG8hjmUgB7vhWZJOYcUSC97IsNhhQLdRZektrrlB+M938yqs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b=OawHYIr3; arc=pass smtp.client-ip=74.125.82.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b="OawHYIr3"
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1271257ae53so9590782c88.1
        for <linux-m68k@lists.linux-m68k.org>; Fri, 10 Apr 2026 08:32:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775835131; cv=none;
        d=google.com; s=arc-20240605;
        b=DFHIMz3Rd1xOlHdPO+LSorJnvfiWY4dqZ2erw0X7CCXnZg2FdUHlahZ/wKHgsOYut/
         pybJDUYlOKlvfiC7Uo6IC4wWsjyUQPSbwJ1JBteCLHkY0N/J8dCSmPNmDfQe4T2XLa4S
         64eDU05FGnXXk/8CLUmBwyf6bz2RFY8lc036oPmPjflEC5uB2giKMNdWWCPDZl4v4SjM
         PALpjn/Rz1nYQnLusFgpi4D+YMqJcJxwVRz1v5BoF8nzN59fYteTBItIHsi0Q6v6gIQQ
         IgLlH7COYoigsFx614LXdfZMqKNcTEWtg4PqRiy4fBhY1TmVO+z++OZiowwP4VN+MUHf
         +t8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=OBQJPBhzAm5teFuL1it4zrQEsej5woZw67yMwyO4d8U=;
        fh=cjAVfbSPdFfC8awDjGhPMuVfh4mU5Z4T4nSNaZJ0sjg=;
        b=RPvK12qyj6/y29G/ca3+SPeFvrTmzCSPIIvKCh30m88OIEqu329R1OPr7hz/0Uk9vG
         i5rrAfXPv3kc5vdMbyTFJ+YamxtPYrsovYMCa33KMvhhipFKkPOQvNq2Pg3Gk24ckUq/
         TMK0viVCdllHRhJqERBdpn5JiGQ+xPP2s0ln/vRyJsyWQ0u41b3pww17wjR/lAvBbFGG
         LQlhTGxnw3YgHz1rSazI2tzpArMKWqa8REmPp1yRc2yzoQSq+2TMb4tmFxG+WCBc6uIF
         FRzIM48f/U+ZI4yK6vd8+oaT3rqwjJlZnDZ8uaFgXgVYIO2CUeeoG4zO/wMj+kdxscAG
         jV6w==;
        darn=lists.linux-m68k.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google; t=1775835131; x=1776439931; darn=lists.linux-m68k.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OBQJPBhzAm5teFuL1it4zrQEsej5woZw67yMwyO4d8U=;
        b=OawHYIr38dwRLE0DZN+wW9NjAU5pDbU0sOc3xZ8uI+JYK5jxbe1wv9zfxmjwznHJG/
         zQnBViBWG1EwrjlNQ3OqnkMOeZZRozwN2oCMvgT4mYzms9WXYQTehnddK1wdhH8u2hdD
         a47aCaV7h+461s9c3iV3hmZBbRVR1wJ212vQE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775835131; x=1776439931;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OBQJPBhzAm5teFuL1it4zrQEsej5woZw67yMwyO4d8U=;
        b=ZvTZ9O++eKZhy6/QGdmPS7FVFAySuI3FQLaZ+MB9fdaLrY4+APr3+dRK/qDkTPKic/
         cINUq1eVnqlEUN7YMjKdm+qZWhGLvZkHOPVHG6XmX5zJjfsJxSURR2OQwfW910j9dNdM
         I1iASfag55MS2OerVLUMQIFmtITNEwpiMopHxO7sMvxUWsVWsau/fSOi1DH2fb+s9hsW
         qNlRBIOPPqIkkZ3tZiShe0ELEPctSr4Wah5LIAYofPaHVQD+t9sKhLjXz+JHD/IdqvuS
         Y41LsJD3VYLFVPOx138LLbk371z8CRoU4YQ2NGpcPwvjJO32/fK2N3AFh4IamTtjoRR9
         M8UQ==
X-Forwarded-Encrypted: i=1; AJvYcCUNSkgWwWQ+lWhOISBlCc6Xgurhk1D4FzUQWdjFjcAr0BHLinddRjEdYfKMQZS3z3r1SbgQheSWtatM@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YwSMDT9X4e3YWZdb/E/t3MGBMlFS5jmwYx2JVZ7id8Nsow9TW1V
	C0AMHYnoEBY97/TMD4l44jC7uMYIN23o8wo1XM1bo5WOsNaGvcLeIE0oQiRU0yKMtEtP3Tr917p
	Pr+Vd/7VlpOTd9XXXXK8Vrq4JUY1jg1cvcoKhXLMx/A==
X-Gm-Gg: AeBDiesh9DSi10LkNHciEkU2Wf91wAVu3YhTJadgzms6Oc9dx6uSSigY/3CQ/MH75Hy
	1db1zL63yjHw0u9xOa/TBg7uacSyHwR30nAKKvqlJm409UlAqT2VZfJUzhdrmsv3qvuPuSuxOGu
	+1miicAMPc9KPHsBRf32zJSCi5LsPpjoPL4C+A8xrGWOqDW5E+TpBuxD12cjFWurzj7EtW1tct7
	CQEq/Jybd0/IYgriVJnumkvoZuB9UcVoE6dqEX/tdBH0Yr9Vv27RQ+UOcxU6QCV/im3AUEcSU6g
	lw+r
X-Received: by 2002:a05:7022:6097:b0:128:ccb7:7fa3 with SMTP id
 a92af1059eb24-12c34f069f8mr2159203c88.34.1775835130696; Fri, 10 Apr 2026
 08:32:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260410120044.031381086@kernel.org> <20260410120319.397219631@kernel.org>
In-Reply-To: <20260410120319.397219631@kernel.org>
From: Daniel Palmer <daniel@0x0f.com>
Date: Sat, 11 Apr 2026 00:31:59 +0900
X-Gm-Features: AQROBzAnX-XEClLFV-qWYFUzCuq4P43sNZviESiWFI1yCPXm2VtVZ2QkaUGJoPY
Message-ID: <CAFr9PXk7qK8-2JWrrfgXHoS9JWTRL+WobLjmAesyCE9VLL8ZyQ@mail.gmail.com>
Subject: Re: [patch 27/38] m68k: Select ARCH_HAS_RANDOM_ENTROPY
To: Thomas Gleixner <tglx@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	linux-m68k@lists.linux-m68k.org, Arnd Bergmann <arnd@arndb.de>, x86@kernel.org, 
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
	loongarch@lists.linux.dev, Dinh Nguyen <dinguyen@kernel.org>, 
	Jonas Bonn <jonas@southpole.se>, linux-openrisc@vger.kernel.org, 
	Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org, 
	Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org, 
	Paul Walmsley <pjw@kernel.org>, linux-riscv@lists.infradead.org, 
	Heiko Carstens <hca@linux.ibm.com>, linux-s390@vger.kernel.org, 
	"David S. Miller" <davem@davemloft.net>, sparclinux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi

On Fri, 10 Apr 2026 at 21:39, Thomas Gleixner <tglx@kernel.org> wrote:
>
> The only remaining usage of get_cycles() is to provide
> random_get_entropy().
>
> Switch m68k over to the new scheme of selecting ARCH_HAS_RANDOM_ENTROPY and
> providing random_get_entropy() in asm/random.h.

I have built and booted this on my Amiga 4000 and it apparently still
works so FWIW:

Tested-by: Daniel Palmer <daniel@thingy.jp>
