Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2F8E38F649
	for <linux-m68k@lists.linux-m68k.org>; Tue, 13 Oct 2026 07:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791876840; cv=none; b=uCzcrh5E9fCb9zrp9XZg/ZXl5obrb2t/MRyLxi2gfKAWRa+PuoNB1NrzZGFGbrdw8p+YV8Zxq+mLF/YWCqBvvWQ1BssIggq60i4ODX3lGbjRXaOt6OPxSCmIcNxwgYj+yU0ElP/5FMDExeF2l+73/pN6f8Cozu4MwYC45qQTcds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791876840; c=relaxed/simple;
	bh=/84qz+HKNn9Q7/u9gRzQi86Jhc6wuLE1/XSUpECA8uE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=P4HxmPbewWEyCFWdlo2hWRho4CGFGrreodhQkfx3R+lSJLCE/qo8zliO/fg/t24Msj15EMx2vby5uwjKFCne8lBNWw37HnXV0lQeFudX9EVWlC3ZoHroIDNpoS9rnePVfF7FFwoF1Jn6Hhz1j5Jz/DgwFe2rhO2/btyqu8SdZt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y2RpLKzD; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y2RpLKzD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791876839; x=1823412839;
  h=date:from:to:cc:subject:message-id;
  bh=/84qz+HKNn9Q7/u9gRzQi86Jhc6wuLE1/XSUpECA8uE=;
  b=Y2RpLKzDkFPpnGKGdTqmcQrPV5BivCGIu22ozcS0jRjF1A6HhtfVEQf5
   oYb2Z9tVnWkMyAG4gB38kmJ75ewLU4zJNq3zTV3NpyqxM+5OjGvyvK3zq
   lzgwkHtw8NS4/zqxgdFsYsBXo0aiY5pRtuLduSLshoRE8e0DeAaf+m8rU
   9ugqeLTxqeFuPWLK7SijCFkpOKhxvl+kotoN/9Y23vLWc73UbrCLKOsuy
   tAoCsA/TW3eFJbj0G5Lz5AcuFAK7k+5737C+CH+fpyM8McgXff2Ybd2xv
   7n8cIw+rmeSAbc4b8x91uSdT5wkmw/8wL0O0Ml21aRQ68Vxv7dyhjyMuD
   Q==;
X-CSE-ConnectionGUID: Eq3SoDsGT+2fI7v55e1/nQ==
X-CSE-MsgGUID: rhOp2bNoQpmPFF+22Aquig==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="466113"
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="466113"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 00:33:57 -0700
X-CSE-ConnectionGUID: r4+k52LlRwSos56w3GLerA==
X-CSE-MsgGUID: 8hJ1hNW1SjKDhOsEZKDzug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="1193900"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 13 Oct 2026 00:33:56 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xGX1F-00000000AQZ-3kGv;
	Tue, 13 Oct 2026 07:33:53 +0000
Date: Tue, 13 Oct 2026 09:33:17 +0200
From: kernel test robot <lkp@intel.com>
To: Greg Ungerer <gerg@uclinux.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
 uclinux-dev@uclinux.org
Subject: [gerg-m68knommu:armnommu 3/3]
 arch/arm/mm/alignment.c:776:25: sparse: sparse: incorrect type in argument 1
 (different address spaces)
Message-ID: <202610130906.aIeRR116-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git armnommu
head:   dd5d1340f9d2226762be6e009f9dcc3d8639d1a2
commit: dd5d1340f9d2226762be6e009f9dcc3d8639d1a2 [3/3] ARM: versatile: support configuring versatile machine for no-MMU
config: arm-randconfig-r2308-20261013 (https://download.01.org/0day-ci/archive/20261013/202610130906.aIeRR116-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project ce2a4984a3f43327a2b7c40baa74907bc10eb899)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261013/202610130906.aIeRR116-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610130906.aIeRR116-lkp@intel.com/

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
