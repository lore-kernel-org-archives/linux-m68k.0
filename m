Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61B2C229B01
	for <linux-m68k@lists.linux-m68k.org>; Tue, 11 Mar 2025 21:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741729310; cv=none; b=dqDrMz/seSDntQdr4JiuORYNbXLB7WovCYw8m2tejfTqGnw2Dpc2p7vQUl3Oke/fZtSkhK0bZ/22ph63+PReBpDuwS79djTjQ/Ol0zwk/CKgTQwLq9uJEzw3BQcUDO7Biu+85/zdquf1o9VgLGb/Lz8CsXRe91FzsEzlQzF/Vxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741729310; c=relaxed/simple;
	bh=TXKNlSM0TKSxzdZrN7xHlcVd6ac01W3pV0YwZDnIsdI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q/xNBxrg8vlhrhPZWUl9rMChk+aspwHL3R0eLYqQrQyf6dhnUlKf3at6xe1NYbyblodT+yQ0xMl6cWw5ibP0NzkDt5ujnOHWULUbqnI73TE/ukbgZqGhkpdlTRAko+e/cvnpM09Pu50zbPV+Rb6H0130/890Kwg0exk0m0NWdCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-524038ba657so270890e0c.0
        for <linux-m68k@lists.linux-m68k.org>; Tue, 11 Mar 2025 14:41:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741729304; x=1742334104;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OJ/N6RDNJhsKkhEU6U2fwKdV9v3px1FNP1P5wQQOOck=;
        b=ikHt0vi5YeHdzPcRZzOHD6346emxqxVGWGGMph/lVhNw6//gXsD0pnkNBrV7Gjoh9W
         3uJ2RAB2wWT90dzCQxbHrBpC+zDawGQLZbfnN2dvYTwkO9mxDSsUr2Zwb2sLnkzZYglR
         OZifxXg7ugdsMM6yszRgxDmb2Lwu7UMSwgOTQ89+D8uUui98DLZQ4mEZHn3TiXRzZCYZ
         xk0/ah+VIG+oFICPOm1+v6d6z7zm7/Hz/5ILbEV/cTZSP+46ZP5XNXiMoaDRDXZa2pN5
         XlgsmbXoJG6Y7S4zkUypoAq/tLQZb2BtO+5+wKOq1WVsP0/Jv6vqC7W9kar4Ii2J3vSH
         4qmQ==
X-Forwarded-Encrypted: i=1; AJvYcCWrmEhffCn7yF+g3/YBg2pk5HNiAJ8DgWrjhP6hiijRRUF7Q3uqgAxznnnFVVZkTD0hxsS2A+9+j/yx@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YwED13kFIXUcwoNh/e9mR0KmuW0FbRLmym/S3QPlOcZAWNc+Tmx
	LIx8Txqvqt+eWiSGRkNA6s3L7Hy2hLZY+I5pm8w4Dbs/2a/HnRdWSuRGU1vO
X-Gm-Gg: ASbGnctTi6FYgVP/pb1DOg/uZhyG2UNozYalaOTeHS0qiqmNuXkjE0i0+T1ISlR7BqR
	c7UHnVqCZogvjiOrXEjK4h9TuTVj+HcwziEvOroz8tWuMx8wdCsSdxG29fZllFPOeqJn6q1MAsn
	YJo/mr9EI4Ri57PuafrHCO+Wg7u3Yp5+1r/nhO3Gf5/SXpjJ7WGV65Ly+1M1Y70DfRp4wJMmNW0
	6dKbAKbCHfufFQIBXhP/Vtf2TZAv1a5P0t+16afTFnDwtgvVnO6NWFfnGYPEhU5kwF9M/Bu0W/u
	FI4ANyLzRcrfhEBPP9bzoDmvHZ0F5WYfWM8onVMMiG4N3rSHTv/YtNC8CvZoGTYkOeylN41bLuc
	WT9kQRx3Jn6w=
X-Google-Smtp-Source: AGHT+IG5IwW4aar0yoj3MwxIVVuAhVguXsGwW8JEYx+ZgJdKNurkwqz90BXSi3v8zGs4x1Xa2E2hLg==
X-Received: by 2002:a05:6122:468b:b0:523:eb47:2884 with SMTP id 71dfb90a1353d-5241978ab96mr3661284e0c.6.1741729304286;
        Tue, 11 Mar 2025 14:41:44 -0700 (PDT)
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com. [209.85.221.176])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-86d33bc0004sm2483118241.2.2025.03.11.14.41.43
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Mar 2025 14:41:43 -0700 (PDT)
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-524038ba657so270815e0c.0
        for <linux-m68k@lists.linux-m68k.org>; Tue, 11 Mar 2025 14:41:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU3WF5kLol0tdBvoxc4lwH8ZmMWmL2KyHmyl7kH3DDF8aqxP5cuIS51OrWAc5e/WS9Smy3KWqI+FZlm@lists.linux-m68k.org
