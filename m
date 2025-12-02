Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 727F93BB48
	for <linux-m68k@lists.linux-m68k.org>; Tue,  2 Dec 2025 04:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764650040; cv=none; b=G6YaaGVyyf6y1582x0G3Qt0dc7Vg5z0tM8/3kKfFEghVX5XnpCbEhOmsR2Y9JHDH5R5QY4pjl7rSSjyAnvDaNHq/U/m/qlpqBRTDucbEqEVfYGmFB4z3OZ2Ca8LgjlJkJQmdG+jknSoZTpkmaCWI4EbUAqKwRu5wzN3Cl3X/el4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764650040; c=relaxed/simple;
	bh=87/06n1LuW0nrpR6rnHET7gbRM63jLIeDA6I1Kc5tPY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=g+nr7L/gV9pcn+adF/saZs35X8Bh/U5ZBGPM8i6xEN3lJEggmCmKaDM9y9H+7f4+wQH2RFnfIGvIUUKAv05xKWQW1XC0Yykevr+I5IeKgrxoDFP/apX4jDEnF+xjap477fw5DDOBchEvBqixiMEvJ2MxowsxAegLCzFFI2ean40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jbYLy/fJ; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jbYLy/fJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764650037; x=1796186037;
  h=date:from:to:cc:subject:message-id;
  bh=87/06n1LuW0nrpR6rnHET7gbRM63jLIeDA6I1Kc5tPY=;
  b=jbYLy/fJW+0sGOm4q9N673cN0s8X//L9x2Rt/ZjWS4JTT1ne7y6NEXcb
   lb8nHwyQJ/f8XjfCRoTxvA/A0h8MI9FJCHsHukJ9T3SfCjs/wL19bGoae
   /Op33NbZtTFmlNYlm+d9L1QIXNJT8G1NXn8Kjd5yZUsJr8OsBTS/aiJsd
   RWjVdBExxzsKyntpygEmXRmqF20SnTiGeCzCdXZ+E4z6bGgetIFAuklTR
   YjMXOCn0w7yfVz77KOp3RZtIdJPKmcBZUarMuFQsez+3cgzlidH/RMk++
   gMuDFs1N6JrQcAyNVZm6/3r3eKdOo2Ir+wReG5UYsVMonhMPDmIoDoyec
   g==;
X-CSE-ConnectionGUID: GjXnUoKeTvy3jRmKk2l6Lg==
X-CSE-MsgGUID: +F9dJgzbTWi89qCjqNYDoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="69197422"
X-IronPort-AV: E=Sophos;i="6.20,242,1758610800"; 
   d="scan'208";a="69197422"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2025 20:33:56 -0800
X-CSE-ConnectionGUID: r+++CY/qS9SVdxWpPI+GhQ==
X-CSE-MsgGUID: gZUUVil9Q4emjSqEuu1K8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,242,1758610800"; 
   d="scan'208";a="194698734"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 01 Dec 2025 20:33:55 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQI5I-000000009PB-3CnP;
	Tue, 02 Dec 2025 04:33:52 +0000
Date: Tue, 02 Dec 2025 12:33:38 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:m68k-v6.18] BUILD SUCCESS
 3cba6f4e8b435c54e0271d0ec019fae762b8b6bf
Message-ID: <202512021232.bkiq6HNt-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git m68k-v6.18
branch HEAD: 3cba6f4e8b435c54e0271d0ec019fae762b8b6bf  m68k: defconfig: Enable Atari EtherNAT and NetUSBee USB support

elapsed time: 1088m

