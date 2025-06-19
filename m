Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D47B11712
	for <linux-m68k@lists.linux-m68k.org>; Thu, 19 Jun 2025 01:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750298042; cv=none; b=Vsy7CODaJ53G6yJFfmeubeiFi1GG3KPfQBnwquof/ykAJCVastSxm2d8f2G0634XEVekao7/82N9zGHwQlTIPW1Em0FbZrZYUZuOhWe3SF02M8qwp7aAQqo9yreNUGSCNLpuli+m+PaltrfJ9KTLHApLQekEYcbQz5uDRyObPjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750298042; c=relaxed/simple;
	bh=O7eaeRLpLd9wPFxYlyxU1E6Nvwhh1QSONQrGB9YbRPA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EubJz82cqUo3S8Y4bRzNQHeQhdvVNUVQWDzlmUlt4prn5ZJFYtG3gdNh2TAzvu+Ug2YQD/YYryurcWhSVTZmWHD8YI1CEeIOTXKGjf+LWcIRSV+H/cGBYxExkdbB8Nd5+ZPqFcqc0Lv7y47wkezrY1EJwVQJ1qJO05bY/wTwhXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GzRYv9LK; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GzRYv9LK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750298041; x=1781834041;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=O7eaeRLpLd9wPFxYlyxU1E6Nvwhh1QSONQrGB9YbRPA=;
  b=GzRYv9LKLo21VEolAAy1Vd7FMCaFuNsuMr6wPFv/+egRW1QjNuLQ5Zvi
   0uhWka+o9dij7gJVaVkAMn2/jAZuLsMgBzhu3bmM3/wi87MmVYB4PjmaU
   1NKqAPFgMtIqs4LobJWKnBVEeypFVmW5VW1fR97Y+nUWFgITLK8ncdBcp
   cS+1Z0MUcHQZ37GjNKDc+vsR69us2F8Tcp7MOGxWlYLGXOIXnSl7+VO/L
   B7NTki4woqtl7y5Lwf4Ua2Wr0Y10e6eUWB50oi8qFDTrfhmRhvR/M2E1I
   U1C7Qs56CGiqSLHRCqGxdwg9OHbQFsBQScAcD3Omu1qsPGpFbFFsee3Ou
   Q==;
X-CSE-ConnectionGUID: pboGsSQpQk+PajZEkPY/6w==
X-CSE-MsgGUID: ebpE+KHrTaGhs/zQBv0ZwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="69977369"
X-IronPort-AV: E=Sophos;i="6.16,247,1744095600"; 
   d="scan'208";a="69977369"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2025 18:54:00 -0700
X-CSE-ConnectionGUID: OEOfAj0OT5qM04gJeiEfeQ==
X-CSE-MsgGUID: M8ZbeMA3RpC8SZMkAgNPRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,247,1744095600"; 
   d="scan'208";a="150159328"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 18 Jun 2025 18:53:58 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uS4TT-000KKE-38;
	Thu, 19 Jun 2025 01:53:55 +0000
Date: Thu, 19 Jun 2025 09:53:15 +0800
From: kernel test robot <lkp@intel.com>
To: Greg Ungerer <gerg@linux-m68k.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
	uclinux-dev@uclinux.org
Subject: [gerg-m68knommu:dt 12/14] arch/m68k/kernel/setup_mm.c:211:35: error:
 '__dtb_start' undeclared; did you mean '__bss_start'?
Message-ID: <202506190908.gLDCd0cr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git dt
head:   c0b8c6b8045a76e54fd4593f5fb10d664cfdd567
commit: df45e9cc174c8ab6fae0d3066666e09ed6b27ba6 [12/14] m68k: implement a builtin devicetree for mm targets
config: m68k-randconfig-r122-20250619 (https://download.01.org/0day-ci/archive/20250619/202506190908.gLDCd0cr-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 8.5.0
reproduce: (https://download.01.org/0day-ci/archive/20250619/202506190908.gLDCd0cr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506190908.gLDCd0cr-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/m68k/kernel/setup.c:3:
   arch/m68k/kernel/setup_mm.c: In function 'm68k_setup_fdt':
>> arch/m68k/kernel/setup_mm.c:211:35: error: '__dtb_start' undeclared (first use in this function); did you mean '__bss_start'?
     phys_addr_t fdt = (phys_addr_t) &__dtb_start;
                                      ^~~~~~~~~~~
                                      __bss_start
   arch/m68k/kernel/setup_mm.c:211:35: note: each undeclared identifier is reported only once for each function it appears in

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for OF_EARLY_FLATTREE
   Depends on [n]: OF [=n]
   Selected by [y]:
   - BUILTIN_DTB [=y]


vim +211 arch/m68k/kernel/setup_mm.c

   207	
   208	#ifdef CONFIG_BUILTIN_DTB
   209	static void __init m68k_setup_fdt(void)
   210	{
 > 211		phys_addr_t fdt = (phys_addr_t) &__dtb_start;
   212	
   213		pr_info("m68k generic DT machine support, FDT blob at 0x%08x\n", fdt);
   214		if (!early_init_dt_verify(__va(fdt), fdt)) {
   215			pr_err("FDT blob is bad?!\n");
   216			return;
   217		}
   218		early_init_dt_scan_nodes();
   219		unflatten_device_tree();
   220	}
   221	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
