Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 152E05474C
	for <linux-m68k@lists.linux-m68k.org>; Wed, 12 Feb 2025 05:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739337183; cv=none; b=LWI0YJbLdnzkmu21al+Z66RxGF7bifxvvO5ST5bQpdQWHIjjq1pDqXU4Qr7fHoW0O9FvKUnmCNB+k4zkoFnABkSkfZoD6rPIRBUbD7Ygw5Cp0BxN0t82hqagJYCQ6RzSAHt0TVg+Ufsq/p0E1DDFmxol/PhQLsZ8cfhnWPmHnuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739337183; c=relaxed/simple;
	bh=oe0fTsNo8bMqAheJ3gGJq1II43oIue87Q/ngNEh4mR4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ji4dObfldQrAnwaeDpY6J8OaEz52XHfTfnV8P/cmu3ug3Z6suSRCCw/Bzf71Q+pNndDG4iBBM7tx9yzDi/paAHy3HVL2ni9IMJ2OL1HWUn2oBC/gU18hE17Dh98pxM/LHzYfyujrij6MU44SkVMBBbsOIGLmPtEX2LhoshoEK4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QP+jlPvd; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QP+jlPvd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739337182; x=1770873182;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oe0fTsNo8bMqAheJ3gGJq1II43oIue87Q/ngNEh4mR4=;
  b=QP+jlPvdp3n7U5L7T7NK9ZIV8Zc/9AQ8hR7yk5vUqtDXc83rYsdZLMEV
   ZchtFo+n1weu+pp5EUPTo1Vr6nWY3b0BWn9A0IAR3wXSGUSSVaex3XY3x
   sP0c4M8ES37pkQnnJ06r1dcO6OS+UOII7fca6MNg3QaCd6wEgOQTIs/us
   YwhBK3Md7fKQk+8mGX99Bzt6Ztnk41LiMrHkCd1eEM3vCsdWcaIDJoRQn
   u+XcHGqZ18QHD84w5rQn7AALhMxVDRjZ1MgPufMzrxBme9BN97JEYdQ2z
   7huPZMtOajXSV6wV2hGjAHjcTYV3jp8VplEE+dZr2PA8mxWefN9o1yDne
   Q==;
X-CSE-ConnectionGUID: 8x5PqtK9RBK52ZfCMCUxKw==
X-CSE-MsgGUID: Dtu4BWzPQQe5KV6SfOV5Ew==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="39866101"
X-IronPort-AV: E=Sophos;i="6.13,279,1732608000"; 
   d="scan'208";a="39866101"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 21:13:01 -0800
X-CSE-ConnectionGUID: 9+8kwOnhTK23iKDdJdGKAg==
X-CSE-MsgGUID: gd7idGn3QTGJWW2YvEqNSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,279,1732608000"; 
   d="scan'208";a="112672215"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 11 Feb 2025 21:12:59 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ti53Q-001599-1s;
	Wed, 12 Feb 2025 05:12:56 +0000
Date: Wed, 12 Feb 2025 13:12:31 +0800
From: kernel test robot <lkp@intel.com>
To: Greg Ungerer <gerg@uclinux.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
	uclinux-dev@uclinux.org
Subject: [gerg-m68knommu:armnommu 3/3] arch/arm/mm/alignment.c:775:25:
 sparse: sparse: incorrect type in argument 1 (different address spaces)
Message-ID: <202502121313.XQkyuSmD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git armnommu
head:   282a7ed48056574071566c6f9a3f4edea6601cf1
commit: 282a7ed48056574071566c6f9a3f4edea6601cf1 [3/3] ARM: versatile: support configuring versatile machine for no-MMU
config: arm-randconfig-r122-20250212 (https://download.01.org/0day-ci/archive/20250212/202502121313.XQkyuSmD-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce: (https://download.01.org/0day-ci/archive/20250212/202502121313.XQkyuSmD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502121313.XQkyuSmD-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/arm/mm/alignment.c:775:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __user *ptr @@     got unsigned int [usertype] *ip @@
   arch/arm/mm/alignment.c:775:25: sparse:     expected void const volatile [noderef] __user *ptr
   arch/arm/mm/alignment.c:775:25: sparse:     got unsigned int [usertype] *ip
>> arch/arm/mm/alignment.c:790:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __user *ptr @@     got unsigned short [usertype] *ip @@
   arch/arm/mm/alignment.c:790:25: sparse:     expected void const volatile [noderef] __user *ptr
   arch/arm/mm/alignment.c:790:25: sparse:     got unsigned short [usertype] *ip

vim +775 arch/arm/mm/alignment.c

c2860d43f5dfab George G. Davis   2009-06-04  768  
1bb9fb0a147f9d Russell King      2019-09-06  769  static int alignment_get_arm(struct pt_regs *regs, u32 *ip, u32 *inst)
67e15fa5b487ad Russell King      2019-08-31  770  {
67e15fa5b487ad Russell King      2019-08-31  771  	u32 instr = 0;
67e15fa5b487ad Russell King      2019-08-31  772  	int fault;
67e15fa5b487ad Russell King      2019-08-31  773  
67e15fa5b487ad Russell King      2019-08-31  774  	if (user_mode(regs))
67e15fa5b487ad Russell King      2019-08-31 @775  		fault = get_user(instr, ip);
67e15fa5b487ad Russell King      2019-08-31  776  	else
25f12ae45fc193 Christoph Hellwig 2020-06-17  777  		fault = get_kernel_nofault(instr, ip);
67e15fa5b487ad Russell King      2019-08-31  778  
67e15fa5b487ad Russell King      2019-08-31  779  	*inst = __mem_to_opcode_arm(instr);
67e15fa5b487ad Russell King      2019-08-31  780  
67e15fa5b487ad Russell King      2019-08-31  781  	return fault;
67e15fa5b487ad Russell King      2019-08-31  782  }
67e15fa5b487ad Russell King      2019-08-31  783  
67e15fa5b487ad Russell King      2019-08-31  784  static int alignment_get_thumb(struct pt_regs *regs, u16 *ip, u16 *inst)
67e15fa5b487ad Russell King      2019-08-31  785  {
67e15fa5b487ad Russell King      2019-08-31  786  	u16 instr = 0;
67e15fa5b487ad Russell King      2019-08-31  787  	int fault;
67e15fa5b487ad Russell King      2019-08-31  788  
67e15fa5b487ad Russell King      2019-08-31  789  	if (user_mode(regs))
67e15fa5b487ad Russell King      2019-08-31 @790  		fault = get_user(instr, ip);
67e15fa5b487ad Russell King      2019-08-31  791  	else
25f12ae45fc193 Christoph Hellwig 2020-06-17  792  		fault = get_kernel_nofault(instr, ip);
67e15fa5b487ad Russell King      2019-08-31  793  
67e15fa5b487ad Russell King      2019-08-31  794  	*inst = __mem_to_opcode_thumb16(instr);
67e15fa5b487ad Russell King      2019-08-31  795  
67e15fa5b487ad Russell King      2019-08-31  796  	return fault;
67e15fa5b487ad Russell King      2019-08-31  797  }
67e15fa5b487ad Russell King      2019-08-31  798  

:::::: The code at line 775 was first introduced by commit
:::::: 67e15fa5b487adb9b78a92789eeff2d6ec8f5cee ARM: mm: fix alignment handler faults under memory pressure

:::::: TO: Russell King <rmk+kernel@armlinux.org.uk>
:::::: CC: Russell King <rmk+kernel@armlinux.org.uk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
