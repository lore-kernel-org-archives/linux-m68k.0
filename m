Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 790732F2905
	for <linux-m68k@lists.linux-m68k.org>; Tue,  3 Feb 2026 06:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770101276; cv=none; b=H2nxwvQS+fN7EkRMF4E4ppaIanineaiX8AoOKD+Ir7KB7m/wEyWfaCC03qsBaQGvikORz79Jwf3kRj8JHl0AeWSnjf9cFbsUiDjDoqZgXCShGFY6iMvobcCIL3TAqRLO6Hg60mRD67Dk83SpmerNYarM2Yo8c1k5CxYxYDYVnhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770101276; c=relaxed/simple;
	bh=LpOEnuC/9B4R5er7qQ8sK+Oj59HSLe8ur1GN6R4qG6w=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RZBVGMmx10JoO9F4dvQ/FooNxBa6LpU9AN3JCaaP7v8HDkGq+PzwzfZIOl+884Piuh+0ZjWoRciDjZT1N87DMIb8BarRXX2uJwY27JgJhoQvGVuDnXoNXTajoAaMytNh26feWfSnNpK0SjQNq3s3bBS2UW/hCD/3Y0E/9N78H6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OBaEmK5i; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OBaEmK5i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770101274; x=1801637274;
  h=date:from:to:cc:subject:message-id;
  bh=LpOEnuC/9B4R5er7qQ8sK+Oj59HSLe8ur1GN6R4qG6w=;
  b=OBaEmK5iHS+c85dwFJ+7asbMYOAlFJhRJ+DEv8puYPmnUoSQf36L36Ru
   aoMZJ5DzdnC4g0hpMEoyvPbVy/gl3FAagEFVpR8Zo3ITdC76TT4b1SeQQ
   qbwdHuCjLRhg0jyNdkmLEl4nP0/dRqGLAzbgeUBcCEvH5t/JSFaSWCaJ0
   crGCvmNgc8MmGyU8euCR6gWc1B2GR+IMI1vq0w/QiyvCQR2wEQLKrDM96
   OKZcQE1MnlCuU3ZuD2RHrzHW0TwAf/hgK5QCOMyHaiS6Yj/ujdNxYUP/X
   EnBjUPylg9UQqfzyECNfRkbZa12bFjGs0sUlXC/bw4ejm9PmPGkiOKdf3
   w==;
X-CSE-ConnectionGUID: oR50/ZAXQ0GKMLUWVOrnUw==
X-CSE-MsgGUID: idYjIQhQSyKPLN6pBvXjSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="74889922"
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; 
   d="scan'208";a="74889922"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2026 22:47:53 -0800
X-CSE-ConnectionGUID: DU9TI9r5RsekL7jEKZ7c3g==
X-CSE-MsgGUID: rlWhNgV6Swa/1D7oFEPGfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; 
   d="scan'208";a="240432154"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 02 Feb 2026 22:47:51 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vnACS-00000000gMG-2IVW;
	Tue, 03 Feb 2026 06:47:48 +0000
Date: Tue, 03 Feb 2026 14:47:06 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:master] BUILD SUCCESS
 4af85fdda409a89e538c3b03ddc6c573934a231d
Message-ID: <202602031458.fjFVeAgT-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git master
branch HEAD: 4af85fdda409a89e538c3b03ddc6c573934a231d  Merge tag 'v6.19-rc8'

elapsed time: 1249m

