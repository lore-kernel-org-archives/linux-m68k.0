Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E21E1AAE00
	for <linux-m68k@lists.linux-m68k.org>; Wed, 31 Jul 2024 09:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722418479; cv=none; b=FTQPv3gfwCzo8hvXtTDS0nBqlvMMvwlgaKRNP3K4CYyvQ/YZP3EWHbWqkGfWha+b1UIr6hXbJ6Yx0czM8ayXWwh/0ya8eLKGHj65EbUxneTBTjF02rvbmLwOP1v4fs+tAhpnPNupJVvf6k4JHMz+r8W/GardOlzSVsXU9jeO/4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722418479; c=relaxed/simple;
	bh=AjeYFEGtVigmaDRhzf12TODu3xbOpI1Hs8dnu9Nr93s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=L/yST8xFB2Rbqyjeatv4FOqL3m1IwJ1BkZAHJmIBpm1BGx68BcB5h+lcshLlSGsg4IzMMYWcwZUoMHHDYc1oguYTfCAp6Sp9ave2+FcUGt0eDYp+c/qjkGisnjpqtOiSvmkVAqR+D96o5w5JNsj2XZaVWHXRxqtzbLn/IS2uh4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aJ22cI9u; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aJ22cI9u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722418477; x=1753954477;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AjeYFEGtVigmaDRhzf12TODu3xbOpI1Hs8dnu9Nr93s=;
  b=aJ22cI9uIsRsVe4AlwxHnfPgl/4GdRRuNZ/4UZUy5KpFm/HdrXkBnzF6
   E019+dp+mYkebdsY9kn9kYgPn7CW5z7zxTLbmsA4TCA+r4vRU77ti6pR/
   u1DTbOxC7IkV7ML/ZXBQJTm7J9US1ypuAn1TYA4VgWoQXhuQSWm/qSbBz
   7khev+gVQzCPQ593FkXXtuIcRgWdiJXJOdIGgMmRuHoVnO4QKSy1Ipb6G
   nH7C/bodUDHmOjHj11676hk+3C+qrOJy2kZ/XRIaQy7FK6ui5uLnM+4a7
   O9iLuUI5lprAJWRdLoB4PsKe4xTkdWnrpXuSYClDkI+t4XypXYSu4FBOZ
   Q==;
X-CSE-ConnectionGUID: ViVsIgyZRySo/Oa6CkyfFQ==
X-CSE-MsgGUID: XGBPlXL6RlydJt2gRPHBNQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11149"; a="12803291"
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; 
   d="scan'208";a="12803291"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2024 02:34:31 -0700
X-CSE-ConnectionGUID: lVIKjsPWRrCvjeKGi1MHFg==
X-CSE-MsgGUID: rX7Gfi8vQ3ChE3OxHP3fVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; 
   d="scan'208";a="54871125"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 31 Jul 2024 02:34:30 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sZ5j1-000u5o-0n;
	Wed, 31 Jul 2024 09:34:27 +0000
Date: Wed, 31 Jul 2024 17:34:22 +0800
From: kernel test robot <lkp@intel.com>
To: Greg Ungerer <gerg@uclinux.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
	uclinux-dev@uclinux.org
Subject: [gerg-m68knommu:armnommu 3/3] arch/arm/mm/alignment.c:775:25:
 sparse: sparse: incorrect type in argument 1 (different address spaces)
Message-ID: <202407311725.iQ5sIAIR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Greg,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git armnommu
head:   ed5fa52b95e3fa1433687bfe643b2846858a8d92
commit: ed5fa52b95e3fa1433687bfe643b2846858a8d92 [3/3] ARM: versatile: support configuring versatile machine for no-MMU
config: arm-randconfig-r111-20240731 (https://download.01.org/0day-ci/archive/20240731/202407311725.iQ5sIAIR-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20240731/202407311725.iQ5sIAIR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407311725.iQ5sIAIR-lkp@intel.com/

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
