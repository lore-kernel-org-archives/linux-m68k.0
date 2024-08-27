Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FE8F1BDDF
	for <linux-m68k@lists.linux-m68k.org>; Tue, 27 Aug 2024 04:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724733653; cv=none; b=mV36oZ+3VwTboPR4Jpcs1RaoqA64lMZZRYr4aMJRGepECkUr8tVBjup3XGkPFhaMBfSILmOS3tMNErhGSnZebx0hZ9QgVFvpCrBb76BMLsAV0Y8bYR/sO/H9jBn1x8+UOfOlrhi+m5Pba0TTLC0R7a+dxh/5c9CrD1ef6iatJd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724733653; c=relaxed/simple;
	bh=O6+YotmbnswNT7U2CMMJRe+pgfGz1haSO80V4rRlVqs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Yg8KeMyTOx45OnW2lasHHIJAWmhCx+9K0ZNE0dMc33Ly7LQXsHd7LOav6W23YZHndQptguHzJkR07uJ+X6jVsy3sQ/3SdtK0flE9r1qsZaumoxdW0J0MwyvOqxNgJFlVgNlM7Xet7II2ycmX6OEzigQdPWQH5Ahl+gUAtxohKdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y6dlD1Ik; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y6dlD1Ik"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724733651; x=1756269651;
  h=date:from:to:cc:subject:message-id;
  bh=O6+YotmbnswNT7U2CMMJRe+pgfGz1haSO80V4rRlVqs=;
  b=Y6dlD1Ik9rjqb429SrYwLJkV0Sg4cFGoh+uX3w/KkGe3hFb5PUXIDDrl
   y+2NNs3WpiHGj49hK8VEEv4xh7O4DMNyu7aj4I1CBQAAGnNeNqNhELSC4
   jTza410HZQV0JcGNZxpCi092VVghenIBbq/zLouurGJWKVYXQX/D8t61I
   /ga1LV+MLpc7iUj6AU5Jnn5KJ056uwhwBl2jQDQGQWz1/b7o7xjmW/fRv
   lUMVlK0c04ZS0TgOCUZVZ9z92glymJMbpEfPByP43NUq+W9Cim7PaDwBa
   7Cbn1M0j1KE8q+62bGV7uiqrLGE956SocFJEX99W62NQC0ngguBdWXLWd
   A==;
X-CSE-ConnectionGUID: EOYNVI4OS1aq16L+IzZ87w==
X-CSE-MsgGUID: Kv2nBIZ4QQOzUKpXbUIAFQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="26091069"
X-IronPort-AV: E=Sophos;i="6.10,179,1719903600"; 
   d="scan'208";a="26091069"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2024 21:40:50 -0700
X-CSE-ConnectionGUID: GKHwBk85QTe2gB3vRb9B9Q==
X-CSE-MsgGUID: LRulm+ZTRNGniuc4/4ilxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,179,1719903600"; 
   d="scan'208";a="93527450"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 26 Aug 2024 21:40:49 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sio0c-000HwR-1y;
	Tue, 27 Aug 2024 04:40:46 +0000
Date: Tue, 27 Aug 2024 12:39:56 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:master] BUILD SUCCESS
 d58bb1895199bf0700b15faf136ed6f4ad12a918
Message-ID: <202408271254.EWrgvPlB-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git master
branch HEAD: d58bb1895199bf0700b15faf136ed6f4ad12a918  m68k: Fix kernel_clone_args.flags in m68k_clone()

elapsed time: 1211m

