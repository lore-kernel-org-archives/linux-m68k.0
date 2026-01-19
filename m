Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F085425F797
	for <linux-m68k@lists.linux-m68k.org>; Mon, 19 Jan 2026 20:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768855940; cv=none; b=r9YgObbxSY/UhNyGqvk8DhIQyvzp9Jqb3YC+0tdovhqY82T4pV/Ng1Cdqs7wBhd9LtuhtzMGuOmNu0YufEuczw5MQWJlQxzo8v0bISBypmstqNJGCRUggtF+qN2jPYn3tfmDN752rRs6zb1KNGzsgdQttdlKtS4PfAXC2B48NgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768855940; c=relaxed/simple;
	bh=nDwWiSNQwCPRJTDrkbPucGnALAKjK3AX8ZOj3KNUCf0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WGDgcuZRiOai1wODkOQB/iFpViEV5RBW5oY9/OYrlb3YUu+W+NZLa4eidA5UpYxKrN2JqvXFald1U1h6dvjb3xPQJU5GOdURKnGcctongV+O+a27kwWvsKvf6CWyTaVDQ6JXy4lkUaupMrJ40Wau3iC/JoY/HQy4+y+zneq7kAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Oqe9NVbQ; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Oqe9NVbQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768855939; x=1800391939;
  h=date:from:to:cc:subject:message-id;
  bh=nDwWiSNQwCPRJTDrkbPucGnALAKjK3AX8ZOj3KNUCf0=;
  b=Oqe9NVbQS/nDMHn/tYqlcSOsHr35DCnIyzHl1QR9ouxzmMrrwbqt95XE
   oPSWnkfv4H3piLc2bgzs8j3fJqne4dgMHMaaf65VbspOqU3eaJ6xKIPiw
   y73oUihqdefTRZW5nfADZLVrK8mG9xQAaNsMcVBq8SJeHhr74p2V6B4If
   Os8bEdNEyM6rtJEnhIIHv/8QzGqHIpEvGbMjnOjdMd1TDVKaSBsjay74m
   toHEEFoed337qYbwpbwD1+0yd3et/JssADP76TE7BKiF0OO+aNmPT/1O+
   cNi1Fpg+l7zE/oKIMgLmv1nK+Tn+aLH1DsZfy77FhJ353QyosoLDgOzIE
   g==;
X-CSE-ConnectionGUID: /OOUqagEQ36tOyi+Gij8eQ==
X-CSE-MsgGUID: FpZm/KrJRdGs2+QXV5TFhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="70040724"
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; 
   d="scan'208";a="70040724"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 12:52:18 -0800
X-CSE-ConnectionGUID: DzGi0jVLQYew0kRR2F8++g==
X-CSE-MsgGUID: RlJT+kTHSvunK3PyY6sJQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; 
   d="scan'208";a="210081050"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 19 Jan 2026 12:52:16 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vhwEP-00000000OIj-2yAa;
	Mon, 19 Jan 2026 20:52:13 +0000
Date: Tue, 20 Jan 2026 04:51:59 +0800
From: kernel test robot <lkp@intel.com>
To: Greg Ungerer <gerg@linux-m68k.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
 uclinux-dev@uclinux.org
Subject: [gerg-m68knommu:dt 7/14] arch/m68k/coldfire/intc.c:173:34:
 error: 'MCFINT_VECBASE' undeclared
Message-ID: <202601200416.fpIqDLOZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git dt
head:   c125a4847c40ed3b54deb8116f78193aa9fd29da
commit: bf56caa3d5a11034c40c55074a863e3f341b73ea [7/14] m68k: coldfire: support devicetree binding for intc controller
config: m68k-amcore_defconfig (https://download.01.org/0day-ci/archive/20260120/202601200416.fpIqDLOZ-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260120/202601200416.fpIqDLOZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601200416.fpIqDLOZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/m68k/coldfire/intc.c: In function 'intc_of_init':
>> arch/m68k/coldfire/intc.c:173:34: error: 'MCFINT_VECBASE' undeclared (first use in this function)
     173 |         const unsigned int num = MCFINT_VECBASE + 64;
         |                                  ^~~~~~~~~~~~~~
   arch/m68k/coldfire/intc.c:173:34: note: each undeclared identifier is reported only once for each function it appears in


vim +/MCFINT_VECBASE +173 arch/m68k/coldfire/intc.c

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
