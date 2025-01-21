Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6179BDDC1
	for <linux-m68k@lists.linux-m68k.org>; Tue, 21 Jan 2025 02:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737426661; cv=none; b=d80hDtULO00wDMIY+CHSAOCYVMj5WdiiJB5mtBCiqezZ1v4/fEi0T3DsyIkWPxZSS9SZ4pIu3qxi3ko88c0CRRJkePU1rHEVLu+rhem9Jp3M/mWAJSRmNQDxafRZsppEuULFntds0sQZyAHCZ+qMcXs5cUJHbturvmRhrCInsJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737426661; c=relaxed/simple;
	bh=Hxy39Sg6SYFTCLKWJj8steVUo+1shAUh0z8fhCsOSyI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KwzyU37m5JILFSFh7o4ZKs54GLlnLlHF+9EsL3RoLmVg0mPQ7K+akj+ttG9pt6PZpL1KfOQSf7QUZ8mtD/hZEjhy4BEzCf/MAeIAJhNosSfyj/1dD8ZyyJuytTYp3t4qvSDuyi8UoIVaApM5HflZhuPcw997MoJM5WJf6orF2iQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KxKeKkVJ; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KxKeKkVJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737426659; x=1768962659;
  h=date:from:to:cc:subject:message-id;
  bh=Hxy39Sg6SYFTCLKWJj8steVUo+1shAUh0z8fhCsOSyI=;
  b=KxKeKkVJaTyoVxR+SwNOWvDBf8/vmOCceZhIlsteqIKqOfZf44fPsN4Z
   I2zqg6N8NJ2Af47/hDo6HFvjl+7jiD+lh/5Ajk30aOO97g85LW7+s3RaM
   VVFPg74nu+VfX1jp2Iyp0/lpWeH02pKTQOslYiuQgfs2718cEwqkirT4j
   t5csTgZKPnrHDAhBgEVyTOQOZ+0VRtRCy4sraLJTbqgfjk+fX0rkKgKj6
   GIn9tyxe4vtAll3HP9t6UgMyd1sg2BlK2HT6Ud9Z2XHhHyxh89Yeky7pS
   HLx4rA8ZqaQAZuoW7bAVXFQm8QIOtoq7NRbxK3IxxwJ4NyGjF/uTB1oO2
   w==;
X-CSE-ConnectionGUID: q3SIr3GSTpCobesu/m2heA==
X-CSE-MsgGUID: NKzz7EPVSBa4jm52VVVQCw==
X-IronPort-AV: E=McAfee;i="6700,10204,11321"; a="40641145"
X-IronPort-AV: E=Sophos;i="6.13,220,1732608000"; 
   d="scan'208";a="40641145"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2025 18:30:58 -0800
X-CSE-ConnectionGUID: NUS3Ios2Qpy+fF8IDH2I4g==
X-CSE-MsgGUID: 6ZhDAhtlSuK6CRQJ6DvJGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="137549541"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 20 Jan 2025 18:30:57 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ta42Y-000XVg-2c;
	Tue, 21 Jan 2025 02:30:54 +0000
Date: Tue, 21 Jan 2025 10:30:00 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:master] BUILD SUCCESS
 eb30b3ef5d11fc77e7d474b4983850d1227e0416
Message-ID: <202501211054.ZWpybqZJ-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git master
branch HEAD: eb30b3ef5d11fc77e7d474b4983850d1227e0416  Merge tag 'v6.13'

elapsed time: 725m

configs tested: 127
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                   randconfig-001-20250120    gcc-13.2.0
arc                   randconfig-002-20250120    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                              allyesconfig    gcc-14.2.0
arm                   randconfig-001-20250120    clang-20
arm                   randconfig-002-20250120    clang-20
arm                   randconfig-003-20250120    clang-20
arm                   randconfig-004-20250120    clang-19
arm                         s3c6400_defconfig    gcc-14.2.0
arm                        spear6xx_defconfig    clang-19
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250120    gcc-14.2.0
arm64                 randconfig-002-20250120    clang-20
arm64                 randconfig-003-20250120    clang-19
arm64                 randconfig-004-20250120    clang-20
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250120    gcc-14.2.0
csky                  randconfig-002-20250120    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon                          allyesconfig    clang-18
hexagon               randconfig-001-20250120    clang-20
hexagon               randconfig-002-20250120    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250120    gcc-11
i386        buildonly-randconfig-002-20250120    clang-19
i386        buildonly-randconfig-003-20250120    gcc-12
i386        buildonly-randconfig-004-20250120    gcc-12
i386        buildonly-randconfig-005-20250120    clang-19
i386        buildonly-randconfig-006-20250120    clang-19
i386                                defconfig    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250120    gcc-14.2.0
loongarch             randconfig-002-20250120    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                        mvme147_defconfig    gcc-14.2.0
m68k                          sun3x_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                        vocore2_defconfig    clang-15
nios2                         10m50_defconfig    gcc-14.2.0
nios2                            alldefconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250120    gcc-14.2.0
nios2                 randconfig-002-20250120    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250120    gcc-14.2.0
parisc                randconfig-002-20250120    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc                       eiger_defconfig    clang-17
powerpc                      katmai_defconfig    clang-18
powerpc                      pcm030_defconfig    clang-17
powerpc                     rainier_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250120    clang-20
powerpc               randconfig-002-20250120    clang-20
powerpc               randconfig-003-20250120    clang-20
powerpc64             randconfig-001-20250120    clang-19
powerpc64             randconfig-002-20250120    clang-17
powerpc64             randconfig-003-20250120    clang-20
riscv                            allmodconfig    clang-20
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-20
riscv                               defconfig    clang-19
riscv                 randconfig-001-20250120    clang-20
riscv                 randconfig-002-20250120    clang-20
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-15
s390                  randconfig-001-20250120    gcc-14.2.0
s390                  randconfig-002-20250120    clang-18
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-14.2.0
sh                    randconfig-001-20250120    gcc-14.2.0
sh                    randconfig-002-20250120    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250120    gcc-14.2.0
sparc                 randconfig-002-20250120    gcc-14.2.0
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20250120    gcc-14.2.0
sparc64               randconfig-002-20250120    gcc-14.2.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-18
um                               allyesconfig    gcc-12
um                                  defconfig    clang-20
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250120    clang-15
um                    randconfig-002-20250120    gcc-12
um                           x86_64_defconfig    clang-15
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250120    clang-19
x86_64      buildonly-randconfig-002-20250120    clang-19
x86_64      buildonly-randconfig-003-20250120    gcc-12
x86_64      buildonly-randconfig-004-20250120    clang-19
x86_64      buildonly-randconfig-005-20250120    clang-19
x86_64      buildonly-randconfig-006-20250120    gcc-11
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250120    gcc-14.2.0
xtensa                randconfig-002-20250120    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
