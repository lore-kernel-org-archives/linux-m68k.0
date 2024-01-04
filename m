Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 247FF2230B
	for <linux-m68k@lists.linux-m68k.org>; Thu,  4 Jan 2024 13:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bHB9EWAC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704374397; x=1735910397;
  h=date:from:to:cc:subject:message-id;
  bh=4SyDUnJwyu3MXSKS+gO5oYlo+yn2u/G+VspLbSFhCdI=;
  b=bHB9EWAC+RUlXdAI5r+7sNgeEcn0UDnCJ7BleMyvZieXGC2CdZYuO6GR
   arvE22Y86oQz2GgT7mskwkCAPKUPVP/kADZrGhIUZwv0zZmXiGqfakOBk
   i0e6/zKvTyemHa+RrYtx2T58HTD3sWeS1IlMIAqtcqh4yhj4tdUbHA9K0
   hcFrU5gA4AcyN6FRds1liHha4BudzZ7cnbA6heIKZqDMbKVP2fKaEbvWB
   RiYb3JHI10MgK0PdR5S2JgAUVi3dXKL7L/I0ADb6F6y8Wt2pKPRtf7X82
   ACmJSqe7u/VPXIt6IV+3yRmd783HKYclsRGTkRYJUgBvadtgDRu+bD9OZ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10942"; a="396132018"
X-IronPort-AV: E=Sophos;i="6.04,330,1695711600"; 
   d="scan'208";a="396132018"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2024 05:19:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10942"; a="783870731"
X-IronPort-AV: E=Sophos;i="6.04,330,1695711600"; 
   d="scan'208";a="783870731"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 04 Jan 2024 05:19:49 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rLNdQ-000NKm-2x;
	Thu, 04 Jan 2024 13:19:45 +0000
Date: Thu, 04 Jan 2024 21:19:22 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:for-v6.8] BUILD SUCCESS
 6b9c045b0602cf64b33ea6da5e6aa6f81dd47ae8
Message-ID: <202401042118.alPrm3rT-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git for-v6.8
branch HEAD: 6b9c045b0602cf64b33ea6da5e6aa6f81dd47ae8  m68k: defconfig: Update defconfigs for v6.7-rc1

elapsed time: 1462m

