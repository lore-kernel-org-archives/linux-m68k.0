Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 532412B9BF
	for <linux-m68k@lists.linux-m68k.org>; Thu,  9 Jan 2025 18:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736446856; cv=none; b=cR+s07/BY7U2m043IYN5waM0rDrs5V9/XhRCAQdsMWaWifYQhtLGX+zu6U6+7OOFK++gXp2oCf0Iw6SNRq8qPdRyphPgA8C1zxNy5kgVDk7noVEunYMYy67m0PkCTZ1srBtiIz2dSf8q+hmrwFbTwKnOeRjHoM4MIqhsC3jDuhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736446856; c=relaxed/simple;
	bh=Pg23c854zgVWIlSoVRx2tUQ4VeC24J0QkKZBq9mev8U=;
	h=Date:From:To:Cc:Subject:Message-ID; b=oZs9Jmi8bmV8e69SBo7rxXnvc7nCxSVHbVyzPYulFiWwPKqwHK5yhJiXpXEZDGmVHIIcH/LwTuI4JZzCREwbOKQhbdggCl6zygTE8CSMKBY3ZWuytIHv00gwXhkQJ6CXwns4J9X5TcWyn7co3Q0SCFoB8FjCofvygIYHYG/mLJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R4K8XErX; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R4K8XErX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736446854; x=1767982854;
  h=date:from:to:cc:subject:message-id;
  bh=Pg23c854zgVWIlSoVRx2tUQ4VeC24J0QkKZBq9mev8U=;
  b=R4K8XErXmLyD7j7Slhn3MHYnt+S9TMYRHWkk1Lv/L/MSrBTmVSAt1GfQ
   hKWulW96/4C75p8JxMF0sLBqFMxvq7N6KuyHh9LgDfPPEyvPXkXVxc+ef
   5KhlDpyyTDzviVvBghsHWWSHLh5xys8EdYsnfOObfbQIGO0XObDUpp3o/
   EzKe/NpBlLdj4cfRT+tigP8GUeu6SlH0Qcp3sGCqv7GZzSeWMcKWvbF/M
   22qCZGFQ4TNA0auBnOZsLYa+WmrrfTI/ipUg0Ksb9ss/P/w2NffXJapeL
   XqDqNkclgiAy0tV/+AoLHhg7PlxNgG37F+IFAPPh9MjIrurwjXbA6co9o
   w==;
X-CSE-ConnectionGUID: Agl2l3SjTvCUsPcm+u23lg==
X-CSE-MsgGUID: q7p2yUUhTGafGxgVNmPEAg==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="47302897"
X-IronPort-AV: E=Sophos;i="6.12,302,1728975600"; 
   d="scan'208";a="47302897"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2025 10:20:53 -0800
X-CSE-ConnectionGUID: vixoiuLXRHOnYLh/bzIQmA==
X-CSE-MsgGUID: OfzW5luTTWKwJe7IbCBsTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="104361203"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 09 Jan 2025 10:20:52 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tVx9F-000HzD-2t;
	Thu, 09 Jan 2025 18:20:49 +0000
Date: Fri, 10 Jan 2025 02:20:31 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:for-v6.14] BUILD SUCCESS
 53036937a101b5faeaf98e7438555fa854a1a844
Message-ID: <202501100225.DyRk8dsu-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git for-v6.14
branch HEAD: 53036937a101b5faeaf98e7438555fa854a1a844  m68k: vga: Fix I/O defines

elapsed time: 1451m

