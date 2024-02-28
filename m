Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1BD186241
	for <linux-m68k@lists.linux-m68k.org>; Wed, 28 Feb 2024 21:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709154386; cv=none; b=eV9+6JzUHlfp3EZUJBqxr2Mt+bgcB73feztsdSVqtdyO4jjqwltUH/eX599D2KBF4Gu9gga0Zqj48T/RoSGVGGFXXDjDtjeDTFvFG29nmcVOYy7aZ7tyxnSg6+q1ZM87NtNtmv5xZz0papY1Nwfj14GWITN8G6fwEIqxn88AGn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709154386; c=relaxed/simple;
	bh=KnopYAd5eQKEby5VAzV5cjLQUuk9vdF/QgTymLF2AQs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ck1y9kVWJkORfqXAM2BzmGZfnPhPA7Gdm2EL56FeM7BxOVjR9dBY59f0fzNwXHPcXInR6Q08RyhUHmAHG+A2BaUxgDsPthExQPCVPvQFp/skexpQLMG5Xcvj+XhpNvA7nWIJFse51s33kfv8J+lbU1EC/4mxILT0P0FMXO10svc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ii2gqCxr; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ii2gqCxr"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-412b88e2f07so1258525e9.3
        for <linux-m68k@lists.linux-m68k.org>; Wed, 28 Feb 2024 13:06:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709154383; x=1709759183; darn=lists.linux-m68k.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0a8qBD6vozPIAISnQHJRWdPKOWiVN4p5/6pJZQ2dXnQ=;
        b=ii2gqCxrE1Bom+acT/HqRjg36t5lA1XyutB+h6I2hC5w9oPOMPEZxoAz45fY2D8vPI
         RStQqamvf6ia4519+7WKQlLVsLdSWy9ARBTlhj5ZDGDflMzEorZXVr5trWY9ESqbult/
         xQZU04iZXJq+KHUEu5aOs7pSUTU4WTHmim+cFAdmOhgO0yIr79Cvv9Zf9som5WBmirYA
         /AvhNH37qKQ87+QNkuyzyePsX0qIZgF/ny1BxQ6ICUAkFbPiciTEqzeyrAuo62nzKK6I
         AANH+DBUELBxUALY4OX1KA42nRgiXlKTtbur+aNDrUjmjrSmoAzic7E1TOoCJ8P6jvh/
         AvYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709154383; x=1709759183;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0a8qBD6vozPIAISnQHJRWdPKOWiVN4p5/6pJZQ2dXnQ=;
        b=TtntmzXud0rTRO5ep5sfxL1VnHgrICAOGapwdkv5HPJCBBdOYsreekNTW0gpYvWxi/
         Fyly8RfjwGHehbjDw8hlAKRExV2CVscqZJMQURA83KqBFfObQmMx8u0LFNsWO7RxzsOz
         AW/oVD+Fsgpv5rP9WMtzPOaQvXaKb41Tw8ydYrjx+6C2ZfkAZ1a7SAlB+sUD4ky3eoUr
         y+jHe8VUk7fzMn0E8XTAi7hVZgwls3+Nd5Miv8JkNiAA8HpMmwi1W0t0g1iqPNjV7yeD
         YOvjYExxufrphuaP0nyYGB6ptXYVAWS7KKpndsIGMsU/yZ/H2ZT9OJORVVEMKOFd2FCv
         y0JQ==
X-Forwarded-Encrypted: i=1; AJvYcCVS+vLCvAvhvr++4IEIaZeNcAvqjW1uGjn3zCWF4cbQMRxvbdp0gKNmd7/VQklgz7vExDJPBWoySCcqY2IK9grPyFw8pyYA/CO12fU6CEqk
X-Gm-Message-State: AOJu0YzTdgtKjSR4X1ozT73Hb2bN8gFK37IAmsVB9lb7lsp1I4TjSDHI
	FrqfiG9Py1sez60PGE9qlxDB2X8WFUzrrszuXiZiMPSeMSAwxmTq
X-Google-Smtp-Source: AGHT+IHczATb7A8ZRTaH383CIQ4ejybI9MzL/yjlqycOyBbx2+IYQRI3gE2POfqlKMAC8LKmr3GeXg==
X-Received: by 2002:a5d:618d:0:b0:33d:f51f:2da5 with SMTP id j13-20020a5d618d000000b0033df51f2da5mr46406wru.7.1709154383088;
        Wed, 28 Feb 2024 13:06:23 -0800 (PST)
Received: from localhost (cpc1-brnt4-2-0-cust862.4-2.cable.virginm.net. [86.9.131.95])
        by smtp.gmail.com with ESMTPSA id m1-20020adfa3c1000000b0033d67791dc0sm15568132wrb.43.2024.02.28.13.06.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Feb 2024 13:06:21 -0800 (PST)
