Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9306404BE9
	for <linux-m68k@lists.linux-m68k.org>; Mon, 14 Sep 2026 16:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789404368; cv=none; b=Bs93AvxE95VRW6Z1F/vv7R6XsEJrfLo4c+fW6tiI1AR4THkcf8fGoLSMZ/65EUndy6cnryM1awtae1BrlOlrwsa6EBGHNVqAnq86FUGB0tU7fwTMWpwu+nCirksdDTYxIfb86dSacTssAniZwsij7sGio8K7D0GkfTaPtpp3uAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789404368; c=relaxed/simple;
	bh=Bx4ML9oVRK1MGBmzSeGt5Ss6ir/WqyyZi7JUX76b4cU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DSwFw7re2LHZZctq86lYmtX1shX/OxViUpByTjVfKMM+QKSWQt5yeR1+jFJjK7X58ABHeKE7F6mbuTJTXmIbLVuDHCFrWm+sqtjifM8Rajj8tewiD2ZBWMHb4iYvIegAgk39k8mqtSzHb+pt4XWn59Tv5qfA17iRc4CljWoTVCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jMjSxr9X; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jMjSxr9X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789404366; x=1820940366;
  h=date:from:to:cc:subject:message-id;
  bh=Bx4ML9oVRK1MGBmzSeGt5Ss6ir/WqyyZi7JUX76b4cU=;
  b=jMjSxr9XaUs+H0a6h3LTAhRJtXP19bYi5POAH9BQr7INvmM6iVMo95sL
   Mv17oQktF1+50TWEKcOx8XYPbWd/cmOtXMDsjgszwKab2nUtjbkjR7NAr
   4mZ8ws6yIBnfn7sBD78uX7oB/hhYIweHu5pFSMt1a0D0+V7SntA+gmZQq
   YZoANxUINI4tIlMsumPK/c7SQoVaGfLoMtr5gfXDWS0wSkJmCgNSCjUfv
   VUNDqh3GeW8mwRCbXwilXkMuZvgYGUx5A0zLd101YFnb4DpdsPNvLAvqO
   AvVuvZl2YkRB6tk7nY2U/SfUojoCHcubvy4UQpnCvZVjWlf7WLds72q2q
   A==;
X-CSE-ConnectionGUID: tkPsnbI/TLGw05HJvmh/Ww==
X-CSE-MsgGUID: Nw6eZ8ZLRWqAq6UuLlM2GA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="100424290"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="100424290"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 09:46:04 -0700
X-CSE-ConnectionGUID: stv3L2gUT/ORoojuyT3k8w==
X-CSE-MsgGUID: 1cizjD9MQLejHyUcpqKgOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="272665698"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 14 Sep 2026 09:46:03 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x69oe-00000000379-30lI;
	Mon, 14 Sep 2026 16:46:00 +0000
Date: Tue, 15 Sep 2026 00:45:39 +0800
From: kernel test robot <lkp@intel.com>
To: Greg Ungerer <gerg@linux-m68k.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
 uclinux-dev@uclinux.org
Subject: [gerg-m68knommu:dt 11/22]
 arch/m68k/coldfire/intc-2.c:242:11: error: implicit declaration of function
 'irq_domain_add_linear'; did you mean 'irq_domain_create_linear'?
Message-ID: <202609150018.dRPOsOwQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git dt
head:   b5ed8ca50661263352c1e60587539803de9bde6a
commit: 1bab8c33a48c40d8cde610e936745c447d39d949 [11/22] m68k: coldfire: support devicetree binding for intc-2 controller
config: m68k-randconfig-r133-20260914 (https://download.01.org/0day-ci/archive/20260915/202609150018.dRPOsOwQ-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 10.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260915/202609150018.dRPOsOwQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609150018.dRPOsOwQ-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   arch/m68k/coldfire/intc-2.c: In function 'intc_of_init':
>> arch/m68k/coldfire/intc-2.c:242:11: error: implicit declaration of function 'irq_domain_add_linear'; did you mean 'irq_domain_create_linear'? [-Werror=implicit-function-declaration]
     242 |  domain = irq_domain_add_linear(np, num, &intc_irqdomain_ops, NULL);
         |           ^~~~~~~~~~~~~~~~~~~~~
         |           irq_domain_create_linear
>> arch/m68k/coldfire/intc-2.c:242:9: warning: assignment to 'struct irq_domain *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     242 |  domain = irq_domain_add_linear(np, num, &intc_irqdomain_ops, NULL);
         |         ^
   cc1: some warnings being treated as errors


vim +242 arch/m68k/coldfire/intc-2.c

   234	
   235	static int __init intc_of_init(struct device_node *np,
   236				       struct device_node *parent)
   237	{
   238		const unsigned int num = MCFINT_VECBASE + NR_IRQS;
   239		struct irq_domain *domain;
   240		int irq;
   241	
 > 242		domain = irq_domain_add_linear(np, num, &intc_irqdomain_ops, NULL);
   243	
   244		for (irq = MCFINT_VECBASE; irq < num; irq++)
   245			irq_create_mapping(domain, irq);
   246	
   247		return 0;
   248	}
   249	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
