Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C879C381B8
	for <linux-m68k@lists.linux-m68k.org>; Tue,  9 Jan 2024 12:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nRkElcpS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704803248; x=1736339248;
  h=date:from:to:cc:subject:message-id;
  bh=i8TN8qupgar5iUDt7ySLTpmZiGMWXqNDt02vUVUooGY=;
  b=nRkElcpStIhblkzfjBVXS6yBV9bVEKZaHzJk7qxK3SGp8aiH62zM6xHh
   cVY5cTM31Yc184vjkuJvVrJXwOSwlW09N1tYEuFObBBgLAUa3N3sN7c05
   jPpzkk+aivU7fFY73z2n/6ms8tEtCQhZMZMlwtEaAHq72VU5xSNWPkNhm
   mqnD3vkk+APbOSsERIOxkpTANk2hFv6e6nTbPDK/FIzvCtpdf8C0Npcc9
   gbVMaT5Co1Y7AptfEJo9m4bATdY2UsfoILIkm0J6Qmx31y8aA/e8tofp3
   cfpwxLjUt6LWyVj+hDCeq4vhaakdnn2zJQh9XvuwzP6OEY3JjB4e+oZlR
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="11668232"
X-IronPort-AV: E=Sophos;i="6.04,182,1695711600"; 
   d="scan'208";a="11668232"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2024 04:27:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="955002161"
X-IronPort-AV: E=Sophos;i="6.04,182,1695711600"; 
   d="scan'208";a="955002161"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 09 Jan 2024 04:27:23 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rNBCT-0005pQ-0L;
	Tue, 09 Jan 2024 12:27:21 +0000
Date: Tue, 09 Jan 2024 20:26:33 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:m68k-v6.7] BUILD SUCCESS
 68f7a449731d9081a261c75fecf6896872e0a194
Message-ID: <202401092031.XdmmVTCz-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git m68k-v6.7
branch HEAD: 68f7a449731d9081a261c75fecf6896872e0a194  m68k: defconfig: Enable Atari EtherNAT and NetUSBee USB support

elapsed time: 1456m

configs tested: 200
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                          axs103_defconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20240109   gcc  
arc                   randconfig-002-20240109   gcc  
arc                    vdk_hs38_smp_defconfig   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                         at91_dt_defconfig   gcc  
arm                                 defconfig   clang
arm                   randconfig-001-20240109   clang
arm                   randconfig-002-20240109   clang
arm                   randconfig-003-20240109   clang
arm                   randconfig-004-20240109   clang
arm                           tegra_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240109   clang
arm64                 randconfig-002-20240109   clang
arm64                 randconfig-003-20240109   clang
arm64                 randconfig-004-20240109   clang
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240109   gcc  
csky                  randconfig-002-20240109   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240109   clang
hexagon               randconfig-002-20240109   clang
i386                             allmodconfig   clang
i386                              allnoconfig   clang
i386                             allyesconfig   clang
i386         buildonly-randconfig-001-20240108   gcc  
i386         buildonly-randconfig-002-20240108   gcc  
i386         buildonly-randconfig-003-20240108   gcc  
i386         buildonly-randconfig-004-20240108   gcc  
i386         buildonly-randconfig-005-20240108   gcc  
i386         buildonly-randconfig-006-20240108   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20240108   gcc  
i386                  randconfig-002-20240108   gcc  
i386                  randconfig-003-20240108   gcc  
i386                  randconfig-004-20240108   gcc  
i386                  randconfig-005-20240108   gcc  
i386                  randconfig-006-20240108   gcc  
i386                  randconfig-011-20240108   clang
i386                  randconfig-011-20240109   gcc  
i386                  randconfig-012-20240108   clang
i386                  randconfig-012-20240109   gcc  
i386                  randconfig-013-20240108   clang
i386                  randconfig-013-20240109   gcc  
i386                  randconfig-014-20240108   clang
i386                  randconfig-014-20240109   gcc  
i386                  randconfig-015-20240108   clang
i386                  randconfig-015-20240109   gcc  
i386                  randconfig-016-20240108   clang
i386                  randconfig-016-20240109   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240109   gcc  
loongarch             randconfig-002-20240109   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                          sun3x_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   clang
mips                             allyesconfig   gcc  
mips                         db1xxx_defconfig   gcc  
mips                      fuloong2e_defconfig   gcc  
mips                           gcw0_defconfig   gcc  
mips                       lemote2f_defconfig   gcc  
nios2                         10m50_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240109   gcc  
nios2                 randconfig-002-20240109   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240109   gcc  
parisc                randconfig-002-20240109   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   clang
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                 canyonlands_defconfig   gcc  
powerpc                      cm5200_defconfig   gcc  
powerpc                     mpc83xx_defconfig   gcc  
powerpc                      ppc40x_defconfig   gcc  
powerpc               randconfig-001-20240109   clang
powerpc               randconfig-002-20240109   clang
powerpc               randconfig-003-20240109   clang
powerpc                    socrates_defconfig   gcc  
powerpc                 xes_mpc85xx_defconfig   gcc  
powerpc64                        alldefconfig   gcc  
powerpc64             randconfig-001-20240109   clang
powerpc64             randconfig-002-20240109   clang
powerpc64             randconfig-003-20240109   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   clang
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                 randconfig-001-20240109   clang
riscv                 randconfig-002-20240109   clang
riscv                          rv32_defconfig   clang
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20240109   gcc  
s390                  randconfig-002-20240109   gcc  
s390                       zfcpdump_defconfig   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                        dreamcast_defconfig   gcc  
sh                          polaris_defconfig   gcc  
sh                    randconfig-001-20240109   gcc  
sh                    randconfig-002-20240109   gcc  
sh                             sh03_defconfig   gcc  
sh                        sh7757lcr_defconfig   gcc  
sh                            titan_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                            allyesconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240109   gcc  
sparc64               randconfig-002-20240109   gcc  
um                               alldefconfig   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                    randconfig-001-20240109   clang
um                    randconfig-002-20240109   clang
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240109   clang
x86_64       buildonly-randconfig-002-20240109   clang
x86_64       buildonly-randconfig-003-20240109   clang
x86_64       buildonly-randconfig-004-20240109   clang
x86_64       buildonly-randconfig-005-20240109   clang
x86_64       buildonly-randconfig-006-20240109   clang
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64                randconfig-001-20240109   gcc  
x86_64                randconfig-002-20240109   gcc  
x86_64                randconfig-003-20240109   gcc  
x86_64                randconfig-004-20240109   gcc  
x86_64                randconfig-005-20240109   gcc  
x86_64                randconfig-006-20240109   gcc  
x86_64                randconfig-011-20240109   clang
x86_64                randconfig-012-20240109   clang
x86_64                randconfig-013-20240109   clang
x86_64                randconfig-014-20240109   clang
x86_64                randconfig-015-20240109   clang
x86_64                randconfig-016-20240109   clang
x86_64                randconfig-071-20240109   clang
x86_64                randconfig-072-20240109   clang
x86_64                randconfig-073-20240109   clang
x86_64                randconfig-074-20240109   clang
x86_64                randconfig-075-20240109   clang
x86_64                randconfig-076-20240109   clang
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa                randconfig-001-20240109   gcc  
xtensa                randconfig-002-20240109   gcc  
xtensa                         virt_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
