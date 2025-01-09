Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03E5019922F
	for <linux-m68k@lists.linux-m68k.org>; Thu,  9 Jan 2025 18:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736446797; cv=none; b=j3ggiZhIkO5trwhM6rjIfIsygVgE+G294d+vSi1OswxzcumyXQ7p9wE1tbA+6EGO9VII+y7D9OMkTLVH3zhR9yND2JxnOK3Nncf/p2UWriLJUoOpOnqtRH2X5LbaA7cBTcuncWGl+y32FpTe6Wqg2mzLf1keYeXq4m2Sr/a8C4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736446797; c=relaxed/simple;
	bh=HyaQsb6G2Ye16QtLJGcufg14/IoFZ2Msa519QHmnv0c=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CMg4mYtmJPuBf2jWp+P9PZ+kMNhI0xwYentDmKrnnPlp/tTv6VpOTxdqg9fnpCp60y/V23dA8hCHDlQEdBFrY15eE7u22B7/xV7Uk1peVVhPixVB5ln4ds01gEwF2V1vM5SRWYbKtIQfCyAVvqlHt/IAMjzjz8pXzxE9xGXaxXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mMYs5OSn; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mMYs5OSn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736446796; x=1767982796;
  h=date:from:to:cc:subject:message-id;
  bh=HyaQsb6G2Ye16QtLJGcufg14/IoFZ2Msa519QHmnv0c=;
  b=mMYs5OSnW6mJSvyhuhqqhP6Ew7wCqTdQaMW49QSU1WxsIKqIxvqIPIA6
   W8oDwo611nnaYsoazgv/1itJ6YlTK4KQM7XdrBvnv1Soj7m5OjeaOPv5s
   xS/bG76sKFcS5MotzVO4RZXa4YJwdiTZCwHn0+ByRVAiQ5waO4kbhGFjO
   EVuV/jyNbi5eueSbJhe8hc63B30N0Rse0okHGdnV0jvUMIbLEKQSRSMtB
   STKl3HHN9l6zCt3o12gamQp7c9YaMG0g2aCnwczgbihMQ7dKRpw6ojahZ
   zSwcmGl/3h8skbYJdB+yx3oSvuD3qI6dQqpzZLrjGsIpS2xMcldCNd0aj
   Q==;
X-CSE-ConnectionGUID: iC1ZHevpRP2gFEfV5vWuzg==
X-CSE-MsgGUID: m23dZ4bATB+D/HB0rg0NGQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="47302803"
X-IronPort-AV: E=Sophos;i="6.12,302,1728975600"; 
   d="scan'208";a="47302803"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2025 10:19:53 -0800
X-CSE-ConnectionGUID: 4ZTk4XdjSHS8DrjG4MmxDQ==
X-CSE-MsgGUID: R9zbc1fZRGuW2AVk50FXMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="104361027"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 09 Jan 2025 10:19:52 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tVx8H-000Hz9-2a;
	Thu, 09 Jan 2025 18:19:49 +0000
Date: Fri, 10 Jan 2025 02:19:47 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:master] BUILD SUCCESS
 a38838e85965cdee58d027b5e6fc8264450325bc
Message-ID: <202501100241.vux3auql-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git master
branch HEAD: a38838e85965cdee58d027b5e6fc8264450325bc  m68k: vga: Fix I/O defines

elapsed time: 1449m

configs tested: 98
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                               allnoconfig    gcc-13.2.0
arc                          axs101_defconfig    gcc-13.2.0
arc                   randconfig-001-20250109    gcc-13.2.0
arc                   randconfig-002-20250109    gcc-13.2.0
arm                              alldefconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                   randconfig-001-20250109    gcc-14.2.0
arm                   randconfig-002-20250109    clang-17
arm                   randconfig-003-20250109    clang-20
arm                   randconfig-004-20250109    gcc-14.2.0
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250109    gcc-14.2.0
arm64                 randconfig-002-20250109    clang-20
arm64                 randconfig-003-20250109    gcc-14.2.0
arm64                 randconfig-004-20250109    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250109    gcc-14.2.0
csky                  randconfig-002-20250109    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon                          allyesconfig    clang-18
hexagon               randconfig-001-20250109    clang-14
hexagon               randconfig-002-20250109    clang-20
i386                              allnoconfig    gcc-12
i386        buildonly-randconfig-001-20250109    gcc-12
i386        buildonly-randconfig-002-20250109    gcc-12
i386        buildonly-randconfig-003-20250109    clang-19
i386        buildonly-randconfig-004-20250109    clang-19
i386        buildonly-randconfig-005-20250109    clang-19
i386        buildonly-randconfig-006-20250109    gcc-12
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250109    gcc-14.2.0
loongarch             randconfig-002-20250109    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                      bmips_stb_defconfig    clang-18
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250109    gcc-14.2.0
nios2                 randconfig-002-20250109    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250109    gcc-14.2.0
parisc                randconfig-002-20250109    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc                      ppc44x_defconfig    clang-20
powerpc               randconfig-001-20250109    clang-15
powerpc               randconfig-002-20250109    gcc-14.2.0
powerpc               randconfig-003-20250109    gcc-14.2.0
powerpc                      tqm8xx_defconfig    clang-20
powerpc64             randconfig-001-20250109    gcc-14.2.0
powerpc64             randconfig-002-20250109    clang-20
powerpc64             randconfig-003-20250109    clang-17
riscv                            allmodconfig    clang-20
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-20
riscv                 randconfig-001-20250109    gcc-14.2.0
riscv                 randconfig-002-20250109    clang-15
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250109    gcc-14.2.0
s390                  randconfig-002-20250109    clang-16
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                    randconfig-001-20250109    gcc-14.2.0
sh                    randconfig-002-20250109    gcc-14.2.0
sh                   rts7751r2dplus_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250109    gcc-14.2.0
sparc                 randconfig-002-20250109    gcc-14.2.0
sparc64               randconfig-001-20250109    gcc-14.2.0
sparc64               randconfig-002-20250109    gcc-14.2.0
um                                allnoconfig    clang-18
um                    randconfig-001-20250109    gcc-12
um                    randconfig-002-20250109    gcc-12
x86_64                            allnoconfig    clang-19
x86_64      buildonly-randconfig-001-20250109    clang-19
x86_64      buildonly-randconfig-002-20250109    gcc-12
x86_64      buildonly-randconfig-003-20250109    clang-19
x86_64      buildonly-randconfig-004-20250109    clang-19
x86_64      buildonly-randconfig-005-20250109    clang-19
x86_64      buildonly-randconfig-006-20250109    gcc-12
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250109    gcc-14.2.0
xtensa                randconfig-002-20250109    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
