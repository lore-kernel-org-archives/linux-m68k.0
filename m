Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDE4A192D7B
	for <linux-m68k@lists.linux-m68k.org>; Sat, 19 Oct 2024 22:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=147.75.193.91
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729376237; cv=none; b=Hnavnq3zTxHaHz/R8SvTi1oCEYa2zWqgGeEkmemun71XzB+KANZNcHp9b2brA/5vRc2MPjUDXJlyFzwhE+PV8m9Nyj3nFXuIjIxqMSRCA7nirb9cqiciGYeW4V5/b535+5PW9r6Mb8dlrK7Ib4nyhLq/3T+VkOfOYGY1snZJwsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729376237; c=relaxed/simple;
	bh=Z2c0wsfmuX1zi8SflpbS251BcU2hxlDOujSruYyu/d0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y6bgq9eAdbPphsjfbTKhrnvsDJ3uWPadv+JDNBMr0bCzSFoA7HqdP3SjenfM6AFCRJfcNQ6oyMKoCtCxkf2z4edw6vHqCCZXScaz3H+LXLlAG+4LU+J5TVHz9dsiC6CWX95/9N2nr0kb0BvDFsS3KLro9WxaiyMAk0aas31B4L4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y3/Gl4uf; arc=none smtp.client-ip=147.75.193.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y3/Gl4uf"
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 01DECA40448;
	Sat, 19 Oct 2024 22:17:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2BF9C4CEC5;
	Sat, 19 Oct 2024 22:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729376233;
	bh=Z2c0wsfmuX1zi8SflpbS251BcU2hxlDOujSruYyu/d0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y3/Gl4ufOW+DMjq3rv6lYuhhIdTKFTpnYyq9HW3K85Fpw/HAzL0vMrW4IM6WgA6ot
	 bjEzE8mPv3G48TEzrc49STj8tErEueRnWJWErlpFGCRDNYXxf9im+wvXTmSV4zaKV0
	 ldRIuiJMSPHK7+jcRgJoan6AukGaTfuRN0fLb0k4bEoOLO4bzzu30c0zr4xQe5rqsB
	 ele2dWq5/Lat3gCmSxFXcXRfJdqOONJR5Y9PAtRblqYiPb3tzG5o6SkuYpbslQB3Wg
	 ZrBARuLjQoY8sKdBblenF5FJQAR6rsrhvv/Ra8Vcs8mcf/tC+y4RqwTBTJVaeAg57/
	 Qr4B5j9wt3E/A==
Date: Sat, 19 Oct 2024 15:17:10 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Andreas Larsson <andreas@gaisler.com>,
	Andy Lutomirski <luto@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>, Borislav Petkov <bp@alien8.de>,
	Brian Cain <bcain@quicinc.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christoph Hellwig <hch@infradead.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Guo Ren <guoren@kernel.org>, Helge Deller <deller@gmx.de>,
	Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Kent Overstreet <kent.overstreet@linux.dev>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Matt Turner <mattst88@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Michal Simek <monstr@monstr.eu>, Oleg Nesterov <oleg@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Richard Weinberger <richard@nod.at>,
	Russell King <linux@armlinux.org.uk>, Song Liu <song@kernel.org>,
	Stafford Horne <shorne@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Uladzislau Rezki <urezki@gmail.com>,
	Vineet Gupta <vgupta@kernel.org>, Will Deacon <will@kernel.org>,
	bpf@vger.kernel.org, linux-alpha@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org, linux-mm@kvack.org,
	linux-modules@vger.kernel.org, linux-openrisc@vger.kernel.org,
	linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-sh@vger.kernel.org, linux-snps-arc@lists.infradead.org,
	linux-trace-kernel@vger.kernel.org, linux-um@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev,
	sparclinux@vger.kernel.org, x86@kernel.org,
	Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH v6 1/8] mm: vmalloc: group declarations depending on
 CONFIG_MMU together
Message-ID: <ZxQv5vUuaFBT6Kxd@bombadil.infradead.org>
References: <20241016122424.1655560-1-rppt@kernel.org>
 <20241016122424.1655560-2-rppt@kernel.org>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241016122424.1655560-2-rppt@kernel.org>

On Wed, Oct 16, 2024 at 03:24:17PM +0300, Mike Rapoport wrote:
> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> 
> There are a couple of declarations that depend on CONFIG_MMU in
> include/linux/vmalloc.h spread all over the file.
> 
> Group them all together to improve code readability.
> 
> No functional changes.
> 
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> Reviewed-by: Christoph Hellwig <hch@lst.de>

Reviewed-by: Luis Chamberlain <mcgrof@kernel.org>

  Luis