configs tested: 186
configs skipped: 7

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.2.0
alpha                            allyesconfig   gcc-13.3.0
alpha                               defconfig   gcc-12.4.0
alpha                               defconfig   gcc-13.2.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                                 defconfig   gcc-13.2.0
arc                   randconfig-001-20240827   gcc-13.2.0
arc                   randconfig-002-20240827   gcc-13.2.0
arm                              allmodconfig   gcc-13.2.0
arm                              allmodconfig   gcc-14.1.0
arm                               allnoconfig   gcc-13.2.0
arm                              allyesconfig   gcc-13.2.0
arm                              allyesconfig   gcc-14.1.0
arm                         at91_dt_defconfig   gcc-12.4.0
arm                                 defconfig   gcc-13.2.0
arm                          ep93xx_defconfig   gcc-12.4.0
arm                       imx_v4_v5_defconfig   gcc-12.4.0
arm                         lpc18xx_defconfig   gcc-12.4.0
arm                   randconfig-001-20240827   gcc-13.2.0
arm                   randconfig-002-20240827   gcc-13.2.0
arm                   randconfig-003-20240827   gcc-13.2.0
arm                   randconfig-004-20240827   gcc-13.2.0
arm                             rpc_defconfig   gcc-12.4.0
arm64                            allmodconfig   clang-20
arm64                            allmodconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-13.2.0
arm64                               defconfig   gcc-13.2.0
arm64                 randconfig-001-20240827   gcc-13.2.0
arm64                 randconfig-002-20240827   gcc-13.2.0
arm64                 randconfig-003-20240827   gcc-13.2.0
arm64                 randconfig-004-20240827   gcc-13.2.0
csky                              allnoconfig   gcc-13.2.0
csky                                defconfig   gcc-13.2.0
csky                  randconfig-001-20240827   gcc-13.2.0
csky                  randconfig-002-20240827   gcc-13.2.0
hexagon                          allmodconfig   clang-20
hexagon                          allyesconfig   clang-20
i386                             alldefconfig   gcc-12.4.0
i386                             allmodconfig   clang-18
i386                             allmodconfig   gcc-12
i386                              allnoconfig   clang-18
i386                              allnoconfig   gcc-12
i386                             allyesconfig   clang-18
i386                             allyesconfig   gcc-12
i386         buildonly-randconfig-001-20240827   gcc-12
i386         buildonly-randconfig-002-20240827   clang-18
i386         buildonly-randconfig-002-20240827   gcc-12
i386         buildonly-randconfig-003-20240827   gcc-12
i386         buildonly-randconfig-004-20240827   clang-18
i386         buildonly-randconfig-004-20240827   gcc-12
i386         buildonly-randconfig-005-20240827   clang-18
i386         buildonly-randconfig-005-20240827   gcc-12
i386         buildonly-randconfig-006-20240827   gcc-12
i386                                defconfig   clang-18
i386                  randconfig-001-20240827   gcc-12
i386                  randconfig-002-20240827   gcc-12
i386                  randconfig-003-20240827   gcc-12
i386                  randconfig-004-20240827   gcc-12
i386                  randconfig-005-20240827   gcc-12
i386                  randconfig-006-20240827   clang-18
i386                  randconfig-006-20240827   gcc-12
i386                  randconfig-011-20240827   clang-18
i386                  randconfig-011-20240827   gcc-12
i386                  randconfig-012-20240827   clang-18
i386                  randconfig-012-20240827   gcc-12
i386                  randconfig-013-20240827   clang-18
i386                  randconfig-013-20240827   gcc-12
i386                  randconfig-014-20240827   gcc-12
i386                  randconfig-015-20240827   gcc-12
i386                  randconfig-016-20240827   clang-18
i386                  randconfig-016-20240827   gcc-12
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-13.2.0
loongarch                           defconfig   gcc-13.2.0
loongarch             randconfig-001-20240827   gcc-13.2.0
loongarch             randconfig-002-20240827   gcc-13.2.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-13.2.0
m68k                             allyesconfig   gcc-14.1.0
m68k                                defconfig   gcc-13.2.0
m68k                            q40_defconfig   gcc-12.4.0
m68k                          sun3x_defconfig   gcc-12.4.0
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-13.2.0
microblaze                       allyesconfig   gcc-14.1.0
microblaze                          defconfig   gcc-13.2.0
mips                              allnoconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-13.2.0
nios2                               defconfig   gcc-13.2.0
nios2                 randconfig-001-20240827   gcc-13.2.0
nios2                 randconfig-002-20240827   gcc-13.2.0
openrisc                          allnoconfig   gcc-14.1.0
openrisc                         allyesconfig   gcc-14.1.0
openrisc                            defconfig   gcc-14.1.0
parisc                           allmodconfig   gcc-14.1.0
parisc                            allnoconfig   gcc-14.1.0
parisc                           allyesconfig   gcc-14.1.0
parisc                              defconfig   gcc-14.1.0
parisc                randconfig-001-20240827   gcc-13.2.0
parisc                randconfig-002-20240827   gcc-13.2.0
parisc64                            defconfig   gcc-13.2.0
powerpc                          allmodconfig   gcc-14.1.0
powerpc                           allnoconfig   gcc-14.1.0
powerpc                          allyesconfig   clang-20
powerpc                          allyesconfig   gcc-14.1.0
powerpc                      chrp32_defconfig   gcc-12.4.0
powerpc               randconfig-001-20240827   gcc-13.2.0
powerpc               randconfig-002-20240827   gcc-13.2.0
powerpc               randconfig-003-20240827   gcc-13.2.0
powerpc                     redwood_defconfig   gcc-12.4.0
powerpc                      tqm8xx_defconfig   gcc-12.4.0
powerpc64             randconfig-002-20240827   gcc-13.2.0
powerpc64             randconfig-003-20240827   gcc-13.2.0
riscv                            allmodconfig   clang-20
riscv                            allmodconfig   gcc-14.1.0
riscv                             allnoconfig   gcc-14.1.0
riscv                            allyesconfig   clang-20
riscv                            allyesconfig   gcc-14.1.0
riscv                               defconfig   gcc-14.1.0
riscv                 randconfig-001-20240827   gcc-13.2.0
riscv                 randconfig-002-20240827   gcc-13.2.0
s390                             allmodconfig   clang-20
s390                              allnoconfig   clang-20
s390                              allnoconfig   gcc-14.1.0
s390                             allyesconfig   clang-20
s390                             allyesconfig   gcc-14.1.0
s390                                defconfig   gcc-14.1.0
s390                  randconfig-001-20240827   gcc-13.2.0
s390                  randconfig-002-20240827   gcc-13.2.0
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-13.2.0
sh                               allyesconfig   gcc-14.1.0
sh                                  defconfig   gcc-14.1.0
sh                 kfr2r09-romimage_defconfig   gcc-12.4.0
sh                    randconfig-001-20240827   gcc-13.2.0
sh                    randconfig-002-20240827   gcc-13.2.0
sh                           se7724_defconfig   gcc-12.4.0
sparc                            allmodconfig   gcc-14.1.0
sparc64                             defconfig   gcc-14.1.0
sparc64               randconfig-001-20240827   gcc-13.2.0
sparc64               randconfig-002-20240827   gcc-13.2.0
um                               allmodconfig   clang-20
um                               allmodconfig   gcc-13.3.0
um                                allnoconfig   clang-17
um                                allnoconfig   gcc-14.1.0
um                               allyesconfig   gcc-12
um                               allyesconfig   gcc-13.3.0
um                                  defconfig   gcc-14.1.0
um                             i386_defconfig   gcc-14.1.0
um                    randconfig-001-20240827   gcc-13.2.0
um                    randconfig-002-20240827   gcc-13.2.0
um                           x86_64_defconfig   gcc-14.1.0
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-002-20240827   clang-18
x86_64       buildonly-randconfig-003-20240827   clang-18
x86_64       buildonly-randconfig-004-20240827   clang-18
x86_64       buildonly-randconfig-005-20240827   clang-18
x86_64       buildonly-randconfig-006-20240827   clang-18
x86_64                              defconfig   clang-18
x86_64                              defconfig   gcc-11
x86_64                randconfig-001-20240827   clang-18
x86_64                randconfig-002-20240827   clang-18
x86_64                randconfig-003-20240827   clang-18
x86_64                randconfig-004-20240827   clang-18
x86_64                randconfig-005-20240827   clang-18
x86_64                randconfig-006-20240827   clang-18
x86_64                randconfig-011-20240827   clang-18
x86_64                randconfig-012-20240827   clang-18
x86_64                randconfig-013-20240827   clang-18
x86_64                randconfig-014-20240827   clang-18
x86_64                randconfig-015-20240827   clang-18
x86_64                randconfig-016-20240827   clang-18
x86_64                randconfig-071-20240827   clang-18
x86_64                randconfig-072-20240827   clang-18
x86_64                randconfig-073-20240827   clang-18
x86_64                randconfig-074-20240827   clang-18
x86_64                randconfig-075-20240827   clang-18
x86_64                randconfig-076-20240827   clang-18
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-13.2.0
xtensa                randconfig-001-20240827   gcc-13.2.0
xtensa                randconfig-002-20240827   gcc-13.2.0
xtensa                    xip_kc705_defconfig   gcc-12.4.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
