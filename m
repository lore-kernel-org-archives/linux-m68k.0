Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFC1D1E22F5
	for <linux-m68k@lists.linux-m68k.org>; Wed,  9 Oct 2024 20:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=139.178.84.217
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728505475; cv=none; b=oOtYS95U+vNPCZpRzGAIs+jyp9F+2/ksQsZGjd7IQlpRxM558MhJkf4AzoqOQ8154I5h1hRz6oCHBS8AUsKoGL+s0uONucxM+0A6MaQWP4D2XtHkFbfaLJLWmoZbWZvvs29WNIEs4pCiBkB6ZZ9nEzBzRgJ8HfbU7cd6MH8JpLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728505475; c=relaxed/simple;
	bh=Eajpzm9cUrzs//zMnCTfeMFhUIL/3eN5uDlR9BWdmqo=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=FYzi4UEoLlMYeuanG7g4/LEUggRGnD3IjucSNXzTsBqRc03eEZwWOOikilF3Av92zxVFKzvftWH7o6bG9vNx487A0r81nPReeNV9yO4XWCVacIdFkyEFBDpx9aSxMuRGUuGiJlH/BW5ovbm9XsJcqiId9P8lwrp26pTlKOexlGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linux-foundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=2qzkbhuA; arc=none smtp.client-ip=139.178.84.217
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="2qzkbhuA"
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6D42C5C58B1;
	Wed,  9 Oct 2024 20:24:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D537EC4CECC;
	Wed,  9 Oct 2024 20:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1728505469;
	bh=Eajpzm9cUrzs//zMnCTfeMFhUIL/3eN5uDlR9BWdmqo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=2qzkbhuAMgino0DZ1hZZqBEMfexCBWtSiEWzzjILyq+cbaAjGfaWTcyToRrfMFDWm
	 Pjg8qjtjvKxkLVmq5KcKfEzMazZd7B9b+cvi3EOmzQaV9Z6xen8oKafvJ4u9r6ZkXt
	 owPHlRmA15/hxoqOKllm//ythdYQC4jZ89tWfNZw=
Date: Wed, 9 Oct 2024 13:24:27 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Mike Rapoport <rppt@kernel.org>
Cc: Andreas Larsson <andreas@gaisler.com>, Andy Lutomirski
 <luto@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann
 <arnd@arndb.de>, Borislav Petkov <bp@alien8.de>, Brian Cain
 <bcain@quicinc.com>, Catalin Marinas <catalin.marinas@arm.com>, Christoph
 Hellwig <hch@infradead.org>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Dave Hansen <dave.hansen@linux.intel.com>,
 Dinh Nguyen <dinguyen@kernel.org>, Geert Uytterhoeven
 <geert@linux-m68k.org>, Guo Ren <guoren@kernel.org>, Helge Deller
 <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar
 <mingo@redhat.com>, Johannes Berg <johannes@sipsolutions.net>, John Paul
 Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Kent Overstreet
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
Message-Id: <20241009132427.5c94fb5942bae3832446bca5@linux-foundation.org>
In-Reply-To: <20241009180816.83591-8-rppt@kernel.org>
References: <20241009180816.83591-1-rppt@kernel.org>
	<20241009180816.83591-8-rppt@kernel.org>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed,  9 Oct 2024 21:08:15 +0300 Mike Rapoport <rppt@kernel.org> wrote:

> Using large pages to map text areas reduces iTLB pressure and improves
> performance.

Are there any measurable performance improvements?

What are the effects of this series upon overall memory consumption?

The lack of acks is a bit surprising for a v5 patch, but I'll add all
this to mm.git for some testing, thanks.

