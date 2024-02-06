Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 374451CD07
	for <linux-m68k@lists.linux-m68k.org>; Tue,  6 Feb 2024 10:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707215523; cv=none; b=AyKOzGXOB30+mEuquvc2T0BcSqtRFWGS+imjMnntd5HRIahJaI8uShFfmbNH+mpsG3CGQsTzqg3G6SjJFL5hDOPHhZ40jN56Rm4rV1G7A3kFLQAjJ0pu+VR9Z5YzoJU7szvGUM1/Yc4ReJ7rZ6sZjN4vYfRtq05q7NQLWw2g7K0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707215523; c=relaxed/simple;
	bh=nlSJIXePdkNQSTjnIOvz+ymevMnY/tQauJwYr1L6Wcw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=oSVU+gNA5RauXl57PKGxDit/7J2xgeMsiDOFJ+XuEfhAecAdGEHMYUHV7HMcGaaFjWi7Y0JMFis/1DcuQOt8Tbr6wDl/xrZfPTXZUilslrfTGIgLTS8vzXL0p+vaxuRX0F41gp+09AVPLgUyY6fi78Q4NDniOlJN3K2GmO7nXrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H7o6H2fQ; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H7o6H2fQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707215522; x=1738751522;
  h=date:from:to:cc:subject:message-id;
  bh=nlSJIXePdkNQSTjnIOvz+ymevMnY/tQauJwYr1L6Wcw=;
  b=H7o6H2fQjwVsRHJzvkUjCxndCFU2BS3L2Xqfhw43etaWk+903v6fjssb
   HEY9v5Mca0aYMJCvGocEJlN/lSEnSMIoPWymnLIufBU3wzfSnTr9cVqyM
   /2QLFes87XgIoIwjRc+6ucqS6L3i4GAug+Qp/wHYdkQRETF//T5XPWRfM
   MhknMt6HRHKIw/+CwULx3fYt4svl+9aZvU8xqgIxFirciS3HVXBw3Gu+C
   X7Z7Bqhkd/nN907khHy9NxqEBiCQ1vLH3V2Pg62FfDg3a94R7Tdxv4Cwv
   FMoHBk/DtpqObaQjTLDbOlQi9SMWVx8vwVao5fdkCDfJzCPdhXyLtB7OP
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="627675"
X-IronPort-AV: E=Sophos;i="6.05,247,1701158400"; 
   d="scan'208";a="627675"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2024 02:32:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,247,1701158400"; 
   d="scan'208";a="38406709"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 06 Feb 2024 02:31:59 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rXIk8-0001H2-1k;
	Tue, 06 Feb 2024 10:31:56 +0000
Date: Tue, 06 Feb 2024 18:31:43 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:master] BUILD SUCCESS
 0bd8a354c65a73a681fc2cb00f7745ed3f21c334
Message-ID: <202402061840.6V7QYxii-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git master
branch HEAD: 0bd8a354c65a73a681fc2cb00f7745ed3f21c334  Merge tag 'v6.8-rc3'

elapsed time: 1477m

