Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D72038E121
	for <linux-m68k@lists.linux-m68k.org>; Tue, 13 Jan 2026 12:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768307610; cv=none; b=eYPTh1HenGPZ6965F/n7uhFee4v/2WkzlYAmUGgMV6w5pOvhDfmKm1fMQQX8BuF29hdAX62e34aOTLfFqgDyC4Lzd13RZYSL99T/pPPZu+m0cbZTVvUMj3d5mExLcp8v7z63eiboGFv94ggzCvrrRkvhKaFH8RSAd6F3d5Jii3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768307610; c=relaxed/simple;
	bh=c2pQGNsmx4TXSTG4ks/OmiO2LMby6F7I6nhF1Yls93E=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References:
	 MIME-Version:Content-Type; b=HZenKxVEGwtPIZUh5K9lNqSJ9Bj33kS0TMJJ4sjS0PxaGIjYUAOY/Ee+iWSMbOdEoUDWJRYUKugz+WhAUC4zGXt2SbUTdyjzKOg/Dh/f+j2iK2ifQN/8wpvg1ORh1dhow8RjmARw3WLM5vg2ruW/wu7pK+n+uA/gFKWe5jaEJ9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jOMhh/sv; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jOMhh/sv"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-c075ec1a58aso2896279a12.0
        for <linux-m68k@lists.linux-m68k.org>; Tue, 13 Jan 2026 04:33:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768307607; x=1768912407; darn=lists.linux-m68k.org;
        h=mime-version:references:message-id:date:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=j4BCb4tuwUydlXX/lekB/MWAbo5xTWmBY98lhxIZgCk=;
        b=jOMhh/svbVYRTK/9cSIanjmw8l12RtxftJ5LcpV195XuprhtakoK289kQoLIAQhH+h
         CWNBPui9ZMcIacbce0nv5Uol0xde0o3kkglM1d60HyozQXsZVw7yguH6xoFKZj52cV55
         e0t5ADcIFByisV7/pxZAWyr7V58oUlzaoZevVEabmLFwoLGh7B2HgrX7t6blhFuBvjto
         11CSUpVOklHVorUYAgQDxit2xYcQMd+z5dJH0+OST+W6ko7cTaxGhoH/5QkJyvKI94cI
         s4cSci6i4+0naFIrhU21LA0IgyWqDjUc4k/Mk4cxjQ9seHv247aAdznKZngfm7Rbzwum
         DFrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768307607; x=1768912407;
        h=mime-version:references:message-id:date:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j4BCb4tuwUydlXX/lekB/MWAbo5xTWmBY98lhxIZgCk=;
        b=J4N1ggh+mjCu7FH+jVNzU3T8zfSj8rzcHve9rpRv9a2R6VXlvqbXBj53XBsoanRUTW
         XVGzvH6Bd8OIknzscp9GvaTHp8E5CE2ZE0sBnSpA8VLRfKjFrn1wbCrMDV249l6ys/oD
         i/ysOAL+VdNiCzp9Qo18fg+mjX2WvmRXVDHP0ZbcwJc5VObfoSM9Inu+g/H+iJqceA+4
         LN8LnHZ1f18XXY4EjsX8+wjmljJzDzBHFK9EIZva3CNRjsW5/45tNPvDEifhjbblrl0B
         MzVqkISo7/2SGL7wLsqfMxS1YAM8LafDNAFodfcf4UA/fV4TM1tEC5PfZLcGb0L955Oj
         2ekw==
X-Forwarded-Encrypted: i=1; AJvYcCVp3xhZNEC486zF3tx/cEkMV5S5qX0lhc5TwRyR5/OYDaac9Kq2kQ3D3nCUqG25lxjjCgypAMw51YcL@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YyLXi4EQyAYLvS8N0Nii4TDmkSVtmxTIekvBSgRcv+bv5CJTO2N
	SEn5FpYIk28qdTK+MQI7olDwVhfM65mvnL/PL3seHse3yAZeK0TOZ0ey
