Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7138918595E
	for <linux-m68k@lists.linux-m68k.org>; Tue, 10 Sep 2024 10:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725962792; cv=none; b=TH0gDReIL/MSNL8gC4VOoBZdSEimXRybInxiJbRhHMKRHugcUePEPqzZYpKfYstTIZLy435ZCBtB21OSsDnPLeAyPneXNvcZd/EoWmrE+feuNJq8J/IK9eK7KljpcwHxRJyKdOKBt/wEVmv2JxLnbZIKEoTDt/YwvpA3pG+NpHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725962792; c=relaxed/simple;
	bh=jJMrj113rxJ5csN5Zrqiqgitr2jbWF1H7dDEzPIIalc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=OeKLtdMqorA6wC0MItFsfBdMhzv365lSxywi6h20nIxysxQjzl5Sv5Re2nQjkiiDd2DBH41qc3Ve1xko2RelH8GqYqqrykCP1AMN9TPBqA8rwy7JA6BmU6F14qs37n6qfmuWjANke0vCIOhssLRWviTmvwewdhyXXVBXzZ/MC/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a/rYCUM+; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a/rYCUM+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725962791; x=1757498791;
  h=date:from:to:cc:subject:message-id;
  bh=jJMrj113rxJ5csN5Zrqiqgitr2jbWF1H7dDEzPIIalc=;
  b=a/rYCUM+iQGrZxzIhgJZOzE76InqGENSWvDla4dsQPevIxze0Zd129AK
   WAC1AV1IqJBfbbfm5ZsLLOP3OZyrAbQx7Z8fINF79QTOvpI0i0OnqeRGw
   lShfyA9qUXXTK2N7RqOL+aOKIIdY9v/vEV/59NOFInIMb5HJSlRjdFkrB
   efw1/TrmlLi3l15sRYTvgINuxVH+5AeLaqm28VqcWWTK1ICUs23/p4WTe
   yLA7lw4LL2z5nLvn6DYuyNF1j5XsrvigHCwIYh9u9wlz7LvgDVsoMr0MS
   iH14YCAFHhQzhsnwZcv/CT7Rl5zcm1pA7asUobYtQp7JcYV9LiizROpqY
   Q==;
X-CSE-ConnectionGUID: PfwcvOqITByQlBBH2EZfAw==
X-CSE-MsgGUID: 36nveciQQ/S9noUCzMYEjg==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="24198448"
X-IronPort-AV: E=Sophos;i="6.10,216,1719903600"; 
   d="scan'208";a="24198448"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2024 03:06:29 -0700
X-CSE-ConnectionGUID: mB/OF1oSSk+2gCT7rxEVkQ==
X-CSE-MsgGUID: YtMYq6uiSN2kszpeNHBHNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,216,1719903600"; 
   d="scan'208";a="66983973"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 10 Sep 2024 03:06:27 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1snxlR-0000xA-2I;
	Tue, 10 Sep 2024 10:06:25 +0000
Date: Tue, 10 Sep 2024 18:06:09 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:master] BUILD SUCCESS
 f656cd0df24b86a4b87e0c67fa83b016793ec8b5
Message-ID: <202409101806.gm2HEZDJ-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git master
branch HEAD: f656cd0df24b86a4b87e0c67fa83b016793ec8b5  Merge tag 'v6.11-rc7'

elapsed time: 1405m

