Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF3DB1CC8B1
	for <linux-m68k@lists.linux-m68k.org>; Mon, 14 Oct 2024 19:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=147.75.193.91
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728933387; cv=none; b=ux8WVe/Bp6aNfL61LgBxn0J1iAvBELh7Kpf97xFhW60X8W9xVoZ6/WbB/ky7SH8ugDZo5dUDD4Uhp3S2lWYB/UUyQqMqydD02TCwjpvMSFOuUmkHcmjDf0VnVslTCukT2Xrapo60+uKUHwpdIFrju2Uzw85DksNpuNcHWrflYZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728933387; c=relaxed/simple;
	bh=UuppSLaM0kOzMrDSh2RloHR9IgCcKKb57FBSLEkEUWY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qOzrQ9BYfA3vK03L5v0HmosJ8ZLNYeu/nGjPmk1FhR9CD9+ONMR592GBb6zACLao42nvN9mdLw+uNHc5Ok6tR8YlmBOfg00stcoHQcadIdXhQJUEsznSFGRq56h86DOlc8LU5fEl7U+lziHWoRECmFlw8TkAgrWmw1SipWr+lX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EjG/5WZA; arc=none smtp.client-ip=147.75.193.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EjG/5WZA"
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3E184A4271A;
	Mon, 14 Oct 2024 19:16:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DC60C4CEC3;
	Mon, 14 Oct 2024 19:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728933383;
	bh=UuppSLaM0kOzMrDSh2RloHR9IgCcKKb57FBSLEkEUWY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EjG/5WZADaXhvwARHnqKg67eiuXX7gTWxPoitBNELLTxxDNviuMSsmlu/en6P6ED8
	 zpJ52uHjqiz/g2IcIGwuziTngHnAXDzicRERzVAAIDP4l2L6y33KAuyIagMcpMXzl4
	 9dBRK2tjgLlrX3Ons9R5vBST3i3yiewblKFLfAI64WB5+23Fn5KkJljDLeTWRKDZ84
	 jnexNcW9vYFK3px9crwCiVYgH/8ctiyb/DdHjxU96pqWdOL1lwHrwqpz6qzLtvvsU8
	 7pmIeyrMmskmV1mcXKss65BVVX6VBxafQdYx2gdNsA2KwzhcBEiTj2VcG0YSmjPMmN
	 oCmkdGtrERExg==
Date: Mon, 14 Oct 2024 12:16:20 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Sami Tolvanen <samitolvanen@google.com>
Cc: Mike Rapoport <rppt@kernel.org>, Christoph Hellwig <hch@infradead.org>,
	Andreas Larsson <andreas@gaisler.com>,
	Andy Lutomirski <luto@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>, Borislav Petkov <bp@alien8.de>,
	Brian Cain <bcain@quicinc.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
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
Subject: Re: [PATCH v5 7/8] execmem: add support for cache of large ROX pages
Message-ID: <Zw1uBBcG-jAgxF_t@bombadil.infradead.org>
References: <20241009180816.83591-1-rppt@kernel.org>
 <20241009180816.83591-8-rppt@kernel.org>
 <Zwd7GRyBtCwiAv1v@infradead.org>
 <ZwfPPZrxHzQgYfx7@kernel.org>
 <ZwjXz0dz-RldVNx0@infradead.org>
 <ZwuIPZkjX0CfzhjS@kernel.org>
 <20241013202626.81f430a16750af0d2f40d683@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241013202626.81f430a16750af0d2f40d683@linux-foundation.org>

On Sun, Oct 13, 2024 at 08:26:26PM -0700, Andrew Morton wrote:
> On Sun, 13 Oct 2024 11:43:41 +0300 Mike Rapoport <rppt@kernel.org> wrote:
> 
> > > > The idea is to keep everything together and have execmem_info describe all
> > > > that architecture needs. 
> > > 
> > > But why?  That's pretty different from our normal style of arch hooks,
> > > and introduces an indirect call in a security sensitive area.
> > 
> > Will change to __weak hook. 
> > 
> 
> Thanks, I'll drop the v1 series;
> 
> The todos which I collected are:
> 
> https://lkml.kernel.org/r/CAPhsuW66etfdU3Fvk0KsELXcgWD6_TkBFjJ-BTHQu5OejDsP2w@mail.gmail.com
> https://lkml.kernel.org/r/Zwd6vH0rz0PVedLI@infradead.org
> https://lkml.kernel.org/r/ZwjXz0dz-RldVNx0@infradead.org
> https://lkml.kernel.org/r/202410111408.8fe6f604-lkp@intel.com

BTW Andrew I'd like to pick this up through the modules tree, and while
at it, also beat it up with some more testing as we're expanding also
with the modversions stuff for Rust modules.

  Luis
