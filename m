Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C95FE54B
	for <linux-m68k@lists.linux-m68k.org>; Tue, 20 Jan 2026 00:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768869451; cv=none; b=lx1Mc7TQe3NBFgLh5RgniczkxlyKw1PJev28klHGEjt97WYsizpuGtY0Dvr1CynKTp3s+Mwg+uitB0V6uY8bothvOvmzsBuIJG9prcOYRSIuztGMqvQNT9NXuH3uhhQc4dVwOqtbdtC61zNDGLG1184GElnnQ7Y8m3t+FOKsYCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768869451; c=relaxed/simple;
	bh=jMAyZexOu5VmXbQSLl+k11CbA8Px7XVEUkkpZoKq3Zc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tZGBhGYu7voMjBGY3Mas1SpxWmkuCEsdpbWHrSU37f60mNPYjbdl9gdnCtlTgSaRqIrQmVSM/z5YHrhQd8UAVN/kzTKNv1qPflu0nn9T8mNKhAKFLYTesOOLF5jAGsVyWuAw47K0IU7SKSXC+ceADv/TQfcNG0uUz0oIFaaHmFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bauRa8yC; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bauRa8yC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768869449; x=1800405449;
  h=date:from:to:cc:subject:message-id;
  bh=jMAyZexOu5VmXbQSLl+k11CbA8Px7XVEUkkpZoKq3Zc=;
  b=bauRa8yC5UvzqDngVcNUFMtVGcJ3SdygiYiWO6qIpCQcAu0EMeuWkz5E
   qtXO1TgYkdv8PSrksi3YUvXfrIEst29G6wL6yRgKv7pBI0hJlp7uxwX+R
   Sbgl/+SXFW4Xe3RIvMER1ejPusdD+itexhTgEIP/uEOJf1sJj52gQiJfF
   inQy1C1EvFlKqRBd5PPCMZxl2T926ml+bDms0tFqmY5eJ4GZsC9YJ76ZP
   BsC31KaYbM58AkcXGbVWoLNXcubKloyZaKpm23anTjWpe9AiVGfnSvMrz
   zLPcv1iKLATgJNd8JnOH2Wm9RABuMiwczj9YP6AEns+bt8os11bW8gpH6
   Q==;
X-CSE-ConnectionGUID: 87KII8HoRumX/lhOZaiBhQ==
X-CSE-MsgGUID: zNQ1YIUJReerRNeyrpUY8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="70127265"
X-IronPort-AV: E=Sophos;i="6.21,239,1763452800"; 
   d="scan'208";a="70127265"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 16:37:28 -0800
X-CSE-ConnectionGUID: BVdZ2limRFeUxihXYGNLYA==
X-CSE-MsgGUID: q0yc7gZuQt+LRG/MlfJR8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,239,1763452800"; 
   d="scan'208";a="236657123"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 19 Jan 2026 16:37:26 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vhzkK-00000000OQD-12yk;
	Tue, 20 Jan 2026 00:37:24 +0000
Date: Tue, 20 Jan 2026 08:36:32 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:master] BUILD SUCCESS
 889df66a8ef7752ff77c8f273a798edee0261317
Message-ID: <202601200826.KNzastGC-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git master
branch HEAD: 889df66a8ef7752ff77c8f273a798edee0261317  Merge tag 'v6.19-rc6'

elapsed time: 797m

