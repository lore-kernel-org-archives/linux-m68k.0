Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1F032441A7
	for <linux-m68k@lists.linux-m68k.org>; Thu, 12 Jun 2025 13:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749736641; cv=none; b=CngAeQkV9dzS1XcTYURr4DS6nzJuZ5tMJ1YLhBthVbs7RnlGAi9/ErrZU05zP3qGAMDLNLaOYt6vhVMPbBK9E0geOEkW1jP0G1hIPw4r7QCaFWJ+0xneJZpZa6Zie2rWexOUEueEvpUu/uCfzkm51QVC9oojzn0D308aL0anm9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749736641; c=relaxed/simple;
	bh=F7bde/Npr4YGTsBIjpskcngwX6JWR57U9O1yVp+CEcw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=X+kAkwwnkUrSpOedDqP/dNBIZqa+lmQ2rTGBa0zfsdaf8mS6bsbXPx9vNfhcpFU5+8hICKoRMrJGjR1frqX6DJPxepv5p7gOL89wTWB3c+7WyBGTUpXgFPvcg0+GZ9PcrmhLLv0R0MjkqTLJjgmaL1z0EYB0g56Wk6Ai9aY+sY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ngnkwd9L; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ngnkwd9L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749736640; x=1781272640;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=F7bde/Npr4YGTsBIjpskcngwX6JWR57U9O1yVp+CEcw=;
  b=ngnkwd9LB2FDvnRZJCmejmv1dvB5tymGEah7vm/eLxoBMBTdATONao0N
   OQWKmTQC5pdmk9bmbWcgjOjExazEi9aa58lIub6CRFQ41EFEK1rMmkMp3
   lNwiNbY76C3C1ZdWWWn0dUBVyS/Z+4C7eTRbMIct2h6hThn5917Cd4Jfa
   5OpZjePg/F/tqg+I3SJczUPOXKwQhbIumdQxf5N4bf/MX/c912xzhg8+Y
   iOhiIHOihG4eMah2Ri+86ZOpwZxz7xYtNOhHtSW/DQ08jV7etfPb5mqyC
   S3u6ewallUgdjUd/aqSLBZmcBiJ/0S74sGbckgL+bBuCOxswZ/N6I7TVi
   A==;
X-CSE-ConnectionGUID: fHow9Aa3QQOsyAn+XjyN5w==
X-CSE-MsgGUID: UwNYOsWqSEqDSppfELV4+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="62955703"
X-IronPort-AV: E=Sophos;i="6.16,231,1744095600"; 
   d="scan'208";a="62955703"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2025 06:57:19 -0700
X-CSE-ConnectionGUID: hsfS+M08QceJviWNTyszOA==
X-CSE-MsgGUID: 3VjKNcKORfysjx3+fSdYkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,231,1744095600"; 
   d="scan'208";a="178431981"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 12 Jun 2025 06:57:17 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uPiQd-000BbW-0R;
	Thu, 12 Jun 2025 13:57:15 +0000
Date: Thu, 12 Jun 2025 21:56:23 +0800
From: kernel test robot <lkp@intel.com>
To: Greg Ungerer <gerg@linux-m68k.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
	uclinux-dev@uclinux.org
Subject: [gerg-m68knommu:dt 12/14] arch/m68k/kernel/setup_mm.c:214:14: error:
 implicit declaration of function 'early_init_dt_verify'
Message-ID: <202506130005.zhZFq5Wk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git dt
head:   a227d3c7914f7e7059bba92fc8a99e4be11b0abf
commit: 57417b30738e9f804d3efecdf41a3119fce08244 [12/14] m68k: implement a builtin devicetree for mm targets
config: m68k-randconfig-r133-20250612 (https://download.01.org/0day-ci/archive/20250613/202506130005.zhZFq5Wk-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 11.5.0
reproduce: (https://download.01.org/0day-ci/archive/20250613/202506130005.zhZFq5Wk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506130005.zhZFq5Wk-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/m68k/kernel/setup.c:3:
   arch/m68k/kernel/setup_mm.c: In function 'm68k_setup_fdt':
>> arch/m68k/kernel/setup_mm.c:214:14: error: implicit declaration of function 'early_init_dt_verify' [-Werror=implicit-function-declaration]
     214 |         if (!early_init_dt_verify(__va(fdt), fdt)) {
         |              ^~~~~~~~~~~~~~~~~~~~
>> arch/m68k/kernel/setup_mm.c:218:9: error: implicit declaration of function 'early_init_dt_scan_nodes'; did you mean 'early_init_dt_scan_chosen_stdout'? [-Werror=implicit-function-declaration]
     218 |         early_init_dt_scan_nodes();
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
         |         early_init_dt_scan_chosen_stdout
   cc1: some warnings being treated as errors


vim +/early_init_dt_verify +214 arch/m68k/kernel/setup_mm.c

   207	
   208	#ifdef CONFIG_BUILTIN_DTB
   209	static void __init m68k_setup_fdt(void)
   210	{
   211		phys_addr_t fdt = (phys_addr_t) &__dtb_start;
   212	
   213		pr_info("m68k generic DT machine support, FDT blob at 0x%08x\n", fdt);
 > 214		if (!early_init_dt_verify(__va(fdt), fdt)) {
   215			pr_err("FDT blob is bad?!\n");
   216			return;
   217		}
 > 218		early_init_dt_scan_nodes();
   219		unflatten_device_tree();
   220	}
   221	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
