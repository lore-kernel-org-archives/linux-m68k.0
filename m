Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 893FF84D3E
	for <linux-m68k@lists.linux-m68k.org>; Mon, 14 Oct 2024 03:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=139.178.84.217
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728876393; cv=none; b=Q1uLjIEIhTI3awe9uEtEdETK25TBQuR7/+8DCJlyGRv7qDS0ijMB8oR2CsqdlDK3MG6D2spmhC13gemqZSGXRTnT9CQuP2D8LwNNWNcgohcmVjUVziLFatyNHhpBnDnKT6JOIbdge6d0yayEdgtrVnuUBR1BEqxsFIgxxDHD9EY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728876393; c=relaxed/simple;
	bh=OYTP/1rnVlMgoHj5ReLaVqv3uJi7mKW1XAcNVGficbk=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=MGEluG6dD62chxx6P0StXm1aWysgWZ1ACq0Q/we4L/bobmGpxNwtB/ONt5HvQc8jVWiYBaA17tfuDfeMsiIrys/Xlc4IgYCLuzSQk95SBWf5SiODMDYdoDJFVnjUZUSkHnxZqgmlkJ2tY8TwPJ/VK3/AH+vbGgj6jET2tlGLzio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linux-foundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=qTixcVvw; arc=none smtp.client-ip=139.178.84.217
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="qTixcVvw"
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6AB375C55BB;
	Mon, 14 Oct 2024 03:26:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A751C4CEC3;
	Mon, 14 Oct 2024 03:26:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1728876389;
	bh=OYTP/1rnVlMgoHj5ReLaVqv3uJi7mKW1XAcNVGficbk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=qTixcVvw7g3WJhbtvzuUfsX4xifF6FfeMa1/Jgt9Fz1P+9pRT0LjuXsF9ZPRLI0SQ
	 0YjCPAfHHkhZg2HwK0M7/hyF0QAETn0AmpsAYMB/N0iawqVPDDMLW9IdJaDIuO+7xa
	 37UFA5ONzpdACn1y2MXDIXwSekPMLBfeKmJmLlvM=
Date: Sun, 13 Oct 2024 20:26:26 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Mike Rapoport <rppt@kernel.org>
Cc: Christoph Hellwig <hch@infradead.org>, Andreas Larsson
 <andreas@gaisler.com>, Andy Lutomirski <luto@kernel.org>, Ard Biesheuvel
 <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Borislav Petkov
 <bp@alien8.de>, Brian Cain <bcain@quicinc.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Christophe Leroy <christophe.leroy@csgroup.eu>,
 Dave Hansen <dave.hansen@linux.intel.com>, Dinh Nguyen
 <dinguyen@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Guo Ren
 <guoren@kernel.org>, Helge Deller <deller@gmx.de>, Huacai Chen
 <chenhuacai@kernel.org>, Ingo Molnar <mingo@redhat.com>, Johannes Berg
 <johannes@sipsolutions.net>, John Paul Adrian Glaubitz
 <glaubitz@physik.fu-berlin.de>, Kent Overstreet
 <kent.overstreet@linux.dev>, "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Luis Chamberlain <mcgrof@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Masami Hiramatsu <mhiramat@kernel.org>, Matt Turner <mattst88@gmail.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Michal Simek <monstr@monstr.eu>, Oleg Nesterov <oleg@redhat.com>, Palmer
 Dabbelt <palmer@dabbelt.com>, Peter Zijlstra <peterz@infradead.org>,
 Richard Weinberger <richard@nod.at>, Russell King <linux@armlinux.org.uk>,
 Song Liu <song@kernel.org>, Stafford Horne <shorne@gmail.com>, Steven
 Rostedt <rostedt@goodmis.org>, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>, Thomas Gleixner <tglx@linutronix.de>,
 Uladzislau Rezki <urezki@gmail.com>, Vineet Gupta <vgupta@kernel.org>, Will
 Deacon <will@kernel.org>, bpf@vger.kernel.org, linux-alpha@vger.kernel.org,
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
Subject: Re: [PATCH v5 7/8] execmem: add support for cache of large ROX
 pages
Message-Id: <20241013202626.81f430a16750af0d2f40d683@linux-foundation.org>
In-Reply-To: <ZwuIPZkjX0CfzhjS@kernel.org>
References: <20241009180816.83591-1-rppt@kernel.org>
	<20241009180816.83591-8-rppt@kernel.org>
	<Zwd7GRyBtCwiAv1v@infradead.org>
	<ZwfPPZrxHzQgYfx7@kernel.org>
	<ZwjXz0dz-RldVNx0@infradead.org>
	<ZwuIPZkjX0CfzhjS@kernel.org>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 13 Oct 2024 11:43:41 +0300 Mike Rapoport <rppt@kernel.org> wrote:

> > > The idea is to keep everything together and have execmem_info describe all
> > > that architecture needs. 
> > 
> > But why?  That's pretty different from our normal style of arch hooks,
> > and introduces an indirect call in a security sensitive area.
> 
> Will change to __weak hook. 
> 

Thanks, I'll drop the v1 series;

The todos which I collected are:

https://lkml.kernel.org/r/CAPhsuW66etfdU3Fvk0KsELXcgWD6_TkBFjJ-BTHQu5OejDsP2w@mail.gmail.com
https://lkml.kernel.org/r/Zwd6vH0rz0PVedLI@infradead.org
https://lkml.kernel.org/r/ZwjXz0dz-RldVNx0@infradead.org
https://lkml.kernel.org/r/202410111408.8fe6f604-lkp@intel.com
