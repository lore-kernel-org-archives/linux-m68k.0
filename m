Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C0E81353F5
	for <linux-m68k@lists.linux-m68k.org>; Wed,  6 Mar 2024 16:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709742244; cv=none; b=NGY74GFenEgpsQLXTz6BF87HYZanYSB6Tqwumz0uTJQ3Ke3X2e+eXHSza9yzpXBWY2ar1iHLWfr2q+4x+HI3afHN60HJddNIkahu0b/Q7qmx7hqjj1FjF/34P2rcXbizRx0Nh8yo8c9ol+kxzBUycenCsvFueioV6XGv5L3OA7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709742244; c=relaxed/simple;
	bh=n9KzasEm6N9ttGn6mpPVBfxcCLfd5JbkdxZ4Q6PxRSg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bz6Gf2E9dNbXSY9BxxNGgTxfBEKN9FnF0hJCKco693FtQDgGBCxcIGgIOpD4Mp+Ij8MklCK1PaH0VMflVKxlJYO51W3nZ3482HhO41EyJvxcHMa/j3lSpNc7i1BTvZstqPTDtPlN8dBLnUa0qTkGhhPwNaxxkB/Z9FTu3WDj/xQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-6ddf26eba3cso5272964a34.0
        for <linux-m68k@lists.linux-m68k.org>; Wed, 06 Mar 2024 08:24:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709742241; x=1710347041;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D7JdIeS9zNSJ+HV+qdpk2QYV7GDhHiD75PCrvSyuiH4=;
        b=TiBA9xBvw1BJIeZbKRrB3LG4dJ5DyFYXY233Iusm357w/Mwj/vf8tGmwi0PGkscaDX
         4/+foPJ3Z+i6MEzKQmWlmjl6n2RuBulxK44mn7AQF+WS41l+wnoglLUeFGImWlAqZEVH
         jn1cMcnEtcdUcsGW+1P+wZlth/V+Cw+0I1NH7MnGHbjBQTn9rH/Ku80jISFNfOr+w+h9
         B+miJ8tGNu+tMH2iV4CG5i/VmcDGVxEeDWL9G80SD0YWQ4FqZPIzRsLMygYhZzWoADE+
         6j/me6X5cdnFRcMbMU+rt6UbiuE3FBzyZOWmmEuhvWb0TOnO2UuBxc4WKqYrrpv3eP1U
         E08g==
X-Forwarded-Encrypted: i=1; AJvYcCXr3kNZ1UazkJZOUQFCuzGf6jFEgocT64zpqWzqXv0zLndUVCrDPj73s1aH0x90d9PwfnXy3Q2lqmhui6oMsuvVfsTwyNUq+GgKPnlS+n/G
X-Gm-Message-State: AOJu0Yw9qfOg4e0KMtl2FSFatKw5LXTHnxzzVfhlig0aM6iHHo5wfUka
	skzccFpAgImbMTqppRcVKXFR+6hK2UZc2yTb/STI986hBRqjiNifeN32rHIqW2s=
X-Google-Smtp-Source: AGHT+IFAlyruBByzBwjk6mPq7lAhoYKb2tk7ZHrUb/cUaY2v2rmm4JaASMDzo733J54JmHLFes7/SA==
X-Received: by 2002:a9d:3e0d:0:b0:6e4:9456:6b04 with SMTP id a13-20020a9d3e0d000000b006e494566b04mr5786629otd.5.1709742240862;
        Wed, 06 Mar 2024 08:24:00 -0800 (PST)
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com. [209.85.167.180])
        by smtp.gmail.com with ESMTPSA id z5-20020a05683020c500b006e12266433csm1496023otq.27.2024.03.06.08.24.00
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Mar 2024 08:24:00 -0800 (PST)
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-3c1ec2c07ffso1909708b6e.3
        for <linux-m68k@lists.linux-m68k.org>; Wed, 06 Mar 2024 08:24:00 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXLW8JMMBwSji6tyMcmPZjPCtyGuuOR8I7OxrbHmaruXkN1RlQ0pxOVnm/OEsmcKCSATPD4iof+rwQW/zww0VbqsQvhcnmkeoWyRfUrMd3x
X-Received: by 2002:a25:580b:0:b0:dcf:c7ef:e4e0 with SMTP id
 m11-20020a25580b000000b00dcfc7efe4e0mr11968959ybb.1.1709742220242; Wed, 06
 Mar 2024 08:23:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240306141453.3900574-1-arnd@kernel.org> <20240306141453.3900574-4-arnd@kernel.org>
In-Reply-To: <20240306141453.3900574-4-arnd@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 6 Mar 2024 17:23:28 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU5ut09=b+5Qti6CD17XOOmsm+VtfA7TKac7qHNOBC2-A@mail.gmail.com>
Message-ID: <CAMuHMdU5ut09=b+5Qti6CD17XOOmsm+VtfA7TKac7qHNOBC2-A@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] arch: define CONFIG_PAGE_SIZE_*KB on all architectures
To: Arnd Bergmann <arnd@kernel.org>
Cc: Anna-Maria Behnsen <anna-maria@linutronix.de>, Thomas Gleixner <tglx@linutronix.de>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Kees Cook <keescook@chromium.org>, 
	Arnd Bergmann <arnd@arndb.de>, Matt Turner <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Guo Ren <guoren@kernel.org>, Brian Cain <bcain@quicinc.com>, 
	Huacai Chen <chenhuacai@kernel.org>, Michal Simek <monstr@monstr.eu>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Helge Deller <deller@gmx.de>, 
	Michael Ellerman <mpe@ellerman.id.au>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Palmer Dabbelt <palmer@dabbelt.com>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Andreas Larsson <andreas@gaisler.com>, 
	Richard Weinberger <richard@nod.at>, x86@kernel.org, Max Filippov <jcmvbkbc@gmail.com>, 
	Andy Lutomirski <luto@kernel.org>, Jan Kiszka <jan.kiszka@siemens.com>, 
	Kieran Bingham <kbingham@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-um@lists.infradead.org, Heiko Carstens <hca@linux.ibm.com>, 
	Stafford Horne <shorne@gmail.com>, Johannes Berg <johannes@sipsolutions.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 6, 2024 at 3:15=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wrot=
e:
> From: Arnd Bergmann <arnd@arndb.de>
>
> Most architectures only support a single hardcoded page size. In order
> to ensure that each one of these sets the corresponding Kconfig symbols,
> change over the PAGE_SHIFT definition to the common one and allow
> only the hardware page size to be selected.
>
> Acked-by: Guo Ren <guoren@kernel.org>
> Acked-by: Heiko Carstens <hca@linux.ibm.com>
> Acked-by: Stafford Horne <shorne@gmail.com>
> Acked-by: Johannes Berg <johannes@sipsolutions.net>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> No changes from v1

>  arch/m68k/Kconfig                  | 3 +++
>  arch/m68k/Kconfig.cpu              | 2 ++
>  arch/m68k/include/asm/page.h       | 6 +-----

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