configs tested: 319
configs skipped: 10

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              alldefconfig    gcc-15.2.0
arc                              allmodconfig    clang-16
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    clang-22
arc                              allyesconfig    gcc-15.2.0
arc                          axs101_defconfig    gcc-15.2.0
arc                                 defconfig    gcc-15.2.0
arc                            hsdk_defconfig    gcc-15.2.0
arc                        nsim_700_defconfig    clang-22
arc                   randconfig-001-20260202    gcc-14.3.0
arc                   randconfig-001-20260203    gcc-12.5.0
arc                   randconfig-002-20260202    gcc-14.3.0
arc                   randconfig-002-20260203    gcc-12.5.0
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                     davinci_all_defconfig    clang-22
arm                                 defconfig    gcc-15.2.0
arm                           h3600_defconfig    gcc-15.2.0
arm                           imxrt_defconfig    gcc-15.2.0
arm                          ixp4xx_defconfig    gcc-15.2.0
arm                        keystone_defconfig    clang-22
arm                         lpc32xx_defconfig    clang-22
arm                         lpc32xx_defconfig    gcc-15.2.0
arm                            mps2_defconfig    clang-22
arm                       netwinder_defconfig    gcc-15.2.0
arm                         nhk8815_defconfig    clang-22
arm                             pxa_defconfig    clang-22
arm                   randconfig-001-20260202    gcc-14.3.0
arm                   randconfig-001-20260203    gcc-12.5.0
arm                   randconfig-002-20260202    gcc-14.3.0
arm                   randconfig-002-20260203    gcc-12.5.0
arm                   randconfig-003-20260202    gcc-14.3.0
arm                   randconfig-003-20260203    gcc-12.5.0
arm                   randconfig-004-20260202    gcc-14.3.0
arm                   randconfig-004-20260203    gcc-12.5.0
arm                           sama7_defconfig    clang-22
arm                           spitz_defconfig    clang-22
arm64                            allmodconfig    clang-19
arm64                            allmodconfig    clang-22
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260202    gcc-9.5.0
arm64                 randconfig-001-20260203    gcc-15.2.0
arm64                 randconfig-002-20260202    gcc-9.5.0
arm64                 randconfig-002-20260203    gcc-15.2.0
arm64                 randconfig-003-20260202    gcc-9.5.0
arm64                 randconfig-003-20260203    gcc-15.2.0
arm64                 randconfig-004-20260202    gcc-9.5.0
arm64                 randconfig-004-20260203    gcc-15.2.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260202    gcc-9.5.0
csky                  randconfig-001-20260203    gcc-15.2.0
csky                  randconfig-002-20260202    gcc-9.5.0
csky                  randconfig-002-20260203    gcc-15.2.0
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260202    clang-19
hexagon               randconfig-001-20260203    clang-22
hexagon               randconfig-002-20260202    clang-19
hexagon               randconfig-002-20260203    clang-22
i386                             allmodconfig    clang-20
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20260202    gcc-14
i386        buildonly-randconfig-001-20260203    clang-20
i386        buildonly-randconfig-002-20260202    gcc-14
i386        buildonly-randconfig-002-20260203    clang-20
i386        buildonly-randconfig-003-20260202    gcc-14
i386        buildonly-randconfig-003-20260203    clang-20
i386        buildonly-randconfig-004-20260202    gcc-14
i386        buildonly-randconfig-004-20260203    clang-20
i386        buildonly-randconfig-005-20260202    gcc-14
i386        buildonly-randconfig-005-20260203    clang-20
i386        buildonly-randconfig-006-20260202    gcc-14
i386        buildonly-randconfig-006-20260203    clang-20
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260202    gcc-14
i386                  randconfig-001-20260203    clang-20
i386                  randconfig-002-20260202    gcc-14
i386                  randconfig-002-20260203    clang-20
i386                  randconfig-003-20260202    gcc-14
i386                  randconfig-003-20260203    clang-20
i386                  randconfig-004-20260202    gcc-14
i386                  randconfig-004-20260203    clang-20
i386                  randconfig-005-20260202    gcc-14
i386                  randconfig-005-20260203    clang-20
i386                  randconfig-006-20260202    gcc-14
i386                  randconfig-006-20260203    clang-20
i386                  randconfig-007-20260202    gcc-14
i386                  randconfig-007-20260203    clang-20
i386                  randconfig-011-20260202    clang-20
i386                  randconfig-011-20260203    gcc-14
i386                  randconfig-012-20260202    clang-20
i386                  randconfig-012-20260203    gcc-14
i386                  randconfig-013-20260202    clang-20
i386                  randconfig-013-20260203    gcc-14
i386                  randconfig-014-20260202    clang-20
i386                  randconfig-014-20260203    gcc-14
i386                  randconfig-015-20260202    clang-20
i386                  randconfig-015-20260203    gcc-14
i386                  randconfig-016-20260202    clang-20
i386                  randconfig-016-20260203    gcc-14
i386                  randconfig-017-20260202    clang-20
i386                  randconfig-017-20260203    gcc-14
loongarch                        alldefconfig    gcc-15.2.0
loongarch                        allmodconfig    clang-19
loongarch                        allmodconfig    clang-22
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch                loongson64_defconfig    gcc-15.2.0
loongarch             randconfig-001-20260202    clang-19
loongarch             randconfig-001-20260203    clang-22
loongarch             randconfig-002-20260202    clang-19
loongarch             randconfig-002-20260203    clang-22
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                         apollo_defconfig    clang-22
m68k                          atari_defconfig    gcc-15.2.0
m68k                       bvme6000_defconfig    gcc-15.2.0
m68k                                defconfig    clang-19
m68k                       m5275evb_defconfig    gcc-15.2.0
m68k                            mac_defconfig    gcc-15.2.0
m68k                           sun3_defconfig    gcc-15.2.0
m68k                           virt_defconfig    gcc-15.2.0
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
mips                          ath79_defconfig    clang-22
mips                        bcm63xx_defconfig    clang-22
mips                        bcm63xx_defconfig    gcc-15.2.0
mips                       bmips_be_defconfig    gcc-15.2.0
mips                      bmips_stb_defconfig    clang-22
mips                  cavium_octeon_defconfig    clang-22
mips                     cu1000-neo_defconfig    gcc-15.2.0
mips                     cu1830-neo_defconfig    clang-22
mips                          eyeq5_defconfig    gcc-15.2.0
mips                           gcw0_defconfig    clang-22
mips                           ip32_defconfig    gcc-15.2.0
mips                      loongson3_defconfig    gcc-15.2.0
mips                   sb1250_swarm_defconfig    gcc-15.2.0
mips                        vocore2_defconfig    clang-22
nios2                         10m50_defconfig    clang-22
nios2                            allmodconfig    clang-22
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-22
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260202    clang-19
nios2                 randconfig-001-20260203    clang-22
nios2                 randconfig-002-20260202    clang-19
nios2                 randconfig-002-20260203    clang-22
openrisc                         allmodconfig    clang-22
openrisc                         allmodconfig    gcc-15.2.0
openrisc                          allnoconfig    clang-22
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-22
parisc                           allyesconfig    clang-19
parisc                              defconfig    gcc-15.2.0
parisc                generic-64bit_defconfig    clang-22
parisc                generic-64bit_defconfig    gcc-15.2.0
parisc                randconfig-001-20260202    gcc-8.5.0
parisc                randconfig-001-20260203    gcc-12.5.0
parisc                randconfig-002-20260202    gcc-8.5.0
parisc                randconfig-002-20260203    gcc-12.5.0
parisc64                         alldefconfig    gcc-15.2.0
parisc64                            defconfig    clang-19
powerpc                     akebono_defconfig    clang-22
powerpc                     akebono_defconfig    gcc-15.2.0
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-22
powerpc                    amigaone_defconfig    clang-22
powerpc                    ge_imp3a_defconfig    clang-22
powerpc                    ge_imp3a_defconfig    gcc-15.2.0
powerpc                     kmeter1_defconfig    clang-22
powerpc                     mpc83xx_defconfig    gcc-15.2.0
powerpc               randconfig-001-20260202    gcc-8.5.0
powerpc               randconfig-001-20260203    gcc-12.5.0
powerpc               randconfig-002-20260202    gcc-8.5.0
powerpc               randconfig-002-20260203    gcc-12.5.0
powerpc                    sam440ep_defconfig    gcc-15.2.0
powerpc                     tqm8548_defconfig    clang-22
powerpc64             randconfig-001-20260202    gcc-8.5.0
powerpc64             randconfig-001-20260203    gcc-12.5.0
powerpc64             randconfig-002-20260202    gcc-8.5.0
powerpc64             randconfig-002-20260203    gcc-12.5.0
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    clang-22
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-22
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260202    clang-22
riscv                 randconfig-001-20260203    gcc-8.5.0
riscv                 randconfig-002-20260202    clang-22
riscv                 randconfig-002-20260203    gcc-8.5.0
s390                             alldefconfig    gcc-15.2.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260202    clang-22
s390                  randconfig-001-20260203    gcc-8.5.0
s390                  randconfig-002-20260203    gcc-8.5.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-22
sh                               allyesconfig    clang-19
sh                                  defconfig    gcc-14
sh                          landisk_defconfig    gcc-15.2.0
sh                    randconfig-001-20260202    clang-22
sh                    randconfig-001-20260203    gcc-8.5.0
sh                    randconfig-002-20260202    clang-22
sh                    randconfig-002-20260203    gcc-8.5.0
sh                          rsk7203_defconfig    clang-22
sh                          rsk7203_defconfig    gcc-15.2.0
sh                          sdk7780_defconfig    gcc-15.2.0
sh                     sh7710voipgw_defconfig    gcc-15.2.0
sh                        sh7757lcr_defconfig    clang-22
sh                        sh7763rdp_defconfig    clang-22
sh                   sh7770_generic_defconfig    clang-22
sh                  sh7785lcr_32bit_defconfig    gcc-15.2.0
sh                            shmin_defconfig    gcc-15.2.0
sparc                             allnoconfig    clang-22
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260202    gcc-12.5.0
sparc                 randconfig-001-20260203    gcc-13.4.0
sparc                 randconfig-002-20260202    gcc-12.5.0
sparc                 randconfig-002-20260203    gcc-13.4.0
sparc64                          allmodconfig    clang-22
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260202    gcc-12.5.0
sparc64               randconfig-001-20260203    gcc-13.4.0
sparc64               randconfig-002-20260202    gcc-12.5.0
sparc64               randconfig-002-20260203    gcc-13.4.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260202    gcc-12.5.0
um                    randconfig-001-20260203    gcc-13.4.0
um                    randconfig-002-20260202    gcc-12.5.0
um                    randconfig-002-20260203    gcc-13.4.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-22
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260202    gcc-14
x86_64      buildonly-randconfig-001-20260203    clang-20
x86_64      buildonly-randconfig-002-20260202    gcc-14
x86_64      buildonly-randconfig-002-20260203    clang-20
x86_64      buildonly-randconfig-003-20260202    gcc-14
x86_64      buildonly-randconfig-003-20260203    clang-20
x86_64      buildonly-randconfig-004-20260202    gcc-14
x86_64      buildonly-randconfig-004-20260203    clang-20
x86_64      buildonly-randconfig-005-20260202    gcc-14
x86_64      buildonly-randconfig-005-20260203    clang-20
x86_64      buildonly-randconfig-006-20260202    gcc-14
x86_64      buildonly-randconfig-006-20260203    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260202    gcc-14
x86_64                randconfig-001-20260203    clang-20
x86_64                randconfig-002-20260202    gcc-14
x86_64                randconfig-002-20260203    clang-20
x86_64                randconfig-003-20260202    gcc-14
x86_64                randconfig-003-20260203    clang-20
x86_64                randconfig-004-20260202    gcc-14
x86_64                randconfig-004-20260203    clang-20
x86_64                randconfig-005-20260202    gcc-14
x86_64                randconfig-005-20260203    clang-20
x86_64                randconfig-006-20260202    gcc-14
x86_64                randconfig-006-20260203    clang-20
x86_64                randconfig-011-20260202    gcc-14
x86_64                randconfig-011-20260203    gcc-14
x86_64                randconfig-012-20260202    gcc-14
x86_64                randconfig-012-20260203    gcc-14
x86_64                randconfig-013-20260202    gcc-14
x86_64                randconfig-013-20260203    gcc-14
x86_64                randconfig-014-20260202    gcc-14
x86_64                randconfig-014-20260203    gcc-14
x86_64                randconfig-015-20260202    gcc-14
x86_64                randconfig-015-20260203    gcc-14
x86_64                randconfig-016-20260202    gcc-14
x86_64                randconfig-016-20260203    gcc-14
x86_64                randconfig-071-20260202    clang-20
x86_64                randconfig-071-20260203    gcc-14
x86_64                randconfig-072-20260202    clang-20
x86_64                randconfig-072-20260203    gcc-14
x86_64                randconfig-073-20260202    clang-20
x86_64                randconfig-073-20260203    gcc-14
x86_64                randconfig-074-20260202    clang-20
x86_64                randconfig-074-20260203    gcc-14
x86_64                randconfig-075-20260202    clang-20
x86_64                randconfig-075-20260203    gcc-14
x86_64                randconfig-076-20260202    clang-20
x86_64                randconfig-076-20260203    gcc-14
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-22
xtensa                           allyesconfig    clang-22
xtensa                       common_defconfig    clang-22
xtensa                randconfig-001-20260202    gcc-12.5.0
xtensa                randconfig-001-20260203    gcc-13.4.0
xtensa                randconfig-002-20260202    gcc-12.5.0
xtensa                randconfig-002-20260203    gcc-13.4.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
