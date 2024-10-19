Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B40D193081
	for <linux-m68k@lists.linux-m68k.org>; Sat, 19 Oct 2024 22:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=147.75.193.91
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729377048; cv=none; b=S7fbO3N3wNZMGmjlxhF0wSFxJNvaR6KFZqQpRYGA632uoJKWCb3YB39vT8CjXynXj2hmV18hpCRedkFM3bi3b960j0iZ2BfOMYl/g/XGLNxChW5BJ9N7k2qu86pbNvvB6pwkb9hNc9ThGg1fGFpTmGlnLKN1YozmkJ+2XMNMT+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729377048; c=relaxed/simple;
	bh=QyfIXk+096xDFBJfNhGtA+h7+x144NJyXqGZEWCxEbA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qCR1YkLkaIN9bhWsqvDmUa3FNmr94I3zPGEV/i2iSe2X7mGrs6utLXMbrt6W2hXPUrJWGl7nq4Kr/FXo1U7/r6GbHTUhy2o+gatgZWOC9kU6/6/jAso4qrdp/p78k4co2nWauymQGHgCYCZ9VmcWg1wIOn7cML3nMdT0Hbs64Uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CErL8/nt; arc=none smtp.client-ip=147.75.193.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CErL8/nt"
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 0111FA40448;
	Sat, 19 Oct 2024 22:30:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF36EC4CEC5;
	Sat, 19 Oct 2024 22:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729377044;
	bh=QyfIXk+096xDFBJfNhGtA+h7+x144NJyXqGZEWCxEbA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CErL8/nta/6r/1WJkkwG/t5evnd+rztuMKPvEAcvD2SnHlbG8tiM8oebQum4YnbtM
	 jKRTZBaC+ATcd4VCxL5682bSGxbHvqjRzPrn6cR/xecdWEBWr3gweQycvt1RfyCGs7
	 MiXNOy+V4Fewi4RfizJAsZmsup5CQWNXqWmaamyVMyXGW/hUqx3sW49nhqNlGd3ZzY
	 ETj4BkT4BYSwhfn/AQ96YSvs+Sq6IlTIlZXVNMpeHMX+0ZQjv+FZRA/RKrz+t3dZ4u
	 1qH1N38SWuCE3fte75V0TIkKwCKF9lts668sBgQlwW5eAV1dEKJXhxg+1WEdnmmBQI
	 jKYmcc+lcknEw==
Date: Sat, 19 Oct 2024 15:30:41 -0700
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
	sparclinux@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH v6 4/8] module: prepare to handle ROX allocations for text
Message-ID: <ZxQzEdJqU6TCEH5f@bombadil.infradead.org>
References: <20241016122424.1655560-1-rppt@kernel.org>
 <20241016122424.1655560-5-rppt@kernel.org>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241016122424.1655560-5-rppt@kernel.org>

On Wed, Oct 16, 2024 at 03:24:20PM +0300, Mike Rapoport wrote:
> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> 
> In order to support ROX allocations for module text, it is necessary to
> handle modifications to the code, such as relocations and alternatives
> patching, without write access to that memory.
> 
> One option is to use text patching, but this would make module loading
> extremely slow and will expose executable code that is not finally formed.
> 
> A better way is to have memory allocated with ROX permissions contain
> invalid instructions and keep a writable, but not executable copy of the
> module text. The relocations and alternative patches would be done on the
> writable copy using the addresses of the ROX memory.
> Once the module is completely ready, the updated text will be copied to ROX
> memory using text patching in one go and the writable copy will be freed.
> 
> Add support for that to module initialization code and provide necessary
> interfaces in execmem.
> 
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

Reviewd-by: Luis Chamberlain <mcgrof@kernel.org>

  Luis
