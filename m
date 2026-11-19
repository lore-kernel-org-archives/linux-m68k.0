Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795073895;
	b=A1K6Y5BjsoT1k7fBJs2Fgf+Rh6XybSSut49ZK+P4knAtMV4PUv8mLiMJFmAyucbxUwgO
	 2D2bzHviEBg2SNAZo10bizIqVblC9l2bbmq51F4Vuqmd50reqohLIbIHt4KSBhpgQY+O3
	 fYR/kD2pQnngjGUm9zEGOn/9I97b7kH04g3mVcfLlYWUvUEIPp6XNEnwjRT6ESYD4ZsEy
	 wSvpVASdhaj4Up0uvpFU6dl4gF1NrqOW8zEX8jNlNYNn6PEJ5ohUJ38sRInDGOjuqD7IW
	 saDHqnNzdlVQH5tE2rRdr02O3RKcqxuR6Cw1gXqLNoNoJEsXbdutd04Legaa62X7Myg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795073895;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=Klcqtq67J8++CxJ47wWJ4KmRtmeIU5oN8tRyALYYbAY=;
	b=dN7i2BGQq24PtqAea/eUfr28TJ7jf4AbsFFi1s4tYgmn+etICq1/sbJPNOl0DKb2jWqB
	 tor1y6Ho629BcReboVpn04VbbrpqdeQufrle091VGa7M2vvWhZyoI/ttgYTzOQAo1NHnS
	 nHaj1bgWENrGG6BLnzKcMvDomXEC3FqAZ7S3pbzYeo/w54KyRPuVCoFWC+IIPU8hcz+oo
	 0+eXgD7ZFBCbosQ1/m1pCp2Rg0INyZYOYUnOoq/Rw68ZY1fudXYglQPJGTH4dV92+KktD
	 CGguHawpjzPiIana2xidqC8I6AYmH7W+3wEBKYtwZB+FD7JbUX6/2gzhggkSZ1wyuLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.161.41
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F801606A320
	for <linux-m68k@lists.linux-m68k.org>; Thu, 19 Nov 2026 07:38:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F801606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-6b19e291cc6so1624751eaf.2
        for <linux-m68k@lists.linux-m68k.org>; Wed, 18 Nov 2026 23:38:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795073894; x=1795678694;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Klcqtq67J8++CxJ47wWJ4KmRtmeIU5oN8tRyALYYbAY=;
        b=aTLDJPJE57usKul1AVAgk38I6XuLWlTVGkORk0AxYKlvHZT9jc/OPN5K76c52hsWMy
         8TNpy8b0gVfgYAQXryjuGBjHpmSvdNqOt3JsBTvyh7JAkuurpCoERfYrrL9u1eJKrxRr
         E43lVw7PPlvVV/7HUb+JE4cImo2GkIGz4yVDmXuXgGEd/+UabDOzBNINlmdpwtkOGrN6
         1Vv6IPAnwPMNjb0eAtZn56Tm8Vbo1Ylq533gbFvI5pysrhOA3zeD9LBwLMWFWTgdLxIE
         vP/7Xoe5nYoX45JElPEn4T9++ggz7VxAbMU3PGAd2Rniiqvz91FwedTDYFjg5v7nqfjO
         pnyg==
X-Forwarded-Encrypted: i=1; AL+hErEDBNwjspX/Jv17lYbAbKNvHHnzjryTj0g1bA/hKuy4FGKczviKTgBOrvPs82AHyG0J2wTDCRQgNDEy@lists.linux-m68k.org
X-Gm-Message-State: APuU4Z+egFm2lDOWjAPekK6wGiURJnq7rECwFCN7jpR/3Si/Tf95+o4D
	5D9efoXRHEhler2gbzr/K6Bz6OsW3VSHlkzEA93+e+1/8MWKCMezJOX1okPO61qK