configs tested: 246
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    clang-19
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                              allmodconfig    clang-19
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    clang-19
arc                              allyesconfig    gcc-15.1.0
arc                                 defconfig    gcc-15.1.0
arc                   randconfig-001-20251202    clang-22
arc                   randconfig-001-20251202    gcc-8.5.0
arc                   randconfig-002-20251202    clang-22
arc                   randconfig-002-20251202    gcc-12.5.0
arm                               allnoconfig    clang-22
arm                               allnoconfig    gcc-15.1.0
arm                              allyesconfig    clang-16
arm                              allyesconfig    gcc-15.1.0
arm                                 defconfig    clang-22
arm                   randconfig-001-20251202    clang-17
arm                   randconfig-001-20251202    clang-22
arm                   randconfig-002-20251202    clang-22
arm                   randconfig-003-20251202    clang-22
arm                   randconfig-004-20251202    clang-22
arm                   randconfig-004-20251202    gcc-14.3.0
arm64                            allmodconfig    clang-16
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20251202    clang-22
arm64                 randconfig-002-20251202    clang-22
arm64                 randconfig-003-20251202    clang-16
arm64                 randconfig-003-20251202    clang-22
arm64                 randconfig-004-20251202    clang-22
csky                             allmodconfig    gcc-15.1.0
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20251202    clang-22
csky                  randconfig-001-20251202    gcc-13.4.0
csky                  randconfig-002-20251202    clang-22
csky                  randconfig-002-20251202    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-22
hexagon                           allnoconfig    gcc-15.1.0
hexagon                             defconfig    clang-22
hexagon               randconfig-001-20251202    clang-22
hexagon               randconfig-001-20251202    gcc-15.1.0
hexagon               randconfig-002-20251202    clang-22
hexagon               randconfig-002-20251202    gcc-15.1.0
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.1.0
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20251202    clang-20
i386        buildonly-randconfig-002-20251202    clang-20
i386        buildonly-randconfig-002-20251202    gcc-14
i386        buildonly-randconfig-003-20251202    clang-20
i386        buildonly-randconfig-004-20251202    clang-20
i386        buildonly-randconfig-005-20251202    clang-20
i386        buildonly-randconfig-006-20251202    clang-20
i386        buildonly-randconfig-006-20251202    gcc-14
i386                                defconfig    clang-20
i386                  randconfig-001-20251202    clang-20
i386                  randconfig-001-20251202    gcc-14
i386                  randconfig-002-20251202    gcc-14
i386                  randconfig-003-20251202    gcc-14
i386                  randconfig-004-20251202    clang-20
i386                  randconfig-004-20251202    gcc-14
i386                  randconfig-005-20251202    gcc-14
i386                  randconfig-006-20251202    clang-20
i386                  randconfig-006-20251202    gcc-14
i386                  randconfig-007-20251202    clang-20
i386                  randconfig-007-20251202    gcc-14
i386                  randconfig-011-20251202    clang-20
i386                  randconfig-012-20251202    clang-20
i386                  randconfig-013-20251202    clang-20
i386                  randconfig-013-20251202    gcc-14
i386                  randconfig-014-20251202    clang-20
i386                  randconfig-014-20251202    gcc-14
i386                  randconfig-015-20251202    clang-20
i386                  randconfig-015-20251202    gcc-14
i386                  randconfig-016-20251202    clang-20
i386                  randconfig-017-20251202    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch                         allnoconfig    gcc-15.1.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20251202    gcc-15.1.0
loongarch             randconfig-002-20251202    clang-22
loongarch             randconfig-002-20251202    gcc-15.1.0
m68k                             allmodconfig    clang-19
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    clang-19
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    clang-19
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                             allyesconfig    gcc-15.1.0
nios2                            allmodconfig    clang-22
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
nios2                 randconfig-001-20251202    gcc-15.1.0
nios2                 randconfig-001-20251202    gcc-8.5.0
nios2                 randconfig-002-20251202    gcc-15.1.0
nios2                 randconfig-002-20251202    gcc-8.5.0
openrisc                         allmodconfig    clang-22
openrisc                         allmodconfig    gcc-15.1.0
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251201    gcc-13.4.0
parisc                randconfig-001-20251202    clang-22
parisc                randconfig-002-20251201    gcc-15.1.0
parisc                randconfig-002-20251202    clang-22
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.1.0
powerpc               randconfig-001-20251201    gcc-13.4.0
powerpc               randconfig-001-20251202    clang-22
powerpc               randconfig-002-20251201    gcc-10.5.0
powerpc               randconfig-002-20251202    clang-22
powerpc64             randconfig-001-20251201    gcc-14.3.0
powerpc64             randconfig-001-20251202    clang-22
powerpc64             randconfig-002-20251201    gcc-13.4.0
powerpc64             randconfig-002-20251202    clang-22
riscv                            allmodconfig    clang-16
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.1.0
riscv                 randconfig-001-20251202    gcc-9.5.0
riscv                 randconfig-002-20251202    clang-22
riscv                 randconfig-002-20251202    gcc-9.5.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    gcc-15.1.0
s390                  randconfig-001-20251202    clang-17
s390                  randconfig-001-20251202    gcc-9.5.0
s390                  randconfig-002-20251202    gcc-13.4.0
s390                  randconfig-002-20251202    gcc-9.5.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    clang-22
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-14
sh                    randconfig-001-20251202    gcc-15.1.0
sh                    randconfig-001-20251202    gcc-9.5.0
sh                    randconfig-002-20251202    gcc-12.5.0
sh                    randconfig-002-20251202    gcc-9.5.0
sparc                             allnoconfig    clang-22
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251201    gcc-8.5.0
sparc                 randconfig-001-20251202    gcc-14
sparc                 randconfig-002-20251201    gcc-14.3.0
sparc                 randconfig-002-20251202    gcc-14
sparc64                          allmodconfig    clang-22
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20251201    clang-22
sparc64               randconfig-001-20251202    gcc-14
sparc64               randconfig-002-20251201    gcc-14.3.0
sparc64               randconfig-002-20251202    gcc-14
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-14
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251201    gcc-14
um                    randconfig-001-20251202    gcc-14
um                    randconfig-002-20251201    gcc-14
um                    randconfig-002-20251202    gcc-14
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-22
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20251202    gcc-14
x86_64      buildonly-randconfig-002-20251202    gcc-14
x86_64      buildonly-randconfig-003-20251202    clang-20
x86_64      buildonly-randconfig-003-20251202    gcc-14
x86_64      buildonly-randconfig-004-20251202    gcc-13
x86_64      buildonly-randconfig-004-20251202    gcc-14
x86_64      buildonly-randconfig-005-20251202    gcc-14
x86_64      buildonly-randconfig-006-20251202    gcc-13
x86_64      buildonly-randconfig-006-20251202    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20251202    clang-20
x86_64                randconfig-001-20251202    gcc-14
x86_64                randconfig-002-20251202    clang-20
x86_64                randconfig-002-20251202    gcc-14
x86_64                randconfig-003-20251202    gcc-14
x86_64                randconfig-004-20251202    gcc-14
x86_64                randconfig-005-20251202    gcc-14
x86_64                randconfig-006-20251202    clang-20
x86_64                randconfig-006-20251202    gcc-14
x86_64                randconfig-011-20251201    clang-20
x86_64                randconfig-011-20251202    gcc-13
x86_64                randconfig-012-20251201    gcc-14
x86_64                randconfig-012-20251202    gcc-13
x86_64                randconfig-013-20251201    gcc-14
x86_64                randconfig-013-20251202    gcc-13
x86_64                randconfig-014-20251201    gcc-14
x86_64                randconfig-014-20251202    gcc-13
x86_64                randconfig-015-20251201    clang-20
x86_64                randconfig-015-20251202    gcc-13
x86_64                randconfig-016-20251201    clang-20
x86_64                randconfig-016-20251202    gcc-13
x86_64                randconfig-071-20251202    clang-20
x86_64                randconfig-072-20251202    clang-20
x86_64                randconfig-073-20251202    clang-20
x86_64                randconfig-074-20251202    clang-20
x86_64                randconfig-075-20251202    clang-20
x86_64                randconfig-076-20251202    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-22
xtensa                            allnoconfig    gcc-15.1.0
xtensa                           allyesconfig    clang-22
xtensa                           allyesconfig    gcc-15.1.0
xtensa                randconfig-001-20251201    gcc-9.5.0
xtensa                randconfig-001-20251202    gcc-14
xtensa                randconfig-002-20251201    gcc-12.5.0
xtensa                randconfig-002-20251202    gcc-14

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
