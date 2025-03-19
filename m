Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4E521DD0D5
	for <linux-m68k@lists.linux-m68k.org>; Wed, 19 Mar 2025 17:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=139.178.84.217
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742405421; cv=none; b=CiK6kzMMtcNmJZ5bomMxUW3Eahp2pTTf/fxRnVoBxWhPmpZZKe07RBvuK2DH28dLtrkkjxHbIBYamoICox8nmeilmD+aUf5Nmi1QbM6bCd6Pbb9wKMPRuCDa9f3whgWA32USTSAMHegylLS/C5ccWndmougIauozruDOJukAfHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742405421; c=relaxed/simple;
	bh=gpKrn8HW8AZZySNjAdZoJyOHfdkLfMonlBIG0pb7rJs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oI47kWPyVoG7mlyyvwo4BcEpa9LN1CCO4iYBNbPMK6DRymsP1BiKzjPzn/GeOB+1djCteKENhjCNGYFS0bUc4rNAFeBz4bhxMS0IIT4p4x8LgtjevcMLexYiATZ0WjYQeA1A/MdOM4fG8+wrRKrEy92R0v5wCWqLG9z80bg2gqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z9biRIG4; arc=none smtp.client-ip=139.178.84.217
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z9biRIG4"
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AC9715C499F;
	Wed, 19 Mar 2025 17:28:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4230AC4CEEC;
	Wed, 19 Mar 2025 17:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742405418;
	bh=gpKrn8HW8AZZySNjAdZoJyOHfdkLfMonlBIG0pb7rJs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z9biRIG4v4RALHETyvhDmvsnPST2Po+0NgCvGoxxlYmK5oqGJFq3Rp9gX67v29Wa1
	 bH7PO28pgmcU0v/QDX91o2kqmi4Ab/alUwXSnKEhUVmpijp2QXT1kbAeE/BeUTB2w4
	 DztQSBkjHjFDEOE1vXLqLSxoM+x0cOQXFjAy/9AkqphJzxmv9vEJiHhiDLT1IF9R0a
	 fvSkmrweH3Uqz5StTuzwnCRMzNnOP5xPmKGZG3FJCiX6/cCFVHJE4wc1QmxnLfYKX6
	 xZfGhbjQVQFVC+38sI2KRQZeyUXfOYxq9jp9xJit0e9jNp+XS4+tmVbVnRQlE5ZirP
	 KE1eon15QED6w==
Date: Wed, 19 Mar 2025 10:30:10 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Arnd Bergmann <arnd@kernel.org>,
	Linux-Arch <linux-arch@vger.kernel.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Matt Turner <mattst88@gmail.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Greg Ungerer <gerg@linux-m68k.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	"James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
	Helge Deller <deller@gmx.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Julian Vetter <julian@outer-limits.org>,
	Bjorn Helgaas <bhelgaas@google.com>, linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org
Subject: Re: [PATCH 5/6] mips: drop GENERIC_IOMAP wrapper
Message-ID: <20250319173010.GA84652@ax162>
References: <20250315105907.1275012-1-arnd@kernel.org>
 <20250315105907.1275012-6-arnd@kernel.org>
 <20250318203906.GA4089579@ax162>
 <5b2779f8-573d-401e-817e-979e02f811d3@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5b2779f8-573d-401e-817e-979e02f811d3@app.fastmail.com>

On Tue, Mar 18, 2025 at 10:13:35PM +0100, Arnd Bergmann wrote:
> Thanks for the report, I missed that the generic ioport_map() function
> is missing the PCI_IOBASE macro, we should probably remove that from
> the asm-generic/io.h header and require architectures to define it
> themselves, since the NULL fallback is pretty much always wrong.
> 
> There is also a type mismatch between the MIPS
> PCI_IOBASE/mips_io_port_base and the one that asm-generic/io.h
> expects, so I had to add a couple of extra typecasts, which
> makes it rather ugly, but the change below seems to work.

Thanks, that does make the -Wnull-pointer-arithmetic warnings disappear.
That build still fails in next-20250319 (which includes that change) at
the end with:

  $ make -skj"$(nproc)" ARCH=mips CROSS_COMPILE=mips-linux- mrproper malta_defconfig all
  ERROR: modpost: "pci_iounmap" [drivers/net/wireless/intel/ipw2x00/ipw2100.ko] undefined!

which appears related to this original change.

Cheers,
Nathan
