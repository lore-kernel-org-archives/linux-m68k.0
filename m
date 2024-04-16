Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B0CF17E
	for <linux-m68k@lists.linux-m68k.org>; Tue, 16 Apr 2024 00:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713226601; cv=none; b=iqCtvM1BF9Jpy+C1tWIY9wtpC+AtILWoZwOPqGCOKUaivAzRmuYT50RUaclvAiH9Hu8CzW13daVAhfcSKRE4DX/xjNn3YtC3pftz7tUv4y6XaS/vmT8LPy17bHiuEZDaUfbETnO0ZIAaQFvPtehs0z61zI/oqcm6oA+S4wa7akw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713226601; c=relaxed/simple;
	bh=wcdZ/LeW8yglZVwwnQnRlQUkU1747Hi2q58ForKUclM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YHcVpPPzcVoaypJbTTtN4nboccN9gjDh0p34w5X0C3In7qcAnVkgDxIavEqikMS7rbcxxcpIf9MHHLZ6eLQTQlZh7UrA2DWRoYzgMXKoq8kpXq8EBSh+y3gUB+9juONRwC5oebdwLJQbjB3LtLp3/hkw6Nm2CZbqsOMupURt2WA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S9HvNUKz; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S9HvNUKz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713226599; x=1744762599;
  h=date:from:to:cc:subject:message-id;
  bh=wcdZ/LeW8yglZVwwnQnRlQUkU1747Hi2q58ForKUclM=;
  b=S9HvNUKzhawglYeKpETSIcfz3WQoeAvBdujvp3u9w4lF4pOo7LRU2s3W
   0juNdrBH+QC/shTBB68a3dAg1ndnf8+leqf9p65FAW7OPnmhFDpmCTxmI
   h85JE0s2A3HciVrpHhUqlhrZBkFN8gJndUymCYsBSvzOVS8DW8RD69WNf
   droX+kDT/oNmoqDnIrk0YD6po18MRQiVyahRAHPholQR+WD506WuVtTAo
   56GduzZsvMZYY1x8yTi9waBpoLOndi40toa2suqw/9M66I8ekJzJ8IRp2
   fjD89vw0tKIBvY4divSGrRAFqA/u+2DIYplHNd+bfQzD50xgGO+L+Ma0E
   w==;
X-CSE-ConnectionGUID: XIvyrEpEQvmHny1tN2d5NA==
X-CSE-MsgGUID: v+MCUNJDT5mDOUz/0B1hLg==
X-IronPort-AV: E=McAfee;i="6600,9927,11045"; a="8505563"
X-IronPort-AV: E=Sophos;i="6.07,204,1708416000"; 
   d="scan'208";a="8505563"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2024 17:16:38 -0700
X-CSE-ConnectionGUID: 9FiQ7Of+TUiQvSfy6fWRTw==
X-CSE-MsgGUID: E+CFXZLvSbuXF/JHvjHYGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,204,1708416000"; 
   d="scan'208";a="53270500"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 15 Apr 2024 17:16:37 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rwWV0-0004kM-13;
	Tue, 16 Apr 2024 00:16:34 +0000
Date: Tue, 16 Apr 2024 08:16:17 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:master] BUILD SUCCESS
 33ab37f265940f8e044b54c710fff14e91f68b19
Message-ID: <202404160815.d93CUDAb-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git master
branch HEAD: 33ab37f265940f8e044b54c710fff14e91f68b19  Merge tag 'v6.9-rc4'

elapsed time: 735m

