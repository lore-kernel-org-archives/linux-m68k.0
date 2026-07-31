Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83FC02F3C3E
	for <linux-m68k@lists.linux-m68k.org>; Fri, 31 Jul 2026 20:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785529807; cv=none; b=h0D0Sgv28TxqANTIWMUVWJeF68S287jxEeNjikdTAwHOgRap2xietvZlwUyaQkb69h0UJ/Gu/J5WobRyUBG7fLgIHFn0HXl57GGshqO5opibudcEzSsu04ydxEQfymue0/qZTS2/mdMm2Rok9Lu7zHTv5dhOOO9dEHEn+qVTlWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785529807; c=relaxed/simple;
	bh=RULOuNty4gLh4Av03kezlPA23T7RK4XQ6m679Ta/JC0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=iETJtIX6XKfHse9rvWLS4wvzjdmBnjTl8He6nu2Z2mijAwlk20UV5fLk3dyNjEn9cd8RWhY5hEeDpVt9d6JJOk3ozDBU62xjvE4tTs1/oS6r0fr93o6E6PBDKKArJewEPVPNr1p24l8oih9oNPTwPZDDBkeRIuI712GJ/uYB2X0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YMqTFogq; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YMqTFogq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785529806; x=1817065806;
  h=date:from:to:cc:subject:message-id;
  bh=RULOuNty4gLh4Av03kezlPA23T7RK4XQ6m679Ta/JC0=;
  b=YMqTFogq8kR0tpH62u+dfQ2q+plhAWAsHQ2V+u4F+1DAfBMmp2q3SC71
   CukOtpke0Gy1F8kV/XSx/HiPNg5ZzFXzqJJBozeGqRXuxm9ylywcYMbWe
   kWhbLqkfV29Ftjk+R34zOVoWZfPLXujSTAqmotdTLuR09YZQn0XhkfjMu
   ctQQWLql3ODzMMwPZ3mEyL7EAH9QDVbtXQVf7+bxPDGo/yJRVelYMyPzQ
   05JgcdeJWI412tUq3/NxxS9+n+KM9dT715ElNS536CTEmXo6ePFcoIfaV
   RDpEeT5tsmqcqD6iNaIO416dFzrHPEU38ZT9cX0RH86mUe8rV7FVpT9rR
   g==;
X-CSE-ConnectionGUID: 3YRbCSIhTBKA4YL+hHZhEw==
X-CSE-MsgGUID: Mx8eGaMOQGyswvqeEx9ttw==
X-IronPort-AV: E=McAfee;i="6800,10657,11861"; a="86175764"
X-IronPort-AV: E=Sophos;i="6.25,197,1779174000"; 
   d="scan'208";a="86175764"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2026 13:30:04 -0700
X-CSE-ConnectionGUID: Ou2xad8RQ1WRLraWEPjgPg==
X-CSE-MsgGUID: aTt5vhkyR2W46VUvPfNc+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,197,1779174000"; 
   d="scan'208";a="258869353"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 31 Jul 2026 13:30:02 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wptrj-000000002C7-3KlE;
	Fri, 31 Jul 2026 20:29:59 +0000
Date: Sat, 01 Aug 2026 04:29:09 +0800
From: kernel test robot <lkp@intel.com>
To: Greg Ungerer <gerg@uclinux.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
 uclinux-dev@uclinux.org
Subject: [gerg-m68knommu:armnommu 3/3]
 arch/arm/mm/alignment.c:776:25: sparse: sparse: incorrect type in argument 1
 (different address spaces)
Message-ID: <202608010410.aN1TXznM-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git armnommu
head:   c3abc5777e04ce2e70f0d1f870409b9332e3b8ea
commit: c3abc5777e04ce2e70f0d1f870409b9332e3b8ea [3/3] ARM: versatile: support configuring versatile machine for no-MMU
config: arm-randconfig-r133-20260731 (https://download.01.org/0day-ci/archive/20260801/202608010410.aN1TXznM-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260801/202608010410.aN1TXznM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608010410.aN1TXznM-lkp@intel.com/

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
