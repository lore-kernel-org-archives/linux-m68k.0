Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D3BA1FBBCE
	for <linux-m68k@lists.linux-m68k.org>; Mon, 13 Jan 2025 15:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736783149; cv=none; b=NkK5qOZc3Fa1WOliIYmEft3kPb76BpimnUpwe3wtC47FFFMpal+7y8348Kg6hUYzEeCFq/pAjIXDP6tMh90/IU17h2qeFmNQOL7zXFBDZVB85DxxgdMhfZYtHfq6ONHjiL1aHLCXv8T7PhKqFTLXMYivArdUlK9dXLzCybj2Clw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736783149; c=relaxed/simple;
	bh=60LzQbPzHHlZESJ4NVxt/prktxqPSG6D4w8hg7eDv0s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RAYD0038lGh1izF2StUpFGG1bIkHaEImVEr//riUm1oahTcYqgjKUe/+MeylpUv6nFJX87GeEX0RjuXxKJmLB8vLIqzqp6tl5HV2CefIPOmQngjoO3nrwFVUZ79vFYnUQLI3i2JGH/d1n2+db5xVoYXJEyt+bzbIpoeJku2WPb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CaYg3fuh; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CaYg3fuh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736783147; x=1768319147;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=60LzQbPzHHlZESJ4NVxt/prktxqPSG6D4w8hg7eDv0s=;
  b=CaYg3fuhcxr4GemQ4Txnf8G1L7Idva5ZgdhvG+4fhnZ/GB33X/fSERO3
   iJ9sIUHGaVCT+VS58317Va0bLii7n8BOIMuTTkwvOa6elLZg3CD1lBK4i
   Zmxe70ncX81GoeC/crdPlLARMuMET83kGht3tYuwDSK/hhgjuotbDXojJ
   4oqRHZUl6O0zkpHpyCBufhynujiSuVB/UfDuynPEXmz4SmUpwRb1w4imy
   BsTkLUsRVJfz+gQ414FJdTzvABynsA+T2g/2RMICnJHFDqNCYAtHavoZ8
   MrBOD1Eu3mdhS35sazKw0lyBy+2QTEO78EQvt+gK+lMDB6/ZjfSysYxn+
   A==;
X-CSE-ConnectionGUID: 9Yvy3/eDRSGTH5UIKKtWpQ==
X-CSE-MsgGUID: oy+Kl82FTMCAfHVB3a0L0g==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="36340479"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="36340479"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2025 07:45:45 -0800
X-CSE-ConnectionGUID: Ol8QfgiyQwSLVDwPBFYHzA==
X-CSE-MsgGUID: hKZ+hXyrRXSC8nJOTWvklg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="104692355"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
  by fmviesa008.fm.intel.com with SMTP; 13 Jan 2025 07:45:33 -0800
Received: by stinkbox (sSMTP sendmail emulation); Mon, 13 Jan 2025 17:45:32 +0200
Date: Mon, 13 Jan 2025 17:45:32 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Borislav Petkov <bp@alien8.de>
Cc: Mike Rapoport <rppt@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Andreas Larsson <andreas@gaisler.com>,
	Andy Lutomirski <luto@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>, Brian Cain <bcain@quicinc.com>,
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
	linux-parisc@vger.kernel.o
Subject: Re: [REGRESSION] Re: [PATCH v7 8/8] x86/module: enable ROX caches
 for module text on 64 bit
Message-ID: <Z4U1HGUfFLJH8Y55@intel.com>
References: <20241023162711.2579610-1-rppt@kernel.org>
 <20241023162711.2579610-9-rppt@kernel.org>
 <Z4QM_RFfhNX_li_C@intel.com>
 <20250112190755.GCZ4QTC01KzoZkxel9@fat_crate.local>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250112190755.GCZ4QTC01KzoZkxel9@fat_crate.local>
X-Patchwork-Hint: comment

On Sun, Jan 12, 2025 at 08:07:55PM +0100, Borislav Petkov wrote:
> On Sun, Jan 12, 2025 at 08:42:05PM +0200, Ville Syrjälä wrote:
> > On Wed, Oct 23, 2024 at 07:27:11PM +0300, Mike Rapoport wrote:
> > > From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> > > 
> > > Enable execmem's cache of PMD_SIZE'ed pages mapped as ROX for module
> > > text allocations on 64 bit.
> > 
> > Hi,
> > 
> > This breaks resume from hibernation on my Alderlake laptop.
> > 
> > Fortunately this still reverts cleanly.
> 
> Does that hunk in the mail here fix it?
> 
> https://lore.kernel.org/all/Z4DwPkcYyZ-tDKwY@kernel.org/

Still blows up with that one.

-- 
Ville Syrjälä
Intel
