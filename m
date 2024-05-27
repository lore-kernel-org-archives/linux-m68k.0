Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7E9B1E880
	for <linux-m68k@lists.linux-m68k.org>; Mon, 27 May 2024 22:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716850640; cv=none; b=pN3cXGfhMR3p5OdN+w4qcK/hs3fIGuhvmrkUmlUhSJR6pGUaMVxaaGgmoREAG3Q9j9CZnhLr4FgayeyY7V7CxKJYBql+uGIcBXpZrwCMUBEdUAlgg/NX3lTYGqwrlYn2RFeYZl2eIuuAvyON5LWhymEaDGHYSMbdpm0p4pkdW3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716850640; c=relaxed/simple;
	bh=tbrexBYQmWHJOkURutC+NehPiMvREtcpr851o0XV/LY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sUc8TNKDk5qR6LNSmim4rr4hrQOPWwTeFRIQO+ErTM6ZPmJAHPBMME0Y01C1ZaK+C6tkFxFN7xv5vSWhsNFvuOX425oac98sBqcZGT7iPQWNLb9AufxMb/KaUnVCGfLmOalQ3mWp5XXPSLAvVQot41jMMxLm+WLkFhyn3U2G3Ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TAIF2U5k; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TAIF2U5k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716850638; x=1748386638;
  h=date:from:to:cc:subject:message-id;
  bh=tbrexBYQmWHJOkURutC+NehPiMvREtcpr851o0XV/LY=;
  b=TAIF2U5kVaygeZeJCV9/yyE0mmFhgoIdpf6+9zmvILCAQXOtl8QVQbKc
   y7ACUWjBxfjSysU563g4mab9vc5wSjIS/jtSkBefiUy8N5T/E3hco3Di4
   RxbCPEAgy2hqgONlEBSwhAZP8mR0692FIrqyEIzSrnQMVTtS/Peu+lR3E
   u1hihqqDbJAYlbyEE4KuQV2cOOuCrGaWl7XoWY2zKBTXde31VmhmL16Em
   s/OETvl3ZYKrgItVAq6LKlQoC6+HFjw5TTjRrvSR+RFzzv9l1+ve0F5yJ
   KiE8MFZ5GtxcRYVOBY9lelj+Yj5gjlVuyjygn1eXz5eW400QBff2gVokq
   Q==;
X-CSE-ConnectionGUID: gfTXUa7JS4y//M10FO+q4g==
X-CSE-MsgGUID: DXdlc/zAQneIOs7zzk9M4w==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="13023034"
X-IronPort-AV: E=Sophos;i="6.08,193,1712646000"; 
   d="scan'208";a="13023034"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2024 15:57:16 -0700
X-CSE-ConnectionGUID: i8jEkYv7Q3SuvpjKcsg7Ww==
X-CSE-MsgGUID: VzP07s4FSN+wu3RliV/2uQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,193,1712646000"; 
   d="scan'208";a="58057795"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 27 May 2024 15:57:15 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sBjHC-000BA7-1m;
	Mon, 27 May 2024 22:57:11 +0000
Date: Tue, 28 May 2024 06:56:33 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:master] BUILD SUCCESS
 1b7fff0c30af90baaf3258d8a3d839ef1cb731f7
Message-ID: <202405280630.dIR67Q5I-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git master
branch HEAD: 1b7fff0c30af90baaf3258d8a3d839ef1cb731f7  Merge tag 'v6.10-rc1'

elapsed time: 742m