configs tested: 213
configs skipped: 10

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-20
alpha                            allyesconfig    gcc-14.2.0
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    clang-18
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    clang-18
arc                                 defconfig    gcc-14.2.0
arc                            hsdk_defconfig    gcc-13.2.0
arc                   randconfig-001-20250109    clang-20
arc                   randconfig-001-20250109    gcc-13.2.0
arc                   randconfig-002-20250109    clang-20
arc                   randconfig-002-20250109    gcc-13.2.0
arm                              allmodconfig    clang-18
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    clang-18
arm                       aspeed_g4_defconfig    gcc-13.2.0
arm                        clps711x_defconfig    gcc-13.2.0
arm                                 defconfig    gcc-14.2.0
arm                           imxrt_defconfig    gcc-14.2.0
arm                       multi_v4t_defconfig    gcc-14.2.0
arm                   randconfig-001-20250109    clang-20
arm                   randconfig-001-20250109    gcc-14.2.0
arm                   randconfig-002-20250109    clang-17
arm                   randconfig-002-20250109    clang-20
arm                   randconfig-003-20250109    clang-20
arm                   randconfig-004-20250109    clang-20
arm                   randconfig-004-20250109    gcc-14.2.0
arm                         s5pv210_defconfig    gcc-13.2.0
arm                           sama5_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                               defconfig    gcc-14.2.0
arm64                 randconfig-001-20250109    clang-20
arm64                 randconfig-001-20250109    gcc-14.2.0
arm64                 randconfig-002-20250109    clang-20
arm64                 randconfig-003-20250109    clang-20
arm64                 randconfig-003-20250109    gcc-14.2.0
arm64                 randconfig-004-20250109    clang-20
arm64                 randconfig-004-20250109    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20250109    gcc-14.2.0
csky                  randconfig-002-20250109    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-18
hexagon                          allyesconfig    clang-20
hexagon                             defconfig    gcc-14.2.0
hexagon               randconfig-001-20250109    clang-14
hexagon               randconfig-001-20250109    gcc-14.2.0
hexagon               randconfig-002-20250109    clang-20
hexagon               randconfig-002-20250109    gcc-14.2.0
i386                             allmodconfig    clang-19
i386                              allnoconfig    clang-19
i386                             allyesconfig    clang-19
i386        buildonly-randconfig-001-20250109    clang-19
i386        buildonly-randconfig-001-20250109    gcc-12
i386        buildonly-randconfig-002-20250109    clang-19
i386        buildonly-randconfig-002-20250109    gcc-12
i386        buildonly-randconfig-003-20250109    clang-19
i386        buildonly-randconfig-004-20250109    clang-19
i386        buildonly-randconfig-005-20250109    clang-19
i386        buildonly-randconfig-006-20250109    clang-19
i386        buildonly-randconfig-006-20250109    gcc-12
i386                                defconfig    clang-19
i386                  randconfig-001-20250109    gcc-12
i386                  randconfig-002-20250109    gcc-12
i386                  randconfig-003-20250109    gcc-12
i386                  randconfig-004-20250109    gcc-12
i386                  randconfig-005-20250109    gcc-12
i386                  randconfig-006-20250109    gcc-12
i386                  randconfig-007-20250109    gcc-12
i386                  randconfig-011-20250109    clang-19
i386                  randconfig-012-20250109    clang-19
i386                  randconfig-013-20250109    clang-19
i386                  randconfig-014-20250109    clang-19
i386                  randconfig-015-20250109    clang-19
i386                  randconfig-016-20250109    clang-19
i386                  randconfig-017-20250109    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch                           defconfig    gcc-14.2.0
loongarch             randconfig-001-20250109    gcc-14.2.0
loongarch             randconfig-002-20250109    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                                defconfig    gcc-14.2.0
m68k                            q40_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                          defconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20250109    gcc-14.2.0
nios2                 randconfig-002-20250109    gcc-14.2.0
openrisc                          allnoconfig    clang-20
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-20
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20250109    gcc-14.2.0
parisc                randconfig-002-20250109    gcc-14.2.0
parisc64                            defconfig    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-20
powerpc                          allyesconfig    clang-16
powerpc                          allyesconfig    gcc-14.2.0
powerpc                      arches_defconfig    gcc-13.2.0
powerpc                      ep88xc_defconfig    gcc-14.2.0
powerpc               mpc834x_itxgp_defconfig    gcc-14.2.0
powerpc                      ppc64e_defconfig    gcc-13.2.0
powerpc               randconfig-001-20250109    clang-15
powerpc               randconfig-001-20250109    gcc-14.2.0
powerpc               randconfig-002-20250109    gcc-14.2.0
powerpc               randconfig-003-20250109    gcc-14.2.0
powerpc64             randconfig-001-20250109    gcc-14.2.0
powerpc64             randconfig-002-20250109    clang-20
powerpc64             randconfig-002-20250109    gcc-14.2.0
powerpc64             randconfig-003-20250109    clang-17
powerpc64             randconfig-003-20250109    gcc-14.2.0
riscv                            allmodconfig    clang-20
riscv                            allmodconfig    gcc-14.2.0
riscv                             allnoconfig    clang-20
riscv                            allyesconfig    clang-20
riscv                            allyesconfig    gcc-14.2.0
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20250109    gcc-12
riscv                 randconfig-001-20250109    gcc-14.2.0
riscv                 randconfig-002-20250109    clang-15
riscv                 randconfig-002-20250109    gcc-12
s390                             allmodconfig    clang-19
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20250109    gcc-12
s390                  randconfig-001-20250109    gcc-14.2.0
s390                  randconfig-002-20250109    clang-16
s390                  randconfig-002-20250109    gcc-12
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-12
sh                ecovec24-romimage_defconfig    gcc-14.2.0
sh                    randconfig-001-20250109    gcc-12
sh                    randconfig-001-20250109    gcc-14.2.0
sh                    randconfig-002-20250109    gcc-12
sh                    randconfig-002-20250109    gcc-14.2.0
sh                           se7780_defconfig    gcc-13.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250109    gcc-12
sparc                 randconfig-001-20250109    gcc-14.2.0
sparc                 randconfig-002-20250109    gcc-12
sparc                 randconfig-002-20250109    gcc-14.2.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250109    gcc-12
sparc64               randconfig-001-20250109    gcc-14.2.0
sparc64               randconfig-002-20250109    gcc-12
sparc64               randconfig-002-20250109    gcc-14.2.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250109    gcc-12
um                    randconfig-002-20250109    gcc-12
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250109    clang-19
x86_64      buildonly-randconfig-002-20250109    clang-19
x86_64      buildonly-randconfig-002-20250109    gcc-12
x86_64      buildonly-randconfig-003-20250109    clang-19
x86_64      buildonly-randconfig-004-20250109    clang-19
x86_64      buildonly-randconfig-005-20250109    clang-19
x86_64      buildonly-randconfig-006-20250109    clang-19
x86_64      buildonly-randconfig-006-20250109    gcc-12
x86_64                              defconfig    clang-19
x86_64                                  kexec    clang-19
x86_64                randconfig-001-20250109    clang-19
x86_64                randconfig-002-20250109    clang-19
x86_64                randconfig-003-20250109    clang-19
x86_64                randconfig-004-20250109    clang-19
x86_64                randconfig-005-20250109    clang-19
x86_64                randconfig-006-20250109    clang-19
x86_64                randconfig-007-20250109    clang-19
x86_64                randconfig-008-20250109    clang-19
x86_64                randconfig-071-20250109    gcc-12
x86_64                randconfig-072-20250109    gcc-12
x86_64                randconfig-073-20250109    gcc-12
x86_64                randconfig-074-20250109    gcc-12
x86_64                randconfig-075-20250109    gcc-12
x86_64                randconfig-076-20250109    gcc-12
x86_64                randconfig-077-20250109    gcc-12
x86_64                randconfig-078-20250109    gcc-12
x86_64                               rhel-9.4    clang-19
x86_64                           rhel-9.4-bpf    clang-19
x86_64                         rhel-9.4-kunit    clang-19
x86_64                           rhel-9.4-ltp    clang-19
x86_64                          rhel-9.4-rust    clang-19
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250109    gcc-12
xtensa                randconfig-001-20250109    gcc-14.2.0
xtensa                randconfig-002-20250109    gcc-12
xtensa                randconfig-002-20250109    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
