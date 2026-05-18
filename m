Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F56B3909A2
	for <linux-m68k@lists.linux-m68k.org>; Mon, 18 May 2026 21:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779140153; cv=none; b=P9g1xkfrsfiXN19Tfsx1WicqzHDPpAFnOwbsokCpDxWkZxa8HpIjrB+kKi0YoAOFiFbaG8opuTh1LrVCr6mUaT0p5EP/qlVtD8wUmQmKFzn+WjhfIsAe/stYdQxpIetJWgv3/0oIA1ZsMJ9bywxYRau+pgzyv9CtKXd4PhziP+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779140153; c=relaxed/simple;
	bh=7QoMriMl4uCE5MJK33+dAid/RJz+3ueLisF2jiEEXII=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hGp3Opitd+Dk/0ynnts/5JzyTtfaCgr1Z4wcQVlMmLCejQWy35pOe17rGoVTet1OucXf1UALGSKvpZOgOPeXanS5Ch9LQvvAU7KvltKK+RcOhIdlltd76EXtJlVynsgJwYpj5syEahyZrYa/TI6EQSJFHeVA1ckTOqfXH2uLm7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LxFDqtwU; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LxFDqtwU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779140152; x=1810676152;
  h=date:from:to:cc:subject:message-id;
  bh=7QoMriMl4uCE5MJK33+dAid/RJz+3ueLisF2jiEEXII=;
  b=LxFDqtwUD4k+mMbllLb6uxX3N2vy22k9asI/wCkigpu4VxI9MGP6HLMy
   rYmcD1IE/rc2mINnpAlBguj9JnfaNl4daaysema0x0f0xf/m5XLNJ6jvc
   nRCQXeNcdklRhG0BrhnEFLGj84B7HEaEpK1KgCD5SZTsFP/aCKSwMxPyH
   bGUEvh/LNxkh7UKTPwC+4izUAnb0OlpiF8Fxlk7jvcn9WGMmWrJatJ14T
   ywmdro/sLbA1qqDL5ZzUf0rxPPu4Kra3RRPSBEkoR6BFAKkSKa3M5pQmC
   Cf3zz29qR9Yu6r1DjwmCW630W9amuP9VqDQKZdBwXEkDa/Qy94vU0/ZED
   Q==;
X-CSE-ConnectionGUID: jIr/dM2zSyanvJs7/KNHwQ==
X-CSE-MsgGUID: tft3K+stTjCML1qzhyUZJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="102681777"
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; 
   d="scan'208";a="102681777"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 14:35:51 -0700
X-CSE-ConnectionGUID: C+QXCDI1SEG8xb5//1dK6A==
X-CSE-MsgGUID: 1rxznwOLT/mdRkA9IWuwsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; 
   d="scan'208";a="243538232"
Received: from lkp-server01.sh.intel.com (HELO d94e5e629b2d) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 18 May 2026 14:35:50 -0700
Received: from kbuild by d94e5e629b2d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wP5co-000000003Qo-444V;
	Mon, 18 May 2026 21:35:46 +0000
Date: Tue, 19 May 2026 05:35:17 +0800
From: kernel test robot <lkp@intel.com>
To: Greg Ungerer <gerg@uclinux.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
 uclinux-dev@uclinux.org
Subject: [gerg-m68knommu:armnommu 3/3]
 arch/arm/mm/alignment.c:776:25: sparse: sparse: incorrect type in argument 1
 (different address spaces)