X-Gm-Gg: AY/fxX7o1C1sXICksgzoCJc/eQ8H2jLc3AKxjMqQU3qA1CytL4uwFRmytGZIvQEs1kT
	iPZXVmS7Vb8JeB0UUM6ZWRdgKo47HVzPLkZB3IEayQmZaqqdrNg4ivqWQcRAjUXaZGtHs4mhT8w
	BECRLRudD3LQJ8eVYiCvjwL3T3+SgBjxGOU5ihTxgqPp8N4d9Q8EYXv2ooAAEhLqrKBTj3WEtQM
	JVRz+8MdXnFwV/re9zvPInVIl+uZ7ME40bzRjHgKfiKFcvW/c1gJmYYj15E5oUBGOiEDa1PFXVq
	5MbJmqNeU65NhFRjYhryXXJBO40AtjaH4naoE/NY5Neb+ywSWZX/WcMuieL7VzotV76p/0xS6KZ
	AYoywdW9EjDfWSw/oLmowqGs/l3RCginSSVMoGkqh3GoqlRifz7kqOoDN3BgGYpgZaMKVz0V1I+
	Dc03Fb
X-Google-Smtp-Source: AGHT+IFw8NQUhXWsNFLNcy9VnhtaeqSccMp4bageDierszWlx1Kxyih6osyfD1+uAcqTN4o2oK4SYQ==
X-Received: by 2002:a17:90b:3ccc:b0:340:9ba6:8af4 with SMTP id 98e67ed59e1d1-34f68c47f0amr18570023a91.35.1768307607428;
        Tue, 13 Jan 2026 04:33:27 -0800 (PST)
Received: from dw-tp ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-350fd6e343bsm1428958a91.1.2026.01.13.04.33.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 04:33:26 -0800 (PST)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Mike Rapoport <rppt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: Alex Shi <alexs@kernel.org>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Andreas Larsson <andreas@gaisler.com>, Borislav Petkov <bp@alien8.de>, Brian Cain <bcain@kernel.org>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	"David S. Miller" <davem@davemloft.net>, Dave Hansen <dave.hansen@linux.intel.com>, 
	David Hildenbrand <david@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Guo Ren <guoren@kernel.org>, 
	Heiko Carstens <hca@linux.ibm.com>, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Johannes Berg <johannes@sipsolutions.net>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Jonathan Corbet <corbet@lwn.net>, 
	Klara Modin <klarasmodin@gmail.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Magnus Lindholm <linmag7@gmail.com>, 
	Matt Turner <mattst88@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>, Michal Simek <monstr@monstr.eu>, 
	Mike Rapoport <rppt@kernel.org>, Muchun Song <muchun.song@linux.dev>, 
	Oscar Salvador <osalvador@suse.de>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Pratyush Yadav <pratyush@kernel.org>, Richard Weinberger <richard@nod.at>, 
	Russell King <linux@armlinux.org.uk>, Stafford Horne <shorne@gmail.com>, 
	Suren Baghdasaryan <surenb@google.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Thomas Gleixner <tglx@linutronix.de>, Vasily Gorbik <gor@linux.ibm.com>, Vineet Gupta <vgupta@kernel.org>, 
	Vlastimil Babka <vbabka@suse.cz>, Will Deacon <will@kernel.org>, x86@kernel.org, 
	linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-cxl@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-mm@kvack.org, 
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, linux-snps-arc@lists.infradead.org, 
	linux-um@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	loongarch@lists.linux.dev, sparclinux@vger.kernel.org
Subject: Re: [PATCH v3 15/29] powerpc: introduce arch_zone_limits_init()
In-Reply-To: <20260111082105.290734-16-rppt@kernel.org>
Date: Tue, 13 Jan 2026 17:59:49 +0530
Message-ID: <87zf6hu24i.ritesh.list@gmail.com>
References: <20260111082105.290734-1-rppt@kernel.org> <20260111082105.290734-16-rppt@kernel.org>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Mike Rapoport <rppt@kernel.org> writes:

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
>  arch/powerpc/mm/mem.c | 22 ++++++++++++----------
>  1 file changed, 12 insertions(+), 10 deletions(-)

This v2 looks good to me. 
I have also done a basic bootup testing using Linux PPC CI.

Please feel free to add:

Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
