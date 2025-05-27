Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AB3315A85E
	for <linux-m68k@lists.linux-m68k.org>; Tue, 27 May 2025 04:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748318906; cv=none; b=BSSKsdxios5zB4CcFXhh1ZA+ZqLulhvKNdRjKst45w9C5UXaWReLbNHESYj1GYbk3BLO7fE3nIi5hfvUBCg3bmFRzEQwF/N3jxk5aHmn0+/2/3/AM5MWviYaONzjZRWG42mITQdXuWqD6c/1klQNxvaae32lwV5d051dJNSpPLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748318906; c=relaxed/simple;
	bh=juKK84VwHSo6wtqX5hGEzDqsgogmIuWyyVPxXEFQawY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ib4wuvIebWVG6DPJr++71LT45RQN13FIRxfs8lkZ4BbnK3iU6ZiZBtQj5XizTStDeyPoCj/jFK7WTrDLl+5+abX9B1FqpPsjrHG60VhU6JEyptmaNLjVT+m+aDThA3fmCPyhfEYLNhVujvyRxvO3huza4PEtSjmgjuKXU0eAabs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NZ2TcFis; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NZ2TcFis"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748318906; x=1779854906;
  h=date:from:to:cc:subject:message-id;
  bh=juKK84VwHSo6wtqX5hGEzDqsgogmIuWyyVPxXEFQawY=;
  b=NZ2TcFisJK88/u++5jHcoPdQTeCx65B+llokQ6kQUu4SaGWd9RPN/pIF
   8XqKCkbsrTSzpL0DVa5XP0xJohQIEBeUN+jeE3z6pqb0AKDa4lLTkL10w
   ZJ3G2c0tW62EhEiMfY6BmKNi1LAlvE6JWSSqmO5Mj6rcasAiFjd9p7IOo
   /thOmchXZQ8Snf8vJCtD2c+gh1za7ZAh1CqlFFwh2g6JEWKeKQ8YjWSqz
   t6GTx1aIJbe2hE3CN+jkdBawxQsghcDH198AnxAnrAsQkx5mNKDUP5obq
   a4BZTX4E2AlUUaxr5PXtjoyF9f/6ZFXKECPyL1eG9Eb2/rAZSHDNQh5ft
   Q==;
X-CSE-ConnectionGUID: LlItW9U4TvWmSVNNyQG8pg==
X-CSE-MsgGUID: dzxL+hMARGOwRq9XvFNKcg==
X-IronPort-AV: E=McAfee;i="6700,10204,11445"; a="54095786"
X-IronPort-AV: E=Sophos;i="6.15,317,1739865600"; 
   d="scan'208";a="54095786"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2025 21:08:24 -0700
X-CSE-ConnectionGUID: E2YR+tNXRjmkAEPp6WpA+w==
X-CSE-MsgGUID: DjQ8ltPlQ529xH1Rw5d20A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,317,1739865600"; 
   d="scan'208";a="142983540"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 26 May 2025 21:08:22 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uJlbw-000SsW-1g;
	Tue, 27 May 2025 04:08:20 +0000
Date: Tue, 27 May 2025 12:07:38 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:m68k-v6.15] BUILD SUCCESS
 fa99129a56a325712276f4c0113a12c37432c010
Message-ID: <202505271228.GAUaPws9-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git m68k-v6.15
branch HEAD: fa99129a56a325712276f4c0113a12c37432c010  m68k: defconfig: Enable Atari EtherNAT and NetUSBee USB support

elapsed time: 854m

