Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45C22291C07
	for <linux-m68k@lists.linux-m68k.org>; Mon, 12 Jan 2026 22:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.105.4.254
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768256618; cv=none; b=XNZt5BxhphgGYSLKV+H2NsvP3sLImKT9k/5Xcqj4q9jB/MYxWV5p8LxiuDCCoQKvNy6+olCop4TPugpv29LRBZ5frCRMVbJGej1czbUze6uKVAmzXsW8GPEcs8vI/ljS0ren0Wm3IuHwAujlYiaC4XdWqn3N4nRp0tB3hPQugwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768256618; c=relaxed/simple;
	bh=SpuDKcG9IirDr1Ez2z498LsN8t6S/nWxhPc0slzDnQc=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=QfENJ6lQHGdPRUkv1MQBh6/7k54YSPIIj1qyzgbnsz3v7OetRKKocSoT5SvbBZy/ytxwDzh4n1UZaQK3EbbpAbF4H5ae5gtBzgmspmNvkKZp18xZY9mKyTPShCx8EOWxt6oQSVV6lWn+IH/FsAB2hsi/2If41JqrPtg1AR8KshY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linux-foundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=Cu3Pfm/+; arc=none smtp.client-ip=172.105.4.254
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Cu3Pfm/+"
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id ED79B6000A;
	Mon, 12 Jan 2026 22:23:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1AAAC116D0;
	Mon, 12 Jan 2026 22:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1768256605;
	bh=SpuDKcG9IirDr1Ez2z498LsN8t6S/nWxhPc0slzDnQc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Cu3Pfm/+1TcchxFM/qGiV5fGrKj24o0e3dohdRVVx8JRBK5f1xTeaKdQe1aN7KItj
	 nSpF4OOybQ5f2IlmddpVi4OD3JNYihOeyIRTxNzuxSiGem9/NnrlLPMv/9xRBenAfz
	 EMoQzi5wVQrdA51MdiCDjlgWkvA7qQuIwG0aa67A=
Date: Mon, 12 Jan 2026 14:23:23 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Mike Rapoport <rppt@kernel.org>, Kalle Niemi <kaleposti@gmail.com>
Cc: Alex Shi <alexs@kernel.org>, Alexander Gordeev <agordeev@linux.ibm.com>,
 Andreas Larsson <andreas@gaisler.com>, Borislav Petkov <bp@alien8.de>,
 Brian Cain <bcain@kernel.org>, "Christophe Leroy (CS GROUP)"
 <chleroy@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 "David S. Miller" <davem@davemloft.net>, Dave Hansen
 <dave.hansen@linux.intel.com>, David Hildenbrand <david@kernel.org>, Dinh
 Nguyen <dinguyen@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Guo Ren <guoren@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, Helge
 Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar
 <mingo@redhat.com>, Johannes Berg <johannes@sipsolutions.net>, John Paul
 Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Jonathan Corbet
 <corbet@lwn.net>, Klara Modin <klarasmodin@gmail.com>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Magnus Lindholm <linmag7@gmail.com>, Matt Turner <mattst88@gmail.com>, Max
 Filippov <jcmvbkbc@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Michal Hocko <mhocko@suse.com>, Michal Simek <monstr@monstr.eu>, Muchun
 Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, Palmer
 Dabbelt <palmer@dabbelt.com>, Pratyush Yadav <pratyush@kernel.org>, Richard
 Weinberger <richard@nod.at>, Ritesh Harjani <ritesh.list@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Stafford Horne <shorne@gmail.com>,
 Suren Baghdasaryan <surenb@google.com>, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>, Thomas Gleixner <tglx@linutronix.de>, Vasily
 Gorbik <gor@linux.ibm.com>, Vineet Gupta <vgupta@kernel.org>, Vlastimil
 Babka <vbabka@suse.cz>, Will Deacon <will@kernel.org>, x86@kernel.org,
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
Subject: Re: [PATCH v3 00/29] arch, mm: consolidate hugetlb early
 reservation
Message-Id: <20260112142323.495fc43e662e7d276b0fa371@linux-foundation.org>
In-Reply-To: <20260111082105.290734-1-rppt@kernel.org>
References: <20260111082105.290734-1-rppt@kernel.org>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 11 Jan 2026 10:20:34 +0200 Mike Rapoport <rppt@kernel.org> wrote:

> v3 changes:
> * fix empty_zero_page initialization on arm
> * fix ZONE_DMA limit calculation on powerpc
> * add Acks

updated, thanks.  I'll suppress the ensuing email flood.

Kalle, can you please retest sometime, see if the BeagleBone Black boot
failure was fixed?

Seems we haven't heard back from rmk regarding
https://lkml.kernel.org/r/aVrUDeSkqqY9ZCtS@shell.armlinux.org.uk.
