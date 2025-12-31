Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04833292B54
	for <linux-m68k@lists.linux-m68k.org>; Wed, 31 Dec 2025 15:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767196187; cv=none; b=k78cgF/Vq8US7Q0yx8CTp0UQoP1ClmjJ2L13PWgEVN3ok6jSixTB1WNzZdejMDYTGNVZRjyhXyS9mIMqvyst1R8gCIl1jLg6OKP4GNTwRSCimRfZwz+fQAr0dMzwic0kW1yPT3jBFRBu6roCMIwDHyJfGAodLvF08tBO1595wSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767196187; c=relaxed/simple;
	bh=3O2pKoi3Hwirhh0+J04ChOJnDVUiP3w0hlE8zKMOybs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CkrMlli2FL76Q7PGpGsR4MK8Wn6DfO2Y5wO1KUX38a3N3+NARWC1wHt+Esy899zW/famE2bDlVYxu2e87ljcJuSH6Mk5kWTAUb4O23i4uCj7w8a4iYv4RR9z0ROpImJieWpRZdqzkuTzVbz/0WDLgDWa9PI6yGwOIF+7Pte5Cv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dtHOefkV; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dtHOefkV"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-64b9d01e473so15471429a12.2
        for <linux-m68k@lists.linux-m68k.org>; Wed, 31 Dec 2025 07:49:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767196183; x=1767800983; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H6r7yw9l553CBnZ0Oq6/Kvj3e3aIbXAlTRdm8Qc8sow=;
        b=dtHOefkVykS4waIJm0bZUSiqElpg2KhIx28XfzWIDd0jgoByWNcbgeWiCvUBnKPFdA
         WpF73YEXyQ7v7iXocEwwv0+gz61i8lfwu0h9xorUjg1kjGUfN2tt+3sbOiGgqlh/JbOZ
         +gC8GJ+0nkC/RRUaDwYYgpcbALbFPPH4c/Am3tArf15gzSc6P7YYVZ70Mtbg6GHzTG94
         x98ZuJXVSRY31ISjaa+YSJiNUyWL+5rrv9rHD5RN+/iFBhy705aFqSljrVmcYm82JEkM
         y4+JV4ZHbK56YiGAFMUYiSy2rHsIuwxlMeYxIpec2lqHjo4pGmw0Wtwlinz5yydu+rBD
         GEdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767196183; x=1767800983;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=H6r7yw9l553CBnZ0Oq6/Kvj3e3aIbXAlTRdm8Qc8sow=;
        b=MYMHfsfzDDGvEqwozdjMIaprwKGb+o+ktqSUmy/qKhh2NWAH0t+CYLvdAgByPFdfMW
         V+UjZZCBvdEv0ew1avNN3ZxD7d+Uq9y3NwqOhPp6TZJetoag+rwBRCF/In9yeR8+pBO1
         GOltweNjfBaLZ9ff3pSWpkn41tK9ipE+10/2gE/cmnOza+kaKUSU1+oOqdVenhdgDJWT
         9WxMW9PTh1HBMKZ8mHqnLGoWv6S4OZBX+9nMOHD0qMbB+WMxDW4oCmg836QwXn/BC3UM
         Bnaqq/C04RAn16YFf1mIIC4fnnvkL0HJeuTklpLqwDvRiSDEWwRsIcrOe5BxlmBSRFBr
         qXZA==
X-Forwarded-Encrypted: i=1; AJvYcCUD6yG9qzguLQH8e1NjF1KElMfplyQNqK0V3sgNQv7AqXhgvwX1haZ0ehEJwT00pt1l7nlNq+bJb6EP@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yxplgh6cnGmbQY2/bdXlbry8o/u1O9JSt53azZtnOJlcO/KCgkx
	JdlzaWR02sbBhTWjTYUWsL1lRpmngHsjhD2XyxlctEVVy1aRpd0LUFeg/yZ9zgz8Z5zS1ioMtXs
	ot6U+5iydvmm4hOe+ZOSRs4wcMooBD0k=
X-Gm-Gg: AY/fxX5y9fVKQbhafW+oo3RwVi1GiFbuoLUweYRJQiNth42jiWnKDe7iAodzeufZDAz
	oT5vz9sMc1G3oiW7VN/vOwsfH3iS1vNdFDa1/7rZm+cBhV2B6mOxsC3apn6IHIfvP3/Ci7bOvjU
	04IM0zVeesdUPFazZx/daZPXuW9SneOt0/a1PBDmcDpu3MynuV1MShK4I3AsiywCtHxWac1xIl8
	E7P154r+3kfNwwZgQAUpN1sjp9g80wCg4yZh5xmFIvXtLsYIIl1TNKFc3AaNUGSpsRYZy0H
