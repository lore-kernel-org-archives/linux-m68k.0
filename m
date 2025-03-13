Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6109826AA9B
	for <linux-m68k@lists.linux-m68k.org>; Thu, 13 Mar 2025 17:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741886093; cv=none; b=ZHu/7d5UqriBgYVln0gmtw5nrSmkRVI69+tbalPRp+k/ffMPATNo4QY2kwpAQw+t+YKXFJeHwcgjWXTtAIhx6eoG1wgXZb31wernanDzowy0IxxS45Du2oUVYZVGgu+no//ZesN+3xZ4zDcdir7HJBRahrcMp0VTmK3AcHBxPc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741886093; c=relaxed/simple;
	bh=Z0R4Knirkvu+jEmc1w5aGtkeADSH26ueKwL0dPhNn7o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BM/tE0g3MaCS6RewGv5gdUTOjmN4uyOM4Xn3ScEXIDqvLpTj+cQDUJPOUrXjC8EYbGCJ68o6KicdY5dJ3OPiA8iAzJLmo3YjKEworYwrXSoRf68AvijoLvfZP7upE+vIlcrnFXgqkaJGiQz5sLoHAXe2Zp7YA69GCrPC5sdXfKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EbvB6zQc; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EbvB6zQc"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2ff64550991so2269525a91.0
        for <linux-m68k@lists.linux-m68k.org>; Thu, 13 Mar 2025 10:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741886092; x=1742490892; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n3DVX2jUUT8USovuBtaAWfLwoCZG/vTo0soqbEn/R/c=;
        b=EbvB6zQcbuyqW/m+NqmldnXnGFMJws+a3LuF/9NApWRRywB68U0mdpeb65izPNDWWJ
         OAjtxrzQ6hn83KC8hGYKrm+aM/m+Mw4ogoqUhsCimqW0blOxjLw3mS8YkNVHHLiVVcbF
         4AUZOrpCPCOpoq62KgJi2XbD2S61PptEMbSk3wZ5IJ4o+Pn3iRdmX5IF4OII3jARoQmt
         Bwb0/kLp2fWytpbJQWuXJn1pQgfZlfrJAIRfsl5pTsyjzosufwd9iGLXINsALQCg5G3k
         HGwLz9Bbp+mQwgXQhowZVlUBBaRGnzpAm9QepwRARdmBU0vmFnlMPCTYOy8+iPdA1oRB
         baOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741886092; x=1742490892;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n3DVX2jUUT8USovuBtaAWfLwoCZG/vTo0soqbEn/R/c=;
        b=K5Z/DHX1GOhM3rpNvZKiwOY/PMOhTmyO7VUlkCmVwUkLwwwehsCko59cMPbAqdUZiN
         m4/xjXOn9ZsfKn14ZIyXg3tvWCPizUXwVh5Njqi1YliAOwWAxsu6tEjP83wMAOcJkG0F
         wo+GzR2wfqH4p1bNpxM4GyHIdHpN5P2wgiYUu7OyGTpWPUWwv1r8EEz2NBU2iCE51f1h
         1uEQ6PPx5eLQM2UZWSH4TfwMf5Mu2sthGulPdJ8/NE2JHawqFfL6z0BYN069H3dYQ1ae
         U8/R8I9SAyAdaP0sk57VkecFfXgFsUKHeZFyokctHXwkHSKDdT5Oj2O4U6ZpVYZdkMX1
         56xw==
X-Forwarded-Encrypted: i=1; AJvYcCX7MDmdBcTZDzdJOqo+tH+QrN6Y/OKhrB9mK7klnvrxxinf3JMvUbHAGVVhMl2Sg73YZfUIN4VKEYUA@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YwhYkdmh8diFfmMEsdbJC7YzSBVWuIdteJW0KbHaQo4vp6wGCQ1
	pw3BXJKkV6Zn7NXse9GIQC5inxfIxjavAPH1ZPDnKzXuyrSUENP8+e5Zk+Ybq8k5wpkstEw813Z
	6iuJTc0+n+HZAN3R8j8xq39fPNg8=
X-Gm-Gg: ASbGnctjhfwRvH4TK/kVt66uQTSWSfTA29oE1ePS50mhVK9+kVYOH/Ph9be6rYK7qZr
	LNOYbwjbMaOuleLKB9tkfFqvODenvcQ6TQkZrSqEMif72X6Q85R7ORFQijqj6sfgmBhNnGcHmZ7
	fQiqYztI2vhVNEQ1FZKrv/M6t3AHI=
X-Google-Smtp-Source: AGHT+IE1qRePjrPlGe/k7DXmrY+KtJaOvGWQ1A7tyU5eLBTz7VxuSMi4hxEC/EMElopjpnT6L0bRBsC6lDv+GByhQbc=
X-Received: by 2002:a17:90b:5608:b0:2fe:b8ba:62e1 with SMTP id
 98e67ed59e1d1-3014ea24aa4mr365923a91.28.1741886091572; Thu, 13 Mar 2025
 10:14:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250313135003.836600-1-rppt@kernel.org> <20250313135003.836600-9-rppt@kernel.org>
In-Reply-To: <20250313135003.836600-9-rppt@kernel.org>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Thu, 13 Mar 2025 20:14:39 +0300
X-Gm-Features: AQ5f1JpOtVR6fLnH8b4t6Wo35MeP6GXSndMXHGPmpker_QqVMpVf1FbK9Hm_3_Y
Message-ID: <CAMo8Bf+_8QdcWmk-k6dpUUnvVtVsYCgcviK+fF=CsKjT3nFxHg@mail.gmail.com>
Subject: Re: [PATCH v2 08/13] xtensa: split out printing of virtual memory
 layout to a function
To: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Andreas Larsson <andreas@gaisler.com>, Andy Lutomirski <luto@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Borislav Petkov <bp@alien8.de>, Brian Cain <bcain@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	"David S. Miller" <davem@davemloft.net>, Dinh Nguyen <dinguyen@kernel.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, 
	Guo Ren <guoren@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, Helge Deller <deller@gmx.de>, 
	Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, Johannes Berg <johannes@sipsolutions.net>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Mark Brown <broonie@kernel.org>, Matt Turner <mattst88@gmail.com>, 
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
	x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 13, 2025 at 4:52=E2=80=AFPM Mike Rapoport <rppt@kernel.org> wro=
te:
>
> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
>
> This will help with pulling out memblock_free_all() to the generic
> code and reducing code duplication in arch::mem_init().
>
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> ---
>  arch/xtensa/mm/init.c | 97 ++++++++++++++++++++++---------------------
>  1 file changed, 50 insertions(+), 47 deletions(-)

Reviewed-by: Max Filippov <jcmvbkbc@gmail.com>

--=20
Thanks.
-- Max
