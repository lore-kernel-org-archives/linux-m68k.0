Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1614391826
	for <linux-m68k@lists.linux-m68k.org>; Mon, 18 May 2026 19:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779134270; cv=none; b=iXY8LJkJ9/f0/xd8vO9L6uHa0XjV9R8yuSFhDTOeQbBs55zMKULNxsDbf76PmvV+SyQ4TqEFLOzAzT+m2cbKAkyb8O0jCk/IM+c+bH+ApsNxXDUI2Sxdtix2CG4aeUihOPXsH7uUB5wWVepqw0K/iYyolz+zDRHgpzVdgTek4R4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779134270; c=relaxed/simple;
	bh=gTnxNN3x5exuR/gV1cWfRrhaps51EG1ICwprjaPS28M=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FsptY8+mIinvEu88XMIBNACTXYfLpmsvQeZH/9xWsqDmC1hFoEeh5Zy5pJoHiR343lAhslBE9lkazSRqY9/gNtKKCePv7TDEiwDy8kSmA3sZ+W88xcBBDCKNKeDbKSRFl/GvA2VkE0UfwmMYImGu3D+2JUZSurJPfvovTUSKgOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HL9FyRGb; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HL9FyRGb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779134268; x=1810670268;
  h=date:from:to:cc:subject:message-id;
  bh=gTnxNN3x5exuR/gV1cWfRrhaps51EG1ICwprjaPS28M=;
  b=HL9FyRGbtFXgSHm0NjMsnnQY6TuxCbf1NhO0oeLOqnzviXc9MV45Ea/1
   e/SXEdZY7cJ5jKeI82nxpiL/zt0IH38XIVN6zuTXf7DqCtYVKV+Mh+VRT
   S5Y3ix1K8qqF6Z84BomQLVKLOM1lSMq3WeEXQTGq21hh1AtXczkz+q++y
   S0wG8H1G3eSPQuaCTNCKwOl+u8RFyKqxzs78+/3W5gCyhYaHbbsj6gKPa
   gFxPiLjNmAqAGUUhyk0EYTftG7rvDQHzx46U0k0tsIukrFVz12wayyKQt
   b+DTbYxBXDpR9rzanj9qpDH9RkFNLT8QZarfJhBZ1lUm835SgRWikCupZ
   g==;
X-CSE-ConnectionGUID: gGrd8PQrT+u3S9EyuRjdKA==
X-CSE-MsgGUID: 2XqfDh3QTKKARVEhcnbkxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="90696687"
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; 
   d="scan'208";a="90696687"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 12:57:47 -0700
X-CSE-ConnectionGUID: qql8am8PT56NEwt+6i1Vhw==
X-CSE-MsgGUID: KXrkt/PgQAWwmXPSOFhllw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; 
   d="scan'208";a="244524589"
Received: from lkp-server01.sh.intel.com (HELO d94e5e629b2d) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 18 May 2026 12:57:46 -0700
Received: from kbuild by d94e5e629b2d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wP45u-000000003LS-4Bws;
	Mon, 18 May 2026 19:57:43 +0000
Date: Tue, 19 May 2026 03:56:46 +0800
From: kernel test robot <lkp@intel.com>
To: Greg Ungerer <gerg@linux-m68k.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
 uclinux-dev@uclinux.org
Subject: [gerg-m68knommu:dt 14/14] arch/m68k/coldfire/intc.c:173:34:
 error: 'MCFINT_VECBASE' undeclared; did you mean 'MCFINTC2_VECBASE'?
Message-ID: <202605190333.6rPEf5r5-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git dt
head:   3173490642db7ab3c9f15b139b19a633a2ac2d5e
commit: 3173490642db7ab3c9f15b139b19a633a2ac2d5e [14/14] m68k: coldfire: enable devicetree use
config: m68k-m5249evb_defconfig (https://download.01.org/0day-ci/archive/20260519/202605190333.6rPEf5r5-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260519/202605190333.6rPEf5r5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605190333.6rPEf5r5-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/m68k/coldfire/intc.c: In function 'intc_of_init':
>> arch/m68k/coldfire/intc.c:173:34: error: 'MCFINT_VECBASE' undeclared (first use in this function); did you mean 'MCFINTC2_VECBASE'?
     173 |         const unsigned int num = MCFINT_VECBASE + 64;
         |                                  ^~~~~~~~~~~~~~
         |                                  MCFINTC2_VECBASE
   arch/m68k/coldfire/intc.c:173:34: note: each undeclared identifier is reported only once for each function it appears in


vim +173 arch/m68k/coldfire/intc.c

7db34a01c2d5eea arch/m68k/coldfire/intc.c               Greg Ungerer 2025-01-26  169  
7db34a01c2d5eea arch/m68k/coldfire/intc.c               Greg Ungerer 2025-01-26  170  static int __init intc_of_init(struct device_node *np,
7db34a01c2d5eea arch/m68k/coldfire/intc.c               Greg Ungerer 2025-01-26  171  			       struct device_node *parent)
7db34a01c2d5eea arch/m68k/coldfire/intc.c               Greg Ungerer 2025-01-26  172  {
7db34a01c2d5eea arch/m68k/coldfire/intc.c               Greg Ungerer 2025-01-26 @173  	const unsigned int num = MCFINT_VECBASE + 64;
7db34a01c2d5eea arch/m68k/coldfire/intc.c               Greg Ungerer 2025-01-26  174  	struct irq_domain *domain;
7db34a01c2d5eea arch/m68k/coldfire/intc.c               Greg Ungerer 2025-01-26  175  	int irq;
7db34a01c2d5eea arch/m68k/coldfire/intc.c               Greg Ungerer 2025-01-26  176  
7db34a01c2d5eea arch/m68k/coldfire/intc.c               Greg Ungerer 2025-01-26  177  	domain = irq_domain_add_linear(np, num, &intc_irqdomain_ops, NULL);
7db34a01c2d5eea arch/m68k/coldfire/intc.c               Greg Ungerer 2025-01-26  178  
7db34a01c2d5eea arch/m68k/coldfire/intc.c               Greg Ungerer 2025-01-26  179  	for (irq = MCFINT_VECBASE; irq < num; irq++)
7db34a01c2d5eea arch/m68k/coldfire/intc.c               Greg Ungerer 2025-01-26  180  		irq_create_mapping(domain, irq);
7db34a01c2d5eea arch/m68k/coldfire/intc.c               Greg Ungerer 2025-01-26  181  
7db34a01c2d5eea arch/m68k/coldfire/intc.c               Greg Ungerer 2025-01-26  182  	return 0;
33a21263bf74177 arch/m68knommu/platform/coldfire/intc.c Greg Ungerer 2009-04-30  183  }
33a21263bf74177 arch/m68knommu/platform/coldfire/intc.c Greg Ungerer 2009-04-30  184  

:::::: The code at line 173 was first introduced by commit
:::::: 7db34a01c2d5eea204f9833f6bd031d24cf0558f m68k: coldfire: support devicetree binding for intc controller

:::::: TO: Greg Ungerer <gerg@linux-m68k.org>
:::::: CC: Greg Ungerer <gerg@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