configs tested: 178
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                     nsimosci_hs_defconfig   gcc  
arc                   randconfig-001-20240416   gcc  
arc                   randconfig-002-20240416   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                        clps711x_defconfig   clang
arm                                 defconfig   clang
arm                         lpc32xx_defconfig   clang
arm                            mmp2_defconfig   gcc  
arm                   randconfig-001-20240416   clang
arm                   randconfig-002-20240416   clang
arm                   randconfig-003-20240416   gcc  
arm                   randconfig-004-20240416   clang
arm                        spear6xx_defconfig   clang
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240416   gcc  
arm64                 randconfig-002-20240416   clang
arm64                 randconfig-003-20240416   gcc  
arm64                 randconfig-004-20240416   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240416   gcc  
csky                  randconfig-002-20240416   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240416   clang
hexagon               randconfig-002-20240416   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240415   clang
i386         buildonly-randconfig-002-20240415   gcc  
i386         buildonly-randconfig-003-20240415   gcc  
i386         buildonly-randconfig-004-20240415   gcc  
i386         buildonly-randconfig-005-20240415   gcc  
i386         buildonly-randconfig-006-20240415   clang
i386                                defconfig   clang
i386                  randconfig-001-20240415   gcc  
i386                  randconfig-002-20240415   clang
i386                  randconfig-003-20240415   gcc  
i386                  randconfig-004-20240415   gcc  
i386                  randconfig-005-20240415   gcc  
i386                  randconfig-006-20240415   clang
i386                  randconfig-011-20240415   gcc  
i386                  randconfig-012-20240415   clang
i386                  randconfig-013-20240415   gcc  
i386                  randconfig-014-20240415   gcc  
i386                  randconfig-015-20240415   gcc  
i386                  randconfig-016-20240415   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240416   gcc  
loongarch             randconfig-002-20240416   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                          hp300_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                        bcm47xx_defconfig   clang
mips                     loongson1c_defconfig   gcc  
mips                           rs90_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240416   gcc  
nios2                 randconfig-002-20240416   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240416   gcc  
parisc                randconfig-002-20240416   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                   currituck_defconfig   clang
powerpc                   lite5200b_defconfig   clang
powerpc                 mpc8313_rdb_defconfig   gcc  
powerpc                 mpc832x_rdb_defconfig   gcc  
powerpc               randconfig-001-20240416   clang
powerpc               randconfig-002-20240416   gcc  
powerpc               randconfig-003-20240416   clang
powerpc64             randconfig-001-20240416   gcc  
powerpc64             randconfig-002-20240416   gcc  
powerpc64             randconfig-003-20240416   gcc  
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240416   gcc  
riscv                 randconfig-002-20240416   gcc  
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240416   clang
s390                  randconfig-002-20240416   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                            hp6xx_defconfig   gcc  
sh                    randconfig-001-20240416   gcc  
sh                    randconfig-002-20240416   gcc  
sh                      rts7751r2d1_defconfig   gcc  
sh                             sh03_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240416   gcc  
sparc64               randconfig-002-20240416   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240416   gcc  
um                    randconfig-002-20240416   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240416   gcc  
x86_64       buildonly-randconfig-002-20240416   gcc  
x86_64       buildonly-randconfig-003-20240416   gcc  
x86_64       buildonly-randconfig-004-20240416   clang
x86_64       buildonly-randconfig-005-20240416   gcc  
x86_64       buildonly-randconfig-006-20240416   clang
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240416   clang
x86_64                randconfig-002-20240416   clang
x86_64                randconfig-003-20240416   gcc  
x86_64                randconfig-004-20240416   clang
x86_64                randconfig-005-20240416   clang
x86_64                randconfig-006-20240416   gcc  
x86_64                randconfig-011-20240416   gcc  
x86_64                randconfig-012-20240416   clang
x86_64                randconfig-013-20240416   clang
x86_64                randconfig-014-20240416   clang
x86_64                randconfig-015-20240416   clang
x86_64                randconfig-016-20240416   gcc  
x86_64                randconfig-071-20240416   clang
x86_64                randconfig-072-20240416   clang
x86_64                randconfig-073-20240416   clang
x86_64                randconfig-074-20240416   clang
x86_64                randconfig-075-20240416   gcc  
x86_64                randconfig-076-20240416   gcc  
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                randconfig-002-20240416   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
