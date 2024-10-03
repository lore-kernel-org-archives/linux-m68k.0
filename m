Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A800425760
	for <linux-m68k@lists.linux-m68k.org>; Thu,  3 Oct 2024 04:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727929404; cv=none; b=oPO3wHFEgqDAfmhAdaTj/PT/pmnjkXSAXIJ+GfT2I6itxr7Ky/9urHo4il+gw3loDql9fTBsY7ALv5AgnXCEDCkfIoI0I1HZWiAbiMblalcRVW7CO3qMBhJzXzT9aDZ5snZkREQK/plkhHYqMghp6jbugCHRlk4YdDPCHVBQpjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727929404; c=relaxed/simple;
	bh=EtmmmjmtCv7y2r6N/47etXvFSsaT+TfFyuK+t624T28=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bmg4XZ/W5n0fwW7o+PPhfVLp2qWG/lPWmiUTZFpditQWwSsVwbKIFNoNaS7HrXjR1SGSmkgwI2KuaHxnZIIZDiJzpoGwt/bvCdJQLeTjhKBBLj9Wlc4WgGhqxGlU38VCJFy0wosKooMt7gLpKe03CwKRWWAkbmvEPg1uGhqOMGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fPW9xkTq; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fPW9xkTq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727929402; x=1759465402;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EtmmmjmtCv7y2r6N/47etXvFSsaT+TfFyuK+t624T28=;
  b=fPW9xkTq89dkUQKD+zoM6Ga343Btkdvhv0o8aNsFBLsCxAfOXS62ojRQ
   1yiCgqTkFafCyshWrqb43H8W1P2HhaY4VA6E58GZVfOkQ4bOAbILUL1Ys
   fVY02c2Gfrp05oXg4Wktu5IfrOOco63M65+NA/omPnHWTX2hBRGX3xhO+
   1rk9QByRvJNoWC1sxKoq4KdOCZrXVvTmurHp99iWcxVrhNMfl1y4xaOUd
   E1pjSr4nWLX4rh8qL4JeUl/LAKogGlLfFlDL4I5HM1UnJe19CjCSFVeje
   zToby0T8hYClj0HCc6NTsnPkwBisntZW9z2YXxhiStRkwk4FRa/Lw95hN
   g==;
X-CSE-ConnectionGUID: HLeAjBsCTE+ArvaGW2Vn0Q==
X-CSE-MsgGUID: w7ImRxg0QWyn+v/G0/PviA==
X-IronPort-AV: E=McAfee;i="6700,10204,11213"; a="27291014"
X-IronPort-AV: E=Sophos;i="6.11,173,1725346800"; 
   d="scan'208";a="27291014"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2024 21:23:21 -0700
X-CSE-ConnectionGUID: WkoeICGXRPSQ1BhbC3+oiA==
X-CSE-MsgGUID: r5WHHwS8RfqeYPAtPz/yNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,173,1725346800"; 
   d="scan'208";a="79072842"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 02 Oct 2024 21:23:13 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1swDMt-000024-1U;
	Thu, 03 Oct 2024 04:23:11 +0000
Date: Thu, 3 Oct 2024 12:23:06 +0800
From: kernel test robot <lkp@intel.com>
To: Julian Vetter <jvetter@kalrayinc.com>, Arnd Bergmann <arnd@arndb.de>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Andrew Morton <akpm@linux-foundation.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
	Matt Turner <mattst88@gmail.com>,
	"James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
	Helge Deller <deller@gmx.de>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-csky@vger.kernel.org, loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org, linux-alpha@vger.kernel.org,
	linux-parisc@vger.kernel.org, linux-sh@vger.kernel.org,
	linux-um@lists.infradead.org
Subject: Re: [PATCH v7 01/10] Consolidate IO memcpy/memset into iomap_copy.c
Message-ID: <202410031104.2bzZJyNF-lkp@intel.com>
References: <20240930132321.2785718-2-jvetter@kalrayinc.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240930132321.2785718-2-jvetter@kalrayinc.com>

Hi Julian,

kernel test robot noticed the following build errors:

