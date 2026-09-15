Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6F50286AC
	for <linux-m68k@lists.linux-m68k.org>; Tue, 15 Sep 2026 00:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789433841; cv=none; b=mVtRgLEyCXCIppka9dpmwj02DO7K2dlTBRuHN61fS2x20f1/94QBTxMlRLA1RdxdIPsicu9y2xI4jXjIcOPpvdDpmFuBr4OTHAI47cJVJKStTBUyHmdySTLzLhfC4lDOql7xejsxX9h8CxufuC3zGHrwo0qB1CId9Eise0AOiwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789433841; c=relaxed/simple;
	bh=4m9/uu80YY5PU+OrXzp9CMfLQ4lf9gJxeZSGX+iDecc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QIguOVUcra5rYKEJlSKp0kPENwSDBIvkwWqYa2qKOyU7ootwsFX4Le1az5N0AyMeFAgRSdNq0a80G0ktZvHJdx/HJYXr3aG7Dcf6dObscT37SaVgYzEGRRfdersJzpwpamikJKTBZwO3rNQ6jndeC9uaJ4BQrOzNrMW1DKXcVso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bpV2COap; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bpV2COap"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789433839; x=1820969839;
  h=date:from:to:cc:subject:message-id;
  bh=4m9/uu80YY5PU+OrXzp9CMfLQ4lf9gJxeZSGX+iDecc=;
  b=bpV2COapQRBGHerMiuyhq3MjKLYCjF7DZlq3SVLf/bRpSoJjyw+zv3X9
   CH2M6Ww/YvqujmIx58go/kfN9I27GyMuQUvx1zeJ18rkYwNCb5xe41Ate
   /QxrngWphqK4VTV+4XMCb4UM44o2bJ9tr2X4bcd56uurIUpnVLLSs6e0O
   FYHQpNkCRG/ahPnNPFZPKi5lyp2AEyFM2+pZ0RrrSNCqyD1C3RN20sVl4
   SC6Lj+aSQB4Z8264r9V/YW9ffPyGVL6q2Krc38CaFTsEvvgeSWTKdSXET
   agB6fW0RE5XETXD/7ZHqyGR+o65FeDBTpf+PqrTmooywWOZZI3zY6JNRD
   w==;
X-CSE-ConnectionGUID: amtdK/wYQQynh0+xGnycIw==
X-CSE-MsgGUID: CzNMUA/KTMSfQ9rR3/SR7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="115326008"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="115326008"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 17:57:18 -0700
X-CSE-ConnectionGUID: tCNg5D/PQ4KRI3hbpsTamQ==
X-CSE-MsgGUID: J2gGQcb5SQqV3Tz0aW0+cA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="269113454"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 14 Sep 2026 17:57:17 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x6HU2-000000003mN-2E2D;
	Tue, 15 Sep 2026 00:57:14 +0000
Date: Tue, 15 Sep 2026 08:56:34 +0800
From: kernel test robot <lkp@intel.com>
To: Greg Ungerer <gerg@linux-m68k.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
 uclinux-dev@uclinux.org
Subject: [gerg-m68knommu:dt 9/22]
 arch/m68k/coldfire/intc-simr.c:233:9: warning: assignment to 'struct
 irq_domain *' from 'int' makes pointer from integer without a cast
Message-ID: <202609150810.nXZTwOrV-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git dt
head:   b5ed8ca50661263352c1e60587539803de9bde6a
commit: cc74cc487ff02a61517d21910eed37ca857ab818 [9/22] m68k: coldfire: support devicetree binding for intc-simr
config: m68k-randconfig-r113-20260914 (https://download.01.org/0day-ci/archive/20260915/202609150810.nXZTwOrV-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 9.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260915/202609150810.nXZTwOrV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609150810.nXZTwOrV-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/m68k/coldfire/intc-simr.c: In function 'intc_of_init':
   arch/m68k/coldfire/intc-simr.c:233:11: error: implicit declaration of function 'irq_domain_add_linear'; did you mean 'irq_domain_create_linear'? [-Werror=implicit-function-declaration]
     233 |  domain = irq_domain_add_linear(np, num, &intc_irqdomain_ops, NULL);
         |           ^~~~~~~~~~~~~~~~~~~~~
         |           irq_domain_create_linear
>> arch/m68k/coldfire/intc-simr.c:233:9: warning: assignment to 'struct irq_domain *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     233 |  domain = irq_domain_add_linear(np, num, &intc_irqdomain_ops, NULL);
         |         ^
   cc1: some warnings being treated as errors


vim +233 arch/m68k/coldfire/intc-simr.c

   225	
   226	static int __init intc_of_init(struct device_node *np,
   227				       struct device_node *parent)
   228	{
   229		const unsigned int num = MCFINT_VECBASE + 64 + (MCFINTC1_ICR0 ? 64 : 0) + (MCFINTC2_ICR0 ? 64 : 0);
   230		struct irq_domain *domain;
   231		int irq;
   232	
 > 233		domain = irq_domain_add_linear(np, num, &intc_irqdomain_ops, NULL);
   234	
   235		for (irq = MCFINT_VECBASE; irq < num; irq++)
   236			irq_create_mapping(domain, irq);
   237	
   238		return 0;
   239	}
   240	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
