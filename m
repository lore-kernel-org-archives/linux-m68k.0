Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC9B21BB682
	for <linux-m68k@lists.linux-m68k.org>; Mon,  9 Sep 2024 14:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=139.178.84.217
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725892680; cv=none; b=DMpmud2I2TZrL6gSK32H2fWr6mthxtSgQuZ7fPH19OTcBhtaA5treigDMIUfct+/f863kJ0KI+Qz0/kgSkwtkwu2yTE/0Upda1VYBjR4vCUoDCvA2RCin0KYgBoyO/0nr944bCwwCklm4j8X316ghbZGvSGWQFKopGa5ZnmYZkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725892680; c=relaxed/simple;
	bh=MghDFbPAU9zqqkhW3Xw5vWmg1dmDiUK7SCkrMyPD7PA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mw+FNAWhWUJxG0wa2cMVRMdXMHnV7TNb50PGDV1BP/4l3SrbEB7pftQeNEfGsNh8yz5ZZ5kUq9udT/kcYOhrDndyJAU9wkcNWbiUMUSaJVoJwonnnrsBv4kkX7Sj5Pat333dfJRrlkdArNXklztE6RhQtwi9mKDBEICOoCL9S8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fs6Al/RP; arc=none smtp.client-ip=139.178.84.217
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fs6Al/RP"
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A79975C01BF;
	Mon,  9 Sep 2024 14:37:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BA38C4CEC5;
	Mon,  9 Sep 2024 14:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725892676;
	bh=MghDFbPAU9zqqkhW3Xw5vWmg1dmDiUK7SCkrMyPD7PA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Fs6Al/RPqqDYAd+lPeXebcBiEsV8ZcvYqHnhgbekPtDgt19OlBHjiP9gQSdGe9afm
	 E6dAjll1IYePf87BqvuUHZojSOISa9K5xqnGdYsjKjKAxmrH58TOhb7yDaJfDepFBa
	 KmFe19pfYgaP0P6SOasN93vKsvEqQdqzY5UZFrT5OYDRUwY9bZOJ0yO3EIutfG5ADs
	 9/aQXVlZzbQSnDoIg63nYDc2lsJ+5/3DsjcdPHAdeypnZ/+PEaSwQCoG2ocV6cZ8IN
	 5SSH1gwzGe/PyYVHsa/teqwYFCWwEBH8MNluTcSCH96QK9eENqGcAFK+i9m860tlOX
	 EjTv1+plHkaMQ==
Date: Mon, 9 Sep 2024 17:34:48 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Andreas Larsson <andreas@gaisler.com>,
	Andy Lutomirski <luto@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Borislav Petkov <bp@alien8.de>, Brian Cain <bcain@quicinc.com>,
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
	Luis Chamberlain <mcgrof@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Matt Turner <mattst88@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Michal Simek <monstr@monstr.eu>, Oleg Nesterov <oleg@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Richard Weinberger <richard@nod.at>,
	Russell King <linux@armlinux.org.uk>, Song Liu <song@kernel.org>,
	Stafford Horne <shorne@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
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
	sparclinux@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH v3 6/8] x86/module: perpare module loading for ROX
 allocations of text
Message-ID: <Zt8HiAzcaZS8lHT-@kernel.org>
References: <20240909064730.3290724-1-rppt@kernel.org>
 <20240909064730.3290724-7-rppt@kernel.org>
 <20240909092923.GB4723@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240909092923.GB4723@noisy.programming.kicks-ass.net>

On Mon, Sep 09, 2024 at 11:29:23AM +0200, Peter Zijlstra wrote:
> On Mon, Sep 09, 2024 at 09:47:28AM +0300, Mike Rapoport wrote:
> > diff --git a/arch/x86/kernel/ftrace.c b/arch/x86/kernel/ftrace.c
> > index 8da0e66ca22d..563d9a890ce2 100644
> > --- a/arch/x86/kernel/ftrace.c
> > +++ b/arch/x86/kernel/ftrace.c
> 
> > @@ -654,4 +656,15 @@ void ftrace_graph_func(unsigned long ip, unsigned long parent_ip,
> >  }
> >  #endif
> >  
> > +void ftrace_swap_func(void *a, void *b, int n)
> > +{
> > +	unsigned long t;
> > +
> > +	WARN_ON_ONCE(n != sizeof(t));
> > +
> > +	t = *((unsigned long *)a);
> > +	text_poke_copy(a, b, sizeof(t));
> > +	text_poke_copy(b, &t, sizeof(t));
> > +}
> 
> This is insane, just force BUILDTIME_MCOUNT_SORT

The comment in ftrace.c says "... while mcount loc in modules can not be
sorted at build time"
 
I don't know enough about objtool, but I'd presume it's because the sorting
should happen after relocations, no?

-- 
Sincerely yours,
Mike.
