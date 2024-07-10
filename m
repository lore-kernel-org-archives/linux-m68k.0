Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55F0753AC
	for <linux-m68k@lists.linux-m68k.org>; Wed, 10 Jul 2024 01:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720574043; cv=none; b=kJi472tvKUqC5yZA6f0xS+O/g8uVtbPx0KOF6Y4DSX9Pt3vFDbZRI16KLpfRS8KsWRZ8hxsGhI60ceXmbdRCZve39j9GxwXh5S4GBRCp52S6iWluNwvgaPtOryWDGkGYgztqZKiezUFyxHDzN4mdfYWyL2jdQjaA0ORJbGeoWuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720574043; c=relaxed/simple;
	bh=spl1Q8Yk0K5vQjR3cWGxR44sWsYUGCmdmFni2esfxkQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=MnS4T44rolVGy6xNRiKrB3eKauwEATtTbp2k6Hv0CaWd/PhsV6ZnQw2DIw6mc5zYomWVaajlLskAi2WcWpnC5NFnRPpR+ciuqcvBATqaKZgf2GSr56YD325q1GdgWpFOz8uEjezDIbo5onJkOO5xeHDJ9nbnSXOqli9pr2nssDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZGLbAEzq; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZGLbAEzq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720574041; x=1752110041;
  h=date:from:to:cc:subject:message-id;
  bh=spl1Q8Yk0K5vQjR3cWGxR44sWsYUGCmdmFni2esfxkQ=;
  b=ZGLbAEzqzAb6U5NSs2DJAczd3qsD02hPLzswakrFcn/O7j/x5vaXsqbO
   ooj6/e5VhLPfmrbFiB/zvNnfS2lziGSAdIuCfO7ZFKRAqFrnJrPWf+1E+
   X/MUmad/X1XJ0BB5ItqJqP71PXnYVFJyqE4oBIGlKYuuAQBcothIWs8mC
   3o5FEz+cAPC2qhTc2sokz95jLuvvEgxYQIO+UPNz41vxNrEM4oE3VBj0i
   IP5Zv0OF8rgwnRa6q7QvOlOsgSznGGq/IlJ2vJptLTq66Ige6cVm/OvJZ
   41T4hUs2jM4m9vhbVtt8HlmNaOcoNgJY0nPxzwRmmiza4e0hZq9W+Gkyl
   Q==;
X-CSE-ConnectionGUID: 5CseQnJdQ7SXuXapwlappA==
X-CSE-MsgGUID: QAym4Fg0T/isvIUa6VyCSA==
X-IronPort-AV: E=McAfee;i="6700,10204,11128"; a="21686959"
X-IronPort-AV: E=Sophos;i="6.09,196,1716274800"; 
   d="scan'208";a="21686959"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2024 18:14:00 -0700
X-CSE-ConnectionGUID: m7H5Ev+6RIiKdBRZ0PNihg==
X-CSE-MsgGUID: fZaZcyjrQQ6Mq1p+WaeUTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,196,1716274800"; 
   d="scan'208";a="48775696"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 09 Jul 2024 18:13:58 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sRLu8-000XJc-1T;
	Wed, 10 Jul 2024 01:13:56 +0000
Date: Wed, 10 Jul 2024 09:13:24 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:master] BUILD SUCCESS
 72c1104f688392e2d3ca184436ee7e1dbffda60f
Message-ID: <202407100922.ECVx20YC-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git master
branch HEAD: 72c1104f688392e2d3ca184436ee7e1dbffda60f  m68k: cmpxchg: Fix return value for default case in __arch_xchg()

elapsed time: 1060m

