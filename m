Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0563736B
	for <linux-m68k@lists.linux-m68k.org>; Tue, 30 Sep 2025 05:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759209542; cv=none; b=p4g/3VDJtFRx4O9juM0Yfq4Vp4ey7+HoilShYJQh+lgu/1h58muVomvxdUI2yxj1mMtjsMVroY94v7Zvr6ZoVVQjpzOdP7PY4osvg1zxnDx4XQBM2DaIWKy5f106IhcM3KdYDcC+y4fqfbWtMCk+41U2UfftQm6Hbj6FwBkv9AE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759209542; c=relaxed/simple;
	bh=ZvRUbQnxxCwbL1Wsy2ZSQpHiv5GAjWJy7hdv+i8hNz0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QXn3PeP1wl6tyQCJh6/8UFTGxhZesz1qKVwrHQMqvsE5gpbqd6SyQpc0Hg7dE6FoLT6fBBVeOs//HRay/8JNRhQgEr/q81OePoEe9nNkIyevKy+A9AwJSlG1douKvKGQ9v65Gr3IfOLo2loKYJMlI4xyO+ef1LJHojqQgOtjGRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cs+0NvpL; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cs+0NvpL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759209541; x=1790745541;
  h=date:from:to:cc:subject:message-id;
  bh=ZvRUbQnxxCwbL1Wsy2ZSQpHiv5GAjWJy7hdv+i8hNz0=;
  b=cs+0NvpLLgGaB3j9hzB8uZ9+qPm3j9gvJWWcj9BxivNS42yyCSvNsNSf
   BT+bJlL1QxbzLKt5BU6/00K3fGSD3BqD8JJDI5BHfbWWhWwLb90J2r9mx
   +vj05iF1O3F0Se/w7rN4pd3XeRN8urybjxQp9n++hNkrDidF+XEiMq3qQ
   wph/YOW2oW8liQq30CqoHhd38quSEj4JTvSJfuLIbS2+8Gq3Rqy0XuvFj
   rGgz8oCcZrlLUax3DWhBmsaU3hSPKoeQmaarL1O0IIw4QG0LvhTDB47ra
   I/MHXy1YA8yKqfgkh7wt8NjNNwpI0zvHQLt7uie3VhPeOpcnHogv26fS+
   w==;
X-CSE-ConnectionGUID: S4b8Had7RBKyzHm3m5DTKg==
X-CSE-MsgGUID: ZYVnVtm/T9C/nw4nbArl9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11568"; a="79106740"
X-IronPort-AV: E=Sophos;i="6.18,303,1751266800"; 
   d="scan'208";a="79106740"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2025 22:19:00 -0700
X-CSE-ConnectionGUID: HN0fB24GT8qITXtjqJDboQ==
X-CSE-MsgGUID: DJUA7O/9TKu0dH7ME3ZI2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,303,1751266800"; 
   d="scan'208";a="209134485"
Received: from lkp-server01.sh.intel.com (HELO 2f2a1232a4e4) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 29 Sep 2025 22:18:59 -0700
Received: from kbuild by 2f2a1232a4e4 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v3SlM-0000vT-24;
	Tue, 30 Sep 2025 05:18:56 +0000
Date: Tue, 30 Sep 2025 13:18:27 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:m68k-v6.17] BUILD SUCCESS
 671340282b7843eb88c6fd8af88ebbbd4082d7fe
Message-ID: <202509301317.1428wolB-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git m68k-v6.17
branch HEAD: 671340282b7843eb88c6fd8af88ebbbd4082d7fe  m68k: defconfig: Enable Atari EtherNAT and NetUSBee USB support

elapsed time: 1214m