configs tested: 209
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                          axs101_defconfig   gcc  
arc                                 defconfig   gcc  
arc                        nsim_700_defconfig   gcc  
arc                   randconfig-001-20240104   gcc  
arc                   randconfig-002-20240104   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                            hisi_defconfig   gcc  
arm                       multi_v4t_defconfig   gcc  
arm                         orion5x_defconfig   clang
arm                   randconfig-001-20240104   gcc  
arm                   randconfig-002-20240104   gcc  
arm                   randconfig-003-20240104   gcc  
arm                   randconfig-004-20240104   gcc  
arm                         s3c6400_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240104   gcc  
arm64                 randconfig-002-20240104   gcc  
arm64                 randconfig-003-20240104   gcc  
arm64                 randconfig-004-20240104   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240104   gcc  
csky                  randconfig-002-20240104   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240104   clang
hexagon               randconfig-002-20240104   clang
i386                             allmodconfig   clang
i386                              allnoconfig   clang
i386                             allyesconfig   clang
i386         buildonly-randconfig-001-20240103   clang
i386         buildonly-randconfig-002-20240103   clang
i386         buildonly-randconfig-003-20240103   clang
i386         buildonly-randconfig-004-20240103   clang
i386         buildonly-randconfig-005-20240103   clang
i386         buildonly-randconfig-006-20240103   clang
i386                                defconfig   gcc  
i386                  randconfig-001-20240103   clang
i386                  randconfig-002-20240103   clang
i386                  randconfig-003-20240103   clang
i386                  randconfig-004-20240103   clang
i386                  randconfig-005-20240103   clang
i386                  randconfig-006-20240103   clang
i386                  randconfig-011-20240103   gcc  
i386                  randconfig-011-20240104   clang
i386                  randconfig-012-20240103   gcc  
i386                  randconfig-012-20240104   clang
i386                  randconfig-013-20240103   gcc  
i386                  randconfig-013-20240104   clang
i386                  randconfig-014-20240103   gcc  
i386                  randconfig-014-20240104   clang
i386                  randconfig-015-20240103   gcc  
i386                  randconfig-015-20240104   clang
i386                  randconfig-016-20240103   gcc  
i386                  randconfig-016-20240104   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240104   gcc  
loongarch             randconfig-002-20240104   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                         amcore_defconfig   gcc  
m68k                                defconfig   gcc  
m68k                       m5208evb_defconfig   gcc  
m68k                        m5307c3_defconfig   gcc  
m68k                        mvme147_defconfig   gcc  
m68k                        stmark2_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   clang
mips                             allyesconfig   gcc  
mips                          ath79_defconfig   clang
mips                        bcm47xx_defconfig   gcc  
mips                           ci20_defconfig   gcc  
mips                         db1xxx_defconfig   gcc  
mips                  decstation_64_defconfig   gcc  
mips                 decstation_r4k_defconfig   gcc  
mips                    maltaup_xpa_defconfig   gcc  
mips                        qi_lb60_defconfig   clang
mips                         rt305x_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240104   gcc  
nios2                 randconfig-002-20240104   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240104   gcc  
parisc                randconfig-002-20240104   gcc  
parisc64                            defconfig   gcc  
powerpc                     akebono_defconfig   clang
powerpc                          allmodconfig   clang
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                   bluestone_defconfig   clang
powerpc                       ebony_defconfig   clang
powerpc                      ep88xc_defconfig   gcc  
powerpc                       holly_defconfig   gcc  
powerpc                     ksi8560_defconfig   gcc  
powerpc                   microwatt_defconfig   clang
powerpc                 mpc836x_rdk_defconfig   clang
powerpc                      pcm030_defconfig   gcc  
powerpc                      ppc40x_defconfig   gcc  
powerpc                       ppc64_defconfig   gcc  
powerpc               randconfig-001-20240104   gcc  
powerpc               randconfig-002-20240104   gcc  
powerpc               randconfig-003-20240104   gcc  
powerpc                    sam440ep_defconfig   gcc  
powerpc                     stx_gp3_defconfig   gcc  
powerpc64             randconfig-001-20240104   gcc  
powerpc64             randconfig-002-20240104   gcc  
powerpc64             randconfig-003-20240104   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   clang
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                 randconfig-001-20240104   gcc  
riscv                 randconfig-002-20240104   gcc  
riscv                          rv32_defconfig   clang
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20240104   clang
s390                  randconfig-002-20240104   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                         ap325rxa_defconfig   gcc  
sh                         apsh4a3a_defconfig   gcc  
sh                                  defconfig   gcc  
sh                          polaris_defconfig   gcc  
sh                    randconfig-001-20240104   gcc  
sh                    randconfig-002-20240104   gcc  
sh                     sh7710voipgw_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                            allyesconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240104   gcc  
sparc64               randconfig-002-20240104   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                    randconfig-001-20240104   gcc  
um                    randconfig-002-20240104   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240104   gcc  
x86_64       buildonly-randconfig-002-20240104   gcc  
x86_64       buildonly-randconfig-003-20240104   gcc  
x86_64       buildonly-randconfig-004-20240104   gcc  
x86_64       buildonly-randconfig-005-20240104   gcc  
x86_64       buildonly-randconfig-006-20240104   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64                randconfig-011-20240104   gcc  
x86_64                randconfig-012-20240104   gcc  
x86_64                randconfig-013-20240104   gcc  
x86_64                randconfig-014-20240104   gcc  
x86_64                randconfig-015-20240104   gcc  
x86_64                randconfig-016-20240104   gcc  
x86_64                randconfig-071-20240104   gcc  
x86_64                randconfig-072-20240104   gcc  
x86_64                randconfig-073-20240104   gcc  
x86_64                randconfig-074-20240104   gcc  
x86_64                randconfig-075-20240104   gcc  
x86_64                randconfig-076-20240104   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa                          iss_defconfig   gcc  
xtensa                randconfig-001-20240104   gcc  
xtensa                randconfig-002-20240104   gcc  
xtensa                         virt_defconfig   gcc  
xtensa                    xip_kc705_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
