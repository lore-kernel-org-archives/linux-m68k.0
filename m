Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F388A22319
	for <linux-m68k@lists.linux-m68k.org>; Tue, 13 Feb 2024 09:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707818269; cv=none; b=lEhCU8/uCUU9R0ri9cEOcO/I2bhyvfI9SoqKvJz/uOe6YovAhqLg9UFGx9xp0q3wnPbsoMILmfJ1Mjp3EjodQIRxJuMThRBUXCafJqNOwHyKjk0H5dloNF9DmvvIlwXftyXIXZPeVDiupvfZwFaKSFKuznE8TiGfz5CRS4U9D64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707818269; c=relaxed/simple;
	bh=DEoghwYbHPaHhbq6RFgpG/vGVDiJ3+BSSCSeBBl1phI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=eQDACG3Cw4yAB+7+Fnx1AwGT169mWn7LTUorBfdkc+nzYkK5y4JqlcwdcokXBSChHj+ijjwry77IRM6Q13FM8FWujPr0XZaYrqas+Y8gef9ExkoP2L45tXWVFQAG33QkvxgUxclQjz0Srukb+S0h9ldIzT+I4Q0l64P/0vAYM0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nt08gRPm; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nt08gRPm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707818268; x=1739354268;
  h=date:from:to:cc:subject:message-id;
  bh=DEoghwYbHPaHhbq6RFgpG/vGVDiJ3+BSSCSeBBl1phI=;
  b=nt08gRPmugxzwcwmdUuplRfwHM7mLXds/1x+fc/XWifBchZFCHYTFnsF
   tC+soQ22JunHmUNQUKfP4WwVQCNivEGgkBHKR34Bfsj74AlxYhVJEFevZ
   OREIz32ZA4OX+d6TcFLdze9WFrSTI8G62jP0z5vANlpllPFUOJHpImE/O
   NYCCdOpZEN118NHWNdptA/0T9b7hkd1UD1NqCG0Sdm5zeX4RJDrJCgJU5
   PLRYKWjqtViy+mD2xmsZtFLK4YCCUH8O33GaUTujyTNCQivACt5hrUSHR
   oCRjUEvSWizFwA7Ta9yScDKAQ0pb48QzX9jK+sLovoLV64IHIvkA0OKbn
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="19231636"
X-IronPort-AV: E=Sophos;i="6.06,156,1705392000"; 
   d="scan'208";a="19231636"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2024 01:57:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,156,1705392000"; 
   d="scan'208";a="2814712"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 13 Feb 2024 01:57:45 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rZpXq-0007dw-2b;
	Tue, 13 Feb 2024 09:57:42 +0000
Date: Tue, 13 Feb 2024 17:57:29 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:master] BUILD SUCCESS
 5dc6bdd91324628a3e93d8cda217cb0d26c8b818
Message-ID: <202402131727.navK0AHn-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git master
branch HEAD: 5dc6bdd91324628a3e93d8cda217cb0d26c8b818  Merge tag 'v6.8-rc4'

elapsed time: 1454m