Date: Wed, 28 Feb 2024 21:06:21 +0000
From: Stafford Horne <shorne@gmail.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Kees Cook <keescook@chromium.org>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Arnd Bergmann <arnd@arndb.de>, Matt Turner <mattst88@gmail.com>,
	Vineet Gupta <vgupta@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Guo Ren <guoren@kernel.org>, Brian Cain <bcain@quicinc.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Michal Simek <monstr@monstr.eu>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Andreas Larsson <andreas@gaisler.com>,
	Richard Weinberger <richard@nod.at>, x86@kernel.org,
	Max Filippov <jcmvbkbc@gmail.com>,
	Andy Lutomirski <luto@kernel.org>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Kieran Bingham <kbingham@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-um@lists.infradead.org
Subject: Re: [PATCH 3/4] arch: define CONFIG_PAGE_SIZE_*KB on all
 architectures
Message-ID: <Zd-gTf6mvVdPEovO@antec>
References: <20240226161414.2316610-1-arnd@kernel.org>
 <20240226161414.2316610-4-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240226161414.2316610-4-arnd@kernel.org>

On Mon, Feb 26, 2024 at 05:14:13PM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Most architectures only support a single hardcoded page size. In order
> to ensure that each one of these sets the corresponding Kconfig symbols,
> change over the PAGE_SHIFT definition to the common one and allow
> only the hardware page size to be selected.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/alpha/Kconfig                 | 1 +
>  arch/alpha/include/asm/page.h      | 2 +-
>  arch/arm/Kconfig                   | 1 +
>  arch/arm/include/asm/page.h        | 2 +-
>  arch/csky/Kconfig                  | 1 +
>  arch/csky/include/asm/page.h       | 2 +-
>  arch/m68k/Kconfig                  | 3 +++
>  arch/m68k/Kconfig.cpu              | 2 ++
>  arch/m68k/include/asm/page.h       | 6 +-----
>  arch/microblaze/Kconfig            | 1 +
>  arch/microblaze/include/asm/page.h | 2 +-
>  arch/nios2/Kconfig                 | 1 +
>  arch/nios2/include/asm/page.h      | 2 +-
>  arch/openrisc/Kconfig              | 1 +
>  arch/openrisc/include/asm/page.h   | 2 +-
>  arch/riscv/Kconfig                 | 1 +
>  arch/riscv/include/asm/page.h      | 2 +-
>  arch/s390/Kconfig                  | 1 +
>  arch/s390/include/asm/page.h       | 2 +-
>  arch/sparc/Kconfig                 | 2 ++
>  arch/sparc/include/asm/page_32.h   | 2 +-
>  arch/sparc/include/asm/page_64.h   | 3 +--
>  arch/um/Kconfig                    | 1 +
>  arch/um/include/asm/page.h         | 2 +-
>  arch/x86/Kconfig                   | 1 +
>  arch/x86/include/asm/page_types.h  | 2 +-
>  arch/xtensa/Kconfig                | 1 +
>  arch/xtensa/include/asm/page.h     | 2 +-
>  28 files changed, 32 insertions(+), 19 deletions(-)
....
> diff --git a/arch/openrisc/Kconfig b/arch/openrisc/Kconfig
> index fd9bb76a610b..3586cda55bde 100644
> --- a/arch/openrisc/Kconfig
> +++ b/arch/openrisc/Kconfig
> @@ -25,6 +25,7 @@ config OPENRISC
>  	select GENERIC_CPU_DEVICES
>  	select HAVE_PCI
>  	select HAVE_UID16
> +	select HAVE_PAGE_SIZE_8KB
>  	select GENERIC_ATOMIC64
>  	select GENERIC_CLOCKEVENTS_BROADCAST
>  	select GENERIC_SMP_IDLE_THREAD
> diff --git a/arch/openrisc/include/asm/page.h b/arch/openrisc/include/asm/page.h
> index 44fc1fd56717..7925ce09ab5a 100644
> --- a/arch/openrisc/include/asm/page.h
> +++ b/arch/openrisc/include/asm/page.h
> @@ -18,7 +18,7 @@
>  
>  /* PAGE_SHIFT determines the page size */
>  
> -#define PAGE_SHIFT      13
> +#define PAGE_SHIFT      CONFIG_PAGE_SHIFT
>  #ifdef __ASSEMBLY__
>  #define PAGE_SIZE       (1 << PAGE_SHIFT)
>  #else

For the openrisc bits,

Acked-by: Stafford Horne <shorne@gmail.com>