configs tested: 211
configs skipped: 4

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
arc                   randconfig-001-20240527   gcc  
arc                   randconfig-001-20240528   gcc  
arc                   randconfig-002-20240527   gcc  
arc                   randconfig-002-20240528   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                         axm55xx_defconfig   clang
arm                                 defconfig   clang
arm                   randconfig-001-20240527   clang
arm                   randconfig-001-20240528   gcc  
arm                   randconfig-002-20240527   gcc  
arm                   randconfig-002-20240528   gcc  
arm                   randconfig-003-20240527   gcc  
arm                   randconfig-003-20240528   clang
arm                   randconfig-004-20240527   gcc  
arm                   randconfig-004-20240528   clang
arm                           spitz_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240527   gcc  
arm64                 randconfig-001-20240528   clang
arm64                 randconfig-002-20240527   gcc  
arm64                 randconfig-002-20240528   clang
arm64                 randconfig-003-20240527   clang
arm64                 randconfig-003-20240528   gcc  
arm64                 randconfig-004-20240527   gcc  
arm64                 randconfig-004-20240528   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240527   gcc  
csky                  randconfig-001-20240528   gcc  
csky                  randconfig-002-20240528   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240528   clang
hexagon               randconfig-002-20240528   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240527   gcc  
i386         buildonly-randconfig-001-20240528   gcc  
i386         buildonly-randconfig-002-20240527   gcc  
i386         buildonly-randconfig-003-20240527   gcc  
i386         buildonly-randconfig-004-20240527   clang
i386         buildonly-randconfig-005-20240527   gcc  
i386         buildonly-randconfig-006-20240527   gcc  
i386                                defconfig   clang
i386                  randconfig-001-20240527   gcc  
i386                  randconfig-002-20240527   clang
i386                  randconfig-003-20240527   gcc  
i386                  randconfig-003-20240528   gcc  
i386                  randconfig-004-20240527   gcc  
i386                  randconfig-004-20240528   gcc  
i386                  randconfig-005-20240527   gcc  
i386                  randconfig-005-20240528   gcc  
i386                  randconfig-006-20240527   gcc  
i386                  randconfig-006-20240528   gcc  
i386                  randconfig-011-20240527   gcc  
i386                  randconfig-012-20240527   clang
i386                  randconfig-012-20240528   gcc  
i386                  randconfig-013-20240527   gcc  
i386                  randconfig-013-20240528   gcc  
i386                  randconfig-014-20240527   clang
i386                  randconfig-015-20240527   gcc  
i386                  randconfig-015-20240528   gcc  
i386                  randconfig-016-20240527   clang
i386                  randconfig-016-20240528   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240528   gcc  
loongarch             randconfig-002-20240528   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                          hp300_defconfig   gcc  
m68k                       m5275evb_defconfig   gcc  
m68k                        m5407c3_defconfig   gcc  
m68k                       m5475evb_defconfig   gcc  
m68k                           sun3_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                     cu1000-neo_defconfig   gcc  
mips                     decstation_defconfig   gcc  
mips                           ip22_defconfig   gcc  
mips                     loongson2k_defconfig   gcc  
nios2                         3c120_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240528   gcc  
nios2                 randconfig-002-20240528   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
openrisc                 simple_smp_defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240528   gcc  
parisc                randconfig-002-20240528   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                    amigaone_defconfig   gcc  
powerpc                      chrp32_defconfig   clang
powerpc                   currituck_defconfig   clang
powerpc                        icon_defconfig   gcc  
powerpc                  iss476-smp_defconfig   gcc  
powerpc                      ppc64e_defconfig   gcc  
powerpc               randconfig-001-20240528   gcc  
powerpc               randconfig-002-20240528   clang
powerpc               randconfig-003-20240528   clang
powerpc                     tqm8548_defconfig   clang
powerpc64             randconfig-001-20240528   clang
powerpc64             randconfig-002-20240528   gcc  
powerpc64             randconfig-003-20240528   clang
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240528   clang
riscv                 randconfig-002-20240528   clang
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240528   gcc  
s390                  randconfig-002-20240528   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                ecovec24-romimage_defconfig   gcc  
sh                         ecovec24_defconfig   gcc  
sh                        edosk7760_defconfig   gcc  
sh                             espt_defconfig   gcc  
sh                    randconfig-001-20240528   gcc  
sh                    randconfig-002-20240528   gcc  
sh                   rts7751r2dplus_defconfig   gcc  
sh                           se7750_defconfig   gcc  
sh                   sh7724_generic_defconfig   gcc  
sh                   sh7770_generic_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240528   gcc  
sparc64               randconfig-002-20240528   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240528   gcc  
um                    randconfig-002-20240528   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240528   clang
x86_64       buildonly-randconfig-002-20240528   clang
x86_64       buildonly-randconfig-003-20240528   clang
x86_64       buildonly-randconfig-004-20240528   gcc  
x86_64       buildonly-randconfig-005-20240528   clang
x86_64       buildonly-randconfig-006-20240528   clang
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240528   clang
x86_64                randconfig-002-20240528   clang
x86_64                randconfig-003-20240528   clang
x86_64                randconfig-004-20240528   gcc  
x86_64                randconfig-005-20240528   clang
x86_64                randconfig-006-20240528   gcc  
x86_64                randconfig-011-20240528   gcc  
x86_64                randconfig-012-20240528   gcc  
x86_64                randconfig-013-20240528   clang
x86_64                randconfig-014-20240528   clang
x86_64                randconfig-015-20240528   clang
x86_64                randconfig-016-20240528   gcc  
x86_64                randconfig-071-20240528   clang
x86_64                randconfig-072-20240528   gcc  
x86_64                randconfig-073-20240528   gcc  
x86_64                randconfig-074-20240528   gcc  
x86_64                randconfig-075-20240528   clang
x86_64                randconfig-076-20240528   clang
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                randconfig-001-20240528   gcc  
xtensa                randconfig-002-20240528   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
