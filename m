Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0F974657DA
	for <linux-m68k@lists.linux-m68k.org>; Tue, 14 Jul 2026 13:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784036098; cv=none; b=kM8UJ2YDeGrRRf3xR+G+X+a5h1m+Jz2E/hmE2jP+DXBTNHkOJMB9g/rOlx0GqbsmvBKIAwSC7LjeG1HDMO9KjHIE8w1UpX3JLvcMdAR3NTjFyAU7R63ZPYAiVCHB45nfegikWweXJBYefuAgX/1Vwof5hBpj9Y6ESpYyXJ7JYbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784036098; c=relaxed/simple;
	bh=I2e1sTfNi+4/tdcSVWJfJEFTRfdPpzayG8ntKpiI6tk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=n6j1OGyYtEI5VowDT60cgB7ZHQ8VGwOfn/kQRuIDgvEOXTaXerpZu30vxI7gvuXZ621brvWptcmA84YpjGF/EHclrDw/bCgKQAOqF/0C7xPCWjCsZ5zAQmlX4f55vZQIpI3iPBeV0e29kAxu/MyQbnDr1SarI6STGZjI7njJlY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MG8CSGXl; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MG8CSGXl"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-47df6a5202bso2628501f8f.0
        for <linux-m68k@lists.linux-m68k.org>; Tue, 14 Jul 2026 06:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784036094; x=1784640894; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+1tfMkiBqW2Fu1p0sa+0Qy+YQWqKnxqq1+cNEQovCl0=;
        b=MG8CSGXlh7Lznz2ochQBZl1d4gCrQLrZlKGXXsLgfkneGou2NwB6nfeUkq6TIOXVq/
         1qhJ/XjXQvheQMvfpN5AVbGchllHG7B0v5oGxoDc6liIQi6dCUW5JVURbctIJgEOLToz
         JYGHphbsnJ9ouc4EfvhEFltXR6kl+W83EuLKI5PRQBl7thw5RdxSV/eM9bybrt9A/LKp
         rI2DTee7Z+7jSfjQNV0jnnS6P/gs1lfQ9cru1vpO7KTFwQ2O3I6+/1QDiphSde7i41Bj
         SSHXiZ8TlgpN3hbaiyCYnaeQ4fTr81eHLJuEELpI6Z9V9UdJtFqZcnw7E4dqnF0B/72M
         zOwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784036094; x=1784640894;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+1tfMkiBqW2Fu1p0sa+0Qy+YQWqKnxqq1+cNEQovCl0=;
        b=fuKGq5lcbos8fRxD4fAaQHSRHlQUDLwW5foaGrp8W6rdMeDlg5llhal28PUO+rOjPW
         CDmEjQ3jP6NcFz0b1AuY/iJ3an+Hnrunk0eSdrTcgA158puHSLL9exrsKtG2zS4PB8dl
         C88UHsMLR0cduNsFti9OIo+QtYYuXmCoEpqInf6bR6ghUrKButTRzXQEk7hqxWwslzAY
         tvCkLlcewPTKjqk46HQ3FdbCoJYiKovGXH73ZXK85nMC8Uuty7gjpajZB9RZll1PjCK1
         5i1don7cVh+90MY9WacVUGN1fjPWpfkfRIXeA6kZ/Rc3H+qQp4pqeU4BL+d+BV4NYhKr
         0p5A==
X-Forwarded-Encrypted: i=1; AHgh+RpuEg3P2bIq+Lv3NCbzeyyI/0a7fOE4ZP8N6+YSGZiUex4hb3YF7bZshl/WK8ZFScYisiJn4XciooXs@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YysT09WXDGoPi0UTCnJUZnrQj6Dtj8kBknFPvyZb3iQUG083Kra
	c5AlH2GN1W9h2QtWz4Y+Uk05aWoN0ulNjSLx/+tZbgt7vUyVck8LP/JR
X-Gm-Gg: AfdE7clHtLGRGzUlGVU2IvWcUX6N19GaF3yJ1OjggxIHu2S5MtylumS0wXnb14SB/mn
	AlH1bJL8a8XwNcwSPZ3N8dmzMDH2yXorU599y9ek1qdNQRDzc7TVJ1zlyHCs0X8nJB44FYna94j
	8PIjkybBeQXu1NSfPHTrfPG99bLew47InXl0b28WmdMbE8u3vogxqAYN9D/yDK2p4C2TH5ZtkkS
	3mS7U1xSrPWzl38v9kkxovVQGUJt7pt1U5ZABnW7CRLa3vZb6nVtOgy/Bk1pt9883L9Gk2utqpo
	fYcwBP9yVtVvUHPptHHQmvNx498g8xJXL1qoO8T6BDbo1AiSxlnI9qgldxCbn7sPYEOSZcF7HHm
	1HkrCgwIF0o8RMopviylPLZQ2l7bqS4Ea8A786xhkRCGfBsKl5RII85SpVWEL7k5QIXOn9GhXLE
	2KvzGQwEoaRxfNicKFX31Nr8fUDXZSHSroQXg3xi6aDTTbZFx4+zDVCilhKyON
