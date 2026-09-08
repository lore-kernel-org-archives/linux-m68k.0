Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 663EB2E282B
	for <linux-m68k@lists.linux-m68k.org>; Tue,  8 Sep 2026 01:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788830389; cv=none; b=rfmQ77gWKPfB+7CcfYPZgbASn7fFHToY+V1PvqABltA6CDJRr5b1x6gV3uXIHuGeIfJNEgiGznWqOSMDRr7J7GbQwgvEni5Zn3ZddhGNApjae6Kx5TSthNWbRN5iWJaecUoABFYDrC7ttio/zqknGBll6neAO+IA4KfBkNwlW2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788830389; c=relaxed/simple;
	bh=yrAQz5yRwVsrhFPYfmnf4lJfV/jK9jHKu/crC5P34+o=;
	h=Date:From:To:Cc:Subject:Message-ID; b=i4O5e5FrajDBh7+DonNFNf6EUYfdDwQrYm826/MHRwlxr/4YDGfQdkbBLhckxY38aqVBGxEIzKhJxlrbpaaoa+0KfsEHf4LatQ2QTt/od8OLqDDSxJnnV/0pu4vHToNRt8KptTfKMkN2xYn26vLpHBVqe9ovwiOTrtFj+1A7TVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B3ggxgxE; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B3ggxgxE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788830376; x=1820366376;
  h=date:from:to:cc:subject:message-id;
  bh=yrAQz5yRwVsrhFPYfmnf4lJfV/jK9jHKu/crC5P34+o=;
  b=B3ggxgxEeYFIyzjKAHVc02zYt+lYGFA4ZN6lZvA7exgmAQMMDe8X75Wn
   FZRAnFrH4fVhbdOc0WtJ0V7fBQrxTuepdKkBi8lN/Ys/CgSczv91BZIFd
   NH25ZZAYUmkkte9lKF38OqlT8LiWN3mqzjuElCSWbCgAc7NQTRUE29Wyl
   43FmzuOkmjvFHoDpA7oFR4aYCJvWZL8YnCeXYzb+HZRWS01wrfIRZHrI9
   yrRf7ZSPjBgE6pA9tCv0NiTpWjmd7drd02ZAtXkuAbV4ioA9EGLdEX1Q7
   gvaoNaxgpHqvElGHyneZG7nbfYanKBNeEagIgNjYAuZ7ythJozPTgpYDL
   g==;
X-CSE-ConnectionGUID: TuwgDllySlmJ+mD5/XO4vA==
X-CSE-MsgGUID: /onZhtIdSu+UBKdRHHqE3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="99819237"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="99819237"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2026 18:19:32 -0700
X-CSE-ConnectionGUID: qcjjeP8KSx6gJ8i7iguxCQ==
X-CSE-MsgGUID: ou97aOixQUiNgLfHiEAHNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="270814105"
Received: from lkp-server01.sh.intel.com (HELO dff15f1b2031) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 07 Sep 2026 18:19:33 -0700
Received: from kbuild by dff15f1b2031 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x3kUk-000000001V5-14JW;
	Tue, 08 Sep 2026 01:19:30 +0000
Date: Tue, 08 Sep 2026 09:19:08 +0800
From: kernel test robot <lkp@intel.com>
To: Greg Ungerer <gerg@linux-m68k.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
 uclinux-dev@uclinux.org
Subject: [gerg-m68knommu:dt 22/22]
 arch/m68k/coldfire/intc-simr.c:233:18: error: implicit declaration of
 function 'irq_domain_add_linear'; did you mean 'irq_domain_create_linear'?
Message-ID: <202609080948.oRYfaows-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git dt
head:   693a23411a4e7b5d417226fe704ee36b32700bad
commit: 693a23411a4e7b5d417226fe704ee36b32700bad [22/22] m68k: coldfire: enable devicetree use
config: m68k-allnoconfig (https://download.01.org/0day-ci/archive/20260908/202609080948.oRYfaows-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260908/202609080948.oRYfaows-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609080948.oRYfaows-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/m68k/coldfire/intc-simr.c: In function 'intc_of_init':
>> arch/m68k/coldfire/intc-simr.c:233:18: error: implicit declaration of function 'irq_domain_add_linear'; did you mean 'irq_domain_create_linear'? [-Wimplicit-function-declaration]
     233 |         domain = irq_domain_add_linear(np, num, &intc_irqdomain_ops, NULL);
         |                  ^~~~~~~~~~~~~~~~~~~~~
         |                  irq_domain_create_linear
>> arch/m68k/coldfire/intc-simr.c:233:16: error: assignment to 'struct irq_domain *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     233 |         domain = irq_domain_add_linear(np, num, &intc_irqdomain_ops, NULL);
         |                ^


vim +233 arch/m68k/coldfire/intc-simr.c

8af562116a97dd arch/m68k/coldfire/intc-simr.c               Greg Ungerer 2025-01-26  225  
8af562116a97dd arch/m68k/coldfire/intc-simr.c               Greg Ungerer 2025-01-26  226  static int __init intc_of_init(struct device_node *np,
8af562116a97dd arch/m68k/coldfire/intc-simr.c               Greg Ungerer 2025-01-26  227  			       struct device_node *parent)
8af562116a97dd arch/m68k/coldfire/intc-simr.c               Greg Ungerer 2025-01-26  228  {
8af562116a97dd arch/m68k/coldfire/intc-simr.c               Greg Ungerer 2025-01-26  229  	const unsigned int num = MCFINT_VECBASE + 64 + (MCFINTC1_ICR0 ? 64 : 0) + (MCFINTC2_ICR0 ? 64 : 0);
8af562116a97dd arch/m68k/coldfire/intc-simr.c               Greg Ungerer 2025-01-26  230  	struct irq_domain *domain;
8af562116a97dd arch/m68k/coldfire/intc-simr.c               Greg Ungerer 2025-01-26  231  	int irq;
8af562116a97dd arch/m68k/coldfire/intc-simr.c               Greg Ungerer 2025-01-26  232  
8af562116a97dd arch/m68k/coldfire/intc-simr.c               Greg Ungerer 2025-01-26 @233  	domain = irq_domain_add_linear(np, num, &intc_irqdomain_ops, NULL);
8af562116a97dd arch/m68k/coldfire/intc-simr.c               Greg Ungerer 2025-01-26  234  
8af562116a97dd arch/m68k/coldfire/intc-simr.c               Greg Ungerer 2025-01-26  235  	for (irq = MCFINT_VECBASE; irq < num; irq++)
8af562116a97dd arch/m68k/coldfire/intc-simr.c               Greg Ungerer 2025-01-26  236  		irq_create_mapping(domain, irq);
8af562116a97dd arch/m68k/coldfire/intc-simr.c               Greg Ungerer 2025-01-26  237  
8af562116a97dd arch/m68k/coldfire/intc-simr.c               Greg Ungerer 2025-01-26  238  	return 0;
cd3dd4068db5e1 arch/m68knommu/platform/coldfire/intc-simr.c Greg Ungerer 2009-04-27  239  }
cd3dd4068db5e1 arch/m68knommu/platform/coldfire/intc-simr.c Greg Ungerer 2009-04-27  240  

:::::: The code at line 233 was first introduced by commit
:::::: 8af562116a97ddd0966248dcde21b9123a86226c m68k: coldfire: support devicetree binding for intc-simr

:::::: TO: Greg Ungerer <gerg@linux-m68k.org>
:::::: CC: Greg Ungerer <gerg@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
