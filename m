Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A7BF17ADF0
	for <linux-m68k@lists.linux-m68k.org>; Thu, 17 Oct 2024 15:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=147.75.193.91
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729179289; cv=none; b=REoT9/Zbofhr2tig6plzui0zsn7ldGdBjIK8kDuCrl+X0t6bz9A+FbrAGR7Exq6Hb3Dbg9oozQfcIHO0eBX2z8fJc5ZfqO7SBpn5X0oo2a9nC7qHVUVoW2Hhtgw8HHEd/KebMEFMjhRk/3OYoGkDgDTnm9OxOe1LRRba2VkZ+2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729179289; c=relaxed/simple;
	bh=nzTlkeEckY4SDdkxVWF1AoJhGSXOvj0VWFdu9nVmTI4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MqQamW5xAY48mF43HQbY/2t65aa7Emq3hGWNrTDWV27jZHhkIXmIvxHUfUQ23ZhLSiXEpfBHStguOYCVWIvKwdcA0g7vVHtVvzDsLOequvWf56q46bRA5v7eFIuvHAeAI+rA6mwbzCLZ+pepKNuHvzKN/xS2ntt/qaFGnC2PIeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=kernel.org; arc=none smtp.client-ip=147.75.193.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 492E1A4412A;
	Thu, 17 Oct 2024 15:34:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1027DC4CECD;
	Thu, 17 Oct 2024 15:34:38 +0000 (UTC)
Date: Thu, 17 Oct 2024 11:35:02 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Mike Rapoport <rppt@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Andrew Morton
 <akpm@linux-foundation.org>, Luis Chamberlain <mcgrof@kernel.org>, Andreas
 Larsson <andreas@gaisler.com>, Andy Lutomirski <luto@kernel.org>, Ard
 Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Borislav
 Petkov <bp@alien8.de>, Brian Cain <bcain@quicinc.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Christoph Hellwig <hch@infradead.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, Dave Hansen
 <dave.hansen@linux.intel.com>, Dinh Nguyen <dinguyen@kernel.org>, Geert
 Uytterhoeven <geert@linux-m68k.org>, Guo Ren <guoren@kernel.org>, Helge
 Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar
 <mingo@redhat.com>, Johannes Berg <johannes@sipsolutions.net>, John Paul
 Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Kent Overstreet
 <kent.overstreet@linux.dev>, "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Mark Rutland <mark.rutland@arm.com>, Masami Hiramatsu
 <mhiramat@kernel.org>, Matt Turner <mattst88@gmail.com>, Max Filippov
 <jcmvbkbc@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>, Michal Simek
 <monstr@monstr.eu>, Oleg Nesterov <oleg@redhat.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Richard Weinberger <richard@nod.at>, Russell King
 <linux@armlinux.org.uk>, Song Liu <song@kernel.org>, Stafford Horne
 <shorne@gmail.com>, Suren Baghdasaryan <surenb@google.com>, Thomas
 Bogendoerfer <tsbogend@alpha.franken.de>, Thomas Gleixner
 <tglx@linutronix.de>, Uladzislau Rezki <urezki@gmail.com>, Vineet Gupta
 <vgupta@kernel.org>, Will Deacon <will@kernel.org>, bpf@vger.kernel.org,
 linux-alpha@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
 linux-hexagon@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-mm@kvack.org, linux-modules@vger.kernel.org,
 linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-sh@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-trace-kernel@vger.kernel.org,
 linux-um@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 loongarch@lists.linux.dev, sparclinux@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH v6 6/8] x86/module: prepare module loading for ROX
 allocations of text
Message-ID: <20241017113453.685ba175@gandalf.local.home>
In-Reply-To: <ZxD0EVBoO-jcxEGE@kernel.org>
References: <20241016122424.1655560-1-rppt@kernel.org>
	<20241016122424.1655560-7-rppt@kernel.org>
	<20241016170128.7afeb8b0@gandalf.local.home>
	<20241017093515.GU16066@noisy.programming.kicks-ass.net>
	<ZxD0EVBoO-jcxEGE@kernel.org>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 17 Oct 2024 14:25:05 +0300
Mike Rapoport <rppt@kernel.org> wrote:

> With this series the module text is allocated as ROX at the first place, so
> the modifications ftrace does to module text have to either use text poking
> even before complete_formation() or deal with a writable copy like I did
> for relocations and alternatives.
> 
> I've been carrying the ftrace changes from a very old prototype and
> didn't pay enough attention to them them until Steve's complaint.
> 
> I'll look into it.

I just posted a patch where you can see the effects of these changes with
respect to ftrace patching times.

  https://lore.kernel.org/all/20241017113105.1edfa943@gandalf.local.home/

I'll be adding this to the next merge window.

-- Steve