Message-ID: <202605190531.Z12vJFb7-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git armnommu
head:   b9d1c6c54795dbb93bb9f68f60a4da071e2ad418
commit: b9d1c6c54795dbb93bb9f68f60a4da071e2ad418 [3/3] ARM: versatile: support configuring versatile machine for no-MMU
config: arm-randconfig-r132-20260519 (https://download.01.org/0day-ci/archive/20260519/202605190531.Z12vJFb7-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260519/202605190531.Z12vJFb7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605190531.Z12vJFb7-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/arm/mm/alignment.c:776:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __user *ptr @@     got unsigned int [usertype] *ip @@
   arch/arm/mm/alignment.c:776:25: sparse:     expected void const volatile [noderef] __user *ptr
   arch/arm/mm/alignment.c:776:25: sparse:     got unsigned int [usertype] *ip
>> arch/arm/mm/alignment.c:791:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __user *ptr @@     got unsigned short [usertype] *ip @@
   arch/arm/mm/alignment.c:791:25: sparse:     expected void const volatile [noderef] __user *ptr
   arch/arm/mm/alignment.c:791:25: sparse:     got unsigned short [usertype] *ip

vim +776 arch/arm/mm/alignment.c

c2860d43f5dfab59 George G. Davis   2009-06-04  769  
1bb9fb0a147f9db1 Russell King      2019-09-06  770  static int alignment_get_arm(struct pt_regs *regs, u32 *ip, u32 *inst)
67e15fa5b487adb9 Russell King      2019-08-31  771  {
67e15fa5b487adb9 Russell King      2019-08-31  772  	u32 instr = 0;
67e15fa5b487adb9 Russell King      2019-08-31  773  	int fault;
67e15fa5b487adb9 Russell King      2019-08-31  774  
67e15fa5b487adb9 Russell King      2019-08-31  775  	if (user_mode(regs))
67e15fa5b487adb9 Russell King      2019-08-31 @776  		fault = get_user(instr, ip);
67e15fa5b487adb9 Russell King      2019-08-31  777  	else
25f12ae45fc1931a Christoph Hellwig 2020-06-17  778  		fault = get_kernel_nofault(instr, ip);
67e15fa5b487adb9 Russell King      2019-08-31  779  
67e15fa5b487adb9 Russell King      2019-08-31  780  	*inst = __mem_to_opcode_arm(instr);
67e15fa5b487adb9 Russell King      2019-08-31  781  
67e15fa5b487adb9 Russell King      2019-08-31  782  	return fault;
67e15fa5b487adb9 Russell King      2019-08-31  783  }
67e15fa5b487adb9 Russell King      2019-08-31  784  
67e15fa5b487adb9 Russell King      2019-08-31  785  static int alignment_get_thumb(struct pt_regs *regs, u16 *ip, u16 *inst)
67e15fa5b487adb9 Russell King      2019-08-31  786  {
67e15fa5b487adb9 Russell King      2019-08-31  787  	u16 instr = 0;
67e15fa5b487adb9 Russell King      2019-08-31  788  	int fault;
67e15fa5b487adb9 Russell King      2019-08-31  789  
67e15fa5b487adb9 Russell King      2019-08-31  790  	if (user_mode(regs))
67e15fa5b487adb9 Russell King      2019-08-31 @791  		fault = get_user(instr, ip);
67e15fa5b487adb9 Russell King      2019-08-31  792  	else
25f12ae45fc1931a Christoph Hellwig 2020-06-17  793  		fault = get_kernel_nofault(instr, ip);
67e15fa5b487adb9 Russell King      2019-08-31  794  
67e15fa5b487adb9 Russell King      2019-08-31  795  	*inst = __mem_to_opcode_thumb16(instr);
67e15fa5b487adb9 Russell King      2019-08-31  796  
67e15fa5b487adb9 Russell King      2019-08-31  797  	return fault;
67e15fa5b487adb9 Russell King      2019-08-31  798  }
67e15fa5b487adb9 Russell King      2019-08-31  799  

:::::: The code at line 776 was first introduced by commit
:::::: 67e15fa5b487adb9b78a92789eeff2d6ec8f5cee ARM: mm: fix alignment handler faults under memory pressure

:::::: TO: Russell King <rmk+kernel@armlinux.org.uk>
:::::: CC: Russell King <rmk+kernel@armlinux.org.uk>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