configs tested: 216
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    clang-22
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    clang-19
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    clang-19
arc                              allmodconfig    clang-19
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    clang-22
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    clang-19
arc                              allyesconfig    gcc-15.1.0
arc                                 defconfig    clang-19
arc                   randconfig-001-20250929    gcc-8.5.0
arc                   randconfig-001-20250930    gcc-10.5.0
arc                   randconfig-002-20250929    gcc-8.5.0
arc                   randconfig-002-20250930    gcc-10.5.0
arm                              allmodconfig    clang-19
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    clang-19
arm                              allyesconfig    gcc-15.1.0
arm                                 defconfig    clang-19
arm                        keystone_defconfig    gcc-15.1.0
arm                        mvebu_v7_defconfig    clang-22
arm                          pxa3xx_defconfig    clang-22
arm                   randconfig-001-20250929    gcc-8.5.0
arm                   randconfig-001-20250930    gcc-10.5.0
arm                   randconfig-002-20250929    gcc-14.3.0
arm                   randconfig-002-20250930    gcc-10.5.0
arm                   randconfig-003-20250929    clang-22
arm                   randconfig-003-20250930    gcc-10.5.0
arm                   randconfig-004-20250929    gcc-10.5.0
arm                   randconfig-004-20250930    gcc-10.5.0
arm                       spear13xx_defconfig    clang-22
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    clang-22
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    clang-19
arm64                 randconfig-001-20250929    gcc-8.5.0
arm64                 randconfig-001-20250930    gcc-10.5.0
arm64                 randconfig-002-20250929    gcc-13.4.0
arm64                 randconfig-002-20250930    gcc-10.5.0
arm64                 randconfig-003-20250929    clang-22
arm64                 randconfig-003-20250930    gcc-10.5.0
arm64                 randconfig-004-20250929    clang-22
arm64                 randconfig-004-20250930    gcc-10.5.0
csky                              allnoconfig    clang-22
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    clang-19
csky                  randconfig-001-20250929    gcc-9.5.0
csky                  randconfig-002-20250929    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-22
hexagon                             defconfig    clang-19
hexagon               randconfig-001-20250929    clang-22
hexagon               randconfig-002-20250929    clang-22
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20250929    gcc-14
i386        buildonly-randconfig-001-20250930    clang-20
i386        buildonly-randconfig-002-20250929    clang-20
i386        buildonly-randconfig-002-20250930    clang-20
i386        buildonly-randconfig-003-20250929    gcc-14
i386        buildonly-randconfig-003-20250930    clang-20
i386        buildonly-randconfig-004-20250929    gcc-14
i386        buildonly-randconfig-004-20250930    clang-20
i386        buildonly-randconfig-005-20250929    gcc-14
i386        buildonly-randconfig-005-20250930    clang-20
i386        buildonly-randconfig-006-20250929    gcc-14
i386        buildonly-randconfig-006-20250930    clang-20
i386                                defconfig    clang-20
i386                  randconfig-001-20250930    gcc-14
i386                  randconfig-002-20250930    gcc-14
i386                  randconfig-003-20250930    gcc-14
i386                  randconfig-004-20250930    gcc-14
i386                  randconfig-005-20250930    gcc-14
i386                  randconfig-006-20250930    gcc-14
i386                  randconfig-007-20250930    gcc-14
i386                  randconfig-011-20250930    gcc-14
i386                  randconfig-012-20250930    gcc-14
i386                  randconfig-013-20250930    gcc-14
i386                  randconfig-014-20250930    gcc-14
i386                  randconfig-015-20250930    gcc-14
i386                  randconfig-016-20250930    gcc-14
i386                  randconfig-017-20250930    gcc-14
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20250929    gcc-12.5.0
loongarch             randconfig-002-20250929    gcc-15.1.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    clang-19
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                         bigsur_defconfig    gcc-15.1.0
mips                           ip30_defconfig    clang-22
mips                           mtx1_defconfig    clang-22
mips                           xway_defconfig    clang-22
nios2                         3c120_defconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                               defconfig    gcc-15.1.0
nios2                 randconfig-001-20250929    gcc-11.5.0
nios2                 randconfig-002-20250929    gcc-9.5.0
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-14
openrisc                            defconfig    gcc-15.1.0
parisc                           alldefconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250929    gcc-14.3.0
parisc                randconfig-002-20250929    gcc-14.3.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-22
powerpc                 mpc837x_rdb_defconfig    clang-22
powerpc               randconfig-001-20250929    gcc-15.1.0
powerpc               randconfig-002-20250929    gcc-8.5.0
powerpc               randconfig-003-20250929    gcc-13.4.0
powerpc64             randconfig-001-20250929    clang-18
powerpc64             randconfig-002-20250929    clang-22
powerpc64             randconfig-003-20250929    clang-22
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-22
riscv                               defconfig    gcc-14
riscv                 randconfig-001-20250929    gcc-9.5.0
riscv                 randconfig-002-20250929    gcc-11.5.0
s390                             alldefconfig    clang-22
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-22
s390                                defconfig    gcc-14
s390                  randconfig-001-20250929    gcc-11.5.0
s390                  randconfig-002-20250929    gcc-13.4.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-14
sh                                  defconfig    gcc-15.1.0
sh                    randconfig-001-20250929    gcc-15.1.0
sh                    randconfig-002-20250929    gcc-15.1.0
sh                           se7751_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250929    gcc-8.5.0
sparc                 randconfig-002-20250929    gcc-8.5.0
sparc64                             defconfig    clang-20
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20250929    clang-22
sparc64               randconfig-002-20250929    clang-22
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-14
um                                  defconfig    clang-22
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20250929    gcc-14
um                    randconfig-002-20250929    gcc-14
um                           x86_64_defconfig    clang-22
um                           x86_64_defconfig    gcc-14
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250929    gcc-14
x86_64      buildonly-randconfig-001-20250930    gcc-14
x86_64      buildonly-randconfig-002-20250929    gcc-14
x86_64      buildonly-randconfig-002-20250930    gcc-14
x86_64      buildonly-randconfig-003-20250929    clang-20
x86_64      buildonly-randconfig-003-20250930    gcc-14
x86_64      buildonly-randconfig-004-20250929    gcc-14
x86_64      buildonly-randconfig-004-20250930    gcc-14
x86_64      buildonly-randconfig-005-20250929    gcc-14
x86_64      buildonly-randconfig-005-20250930    gcc-14
x86_64      buildonly-randconfig-006-20250929    gcc-14
x86_64      buildonly-randconfig-006-20250930    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-071-20250930    gcc-12
x86_64                randconfig-072-20250930    gcc-12
x86_64                randconfig-073-20250930    gcc-12
x86_64                randconfig-074-20250930    gcc-12
x86_64                randconfig-075-20250930    gcc-12
x86_64                randconfig-076-20250930    gcc-12
x86_64                randconfig-077-20250930    gcc-12
x86_64                randconfig-078-20250930    gcc-12
x86_64                               rhel-9.4    clang-20
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250929    gcc-8.5.0
xtensa                randconfig-002-20250929    gcc-13.4.0
xtensa                    smp_lx200_defconfig    clang-22
xtensa                    xip_kc705_defconfig    clang-22

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
