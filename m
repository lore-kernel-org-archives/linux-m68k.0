Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 902D525392D
	for <linux-m68k@lists.linux-m68k.org>; Sat,  3 Jan 2026 05:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767418595; cv=none; b=NquUulvQOnAquQDOIM/LxemVMtLJeR0rNeWlR3w21DJAp34V2FpirzlqU77A0Nk0PVATXqIM0Ievc0ajADlmXEkyVUiTyvfTKuBKcXdRYM6HvFRkke93DSigiXs8mYWodSGYfq5fjN5Oo/WmZMNrdXN/FuRsqpm+u/vp8sC+UJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767418595; c=relaxed/simple;
	bh=ATXYUvNs1r7k2R+QkRXiglU8qywdgmSoPgsNlVWS4pc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c8YM9s12/UV14/g/HAfNI++DOr/vSPuXHATKi4SASSnC+5tHafLL/QEVr8NusffTdyPZsigWbcdMAHZJH3c9M3F3xPMmWI8Qe1428r7ng8rywA6uggYohyduWms/pit9pjQTi4YpJ8g4IjWM8qL4WzIrZXwXX8iW+234Qrg8u84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=guIKZ3oB; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="guIKZ3oB"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-42fb5810d39so8128701f8f.2
        for <linux-m68k@lists.linux-m68k.org>; Fri, 02 Jan 2026 21:36:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767418591; x=1768023391; darn=lists.linux-m68k.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=10gk4kIzv5viXrYP6wsblohOaaYzL8Wh9uCfOfLAyTE=;
        b=guIKZ3oBqU4LNVNzC3EFisgDGlyE+iWVNjMyqk5HW+n8BzhSq+2jhDA0CJBALXs0wn
         fFi9S5mppFScN8Orr2nye0JEYGwPvG10HX+xpC7+vimjJt711Zp5iknTJGsT4/FsB4EE
         U45sw1NtwaqXvK/FFQXfvdwVWz+XfeFd2de6RpDfJWfmoKt/JHIxsJOv7jdk1R3jRWAv
         zY29Yo0WwZlUFW39EN8Z91HJ6s2KOsQDq+CPhKgBD0C/tGLWFe6Ln8ml5HgwYwzDjRCc
         bsKraHuu/HBPU+twD+V9lAbhKB20XrpShVjl1uTIuLGV9+k2avTsbApLkVZ6TiTDHFdh
         vDPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767418591; x=1768023391;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=10gk4kIzv5viXrYP6wsblohOaaYzL8Wh9uCfOfLAyTE=;
        b=VCRpyp/c4Ja2BtEoa2f5J242Xn42KHZFqbkPHGwM8zbZxwDGg5+hORowPU7bN/Ubjm
         sVIVxR5CaP8Teh8btlPRqzlqQGoNKEegSk2SWTkpj16o6QG1RcwgmsfWyeQ6FeVVtiky
         9nY327AD/fpMW5ra/Br2gL6o0VKIsvcvpwiQY0xE5uYACdWrsgSnWCs1VYye2NlCj2Yl
         0kpyq27ZXXSlHqPtPcUdN7X0v6qm3VvNrt0fiUmppYq1nzZ4L0aKUzL2LmaK4dm1Afk8
         bhAOasL3RwhzWnara11MvF1Bu98/z02W3hTqRUKH4IHHGGH+EsBQtmZUXxy8BaL4IJzu
         fpeQ==
X-Forwarded-Encrypted: i=1; AJvYcCXHFDs+2YxXBz3z5pxQ9dVhGCv5qo5E8he6B8tnAwjaPpTCnMNlCc8zErQNbBdHjqGGO4/8qMpZjBon@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YyRtLRcjy8kOv0K++uQkkBKy9d10W64G9pym8qehXUHS9hzgexo
	9ulqng75Qq9+u0Rnufv4c2IXncX0wF7qfj4n1ivqq+rjx3QzMNyKEr5h
