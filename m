Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6C7D266EE6
	for <linux-m68k@lists.linux-m68k.org>; Fri, 14 Feb 2025 16:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739551909; cv=none; b=Ii6jX2qJGhKCKSCL54UySwkQh4DoGA82znHT4GJ0WcXTpl/98TDUNC/eWWeciT8OCdVHZTlJqVcvxMMx2FM0qck4QKaEVfCKtKGfI2a5F+Vngi2pgF2ga4aknQsB/I+iH9wy/pFstOtIKsmAcf2N1Rm1ya7DXYTzGisSu+ox0RI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739551909; c=relaxed/simple;
	bh=TyJZKuwAL2idAvK+C64Bh5BYBzBho7hzSuAQy17j6kw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=u1qkP8Ntdj/xGpV/nEodVq9YFfjJsTK48E9B2ln0dj6LQ5nHZlH+xV9X5hY8W2lv6rGxgUCokyO43IR8L9lE/S/dG/+DirwyHLZzanwdGtp8hTi8kunt/lh5gSb3MiHTpWhbo0ki5J/L9nEb9lwyh/cXe83E+C4TJkf8pUppl/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q+IIeG8/; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q+IIeG8/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739551907; x=1771087907;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TyJZKuwAL2idAvK+C64Bh5BYBzBho7hzSuAQy17j6kw=;
  b=Q+IIeG8/NEG1VTqpfVg6rc6w78BwdAO8WV1b6PU5hpdIF3BYnXz0Walh
   8165FkkEDaG+6iIy1NWVkZj+nHho08n30zUtdEZs8Xcc7wpMrCAXzji3K
   eMSK3yyWIu+okv9aDiQUzfogVFU//JQt5ecD+PDp9mcjGyLBr7BGTBFnL
   6SAcPyg2wS5pafOrLfL4ctO3BgAXQfjd2+aM873Q+IO3HM2pVD1hBL9N5
   nL8426i19HsOYNJ1P8x130L0SynLPjAoliy5TKgCRfkmTgSVZM0xhW+CR
   HhfAsEIRhELu5iIMjxNOd5m7Fha9zvnEkG6/gCjEhaaGRkWffge9vG721
   Q==;
X-CSE-ConnectionGUID: ufXXpFFJRiGHlgISkaF2Gw==
X-CSE-MsgGUID: MzySlSaRQJ+lcD74NIbalg==
X-IronPort-AV: E=McAfee;i="6700,10204,11345"; a="57713409"
X-IronPort-AV: E=Sophos;i="6.13,286,1732608000"; 
   d="scan'208";a="57713409"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2025 08:51:45 -0800
X-CSE-ConnectionGUID: woJSOpa3Sgejz9OrdNP+Mw==
X-CSE-MsgGUID: jaQWIPajQC6l3ZsotHuDUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="114410441"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 14 Feb 2025 08:51:44 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tiyuj-0019tw-2x;
	Fri, 14 Feb 2025 16:51:41 +0000
Date: Sat, 15 Feb 2025 00:51:04 +0800
From: kernel test robot <lkp@intel.com>
To: Greg Ungerer <gerg@linux-m68k.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
	uclinux-dev@uclinux.org
Subject: [gerg-m68knommu:dt 6/13] arch/m68k/coldfire/intc.c:173:34: error:
 'MCFINT_VECBASE' undeclared
Message-ID: <202502150021.XssQOrLS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git dt
head:   6e903c856c98dabb890acf18c07497d375765cec
commit: 82441c3e6330f32129f7b78c031ef1a199ab2036 [6/13] m68k: coldfire: support devicetree binding for intc controller
config: m68k-randconfig-r053-20250214 (https://download.01.org/0day-ci/archive/20250215/202502150021.XssQOrLS-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250215/202502150021.XssQOrLS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502150021.XssQOrLS-lkp@intel.com/

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
