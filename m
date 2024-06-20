Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BEFC1879
	for <linux-m68k@lists.linux-m68k.org>; Thu, 20 Jun 2024 00:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718843945; cv=none; b=EkUipGCwYo5vkT0yPbcT95pVdkO364DxVgz5y7MJeTuVYMY11xcn7/FxWnk46XeE/B7zh7bzWib+b3Ug8DmiKGgeuKj0MRZghNjK5/R7+Xn6Kqu6npQn5APhGjhCax5o+bgi8j6V3xa2N0qSuN6yB38FBZT4ptk0D8EKOXwj2Z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718843945; c=relaxed/simple;
	bh=QLcopm42Dq9x62Eqba93sghsGSWqG3fbzn617xwSiDo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VhnSQxHU/Ga4xJMnQmzBMSgaMno7TpMRoumQqQG9YjrnCg1NCUrKJ7J6LUIrWOf2Cl9AEGxZYL1vVaYMBRxrXznDK7tnDZsFZIpfzaQ1O9ntYdg5G/mwkzbJowmKlqy6KYbjC9qSJWXk9Vn0T7SHXiqU5uDibkCskcqyQcnnoWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dELu0tIH; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dELu0tIH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718843943; x=1750379943;
  h=date:from:to:cc:subject:message-id;
  bh=QLcopm42Dq9x62Eqba93sghsGSWqG3fbzn617xwSiDo=;
  b=dELu0tIHUEZpUTi3DC7gbSTmUTqX0IhWv0T7D64FjY2FgnbM1ezGhTul
   6iqrH/f84hTL7MFZqFbvV8mB/D2JVwkCaK1lo01Vz2wgU23MSlclttDVo
   xbc8K9Woh9wHau1dlqmtiJNjakjSyXoCUGX9C2TevHYgXEQa64vq3hVUO
   2otOUdXFC2glWLRXtNyr2sk5+2w37fWQ4CpDaRcK9Fvizms5PqGakDnx8
   8AqYZMKPK/aWAxfdc/m+jZhvymBSqk7xMK09ZHPmeCLHyt9YW1jdexLq8
   8wZQSnuIlwCBA/cK8ZXJQYwnCpTbCiNohg+KIakS4tPQNOP0uji2ozksG
   g==;
X-CSE-ConnectionGUID: jl+Ni+TdTy+vO6BTsr643g==
X-CSE-MsgGUID: FN+mQ7LoQqi/wIfzRmKBZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11108"; a="15675558"
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; 
   d="scan'208";a="15675558"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2024 17:39:02 -0700
X-CSE-ConnectionGUID: ddIk8czCQVC0kQXN5g7LZQ==
X-CSE-MsgGUID: LoT1AhBZSfevABvjQvCcNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; 
   d="scan'208";a="42530889"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 19 Jun 2024 17:39:01 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sK5pK-00078a-2X;
	Thu, 20 Jun 2024 00:38:58 +0000
Date: Thu, 20 Jun 2024 08:38:45 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:master] BUILD SUCCESS
 1a2a64296e177ae6ebde9ef3ff7263073c194093
Message-ID: <202406200842.tmr4urfZ-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git master
branch HEAD: 1a2a64296e177ae6ebde9ef3ff7263073c194093  Merge tag 'v6.10-rc4'

elapsed time: 3520m

