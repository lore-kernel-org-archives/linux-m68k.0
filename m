Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 210171D5CE0
	for <linux-m68k@lists.linux-m68k.org>; Tue,  2 Dec 2025 10:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764671903; cv=none; b=fc7G2fQYOmaJkFRx/IKJMxFTG7Daj7a5j1KB//EGZ6igxKaii18gVR0OEgL+xU6fiw9cCKowO1kxNca51NvNlevGN5XdVJWpvJuxy7R4scf82SfS8404tZcvqnhZntVQ4mk0xLzK6EICIYf1yfLzydM3OW962JOVGWUCkzW+iII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764671903; c=relaxed/simple;
	bh=btKFMMoIfOAGHZ560WbBFB+sKUso4wWfFmIkPzrF11M=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HUPX6yu123wQgchnpviBdUGqqG9DPKr2h4xrQEg2ID5WbwzSBylgOQrwlNGuPWQN0eIn3ntEdocJfogI1T79B+EhvKFxjETu0X/mH4TIhVhpHlZ6JyYLfRdXvDyCbOOUgmlChMKgTdUB2OnLQIEL3rcbkMxx6Ns2ZHWHcgGxghw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MWh0Ayqn; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MWh0Ayqn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764671901; x=1796207901;
  h=date:from:to:cc:subject:message-id;
  bh=btKFMMoIfOAGHZ560WbBFB+sKUso4wWfFmIkPzrF11M=;
  b=MWh0Ayqn/zLW+vpVj7V7Mu20u+CkDXUI7dvILm7NndVg3nOKJYGU3fcx
   6UDYx4pJc5kBzbhFhS7ww79O5N5SJaNxRUxo7Y60DYvUiS5SY3RuL2J1F
   R8shu6p0eh85Dz+wh50GKw/WlOMhv2tb1clWNTP/gUXO2gXPRcBXq2rva
   +rc7mOMJVrZ9AfKXyZKCHww/qnaC5cqVT5mlHZONC3jPw4oFG7gmSAko7
   kEp1RY+GcvJ16EhIhOvOdExyvnhQ+tE/CpyUh418B3Mn0IaFLSvVUROtT
   t95wX9pq/lGF04RugpEiMUsmwXXujf7qWk9U1mqPv8IUIk/Rh1oSpMw2M
   Q==;
X-CSE-ConnectionGUID: /vbwvRHVQMK7dsrgLcGXyg==
X-CSE-MsgGUID: 2wgZsIMoQ+uvZB/5WMxYfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="70249762"
X-IronPort-AV: E=Sophos;i="6.20,242,1758610800"; 
   d="scan'208";a="70249762"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 02:38:20 -0800
X-CSE-ConnectionGUID: KK333/vaS5+9HXcbDs4Z3g==
X-CSE-MsgGUID: i6ZItPZORPy1qMGbHe+9pQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,242,1758610800"; 
   d="scan'208";a="194172143"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 02 Dec 2025 02:38:19 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQNlw-000000009j3-1yS7;
	Tue, 02 Dec 2025 10:38:16 +0000
Date: Tue, 02 Dec 2025 18:38:12 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:master] BUILD SUCCESS
 574b800e1ffc0631e949b780db7f18c92c3dfb6a
Message-ID: <202512021804.yYIkYQpU-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git master
branch HEAD: 574b800e1ffc0631e949b780db7f18c92c3dfb6a  Merge tag 'v6.18'

elapsed time: 1453m