configs tested: 158
configs skipped: 8

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-14.2.0
arc                     nsimosci_hs_defconfig    gcc-14.2.0
arc                   randconfig-001-20250527    gcc-10.5.0
arc                   randconfig-002-20250527    gcc-10.5.0
arc                    vdk_hs38_smp_defconfig    clang-21
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-21
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    gcc-14.2.0
arm                       omap2plus_defconfig    gcc-14.2.0
arm                   randconfig-001-20250527    clang-21
arm                   randconfig-002-20250527    gcc-7.5.0
arm                   randconfig-003-20250527    clang-19
arm                   randconfig-004-20250527    clang-21
arm                         s5pv210_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250527    gcc-8.5.0
arm64                 randconfig-002-20250527    gcc-8.5.0
arm64                 randconfig-003-20250527    clang-16
arm64                 randconfig-004-20250527    gcc-6.5.0
csky                             alldefconfig    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250526    gcc-9.3.0
csky                  randconfig-002-20250526    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-21
hexagon               randconfig-002-20250526    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250526    gcc-12
i386        buildonly-randconfig-002-20250526    clang-20
i386        buildonly-randconfig-003-20250526    clang-20
i386        buildonly-randconfig-004-20250526    gcc-12
i386        buildonly-randconfig-006-20250526    gcc-12
i386                                defconfig    clang-20
i386                  randconfig-011-20250527    gcc-12
i386                  randconfig-012-20250527    gcc-12
i386                  randconfig-013-20250527    gcc-12
i386                  randconfig-014-20250527    gcc-12
i386                  randconfig-015-20250527    gcc-12
i386                  randconfig-016-20250527    gcc-12
i386                  randconfig-017-20250527    gcc-12
loongarch                        alldefconfig    clang-21
loongarch                        alldefconfig    gcc-14.2.0
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250526    gcc-15.1.0
loongarch             randconfig-002-20250526    gcc-15.1.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                        m5407c3_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                        bcm63xx_defconfig    clang-21
mips                           ip30_defconfig    gcc-14.2.0
mips                        qi_lb60_defconfig    clang-21
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250526    gcc-5.5.0
nios2                 randconfig-002-20250526    gcc-9.3.0
openrisc                          allnoconfig    clang-21
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                           alldefconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-21
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250526    gcc-6.5.0
parisc                randconfig-002-20250526    gcc-8.5.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-21
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-21
powerpc                   bluestone_defconfig    clang-21
powerpc                      cm5200_defconfig    clang-21
powerpc                     mpc5200_defconfig    clang-21
powerpc                 mpc834x_itx_defconfig    clang-16
powerpc                  mpc866_ads_defconfig    gcc-14.2.0
powerpc                      pcm030_defconfig    clang-21
powerpc               randconfig-001-20250526    clang-21
powerpc               randconfig-002-20250526    clang-18
powerpc               randconfig-003-20250526    clang-21
powerpc                     stx_gp3_defconfig    gcc-14.2.0
powerpc                     tqm5200_defconfig    gcc-14.2.0
powerpc64             randconfig-001-20250526    gcc-7.5.0
powerpc64             randconfig-002-20250526    gcc-7.5.0
powerpc64             randconfig-003-20250526    clang-21
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-21
riscv                 randconfig-001-20250526    clang-21
riscv                 randconfig-002-20250526    clang-16
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250526    clang-18
s390                  randconfig-002-20250526    clang-21
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                         ap325rxa_defconfig    gcc-14.2.0
sh                                  defconfig    gcc-14.2.0
sh                        edosk7705_defconfig    gcc-14.2.0
sh                 kfr2r09-romimage_defconfig    gcc-14.2.0
sh                     magicpanelr2_defconfig    gcc-14.2.0
sh                          r7780mp_defconfig    gcc-14.2.0
sh                    randconfig-001-20250526    gcc-11.5.0
sh                    randconfig-002-20250526    gcc-7.5.0
sh                          rsk7203_defconfig    clang-21
sh                           sh2007_defconfig    clang-21
sh                            titan_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250526    gcc-14.2.0
sparc                 randconfig-002-20250526    gcc-14.2.0
sparc                       sparc32_defconfig    gcc-14.2.0
sparc64               randconfig-001-20250526    gcc-14.2.0
sparc64               randconfig-002-20250526    gcc-14.2.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                    randconfig-001-20250526    clang-21
um                    randconfig-002-20250526    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250526    gcc-12
x86_64      buildonly-randconfig-002-20250526    gcc-12
x86_64      buildonly-randconfig-004-20250526    gcc-12
x86_64      buildonly-randconfig-005-20250526    gcc-12
x86_64      buildonly-randconfig-006-20250526    gcc-12
x86_64                              defconfig    gcc-11
x86_64                randconfig-001-20250527    clang-20
x86_64                randconfig-002-20250527    clang-20
x86_64                randconfig-003-20250527    clang-20
x86_64                randconfig-004-20250527    clang-20
x86_64                randconfig-005-20250527    clang-20
x86_64                randconfig-006-20250527    clang-20
x86_64                randconfig-007-20250527    clang-20
x86_64                randconfig-008-20250527    clang-20
x86_64                          rhel-9.4-rust    clang-18
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250526    gcc-12.4.0
xtensa                randconfig-002-20250526    gcc-10.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
