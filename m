Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7A49125B2
	for <linux-m68k@lists.linux-m68k.org>; Sun, 28 Dec 2025 08:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766910310; cv=none; b=OlrRZ/faBzkKhBpj+ROJGwLBfI/faCUIFp1ZNpel8eonvW8NnLG/PJHbL0FG7WYo6OYg7XuUmDsqXZJE8w1RayrZZS4uYnLxbahjQ/BQmwRItcl5Z7Q1BqI0AsGrJ+DENj6CUtFRXCS9gBMyGt8QS3UWKbnIqeNp7oa12kr8RvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766910310; c=relaxed/simple;
	bh=OJNUQ9hX1fLm94BqYiamLHyNxt9EuXuPpxlw5OKIvp4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fEHmdptgU6hfkap5fgkfJrVHBEs1KKN8z1E6v5FlXjwC3xpgufjV47Q3vUMOfQ3S8RsJT0oi98FS6nV6WPOVXBLqEdwduYz5llaeiyGfWzR01nenElp3qPLBzVF5+tnB5wQMd8N/IYPuRhPm3/QcrtJkRF8ilzn5vpbkNHUV6zY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AgnNu5Vv; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AgnNu5Vv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766910308; x=1798446308;
  h=date:from:to:cc:subject:message-id;
  bh=OJNUQ9hX1fLm94BqYiamLHyNxt9EuXuPpxlw5OKIvp4=;
  b=AgnNu5VvelNQcy8kYjdJDs1R+ljnU6BfcOIr8u6NPs2k9rYHFKaAeLJ0
   Cl2Zle36ir2ANOE91nHtNZbPL7VUOt0djSRxPeHpNiTafET8ZFctuUexx
   cfhOa40wIkpO6XascNtrs3w3bWi7PMnlHK9Uyh3wJt7JpyqczFG4ZUlnW
   odhQrt76tgIz+h26Ijcg3EFcadk4eYiM9HP14WO7pLz6mZUSx11NCKA+B
   O3STlyHQ8sde4+reqh9sWXbp5ABBILBR5ZK+0vebN5cpcZDG+yurtHf4i
   RGM1YmTpynRUqVaKtU7eMazIR40Gy5YWBybxJ0QkDSL7bwXvOoSbIyVOh
   Q==;
X-CSE-ConnectionGUID: 81md6dp0Tf+0cAhczYxdBQ==
X-CSE-MsgGUID: wXZMiqXiQxWbxd9PnpKlIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11654"; a="68547395"
X-IronPort-AV: E=Sophos;i="6.21,183,1763452800"; 
   d="scan'208";a="68547395"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2025 00:25:07 -0800
X-CSE-ConnectionGUID: urQP25oFQBCDsSUShQoQtg==
X-CSE-MsgGUID: J8AZQsTRQn6J2toFoP6y3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,183,1763452800"; 
   d="scan'208";a="204806911"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 28 Dec 2025 00:25:05 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vZm5H-000000006Nx-0LLX;
	Sun, 28 Dec 2025 08:25:03 +0000
Date: Sun, 28 Dec 2025 16:24:15 +0800
From: kernel test robot <lkp@intel.com>
To: Greg Ungerer <gerg@uclinux.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
 uclinux-dev@uclinux.org
Subject: [gerg-m68knommu:armnommu 3/3]
 arch/arm/mm/alignment.c:776:25: sparse: sparse: incorrect type in argument 1
 (different address spaces)
Message-ID: <202512281641.zItti8ka-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git armnommu
head:   edf19f0aab57e81f4391d800d6845527413ca77b
commit: edf19f0aab57e81f4391d800d6845527413ca77b [3/3] ARM: versatile: support configuring versatile machine for no-MMU
config: arm-randconfig-r111-20251228 (https://download.01.org/0day-ci/archive/20251228/202512281641.zItti8ka-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 4ef602d446057dabf5f61fb221669ecbeda49279)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251228/202512281641.zItti8ka-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512281641.zItti8ka-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/arm/mm/alignment.c:776:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __user *ptr @@     got unsigned int [usertype] *ip @@
   arch/arm/mm/alignment.c:776:25: sparse:     expected void const volatile [noderef] __user *ptr
   arch/arm/mm/alignment.c:776:25: sparse:     got unsigned int [usertype] *ip
>> arch/arm/mm/alignment.c:791:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __user *ptr @@     got unsigned short [usertype] *ip @@
   arch/arm/mm/alignment.c:791:25: sparse:     expected void const volatile [noderef] __user *ptr
   arch/arm/mm/alignment.c:791:25: sparse:     got unsigned short [usertype] *ip

vim +776 arch/arm/mm/alignment.c

c2860d43f5dfab George G. Davis   2009-06-04  769  
1bb9fb0a147f9d Russell King      2019-09-06  770  static int alignment_get_arm(struct pt_regs *regs, u32 *ip, u32 *inst)
67e15fa5b487ad Russell King      2019-08-31  771  {
67e15fa5b487ad Russell King      2019-08-31  772  	u32 instr = 0;
67e15fa5b487ad Russell King      2019-08-31  773  	int fault;
67e15fa5b487ad Russell King      2019-08-31  774  
67e15fa5b487ad Russell King      2019-08-31  775  	if (user_mode(regs))
67e15fa5b487ad Russell King      2019-08-31 @776  		fault = get_user(instr, ip);
67e15fa5b487ad Russell King      2019-08-31  777  	else
25f12ae45fc193 Christoph Hellwig 2020-06-17  778  		fault = get_kernel_nofault(instr, ip);
67e15fa5b487ad Russell King      2019-08-31  779  
67e15fa5b487ad Russell King      2019-08-31  780  	*inst = __mem_to_opcode_arm(instr);
67e15fa5b487ad Russell King      2019-08-31  781  
67e15fa5b487ad Russell King      2019-08-31  782  	return fault;
67e15fa5b487ad Russell King      2019-08-31  783  }
67e15fa5b487ad Russell King      2019-08-31  784  
67e15fa5b487ad Russell King      2019-08-31  785  static int alignment_get_thumb(struct pt_regs *regs, u16 *ip, u16 *inst)
67e15fa5b487ad Russell King      2019-08-31  786  {
67e15fa5b487ad Russell King      2019-08-31  787  	u16 instr = 0;
67e15fa5b487ad Russell King      2019-08-31  788  	int fault;
67e15fa5b487ad Russell King      2019-08-31  789  
67e15fa5b487ad Russell King      2019-08-31  790  	if (user_mode(regs))
67e15fa5b487ad Russell King      2019-08-31 @791  		fault = get_user(instr, ip);
67e15fa5b487ad Russell King      2019-08-31  792  	else
25f12ae45fc193 Christoph Hellwig 2020-06-17  793  		fault = get_kernel_nofault(instr, ip);
67e15fa5b487ad Russell King      2019-08-31  794  
67e15fa5b487ad Russell King      2019-08-31  795  	*inst = __mem_to_opcode_thumb16(instr);
67e15fa5b487ad Russell King      2019-08-31  796  
67e15fa5b487ad Russell King      2019-08-31  797  	return fault;
67e15fa5b487ad Russell King      2019-08-31  798  }
67e15fa5b487ad Russell King      2019-08-31  799  

:::::: The code at line 776 was first introduced by commit
:::::: 67e15fa5b487adb9b78a92789eeff2d6ec8f5cee ARM: mm: fix alignment handler faults under memory pressure

:::::: TO: Russell King <rmk+kernel@armlinux.org.uk>
:::::: CC: Russell King <rmk+kernel@armlinux.org.uk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
