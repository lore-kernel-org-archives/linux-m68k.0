Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C590189510
	for <linux-m68k@lists.linux-m68k.org>; Tue, 15 Oct 2024 05:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=147.75.193.91
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728971907; cv=none; b=MacMhjuhH9zM2ZzMSdL8f+E6B966R1JN1eSYmTk2LwGoEdmnFQn2rA6f3/zvq8tzoMVO1XHHlEDjKpgvY/gyTHF6x2EwPnyMb9Jm3lyYE1RE3EpVB9X3/SVtcwJlJLKQVAihH7ujOUTF0NBo4s4v3H7uO2+IkbDdlXHg+JhO8Os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728971907; c=relaxed/simple;
	bh=Bo5YA9yZSBe+D0lpdePuveWlpCV5YIVCk7/YdaIdQ1I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GDlLQd4LJGBU7HXZIdB0MIEW4UOPotDCL23xdfPX1L3rLTxNc4yXWPSQaub7i/afKI9t9sLMwoxkDAkjLV0zaEWwWbi/QMUYPxkixm1c/ZA20QKDS/JDVsYpnKLx7uopBnSakjsdfzkR6Qwcf+PWSrXR1EYpxYOynfrwOMVsdkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jG5sGGJ/; arc=none smtp.client-ip=147.75.193.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jG5sGGJ/"
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 24023A401EC;
	Tue, 15 Oct 2024 05:58:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 325E1C4CEC7;
	Tue, 15 Oct 2024 05:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728971903;
	bh=Bo5YA9yZSBe+D0lpdePuveWlpCV5YIVCk7/YdaIdQ1I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jG5sGGJ/uyj72sfIjEOgM3YbtVaq12kKOCpq+pn5nPbrPsQT2kC9ydtk/YzTUly5r
	 4eVw7lpNOy5kN1mWcmFmO7tb0cYSymlnAwpq2Wio7c3ZyfvyaEwu9JPC9amMYfUYbj
	 MtCJD0izwYdWw2k3enQm6TEHcbCSImNPeik7wVIFjejDi/qTBQORJWwxVSIAEvqN5Q
	 l9yRtb72GuYxy6JDeT8CrEewKpTCwuiujl9ZpZL5V+ZbK8ZPy8dUW/6qHkWufpsPdi
	 7qTmnW97lTs/3celEWZrNKMwS30XeMtKFXPBKIkve6XIFrcQu+bxXeiRq9P0LbGJXD
	 wA3RYW8I7S+NQ==
Date: Tue, 15 Oct 2024 08:54:29 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: Christoph Hellwig <hch@infradead.org>, Petr Pavlu <petr.pavlu@suse.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
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
Message-ID: <Zw4DlTTbz4QwhOvU@kernel.org>
References: <20241009180816.83591-1-rppt@kernel.org>
 <20241009180816.83591-8-rppt@kernel.org>
 <Zwd7GRyBtCwiAv1v@infradead.org>
 <ZwfPPZrxHzQgYfx7@kernel.org>
 <ZwjXz0dz-RldVNx0@infradead.org>
 <ZwuIPZkjX0CfzhjS@kernel.org>
 <20241013202626.81f430a16750af0d2f40d683@linux-foundation.org>
 <Zw1uBBcG-jAgxF_t@bombadil.infradead.org>
 <Zw3rDS3GRWZe4CBu@bombadil.infradead.org>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zw3rDS3GRWZe4CBu@bombadil.infradead.org>

On Mon, Oct 14, 2024 at 09:09:49PM -0700, Luis Chamberlain wrote:
> Mike, please run this with kmemleak enabled and running, and also try to get
> tools/testing/selftests/kmod/kmod.sh to pass.

There was an issue with kmemleak, I fixed it here:

https://lore.kernel.org/linux-mm/20241009180816.83591-1-rppt@kernel.org/T/#m020884c1795218cc2be245e8091fead1cda3f3e4

> I run into silly boot issues with just a guest.

Was it kmemleak or something else?
 
>   Luis

-- 
Sincerely yours,
Mike.
