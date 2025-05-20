Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA09F265CC0
	for <linux-m68k@lists.linux-m68k.org>; Tue, 20 May 2025 08:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747731257; cv=none; b=irB1xEaZ7iuQa97Yb0tLwnoPsEzrurupBo6zbYqdLxSOqV4VsMOwLv79eUTHdBK8tLfg25Ch0fP7nw6NHX1WnBqfZcEREOLiZNFYDD+lbtvbAVDus3rm4YLzSuPMUT7yYIPvL8TtfjwrXQKxXEVuZdEFb7qnmJYMo5gShvJBY/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747731257; c=relaxed/simple;
	bh=/PKBAZ56B3F/T4N4INZN2VRPEx8yTBa0XLg4y/rrPLE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=f5iof5QHHLjjOW1IO1lmWnUsKfgvFDhImzSYM3MfaOScGYyhNcLV8mGY+V2mImtcdcpF1OGhGJPo5w0UThgJCGjPQStI82jtTSbjpzg+pP/5by0uGBXBL1yWgNF6brz51/OmOhfh+Nx6HG7tOE+FRLkX6csRaJq6NafWK9GIuTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K5fxBVSY; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K5fxBVSY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747731255; x=1779267255;
  h=date:from:to:cc:subject:message-id;
  bh=/PKBAZ56B3F/T4N4INZN2VRPEx8yTBa0XLg4y/rrPLE=;
  b=K5fxBVSYrP4W/QBadAwo0A/zyVhw7T4ycichmSKun6QDDprfaJ2YPK/g
   B7IX+wtP0nQpYoJN/D/kUqRSJ/8zrpXrxN+3o+wIiYj8siaq0Gg6pmOwI
   VsPIu3wjzxirrsvmXTasVlMrWHGVFQAsXDVlpAGmV1dmYTOsWpC5wSKcw
   t/cLAngLMNTFal4rluS4OXUbe5govgbBL5RkThf7Kql83NZ74Jdpt5RAS
   npaFopWmUDQBuL1bTpahQ3xKpwNFEqQtJQQJtUJYNjifZrOPisnazxpdA
   XjCZfU7PnTieS4mrcVtWjGuoF0ZTUK7juKh+IULFkvmWlV98zZNn1EsJH
   A==;
X-CSE-ConnectionGUID: hQ40SH+UTOeNuyVlw3A41g==
X-CSE-MsgGUID: 0c4Q2cqYSeCVnQvyW3KXeA==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="60290492"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="60290492"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 01:54:12 -0700
X-CSE-ConnectionGUID: NKdPFqL3TEWVKJrZA4ln9g==
X-CSE-MsgGUID: QBwdE4SZSIOPUsrXMd9/5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="140048731"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 20 May 2025 01:54:11 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHIjg-000MM8-2x;
	Tue, 20 May 2025 08:54:08 +0000
Date: Tue, 20 May 2025 16:53:59 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:master] BUILD SUCCESS
 0b73fc5c4e098936e8ed968c0e9c14c9ecfd64b9
Message-ID: <202505201649.rY3DW1yJ-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git master
branch HEAD: 0b73fc5c4e098936e8ed968c0e9c14c9ecfd64b9  Merge tag 'v6.15-rc7'

elapsed time: 1262m

