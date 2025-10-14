Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AAFA2D6401
	for <linux-m68k@lists.linux-m68k.org>; Tue, 14 Oct 2025 08:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760431712; cv=none; b=SQ5ZEazOjDy0VsKV0fQLJMMCOXEdIPR2mRCY9VI2ZUFdNvj3LzzepLNiWBV8+PUI3VJUsCmAkZGFHswTi1+SoN+3eiAXIqhj/i/PBggT+FY6diUWYj2iXXERxOwQ9Ttw0489e0rXOoyIW94iCErMopFD/EDHh5/seT+euB5OoLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760431712; c=relaxed/simple;
	bh=8auHW0dr/ARts0357pdn7BBer6tnl7aQsGkVFKsMHwI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cyj188Ouon9M//yPzcX6cuSa6LL7pGHx65pjWpIkfm7ZaSGtDTFP/FqXGLhiXVn+6Jyz2wzZGzHvLMBl+GaeuZ94sOLn0z0AK64wvVTLv6iOD8ZwcbwrgUlWRqOnqOTTn6uVp0tTGg29IRI+CzsAfpNKpjiafK12u/rZMHjYSug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H5iPjHwA; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H5iPjHwA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760431709; x=1791967709;
  h=date:from:to:cc:subject:message-id;
  bh=8auHW0dr/ARts0357pdn7BBer6tnl7aQsGkVFKsMHwI=;
  b=H5iPjHwA5vEbZxtO16i+AM0eB4QX2mNDISOd3GvJlO8rfirDBscfaA2B
   oLHDvsp2UUWQ8TyN6BZdvgcDKi/OA/DiNAgl//l5qGPQnBQ7pU/fOn7Kh
   lIIFT90d1g0ODdc3LGlifHsPExzQjkmVOT4LPVNbFmrrjDQqXRTbm9UBV
   e3+DEgr0Au5z5GcfuxtzKnTrEbhXWA83sHUX/hoTo5Lbh+GVVNLW7uhxe
   voxeuLY51hDC0ZWQNvZobZDpJD3cfPJzzN45oQ0Ru0nWr192LPJvBBgue
   kcN+X8sI2HSV2/XyfRnM2I6i1wKHYQPxGrZPFz8PzFHXXJyVNAi6f2BHr
   w==;
X-CSE-ConnectionGUID: g35enzaTRBa8FZKbf66teg==
X-CSE-MsgGUID: lU0sG+ovRL6PjXWwWKMEPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="72854509"
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; 
   d="scan'208";a="72854509"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2025 01:48:28 -0700
X-CSE-ConnectionGUID: AU4EcpkzTmOmMEsoY4gfAg==
X-CSE-MsgGUID: PDgC24hvT7iuK/1rBUbhbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; 
   d="scan'208";a="186924831"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 14 Oct 2025 01:48:27 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v8ahk-0002ZB-0g;
	Tue, 14 Oct 2025 08:48:24 +0000
Date: Tue, 14 Oct 2025 16:47:35 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:master] BUILD SUCCESS
 90b2f0aaf37dac827373a682db8df7d3ae0dc7de
Message-ID: <202510141629.LORJNcWT-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git master
branch HEAD: 90b2f0aaf37dac827373a682db8df7d3ae0dc7de  Merge tag 'v6.18-rc1'

elapsed time: 1129m

