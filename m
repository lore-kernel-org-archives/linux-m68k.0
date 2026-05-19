Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 282733F8EB7
	for <linux-m68k@lists.linux-m68k.org>; Tue, 19 May 2026 12:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779193625; cv=none; b=O+0fMzGhivdQYtN8Zhg373Mms4ReHvqs6pWCG9KB0LbrdrFlPcP6NIE5sTMGRu6GbRPo0fAenNymnspAYSQfE8cC7I8p+SIdzC0JgwFNz2PzTAss32+tjjRlz2qLFPr6UChzsR6Hg3YsOeSYKApI8qdAWHEOuPbhWcpxEYgK1e0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779193625; c=relaxed/simple;
	bh=wDydDBmGC/KYBQBpFNBdkQgWWJShdVpgIUDA4hocT88=;
	h=Date:From:To:Cc:Subject:Message-ID; b=q081EdeNam7nM2JkPM0h/uLjBJ1/KUiiHA/upMCeQXbAxPxciktfH09PAH97msKWnpxzEETzMwi77UD2BBkt6+TYbmxuXu7m4VCCTsRaVm9Fr8TDfHNHoymfN9AxC8eQhALKbVqtcyLCNMBEz56f8hMLW4xlPYgb6dDpNnMGIT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lWEaAZgj; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lWEaAZgj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779193624; x=1810729624;
  h=date:from:to:cc:subject:message-id;
  bh=wDydDBmGC/KYBQBpFNBdkQgWWJShdVpgIUDA4hocT88=;
  b=lWEaAZgjeDTv+L9TWNW1nvhN3bvEppERssU21N+mVcaFBJ6A62YoWQgL
   v5C39uJrWgYu3fFaAiyRTzXeF0Q0u1XyjiAc0yURfrskqJNo2LRyxdV97
   yNk2iW/0ocSojaqaoSaBYVp8BDq+0fUJLXBetlACi5zon98wZ200aK2Bk
   hhOKEZKBHga36aLTx00/Ph6eNpxPCW+t3SHabzGg1yHi70L7PqRi2y4sY
   c19zTurWoQ03ikszt0XC+sWsgbgS8/jblDEl5EoKrZSZnu14OXhfyYVAC
   4htxXKDD/IrxR095/q+hzkpfU3ECUg2JMuoUjd51esRRM/UYMAl170YcQ
   Q==;
X-CSE-ConnectionGUID: hLKdXZMVRcmBjBH5/U3p/Q==
X-CSE-MsgGUID: iyz/WKmDRsCB8hGgxShQwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="90649051"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="90649051"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 05:26:52 -0700
X-CSE-ConnectionGUID: tGmwnIK4TxKillaSaMLOIQ==
X-CSE-MsgGUID: xslZhum9RF+jjDhX1yxZ2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="239813857"
Received: from lkp-server02.sh.intel.com (HELO 30e86e9c1927) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 19 May 2026 05:26:50 -0700
Received: from kbuild by 30e86e9c1927 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPJX5-0000000012f-0HAJ;
	Tue, 19 May 2026 12:26:47 +0000
Date: Tue, 19 May 2026 20:25:21 +0800
From: kernel test robot <lkp@intel.com>
To: Greg Ungerer <gerg@linux-m68k.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
 uclinux-dev@uclinux.org
Subject: [gerg-m68knommu:dt 12/14]
 arch/m68k/kernel/setup_mm.c:211:35: error: '__dtb_start' undeclared; did you
 mean '__bss_start'?
Message-ID: <202605192049.GzCMNtkl-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git dt
head:   3173490642db7ab3c9f15b139b19a633a2ac2d5e
commit: c9921b3e98eab8277d9aa71cc084cc821fd14213 [12/14] m68k: implement a builtin devicetree for mm targets
config: m68k-randconfig-r051-20260519 (https://download.01.org/0day-ci/archive/20260519/202605192049.GzCMNtkl-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260519/202605192049.GzCMNtkl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605192049.GzCMNtkl-lkp@intel.com/

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
