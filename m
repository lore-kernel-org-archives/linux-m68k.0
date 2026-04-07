Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EEC2374170
	for <linux-m68k@lists.linux-m68k.org>; Tue,  7 Apr 2026 04:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775534620; cv=none; b=qvkEIJ0GfKUK2DCuv1lHP/EOhC5vZis6R3t+upeuJKhn3AqWl7DhslQSQuztagmIeZnV8sj7zNTnB6HFEEXNIs3RKmhvgS+ueBmjbWrpi59Lx2myobqyVpwAjpXAbU92Rg5TWNF4DHIXG+R6Wnyep+txnsKvdGKgOvESo/NAB4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775534620; c=relaxed/simple;
	bh=kkCwox0dkNMmPgJ5pdVaFazcduaD4qQD6HyrC9GzjAE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XVHGqB1DtRGW0w1lXz2DjETizfDJMsDmBuhPc1yr/EephQxByvuHS95iu6PtRwu0eOULR430GqFODxmMlnVJFjDK4J6MBHhs9+RtWRe213Oz0IhRGlaFZEwT/CqUHb9dCnPfW1AI2SjSaYxYLet0N99L+k4mAalu/tGsdi1D6K0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Cgwk85dP; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Cgwk85dP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775534620; x=1807070620;
  h=date:from:to:cc:subject:message-id;
  bh=kkCwox0dkNMmPgJ5pdVaFazcduaD4qQD6HyrC9GzjAE=;
  b=Cgwk85dPn9H5RWc4OXuTil4I6ihJCfUrPMQypGRI6dGiJqU04nAwp5ni
   c5hiKfGqgcAOZnJeyQZT1cAYPBjjsqt3iRykTdD5JjnbQ+6j1NDrwRv8+
   2XB/77817dhbkyJmNVxwR/DyasMvVR+ZoF01j0JF5svJldtvOIo4elVwV
   fOhL5EhirC2UAmbvislrr1Nuzg9sfzZVC9Py23USGSPTAum95d+KYvPoF
   mjRjfjQw4ylhGrGEl+ESpTZZY0/pfnTexSp4VaRTMO+XJPJi8lkbDiyAJ
   5PR/67fcbfj+Eo5DrND0oBbSbQpphlogfxgX0UG9LyP6cYngaABlBueFw
   w==;
X-CSE-ConnectionGUID: nWyBcfngQe2ntVCulLrFbg==
X-CSE-MsgGUID: hbrGs7eyRuq6dYPdOIA95g==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="87564367"
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="87564367"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2026 21:03:39 -0700
X-CSE-ConnectionGUID: G0JsBb2yQLaZuveY1ODKMQ==
X-CSE-MsgGUID: bliZ86CBSP29bbA1vihtmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="232928783"
Received: from lkp-server01.sh.intel.com (HELO d00eb8a6782a) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 06 Apr 2026 21:03:36 -0700
Received: from kbuild by d00eb8a6782a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w9xf4-0000000008l-0Ene;
	Tue, 07 Apr 2026 04:03:34 +0000
Date: Tue, 07 Apr 2026 12:03:07 +0800
From: kernel test robot <lkp@intel.com>
To: Greg Ungerer <gerg@linux-m68k.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
 uclinux-dev@uclinux.org
Subject: [gerg-m68knommu:dt 7/14] arch/m68k/coldfire/intc.c:173:34:
 error: 'MCFINT_VECBASE' undeclared; did you mean 'MCFINTC2_VECBASE'?
Message-ID: <202604070242.CarJBiCS-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git dt
head:   96bd1f7e74e2461c1e906031ed49b9dcf3c28296
commit: 64fbd72ed3aeb34a625ac7bb9f4fd37eb2e46a09 [7/14] m68k: coldfire: support devicetree binding for intc controller
config: m68k-randconfig-r052-20260406 (https://download.01.org/0day-ci/archive/20260407/202604070242.CarJBiCS-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260407/202604070242.CarJBiCS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604070242.CarJBiCS-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/m68k/coldfire/intc.c: In function 'intc_of_init':
>> arch/m68k/coldfire/intc.c:173:34: error: 'MCFINT_VECBASE' undeclared (first use in this function); did you mean 'MCFINTC2_VECBASE'?
     173 |         const unsigned int num = MCFINT_VECBASE + 64;
         |                                  ^~~~~~~~~~~~~~
         |                                  MCFINTC2_VECBASE
   arch/m68k/coldfire/intc.c:173:34: note: each undeclared identifier is reported only once for each function it appears in


vim +173 arch/m68k/coldfire/intc.c

   169	
   170	static int __init intc_of_init(struct device_node *np,
   171				       struct device_node *parent)
   172	{
 > 173		const unsigned int num = MCFINT_VECBASE + 64;
   174		struct irq_domain *domain;
   175		int irq;
   176	
   177		domain = irq_domain_add_linear(np, num, &intc_irqdomain_ops, NULL);
   178	
   179		for (irq = MCFINT_VECBASE; irq < num; irq++)
   180			irq_create_mapping(domain, irq);
   181	
   182		return 0;
   183	}
   184	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
