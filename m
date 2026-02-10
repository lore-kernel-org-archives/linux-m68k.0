Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E437221257F
	for <linux-m68k@lists.linux-m68k.org>; Tue, 10 Feb 2026 00:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770682688; cv=none; b=AsTFWI3lbeYJWJ1o+tzijkqVkqUmQIfJ904efMszOYgBNcspWYn0ctMU0wph0efQGoe17tD7mYRp2G+lb3fg+zRzJoSqolDC5fI3/XGLuugLLp2AuZ9QtfcKLb90vkB2dOcDVYmoGLEqI9UZqRJTAvR2TGusY2mQCJ4JN0IyyMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770682688; c=relaxed/simple;
	bh=sQ4VRx5IKi/kZVF2fXNNzScnA99IlCTH9aYE7PhrmPY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tXaZfup7cescsFeCi+stUfruLHi9IDJLXmSDn2Jo6uXmLTZkMZF6ZgAsl1N5CiEFfWd6lUDf71U/La3katrdzDibHDftsUmfu4faveCvQ5C1aid0C+JAWOoMjJrMtIxLulaD9Zl20ZjDw50uomDtouYbE7sKT6lGSvboTG5QigI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BNe85MeY; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BNe85MeY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770682687; x=1802218687;
  h=date:from:to:cc:subject:message-id;
  bh=sQ4VRx5IKi/kZVF2fXNNzScnA99IlCTH9aYE7PhrmPY=;
  b=BNe85MeYqxt2wYugm7dzqD0WTAER11Td2ZCCj9YmRBLy8bOhiMy9qG11
   h53Z57/5sGrYdirjRSvfk2qo12PALor2MEZ4Bc/fn2tbHhRRjJODGtz8f
   qIdVtKXzI52ohi0GY7iqxOJ1SFjN1qvLLGjZrZKxQbbI/vPHXx4OuqusJ
   h/uDiSkodU22ATP6ootmCwdqY1oQMUQGL7PMIk6jhAZrJYejgBAgu+i2j
   LeR3Ci8SzTepHcogcVbQmC5hwuOgimc9KuQAfncSM4IvjZ+YnxKt2N48A
   KW/eYtlzj2cjN4M4RCPJpJJJw9S++oU0jdZYjEM7iWw/M6f22V897TupK
   g==;
X-CSE-ConnectionGUID: tZoYw0yhTbiwy/I27PzRXg==
X-CSE-MsgGUID: 4TdBvB1nQC6TdThAc7sLgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="71843579"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="71843579"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 16:18:07 -0800
X-CSE-ConnectionGUID: 1Wvq/g9IR5qTVe8sNqoPHw==
X-CSE-MsgGUID: i+O6HJ8+TGuPkyYChm+9FA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="216245690"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 09 Feb 2026 16:18:04 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpbS6-00000000oRQ-1QGd;
	Tue, 10 Feb 2026 00:18:02 +0000
Date: Tue, 10 Feb 2026 08:17:54 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:m68k-v6.19] BUILD SUCCESS
 926c59abffbc3392da6c35074cc9227ee4aecd34
Message-ID: <202602100845.P4yndgc5-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git m68k-v6.19
branch HEAD: 926c59abffbc3392da6c35074cc9227ee4aecd34  m68k: defconfig: Enable Atari EtherNAT and NetUSBee USB support

elapsed time: 904m