configs tested: 288
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            alldefconfig   gcc-13.2.0
alpha                             allnoconfig   gcc-13.2.0
alpha                            allyesconfig   gcc-13.2.0
alpha                               defconfig   gcc-13.2.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                                 defconfig   gcc-13.2.0
arc                   randconfig-001-20240709   gcc-13.2.0
arc                   randconfig-001-20240710   gcc-13.2.0
arc                   randconfig-002-20240709   gcc-13.2.0
arc                   randconfig-002-20240710   gcc-13.2.0
arm                              allmodconfig   gcc-13.2.0
arm                               allnoconfig   gcc-13.2.0
arm                              allyesconfig   gcc-13.2.0
arm                     am200epdkit_defconfig   gcc-13.2.0
arm                                 defconfig   gcc-13.2.0
arm                            hisi_defconfig   gcc-13.2.0
arm                          ixp4xx_defconfig   gcc-13.2.0
arm                           omap1_defconfig   gcc-13.2.0
arm                          pxa910_defconfig   gcc-13.2.0
arm                   randconfig-001-20240709   gcc-13.2.0
arm                   randconfig-001-20240710   gcc-13.2.0
arm                   randconfig-002-20240709   gcc-13.2.0
arm                   randconfig-002-20240710   gcc-13.2.0
arm                   randconfig-003-20240709   gcc-13.2.0
arm                   randconfig-003-20240710   gcc-13.2.0
arm                   randconfig-004-20240709   gcc-13.2.0
arm                   randconfig-004-20240710   gcc-13.2.0
arm                        realview_defconfig   gcc-13.2.0
arm                         socfpga_defconfig   gcc-13.2.0
arm                           spitz_defconfig   gcc-13.2.0
arm64                            allmodconfig   clang-19
arm64                            allmodconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-13.2.0
arm64                               defconfig   gcc-13.2.0
arm64                 randconfig-001-20240709   gcc-13.2.0
arm64                 randconfig-001-20240710   gcc-13.2.0
arm64                 randconfig-002-20240709   gcc-13.2.0
arm64                 randconfig-002-20240710   gcc-13.2.0
arm64                 randconfig-003-20240709   gcc-13.2.0
arm64                 randconfig-003-20240710   gcc-13.2.0
arm64                 randconfig-004-20240709   gcc-13.2.0
arm64                 randconfig-004-20240710   gcc-13.2.0
csky                              allnoconfig   gcc-13.2.0
csky                                defconfig   gcc-13.2.0
csky                  randconfig-001-20240709   gcc-13.2.0
csky                  randconfig-001-20240710   gcc-13.2.0
csky                  randconfig-002-20240709   gcc-13.2.0
csky                  randconfig-002-20240710   gcc-13.2.0
hexagon                          allmodconfig   clang-19
hexagon                          allyesconfig   clang-19
i386                             allmodconfig   clang-18
i386                             allmodconfig   gcc-13
i386                              allnoconfig   clang-18
i386                              allnoconfig   gcc-13
i386                             allyesconfig   clang-18
i386                             allyesconfig   gcc-13
i386         buildonly-randconfig-001-20240709   gcc-11
i386         buildonly-randconfig-001-20240710   clang-18
i386         buildonly-randconfig-002-20240709   gcc-11
i386         buildonly-randconfig-002-20240709   gcc-13
i386         buildonly-randconfig-002-20240710   clang-18
i386         buildonly-randconfig-003-20240709   clang-18
i386         buildonly-randconfig-003-20240709   gcc-11
i386         buildonly-randconfig-003-20240710   clang-18
i386         buildonly-randconfig-004-20240709   clang-18
i386         buildonly-randconfig-004-20240709   gcc-11
i386         buildonly-randconfig-004-20240710   clang-18
i386         buildonly-randconfig-005-20240709   clang-18
i386         buildonly-randconfig-005-20240709   gcc-11
i386         buildonly-randconfig-005-20240710   clang-18
i386         buildonly-randconfig-006-20240709   clang-18
i386         buildonly-randconfig-006-20240709   gcc-11
i386         buildonly-randconfig-006-20240710   clang-18
i386                                defconfig   clang-18
i386                  randconfig-001-20240709   gcc-11
i386                  randconfig-001-20240709   gcc-13
i386                  randconfig-001-20240710   clang-18
i386                  randconfig-002-20240709   clang-18
i386                  randconfig-002-20240709   gcc-11
i386                  randconfig-002-20240710   clang-18
i386                  randconfig-003-20240709   gcc-11
i386                  randconfig-003-20240710   clang-18
i386                  randconfig-004-20240709   gcc-11
i386                  randconfig-004-20240709   gcc-13
i386                  randconfig-004-20240710   clang-18
i386                  randconfig-005-20240709   gcc-11
i386                  randconfig-005-20240709   gcc-13
i386                  randconfig-005-20240710   clang-18
i386                  randconfig-006-20240709   gcc-11
i386                  randconfig-006-20240709   gcc-13
i386                  randconfig-006-20240710   clang-18
i386                  randconfig-011-20240709   clang-18
i386                  randconfig-011-20240709   gcc-11
i386                  randconfig-011-20240710   clang-18
i386                  randconfig-012-20240709   gcc-11
i386                  randconfig-012-20240709   gcc-13
i386                  randconfig-012-20240710   clang-18
i386                  randconfig-013-20240709   gcc-11
i386                  randconfig-013-20240709   gcc-12
i386                  randconfig-013-20240710   clang-18
i386                  randconfig-014-20240709   clang-18
i386                  randconfig-014-20240709   gcc-11
i386                  randconfig-014-20240710   clang-18
i386                  randconfig-015-20240709   clang-18
i386                  randconfig-015-20240709   gcc-11
i386                  randconfig-015-20240710   clang-18
i386                  randconfig-016-20240709   gcc-10
i386                  randconfig-016-20240709   gcc-11
i386                  randconfig-016-20240710   clang-18
loongarch                        allmodconfig   gcc-13.2.0
loongarch                         allnoconfig   gcc-13.2.0
loongarch                           defconfig   gcc-13.2.0
loongarch             randconfig-001-20240709   gcc-13.2.0
loongarch             randconfig-001-20240710   gcc-13.2.0
loongarch             randconfig-002-20240709   gcc-13.2.0
loongarch             randconfig-002-20240710   gcc-13.2.0
m68k                             allmodconfig   gcc-13.2.0
m68k                              allnoconfig   gcc-13.2.0
m68k                             allyesconfig   gcc-13.2.0
m68k                                defconfig   gcc-13.2.0
m68k                       m5249evb_defconfig   gcc-13.2.0
m68k                            mac_defconfig   gcc-13.2.0
m68k                        mvme16x_defconfig   gcc-13.2.0
microblaze                       allmodconfig   gcc-13.2.0
microblaze                        allnoconfig   gcc-13.2.0
microblaze                       allyesconfig   gcc-13.2.0
microblaze                          defconfig   gcc-13.2.0
mips                              allnoconfig   gcc-13.2.0
mips                         bigsur_defconfig   gcc-13.2.0
mips                       lemote2f_defconfig   gcc-13.2.0
mips                        maltaup_defconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-13.2.0
nios2                               defconfig   gcc-13.2.0
nios2                 randconfig-001-20240709   gcc-13.2.0
nios2                 randconfig-001-20240710   gcc-13.2.0
nios2                 randconfig-002-20240709   gcc-13.2.0
nios2                 randconfig-002-20240710   gcc-13.2.0
openrisc                          allnoconfig   gcc-13.2.0
openrisc                         allyesconfig   gcc-13.2.0
openrisc                            defconfig   gcc-13.2.0
openrisc                 simple_smp_defconfig   gcc-13.2.0
parisc                           allmodconfig   gcc-13.2.0
parisc                            allnoconfig   gcc-13.2.0
parisc                           allyesconfig   gcc-13.2.0
parisc                              defconfig   gcc-13.2.0
parisc                randconfig-001-20240709   gcc-13.2.0
parisc                randconfig-001-20240710   gcc-13.2.0
parisc                randconfig-002-20240709   gcc-13.2.0
parisc                randconfig-002-20240710   gcc-13.2.0
parisc64                         alldefconfig   gcc-13.2.0
parisc64                            defconfig   gcc-13.2.0
powerpc                          allmodconfig   gcc-13.2.0
powerpc                           allnoconfig   gcc-13.2.0
powerpc                          allyesconfig   clang-19
powerpc                          allyesconfig   gcc-13.2.0
powerpc                      katmai_defconfig   gcc-13.2.0
powerpc                   motionpro_defconfig   gcc-13.2.0
powerpc               randconfig-001-20240709   gcc-13.2.0
powerpc               randconfig-001-20240710   gcc-13.2.0
powerpc               randconfig-002-20240709   gcc-13.2.0
powerpc               randconfig-002-20240710   gcc-13.2.0
powerpc               randconfig-003-20240709   gcc-13.2.0
powerpc               randconfig-003-20240710   gcc-13.2.0
powerpc                     tqm8548_defconfig   gcc-13.2.0
powerpc64             randconfig-001-20240709   gcc-13.2.0
powerpc64             randconfig-001-20240710   gcc-13.2.0
powerpc64             randconfig-002-20240709   gcc-13.2.0
powerpc64             randconfig-002-20240710   gcc-13.2.0
powerpc64             randconfig-003-20240709   gcc-13.2.0
powerpc64             randconfig-003-20240710   gcc-13.2.0
riscv                            allmodconfig   clang-19
riscv                            allmodconfig   gcc-13.2.0
riscv                             allnoconfig   gcc-13.2.0
riscv                            allyesconfig   clang-19
riscv                            allyesconfig   gcc-13.2.0
riscv                               defconfig   gcc-13.2.0
riscv                    nommu_virt_defconfig   gcc-13.2.0
riscv                 randconfig-001-20240709   gcc-13.2.0
riscv                 randconfig-001-20240710   gcc-13.2.0
riscv                 randconfig-002-20240709   gcc-13.2.0
riscv                 randconfig-002-20240710   gcc-13.2.0
s390                             allmodconfig   clang-19
s390                              allnoconfig   clang-19
s390                              allnoconfig   gcc-13.2.0
s390                             allyesconfig   clang-19
s390                             allyesconfig   gcc-13.2.0
s390                                defconfig   gcc-13.2.0
s390                  randconfig-001-20240709   gcc-13.2.0
s390                  randconfig-001-20240710   gcc-13.2.0
s390                  randconfig-002-20240709   gcc-13.2.0
s390                  randconfig-002-20240710   gcc-13.2.0
sh                               allmodconfig   gcc-13.2.0
sh                                allnoconfig   gcc-13.2.0
sh                               allyesconfig   gcc-13.2.0
sh                                  defconfig   gcc-13.2.0
sh                        dreamcast_defconfig   gcc-13.2.0
sh                        edosk7705_defconfig   gcc-13.2.0
sh                    randconfig-001-20240709   gcc-13.2.0
sh                    randconfig-001-20240710   gcc-13.2.0
sh                    randconfig-002-20240709   gcc-13.2.0
sh                    randconfig-002-20240710   gcc-13.2.0
sh                          rsk7203_defconfig   gcc-13.2.0
sh                          rsk7264_defconfig   gcc-13.2.0
sh                           se7751_defconfig   gcc-13.2.0
sh                           se7780_defconfig   gcc-13.2.0
sh                        sh7757lcr_defconfig   gcc-13.2.0
sh                            titan_defconfig   gcc-13.2.0
sparc                            allmodconfig   gcc-13.2.0
sparc                       sparc64_defconfig   gcc-13.2.0
sparc64                             defconfig   gcc-13.2.0
sparc64               randconfig-001-20240709   gcc-13.2.0
sparc64               randconfig-001-20240710   gcc-13.2.0
sparc64               randconfig-002-20240709   gcc-13.2.0
sparc64               randconfig-002-20240710   gcc-13.2.0
um                               allmodconfig   clang-19
um                               allmodconfig   gcc-13.2.0
um                                allnoconfig   clang-17
um                                allnoconfig   gcc-13.2.0
um                               allyesconfig   gcc-13
um                               allyesconfig   gcc-13.2.0
um                                  defconfig   gcc-13.2.0
um                             i386_defconfig   gcc-13.2.0
um                    randconfig-001-20240709   gcc-13.2.0
um                    randconfig-001-20240710   gcc-13.2.0
um                    randconfig-002-20240709   gcc-13.2.0
um                    randconfig-002-20240710   gcc-13.2.0
um                           x86_64_defconfig   gcc-13.2.0
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240709   gcc-11
x86_64       buildonly-randconfig-001-20240710   clang-18
x86_64       buildonly-randconfig-002-20240709   gcc-11
x86_64       buildonly-randconfig-002-20240710   clang-18
x86_64       buildonly-randconfig-003-20240709   gcc-11
x86_64       buildonly-randconfig-003-20240710   clang-18
x86_64       buildonly-randconfig-004-20240709   gcc-11
x86_64       buildonly-randconfig-004-20240710   clang-18
x86_64       buildonly-randconfig-005-20240709   gcc-11
x86_64       buildonly-randconfig-005-20240710   clang-18
x86_64       buildonly-randconfig-006-20240709   gcc-11
x86_64       buildonly-randconfig-006-20240710   clang-18
x86_64                              defconfig   clang-18
x86_64                              defconfig   gcc-13
x86_64                randconfig-001-20240709   gcc-11
x86_64                randconfig-001-20240710   clang-18
x86_64                randconfig-002-20240709   gcc-11
x86_64                randconfig-002-20240710   clang-18
x86_64                randconfig-003-20240709   gcc-11
x86_64                randconfig-003-20240710   clang-18
x86_64                randconfig-004-20240709   gcc-11
x86_64                randconfig-004-20240710   clang-18
x86_64                randconfig-005-20240709   gcc-11
x86_64                randconfig-005-20240710   clang-18
x86_64                randconfig-006-20240709   gcc-11
x86_64                randconfig-006-20240710   clang-18
x86_64                randconfig-011-20240709   gcc-11
x86_64                randconfig-011-20240710   clang-18
x86_64                randconfig-012-20240709   gcc-11
x86_64                randconfig-012-20240710   clang-18
x86_64                randconfig-013-20240709   gcc-11
x86_64                randconfig-013-20240710   clang-18
x86_64                randconfig-014-20240709   gcc-11
x86_64                randconfig-014-20240710   clang-18
x86_64                randconfig-015-20240709   gcc-11
x86_64                randconfig-015-20240710   clang-18
x86_64                randconfig-016-20240709   gcc-11
x86_64                randconfig-016-20240710   clang-18
x86_64                randconfig-071-20240709   gcc-11
x86_64                randconfig-071-20240710   clang-18
x86_64                randconfig-072-20240709   gcc-11
x86_64                randconfig-072-20240710   clang-18
x86_64                randconfig-073-20240709   gcc-11
x86_64                randconfig-073-20240710   clang-18
x86_64                randconfig-074-20240709   gcc-11
x86_64                randconfig-074-20240710   clang-18
x86_64                randconfig-075-20240709   gcc-11
x86_64                randconfig-075-20240710   clang-18
x86_64                randconfig-076-20240709   gcc-11
x86_64                randconfig-076-20240710   clang-18
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-13.2.0
xtensa                  nommu_kc705_defconfig   gcc-13.2.0
xtensa                randconfig-001-20240709   gcc-13.2.0
xtensa                randconfig-001-20240710   gcc-13.2.0
xtensa                randconfig-002-20240709   gcc-13.2.0
xtensa                randconfig-002-20240710   gcc-13.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
