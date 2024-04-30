Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31869171094
	for <linux-m68k@lists.linux-m68k.org>; Tue, 30 Apr 2024 12:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714481291; cv=none; b=J0+QoCz9peb8XDezNGSqeOUb6t/tMMn8S92wy+1EgQN77UW0MepqFZL4QJOR8m6WUVQvMZnzzNjPp56YFsbLPMyqdFu+JaZfrC8rtohBU+8pjcaiHQt9X1mff73voMTDfXpK7D6OL1JgOeYVeJTY3Lzjs4PLPLYaKROyL3orbQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714481291; c=relaxed/simple;
	bh=7yUkI02/16Jd8rgUibmM45DLlHp1jFqDVHF/wG9N+8I=;
	h=Date:From:To:Cc:Subject:Message-ID; b=oPG8yf9cQ9QwFgYrT59d5fmDtro50b2ahct6H7Y74OGZZe/HdIhCBb6vVVCZoKc8hmwkZ2q0Yb5evbKK24pdJrDcntshcEmlwP/drCMhc40IL7TO8NX149UE30GWpyrIHKx0s1qJDDRaZOUI1JgvHy45v7UH3PBCY33twc0s5OI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J7zhZrr+; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J7zhZrr+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714481289; x=1746017289;
  h=date:from:to:cc:subject:message-id;
  bh=7yUkI02/16Jd8rgUibmM45DLlHp1jFqDVHF/wG9N+8I=;
  b=J7zhZrr+dp0jPApX/1cySAcJSJwDBnIBrdV6+wgXrjIB7ldm0/cLMcg5
   TBxpnCGgfCkiASFIs0Jeb27Un403dk1cWVuFUCDFEL0O3EJgJGBZY/EEw
   AfSoDku1pnaW4pAbyZkvT3SkuUCSbgDxtLuVDTV9dOVwC2gbbB75efA/d
   pPEtj1L/+jX3ShhDH3lLjZ1J+HH9rnBVD+xc5UjMCNIY9rVCeMyK4bcoz
   7UBENuQA+thFFr3jSnSGY8vviM6QwPJ7ZiOHn7NPNfnBE2rNyXyGGRsAx
   T/Dq34HhR4t+VjPjwzeZWKgQJqXB2i2xbGSQk45qoSpXm2FczTNMeNXYP
   g==;
X-CSE-ConnectionGUID: If4ezSnyQCOAzAtKJS88jw==
X-CSE-MsgGUID: fIiFV8wCTu+LO3uy4uTtgw==
X-IronPort-AV: E=McAfee;i="6600,9927,11059"; a="13111107"
X-IronPort-AV: E=Sophos;i="6.07,242,1708416000"; 
   d="scan'208";a="13111107"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2024 05:48:08 -0700
X-CSE-ConnectionGUID: sYk8nGKHSKe5NBdMVZbrMA==
X-CSE-MsgGUID: zjIkKD8MQbG4VpE6OUtf0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,242,1708416000"; 
   d="scan'208";a="63940066"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 30 Apr 2024 05:48:06 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s1mtv-00088J-39;
	Tue, 30 Apr 2024 12:48:03 +0000
Date: Tue, 30 Apr 2024 20:48:02 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:for-v6.10] BUILD SUCCESS
 bd622532f7b35805d6afde38639b0d631fda818b
Message-ID: <202404302059.ui70tixA-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git for-v6.10
branch HEAD: bd622532f7b35805d6afde38639b0d631fda818b  m68k: amiga: Use str_plural() to fix Coccinelle warning

elapsed time: 1295m

configs tested: 171
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
arc                         haps_hs_defconfig   gcc  
arc                   randconfig-001-20240430   gcc  
arc                   randconfig-002-20240430   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                        neponset_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   clang
arm64                               defconfig   gcc  
arm64                 randconfig-002-20240430   gcc  
arm64                 randconfig-004-20240430   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240430   gcc  
csky                  randconfig-002-20240430   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240430   gcc  
i386         buildonly-randconfig-002-20240430   clang
i386         buildonly-randconfig-003-20240430   gcc  
i386         buildonly-randconfig-004-20240430   clang
i386         buildonly-randconfig-005-20240430   clang
i386         buildonly-randconfig-006-20240430   gcc  
i386                                defconfig   clang
i386                  randconfig-001-20240430   clang
i386                  randconfig-002-20240430   gcc  
i386                  randconfig-003-20240430   gcc  
i386                  randconfig-004-20240430   gcc  
i386                  randconfig-005-20240430   gcc  
i386                  randconfig-006-20240430   gcc  
i386                  randconfig-011-20240430   gcc  
i386                  randconfig-012-20240430   clang
i386                  randconfig-013-20240430   clang
i386                  randconfig-014-20240430   gcc  
i386                  randconfig-015-20240430   gcc  
i386                  randconfig-016-20240430   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240430   gcc  
loongarch             randconfig-002-20240430   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                       m5208evb_defconfig   gcc  
m68k                           sun3_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240430   gcc  
nios2                 randconfig-002-20240430   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240430   gcc  
parisc                randconfig-002-20240430   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                     kmeter1_defconfig   gcc  
powerpc                     ppa8548_defconfig   gcc  
powerpc                      ppc64e_defconfig   gcc  
powerpc               randconfig-001-20240430   gcc  
powerpc               randconfig-002-20240430   gcc  
powerpc                    sam440ep_defconfig   gcc  
powerpc                     tqm5200_defconfig   gcc  
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240430   gcc  
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240430   gcc  
s390                  randconfig-002-20240430   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                            hp6xx_defconfig   gcc  
sh                     magicpanelr2_defconfig   gcc  
sh                    randconfig-001-20240430   gcc  
sh                    randconfig-002-20240430   gcc  
sh                           se7721_defconfig   gcc  
sh                           se7722_defconfig   gcc  
sh                           se7780_defconfig   gcc  
sh                             sh03_defconfig   gcc  
sh                     sh7710voipgw_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240430   gcc  
sparc64               randconfig-002-20240430   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240430   gcc  
x86_64       buildonly-randconfig-002-20240430   clang
x86_64       buildonly-randconfig-003-20240430   clang
x86_64       buildonly-randconfig-004-20240430   clang
x86_64       buildonly-randconfig-005-20240430   clang
x86_64       buildonly-randconfig-006-20240430   clang
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240430   clang
x86_64                randconfig-002-20240430   clang
x86_64                randconfig-003-20240430   gcc  
x86_64                randconfig-004-20240430   gcc  
x86_64                randconfig-005-20240430   gcc  
x86_64                randconfig-006-20240430   clang
x86_64                randconfig-011-20240430   clang
x86_64                randconfig-012-20240430   clang
x86_64                randconfig-013-20240430   gcc  
x86_64                randconfig-014-20240430   clang
x86_64                randconfig-015-20240430   clang
x86_64                randconfig-016-20240430   clang
x86_64                randconfig-071-20240430   clang
x86_64                randconfig-072-20240430   clang
x86_64                randconfig-073-20240430   clang
x86_64                randconfig-074-20240430   clang
x86_64                randconfig-075-20240430   gcc  
x86_64                randconfig-076-20240430   clang
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa                randconfig-001-20240430   gcc  
xtensa                randconfig-002-20240430   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
