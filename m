Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43E96288C05
	for <linux-m68k@lists.linux-m68k.org>; Mon, 19 May 2025 17:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=139.178.84.217
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747675212; cv=none; b=TA7sOEzwNR25HSVA4W+H4Rj9MxqhhnowViZxH/hCorpIEp8C3Umy+CE/Jr0ct51a6FlH2d9Gi23nsbaAePOIBN26iiYF/QGCIvF1FDoMqmHOU89MOBt9MNJWrtBLRJa9f9LbPtZ4HKosB93op1Vps7KCKVLBWMW3T9+PqfN49wQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747675212; c=relaxed/simple;
	bh=/qDPGAJe6QWZQRFh5mkIaN3rUECBPrvhVDophOu0STQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eKB5cAJjwt8GhPUTJAlC8t6qvtxQUQB5/AG8vxFggE3mcTY2+z4WW88S8Pn/MBTJz/M/wk1i+BGlB2kCcJY8LOnyqAa8mcyaql4KD98rOTCV8QqGaT/JcYqYMY634YiaejI1TN8KBhbjGsBPMFvtu61g9OYevQDOTmBsywvXBd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nv6a6o/9; arc=none smtp.client-ip=139.178.84.217
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nv6a6o/9"
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 984855C5516;
	Mon, 19 May 2025 17:17:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0486C4CEE4;
	Mon, 19 May 2025 17:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747675208;
	bh=/qDPGAJe6QWZQRFh5mkIaN3rUECBPrvhVDophOu0STQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nv6a6o/9GXqFce+WdqziKMZrgOnXd14Xk3g4S1nNlUHZltfdV2rEB9RDQCOmCeSgK
	 ebQsjcpfmgR6sWVWBw5dta/I6m1xLYkae6rTJ4OSb859vEywgddyloj50eaFEjRTPe
	 8FJ2qDU6rfYPGiDk1ORLqVzTGk/lQ8qlSrYclPnaRHuqKyuUafe4DFZ6lMgRdY6Wt1
	 dRptEgZtQ8qGZDrQUwGD8JbkbioWwAY9aSpa8iIJWxNVsecoqluy1Xci9uIALX28U6
	 ObnLi7IgFlid4DAXOMe7kw3cQbAB55J7ruXkv/fKErQRWuv0MXWPHfuo3pZS732DBZ
	 yyZPReh2t/BVw==
Date: Mon, 19 May 2025 20:19:48 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Pratyush Yadav <ptyadav@amazon.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Andreas Larsson <andreas@gaisler.com>,
	Andy Lutomirski <luto@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>, Borislav Petkov <bp@alien8.de>,
	Brian Cain <bcain@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"David S. Miller" <davem@davemloft.net>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Guo Ren <guoren@kernel.org>, Heiko Carstens <hca@linux.ibm.com>,
	Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Mark Brown <broonie@kernel.org>, Matt Turner <mattst88@gmail.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Michal Simek <monstr@monstr.eu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Richard Weinberger <richard@nod.at>,
	Russell King <linux@armlinux.org.uk>,
	Stafford Horne <shorne@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vasily Gorbik <gor@linux.ibm.com>, Vineet Gupta <vgupta@kernel.org>,
	Will Deacon <will@kernel.org>, Praveen Kumar <pravkmr@amazon.de>,
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-um@lists.infradead.org,
	linux-arch@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org
Subject: Re: [PATCH v2 10/13] arch, mm: set high_memory in free_area_init()
Message-ID: <aCtoNLf1FbtqijGr@kernel.org>
References: <20250313135003.836600-1-rppt@kernel.org>
 <20250313135003.836600-11-rppt@kernel.org>
 <mafs05xi0o9ri.fsf@amazon.de>
 <aCdveN2w9ThjVhae@kernel.org>
 <dc4e60dc-9b78-473a-9c18-3a2f128a02d2@ghiti.fr>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dc4e60dc-9b78-473a-9c18-3a2f128a02d2@ghiti.fr>

Hi Alexandre,

On Mon, May 19, 2025 at 05:54:23PM +0200, Alexandre Ghiti wrote:
> Hi Mike,
> 
> I encountered the same error as Pratyush and the above diff fixes it: do you
> plan on sending this fix for 6.15?
> 
> If so, you can add:
> 
> Tested-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Thanks!
Here's the patch:
https://lore.kernel.org/linux-mm/20250519171805.1288393-1-rppt@kernel.org

> Thanks,
> Alex

-- 
Sincerely yours,
Mike.