configs tested: 115
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                               defconfig   gcc-13.2.0
arc                        nsim_700_defconfig   gcc-13.2.0
arc                   randconfig-001-20240618   gcc-13.2.0
arc                   randconfig-002-20240618   gcc-13.2.0
arc                           tb10x_defconfig   gcc-13.2.0
arm                         at91_dt_defconfig   clang-19
arm                   milbeaut_m10v_defconfig   clang-16
arm                   randconfig-001-20240618   gcc-13.2.0
arm                   randconfig-002-20240618   gcc-13.2.0
arm                   randconfig-003-20240618   clang-19
arm                   randconfig-004-20240618   gcc-13.2.0
arm                         socfpga_defconfig   gcc-13.2.0
arm64                 randconfig-001-20240618   clang-17
arm64                 randconfig-002-20240618   clang-19
arm64                 randconfig-003-20240618   clang-16
arm64                 randconfig-004-20240618   clang-19
csky                  randconfig-001-20240618   gcc-13.2.0
csky                  randconfig-002-20240618   gcc-13.2.0
hexagon               randconfig-001-20240618   clang-19
hexagon               randconfig-002-20240618   clang-19
i386         buildonly-randconfig-001-20240618   gcc-13
i386         buildonly-randconfig-002-20240618   gcc-12
i386         buildonly-randconfig-003-20240618   gcc-8
i386         buildonly-randconfig-004-20240618   gcc-10
i386         buildonly-randconfig-005-20240618   gcc-10
i386         buildonly-randconfig-006-20240618   gcc-10
i386                  randconfig-001-20240618   clang-18
i386                  randconfig-002-20240618   gcc-13
i386                  randconfig-003-20240618   gcc-13
i386                  randconfig-004-20240618   clang-18
i386                  randconfig-005-20240618   clang-18
i386                  randconfig-006-20240618   clang-18
i386                  randconfig-011-20240618   gcc-13
i386                  randconfig-012-20240618   gcc-11
i386                  randconfig-013-20240618   gcc-7
i386                  randconfig-014-20240618   gcc-11
i386                  randconfig-015-20240618   clang-18
i386                  randconfig-016-20240618   clang-18
loongarch             randconfig-001-20240618   gcc-13.2.0
loongarch             randconfig-002-20240618   gcc-13.2.0
mips                        maltaup_defconfig   clang-19
nios2                 randconfig-001-20240618   gcc-13.2.0
nios2                 randconfig-002-20240618   gcc-13.2.0
openrisc                          allnoconfig   gcc-13.2.0
openrisc                            defconfig   gcc-13.2.0
parisc                            allnoconfig   gcc-13.2.0
parisc                              defconfig   gcc-13.2.0
parisc                randconfig-001-20240618   gcc-13.2.0
parisc                randconfig-002-20240618   gcc-13.2.0
parisc64                            defconfig   gcc-13.2.0
powerpc                           allnoconfig   gcc-13.2.0
powerpc                    mvme5100_defconfig   gcc-13.2.0
powerpc                      pmac32_defconfig   clang-19
powerpc               randconfig-001-20240618   gcc-13.2.0
powerpc               randconfig-002-20240618   clang-19
powerpc               randconfig-003-20240618   clang-19
powerpc64             randconfig-001-20240618   clang-19
powerpc64             randconfig-002-20240618   clang-17
powerpc64             randconfig-003-20240618   clang-19
riscv                             allnoconfig   gcc-13.2.0
riscv                               defconfig   clang-19
riscv                 randconfig-001-20240618   gcc-13.2.0
riscv                 randconfig-002-20240618   clang-14
s390                              allnoconfig   clang-19
s390                                defconfig   clang-19
s390                  randconfig-001-20240618   clang-15
s390                  randconfig-002-20240618   gcc-13.2.0
sh                                allnoconfig   gcc-13.2.0
sh                                  defconfig   gcc-13.2.0
sh                    randconfig-001-20240618   gcc-13.2.0
sh                    randconfig-002-20240618   gcc-13.2.0
sh                           se7206_defconfig   gcc-13.2.0
sh                           se7343_defconfig   gcc-13.2.0
sh                           se7751_defconfig   gcc-13.2.0
sh                             shx3_defconfig   gcc-13.2.0
sparc                             allnoconfig   gcc-13.2.0
sparc                               defconfig   gcc-13.2.0
sparc                       sparc64_defconfig   gcc-13.2.0
sparc64                             defconfig   gcc-13.2.0
sparc64               randconfig-001-20240618   gcc-13.2.0
sparc64               randconfig-002-20240618   gcc-13.2.0
um                                allnoconfig   clang-17
um                                  defconfig   clang-19
um                             i386_defconfig   gcc-13
um                    randconfig-001-20240618   clang-19
um                    randconfig-002-20240618   clang-19
um                           x86_64_defconfig   clang-15
x86_64       buildonly-randconfig-001-20240618   clang-18
x86_64       buildonly-randconfig-002-20240618   gcc-8
x86_64       buildonly-randconfig-003-20240618   clang-18
x86_64       buildonly-randconfig-004-20240618   gcc-13
x86_64       buildonly-randconfig-005-20240618   gcc-13
x86_64       buildonly-randconfig-006-20240618   gcc-12
x86_64                randconfig-001-20240618   clang-18
x86_64                randconfig-002-20240618   clang-18
x86_64                randconfig-003-20240618   gcc-11
x86_64                randconfig-004-20240618   clang-18
x86_64                randconfig-005-20240618   clang-18
x86_64                randconfig-006-20240618   clang-18
x86_64                randconfig-011-20240618   gcc-13
x86_64                randconfig-012-20240618   gcc-8
x86_64                randconfig-013-20240618   clang-18
x86_64                randconfig-014-20240618   clang-18
x86_64                randconfig-015-20240618   gcc-13
x86_64                randconfig-016-20240618   clang-18
x86_64                randconfig-071-20240618   gcc-13
x86_64                randconfig-072-20240618   clang-18
x86_64                randconfig-073-20240618   gcc-12
x86_64                randconfig-074-20240618   clang-18
x86_64                randconfig-075-20240618   gcc-8
x86_64                randconfig-076-20240618   gcc-13
xtensa                            allnoconfig   gcc-13.2.0
xtensa                  cadence_csp_defconfig   gcc-13.2.0
xtensa                randconfig-001-20240618   gcc-13.2.0
xtensa                randconfig-002-20240618   gcc-13.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