[auto build test ERROR on arm64/for-next/core]
[also build test ERROR on deller-parisc/for-next linus/master arm/for-next arm/fixes v6.12-rc1 next-20241002]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Julian-Vetter/Consolidate-IO-memcpy-memset-into-iomap_copy-c/20240930-213742
base:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-next/core
patch link:    https://lore.kernel.org/r/20240930132321.2785718-2-jvetter%40kalrayinc.com
patch subject: [PATCH v7 01/10] Consolidate IO memcpy/memset into iomap_copy.c
config: powerpc-allnoconfig (https://download.01.org/0day-ci/archive/20241003/202410031104.2bzZJyNF-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241003/202410031104.2bzZJyNF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410031104.2bzZJyNF-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/io.h:14,
                    from include/linux/irq.h:20,
                    from arch/powerpc/include/asm/hardirq.h:6,
                    from include/linux/hardirq.h:11,
                    from include/linux/interrupt.h:11,
                    from include/linux/kernel_stat.h:8,
                    from include/linux/cgroup.h:25,
                    from include/linux/memcontrol.h:13,
                    from include/linux/swap.h:9,
                    from include/linux/suspend.h:5,
                    from arch/powerpc/kernel/asm-offsets.c:21:
>> arch/powerpc/include/asm/io.h:709:23: error: conflicting types for 'memcpy_fromio'; have 'void(void *, const volatile void *, size_t)' {aka 'void(void *, const volatile void *, unsigned int)'}
     709 | #define memcpy_fromio memcpy_fromio
         |                       ^~~~~~~~~~~~~
   include/asm-generic/io.h:105:13: note: in expansion of macro 'memcpy_fromio'
     105 | extern void memcpy_fromio(void *to, const volatile void __iomem *from,
         |             ^~~~~~~~~~~~~
   arch/powerpc/include/asm/io-defs.h:58:18: note: previous definition of 'memcpy_fromio' with type 'void(void *, const volatile void *, long unsigned int)'
      58 | DEF_PCI_AC_NORET(memcpy_fromio, (void *d, const PCI_IO_ADDR s, unsigned long n),
         |                  ^~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:664:20: note: in definition of macro 'DEF_PCI_AC_NORET'
     664 | static inline void name at                                      \
         |                    ^~~~
>> arch/powerpc/include/asm/io.h:710:21: error: conflicting types for 'memcpy_toio'; have 'void(volatile void *, const void *, size_t)' {aka 'void(volatile void *, const void *, unsigned int)'}
     710 | #define memcpy_toio memcpy_toio
         |                     ^~~~~~~~~~~
   include/asm-generic/io.h:107:13: note: in expansion of macro 'memcpy_toio'
     107 | extern void memcpy_toio(volatile void __iomem *to, const void *from,
         |             ^~~~~~~~~~~
   arch/powerpc/include/asm/io-defs.h:60:18: note: previous definition of 'memcpy_toio' with type 'void(volatile void *, const void *, long unsigned int)'
      60 | DEF_PCI_AC_NORET(memcpy_toio, (PCI_IO_ADDR d, const void *s, unsigned long n),
         |                  ^~~~~~~~~~~
   arch/powerpc/include/asm/io.h:664:20: note: in definition of macro 'DEF_PCI_AC_NORET'
     664 | static inline void name at                                      \
         |                    ^~~~
>> arch/powerpc/include/asm/io.h:708:19: error: conflicting types for 'memset_io'; have 'void(volatile void *, int,  size_t)' {aka 'void(volatile void *, int,  unsigned int)'}
     708 | #define memset_io memset_io
         |                   ^~~~~~~~~
   include/asm-generic/io.h:109:13: note: in expansion of macro 'memset_io'
     109 | extern void memset_io(volatile void __iomem *dst, int c, size_t count);
         |             ^~~~~~~~~
   arch/powerpc/include/asm/io-defs.h:56:18: note: previous definition of 'memset_io' with type 'void(volatile void *, int,  long unsigned int)'
      56 | DEF_PCI_AC_NORET(memset_io, (PCI_IO_ADDR a, int c, unsigned long n),
         |                  ^~~~~~~~~
   arch/powerpc/include/asm/io.h:664:20: note: in definition of macro 'DEF_PCI_AC_NORET'
     664 | static inline void name at                                      \
         |                    ^~~~
   make[3]: *** [scripts/Makefile.build:117: arch/powerpc/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1193: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:224: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:224: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +709 arch/powerpc/include/asm/io.h

4cb3cee03d558f include/asm-powerpc/io.h      Benjamin Herrenschmidt 2006-11-11  676  
4cb3cee03d558f include/asm-powerpc/io.h      Benjamin Herrenschmidt 2006-11-11  677  /* Some drivers check for the presence of readq & writeq with
4cb3cee03d558f include/asm-powerpc/io.h      Benjamin Herrenschmidt 2006-11-11  678   * a #ifdef, so we make them happy here.
4cb3cee03d558f include/asm-powerpc/io.h      Benjamin Herrenschmidt 2006-11-11  679   */
894fa235eb4ca0 arch/powerpc/include/asm/io.h Christophe Leroy       2020-11-21  680  #define readb readb
894fa235eb4ca0 arch/powerpc/include/asm/io.h Christophe Leroy       2020-11-21  681  #define readw readw
894fa235eb4ca0 arch/powerpc/include/asm/io.h Christophe Leroy       2020-11-21  682  #define readl readl
894fa235eb4ca0 arch/powerpc/include/asm/io.h Christophe Leroy       2020-11-21  683  #define writeb writeb
894fa235eb4ca0 arch/powerpc/include/asm/io.h Christophe Leroy       2020-11-21  684  #define writew writew
894fa235eb4ca0 arch/powerpc/include/asm/io.h Christophe Leroy       2020-11-21  685  #define writel writel
894fa235eb4ca0 arch/powerpc/include/asm/io.h Christophe Leroy       2020-11-21  686  #define readsb readsb
894fa235eb4ca0 arch/powerpc/include/asm/io.h Christophe Leroy       2020-11-21  687  #define readsw readsw
894fa235eb4ca0 arch/powerpc/include/asm/io.h Christophe Leroy       2020-11-21  688  #define readsl readsl
894fa235eb4ca0 arch/powerpc/include/asm/io.h Christophe Leroy       2020-11-21  689  #define writesb writesb
894fa235eb4ca0 arch/powerpc/include/asm/io.h Christophe Leroy       2020-11-21  690  #define writesw writesw
894fa235eb4ca0 arch/powerpc/include/asm/io.h Christophe Leroy       2020-11-21  691  #define writesl writesl
894fa235eb4ca0 arch/powerpc/include/asm/io.h Christophe Leroy       2020-11-21  692  #define inb inb
894fa235eb4ca0 arch/powerpc/include/asm/io.h Christophe Leroy       2020-11-21  693  #define inw inw
894fa235eb4ca0 arch/powerpc/include/asm/io.h Christophe Leroy       2020-11-21  694  #define inl inl
894fa235eb4ca0 arch/powerpc/include/asm/io.h Christophe Leroy       2020-11-21  695  #define outb outb
894fa235eb4ca0 arch/powerpc/include/asm/io.h Christophe Leroy       2020-11-21  696  #define outw outw
894fa235eb4ca0 arch/powerpc/include/asm/io.h Christophe Leroy       2020-11-21  697  #define outl outl
894fa235eb4ca0 arch/powerpc/include/asm/io.h Christophe Leroy       2020-11-21  698  #define insb insb
894fa235eb4ca0 arch/powerpc/include/asm/io.h Christophe Leroy       2020-11-21  699  #define insw insw
894fa235eb4ca0 arch/powerpc/include/asm/io.h Christophe Leroy       2020-11-21  700  #define insl insl
894fa235eb4ca0 arch/powerpc/include/asm/io.h Christophe Leroy       2020-11-21  701  #define outsb outsb
894fa235eb4ca0 arch/powerpc/include/asm/io.h Christophe Leroy       2020-11-21  702  #define outsw outsw
894fa235eb4ca0 arch/powerpc/include/asm/io.h Christophe Leroy       2020-11-21  703  #define outsl outsl
68a64357d15ae4 include/asm-powerpc/io.h      Benjamin Herrenschmidt 2006-11-13  704  #ifdef __powerpc64__
4cb3cee03d558f include/asm-powerpc/io.h      Benjamin Herrenschmidt 2006-11-11  705  #define readq	readq
4cb3cee03d558f include/asm-powerpc/io.h      Benjamin Herrenschmidt 2006-11-11  706  #define writeq	writeq
68a64357d15ae4 include/asm-powerpc/io.h      Benjamin Herrenschmidt 2006-11-13  707  #endif
894fa235eb4ca0 arch/powerpc/include/asm/io.h Christophe Leroy       2020-11-21 @708  #define memset_io memset_io
894fa235eb4ca0 arch/powerpc/include/asm/io.h Christophe Leroy       2020-11-21 @709  #define memcpy_fromio memcpy_fromio
894fa235eb4ca0 arch/powerpc/include/asm/io.h Christophe Leroy       2020-11-21 @710  #define memcpy_toio memcpy_toio
68a64357d15ae4 include/asm-powerpc/io.h      Benjamin Herrenschmidt 2006-11-13  711  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
