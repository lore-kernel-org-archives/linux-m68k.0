Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D6C614A092
	for <linux-m68k@lists.linux-m68k.org>; Mon,  2 Sep 2024 23:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725320671; cv=none; b=EAH7GnNpkgfh5Ttp9q/lbpYiDbqrgp/c4NpjLb5f6bKaUKQYUzuKoCyMsLJ8QdXMoasYLoJUSywbfuiiyu0EWdRGc512SiRRhcIuFOdzGuDbomjGUChq93AQuPjbZwgiuorRLWhBaVXcuzffsCs39GDu5yLck3nhr2rnzY0vyAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725320671; c=relaxed/simple;
	bh=ezRu161GeqEeJFQJQpypYsWdzfk/+CHlo4hwKZedsz4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=oQUA+S27NIRqmad6DAfdwVMOAoO8m3y0o7vg9F7tNdsqcNZD4841Sns0FJze00ykhDq6bZgBOMOU0O9cMaqBI1x10/RE9nByRTKW4j7CYgBjKvQlUpXNyxKAeZC7WxEB5H/eQ5t6KHun2KKDoCPQ8Bt6bU+sQ3djLIwwcwwQmZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RopCNLgx; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RopCNLgx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725320669; x=1756856669;
  h=date:from:to:cc:subject:message-id;
  bh=ezRu161GeqEeJFQJQpypYsWdzfk/+CHlo4hwKZedsz4=;
  b=RopCNLgxUxQW8mXR4AFm8aq7XGhboV+WWQqhXa5OROF3T7OeZYNVgOg9
   /hGP+D8Ctn/uY2CumIN67Pa0yhPHDgMcu/Hh125agNjH0dMQk6oQiWwFM
   5wMTJnwoYfR4urOXIJYGyQR3MyUUST8cUFJg78EUa2d1DtpVqdTAe5IaY
   TkqBnwWYPLdok6revw4WlESDfc+AC+t5F71Xl1f9BjqJEHqj6MB9Zkx0V
   tLSI4tK7MmVqd3bM+3e8J9exRSVmTFdxQZJZG3/VsMGOglsX2F6XdmgLG
   5jwDSRgi/jdXtEmHafoAZfV/G6iMNRQpUxAkG412HBA3N353ZKJwbPNS7
   Q==;
X-CSE-ConnectionGUID: 159G904sTjeRAIXX4jnuHg==
X-CSE-MsgGUID: LUry3Ek0Rxqf3RIMj9cYOA==
X-IronPort-AV: E=McAfee;i="6700,10204,11183"; a="24016308"
X-IronPort-AV: E=Sophos;i="6.10,196,1719903600"; 
   d="scan'208";a="24016308"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2024 16:44:28 -0700
X-CSE-ConnectionGUID: 7ThZyeIEQRe+H7I7MpXOoQ==
X-CSE-MsgGUID: U8FVBscDSWmQ694ad6xOcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,196,1719903600"; 
   d="scan'208";a="64908020"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 02 Sep 2024 16:44:26 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1slGie-00061u-0J;
	Mon, 02 Sep 2024 23:44:24 +0000
Date: Tue, 03 Sep 2024 07:43:40 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:master] BUILD SUCCESS
 d1b21794855ee7cd686b0b36def437f054654025
Message-ID: <202409030738.RAOwZADr-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git master
branch HEAD: d1b21794855ee7cd686b0b36def437f054654025  Merge tag 'v6.11-rc6'

elapsed time: 938m