configs tested: 210
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-14.1.0
alpha                            allyesconfig   clang-20
alpha                            allyesconfig   gcc-13.3.0
alpha                               defconfig   gcc-14.1.0
arc                              allmodconfig   clang-20
arc                               allnoconfig   gcc-14.1.0
arc                              allyesconfig   clang-20
arc                                 defconfig   gcc-14.1.0
arc                   randconfig-001-20240910   gcc-13.2.0
arc                   randconfig-002-20240910   gcc-13.2.0
arm                              allmodconfig   clang-20
arm                               allnoconfig   gcc-14.1.0
arm                              allyesconfig   clang-20
arm                         at91_dt_defconfig   clang-20
arm                                 defconfig   gcc-14.1.0
arm                       imx_v4_v5_defconfig   gcc-14.1.0
arm                      integrator_defconfig   clang-20
arm                      jornada720_defconfig   clang-20
arm                   randconfig-001-20240910   gcc-13.2.0
arm                   randconfig-002-20240910   gcc-13.2.0
arm                   randconfig-003-20240910   gcc-13.2.0
arm                   randconfig-004-20240910   gcc-13.2.0
arm                           sama7_defconfig   clang-20
arm                       spear13xx_defconfig   gcc-14.1.0
arm                        spear6xx_defconfig   gcc-14.1.0
arm64                            allmodconfig   clang-20
arm64                             allnoconfig   gcc-14.1.0
arm64                               defconfig   gcc-14.1.0
arm64                 randconfig-001-20240910   gcc-13.2.0
arm64                 randconfig-002-20240910   gcc-13.2.0
arm64                 randconfig-003-20240910   gcc-13.2.0
arm64                 randconfig-004-20240910   gcc-13.2.0
csky                              allnoconfig   gcc-14.1.0
csky                                defconfig   gcc-14.1.0
csky                  randconfig-001-20240910   gcc-13.2.0
csky                  randconfig-002-20240910   gcc-13.2.0
hexagon                          allmodconfig   clang-20
hexagon                           allnoconfig   gcc-14.1.0
hexagon                          allyesconfig   clang-20
hexagon                             defconfig   gcc-14.1.0
hexagon               randconfig-001-20240910   gcc-13.2.0
hexagon               randconfig-002-20240910   gcc-13.2.0
i386                             allmodconfig   clang-18
i386                             allmodconfig   gcc-12
i386                              allnoconfig   clang-18
i386                              allnoconfig   gcc-12
i386                             allyesconfig   clang-18
i386                             allyesconfig   gcc-12
i386         buildonly-randconfig-001-20240909   clang-18
i386         buildonly-randconfig-001-20240910   clang-18
i386         buildonly-randconfig-002-20240909   gcc-12
i386         buildonly-randconfig-002-20240910   clang-18
i386         buildonly-randconfig-003-20240909   gcc-12
i386         buildonly-randconfig-003-20240910   clang-18
i386         buildonly-randconfig-004-20240909   gcc-12
i386         buildonly-randconfig-004-20240910   clang-18
i386         buildonly-randconfig-005-20240909   clang-18
i386         buildonly-randconfig-005-20240910   clang-18
i386         buildonly-randconfig-006-20240909   gcc-12
i386         buildonly-randconfig-006-20240910   clang-18
i386                                defconfig   clang-18
i386                  randconfig-001-20240909   clang-18
i386                  randconfig-001-20240910   clang-18
i386                  randconfig-002-20240909   gcc-12
i386                  randconfig-002-20240910   clang-18
i386                  randconfig-003-20240909   clang-18
i386                  randconfig-003-20240910   clang-18
i386                  randconfig-004-20240909   gcc-12
i386                  randconfig-004-20240910   clang-18
i386                  randconfig-005-20240909   clang-18
i386                  randconfig-005-20240910   clang-18
i386                  randconfig-006-20240909   clang-18
i386                  randconfig-006-20240910   clang-18
i386                  randconfig-011-20240909   clang-18
i386                  randconfig-011-20240910   clang-18
i386                  randconfig-012-20240909   clang-18
i386                  randconfig-012-20240910   clang-18
i386                  randconfig-013-20240909   gcc-12
i386                  randconfig-013-20240910   clang-18
i386                  randconfig-014-20240909   clang-18
i386                  randconfig-014-20240910   clang-18
i386                  randconfig-015-20240909   clang-18
i386                  randconfig-015-20240910   clang-18
i386                  randconfig-016-20240909   gcc-12
i386                  randconfig-016-20240910   clang-18
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-14.1.0
loongarch                           defconfig   gcc-14.1.0
loongarch             randconfig-001-20240910   gcc-13.2.0
loongarch             randconfig-002-20240910   gcc-13.2.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-14.1.0
m68k                             allyesconfig   gcc-14.1.0
m68k                          amiga_defconfig   clang-20
m68k                                defconfig   gcc-14.1.0
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-14.1.0
microblaze                       allyesconfig   gcc-14.1.0
microblaze                          defconfig   gcc-14.1.0
mips                              allnoconfig   gcc-14.1.0
mips                        bcm47xx_defconfig   gcc-14.1.0
mips                           ip27_defconfig   gcc-14.1.0
mips                     loongson2k_defconfig   clang-20
mips                      loongson3_defconfig   gcc-14.1.0
mips                      pic32mzda_defconfig   clang-20
mips                       rbtx49xx_defconfig   clang-20
mips                           xway_defconfig   clang-20
nios2                             allnoconfig   gcc-14.1.0
nios2                               defconfig   gcc-14.1.0
nios2                 randconfig-001-20240910   gcc-13.2.0
nios2                 randconfig-002-20240910   gcc-13.2.0
openrisc                          allnoconfig   clang-20
openrisc                         allyesconfig   gcc-14.1.0
openrisc                            defconfig   gcc-12
parisc                           allmodconfig   gcc-14.1.0
parisc                            allnoconfig   clang-20
parisc                           allyesconfig   gcc-14.1.0
parisc                              defconfig   gcc-12
parisc                randconfig-001-20240910   gcc-13.2.0
parisc                randconfig-002-20240910   gcc-13.2.0
parisc64                         alldefconfig   gcc-14.1.0
parisc64                            defconfig   gcc-14.1.0
powerpc                     akebono_defconfig   gcc-14.1.0
powerpc                          allmodconfig   gcc-14.1.0
powerpc                           allnoconfig   clang-20
powerpc                          allyesconfig   gcc-14.1.0
powerpc                      bamboo_defconfig   clang-20
powerpc                       eiger_defconfig   clang-20
powerpc                          g5_defconfig   gcc-14.1.0
powerpc                  iss476-smp_defconfig   clang-20
powerpc                  iss476-smp_defconfig   gcc-14.1.0
powerpc                      pasemi_defconfig   gcc-14.1.0
powerpc               randconfig-001-20240910   gcc-13.2.0
powerpc               randconfig-002-20240910   gcc-13.2.0
powerpc               randconfig-003-20240910   gcc-13.2.0
powerpc                     tqm8548_defconfig   gcc-14.1.0
powerpc64             randconfig-001-20240910   gcc-13.2.0
powerpc64             randconfig-002-20240910   gcc-13.2.0
powerpc64             randconfig-003-20240910   gcc-13.2.0
riscv                            allmodconfig   gcc-14.1.0
riscv                             allnoconfig   clang-20
riscv                            allyesconfig   gcc-14.1.0
riscv                               defconfig   gcc-12
riscv                 randconfig-001-20240910   gcc-13.2.0
riscv                 randconfig-002-20240910   gcc-13.2.0
s390                             allmodconfig   gcc-14.1.0
s390                              allnoconfig   clang-20
s390                             allyesconfig   gcc-14.1.0
s390                                defconfig   gcc-12
s390                  randconfig-001-20240910   gcc-13.2.0
s390                  randconfig-002-20240910   gcc-13.2.0
s390                       zfcpdump_defconfig   clang-20
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-14.1.0
sh                               allyesconfig   gcc-14.1.0
sh                                  defconfig   gcc-12
sh                          kfr2r09_defconfig   gcc-14.1.0
sh                    randconfig-001-20240910   gcc-13.2.0
sh                    randconfig-002-20240910   gcc-13.2.0
sh                          rsk7269_defconfig   gcc-14.1.0
sh                        sh7785lcr_defconfig   clang-20
sparc                            allmodconfig   gcc-14.1.0
sparc64                             defconfig   gcc-12
sparc64               randconfig-001-20240910   gcc-13.2.0
sparc64               randconfig-002-20240910   gcc-13.2.0
um                               allmodconfig   clang-20
um                                allnoconfig   clang-20
um                               allyesconfig   clang-20
um                               allyesconfig   gcc-12
um                                  defconfig   gcc-12
um                             i386_defconfig   gcc-12
um                    randconfig-001-20240910   gcc-13.2.0
um                    randconfig-002-20240910   gcc-13.2.0
um                           x86_64_defconfig   gcc-12
um                           x86_64_defconfig   gcc-14.1.0
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240910   gcc-12
x86_64       buildonly-randconfig-002-20240910   gcc-12
x86_64       buildonly-randconfig-003-20240910   gcc-12
x86_64       buildonly-randconfig-004-20240910   gcc-12
x86_64       buildonly-randconfig-005-20240910   gcc-12
x86_64       buildonly-randconfig-006-20240910   gcc-12
x86_64                              defconfig   clang-18
x86_64                              defconfig   gcc-11
x86_64                                  kexec   gcc-12
x86_64                randconfig-001-20240910   gcc-12
x86_64                randconfig-002-20240910   gcc-12
x86_64                randconfig-003-20240910   gcc-12
x86_64                randconfig-004-20240910   gcc-12
x86_64                randconfig-005-20240910   gcc-12
x86_64                randconfig-006-20240910   gcc-12
x86_64                randconfig-011-20240910   gcc-12
x86_64                randconfig-012-20240910   gcc-12
x86_64                randconfig-013-20240910   gcc-12
x86_64                randconfig-014-20240910   gcc-12
x86_64                randconfig-015-20240910   gcc-12
x86_64                randconfig-016-20240910   gcc-12
x86_64                randconfig-071-20240910   gcc-12
x86_64                randconfig-072-20240910   gcc-12
x86_64                randconfig-073-20240910   gcc-12
x86_64                randconfig-074-20240910   gcc-12
x86_64                randconfig-075-20240910   gcc-12
x86_64                randconfig-076-20240910   gcc-12
x86_64                          rhel-8.3-rust   clang-18
x86_64                               rhel-8.3   gcc-12
xtensa                            allnoconfig   gcc-14.1.0
xtensa                  nommu_kc705_defconfig   gcc-14.1.0
xtensa                randconfig-001-20240910   gcc-13.2.0
xtensa                randconfig-002-20240910   gcc-13.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