configs tested: 242
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                        nsim_700_defconfig   gcc  
arc                        nsimosci_defconfig   gcc  
arc                   randconfig-001-20240212   gcc  
arc                   randconfig-001-20240213   gcc  
arc                   randconfig-002-20240212   gcc  
arc                   randconfig-002-20240213   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                       aspeed_g5_defconfig   gcc  
arm                                 defconfig   clang
arm                            mmp2_defconfig   gcc  
arm                        mvebu_v5_defconfig   gcc  
arm                        mvebu_v7_defconfig   clang
arm                       netwinder_defconfig   gcc  
arm                           omap1_defconfig   gcc  
arm                          pxa910_defconfig   gcc  
arm                             pxa_defconfig   gcc  
arm                   randconfig-001-20240212   gcc  
arm                   randconfig-001-20240213   gcc  
arm                   randconfig-002-20240212   clang
arm                   randconfig-002-20240213   gcc  
arm                   randconfig-003-20240212   clang
arm                   randconfig-003-20240213   gcc  
arm                   randconfig-004-20240212   clang
arm                        shmobile_defconfig   gcc  
arm                          sp7021_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240212   clang
arm64                 randconfig-001-20240213   gcc  
arm64                 randconfig-002-20240212   clang
arm64                 randconfig-002-20240213   gcc  
arm64                 randconfig-003-20240212   clang
arm64                 randconfig-003-20240213   gcc  
arm64                 randconfig-004-20240212   clang
arm64                 randconfig-004-20240213   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240212   gcc  
csky                  randconfig-001-20240213   gcc  
csky                  randconfig-002-20240212   gcc  
csky                  randconfig-002-20240213   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240212   clang
hexagon               randconfig-002-20240212   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240212   clang
i386         buildonly-randconfig-002-20240212   gcc  
i386         buildonly-randconfig-003-20240212   gcc  
i386         buildonly-randconfig-004-20240212   clang
i386         buildonly-randconfig-005-20240212   gcc  
i386         buildonly-randconfig-006-20240212   clang
i386                                defconfig   clang
i386                  randconfig-001-20240212   gcc  
i386                  randconfig-002-20240212   clang
i386                  randconfig-003-20240212   clang
i386                  randconfig-004-20240212   gcc  
i386                  randconfig-005-20240212   clang
i386                  randconfig-006-20240212   gcc  
i386                  randconfig-011-20240212   gcc  
i386                  randconfig-012-20240212   gcc  
i386                  randconfig-013-20240212   gcc  
i386                  randconfig-014-20240212   gcc  
i386                  randconfig-015-20240212   gcc  
i386                  randconfig-016-20240212   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240212   gcc  
loongarch             randconfig-001-20240213   gcc  
loongarch             randconfig-002-20240212   gcc  
loongarch             randconfig-002-20240213   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                       m5208evb_defconfig   gcc  
m68k                        mvme147_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                         bigsur_defconfig   gcc  
mips                  cavium_octeon_defconfig   gcc  
mips                           ip22_defconfig   gcc  
mips                          rm200_defconfig   gcc  
nios2                         10m50_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240212   gcc  
nios2                 randconfig-001-20240213   gcc  
nios2                 randconfig-002-20240212   gcc  
nios2                 randconfig-002-20240213   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
openrisc                 simple_smp_defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240212   gcc  
parisc                randconfig-001-20240213   gcc  
parisc                randconfig-002-20240212   gcc  
parisc                randconfig-002-20240213   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                      arches_defconfig   gcc  
powerpc                  mpc866_ads_defconfig   clang
powerpc                     ppa8548_defconfig   gcc  
powerpc               randconfig-001-20240212   clang
powerpc               randconfig-002-20240212   gcc  
powerpc               randconfig-002-20240213   gcc  
powerpc               randconfig-003-20240212   clang
powerpc               randconfig-003-20240213   gcc  
powerpc                     tqm8548_defconfig   clang
powerpc64             randconfig-001-20240212   clang
powerpc64             randconfig-001-20240213   gcc  
powerpc64             randconfig-002-20240212   gcc  
powerpc64             randconfig-002-20240213   gcc  
powerpc64             randconfig-003-20240212   clang
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240212   gcc  
riscv                 randconfig-001-20240213   gcc  
riscv                 randconfig-002-20240212   gcc  
riscv                 randconfig-002-20240213   gcc  
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240212   clang
s390                  randconfig-001-20240213   gcc  
s390                  randconfig-002-20240212   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                     magicpanelr2_defconfig   gcc  
sh                    randconfig-001-20240212   gcc  
sh                    randconfig-001-20240213   gcc  
sh                    randconfig-002-20240212   gcc  
sh                    randconfig-002-20240213   gcc  
sh                        sh7785lcr_defconfig   gcc  
sh                              ul2_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240212   gcc  
sparc64               randconfig-001-20240213   gcc  
sparc64               randconfig-002-20240212   gcc  
sparc64               randconfig-002-20240213   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                    randconfig-001-20240212   clang
um                    randconfig-002-20240212   clang
um                    randconfig-002-20240213   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240212   clang
x86_64       buildonly-randconfig-002-20240212   clang
x86_64       buildonly-randconfig-002-20240213   gcc  
x86_64       buildonly-randconfig-003-20240212   clang
x86_64       buildonly-randconfig-004-20240212   clang
x86_64       buildonly-randconfig-004-20240213   gcc  
x86_64       buildonly-randconfig-005-20240212   clang
x86_64       buildonly-randconfig-005-20240213   gcc  
x86_64       buildonly-randconfig-006-20240212   clang
x86_64       buildonly-randconfig-006-20240213   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240212   gcc  
x86_64                randconfig-001-20240213   gcc  
x86_64                randconfig-002-20240212   gcc  
x86_64                randconfig-003-20240212   gcc  
x86_64                randconfig-004-20240212   gcc  
x86_64                randconfig-004-20240213   gcc  
x86_64                randconfig-005-20240212   gcc  
x86_64                randconfig-006-20240212   gcc  
x86_64                randconfig-011-20240212   gcc  
x86_64                randconfig-012-20240212   gcc  
x86_64                randconfig-013-20240212   clang
x86_64                randconfig-014-20240212   gcc  
x86_64                randconfig-014-20240213   gcc  
x86_64                randconfig-015-20240212   gcc  
x86_64                randconfig-016-20240212   clang
x86_64                randconfig-071-20240212   gcc  
x86_64                randconfig-071-20240213   gcc  
x86_64                randconfig-072-20240212   gcc  
x86_64                randconfig-072-20240213   gcc  
x86_64                randconfig-073-20240212   clang
x86_64                randconfig-074-20240212   gcc  
x86_64                randconfig-074-20240213   gcc  
x86_64                randconfig-075-20240212   gcc  
x86_64                randconfig-075-20240213   gcc  
x86_64                randconfig-076-20240212   gcc  
x86_64                randconfig-076-20240213   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa                  audio_kc705_defconfig   gcc  
xtensa                generic_kc705_defconfig   gcc  
xtensa                  nommu_kc705_defconfig   gcc  
xtensa                randconfig-001-20240212   gcc  
xtensa                randconfig-001-20240213   gcc  
xtensa                randconfig-002-20240212   gcc  
xtensa                randconfig-002-20240213   gcc  
xtensa                    smp_lx200_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
