Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3FF6207207
	for <linux-m68k@lists.linux-m68k.org>; Wed, 16 Oct 2024 10:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=139.178.84.217
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729075494; cv=none; b=kH5JtCsUEuQmuaJ30LxlMLY1cnVn5hOzLIv2hhbQ751+nxw2QGy8hXTmWYJxqew1AgPEzBpdZS5E1gidSAbVdXRVBCE17I3pm4Fj1t7QgDvoY+zV+jHgRG6nG+SxaAzxijIIUwPUNI814rm4yPk99svIK+1brkatvJxHBGWUEEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729075494; c=relaxed/simple;
	bh=REY0yUs/eb8jGqS7iPmNLu0O7M3zjCPm2K1uOQnlIfY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pDSjCUx7qRw84K++JqeHo00gpZW4TAMwmdqudsQXaT1GmvTxEReIyjXJxUEeXVWQnQMAmDJue8uWpGJy9MwN1YlXtIYzg5BSR5ujVzAlzPyLh0TtF9L3teBSSzDJAkNQC2XP/SXKFdQ6z3n9aVA6VxU37q8vJmw5jKvb5ajKe1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tu7R+TE5; arc=none smtp.client-ip=139.178.84.217
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tu7R+TE5"
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D240E5C5FDD;
	Wed, 16 Oct 2024 10:44:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A439EC4CEC5;
	Wed, 16 Oct 2024 10:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729075491;
	bh=REY0yUs/eb8jGqS7iPmNLu0O7M3zjCPm2K1uOQnlIfY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tu7R+TE5l4rMjxEyzDDIH6fpt5ZNmC1c7xJx7SQDlI9CzDxMt5yOQnVYNAW9hdV8J
	 OeaDo9Hr12xvhUKQgId1tm4/CewmMpWCLOk3wgiUJwXyvWq4QlFB+Uh/pOgd95q0F1
	 zyNekZpzro5oJZ2JEUpyorUNUZLep/wgUFWwzFdkGHL+BF7JNIRifDS33KF/5qGC2v
	 jYrUvBLfr/xZZ4LfL7bWflm1YPeuIUzgGbLP+eWNj7AbuOUcsPGdhrgXCl4uUGrO38
	 j9PqqivnqqmoYQsjfU9edkgWUJ3Ic8/MVLUiY8xlv+pKvbZQmwKQdokHEcp8hCdCUB
	 nLnfE4mx3UK6g==
Date: Wed, 16 Oct 2024 13:40:55 +0300
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
	sparclinux@vger.kernel.org, x86@kernel.org, kdevops@lists.linux.dev
Subject: Re: [PATCH v5 7/8] execmem: add support for cache of large ROX pages
Message-ID: <Zw-YN4JIltntY52Y@kernel.org>
References: <20241009180816.83591-8-rppt@kernel.org>
 <Zwd7GRyBtCwiAv1v@infradead.org>
 <ZwfPPZrxHzQgYfx7@kernel.org>
 <ZwjXz0dz-RldVNx0@infradead.org>
 <ZwuIPZkjX0CfzhjS@kernel.org>
 <20241013202626.81f430a16750af0d2f40d683@linux-foundation.org>
 <Zw1uBBcG-jAgxF_t@bombadil.infradead.org>
 <Zw3rDS3GRWZe4CBu@bombadil.infradead.org>
 <Zw4DlTTbz4QwhOvU@kernel.org>
 <Zw7MirnsHnhRveBB@bombadil.infradead.org>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zw7MirnsHnhRveBB@bombadil.infradead.org>

On Tue, Oct 15, 2024 at 01:11:54PM -0700, Luis Chamberlain wrote:
> On Tue, Oct 15, 2024 at 08:54:29AM +0300, Mike Rapoport wrote:
> > On Mon, Oct 14, 2024 at 09:09:49PM -0700, Luis Chamberlain wrote:
> > > Mike, please run this with kmemleak enabled and running, and also try to get
> > > tools/testing/selftests/kmod/kmod.sh to pass.
> > 
> > There was an issue with kmemleak, I fixed it here:
> > 
> > https://lore.kernel.org/linux-mm/20241009180816.83591-1-rppt@kernel.org/T/#m020884c1795218cc2be245e8091fead1cda3f3e4
> 
> Ah, so this was a side fix, not part of this series, thanks.
> 
> > > I run into silly boot issues with just a guest.
> > 
> > Was it kmemleak or something else?
> 
> Both kmemleak and the kmod selftest failed, here is a run of the test
> with this patch series:
> 
> https://github.com/linux-kdevops/linux-modules-kpd/actions/runs/11352286624/job/31574722735

Is there a kernel log to look at? Could not find it in the run report
 
>   Luis

-- 
Sincerely yours,
Mike.
