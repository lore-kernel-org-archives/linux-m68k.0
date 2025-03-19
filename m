Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 030E8212B18
	for <linux-m68k@lists.linux-m68k.org>; Wed, 19 Mar 2025 06:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742367479; cv=none; b=FbECVywGQUnQx83cP9dqxEg2vq9KmP/a0s0mfutpdf7sQ8JKsawBfljAxNdXsYkaH3bSqJFzUGUUTqph1iNkXK7m/8IdwyeLn6nan28FueTJx0Wuq26CZLotf/y+hhjTtgHcTUFHUu4+uJJTvm0sywOueH/qf9HyPsgphE8OAtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742367479; c=relaxed/simple;
	bh=1rKM9PeN2zsEhS1l04o4OyS2ZPuy4FM17h0OhuLKKAc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NE+y8bmUFM+Iw4wnniAC1Xiad3yNP4xAOTXYpJsfwIOwTOpRfKIDeszME0KsjlBIbJIEL4U6O4vS00QtG9el/XtJ3nNnxFuNy9xkf60F4ZGq4piW/4OtDOa72AWL+PRxR8rxba5DhDhd1hEHzG2pAmVJyYIgPRmHB1BqHtgcN/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iuLRK20K; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iuLRK20K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742367477; x=1773903477;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1rKM9PeN2zsEhS1l04o4OyS2ZPuy4FM17h0OhuLKKAc=;
  b=iuLRK20KAXITr1uFMoiY6NlQdSPtlYW/eB+SWBTbrR99EHIX8QHsK416
   eq0vf6JmlDLqc9UOQMQrRWmgHeuD0U1LO6bQz60Ncld7Kb1cqvl+1eIcG
   nEF2Fc1z1X6K9Svb4clpHgfFNb8CeHkl2c361SvHtXbVLRp2p9091VviN
   jzN/PkAWrfaM+DSGg+RmlhlN23vHuIoB1H5dh4x/bj4W6Q5mwh81Bmh1d
   9Dc1De0IIAKnBdjXm+ic7hgBcvimT98SnvbGiWUjus/0i0s7t24PZ6Vyj
   wpx0Jwo6U//WMbhrbfzM9qts3r/2kaDYse4CPmMAAZygZugi7LwK++WE1
   A==;
X-CSE-ConnectionGUID: Bt+DUz3OR8OBCq3FUZyIYg==
X-CSE-MsgGUID: bPSWbtLeQ9OqhttEnPmvag==
X-IronPort-AV: E=McAfee;i="6700,10204,11377"; a="43709242"
X-IronPort-AV: E=Sophos;i="6.14,259,1736841600"; 
   d="scan'208";a="43709242"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2025 23:57:54 -0700
X-CSE-ConnectionGUID: CKch/ecnQmGLzjwRGnVdhQ==
X-CSE-MsgGUID: 9qaepKgTTEGFWhL0lCfGkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,259,1736841600"; 
   d="scan'208";a="159636213"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 18 Mar 2025 23:57:53 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tunN8-000ERm-12;
	Wed, 19 Mar 2025 06:57:50 +0000
Date: Wed, 19 Mar 2025 14:57:20 +0800
From: kernel test robot <lkp@intel.com>
To: Greg Ungerer <gerg@linux-m68k.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
	uclinux-dev@uclinux.org
Subject: [gerg-m68knommu:dt 11/14] arch/m68k/kernel/setup_no.c:78:35: error:
 '__dtb_start' undeclared; did you mean '__bss_start'?
Message-ID: <202503191416.7qWO7Wpv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git dt
head:   0745513f96d4acbbfa7ec680d7e7a501a81a2684
commit: db44fb7b2762dd968dac8291273ab11c2f5c47df [11/14] m68k: implement a builtin devicetree for nonmmu
config: m68k-randconfig-r072-20250319 (https://download.01.org/0day-ci/archive/20250319/202503191416.7qWO7Wpv-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250319/202503191416.7qWO7Wpv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503191416.7qWO7Wpv-lkp@intel.com/

All errors (new ones prefixed by >>):

>> make[3]: *** No rule to make target 'arch/m68k/boot/dts/mcf5208evb.dtb', needed by 'arch/m68k/boot/dts/'.
>> make[3]: *** No rule to make target 'arch/m68k/boot/dts/mcf5475evb.dtb', needed by 'arch/m68k/boot/dts/'.
   make[3]: Target 'arch/m68k/boot/dts/' not remade because of errors.
--
   In file included from arch/m68k/kernel/setup.c:5:
   arch/m68k/kernel/setup_no.c: In function 'm68k_setup_fdt':
>> arch/m68k/kernel/setup_no.c:78:35: error: '__dtb_start' undeclared (first use in this function); did you mean '__bss_start'?
     phys_addr_t fdt = (phys_addr_t) &__dtb_start;
                                      ^~~~~~~~~~~
                                      __bss_start
   arch/m68k/kernel/setup_no.c:78:35: note: each undeclared identifier is reported only once for each function it appears in
   arch/m68k/kernel/setup_no.c:81:7: error: implicit declaration of function 'early_init_dt_verify'; did you mean 'early_initcall'? [-Werror=implicit-function-declaration]
     if (!early_init_dt_verify(__va(fdt), fdt)) {
          ^~~~~~~~~~~~~~~~~~~~
          early_initcall
   arch/m68k/kernel/setup_no.c:85:2: error: implicit declaration of function 'early_init_dt_scan_nodes'; did you mean 'early_init_dt_scan_chosen_stdout'? [-Werror=implicit-function-declaration]
     early_init_dt_scan_nodes();
     ^~~~~~~~~~~~~~~~~~~~~~~~
     early_init_dt_scan_chosen_stdout
   cc1: some warnings being treated as errors


vim +78 arch/m68k/kernel/setup_no.c

    74	
    75	#ifdef CONFIG_BUILTIN_DTB
    76	static void __init m68k_setup_fdt(void)
    77	{
  > 78		phys_addr_t fdt = (phys_addr_t) &__dtb_start;
    79	
    80		pr_info("m68k generic DT machine support, FDT blob at 0x%08x\n", fdt);
    81		if (!early_init_dt_verify(__va(fdt), fdt)) {
    82			pr_err("FDT blob is bad?!\n");
    83			return;
    84		}
    85		early_init_dt_scan_nodes();
    86		unflatten_device_tree();
    87	}
    88	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