configs tested: 248
configs skipped: 14

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-19
alpha                            allyesconfig    gcc-14.2.0
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    clang-19
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    clang-19
arc                          axs101_defconfig    gcc-14.2.0
arc                                 defconfig    gcc-14.2.0
arc                   randconfig-001-20250519    gcc-12.4.0
arc                   randconfig-001-20250520    gcc-8.5.0
arc                   randconfig-002-20250519    gcc-8.5.0
arc                   randconfig-002-20250520    gcc-8.5.0
arm                              allmodconfig    clang-19
arm                               allnoconfig    clang-21
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    clang-19
arm                         assabet_defconfig    gcc-14.2.0
arm                         bcm2835_defconfig    gcc-14.2.0
arm                                 defconfig    clang-21
arm                   milbeaut_m10v_defconfig    gcc-14.2.0
arm                       multi_v4t_defconfig    clang-16
arm                        mvebu_v5_defconfig    gcc-14.2.0
arm                        neponset_defconfig    gcc-14.2.0
arm                   randconfig-001-20250519    clang-18
arm                   randconfig-001-20250520    gcc-8.5.0
arm                   randconfig-002-20250519    clang-21
arm                   randconfig-002-20250520    gcc-8.5.0
arm                   randconfig-003-20250519    clang-20
arm                   randconfig-003-20250520    gcc-8.5.0
arm                   randconfig-004-20250519    clang-21
arm                   randconfig-004-20250520    gcc-8.5.0
arm                        realview_defconfig    gcc-14.2.0
arm                         s5pv210_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                               defconfig    gcc-14.2.0
arm64                 randconfig-001-20250519    clang-17
arm64                 randconfig-001-20250520    gcc-8.5.0
arm64                 randconfig-002-20250519    gcc-8.5.0
arm64                 randconfig-002-20250520    gcc-8.5.0
arm64                 randconfig-003-20250519    clang-19
arm64                 randconfig-003-20250520    gcc-8.5.0
arm64                 randconfig-004-20250519    gcc-8.5.0
arm64                 randconfig-004-20250520    gcc-8.5.0
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20250519    gcc-10.5.0
csky                  randconfig-001-20250520    gcc-9.3.0
csky                  randconfig-002-20250519    gcc-14.2.0
csky                  randconfig-002-20250520    gcc-9.3.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-21
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-21
hexagon                             defconfig    clang-21
hexagon               randconfig-001-20250519    clang-21
hexagon               randconfig-001-20250520    gcc-9.3.0
hexagon               randconfig-002-20250519    clang-21
hexagon               randconfig-002-20250520    gcc-9.3.0
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-20
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250519    clang-20
i386        buildonly-randconfig-001-20250520    gcc-12
i386        buildonly-randconfig-002-20250519    clang-20
i386        buildonly-randconfig-002-20250520    gcc-12
i386        buildonly-randconfig-003-20250519    gcc-12
i386        buildonly-randconfig-003-20250520    gcc-12
i386        buildonly-randconfig-004-20250519    gcc-12
i386        buildonly-randconfig-004-20250520    gcc-12
i386        buildonly-randconfig-005-20250519    gcc-12
i386        buildonly-randconfig-005-20250520    gcc-12
i386        buildonly-randconfig-006-20250519    clang-20
i386        buildonly-randconfig-006-20250520    gcc-12
i386                                defconfig    clang-20
i386                  randconfig-001-20250520    gcc-12
i386                  randconfig-002-20250520    gcc-12
i386                  randconfig-003-20250520    gcc-12
i386                  randconfig-004-20250520    gcc-12
i386                  randconfig-005-20250520    gcc-12
i386                  randconfig-006-20250520    gcc-12
i386                  randconfig-007-20250520    gcc-12
i386                  randconfig-011-20250520    gcc-12
i386                  randconfig-012-20250520    gcc-12
i386                  randconfig-013-20250520    gcc-12
i386                  randconfig-014-20250520    gcc-12
i386                  randconfig-015-20250520    gcc-12
i386                  randconfig-016-20250520    gcc-12
i386                  randconfig-017-20250520    gcc-12
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch                           defconfig    gcc-14.2.0
loongarch             randconfig-001-20250519    gcc-14.2.0
loongarch             randconfig-001-20250520    gcc-9.3.0
loongarch             randconfig-002-20250519    gcc-12.4.0
loongarch             randconfig-002-20250520    gcc-9.3.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                                defconfig    gcc-14.2.0
microblaze                       alldefconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                          defconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                         10m50_defconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20250519    gcc-14.2.0
nios2                 randconfig-001-20250520    gcc-9.3.0
nios2                 randconfig-002-20250519    gcc-6.5.0
nios2                 randconfig-002-20250520    gcc-9.3.0
openrisc                          allnoconfig    clang-21
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-12
openrisc                            defconfig    gcc-14.2.0
parisc                            allnoconfig    clang-21
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-12
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250519    gcc-7.5.0
parisc                randconfig-001-20250520    gcc-9.3.0
parisc                randconfig-002-20250519    gcc-13.3.0
parisc                randconfig-002-20250520    gcc-9.3.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-21
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-21
powerpc                    amigaone_defconfig    gcc-14.2.0
powerpc                      chrp32_defconfig    gcc-14.2.0
powerpc                       eiger_defconfig    gcc-14.2.0
powerpc                     ksi8560_defconfig    gcc-14.2.0
powerpc                   lite5200b_defconfig    gcc-14.2.0
powerpc                      pcm030_defconfig    gcc-14.2.0
powerpc                     ppa8548_defconfig    gcc-14.2.0
powerpc                      ppc6xx_defconfig    gcc-14.2.0
powerpc                     rainier_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250519    gcc-8.5.0
powerpc               randconfig-001-20250520    gcc-9.3.0
powerpc               randconfig-002-20250519    gcc-6.5.0
powerpc               randconfig-002-20250520    gcc-9.3.0
powerpc               randconfig-003-20250519    gcc-8.5.0
powerpc               randconfig-003-20250520    gcc-9.3.0
powerpc64             randconfig-001-20250519    clang-20
powerpc64             randconfig-001-20250520    gcc-9.3.0
powerpc64             randconfig-002-20250519    gcc-6.5.0
powerpc64             randconfig-002-20250520    gcc-9.3.0
powerpc64             randconfig-003-20250519    gcc-6.5.0
riscv                            alldefconfig    gcc-14.2.0
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-21
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20250519    gcc-14.2.0
riscv                 randconfig-002-20250519    clang-17
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-21
s390                                defconfig    gcc-12
s390                  randconfig-001-20250519    gcc-7.5.0
s390                  randconfig-002-20250519    gcc-9.3.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-12
sh                                  defconfig    gcc-14.2.0
sh                        dreamcast_defconfig    gcc-14.2.0
sh                         ecovec24_defconfig    gcc-14.2.0
sh                    randconfig-001-20250519    gcc-12.4.0
sh                    randconfig-002-20250519    gcc-14.2.0
sh                          sdk7786_defconfig    gcc-14.2.0
sh                          urquell_defconfig    gcc-14.2.0
sparc                            alldefconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250519    gcc-11.5.0
sparc                 randconfig-002-20250519    gcc-7.5.0
sparc64                             defconfig    gcc-12
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20250519    gcc-7.5.0
sparc64               randconfig-002-20250519    gcc-11.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250519    gcc-12
um                    randconfig-002-20250519    gcc-12
um                           x86_64_defconfig    clang-21
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250519    clang-20
x86_64      buildonly-randconfig-001-20250520    gcc-12
x86_64      buildonly-randconfig-002-20250519    gcc-12
x86_64      buildonly-randconfig-002-20250520    gcc-12
x86_64      buildonly-randconfig-003-20250519    clang-20
x86_64      buildonly-randconfig-003-20250520    gcc-12
x86_64      buildonly-randconfig-004-20250519    clang-20
x86_64      buildonly-randconfig-004-20250520    gcc-12
x86_64      buildonly-randconfig-005-20250519    gcc-12
x86_64      buildonly-randconfig-005-20250520    gcc-12
x86_64      buildonly-randconfig-006-20250519    gcc-12
x86_64      buildonly-randconfig-006-20250520    gcc-12
x86_64                              defconfig    clang-20
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250520    gcc-12
x86_64                randconfig-002-20250520    gcc-12
x86_64                randconfig-003-20250520    gcc-12
x86_64                randconfig-004-20250520    gcc-12
x86_64                randconfig-005-20250520    gcc-12
x86_64                randconfig-006-20250520    gcc-12
x86_64                randconfig-007-20250520    gcc-12
x86_64                randconfig-008-20250520    gcc-12
x86_64                randconfig-071-20250520    gcc-12
x86_64                randconfig-072-20250520    gcc-12
x86_64                randconfig-073-20250520    gcc-12
x86_64                randconfig-074-20250520    gcc-12
x86_64                randconfig-075-20250520    gcc-12
x86_64                randconfig-076-20250520    gcc-12
x86_64                randconfig-077-20250520    gcc-12
x86_64                randconfig-078-20250520    gcc-12
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-12
x86_64                         rhel-9.4-kunit    gcc-12
x86_64                           rhel-9.4-ltp    gcc-12
x86_64                          rhel-9.4-rust    clang-18
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-14.2.0
xtensa                       common_defconfig    gcc-14.2.0
xtensa                randconfig-001-20250519    gcc-7.5.0
xtensa                randconfig-002-20250519    gcc-9.3.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
