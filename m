Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 594091803D
	for <linux-m68k@lists.linux-m68k.org>; Sun, 18 Aug 2024 12:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723984152; cv=none; b=dN6w/sDlIbqwh2mjU2ovGHEm4PeiGd6Qpv0u39YTece+hP1TO7fMi+5qemXLiq0MCvF5Mr0bJS9M7Z5Jj8aR88r5Z6wNp0WU/D/Aqoy1uiDjc4ZOON84f0lDf6zVTaSMZED27oINi7+wpR9eG6cg4e43DsUEsOkbs7Rwm+mMrdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723984152; c=relaxed/simple;
	bh=LLbcUOK2J36VHU2kx0jKQ5hRyns6ZxchjjZQ8u6bdoo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HtfBbNexQExTVVz70Q8mbExpm6AFHaOCssUu/vXb5gM0DuW0dMvZSUccP+tr/gnjUC6+FvbUxsg1SCjKy3jgh2OBLObqazYabwphOCRxN3M9tvRkyBQT5EVw9UULLyVfBI03sd1Ph6i03M+i+DoJdopAQtZ9TgWE8MqH18oqyKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nDufr6Vf; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nDufr6Vf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723984151; x=1755520151;
  h=date:from:to:cc:subject:message-id;
  bh=LLbcUOK2J36VHU2kx0jKQ5hRyns6ZxchjjZQ8u6bdoo=;
  b=nDufr6VfEEnweSZR6UHm3tAx7mFzLQ+Z+qIDFfh9t/oZCMLDZfFSgIqk
   2GjLj177mZ9SKtalKRR7xYw5UHvPdS4zYX9hxWUCBfqyFOQnDUgTnbKMn
   nDWYUC7os83o32vZPxtVsliaYg9cOgdjHxtYgRTCj487mnJ3aP80UCghP
   eGg0eK2YF1U3HrZO+DlpCRYYSq/EoSuPiTzK3aWuMZToJKM1TC7Q4RJ1O
   ut/dK82DOoe8+uIRvtLN0ku451uZHuJdIApEpLAbKSKcv3qWVH0LKEnIs
   c4KIfd0QRfVH1aFom6HoAAIpp6P65G6ybsi4Qdwl0uu5c6HHUoot68xse
   g==;
X-CSE-ConnectionGUID: ElM2V17QRJqAYuNohrCHqg==
X-CSE-MsgGUID: ZQlvWmaFTpOkCWt/KASrjA==
X-IronPort-AV: E=McAfee;i="6700,10204,11168"; a="44753155"
X-IronPort-AV: E=Sophos;i="6.10,156,1719903600"; 
   d="scan'208";a="44753155"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2024 05:29:10 -0700
X-CSE-ConnectionGUID: y6iq0JVDRWe1sRnuoO0KDA==
X-CSE-MsgGUID: GMUZ/hmoQH+nQN2oINrLgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,156,1719903600"; 
   d="scan'208";a="64935474"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 18 Aug 2024 05:29:08 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sff1t-0008EV-2W;
	Sun, 18 Aug 2024 12:29:05 +0000
Date: Sun, 18 Aug 2024 20:28:19 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:master] BUILD SUCCESS
 68681f50a03534935bf648ee4b0c5f7022e45bee
Message-ID: <202408182017.ALKINZCV-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git master
branch HEAD: 68681f50a03534935bf648ee4b0c5f7022e45bee  Merge tag 'v6.11-rc3'

elapsed time: 1280m

