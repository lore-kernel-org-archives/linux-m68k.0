Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EE7D429CF8
	for <linux-m68k@lists.linux-m68k.org>; Tue, 14 Jul 2026 21:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784065559; cv=none; b=K1EDarpzfnAbG2R7+dq9WblH/Jn6a+y4yphdJa1ncL8R2wj6IITseNvuLSmE+8RE9nPUPuIr1fdOW3ZgIoa2msSlA0/pdSypFkQESDvUyF0WFm20si66IUguIopQB9ep4vlJwZIGDGI1us06/KAkFqrgrddTm2ZG4AHaVB0UIdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784065559; c=relaxed/simple;
	bh=cAVW45uqQg2SRPEYKmKtszJRvMO//7p4A7xPCiBzVyY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PnP6cQ271+YGv9XrJ+L69oWAfbfo0vS9a2ElcsEy84LSge37Lo/KLXvsCJp8YyXqd3vGowNj90gAuuEwn4QXVNk11lUhNl36HsF7a7KQPD5DbB83IlDfNo77oWErFNPpGD8UDTBkfxFCSDToPoElh/ubHuobqjSRYqCaDjYJMHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zr7PV47V; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zr7PV47V"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-493f2e39e81so19477095e9.2
        for <linux-m68k@lists.linux-m68k.org>; Tue, 14 Jul 2026 14:45:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784065556; x=1784670356; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lsgDUhCPZi1cUpPkNQ/I7/JmqQLLDAJpIhlyKeHE0tE=;
        b=Zr7PV47VdxmLQoPxk/G1Ybg0HkvEl+rgD8CPABPyKOIjpdysNXx8sLQb69hGBfC09y
         I7jvxqmqiXVtoDKap3a2IMKNF+4KyVbeGFY4lI7I8Gg4PutOHCNvXeYhhHwRSD8q8oh9
         neesf2FU3IBcK2U1UXUqmxh+ktyBqfJKdNOD72hl2enXUz2lQUA/PiDYqIEceCUVt4gx
         C0RzDPlnHI6xRvt4FvkKiumOyrOFXte4HQKE4VMQ6LWrTMLJ9hx3yBb6dnZ0XTcz/DKB
         aJXBsFNNNNnQPNu65m57Z9Tr74iZE5M44oOlXTHdD/SI9E1K7JQLNhz/TMTnSXgiRi/r
         stGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784065556; x=1784670356;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lsgDUhCPZi1cUpPkNQ/I7/JmqQLLDAJpIhlyKeHE0tE=;
        b=qa2Y1wmcemNASEVDd37nmWNDMZ05I+GYkk/xrjIOjVrn9oQYz87N8IEfgBuIV03DC/
         Fi3YC0B6cYOGS/QeDFz283Wyyj2ZXY4BQuZXLoDRfJ47X5gMkskhDZ1w84iN+Ks68/W6
         ooNUEx1EzzKNXuHREX4mUgI2MxnzTguqjhAZ2SuawMEWQfww/1QI1kitUBStkdZM9WGZ
         0RKg10SHNaZGn1m/6qGBl1zGX0zFpPJHNai5nP8MKaOlyx+8odAEona54HuzuwuuKIZX
         KuDiWPAF46QdNAu9ZiLgm4CGlAuevlJM9Z8K1D4RHsz/fTSBRnONVIP5GLiO601enenO
         HzMA==
X-Forwarded-Encrypted: i=1; AHgh+RpBswYheLs75N5KAA/gJTyY4hAuFllmNlvdkGGiOSEmX1owut7xvd0J41xkZw02wxywvFEJVWO3K5n1@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YzZKB8UnWc57kMIQuyX3tRp782ir8uAGJd5ELxSYfjyNvRwbFmj
	51ZocHlbMymhc37mtQ2MqTd05yWSVwLgwk3ejvR6X29l7gCPlsoOkoIJ
X-Gm-Gg: AfdE7ckykDmS8zj4j9mQA5Ry8X9kzaPsXZEmbSgkxSQnhVJWtw3aD0Vb6pq3SMBG/df
	2ra0+ewVEb0bLisSq091XOVJXEBvm9CB4+LC2oZSv0hYpA4CRm/cnZl806qU1hCH7RTBkotJnrH
	QCE0CmlE52ER6tQsen3k6JSY4XhTQlWc4Fr/7MN3SeHUp53UvP0JOAIFcAfCfBAp8mhBA81LmKk
	y1NBiKv0v3SKwlTz57ZKKIV0ABXPisILaP/BZGB7Ekmx+ObnTsydpeGSLqqd8rgzE9wgzKxd3k8
	F+uMmYJDHrObkrngWpoc5F893JKekjOY4KD9WFlBRlNqNBU88YGw/UHU0AyhMtVPHzaI4+wtful
	QVzm0bDRbSaXEZ0TgXZEIxle4LrefZl6vChxcFOz8COQZ2KttXAUriVk/0JC2l8HCe5bmut4ZmN
	7r8cYu6bUfZjtO4oHWgsYgdGCdAk8AiwyZzthfb+Rp+b2687ZvpQ==