configs tested: 135
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-14.1.0
alpha                            allyesconfig   clang-20
alpha                               defconfig   gcc-14.1.0
arc                              allmodconfig   clang-20
arc                               allnoconfig   gcc-14.1.0
arc                              allyesconfig   clang-20
arc                          axs103_defconfig   gcc-14.1.0
arc                                 defconfig   gcc-14.1.0
arm                              allmodconfig   clang-20
arm                               allnoconfig   gcc-14.1.0
arm                              allyesconfig   clang-20
arm                                 defconfig   gcc-14.1.0
arm                       imx_v4_v5_defconfig   gcc-14.1.0
arm                        neponset_defconfig   gcc-14.1.0
arm                         vf610m4_defconfig   gcc-14.1.0
arm64                            allmodconfig   clang-20
arm64                             allnoconfig   gcc-14.1.0
arm64                               defconfig   gcc-14.1.0
csky                              allnoconfig   gcc-14.1.0
csky                                defconfig   gcc-14.1.0
hexagon                          allmodconfig   clang-20
hexagon                           allnoconfig   gcc-14.1.0
hexagon                          allyesconfig   clang-20
hexagon                             defconfig   gcc-14.1.0
i386                             allmodconfig   clang-18
i386                              allnoconfig   clang-18
i386                             allyesconfig   clang-18
i386         buildonly-randconfig-001-20240902   clang-18
i386         buildonly-randconfig-002-20240902   clang-18
i386         buildonly-randconfig-003-20240902   clang-18
i386         buildonly-randconfig-004-20240902   clang-18
i386         buildonly-randconfig-005-20240902   clang-18
i386         buildonly-randconfig-006-20240902   clang-18
i386                                defconfig   clang-18
i386                  randconfig-001-20240902   clang-18
i386                  randconfig-002-20240902   clang-18
i386                  randconfig-003-20240902   clang-18
i386                  randconfig-004-20240902   clang-18
i386                  randconfig-005-20240902   clang-18
i386                  randconfig-006-20240902   clang-18
i386                  randconfig-011-20240902   clang-18
i386                  randconfig-012-20240902   clang-18
i386                  randconfig-013-20240902   clang-18
i386                  randconfig-014-20240902   clang-18
i386                  randconfig-015-20240902   clang-18
i386                  randconfig-016-20240902   clang-18
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-14.1.0
loongarch                           defconfig   gcc-14.1.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-14.1.0
m68k                             allyesconfig   gcc-14.1.0
m68k                          amiga_defconfig   gcc-14.1.0
m68k                                defconfig   gcc-14.1.0
m68k                       m5208evb_defconfig   gcc-14.1.0
m68k                       m5249evb_defconfig   gcc-14.1.0
m68k                          sun3x_defconfig   gcc-14.1.0
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-14.1.0
microblaze                       allyesconfig   gcc-14.1.0
microblaze                          defconfig   gcc-14.1.0
mips                              allnoconfig   gcc-14.1.0
mips                 decstation_r4k_defconfig   gcc-14.1.0
mips                           mtx1_defconfig   gcc-14.1.0
mips                       rbtx49xx_defconfig   gcc-14.1.0
nios2                             allnoconfig   gcc-14.1.0
nios2                               defconfig   gcc-14.1.0
openrisc                          allnoconfig   clang-20
openrisc                         allyesconfig   gcc-14.1.0
openrisc                            defconfig   gcc-12
parisc                           allmodconfig   gcc-14.1.0
parisc                            allnoconfig   clang-20
parisc                           allyesconfig   gcc-14.1.0
parisc                              defconfig   gcc-12
parisc64                            defconfig   gcc-14.1.0
powerpc                          allmodconfig   gcc-14.1.0
powerpc                           allnoconfig   clang-20
powerpc                          allyesconfig   gcc-14.1.0
powerpc                        cell_defconfig   gcc-14.1.0
powerpc                   currituck_defconfig   gcc-14.1.0
powerpc                       ebony_defconfig   gcc-14.1.0
powerpc                     powernv_defconfig   gcc-14.1.0
riscv                            allmodconfig   gcc-14.1.0
riscv                             allnoconfig   clang-20
riscv                            allyesconfig   gcc-14.1.0
riscv                               defconfig   gcc-12
s390                             allmodconfig   gcc-14.1.0
s390                              allnoconfig   clang-20
s390                             allyesconfig   gcc-14.1.0
s390                                defconfig   gcc-12
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-14.1.0
sh                               allyesconfig   gcc-14.1.0
sh                                  defconfig   gcc-12
sh                      rts7751r2d1_defconfig   gcc-14.1.0
sparc                            allmodconfig   gcc-14.1.0
sparc64                             defconfig   gcc-12
um                               allmodconfig   clang-20
um                                allnoconfig   clang-20
um                               allyesconfig   clang-20
um                                  defconfig   gcc-12
um                             i386_defconfig   gcc-12
um                           x86_64_defconfig   gcc-12
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240902   clang-18
x86_64       buildonly-randconfig-002-20240902   clang-18
x86_64       buildonly-randconfig-003-20240902   clang-18
x86_64       buildonly-randconfig-004-20240902   clang-18
x86_64       buildonly-randconfig-005-20240902   clang-18
x86_64       buildonly-randconfig-006-20240902   clang-18
x86_64                              defconfig   clang-18
x86_64                                  kexec   gcc-12
x86_64                randconfig-001-20240902   clang-18
x86_64                randconfig-002-20240902   clang-18
x86_64                randconfig-003-20240902   clang-18
x86_64                randconfig-004-20240902   clang-18
x86_64                randconfig-005-20240902   clang-18
x86_64                randconfig-006-20240902   clang-18
x86_64                randconfig-011-20240902   clang-18
x86_64                randconfig-012-20240902   clang-18
x86_64                randconfig-013-20240902   clang-18
x86_64                randconfig-014-20240902   clang-18
x86_64                randconfig-015-20240902   clang-18
x86_64                randconfig-016-20240902   clang-18
x86_64                randconfig-071-20240902   clang-18
x86_64                randconfig-072-20240902   clang-18
x86_64                randconfig-073-20240902   clang-18
x86_64                randconfig-074-20240902   clang-18
x86_64                randconfig-075-20240902   clang-18
x86_64                randconfig-076-20240902   clang-18
x86_64                          rhel-8.3-rust   clang-18
x86_64                               rhel-8.3   gcc-12
xtensa                            allnoconfig   gcc-14.1.0
xtensa                  cadence_csp_defconfig   gcc-14.1.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