configs tested: 317
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    clang-16
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    clang-22
arc                              allyesconfig    gcc-15.2.0
arc                                 defconfig    gcc-15.2.0
arc                 nsimosci_hs_smp_defconfig    gcc-15.2.0
arc                   randconfig-001-20260119    gcc-14.3.0
arc                   randconfig-001-20260120    clang-22
arc                   randconfig-002-20260119    gcc-14.3.0
arc                   randconfig-002-20260120    clang-22
arm                               allnoconfig    clang-22
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                     am200epdkit_defconfig    clang-18
arm                       aspeed_g5_defconfig    gcc-15.2.0
arm                         bcm2835_defconfig    clang-16
arm                         bcm2835_defconfig    gcc-15.2.0
arm                     davinci_all_defconfig    clang-22
arm                                 defconfig    gcc-15.2.0
arm                          exynos_defconfig    clang-18
arm                          gemini_defconfig    gcc-15.2.0
arm                            hisi_defconfig    clang-22
arm                       multi_v4t_defconfig    clang-22
arm                          pxa3xx_defconfig    clang-22
arm                   randconfig-001-20260119    gcc-14.3.0
arm                   randconfig-001-20260120    clang-22
arm                   randconfig-002-20260119    gcc-14.3.0
arm                   randconfig-002-20260120    clang-22
arm                   randconfig-003-20260119    gcc-14.3.0
arm                   randconfig-003-20260120    clang-22
arm                   randconfig-004-20260119    gcc-14.3.0
arm                   randconfig-004-20260120    clang-22
arm                           sama5_defconfig    gcc-15.2.0
arm                          sp7021_defconfig    clang-16
arm64                            allmodconfig    clang-19
arm64                            allmodconfig    clang-22
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260119    clang-19
arm64                 randconfig-001-20260120    gcc-15.2.0
arm64                 randconfig-002-20260119    clang-19
arm64                 randconfig-002-20260120    gcc-15.2.0
arm64                 randconfig-003-20260119    clang-19
arm64                 randconfig-003-20260120    gcc-15.2.0
arm64                 randconfig-004-20260119    clang-19
arm64                 randconfig-004-20260120    gcc-15.2.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260119    clang-19
csky                  randconfig-001-20260120    gcc-15.2.0
csky                  randconfig-002-20260119    clang-19
csky                  randconfig-002-20260120    gcc-15.2.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    clang-22
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260119    clang-18
hexagon               randconfig-001-20260120    gcc-12.5.0
hexagon               randconfig-002-20260119    clang-18
hexagon               randconfig-002-20260120    gcc-12.5.0
i386                             allmodconfig    clang-20
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20260119    clang-20
i386        buildonly-randconfig-001-20260120    gcc-14
i386        buildonly-randconfig-002-20260119    clang-20
i386        buildonly-randconfig-002-20260120    gcc-14
i386        buildonly-randconfig-003-20260119    clang-20
i386        buildonly-randconfig-003-20260120    gcc-14
i386        buildonly-randconfig-004-20260119    clang-20
i386        buildonly-randconfig-004-20260120    gcc-14
i386        buildonly-randconfig-005-20260119    clang-20
i386        buildonly-randconfig-005-20260120    gcc-14
i386        buildonly-randconfig-006-20260119    clang-20
i386        buildonly-randconfig-006-20260120    gcc-14
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260119    gcc-13
i386                  randconfig-001-20260120    clang-20
i386                  randconfig-002-20260119    gcc-13
i386                  randconfig-002-20260120    clang-20
i386                  randconfig-003-20260119    gcc-13
i386                  randconfig-003-20260120    clang-20
i386                  randconfig-004-20260119    gcc-13
i386                  randconfig-004-20260120    clang-20
i386                  randconfig-005-20260119    gcc-13
i386                  randconfig-005-20260120    clang-20
i386                  randconfig-006-20260119    gcc-13
i386                  randconfig-006-20260120    clang-20
i386                  randconfig-007-20260119    gcc-13
i386                  randconfig-007-20260120    clang-20
i386                  randconfig-011-20260119    gcc-14
i386                  randconfig-011-20260120    clang-20
i386                  randconfig-012-20260119    gcc-14
i386                  randconfig-012-20260120    clang-20
i386                  randconfig-013-20260119    gcc-14
i386                  randconfig-013-20260120    clang-20
i386                  randconfig-014-20260119    gcc-14
i386                  randconfig-014-20260120    clang-20
i386                  randconfig-015-20260119    gcc-14
i386                  randconfig-015-20260120    clang-20
i386                  randconfig-016-20260119    gcc-14
i386                  randconfig-016-20260120    clang-20
i386                  randconfig-017-20260119    gcc-14
i386                  randconfig-017-20260120    clang-20
loongarch                        allmodconfig    clang-19
loongarch                        allmodconfig    clang-22
loongarch                         allnoconfig    clang-22
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch                loongson64_defconfig    clang-16
loongarch             randconfig-001-20260119    clang-18
loongarch             randconfig-001-20260120    gcc-12.5.0
loongarch             randconfig-002-20260119    clang-18
loongarch             randconfig-002-20260120    gcc-12.5.0
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                         amcore_defconfig    gcc-15.2.0
m68k                                defconfig    clang-19
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
mips                     cu1830-neo_defconfig    gcc-15.2.0
mips                            gpr_defconfig    clang-18
mips                           ip22_defconfig    clang-16
mips                           ip22_defconfig    clang-22
mips                       lemote2f_defconfig    clang-16
mips                      loongson3_defconfig    clang-22
mips                    maltaup_xpa_defconfig    gcc-15.2.0
mips                          rb532_defconfig    clang-22
mips                           xway_defconfig    gcc-15.2.0
nios2                            allmodconfig    clang-22
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260119    clang-18
nios2                 randconfig-001-20260120    gcc-12.5.0
nios2                 randconfig-002-20260119    clang-18
nios2                 randconfig-002-20260120    gcc-12.5.0
openrisc                         allmodconfig    clang-22
openrisc                         allmodconfig    gcc-15.2.0
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.2.0
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.2.0
parisc                           allyesconfig    clang-19
parisc                           allyesconfig    gcc-15.2.0
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260119    clang-22
parisc                randconfig-001-20260120    gcc-8.5.0
parisc                randconfig-002-20260119    clang-22
parisc                randconfig-002-20260120    gcc-8.5.0
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.2.0
powerpc                    amigaone_defconfig    clang-22
powerpc                     asp8347_defconfig    clang-22
powerpc                 canyonlands_defconfig    clang-22
powerpc                   currituck_defconfig    gcc-15.2.0
powerpc                       eiger_defconfig    clang-16
powerpc                    gamecube_defconfig    gcc-15.2.0
powerpc                      katmai_defconfig    clang-18
powerpc                   motionpro_defconfig    clang-22
powerpc                 mpc834x_itx_defconfig    clang-16
powerpc                  mpc885_ads_defconfig    clang-22
powerpc                  mpc885_ads_defconfig    gcc-15.2.0
powerpc               randconfig-001-20260119    clang-22
powerpc               randconfig-001-20260120    gcc-8.5.0
powerpc               randconfig-002-20260119    clang-22
powerpc               randconfig-002-20260120    gcc-8.5.0
powerpc                  storcenter_defconfig    clang-16
powerpc                     tqm5200_defconfig    clang-22
powerpc                         wii_defconfig    clang-18
powerpc64             randconfig-001-20260119    clang-22
powerpc64             randconfig-001-20260120    gcc-8.5.0
powerpc64             randconfig-002-20260119    clang-22
powerpc64             randconfig-002-20260120    gcc-8.5.0
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                    nommu_virt_defconfig    clang-22
riscv                 randconfig-001-20260119    gcc-15.2.0
riscv                 randconfig-001-20260120    gcc-13.4.0
riscv                 randconfig-002-20260119    gcc-15.2.0
riscv                 randconfig-002-20260120    gcc-13.4.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260119    gcc-15.2.0
s390                  randconfig-001-20260120    gcc-13.4.0
s390                  randconfig-002-20260119    gcc-15.2.0
s390                  randconfig-002-20260120    gcc-13.4.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-22
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    clang-19
sh                               allyesconfig    gcc-15.2.0
sh                                  defconfig    gcc-14
sh                            migor_defconfig    gcc-15.2.0
sh                    randconfig-001-20260119    gcc-15.2.0
sh                    randconfig-001-20260120    gcc-13.4.0
sh                    randconfig-002-20260119    gcc-15.2.0
sh                    randconfig-002-20260120    gcc-13.4.0
sh                           se7722_defconfig    gcc-15.2.0
sh                     sh7710voipgw_defconfig    gcc-15.2.0
sparc                             allnoconfig    clang-22
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260119    gcc-14.3.0
sparc                 randconfig-001-20260120    gcc-8.5.0
sparc                 randconfig-002-20260119    gcc-14.3.0
sparc                 randconfig-002-20260120    gcc-8.5.0
sparc                       sparc32_defconfig    clang-18
sparc64                          alldefconfig    clang-22
sparc64                          allmodconfig    clang-22
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260119    gcc-14.3.0
sparc64               randconfig-001-20260120    gcc-8.5.0
sparc64               randconfig-002-20260119    gcc-14.3.0
sparc64               randconfig-002-20260120    gcc-8.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260119    gcc-14.3.0
um                    randconfig-001-20260120    gcc-8.5.0
um                    randconfig-002-20260119    gcc-14.3.0
um                    randconfig-002-20260120    gcc-8.5.0
um                           x86_64_defconfig    clang-18
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-22
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260119    gcc-14
x86_64      buildonly-randconfig-001-20260120    gcc-14
x86_64      buildonly-randconfig-002-20260119    gcc-14
x86_64      buildonly-randconfig-002-20260120    gcc-14
x86_64      buildonly-randconfig-003-20260119    gcc-14
x86_64      buildonly-randconfig-003-20260120    gcc-14
x86_64      buildonly-randconfig-004-20260119    gcc-14
x86_64      buildonly-randconfig-004-20260120    gcc-14
x86_64      buildonly-randconfig-005-20260119    gcc-14
x86_64      buildonly-randconfig-005-20260120    gcc-14
x86_64      buildonly-randconfig-006-20260119    gcc-14
x86_64      buildonly-randconfig-006-20260120    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260119    gcc-14
x86_64                randconfig-001-20260120    gcc-14
x86_64                randconfig-002-20260119    gcc-14
x86_64                randconfig-002-20260120    gcc-14
x86_64                randconfig-003-20260119    gcc-14
x86_64                randconfig-003-20260120    gcc-14
x86_64                randconfig-004-20260119    gcc-14
x86_64                randconfig-004-20260120    gcc-14
x86_64                randconfig-005-20260119    gcc-14
x86_64                randconfig-005-20260120    gcc-14
x86_64                randconfig-006-20260119    gcc-14
x86_64                randconfig-006-20260120    gcc-14
x86_64                randconfig-011-20260119    clang-20
x86_64                randconfig-011-20260120    gcc-14
x86_64                randconfig-012-20260119    clang-20
x86_64                randconfig-012-20260120    gcc-14
x86_64                randconfig-013-20260119    clang-20
x86_64                randconfig-013-20260120    gcc-14
x86_64                randconfig-014-20260119    clang-20
x86_64                randconfig-014-20260120    gcc-14
x86_64                randconfig-015-20260119    clang-20
x86_64                randconfig-015-20260120    gcc-14
x86_64                randconfig-016-20260119    clang-20
x86_64                randconfig-016-20260120    gcc-14
x86_64                randconfig-071-20260119    clang-20
x86_64                randconfig-071-20260120    gcc-14
x86_64                randconfig-072-20260119    clang-20
x86_64                randconfig-072-20260120    gcc-14
x86_64                randconfig-073-20260119    clang-20
x86_64                randconfig-073-20260120    gcc-14
x86_64                randconfig-074-20260119    clang-20
x86_64                randconfig-074-20260120    gcc-14
x86_64                randconfig-075-20260119    clang-20
x86_64                randconfig-075-20260120    gcc-14
x86_64                randconfig-076-20260119    clang-20
x86_64                randconfig-076-20260120    gcc-14
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
xtensa                randconfig-001-20260119    gcc-14.3.0
xtensa                randconfig-001-20260120    gcc-8.5.0
xtensa                randconfig-002-20260119    gcc-14.3.0
xtensa                randconfig-002-20260120    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