configs tested: 304
configs skipped: 10

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              alldefconfig    clang-16
arc                              allmodconfig    clang-16
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    clang-22
arc                                 defconfig    gcc-15.2.0
arc                   randconfig-001-20260209    gcc-10.5.0
arc                   randconfig-001-20260210    clang-20
arc                   randconfig-002-20260209    gcc-10.5.0
arc                   randconfig-002-20260210    clang-20
arm                               allnoconfig    clang-22
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                     am200epdkit_defconfig    clang-16
arm                        clps711x_defconfig    gcc-15.2.0
arm                                 defconfig    gcc-15.2.0
arm                       multi_v4t_defconfig    clang-16
arm                   randconfig-001-20260209    gcc-10.5.0
arm                   randconfig-001-20260210    clang-20
arm                   randconfig-002-20260209    gcc-10.5.0
arm                   randconfig-002-20260210    clang-20
arm                   randconfig-003-20260209    gcc-10.5.0
arm                   randconfig-003-20260210    clang-20
arm                   randconfig-004-20260209    gcc-10.5.0
arm                   randconfig-004-20260210    clang-20
arm                           sama5_defconfig    clang-18
arm64                            allmodconfig    clang-22
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260209    gcc-15.2.0
arm64                 randconfig-001-20260210    clang-22
arm64                 randconfig-002-20260209    gcc-15.2.0
arm64                 randconfig-002-20260210    clang-22
arm64                 randconfig-003-20260209    gcc-15.2.0
arm64                 randconfig-003-20260210    clang-22
arm64                 randconfig-004-20260209    gcc-15.2.0
arm64                 randconfig-004-20260210    clang-22
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260209    gcc-15.2.0
csky                  randconfig-001-20260210    clang-22
csky                  randconfig-002-20260209    gcc-15.2.0
csky                  randconfig-002-20260210    clang-22
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    clang-22
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260209    clang-22
hexagon               randconfig-001-20260210    clang-22
hexagon               randconfig-002-20260209    clang-22
hexagon               randconfig-002-20260210    clang-22
i386                             allmodconfig    clang-20
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20260209    gcc-13
i386        buildonly-randconfig-001-20260210    clang-20
i386        buildonly-randconfig-002-20260209    gcc-13
i386        buildonly-randconfig-002-20260210    clang-20
i386        buildonly-randconfig-003-20260209    gcc-13
i386        buildonly-randconfig-003-20260210    clang-20
i386        buildonly-randconfig-004-20260209    gcc-13
i386        buildonly-randconfig-004-20260210    clang-20
i386        buildonly-randconfig-005-20260209    gcc-13
i386        buildonly-randconfig-005-20260210    clang-20
i386        buildonly-randconfig-006-20260209    gcc-13
i386        buildonly-randconfig-006-20260210    clang-20
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260209    clang-20
i386                  randconfig-001-20260210    gcc-14
i386                  randconfig-002-20260209    clang-20
i386                  randconfig-002-20260210    gcc-14
i386                  randconfig-003-20260209    clang-20
i386                  randconfig-003-20260210    gcc-14
i386                  randconfig-004-20260209    clang-20
i386                  randconfig-004-20260210    gcc-14
i386                  randconfig-005-20260209    clang-20
i386                  randconfig-005-20260210    gcc-14
i386                  randconfig-006-20260209    clang-20
i386                  randconfig-006-20260210    gcc-14
i386                  randconfig-007-20260209    clang-20
i386                  randconfig-007-20260210    gcc-14
i386                  randconfig-011-20260209    clang-20
i386                  randconfig-011-20260209    gcc-14
i386                  randconfig-011-20260210    gcc-14
i386                  randconfig-012-20260209    gcc-14
i386                  randconfig-012-20260210    gcc-14
i386                  randconfig-013-20260209    clang-20
i386                  randconfig-013-20260209    gcc-14
i386                  randconfig-013-20260210    gcc-14
i386                  randconfig-014-20260209    gcc-14
i386                  randconfig-014-20260210    gcc-14
i386                  randconfig-015-20260209    gcc-14
i386                  randconfig-015-20260210    gcc-14
i386                  randconfig-016-20260209    gcc-14
i386                  randconfig-016-20260210    gcc-14
i386                  randconfig-017-20260209    gcc-14
i386                  randconfig-017-20260210    gcc-14
loongarch                        allmodconfig    clang-22
loongarch                         allnoconfig    clang-22
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260209    clang-22
loongarch             randconfig-001-20260210    clang-22
loongarch             randconfig-002-20260209    clang-22
loongarch             randconfig-002-20260210    clang-22
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                                defconfig    clang-19
m68k                       m5208evb_defconfig    clang-18
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
mips                      fuloong2e_defconfig    gcc-15.2.0
mips                           ip27_defconfig    clang-18
mips                       lemote2f_defconfig    clang-16
mips                        qi_lb60_defconfig    clang-18
mips                          rb532_defconfig    clang-18
nios2                            allmodconfig    clang-22
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260209    clang-22
nios2                 randconfig-001-20260210    clang-22
nios2                 randconfig-002-20260209    clang-22
nios2                 randconfig-002-20260210    clang-22
openrisc                         allmodconfig    clang-22
openrisc                         allmodconfig    gcc-15.2.0
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.2.0
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.2.0
parisc                           allyesconfig    clang-19
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260209    gcc-12.5.0
parisc                randconfig-001-20260210    clang-19
parisc                randconfig-002-20260209    gcc-12.5.0
parisc                randconfig-002-20260210    clang-19
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.2.0
powerpc                   currituck_defconfig    gcc-15.2.0
powerpc                   motionpro_defconfig    gcc-15.2.0
powerpc                         ps3_defconfig    gcc-15.2.0
powerpc               randconfig-001-20260209    gcc-12.5.0
powerpc               randconfig-001-20260210    clang-19
powerpc               randconfig-002-20260209    gcc-12.5.0
powerpc               randconfig-002-20260210    clang-19
powerpc                    socrates_defconfig    clang-18
powerpc                     stx_gp3_defconfig    clang-18
powerpc64             randconfig-001-20260209    gcc-12.5.0
powerpc64             randconfig-001-20260210    clang-19
powerpc64             randconfig-002-20260209    gcc-12.5.0
powerpc64             randconfig-002-20260210    clang-19
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                    nommu_virt_defconfig    gcc-15.2.0
riscv                 randconfig-001-20260209    gcc-12.5.0
riscv                 randconfig-001-20260209    gcc-9.5.0
riscv                 randconfig-001-20260210    gcc-11.5.0
riscv                 randconfig-002-20260209    gcc-12.5.0
riscv                 randconfig-002-20260210    gcc-11.5.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260209    gcc-12.5.0
s390                  randconfig-001-20260210    gcc-11.5.0
s390                  randconfig-002-20260209    gcc-12.5.0
s390                  randconfig-002-20260209    gcc-8.5.0
s390                  randconfig-002-20260210    gcc-11.5.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-22
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    clang-19
sh                                  defconfig    gcc-14
sh                          polaris_defconfig    gcc-15.2.0
sh                    randconfig-001-20260209    gcc-10.5.0
sh                    randconfig-001-20260209    gcc-12.5.0
sh                    randconfig-001-20260210    gcc-11.5.0
sh                    randconfig-002-20260209    gcc-12.5.0
sh                    randconfig-002-20260209    gcc-9.5.0
sh                    randconfig-002-20260210    gcc-11.5.0
sh                          sdk7786_defconfig    clang-16
sh                           se7343_defconfig    clang-18
sh                           se7750_defconfig    clang-16
sh                             sh03_defconfig    gcc-15.2.0
sparc                             allnoconfig    clang-22
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260209    gcc-11.5.0
sparc                 randconfig-001-20260209    gcc-8.5.0
sparc                 randconfig-001-20260210    gcc-14.3.0
sparc                 randconfig-002-20260209    gcc-11.5.0
sparc                 randconfig-002-20260210    gcc-14.3.0
sparc64                          allmodconfig    clang-22
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260209    clang-22
sparc64               randconfig-001-20260209    gcc-11.5.0
sparc64               randconfig-001-20260210    gcc-14.3.0
sparc64               randconfig-002-20260209    clang-22
sparc64               randconfig-002-20260209    gcc-11.5.0
sparc64               randconfig-002-20260210    gcc-14.3.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260209    gcc-11.5.0
um                    randconfig-001-20260209    gcc-14
um                    randconfig-001-20260210    gcc-14.3.0
um                    randconfig-002-20260209    clang-18
um                    randconfig-002-20260209    gcc-11.5.0
um                    randconfig-002-20260210    gcc-14.3.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-22
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260209    clang-20
x86_64      buildonly-randconfig-001-20260209    gcc-14
x86_64      buildonly-randconfig-001-20260210    gcc-14
x86_64      buildonly-randconfig-002-20260209    clang-20
x86_64      buildonly-randconfig-002-20260209    gcc-14
x86_64      buildonly-randconfig-002-20260210    gcc-14
x86_64      buildonly-randconfig-003-20260209    clang-20
x86_64      buildonly-randconfig-003-20260210    gcc-14
x86_64      buildonly-randconfig-004-20260209    clang-20
x86_64      buildonly-randconfig-004-20260210    gcc-14
x86_64      buildonly-randconfig-005-20260209    clang-20
x86_64      buildonly-randconfig-005-20260209    gcc-14
x86_64      buildonly-randconfig-005-20260210    gcc-14
x86_64      buildonly-randconfig-006-20260209    clang-20
x86_64      buildonly-randconfig-006-20260210    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260209    gcc-14
x86_64                randconfig-001-20260210    gcc-14
x86_64                randconfig-002-20260209    gcc-14
x86_64                randconfig-002-20260210    gcc-14
x86_64                randconfig-003-20260209    gcc-14
x86_64                randconfig-003-20260210    gcc-14
x86_64                randconfig-004-20260209    gcc-14
x86_64                randconfig-004-20260210    gcc-14
x86_64                randconfig-005-20260209    gcc-14
x86_64                randconfig-005-20260210    gcc-14
x86_64                randconfig-006-20260209    gcc-14
x86_64                randconfig-006-20260210    gcc-14
x86_64                randconfig-011-20260209    clang-20
x86_64                randconfig-012-20260209    clang-20
x86_64                randconfig-013-20260209    clang-20
x86_64                randconfig-013-20260209    gcc-14
x86_64                randconfig-014-20260209    clang-20
x86_64                randconfig-015-20260209    clang-20
x86_64                randconfig-015-20260209    gcc-14
x86_64                randconfig-016-20260209    clang-20
x86_64                randconfig-016-20260209    gcc-14
x86_64                randconfig-071-20260209    clang-20
x86_64                randconfig-071-20260209    gcc-14
x86_64                randconfig-071-20260210    clang-20
x86_64                randconfig-072-20260209    gcc-14
x86_64                randconfig-072-20260210    clang-20
x86_64                randconfig-073-20260209    clang-20
x86_64                randconfig-073-20260209    gcc-14
x86_64                randconfig-073-20260210    clang-20
x86_64                randconfig-074-20260209    clang-20
x86_64                randconfig-074-20260209    gcc-14
x86_64                randconfig-074-20260210    clang-20
x86_64                randconfig-075-20260209    clang-20
x86_64                randconfig-075-20260209    gcc-14
x86_64                randconfig-075-20260210    clang-20
x86_64                randconfig-076-20260209    gcc-14
x86_64                randconfig-076-20260210    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-22
xtensa                            allnoconfig    gcc-15.2.0
xtensa                           allyesconfig    clang-22
xtensa                  cadence_csp_defconfig    clang-16
xtensa                randconfig-001-20260209    gcc-11.5.0
xtensa                randconfig-001-20260209    gcc-8.5.0
xtensa                randconfig-001-20260210    gcc-14.3.0
xtensa                randconfig-002-20260209    gcc-11.5.0
xtensa                randconfig-002-20260209    gcc-8.5.0
xtensa                randconfig-002-20260210    gcc-14.3.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