X-Received: by 2002:a05:600c:4e8f:b0:493:b307:6777 with SMTP id 5b1f17b1804b1-4953c273de7mr4061435e9.22.1784065556082;
        Tue, 14 Jul 2026 14:45:56 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4950a32b9f3sm118533945e9.13.2026.07.14.14.45.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 14:45:55 -0700 (PDT)
Date: Tue, 14 Jul 2026 22:45:53 +0100
From: David Laight <david.laight.linux@gmail.com>
To: "Arnd Bergmann" <arnd@arndb.de>
Cc: "Pedro Falcato" <pfalcato@suse.de>, "Yeoreum Yun" <yeoreum.yun@arm.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 loongarch@lists.linux.dev, linux-mips@vger.kernel.org, Linux-Arch
 <linux-arch@vger.kernel.org>, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, x86@kernel.org, linux-mm@kvack.org,
 kasan-dev@googlegroups.com, "linux-csky@vger.kernel.org"
 <linux-csky@vger.kernel.org>, linux-m68k@lists.linux-m68k.org,
 "linux-openrisc@vger.kernel.org" <linux-openrisc@vger.kernel.org>, "David
 Hildenbrand (Red Hat)" <david@kernel.org>, "Russell King"
 <linux@armlinux.org.uk>, "Andrew Morton" <akpm@linux-foundation.org>,
 "Ankur Arora" <ankur.a.arora@oracle.com>, "Mike Rapoport"
 <rppt@kernel.org>, "Magnus Lindholm" <linmag7@gmail.com>, "Christophe
 Leroy" <chleroy@kernel.org>, "Klara Modin" <klarasmodin@gmail.com>, "Huacai
 Chen" <chenhuacai@kernel.org>, "WANG Xuerui" <kernel@xen0n.name>, "Kirill
 A. Shutemov" <kas@kernel.org>, zhangtianyang@loongson.cn, wangyuli@aosc.io,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>, "Lorenzo Stoakes"
 <ljs@kernel.org>, "Jason Gunthorpe" <jgg@ziepe.ca>, "Catalin Marinas"
 <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>, "Ryan Roberts"
 <ryan.roberts@arm.com>, "Pasha Tatashin" <pasha.tatashin@soleen.com>,
 "Rohan McLure" <rmclure@linux.ibm.com>, "Baolin Wang"
 <baolin.wang@linux.alibaba.com>, "Tejun Heo" <tj@kernel.org>, "Kevin
 Brodsky" <kevin.brodsky@arm.com>, "Anup Patel" <anup@brainfault.org>,
 atish.patra@linux.dev, "Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt"
 <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre
 Ghiti" <alex@ghiti.fr>, "Dave Hansen" <dave.hansen@linux.intel.com>, "Andy
 Lutomirski" <luto@kernel.org>, "Peter Zijlstra" <peterz@infradead.org>,
 "Thomas Gleixner" <tglx@kernel.org>, "Ingo Molnar" <mingo@redhat.com>,
 "Borislav Petkov" <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>,
 "Johannes Weiner" <hannes@cmpxchg.org>, "Michal Hocko" <mhocko@kernel.org>,
 qi.zheng@linux.dev, "Shakeel Butt" <shakeel.butt@linux.dev>, "Kairui Song"
 <kasong@tencent.com>, "Barry Song" <baohua@kernel.org>, "Axel Rasmussen"
 <axelrasmussen@google.com>, "Yuanchu Xie" <yuanchu@google.com>, "Wei Xu"
 <weixugc@google.com>, "Andrey Ryabinin" <ryabinin.a.a@gmail.com>,
 "Alexander Potapenko" <glider@google.com>, "Andrey Konovalov"
 <andreyknvl@gmail.com>, "Dmitry Vyukov" <dvyukov@google.com>, "Vincenzo
 Frascino" <vincenzo.frascino@arm.com>, "Anshuman Khandual"
 <anshuman.khandual@arm.com>, "Yang Shi" <yang@os.amperecomputing.com>,
 chaitanyas.prakash@arm.com, "Ard Biesheuvel" <ardb@kernel.org>, guoren
 <guoren@kernel.org>, yang.li85200@gmail.com, "Alexander Viro"
 <viro@zeniv.linux.org.uk>, "Dinh Nguyen" <dinguyen@kernel.org>,
 "schuster.simon@siemens-energy.com" <schuster.simon@siemens-energy.com>,
 "Vivian Wang" <wangruikang@iscas.ac.cn>, junhui.liu@pigmoral.tech, "Muchun
 Song" <muchun.song@linux.dev>, "Vishal Moola (Oracle)"
 <vishal.moola@gmail.com>, "Nam Cao" <namcao@linutronix.de>, "Pavel Machek"
 <pavel@kernel.org>, djbw@kernel.org, yu-cheng.yu@intel.com, "Baolu Lu"
 <baolu.lu@linux.intel.com>, "Jonathan Cameron"
 <Jonathan.Cameron@huawei.com>, "Coiby Xu" <coxu@redhat.com>, "Andreas
 Larsson" <andreas@gaisler.com>, "Liam R. Howlett" <liam@infradead.org>,
 "Vlastimil Babka (SUSE)" <vbabka@kernel.org>, "Suren Baghdasaryan"
 <surenb@google.com>, "Michal Hocko" <mhocko@suse.com>, "Geert Uytterhoeven"
 <geert@linux-m68k.org>, "Stafford Horne" <shorne@gmail.com>, "Jonas Bonn"
 <jonas@southpole.se>, "Stefan Kristiansson"
 <stefan.kristiansson@saunalahti.fi>