X-Gm-Gg: AY/fxX5LGJNKL7AJ1GE8b9Z5tq2HIFEgCGP2CUjY+6dUdT0rew9nldG/tMNZN/9a2KB
	AFJGb1SqONBrh5+QwGT4nYGcV8OOdBYwBTuKM125sT/cB33btI9ueHlS+bxYV/6QuUcLs371ZD3
	Sqo7F1iI8tFoH4LobbjiVH2sUO71To4DQheDqhlk79WjbxdJ/y0J5RSvwe8ziW2N2TlQUkNlX1n
	9ZWaCa+n7ti7UDcfN7vCSUuYntZvKmv34jkZH+klrCrhdSCg71HKBuUTdq9C5kxjZqKnj/p6fsH
	qT+nT1pUImhyjI60cLsU0gHRkBDiRL7IFTuzKs21rP5oHEgAczewtn0YzlMBefqLbsoXqmCbYe2
	Aw6PszGzhU/tvVyzKcN/ioEC9+y2qQXrg0nb/gq6AATdfkQkEnyB5ImYOwCkBtSDKkgA305i3F6
	h9A8pRDLz1CWW8huOV9goNk/Q+1S3+OwX6BgZ276bDPuqC77uxZi9wHInJmpTry5Ga
X-Google-Smtp-Source: AGHT+IGVfFhDmvRzquITceR9a5MtoKyW2aPxvUx0HbCgVxiLGpVVcSZGOqzt3JsoKLBzXfIUaXLywg==
X-Received: by 2002:a05:6000:178f:b0:430:fd84:317a with SMTP id ffacd0b85a97d-4324e4fb825mr53362620f8f.38.1767418590643;
        Fri, 02 Jan 2026 21:36:30 -0800 (PST)
Received: from localhost (brnt-04-b2-v4wan-170138-cust2432.vm7.cable.virginm.net. [94.175.9.129])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324eaa4749sm89007161f8f.37.2026.01.02.21.36.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jan 2026 21:36:28 -0800 (PST)
Date: Sat, 3 Jan 2026 05:36:26 +0000
From: Stafford Horne <shorne@gmail.com>
To: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Alex Shi <alexs@kernel.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Andreas Larsson <andreas@gaisler.com>,
	Borislav Petkov <bp@alien8.de>, Brian Cain <bcain@kernel.org>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	"David S. Miller" <davem@davemloft.net>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	David Hildenbrand <david@kernel.org>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Guo Ren <guoren@kernel.org>, Heiko Carstens <hca@linux.ibm.com>,
	Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Jonathan Corbet <corbet@lwn.net>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Magnus Lindholm <linmag7@gmail.com>,
	Matt Turner <mattst88@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Michal Hocko <mhocko@suse.com>, Michal Simek <monstr@monstr.eu>,
	Muchun Song <muchun.song@linux.dev>,
	Oscar Salvador <osalvador@suse.de>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Richard Weinberger <richard@nod.at>,
	Russell King <linux@armlinux.org.uk>,
	Suren Baghdasaryan <surenb@google.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vasily Gorbik <gor@linux.ibm.com>, Vineet Gupta <vgupta@kernel.org>,
	Vlastimil Babka <vbabka@suse.cz>, Will Deacon <will@kernel.org>,
	x86@kernel.org, linux-alpha@vger.kernel.org,
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
Subject: Re: [PATCH v2 12/28] openrisc: introduce arch_zone_limits_init()
Message-ID: <aViq2vsMk5tltK0f@antec>
References: <20260102070005.65328-1-rppt@kernel.org>
 <20260102070005.65328-13-rppt@kernel.org>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260102070005.65328-13-rppt@kernel.org>

On Fri, Jan 02, 2026 at 08:59:48AM +0200, Mike Rapoport wrote:
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
>  arch/openrisc/mm/init.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/openrisc/mm/init.c b/arch/openrisc/mm/init.c
> index 9382d9a0ec78..67de93e7a685 100644
> --- a/arch/openrisc/mm/init.c
> +++ b/arch/openrisc/mm/init.c
> @@ -39,15 +39,19 @@
>  
>  int mem_init_done;
>  
> -static void __init zone_sizes_init(void)
> +void __init arch_zone_limits_init(unsigned long *max_zone_pfns)
>  {
> -	unsigned long max_zone_pfn[MAX_NR_ZONES] = { 0 };
> -
>  	/*
>  	 * We use only ZONE_NORMAL
>  	 */
> -	max_zone_pfn[ZONE_NORMAL] = max_low_pfn;
> +	max_zone_pfns[ZONE_NORMAL] = max_low_pfn;
> +}
> +
> +static void __init zone_sizes_init(void)
> +{
> +	unsigned long max_zone_pfn[MAX_NR_ZONES] = { 0 };
>  
> +	arch_zone_limits_init(max_zone_pfn);
>  	free_area_init(max_zone_pfn);
>  }

Thanks, this looks like a good cleanup.


Acked-by: Stafford Horne <shorne@gmail.com>