X-Received: by 2002:a05:6000:26c7:b0:47d:f441:5f93 with SMTP id ffacd0b85a97d-47f2dcc02eemr15207624f8f.25.1784036093714;
        Tue, 14 Jul 2026 06:34:53 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f4635a63esm8687695f8f.9.2026.07.14.06.34.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 06:34:52 -0700 (PDT)
Date: Tue, 14 Jul 2026 14:34:50 +0100
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
Message-ID: <20260714143450.61a94085@pumpkin>
In-Reply-To: <b7dbc476-1477-4004-93b3-c5e667e24df8@app.fastmail.com>
References: <20260713135614.1618183-1-yeoreum.yun@arm.com>
	<20260713135614.1618183-3-yeoreum.yun@arm.com>
	<alYL7B0HAvmLVHGU@pedro-suse>
	<b7dbc476-1477-4004-93b3-c5e667e24df8@app.fastmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 14 Jul 2026 13:55:18 +0200
"Arnd Bergmann" <arnd@arndb.de> wrote:

> On Tue, Jul 14, 2026, at 12:26, Pedro Falcato wrote:
> > On Mon, Jul 13, 2026 at 02:55:41PM +0100, Yeoreum Yun wrote:  
> >> From: "David Hildenbrand (Arm)" <david@kernel.org>
> >> 
> >> We don't want pgd_t to be an array, as it prohibits returning it from a
> >> function, like pgdp_get().
> >> 
> >> So let's just use an u64, and extract the right 32bit value in
> >> pgd_val().
> >> 
> >> Leave the STRICT_MM_TYPECHECKS case alone for now.  
> >
> > I have to ask: is there a good reason for the STRICT_MM_TYPECHECKS ifdef?
> >
> > I see the compiler has an awkward time returning a u64 struct (see
> > https://godbolt.org/z/qejbv6j9a), but if this doesn't work maybe we should
> > get rid of the STRICT_MM_TYPECHECKS stuff? I seriously doubt anyone is
> > purposefully toggling it on for testing from time to time.  
> 
> As far as I can tell, the #ifdef was originally in i386 and
> got copied to all other architectures at the time, but was
> removed in linux-2.3.23 from the original copy when CONFIG_X86_PAE
> was introduced.

For x86-32 the makefiles request 64bit structures be returned in registers
(at the same place regparm=3 is set - probably added at the same time
between 2.4 and 2.6).

Note that arm32 can will return a 32bit struct in a register and
arm64 will return a 128bit struct in two registers.

The only problem is returning a 64bit struct in 32bit mode.

I'm sure this code is arm64 only.

	David


> 
> For some reason, only sparc32 and arm32 still use the non-strict
> version, with arm having changed from the struct version in 2002:
> 
> https://github.com/tbodt/linux-history/commit/5a8202f0259a
> https://archive.armlinux.org.uk/lurker/message/20020306.213958.cd486eeb.en.html
> 
> > If STRICT_MM_TYPEDEFS's worse codegen doesn't matter then maybe we should
> > permanently toggle it on.  
> 
> This would definitely need good testing. It's possible that it's
> not that bad on modern EABI builds (i.e. everyone these days) as
> well as modern compilers, as OABI definitely had bigger problems
> with 64-bit arguments.
> 
> >> +static inline pmdval_t pgd_val(pgd_t pgd)
> >> +{
> >> +	return (*(pmdval_t (*)[2])&pgd)[0];  
> >
> > Ugh. This isn't correct C code. It only works because the kernel passes
> > -fno-strict-aliasing.  
> 
> I think the bigger problem is the code dereferencing the pgd
> pointer in the first place: Since the pgd pair is written in
> 32-bit units in __pmd_populate(), anything reading it would
> technically have to operate on both entries.
> 
> As the kernel relies on -fno-strict-aliasing, the type mismatch
> is less of a problem than actually doing the potentially wrong
> thing.
> 
> As far as I can tell, we are however saved by pgd_val()
> only ever being used for debug prints, where printing
> the first entry is likely all that is needed to analyse
> the real bug.
> 
> > I would recommend either forcing a struct here, or
> > using a u64 with bitmasks/shifts.  
> 
> That would require extra complexity for the big-endian
> case though.
> 
>     Arnd
> 