configs tested: 258
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
arc                          axs103_defconfig   gcc  
arc                                 defconfig   gcc  
arc                     haps_hs_smp_defconfig   gcc  
arc                   randconfig-001-20240205   gcc  
arc                   randconfig-001-20240206   gcc  
arc                   randconfig-002-20240205   gcc  
arc                   randconfig-002-20240206   gcc  
arc                           tb10x_defconfig   gcc  
arc                        vdk_hs38_defconfig   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                          collie_defconfig   gcc  
arm                                 defconfig   clang
arm                            mmp2_defconfig   gcc  
arm                        mvebu_v5_defconfig   gcc  
arm                        neponset_defconfig   gcc  
arm                   randconfig-002-20240205   gcc  
arm                   randconfig-002-20240206   gcc  
arm                   randconfig-003-20240206   gcc  
arm                           tegra_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240205   gcc  
arm64                 randconfig-001-20240206   gcc  
arm64                 randconfig-002-20240205   gcc  
arm64                 randconfig-003-20240205   gcc  
arm64                 randconfig-003-20240206   gcc  
arm64                 randconfig-004-20240205   gcc  
arm64                 randconfig-004-20240206   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240205   gcc  
csky                  randconfig-001-20240206   gcc  
csky                  randconfig-002-20240205   gcc  
csky                  randconfig-002-20240206   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240205   clang
i386         buildonly-randconfig-002-20240205   clang
i386         buildonly-randconfig-003-20240205   clang
i386         buildonly-randconfig-003-20240206   gcc  
i386         buildonly-randconfig-004-20240205   clang
i386         buildonly-randconfig-005-20240205   clang
i386         buildonly-randconfig-005-20240206   gcc  
i386         buildonly-randconfig-006-20240205   clang
i386         buildonly-randconfig-006-20240206   gcc  
i386                                defconfig   clang
i386                  randconfig-001-20240205   clang
i386                  randconfig-002-20240205   clang
i386                  randconfig-003-20240205   clang
i386                  randconfig-004-20240205   gcc  
i386                  randconfig-005-20240205   clang
i386                  randconfig-006-20240205   gcc  
i386                  randconfig-011-20240205   gcc  
i386                  randconfig-012-20240205   clang
i386                  randconfig-012-20240206   gcc  
i386                  randconfig-013-20240205   gcc  
i386                  randconfig-014-20240205   gcc  
i386                  randconfig-014-20240206   gcc  
i386                  randconfig-015-20240205   clang
i386                  randconfig-015-20240206   gcc  
i386                  randconfig-016-20240205   gcc  
i386                  randconfig-016-20240206   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240205   gcc  
loongarch             randconfig-001-20240206   gcc  
loongarch             randconfig-002-20240205   gcc  
loongarch             randconfig-002-20240206   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                          atari_defconfig   gcc  
m68k                                defconfig   gcc  
m68k                       m5249evb_defconfig   gcc  
m68k                            mac_defconfig   gcc  
m68k                        mvme147_defconfig   gcc  
m68k                        mvme16x_defconfig   gcc  
m68k                            q40_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                       bmips_be_defconfig   gcc  
mips                          malta_defconfig   gcc  
mips                malta_qemu_32r6_defconfig   gcc  
mips                      maltasmvp_defconfig   gcc  
mips                    maltaup_xpa_defconfig   gcc  
mips                           rs90_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240205   gcc  
nios2                 randconfig-001-20240206   gcc  
nios2                 randconfig-002-20240205   gcc  
nios2                 randconfig-002-20240206   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                generic-32bit_defconfig   gcc  
parisc                randconfig-001-20240205   gcc  
parisc                randconfig-001-20240206   gcc  
parisc                randconfig-002-20240205   gcc  
parisc                randconfig-002-20240206   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                    ge_imp3a_defconfig   gcc  
powerpc                  iss476-smp_defconfig   gcc  
powerpc                   microwatt_defconfig   gcc  
powerpc                     powernv_defconfig   gcc  
powerpc                     ppa8548_defconfig   gcc  
powerpc                      ppc64e_defconfig   gcc  
powerpc               randconfig-002-20240206   gcc  
powerpc               randconfig-003-20240205   gcc  
powerpc                    sam440ep_defconfig   gcc  
powerpc                  storcenter_defconfig   gcc  
powerpc                      walnut_defconfig   gcc  
powerpc                         wii_defconfig   gcc  
powerpc64             randconfig-001-20240206   gcc  
powerpc64             randconfig-003-20240206   gcc  
riscv                            alldefconfig   gcc  
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240206   gcc  
riscv                 randconfig-002-20240205   gcc  
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-002-20240205   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                         ecovec24_defconfig   gcc  
sh                 kfr2r09-romimage_defconfig   gcc  
sh                          kfr2r09_defconfig   gcc  
sh                    randconfig-001-20240205   gcc  
sh                    randconfig-001-20240206   gcc  
sh                    randconfig-002-20240205   gcc  
sh                    randconfig-002-20240206   gcc  
sh                          rsk7201_defconfig   gcc  
sh                          rsk7264_defconfig   gcc  
sh                          sdk7780_defconfig   gcc  
sh                           se7722_defconfig   gcc  
sh                        sh7757lcr_defconfig   gcc  
sh                   sh7770_generic_defconfig   gcc  
sh                          urquell_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240205   gcc  
sparc64               randconfig-001-20240206   gcc  
sparc64               randconfig-002-20240205   gcc  
sparc64               randconfig-002-20240206   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                    randconfig-002-20240205   gcc  
um                    randconfig-002-20240206   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240205   clang
x86_64       buildonly-randconfig-001-20240206   gcc  
x86_64       buildonly-randconfig-002-20240205   clang
x86_64       buildonly-randconfig-002-20240206   clang
x86_64       buildonly-randconfig-003-20240205   gcc  
x86_64       buildonly-randconfig-003-20240206   gcc  
x86_64       buildonly-randconfig-004-20240205   gcc  
x86_64       buildonly-randconfig-004-20240206   gcc  
x86_64       buildonly-randconfig-005-20240205   gcc  
x86_64       buildonly-randconfig-005-20240206   gcc  
x86_64       buildonly-randconfig-006-20240205   gcc  
x86_64       buildonly-randconfig-006-20240206   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240205   gcc  
x86_64                randconfig-001-20240206   clang
x86_64                randconfig-002-20240205   gcc  
x86_64                randconfig-002-20240206   clang
x86_64                randconfig-003-20240205   clang
x86_64                randconfig-003-20240206   gcc  
x86_64                randconfig-004-20240205   gcc  
x86_64                randconfig-004-20240206   gcc  
x86_64                randconfig-005-20240205   gcc  
x86_64                randconfig-005-20240206   gcc  
x86_64                randconfig-006-20240205   gcc  
x86_64                randconfig-006-20240206   clang
x86_64                randconfig-011-20240205   gcc  
x86_64                randconfig-011-20240206   gcc  
x86_64                randconfig-012-20240205   gcc  
x86_64                randconfig-012-20240206   clang
x86_64                randconfig-013-20240205   clang
x86_64                randconfig-013-20240206   gcc  
x86_64                randconfig-014-20240205   clang
x86_64                randconfig-014-20240206   clang
x86_64                randconfig-015-20240205   gcc  
x86_64                randconfig-015-20240206   gcc  
x86_64                randconfig-016-20240205   clang
x86_64                randconfig-016-20240206   clang
x86_64                randconfig-071-20240205   clang
x86_64                randconfig-071-20240206   gcc  
x86_64                randconfig-072-20240205   gcc  
x86_64                randconfig-072-20240206   gcc  
x86_64                randconfig-073-20240205   clang
x86_64                randconfig-073-20240206   gcc  
x86_64                randconfig-074-20240205   clang
x86_64                randconfig-074-20240206   gcc  
x86_64                randconfig-075-20240205   gcc  
x86_64                randconfig-075-20240206   clang
x86_64                randconfig-076-20240205   clang
x86_64                randconfig-076-20240206   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                           alldefconfig   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa                  audio_kc705_defconfig   gcc  
xtensa                randconfig-001-20240205   gcc  
xtensa                randconfig-001-20240206   gcc  
xtensa                randconfig-002-20240205   gcc  
xtensa                randconfig-002-20240206   gcc  
xtensa                         virt_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
