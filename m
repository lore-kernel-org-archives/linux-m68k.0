Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F5CC1EBFF8
	for <linux-m68k@lists.linux-m68k.org>; Tue,  5 Nov 2024 19:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=139.178.84.217
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730833476; cv=none; b=KrEW8uQqOBr8bKPFNdaPuGGxgTR68E2el4W6tZelsDp8RqEaJIebdKL+qCZ1dsDPDaXmxWU0/3bmKDDnzZjyJe1z2VGzTre6ZO7m9p5LINcuUpLkemswP2IR2jdEx6uv6PzEUJRv7mGn0p8/pwYTjjVrI+1ksdk8L9tYLNAtljA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730833476; c=relaxed/simple;
	bh=uoF4ZbISUkj3LBJVbm7mjK2pNt272UgYSEG9wAikNJE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sM8U9GYfIEyt4dUdPede3LsF9issopE3oLazLa6h461obA2VghbhACZ0wmEbzeWqyQR2Aw6JjwQ9iyZuRWh+vI2DZL5jWm08cQhNkIR4lLrmvGwKVPdP+aHd4S9gVm6LXB8baArWv8AfkS0YItj6uqtIJs5Dsm7QHO08KyVXLRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ndFUDxiZ; arc=none smtp.client-ip=139.178.84.217
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ndFUDxiZ"
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 09E375C4357;
	Tue,  5 Nov 2024 19:03:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14183C4CECF;
	Tue,  5 Nov 2024 19:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730833472;
	bh=uoF4ZbISUkj3LBJVbm7mjK2pNt272UgYSEG9wAikNJE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ndFUDxiZpHd3P71EA4Dtdpamj3S+pD0a2NSCYEIkT703any4R0lrK0H/JhQd4Hv2S
	 hAfH0p9N7ObDyDDis1fM3KZKbcT6xDBcyV1iwhCKpgr5eJTjsn996Jr680vAO44Otj
	 drCVf6YoRKOceIQN9knu/aAssyHKuocecyBZr/vNKZiP9PdCl8g8D3PbpLRYGfT7S3
	 8Jxa1hlnrGJeQdCliPqKl36JEkEIgDaJdtPl3tXojvE85kFpWmMnDAcr4PjH7oX62l
	 V8Za49Z9doiMVqhjlWd7GWzNdgnAXYy87njYhKhjV/rXdMfHzibVSbsFtDSY64+oSA
	 zKXctAOfMY/4A==
Date: Tue, 5 Nov 2024 12:04:27 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
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
	sparclinux@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH v7 6/8] x86/module: prepare module loading for ROX
 allocations of text
Message-ID: <20241105190427.GA2903209@thelio-3990X>
References: <20241023162711.2579610-1-rppt@kernel.org>
 <20241023162711.2579610-7-rppt@kernel.org>
 <20241104232741.GA3843610@thelio-3990X>
 <ZynDAhW0lKCfOqZl@kernel.org>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZynDAhW0lKCfOqZl@kernel.org>

On Tue, Nov 05, 2024 at 09:02:26AM +0200, Mike Rapoport wrote:
> There's a silly mistake in cfi_rewrite_endbr() in that commit, the patch
> below should fix it. Can you please test?

Yup, that was it! All my machines boot with this diff applied on top of
next-20241105, so with that fixed, I think we are all good here.

Tested-by: Nathan Chancellor <nathan@kernel.org>

> diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
> index 3407efc26528..243843e44e89 100644
> --- a/arch/x86/kernel/alternative.c
> +++ b/arch/x86/kernel/alternative.c
> @@ -1241,7 +1241,7 @@ static void cfi_rewrite_endbr(s32 *start, s32 *end, struct module *mod)
>  		void *addr = (void *)s + *s;
>  		void *wr_addr = module_writable_address(mod, addr);
>  
> -		poison_endbr(addr+16, wr_addr, false);
> +		poison_endbr(addr + 16, wr_addr + 16, false);
>  	}
>  }

Cheers,
Nathan