configs tested: 247
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    clang-19
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    clang-19
arc                              allmodconfig    clang-19
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    clang-19
arc                              allyesconfig    gcc-15.1.0
arc                                 defconfig    clang-19
arc                   randconfig-001-20251014    clang-16
arc                   randconfig-001-20251014    gcc-15.1.0
arc                   randconfig-002-20251014    clang-16
arc                   randconfig-002-20251014    gcc-8.5.0
arm                              allmodconfig    clang-19
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    clang-19
arm                              allyesconfig    gcc-15.1.0
arm                                 defconfig    clang-19
arm                   milbeaut_m10v_defconfig    gcc-15.1.0
arm                        multi_v5_defconfig    gcc-15.1.0
arm                   randconfig-001-20251014    clang-16
arm                   randconfig-001-20251014    gcc-15.1.0
arm                   randconfig-002-20251014    clang-16
arm                   randconfig-002-20251014    gcc-13.4.0
arm                   randconfig-003-20251014    clang-16
arm                   randconfig-004-20251014    clang-16
arm                   randconfig-004-20251014    gcc-8.5.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    clang-19
arm64                 randconfig-001-20251014    clang-16
arm64                 randconfig-001-20251014    gcc-9.5.0
arm64                 randconfig-002-20251014    clang-16
arm64                 randconfig-002-20251014    gcc-10.5.0
arm64                 randconfig-003-20251014    clang-16
arm64                 randconfig-003-20251014    gcc-14.3.0
arm64                 randconfig-004-20251014    clang-16
arm64                 randconfig-004-20251014    gcc-14.3.0
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    clang-19
csky                  randconfig-001-20251014    gcc-15.1.0
csky                  randconfig-001-20251014    gcc-8.5.0
csky                  randconfig-002-20251014    gcc-13.4.0
csky                  randconfig-002-20251014    gcc-8.5.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-22
hexagon                             defconfig    clang-19
hexagon               randconfig-001-20251014    clang-22
hexagon               randconfig-001-20251014    gcc-8.5.0
hexagon               randconfig-002-20251014    clang-22
hexagon               randconfig-002-20251014    gcc-8.5.0
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-14
i386                              allnoconfig    clang-20
i386                              allnoconfig    gcc-14
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20251013    gcc-13
i386        buildonly-randconfig-001-20251014    gcc-14
i386        buildonly-randconfig-002-20251013    clang-20
i386        buildonly-randconfig-002-20251014    gcc-14
i386        buildonly-randconfig-003-20251013    gcc-14
i386        buildonly-randconfig-003-20251014    gcc-14
i386        buildonly-randconfig-004-20251013    clang-20
i386        buildonly-randconfig-004-20251014    gcc-14
i386        buildonly-randconfig-005-20251013    gcc-14
i386        buildonly-randconfig-005-20251014    gcc-14
i386        buildonly-randconfig-006-20251013    gcc-14
i386        buildonly-randconfig-006-20251014    gcc-14
i386                                defconfig    clang-20
i386                  randconfig-001-20251014    clang-20
i386                  randconfig-002-20251014    clang-20
i386                  randconfig-003-20251014    clang-20
i386                  randconfig-004-20251014    clang-20
i386                  randconfig-005-20251014    clang-20
i386                  randconfig-006-20251014    clang-20
i386                  randconfig-007-20251014    clang-20
i386                  randconfig-011-20251014    gcc-14
i386                  randconfig-012-20251014    gcc-14
i386                  randconfig-013-20251014    gcc-14
i386                  randconfig-014-20251014    gcc-14
i386                  randconfig-015-20251014    gcc-14
i386                  randconfig-016-20251014    gcc-14
i386                  randconfig-017-20251014    gcc-14
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20251014    clang-18
loongarch             randconfig-001-20251014    gcc-8.5.0
loongarch             randconfig-002-20251014    gcc-15.1.0
loongarch             randconfig-002-20251014    gcc-8.5.0
m68k                             allmodconfig    clang-19
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    clang-19
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    clang-19
microblaze                       allmodconfig    clang-19
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    clang-19
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                          ath79_defconfig    gcc-15.1.0
mips                   sb1250_swarm_defconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-15.1.0
nios2                               defconfig    gcc-11.5.0
nios2                               defconfig    gcc-15.1.0
nios2                 randconfig-001-20251014    gcc-11.5.0
nios2                 randconfig-001-20251014    gcc-8.5.0
nios2                 randconfig-002-20251014    gcc-8.5.0
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-14
parisc                           alldefconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                generic-64bit_defconfig    gcc-15.1.0
parisc                randconfig-001-20251014    gcc-11.5.0
parisc                randconfig-001-20251014    gcc-8.5.0
parisc                randconfig-002-20251014    gcc-8.5.0
parisc                randconfig-002-20251014    gcc-9.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    gcc-15.1.0
powerpc               randconfig-001-20251014    gcc-8.5.0
powerpc               randconfig-001-20251014    gcc-9.5.0
powerpc               randconfig-002-20251014    clang-22
powerpc               randconfig-002-20251014    gcc-8.5.0
powerpc               randconfig-003-20251014    gcc-14.3.0
powerpc               randconfig-003-20251014    gcc-8.5.0
powerpc                     redwood_defconfig    gcc-15.1.0
powerpc                     tqm8540_defconfig    gcc-15.1.0
powerpc64             randconfig-001-20251014    gcc-8.5.0
powerpc64             randconfig-002-20251014    gcc-8.5.0
powerpc64             randconfig-003-20251014    gcc-8.5.0
riscv                            allmodconfig    gcc-15.1.0
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    gcc-15.1.0
riscv                               defconfig    clang-22
riscv                               defconfig    gcc-14
riscv                 randconfig-001-20251013    clang-22
riscv                 randconfig-001-20251014    gcc-10.5.0
riscv                 randconfig-002-20251013    clang-22
riscv                 randconfig-002-20251014    gcc-10.5.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    gcc-14
s390                  randconfig-001-20251013    gcc-8.5.0
s390                  randconfig-001-20251014    gcc-10.5.0
s390                  randconfig-002-20251013    clang-22
s390                  randconfig-002-20251014    gcc-10.5.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                         apsh4a3a_defconfig    gcc-15.1.0
sh                                  defconfig    gcc-14
sh                        dreamcast_defconfig    gcc-15.1.0
sh                            hp6xx_defconfig    gcc-15.1.0
sh                    randconfig-001-20251013    gcc-10.5.0
sh                    randconfig-001-20251014    gcc-10.5.0
sh                    randconfig-002-20251013    gcc-15.1.0
sh                    randconfig-002-20251014    gcc-10.5.0
sh                          sdk7786_defconfig    gcc-15.1.0
sh                           se7724_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251013    gcc-8.5.0
sparc                 randconfig-001-20251014    gcc-10.5.0
sparc                 randconfig-002-20251013    gcc-8.5.0
sparc                 randconfig-002-20251014    gcc-10.5.0
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20251013    clang-20
sparc64               randconfig-001-20251014    gcc-10.5.0
sparc64               randconfig-002-20251013    gcc-14.3.0
sparc64               randconfig-002-20251014    gcc-10.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-14
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251013    gcc-14
um                    randconfig-001-20251014    gcc-10.5.0
um                    randconfig-002-20251013    gcc-14
um                    randconfig-002-20251014    gcc-10.5.0
um                           x86_64_defconfig    gcc-14
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20251014    gcc-14
x86_64      buildonly-randconfig-002-20251014    clang-20
x86_64      buildonly-randconfig-002-20251014    gcc-14
x86_64      buildonly-randconfig-003-20251014    gcc-14
x86_64      buildonly-randconfig-004-20251014    clang-20
x86_64      buildonly-randconfig-004-20251014    gcc-14
x86_64      buildonly-randconfig-005-20251014    clang-20
x86_64      buildonly-randconfig-005-20251014    gcc-14
x86_64      buildonly-randconfig-006-20251014    gcc-14
x86_64                              defconfig    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20251014    gcc-14
x86_64                randconfig-002-20251014    gcc-14
x86_64                randconfig-003-20251014    gcc-14
x86_64                randconfig-004-20251014    gcc-14
x86_64                randconfig-005-20251014    gcc-14
x86_64                randconfig-006-20251014    gcc-14
x86_64                randconfig-007-20251014    gcc-14
x86_64                randconfig-008-20251014    gcc-14
x86_64                randconfig-071-20251014    gcc-14
x86_64                randconfig-072-20251014    gcc-14
x86_64                randconfig-073-20251014    gcc-14
x86_64                randconfig-074-20251014    gcc-14
x86_64                randconfig-075-20251014    gcc-14
x86_64                randconfig-076-20251014    gcc-14
x86_64                randconfig-077-20251014    gcc-14
x86_64                randconfig-078-20251014    gcc-14
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20251013    gcc-11.5.0
xtensa                randconfig-001-20251014    gcc-10.5.0
xtensa                randconfig-002-20251013    gcc-11.5.0
xtensa                randconfig-002-20251014    gcc-10.5.0
xtensa                         virt_defconfig    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