X-Received: by 2002:a05:6122:489c:b0:523:e4c6:dddb with SMTP id
 71dfb90a1353d-52419478380mr4380371e0c.0.1741729302782; Tue, 11 Mar 2025
 14:41:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250306185124.3147510-1-rppt@kernel.org> <20250306185124.3147510-11-rppt@kernel.org>
 <cee346ec-5fa5-4d0b-987b-413ee585dbaa@sirena.org.uk> <Z9Cl8JKkRGhaRrgM@kernel.org>
 <5e40219b-f149-4e0f-aa10-c09fa183945e@sirena.org.uk>
In-Reply-To: <5e40219b-f149-4e0f-aa10-c09fa183945e@sirena.org.uk>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 11 Mar 2025 22:41:28 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUGnBeo69NkYsv35YHp6H9GJSu-hoES2A8_0WhpX1zFhQ@mail.gmail.com>
X-Gm-Features: AQ5f1Jp2UP71Gi3RsrYhaKY-FGNeXSzj4L3BI-snK3mtBDJzZMW7SrRY1lIN6cU
Message-ID: <CAMuHMdUGnBeo69NkYsv35YHp6H9GJSu-hoES2A8_0WhpX1zFhQ@mail.gmail.com>
Subject: Re: [PATCH 10/13] arch, mm: set high_memory in free_area_init()
To: Mark Brown <broonie@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Andreas Larsson <andreas@gaisler.com>, Andy Lutomirski <luto@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Borislav Petkov <bp@alien8.de>, Brian Cain <bcain@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	"David S. Miller" <davem@davemloft.net>, Dinh Nguyen <dinguyen@kernel.org>, 
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Guo Ren <guoren@kernel.org>, 
	Heiko Carstens <hca@linux.ibm.com>, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	Johannes Berg <johannes@sipsolutions.net>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Matt Turner <mattst88@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Michal Simek <monstr@monstr.eu>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Peter Zijlstra <peterz@infradead.org>, 
	Richard Weinberger <richard@nod.at>, Russell King <linux@armlinux.org.uk>, 
	Stafford Horne <shorne@gmail.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Thomas Gleixner <tglx@linutronix.de>, Vasily Gorbik <gor@linux.ibm.com>, Vineet Gupta <vgupta@kernel.org>, 
	Will Deacon <will@kernel.org>, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-um@lists.infradead.org, linux-arch@vger.kernel.org, linux-mm@kvack.org, 
	x86@kernel.org, Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Mark,

On Tue, 11 Mar 2025 at 22:33, Mark Brown <broonie@kernel.org> wrote:
> On Tue, Mar 11, 2025 at 11:06:56PM +0200, Mike Rapoport wrote:
> > On Tue, Mar 11, 2025 at 05:51:06PM +0000, Mark Brown wrote:
> > > This patch appears to be causing breakage on a number of 32 bit arm
> > > platforms, including qemu's virt-2.11,gic-version=3.  Affected platforms
> > > die on boot with no output, a bisect with qemu points at this commit and
> > > those for physical platforms appear to be converging on the same place.
>
> > Can you share how this can be reproduced with qemu?
>
> https://lava.sirena.org.uk/scheduler/job/1184953
>
> Turns out it's actually producing output on qemu:
>
> [    0.000000] Booting Linux on physical CPU 0x0
> [    0.000000] Linux version 6.14.0-rc6-next-20250311 (tuxmake@tuxmake) (arm-linux-gnueabihf-gcc (Debian 13.3.0-5) 13.3.0, GNU ld (GNU Binutils for Debian) 2.43.1) #1 SMP @1741691801
> [    0.000000] CPU: ARMv7 Processor [414fc0f0] revision 0 (ARMv7), cr=10c5387d
> [    0.000000] CPU: div instructions available: patching division code
> [    0.000000] CPU: PIPT / VIPT nonaliasing data cache, PIPT instruction cache
> [    0.000000] OF: fdt: Machine model: linux,dummy-virt
> [    0.000000] random: crng init done
> [    0.000000] earlycon: pl11 at MMIO 0x09000000 (options '')
> [    0.000000] printk: legacy bootconsole [pl11] enabled
> [    0.000000] Memory policy: Data cache writealloc
> [    0.000000] efi: UEFI not found.
> [    0.000000] cma: Reserved 64 MiB at 0x00000000
>
> - I'd only been sampling the logs for the physical platforms, none of
> which had shown anything.

Hangs that early need "earlycon", which the qemu boot above does have.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