Subject: Re: [RFC PATCH 02/34] ARM: mm: make 2-level pgd_t a scalar
Message-ID: <20260714224553.583c8445@pumpkin>
In-Reply-To: <aceb8582-bafa-41b3-8f56-77fec89a4d90@app.fastmail.com>
References: <20260713135614.1618183-1-yeoreum.yun@arm.com>
	<20260713135614.1618183-3-yeoreum.yun@arm.com>
	<alYL7B0HAvmLVHGU@pedro-suse>
	<b7dbc476-1477-4004-93b3-c5e667e24df8@app.fastmail.com>
	<20260714143450.61a94085@pumpkin>
	<aceb8582-bafa-41b3-8f56-77fec89a4d90@app.fastmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 14 Jul 2026 17:06:00 +0200
"Arnd Bergmann" <arnd@arndb.de> wrote:

> On Tue, Jul 14, 2026, at 15:34, David Laight wrote:
> > On Tue, 14 Jul 2026 13:55:18 +0200
> > "Arnd Bergmann" <arnd@arndb.de> wrote:  
> >> > I see the compiler has an awkward time returning a u64 struct (see
> >> > https://godbolt.org/z/qejbv6j9a), but if this doesn't work maybe we should
> >> > get rid of the STRICT_MM_TYPECHECKS stuff? I seriously doubt anyone is
> >> > purposefully toggling it on for testing from time to time.    
> >> 
> >> As far as I can tell, the #ifdef was originally in i386 and
> >> got copied to all other architectures at the time, but was
> >> removed in linux-2.3.23 from the original copy when CONFIG_X86_PAE
> >> was introduced.  
> >
> > For x86-32 the makefiles request 64bit structures be returned in registers
> > (at the same place regparm=3 is set - probably added at the same time
> > between 2.4 and 2.6).
> >
> > Note that arm32 can will return a 32bit struct in a register and
> > arm64 will return a 128bit struct in two registers.
> >
> > The only problem is returning a 64bit struct in 32bit mode.
> >
> > I'm sure this code is arm64 only.  
> 
> The file we are talking about is arch/arm/include/asm/pgtable-2level-types.h,
> which is definitely 32-bit only and force a 64-bit struct return
> on the stack.

I've clearly failed to detect the environment :-(
The 'struct return by reference' is part of the ABI.

> I checked some trivial tests that show that arm-linux-gnueabihf-gcc-16
> also still produces badly optimized object code with structures
> passed by value, and will spill those to the stack for no apparent
> reason. clang handles those just fine as a pair of registers.

I'd have thought it would be ok if the structure had two 32bit values
and they were directly accessed.
The silly test I did earlier didn't spill.
Taking the address could easily force a spill in the function itself.
So that ((int (*)[2])&var)[0] (which is just ((int *)&var)[0]) is likely
to be problematic - or certainly heading in that direction.

> For the 2-level page table, this only concerns pgd_t, which is
> rarely passed around or returned by value. The 3-level page
> table has a 64-bit pte_t, which means we probably won't
> want STRICT_MM_TYPECHECKS there.

I did do some mmu setup for a strongarm a long time ago.
I do remember in being odd.
But I was only moving the software frame buffer away from the physical
frame buffer to steal a load of screen rows for a keyboard.

Is the 64bit pte_t needed to get the extra modified and accessed
flags there aren't free bits for in the hardware pte?
Would it have been possible to use bits that are fixed in the hardware
pte for the extra bits and write the value to pte[0] and pte[256] fixing
up the value written to pte[0] (that the hardware reads).

The arm docs seem hard to read...
(the left-right scroll doesn't help!)

	David

> 
>       Arnd

