Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7348E20514B
	for <linux-m68k@lists.linux-m68k.org>; Wed, 16 Oct 2024 10:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729075753; cv=none; b=SVj1Rgj67MRsmvETWDJmmF1qVzrQkee7tyzxrWR3xu7nnX+a+CRCwFpV3HGuhbchUvji+27UQOUe1xH6/cCV7Zhe+6D2Bu51ZnqCn+cklkgiWB5z6awIyTKNZx2Q92Aefck7D6Gqh4OqkStStTvojZEbn6saUmbMv1YKy/ZeaQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729075753; c=relaxed/simple;
	bh=GVadaHhLcLrtsnROAR0lvUMnMNFCcrfnydA9gx3pUJA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uwrAMZ5Xi7wz/9nNGxESVA8xkuVHdpg4xNWxmNxoLmK0l28Q7IEeAEJeOOqvAA3vOP+qIlZFR3HtV3VCcx2xUSyIKzzFjSfMdo42NS1+KKiDgrnLhPhU48jFP3ZMqB6umQ/IImRKYaQkdn5MB+WHlmwPddxA+FPWX2drR1eadyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K7kAJSAQ; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K7kAJSAQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729075752; x=1760611752;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GVadaHhLcLrtsnROAR0lvUMnMNFCcrfnydA9gx3pUJA=;
  b=K7kAJSAQTDbPmzwk7m3YbIt7iidnp84KZkZXpZ2lLLUu+oFfkyrw7B8w
   Csihkzc4O7mK8wHpniBghOz2Vz2ZnL1XxVsd/ECkuTXiXBvapktwLy7uI
   ywMz/Llz2qOb9nyGLHnujlnAjEboWBOplCMbFpDxs0IczS7B9nvoSaq3e
   Kb/51VqEKYdN4gV4JFhWJRORV7xwa1Srj2dENPANMkZ5YKqxYqMiiCqSh
   mLr7xdeDkGahjQBSCa4PrMOYjAf9Xsn/Lbcz7fCJTPhQhl0YsDNKW6WqD
   CAOrJL4BeQbO19hpCf0WecPXOllf7js38SgExa3d0fJonldH5mQXwtxh6
   g==;
X-CSE-ConnectionGUID: Mda+wgW2Q6eFG6wBoheotQ==
X-CSE-MsgGUID: iZMhHsPbQY2PW7fPMnpJSQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11226"; a="39094897"
X-IronPort-AV: E=Sophos;i="6.11,207,1725346800"; 
   d="scan'208";a="39094897"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2024 03:49:10 -0700
X-CSE-ConnectionGUID: Mjsy7hInS72FoNiuhNOl/Q==
X-CSE-MsgGUID: HHx5ug7+RSuabrGFUcfE1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,207,1725346800"; 
   d="scan'208";a="83268292"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 16 Oct 2024 03:49:08 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t11aT-000KnR-2V;
	Wed, 16 Oct 2024 10:49:05 +0000
Date: Wed, 16 Oct 2024 18:49:04 +0800
From: kernel test robot <lkp@intel.com>
To: Greg Ungerer <gerg@uclinux.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
	uclinux-dev@uclinux.org
Subject: [gerg-m68knommu:armnommu 3/3] arch/arm/mm/alignment.c:775:25:
 sparse: sparse: incorrect type in argument 1 (different address spaces)
Message-ID: <202410161818.37zUnmK2-lkp@intel.com>
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
head:   c0f411fb8c7bae1746892429d7a32ba8ed78e72a
commit: c0f411fb8c7bae1746892429d7a32ba8ed78e72a [3/3] ARM: versatile: support configuring versatile machine for no-MMU
config: arm-randconfig-r132-20241016 (https://download.01.org/0day-ci/archive/20241016/202410161818.37zUnmK2-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20241016/202410161818.37zUnmK2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410161818.37zUnmK2-lkp@intel.com/

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
