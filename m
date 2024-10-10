Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 419BB1A0732
	for <linux-m68k@lists.linux-m68k.org>; Thu, 10 Oct 2024 05:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=139.178.84.217
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728539267; cv=none; b=UcNX1R4iD3fUbZ+vsY3iNkcvuYkjLs4jCo81mKVybbiHVmdgyzehPn6lA9qaTBMwiS029bVbJRUkIhko0nJliUE3fy6JImiBfeV/0YBcIcUJGZsCbIdcz+zslUMxVc0QFeZI4MhxSlCj56p/sw3R+QBhdUGZ8naO2Gos8JAhsu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728539267; c=relaxed/simple;
	bh=OTuy4VqE5rZSLBEA0/Pnb2zLZJiAXIMvgimloV5JAr4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=USQQ2yrJUz2Vn+zgnXBQ2O9IO73fk60ymmWdW6Sa5VKtEQuMMgKf4aOosU2e/CjfqkF1EExIJJMZpA/Q9zLtWm7yy3ayVgej8ICygZNMiQjUMRkAFfZhVklHsCsxGAwkBOcwW71rR6+qSnhDOP2fK7GHyVn8Qk/esh5lhx60JQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e1wK0sqC; arc=none smtp.client-ip=139.178.84.217
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e1wK0sqC"
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 729BE5C5406;
	Thu, 10 Oct 2024 05:47:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 941A0C4CECC;
	Thu, 10 Oct 2024 05:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728539264;
	bh=OTuy4VqE5rZSLBEA0/Pnb2zLZJiAXIMvgimloV5JAr4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e1wK0sqCj1hFSMccCG8VnSk9aTxpzFJTrYzsRT9VXVEEoRS3hraEZu619qHthJzSx
	 DynBiJLcPJQRbA9J0lLh6ATNk3FB4/xFOM4dXnLEGXWPkSrxd0XcoTxriiWODdioLD
	 1sWIJTn6uT4ZOaW12OrRLOdpildKc5e58UW0/bc2P0yDusD5bq7Iwbf8r4b7hIX5Iy
	 XccbgL+BkzqR13hBcI+eIsGnGBFTEruC5c+E0zapz7RRHpVu6gMKoZHI6cwfi2IRZM
	 bP+nlVliXD/Sq3TcOU7AO/E8ZEwKb501SlYT1dTNQaVEK/mrQ9FtlySueDuymdFkFN
	 xybmhUi0XMlmg==
Date: Thu, 10 Oct 2024 08:43:56 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Song Liu <song@kernel.org>
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
	Luis Chamberlain <mcgrof@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Matt Turner <mattst88@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Michal Simek <monstr@monstr.eu>, Oleg Nesterov <oleg@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Richard Weinberger <richard@nod.at>,
	Russell King <linux@armlinux.org.uk>,
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
Subject: Re: [PATCH v5 4/8] module: prepare to handle ROX allocations for text
Message-ID: <ZwdpnPKKQGF5DtSv@kernel.org>
References: <20241009180816.83591-1-rppt@kernel.org>
 <20241009180816.83591-5-rppt@kernel.org>
 <CAPhsuW66etfdU3Fvk0KsELXcgWD6_TkBFjJ-BTHQu5OejDsP2w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPhsuW66etfdU3Fvk0KsELXcgWD6_TkBFjJ-BTHQu5OejDsP2w@mail.gmail.com>

On Wed, Oct 09, 2024 at 03:23:40PM -0700, Song Liu wrote:
> On Wed, Oct 9, 2024 at 11:10 AM Mike Rapoport <rppt@kernel.org> wrote:
> [...]
> > diff --git a/include/linux/module.h b/include/linux/module.h
> > index 88ecc5e9f523..7039f609c6ef 100644
> > --- a/include/linux/module.h
> > +++ b/include/linux/module.h
> > @@ -367,6 +367,8 @@ enum mod_mem_type {
> >
> >  struct module_memory {
> >         void *base;
> > +       void *rw_copy;
> > +       bool is_rox;
> >         unsigned int size;
> 
> Do we really need to hold the rw_copy all the time? 

We hold it only during module initialization, it's freed in
post_relocation.

> Thanks,
> Song
> 
> [...]

-- 
Sincerely yours,
Mike.
