Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF5CB35F193
	for <linux-m68k@lists.linux-m68k.org>; Mon,  1 Jun 2026 19:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780343238; cv=none; b=XdgK1hwF4oJZOdCPzU+iwcIi+TV8IXfFyMZI+neVfhwblSCk37/8WXAFjsCHCjh3YUrsO8BM9sntrzfy1r9MbcBWj0bF6rh1Sj9DKWYOefdq/ud8YWpOesOJK9aeTI7nVKPU/5/K1wbzo8IglPi1P6d95Q3DRZuxdhmds6a0IlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780343238; c=relaxed/simple;
	bh=XrDninaDmwSyd+Ny5hkH9Us0nuzSziFzIm1jBsWhNmk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Xgil/ybRevBVSY0s/Km0QZdnFs2Qgm3M5sk4KXi29COdF8xpFbkX+dkvZnJ2QjKDGxrjNznWzoEfgFmLXDOZ6yGybs3lh9HkeeNQGDpooANpU6ifxYeneZe9ePtVGeKFb0qZlcYWEk+LW3IW5wNB/ZkAIfawCt6S657Y5t6IPJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jJO90LHS; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jJO90LHS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780343237; x=1811879237;
  h=date:from:to:cc:subject:message-id;
  bh=XrDninaDmwSyd+Ny5hkH9Us0nuzSziFzIm1jBsWhNmk=;
  b=jJO90LHS+UxKzIkQN7V50dNBQ6gMMe71doTcS4ev0WdZTLLzoWnKXMB0
   bkVYkg82UTWzBNQTSMWRe9JEFsIRdakGhyv5qvRLDl+jrmAORquBytBcu
   FIqds/v55ZekXZEcpeLFzMTq8XDxiXWvUOlXR96ycgxVFqSJudPfaQA8c
   qCo7mP4jw4gdiJz67vvqUGp/OCUJYQqF/LRxB4JgMJTC4r4CFc5SYwFCf
   IfHEuA0VCanDg2MBya2MbToV27NqOk9EoX25aW5ZbxitTU5Kc8yKQrOJD
   8BZzgpoUnnOOHFjCMZcTmhP6o2ifr6Ow+IRwcMIEKIREP9BcNszpRVo8N
   w==;
X-CSE-ConnectionGUID: /kAOwMyMSP6j0+yGFPbrNA==
X-CSE-MsgGUID: 8tGvcLywSA6/U8n4nRVeow==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="81141043"
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; 
   d="scan'208";a="81141043"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2026 12:47:16 -0700
X-CSE-ConnectionGUID: wGVNwSCnQiWnd+Mir0agtA==
X-CSE-MsgGUID: cvwvMVB4TjeQG+7AA64iBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; 
   d="scan'208";a="240676855"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 01 Jun 2026 12:47:14 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wU8bP-00000000B1S-3FGh;
	Mon, 01 Jun 2026 19:47:11 +0000
Date: Tue, 02 Jun 2026 03:46:46 +0800
From: kernel test robot <lkp@intel.com>
To: Greg Ungerer <gerg@uclinux.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
 uclinux-dev@uclinux.org
Subject: [gerg-m68knommu:armnommu 3/3]
 arch/arm/mach-versatile/versatile.c:89:23: sparse: sparse: symbol
 'versatile_auxdata_lookup' was not declared. Should it be static?
Message-ID: <202606020323.kLHaRcqX-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git armnommu
head:   4dd9730e9bed27b56f15e10eb787b468fb5b9343
commit: 4dd9730e9bed27b56f15e10eb787b468fb5b9343 [3/3] ARM: versatile: support configuring versatile machine for no-MMU
config: arm-randconfig-r113-20260601 (https://download.01.org/0day-ci/archive/20260602/202606020323.kLHaRcqX-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project e5ab4f8a1f766febdc65ce89c00dec85393cfd68)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260602/202606020323.kLHaRcqX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606020323.kLHaRcqX-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/arm/mach-versatile/versatile.c:89:23: sparse: sparse: symbol 'versatile_auxdata_lookup' was not declared. Should it be static?

vim +/versatile_auxdata_lookup +89 arch/arm/mach-versatile/versatile.c

a7096789211193 arch/arm/mach-versatile/versatile_dt.c Rob Herring 2015-12-08  82  
a7096789211193 arch/arm/mach-versatile/versatile_dt.c Rob Herring 2015-12-08  83  /*
a7096789211193 arch/arm/mach-versatile/versatile_dt.c Rob Herring 2015-12-08  84   * Lookup table for attaching a specific name and platform_data pointer to
a7096789211193 arch/arm/mach-versatile/versatile_dt.c Rob Herring 2015-12-08  85   * devices as they get created by of_platform_populate().  Ideally this table
a7096789211193 arch/arm/mach-versatile/versatile_dt.c Rob Herring 2015-12-08  86   * would not exist, but the current clock implementation depends on some devices
a7096789211193 arch/arm/mach-versatile/versatile_dt.c Rob Herring 2015-12-08  87   * having a specific name.
a7096789211193 arch/arm/mach-versatile/versatile_dt.c Rob Herring 2015-12-08  88   */
a7096789211193 arch/arm/mach-versatile/versatile_dt.c Rob Herring 2015-12-08 @89  struct of_dev_auxdata versatile_auxdata_lookup[] __initdata = {
a7096789211193 arch/arm/mach-versatile/versatile_dt.c Rob Herring 2015-12-08  90  	OF_DEV_AUXDATA("arm,primecell", VERSATILE_MMCI0_BASE, "fpga:05", &mmc0_plat_data),
a7096789211193 arch/arm/mach-versatile/versatile_dt.c Rob Herring 2015-12-08  91  	OF_DEV_AUXDATA("arm,primecell", VERSATILE_MMCI1_BASE, "fpga:0b", &mmc1_plat_data),
a7096789211193 arch/arm/mach-versatile/versatile_dt.c Rob Herring 2015-12-08  92  	{}
a7096789211193 arch/arm/mach-versatile/versatile_dt.c Rob Herring 2015-12-08  93  };
a7096789211193 arch/arm/mach-versatile/versatile_dt.c Rob Herring 2015-12-08  94  

:::::: The code at line 89 was first introduced by commit
:::::: a70967892111934e292485ce84f1bab38cc55380 ARM: versatile: merge mach code into a single file

:::::: TO: Rob Herring <robh@kernel.org>
:::::: CC: Arnd Bergmann <arnd@arndb.de>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