X-Google-Smtp-Source: AGHT+IFWPXcZKnGq0Krk9SV9S7c2h0pNtpTmEWv1Brc1vDiv5zIRm5JUQPWxix5qBNEZM9fT8eFcchz/mGnlgfTZ7QQ=
X-Received: by 2002:a05:6402:430d:b0:64d:170:7976 with SMTP id
 4fb4d7f45d1cf-64d01707bacmr33060451a12.16.1767196183052; Wed, 31 Dec 2025
 07:49:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251228124001.3624742-1-rppt@kernel.org> <20251228124001.3624742-2-rppt@kernel.org>
In-Reply-To: <20251228124001.3624742-2-rppt@kernel.org>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Wed, 31 Dec 2025 16:49:31 +0100
X-Gm-Features: AQt7F2rayRHt2K_8t_heYN2h4Fxse0t-QPEGBzoKWlAlrWu2fr6sWsAyLE9oYEU
Message-ID: <CA+=Fv5TDfwnu7Qf2y=PLWWN1EvNpNbr8habnTO7R4_caAySDzw@mail.gmail.com>
Subject: Re: [PATCH 01/28] alpha: introduce arch_zone_limits_init()
To: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Alex Shi <alexs@kernel.org>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Andreas Larsson <andreas@gaisler.com>, 
	Borislav Petkov <bp@alien8.de>, Brian Cain <bcain@kernel.org>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	"David S. Miller" <davem@davemloft.net>, Dave Hansen <dave.hansen@linux.intel.com>, 
	David Hildenbrand <david@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Guo Ren <guoren@kernel.org>, 
	Heiko Carstens <hca@linux.ibm.com>, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Johannes Berg <johannes@sipsolutions.net>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Jonathan Corbet <corbet@lwn.net>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Matt Turner <mattst88@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>, Michal Simek <monstr@monstr.eu>, 
	Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Pratyush Yadav <pratyush@kernel.org>, 
	Richard Weinberger <richard@nod.at>, Russell King <linux@armlinux.org.uk>, 
	Stafford Horne <shorne@gmail.com>, Suren Baghdasaryan <surenb@google.com>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Thomas Gleixner <tglx@linutronix.de>, 
	Vasily Gorbik <gor@linux.ibm.com>, Vineet Gupta <vgupta@kernel.org>, Vlastimil Babka <vbabka@suse.cz>, 
	Will Deacon <will@kernel.org>, x86@kernel.org, linux-alpha@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org, 
	linux-cxl@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-hexagon@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-mm@kvack.org, linux-openrisc@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-um@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, 
	sparclinux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 28, 2025 at 1:40=E2=80=AFPM Mike Rapoport <rppt@kernel.org> wro=
te:
>
> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
>
> Move calculations of zone limits to a dedicated arch_zone_limits_init()
> function.
>
> Later MM core will use this function as an architecture specific callback
> during nodes and zones initialization and thus there won't be a need to
> call free_area_init() from every architecture.
>
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> ---
>  arch/alpha/mm/init.c | 15 ++++++++++-----
>  include/linux/mm.h   |  1 +
>  2 files changed, 11 insertions(+), 5 deletions(-)
>
> diff --git a/arch/alpha/mm/init.c b/arch/alpha/mm/init.c
> index 4c5ab9cd8a0a..cd0cb1abde5f 100644
> --- a/arch/alpha/mm/init.c
> +++ b/arch/alpha/mm/init.c
> @@ -208,12 +208,8 @@ callback_init(void * kernel_end)
>         return kernel_end;
>  }
>
> -/*
> - * paging_init() sets up the memory map.
> - */
> -void __init paging_init(void)
> +void __init arch_zone_limits_init(unsigned long *max_zone_pfn)
>  {
> -       unsigned long max_zone_pfn[MAX_NR_ZONES] =3D {0, };
>         unsigned long dma_pfn;
>
>         dma_pfn =3D virt_to_phys((char *)MAX_DMA_ADDRESS) >> PAGE_SHIFT;
> @@ -221,8 +217,17 @@ void __init paging_init(void)
>
>         max_zone_pfn[ZONE_DMA] =3D dma_pfn;
>         max_zone_pfn[ZONE_NORMAL] =3D max_pfn;
> +}
> +
> +/*
> + * paging_init() sets up the memory map.
> + */
> +void __init paging_init(void)
> +{
> +       unsigned long max_zone_pfn[MAX_NR_ZONES] =3D {0, };
>
>         /* Initialize mem_map[].  */
> +       arch_zone_limits_init(max_zone_pfn);
>         free_area_init(max_zone_pfn);
>
>         /* Initialize the kernel's ZERO_PGE. */
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index 15076261d0c2..628c0e0ac313 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -3552,6 +3552,7 @@ static inline unsigned long get_num_physpages(void)
>   * free_area_init(max_zone_pfns);
>   */
>  void free_area_init(unsigned long *max_zone_pfn);
> +void arch_zone_limits_init(unsigned long *max_zone_pfn);
>  unsigned long node_map_pfn_alignment(void);
>  extern unsigned long absent_pages_in_range(unsigned long start_pfn,
>                                                 unsigned long end_pfn);
> --
> 2.51.0
>

This looks fine to me from the Alpha side.

Acked-by: Magnus Lindholm <linmag7@gmail.com>