configs tested: 165
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                                 defconfig    gcc-15.1.0
arc                   randconfig-001-20251202    gcc-8.5.0
arc                   randconfig-002-20251202    gcc-12.5.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    gcc-15.1.0
arm                                 defconfig    clang-22
arm                   randconfig-001-20251202    clang-17
arm                   randconfig-002-20251202    clang-22
arm                   randconfig-003-20251202    clang-22
arm                   randconfig-004-20251202    gcc-14.3.0
arm                             rpc_defconfig    clang-18
arm                        spear6xx_defconfig    clang-22
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20251201    gcc-8.5.0
arm64                 randconfig-002-20251201    clang-22
arm64                 randconfig-003-20251201    clang-18
arm64                 randconfig-004-20251201    gcc-14.3.0
csky                             allmodconfig    gcc-15.1.0
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20251201    gcc-15.1.0
csky                  randconfig-002-20251201    gcc-14.3.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                             defconfig    clang-22
hexagon               randconfig-001-20251202    clang-22
hexagon               randconfig-002-20251202    clang-22
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20251201    clang-20
i386        buildonly-randconfig-002-20251201    clang-20
i386        buildonly-randconfig-003-20251201    clang-20
i386        buildonly-randconfig-004-20251201    clang-20
i386        buildonly-randconfig-005-20251201    clang-20
i386        buildonly-randconfig-006-20251201    gcc-14
i386                                defconfig    clang-20
i386                  randconfig-001-20251202    clang-20
i386                  randconfig-002-20251202    gcc-14
i386                  randconfig-003-20251202    gcc-14
i386                  randconfig-004-20251202    clang-20
i386                  randconfig-005-20251202    gcc-14
i386                  randconfig-006-20251202    clang-20
i386                  randconfig-007-20251202    clang-20
i386                  randconfig-011-20251202    clang-20
i386                  randconfig-012-20251202    clang-20
i386                  randconfig-013-20251202    gcc-14
i386                  randconfig-014-20251202    gcc-14
i386                  randconfig-015-20251202    gcc-14
i386                  randconfig-016-20251202    clang-20
i386                  randconfig-017-20251202    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20251202    gcc-15.1.0
loongarch             randconfig-002-20251202    clang-22
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    gcc-15.1.0
m68k                       m5249evb_defconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                             allmodconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                             allyesconfig    gcc-15.1.0
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20251202    gcc-8.5.0
nios2                 randconfig-002-20251202    gcc-8.5.0
openrisc                         allmodconfig    gcc-15.1.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251201    gcc-13.4.0
parisc                randconfig-002-20251201    gcc-15.1.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc               randconfig-001-20251201    gcc-13.4.0
powerpc               randconfig-002-20251201    gcc-10.5.0
powerpc                 xes_mpc85xx_defconfig    gcc-15.1.0
powerpc64             randconfig-001-20251201    gcc-14.3.0
powerpc64             randconfig-002-20251201    gcc-13.4.0
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-22
riscv                 randconfig-001-20251202    gcc-9.5.0
riscv                 randconfig-002-20251202    clang-22
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-22
s390                  randconfig-001-20251202    clang-17
s390                  randconfig-002-20251202    gcc-13.4.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                    randconfig-001-20251202    gcc-15.1.0
sh                    randconfig-002-20251202    gcc-12.5.0
sh                            shmin_defconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251201    gcc-8.5.0
sparc                 randconfig-002-20251201    gcc-14.3.0
sparc64                          allmodconfig    clang-22
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20251201    clang-22
sparc64               randconfig-002-20251201    gcc-14.3.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251201    gcc-14
um                    randconfig-002-20251201    gcc-14
um                           x86_64_defconfig    clang-22
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20251202    gcc-14
x86_64      buildonly-randconfig-002-20251202    gcc-14
x86_64      buildonly-randconfig-003-20251202    clang-20
x86_64      buildonly-randconfig-004-20251202    gcc-13
x86_64      buildonly-randconfig-005-20251202    gcc-14
x86_64      buildonly-randconfig-006-20251202    gcc-13
x86_64                              defconfig    gcc-14
x86_64                randconfig-001-20251202    clang-20
x86_64                randconfig-002-20251202    clang-20
x86_64                randconfig-003-20251202    gcc-14
x86_64                randconfig-004-20251202    gcc-14
x86_64                randconfig-005-20251202    gcc-14
x86_64                randconfig-006-20251202    clang-20
x86_64                randconfig-011-20251201    clang-20
x86_64                randconfig-012-20251201    gcc-14
x86_64                randconfig-013-20251201    gcc-14
x86_64                randconfig-014-20251201    gcc-14
x86_64                randconfig-015-20251201    clang-20
x86_64                randconfig-016-20251201    clang-20
x86_64                randconfig-071-20251202    clang-20
x86_64                randconfig-072-20251202    clang-20
x86_64                randconfig-073-20251202    clang-20
x86_64                randconfig-074-20251202    clang-20
x86_64                randconfig-075-20251202    clang-20
x86_64                randconfig-076-20251202    clang-20
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                  nommu_kc705_defconfig    gcc-15.1.0
xtensa                randconfig-001-20251201    gcc-9.5.0
xtensa                randconfig-002-20251201    gcc-12.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