X-Gm-Gg: AYBFou1/6j75F7KIsp0N+rHnB5FPymWXhiPlGY0PGzgBG53PdcJ4cp4XRotLP/PYgAB
	C4DCn9b8YOrdW30RmRklGPi43uGKvw22W4cvnRfddAAEJdaSNTHpkSWCweRN4IBUUxmK9rYsUc3
	SMrT33hUVLnqrD4e/nNZfTlyZvNNykXZQsGsHw38irqa2PrQfWdTplhCfT7dAcqabFNc/cEOkhT
	azkmt4OfRrv2qLVvIRwXdDGN561LBF+mdl524oBOQOv1Dzh95g02Xe1tkGGZ8e8/dYMOUe7eu5D
	ZvRNqlAc3ccM8PwywnZqfJ3m8ZyEDkDO8C+N9pDVGeZpxK8oh7/JWatWhiDhVkVhpniFToPWO6o
	CBTHMBTZcfiup/OTGV6u7qarGGNSASuGG7mK8cSD10HAJFJmMOwzoYaqHINil2ywN5vdNxxlCxw
	C8A45JBu+uQA+k+8KtJtm9vhzTeyFdDOhTX0mHb9YPOqKrXxclWKDK8bMaiF7aKerHhJIifLlJ4
	mbXN7n3mrtgpXBf1iBOpIsRSSpwO3YjD2czVGbIizHGCbLv2WOOjPflY8+6A9odXZYOguKc0CMN
	yHuaHxqVGVDqqhQ5a+muZDMeZJNQWp2HPUll7wbrUazuMZuSGwU+49eLZHImqeMHTtKKe/0=
X-Received: by 2002:a05:6820:c3d7:b0:71a:facc:5a3a with SMTP id 006d021491bc7-71b187a6207mr2452177eaf.64.1795073894159;
        Wed, 18 Nov 2026 23:38:14 -0800 (PST)
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com. [209.85.167.177])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-862f021295csm4131148a34.15.2026.11.18.23.38.13
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 23:38:13 -0800 (PST)
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-4d198f1a591so1202526b6e.2
        for <linux-m68k@lists.linux-m68k.org>; Wed, 18 Nov 2026 23:38:13 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGv9MVsBOe25KG0ZuD7ngDFIi1TppfggbNaY2KbA9NlcZ3rGOcsXxkfNmjyFVWszG25hcAgt/lgzjuX@lists.linux-m68k.org
X-Received: by 2002:a05:6102:e0c:b0:7b3:8f0a:f76c with SMTP id
 ada2fe7eead31-7d6ba35b7d8mr1806982137.13.1795073401089; Wed, 18 Nov 2026
 23:30:01 -0800 (PST)
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261119-arch-kconfig-v1-0-37c276fe4d26@kernel.org> <20261119-arch-kconfig-v1-2-37c276fe4d26@kernel.org>
In-Reply-To: <20261119-arch-kconfig-v1-2-37c276fe4d26@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 19 Nov 2026 08:29:50 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU2u9wDiqp+H-aDWSRcT8_VtDg1NS0gVmqYYm9rt2ZSrA@mail.gmail.com>
X-Gm-Features: Aa3M54rf5ygj8ORK3fy8Y6Bg5UcrfzvYekQ-eoJmIgxSYs0ZeBrecHV4-2jERSw
Message-ID: <CAMuHMdU2u9wDiqp+H-aDWSRcT8_VtDg1NS0gVmqYYm9rt2ZSrA@mail.gmail.com>
Subject: Re: [PATCH 2/2] arch, kexec: declare kexec and crash capabilities in Kconfig.kexec
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Baoquan He <baoquan.he@linux.dev>, 
	Borislav Petkov <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Heiko Carstens <hca@linux.ibm.com>, 
	Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	Paul Walmsley <pjw@kernel.org>, Pratyush Yadav <pratyush@kernel.org>, Rich Felker <dalias@libc.org>, 
	Russell King <linux@armlinux.org.uk>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Thomas Gleixner <tglx@kernel.org>, Vasily Gorbik <gor@linux.ibm.com>, Will Deacon <will@kernel.org>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, x86@kernel.org, 
	Alexandre Ghiti <alex@ghiti.fr>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Cong Wang <cwang@multikernel.io>, 
	Mark Rutland <mark.rutland@arm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, Shrikanth Hegde <sshegde@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, WANG Xuerui <kernel@xen0n.name>, kexec@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, 19 Nov 2026 at 07:17, Mike Rapoport (Microsoft) <rppt@kernel.org> wrote:
> The options that let an architecture opt in to kexec and crash dump
> features, like ARCH_SUPPORTS_KEXEC or ARCH_SUPPORTS_CRASH_DUMP, are
> defined in each architecture's Kconfig as def_bool, and most of them are
> copied over several architectures.
>
> Declare these options once in kernel/Kconfig.kexec next to the options
> that depend on them, similarly to how mm/Kconfig does it, and make the
> architectures select them instead.
>
> Selection conditions are preserved, so there is no functional change.
>
> Acked-by: Baoquan He <baoquan.he@linux.dev>
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org> # m68k
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be> # sh

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