configs tested: 253
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.2.0
alpha                             allnoconfig   gcc-13.3.0
alpha                            allyesconfig   gcc-13.3.0
alpha                               defconfig   gcc-13.2.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                                 defconfig   gcc-13.2.0
arc                         haps_hs_defconfig   gcc-13.2.0
arc                   randconfig-001-20240818   gcc-13.2.0
arc                   randconfig-002-20240818   gcc-13.2.0
arc                    vdk_hs38_smp_defconfig   gcc-13.2.0
arm                              allmodconfig   gcc-13.2.0
arm                              allmodconfig   gcc-14.1.0
arm                               allnoconfig   clang-20
arm                               allnoconfig   gcc-13.2.0
arm                              allyesconfig   gcc-13.2.0
arm                              allyesconfig   gcc-14.1.0
arm                                 defconfig   gcc-13.2.0
arm                          exynos_defconfig   clang-17
arm                            mps2_defconfig   gcc-13.2.0
arm                        mvebu_v5_defconfig   clang-17
arm                        mvebu_v7_defconfig   gcc-13.2.0
arm                             mxs_defconfig   clang-17
arm                   randconfig-001-20240818   clang-15
arm                   randconfig-002-20240818   gcc-14.1.0
arm                   randconfig-003-20240818   clang-20
arm                   randconfig-004-20240818   clang-20
arm                           sama7_defconfig   clang-20
arm                           tegra_defconfig   gcc-13.2.0
arm                           u8500_defconfig   gcc-13.2.0
arm                         wpcm450_defconfig   gcc-13.2.0
arm64                            allmodconfig   clang-20
arm64                            allmodconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-14.1.0
arm64                               defconfig   gcc-13.2.0
arm64                 randconfig-001-20240818   gcc-14.1.0
arm64                 randconfig-002-20240818   gcc-14.1.0
arm64                 randconfig-003-20240818   gcc-14.1.0
arm64                 randconfig-004-20240818   gcc-14.1.0
csky                              allnoconfig   gcc-13.2.0
csky                              allnoconfig   gcc-14.1.0
csky                                defconfig   gcc-13.2.0
csky                  randconfig-001-20240818   gcc-14.1.0
csky                  randconfig-002-20240818   gcc-14.1.0
hexagon                          alldefconfig   clang-17
hexagon                          allmodconfig   clang-20
hexagon                           allnoconfig   clang-20
hexagon                          allyesconfig   clang-20
hexagon               randconfig-001-20240818   clang-20
hexagon               randconfig-002-20240818   clang-20
i386                             allmodconfig   clang-18
i386                             allmodconfig   gcc-12
i386                              allnoconfig   clang-18
i386                              allnoconfig   gcc-12
i386                             allyesconfig   clang-18
i386                             allyesconfig   gcc-12
i386         buildonly-randconfig-001-20240817   gcc-12
i386         buildonly-randconfig-001-20240818   gcc-12
i386         buildonly-randconfig-002-20240817   gcc-12
i386         buildonly-randconfig-002-20240818   gcc-12
i386         buildonly-randconfig-003-20240817   clang-18
i386         buildonly-randconfig-003-20240818   gcc-12
i386         buildonly-randconfig-004-20240817   gcc-12
i386         buildonly-randconfig-004-20240818   gcc-12
i386         buildonly-randconfig-005-20240817   clang-18
i386         buildonly-randconfig-005-20240818   gcc-12
i386         buildonly-randconfig-006-20240817   clang-18
i386         buildonly-randconfig-006-20240818   gcc-12
i386                                defconfig   clang-18
i386                  randconfig-001-20240817   gcc-12
i386                  randconfig-001-20240818   gcc-12
i386                  randconfig-002-20240817   gcc-12
i386                  randconfig-002-20240818   gcc-12
i386                  randconfig-003-20240817   gcc-12
i386                  randconfig-003-20240818   gcc-12
i386                  randconfig-004-20240817   clang-18
i386                  randconfig-004-20240818   gcc-12
i386                  randconfig-005-20240817   gcc-12
i386                  randconfig-005-20240818   gcc-12
i386                  randconfig-006-20240817   clang-18
i386                  randconfig-006-20240818   gcc-12
i386                  randconfig-011-20240817   gcc-12
i386                  randconfig-011-20240818   gcc-12
i386                  randconfig-012-20240817   clang-18
i386                  randconfig-012-20240818   gcc-12
i386                  randconfig-013-20240817   gcc-12
i386                  randconfig-013-20240818   gcc-12
i386                  randconfig-014-20240817   gcc-12
i386                  randconfig-014-20240818   gcc-12
i386                  randconfig-015-20240817   gcc-12
i386                  randconfig-015-20240818   gcc-12
i386                  randconfig-016-20240817   clang-18
i386                  randconfig-016-20240818   gcc-12
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-13.2.0
loongarch                         allnoconfig   gcc-14.1.0
loongarch                           defconfig   gcc-13.2.0
loongarch             randconfig-001-20240818   gcc-14.1.0
loongarch             randconfig-002-20240818   gcc-14.1.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-13.2.0
m68k                              allnoconfig   gcc-14.1.0
m68k                             allyesconfig   gcc-14.1.0
m68k                       bvme6000_defconfig   gcc-14.1.0
m68k                                defconfig   gcc-13.2.0
m68k                       m5275evb_defconfig   gcc-13.2.0
m68k                            q40_defconfig   gcc-14.1.0
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-13.2.0
microblaze                        allnoconfig   gcc-14.1.0
microblaze                       allyesconfig   gcc-14.1.0
microblaze                          defconfig   gcc-13.2.0
mips                              allnoconfig   gcc-13.2.0
mips                              allnoconfig   gcc-14.1.0
mips                          ath79_defconfig   clang-17
mips                        bcm63xx_defconfig   clang-17
mips                           ip28_defconfig   gcc-13.2.0
mips                     loongson1c_defconfig   gcc-13.2.0
mips                           mtx1_defconfig   clang-16
mips                        qi_lb60_defconfig   clang-20
mips                           xway_defconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-14.1.0
nios2                               defconfig   gcc-13.2.0
nios2                 randconfig-001-20240818   gcc-14.1.0
nios2                 randconfig-002-20240818   gcc-14.1.0
openrisc                          allnoconfig   gcc-14.1.0
openrisc                         allyesconfig   gcc-14.1.0
openrisc                            defconfig   gcc-14.1.0
parisc                           allmodconfig   gcc-14.1.0
parisc                            allnoconfig   gcc-14.1.0
parisc                           allyesconfig   gcc-14.1.0
parisc                              defconfig   gcc-14.1.0
parisc                randconfig-001-20240818   gcc-14.1.0
parisc                randconfig-002-20240818   gcc-14.1.0
parisc64                            defconfig   gcc-13.2.0
powerpc                          allmodconfig   gcc-14.1.0
powerpc                           allnoconfig   gcc-14.1.0
powerpc                          allyesconfig   clang-20
powerpc                          allyesconfig   gcc-14.1.0
powerpc                     asp8347_defconfig   clang-17
powerpc                      chrp32_defconfig   clang-20
powerpc                      cm5200_defconfig   clang-20
powerpc                    ge_imp3a_defconfig   gcc-13.2.0
powerpc                   microwatt_defconfig   gcc-13.2.0
powerpc                    mvme5100_defconfig   gcc-14.1.0
powerpc               randconfig-001-20240818   clang-20
powerpc               randconfig-002-20240818   clang-20
powerpc                     sequoia_defconfig   clang-17
powerpc                     tqm8548_defconfig   clang-20
powerpc                     tqm8560_defconfig   gcc-14.1.0
powerpc64             randconfig-001-20240818   gcc-14.1.0
powerpc64             randconfig-002-20240818   gcc-14.1.0
powerpc64             randconfig-003-20240818   gcc-14.1.0
riscv                            allmodconfig   clang-20
riscv                            allmodconfig   gcc-14.1.0
riscv                             allnoconfig   gcc-14.1.0
riscv                            allyesconfig   clang-20
riscv                            allyesconfig   gcc-14.1.0
riscv                               defconfig   clang-20
riscv                               defconfig   gcc-14.1.0
riscv                 randconfig-001-20240818   clang-15
riscv                 randconfig-002-20240818   clang-20
s390                             allmodconfig   clang-20
s390                              allnoconfig   clang-20
s390                             allyesconfig   clang-20
s390                             allyesconfig   gcc-14.1.0
s390                                defconfig   clang-17
s390                                defconfig   clang-20
s390                                defconfig   gcc-14.1.0
s390                  randconfig-001-20240818   gcc-14.1.0
s390                  randconfig-002-20240818   clang-20
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-13.2.0
sh                                allnoconfig   gcc-14.1.0
sh                               allyesconfig   gcc-14.1.0
sh                                  defconfig   gcc-14.1.0
sh                             espt_defconfig   gcc-13.2.0
sh                            hp6xx_defconfig   gcc-14.1.0
sh                               j2_defconfig   gcc-13.2.0
sh                            migor_defconfig   gcc-14.1.0
sh                          r7785rp_defconfig   gcc-14.1.0
sh                    randconfig-001-20240818   gcc-14.1.0
sh                    randconfig-002-20240818   gcc-14.1.0
sh                           se7722_defconfig   gcc-14.1.0
sh                           se7751_defconfig   gcc-14.1.0
sh                     sh7710voipgw_defconfig   gcc-13.2.0
sh                   sh7770_generic_defconfig   gcc-13.2.0
sparc                            allmodconfig   gcc-14.1.0
sparc64                             defconfig   gcc-14.1.0
sparc64               randconfig-001-20240818   gcc-14.1.0
sparc64               randconfig-002-20240818   gcc-14.1.0
um                               allmodconfig   clang-20
um                               allmodconfig   gcc-13.3.0
um                                allnoconfig   clang-17
um                               allyesconfig   gcc-12
um                               allyesconfig   gcc-13.3.0
um                                  defconfig   clang-20
um                                  defconfig   gcc-14.1.0
um                             i386_defconfig   gcc-12
um                             i386_defconfig   gcc-14.1.0
um                    randconfig-001-20240818   clang-20
um                    randconfig-002-20240818   gcc-12
um                           x86_64_defconfig   clang-15
um                           x86_64_defconfig   gcc-14.1.0
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240818   clang-18
x86_64       buildonly-randconfig-002-20240818   clang-18
x86_64       buildonly-randconfig-002-20240818   gcc-12
x86_64       buildonly-randconfig-003-20240818   clang-18
x86_64       buildonly-randconfig-004-20240818   clang-18
x86_64       buildonly-randconfig-004-20240818   gcc-12
x86_64       buildonly-randconfig-005-20240818   clang-18
x86_64       buildonly-randconfig-005-20240818   gcc-12
x86_64       buildonly-randconfig-006-20240818   clang-18
x86_64       buildonly-randconfig-006-20240818   gcc-12
x86_64                              defconfig   clang-18
x86_64                              defconfig   gcc-11
x86_64                                  kexec   clang-18
x86_64                randconfig-001-20240818   clang-18
x86_64                randconfig-002-20240818   clang-18
x86_64                randconfig-002-20240818   gcc-12
x86_64                randconfig-003-20240818   clang-18
x86_64                randconfig-003-20240818   gcc-12
x86_64                randconfig-004-20240818   clang-18
x86_64                randconfig-005-20240818   clang-18
x86_64                randconfig-005-20240818   gcc-12
x86_64                randconfig-006-20240818   clang-18
x86_64                randconfig-011-20240818   clang-18
x86_64                randconfig-012-20240818   clang-18
x86_64                randconfig-013-20240818   clang-18
x86_64                randconfig-014-20240818   clang-18
x86_64                randconfig-015-20240818   clang-18
x86_64                randconfig-016-20240818   clang-18
x86_64                randconfig-016-20240818   gcc-12
x86_64                randconfig-071-20240818   clang-18
x86_64                randconfig-072-20240818   clang-18
x86_64                randconfig-073-20240818   clang-18
x86_64                randconfig-074-20240818   clang-18
x86_64                randconfig-075-20240818   clang-18
x86_64                randconfig-075-20240818   gcc-12
x86_64                randconfig-076-20240818   clang-18
x86_64                          rhel-8.3-rust   clang-18
x86_64                               rhel-8.3   clang-18
xtensa                            allnoconfig   gcc-13.2.0
xtensa                            allnoconfig   gcc-14.1.0
xtensa                  cadence_csp_defconfig   gcc-14.1.0
xtensa                          iss_defconfig   gcc-13.2.0
xtensa                randconfig-001-20240818   gcc-14.1.0
xtensa                randconfig-002-20240818   gcc-14.1.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
