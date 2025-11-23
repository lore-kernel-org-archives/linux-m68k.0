Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E49521C9F9
	for <linux-m68k@lists.linux-m68k.org>; Sun, 23 Nov 2025 05:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763874658; cv=none; b=KpRQC1GD4+FeHjCHmyDsn2xEOfpAUaWhtOXHRcYa6mIxl2ZskL2FSafADYxDWv8a4NVRhkwRCUcrmubcB+D/DqZhUSuQQxBo7+fAuDJ5CHw3n/zF5df/+SZO/9k9eTyvyhqaydau58Q76214pBQVgQnzTvGV7BINSlW6AHpjMQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763874658; c=relaxed/simple;
	bh=7ANUfaBfl6xgtnlU/D8eh0m/KFC0VXFspV4i4ca3/JI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GlQ8UbN1B+QyL6yy5TIc2llqFB7YhZIfRe5cminng90xvNbLiUe26YR6BSgIXeaR3XKD8Oju8VC6VK8z83WKWSuc9ai1MIhC39f+BCcW0eCnIL9x9zgZS4bbnpTh+o6f7H0grVN1LvVzfCkt5qYSJw8EzzRZUPbDJyzgKG/DqkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nWqL7ZMo; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nWqL7ZMo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763874657; x=1795410657;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7ANUfaBfl6xgtnlU/D8eh0m/KFC0VXFspV4i4ca3/JI=;
  b=nWqL7ZMo8wEe4qhehZfGkBjf59owHArC3xEswPI0w/0fNHifJK2zCLCL
   xuiQ541EInEEXNi8n28daXyQ+sRzYorCrMeqKAx/gYqCSmpBntqnhypxE
   fAT0srrOlOAiJp0pKBoyJ/Rk6Z+aqh4kXgtLC/XXshJ2z4OM++Xq0FVhI
   WjgDlZDrPmd2WQJspG+K1tJbfMa/VydFr+jhrimnNELxG0WZQ+b6EASaV
   xibHhm6lLCnZqgR4BguDNLls7rO78Y9SFSCZMjrVuH/CWAi4LW9Bep1hu
   6OPJqsRQOXtTfOq1IQQE4hi2WisVQ1Chww5Q14Px2LCvbcVZYTYnMzFV/
   A==;
X-CSE-ConnectionGUID: EG8TD+hRQYqBi1O7Mf98qw==
X-CSE-MsgGUID: D4q6XLTET0eDv8IsaGmZ7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11621"; a="88567360"
X-IronPort-AV: E=Sophos;i="6.20,220,1758610800"; 
   d="scan'208";a="88567360"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2025 21:10:55 -0800
X-CSE-ConnectionGUID: G6WDz8/7QZ6XW6xpJ0KynQ==
X-CSE-MsgGUID: AKxPUCaeTBWKnbNf7BKqTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,220,1758610800"; 
   d="scan'208";a="222671765"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 22 Nov 2025 21:10:53 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vN2N8-00083j-33;
	Sun, 23 Nov 2025 05:10:50 +0000
Date: Sun, 23 Nov 2025 13:10:46 +0800
From: kernel test robot <lkp@intel.com>
To: Greg Ungerer <gerg@linux-m68k.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
	uclinux-dev@uclinux.org
Subject: [gerg-m68knommu:dt 14/14] arch/m68k/coldfire/intc.c:173:34: error:
 'MCFINT_VECBASE' undeclared
Message-ID: <202511231301.LeskMaF8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git dt
head:   ff8a015c8f4aa08dfa1f340b404fed5057169958
commit: ff8a015c8f4aa08dfa1f340b404fed5057169958 [14/14] m68k: coldfire: enable devicetree use
config: m68k-m5307c3_defconfig (https://download.01.org/0day-ci/archive/20251123/202511231301.LeskMaF8-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251123/202511231301.LeskMaF8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511231301.LeskMaF8-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/m68k/coldfire/intc.c: In function 'intc_of_init':
>> arch/m68k/coldfire/intc.c:173:34: error: 'MCFINT_VECBASE' undeclared (first use in this function)
     173 |         const unsigned int num = MCFINT_VECBASE + 64;
         |                                  ^~~~~~~~~~~~~~
   arch/m68k/coldfire/intc.c:173:34: note: each undeclared identifier is reported only once for each function it appears in


vim +/MCFINT_VECBASE +173 arch/m68k/coldfire/intc.c

ca7473b8ecb6a4 arch/m68k/coldfire/intc.c               Greg Ungerer 2025-01-26  169  
ca7473b8ecb6a4 arch/m68k/coldfire/intc.c               Greg Ungerer 2025-01-26  170  static int __init intc_of_init(struct device_node *np,
ca7473b8ecb6a4 arch/m68k/coldfire/intc.c               Greg Ungerer 2025-01-26  171  			       struct device_node *parent)
ca7473b8ecb6a4 arch/m68k/coldfire/intc.c               Greg Ungerer 2025-01-26  172  {
ca7473b8ecb6a4 arch/m68k/coldfire/intc.c               Greg Ungerer 2025-01-26 @173  	const unsigned int num = MCFINT_VECBASE + 64;
ca7473b8ecb6a4 arch/m68k/coldfire/intc.c               Greg Ungerer 2025-01-26  174  	struct irq_domain *domain;
ca7473b8ecb6a4 arch/m68k/coldfire/intc.c               Greg Ungerer 2025-01-26  175  	int irq;
ca7473b8ecb6a4 arch/m68k/coldfire/intc.c               Greg Ungerer 2025-01-26  176  
ca7473b8ecb6a4 arch/m68k/coldfire/intc.c               Greg Ungerer 2025-01-26  177  	domain = irq_domain_add_linear(np, num, &intc_irqdomain_ops, NULL);
ca7473b8ecb6a4 arch/m68k/coldfire/intc.c               Greg Ungerer 2025-01-26  178  
ca7473b8ecb6a4 arch/m68k/coldfire/intc.c               Greg Ungerer 2025-01-26  179  	for (irq = MCFINT_VECBASE; irq < num; irq++)
ca7473b8ecb6a4 arch/m68k/coldfire/intc.c               Greg Ungerer 2025-01-26  180  		irq_create_mapping(domain, irq);
ca7473b8ecb6a4 arch/m68k/coldfire/intc.c               Greg Ungerer 2025-01-26  181  
ca7473b8ecb6a4 arch/m68k/coldfire/intc.c               Greg Ungerer 2025-01-26  182  	return 0;
33a21263bf7417 arch/m68knommu/platform/coldfire/intc.c Greg Ungerer 2009-04-30  183  }
33a21263bf7417 arch/m68knommu/platform/coldfire/intc.c Greg Ungerer 2009-04-30  184  

:::::: The code at line 173 was first introduced by commit
:::::: ca7473b8ecb6a49496ed97c97363737c6ec4bf89 m68k: coldfire: support devicetree binding for intc controller

:::::: TO: Greg Ungerer <gerg@linux-m68k.org>
:::::: CC: Greg Ungerer <gerg@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
