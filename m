Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A4B114E2C2
	for <linux-m68k@lists.linux-m68k.org>; Sat, 11 Jan 2025 10:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736592997; cv=none; b=BSBv0YsHJTVd7c6sp2iI7awmF2RIkAF+xFnmyTgvIZWOyLnahuLRX5SiC/D+/uC9Xg/UG0geU8pYsjHuf6SWmnESE0Jm2odJK4RUvXyxN38D5dPjT0h67xb6zGIJZSXXcQyjaK8i/p7AeUSQalKMPcPvNnfaattLfru6TcfMsng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736592997; c=relaxed/simple;
	bh=SKoHWKxqVJ2nCaESofeRUqmK/Mu5psnuWBgHqePforU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=j0R70iCd/qrhv2piHizS+EBaG9MnXMjnVRoQ9Julc7sUhPBHXSjROkFty64/B8nf/KtjO92mk7r/MoUFD4jl0AhCmC5o9v4Z8h0klSeXyciLsE+naUKsHIyMtB7nVli28hPRNf9ijnHWD9mdlEc3zdNO5yjgcYKn79ceJSJUka0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ELYhsWGn; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ELYhsWGn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736592996; x=1768128996;
  h=date:from:to:cc:subject:message-id;
  bh=SKoHWKxqVJ2nCaESofeRUqmK/Mu5psnuWBgHqePforU=;
  b=ELYhsWGn1/yuNCMkPZLvUm8jWcouZlWl3kIwCQGfp0jFrMIAT4tjSEoD
   87bMkyMNZZVMGAkZcze2FxXuXWqW35UopXapkD/ZCyn12RxtQ6oPFTvSj
   V+vtC7zVbUXNiTz8EcK/skERZd/UiRXSxK33HokpbNE0A55uiNQPJSUpA
   6busKx1rdxBdQJq7eLEan4mAoyEVcmsfasrOAUV2kknWpJYCSACN4SSKr
   MkJE+njMWbwBlyo/a6PeFPDqCDvt2FIjTbahRJzOa7mnxZ4bVF0hdFYLd
   v/ugDigWKk/zeoIUXv5keamr6kck/ESrw72qZ4WwwoWmKxblQghF3ROfn
   Q==;
X-CSE-ConnectionGUID: +9qBJdiPSN2qzobFs39lrg==
X-CSE-MsgGUID: ravlV8oRTDuw2DYhvroNdg==
X-IronPort-AV: E=McAfee;i="6700,10204,11311"; a="47457732"
X-IronPort-AV: E=Sophos;i="6.12,307,1728975600"; 
   d="scan'208";a="47457732"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2025 02:56:35 -0800
X-CSE-ConnectionGUID: ZULtWkVSRUaw3KDWvwJwUw==
X-CSE-MsgGUID: qjcQfrG5SgiKJZldPw6bEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="127249649"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 11 Jan 2025 02:56:34 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWZAN-000KVz-34;
	Sat, 11 Jan 2025 10:56:31 +0000
Date: Sat, 11 Jan 2025 18:55:39 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:master] BUILD SUCCESS
 01bc77a362abae2d4ddd82a27d1aa17f6e338383
Message-ID: <202501111829.x9lBanXl-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git master
branch HEAD: 01bc77a362abae2d4ddd82a27d1aa17f6e338383  m68k: libgcc: Fix lvalue abuse in umul_ppmm()

elapsed time: 1455m

configs tested: 99
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                               allnoconfig    gcc-13.2.0
arc                   randconfig-001-20250110    gcc-13.2.0
arc                   randconfig-002-20250110    gcc-13.2.0
arm                               allnoconfig    clang-17
arm                         assabet_defconfig    clang-20
arm                            hisi_defconfig    gcc-14.2.0
arm                      integrator_defconfig    clang-15
arm                   randconfig-001-20250110    clang-20
arm                   randconfig-002-20250110    gcc-14.2.0
arm                   randconfig-003-20250110    clang-19
arm                   randconfig-004-20250110    gcc-14.2.0
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250110    gcc-14.2.0
arm64                 randconfig-002-20250110    gcc-14.2.0
arm64                 randconfig-003-20250110    clang-17
arm64                 randconfig-004-20250110    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250110    gcc-14.2.0
csky                  randconfig-002-20250110    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon                          allyesconfig    clang-18
hexagon               randconfig-001-20250110    clang-20
hexagon               randconfig-002-20250110    clang-20
i386        buildonly-randconfig-001-20250110    clang-19
i386        buildonly-randconfig-002-20250110    clang-19
i386        buildonly-randconfig-003-20250110    clang-19
i386        buildonly-randconfig-004-20250110    gcc-12
i386        buildonly-randconfig-005-20250110    gcc-12
i386        buildonly-randconfig-006-20250110    clang-19
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250110    gcc-14.2.0
loongarch             randconfig-002-20250110    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                          multi_defconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                  cavium_octeon_defconfig    gcc-14.2.0
mips                           ci20_defconfig    clang-19
mips                        vocore2_defconfig    clang-15
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250110    gcc-14.2.0
nios2                 randconfig-002-20250110    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                 simple_smp_defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                randconfig-001-20250110    gcc-14.2.0
parisc                randconfig-002-20250110    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc                      bamboo_defconfig    clang-20
powerpc                      ppc6xx_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250110    clang-20
powerpc               randconfig-002-20250110    clang-20
powerpc               randconfig-003-20250110    clang-20
powerpc64             randconfig-001-20250110    clang-17
powerpc64             randconfig-002-20250110    clang-19
powerpc64             randconfig-003-20250110    clang-17
riscv                            allmodconfig    clang-20
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-20
riscv                 randconfig-001-20250110    clang-17
riscv                 randconfig-002-20250110    clang-20
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250110    gcc-14.2.0
s390                  randconfig-002-20250110    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                    randconfig-001-20250110    gcc-14.2.0
sh                    randconfig-002-20250110    gcc-14.2.0
sh                          rsk7201_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250110    gcc-14.2.0
sparc                 randconfig-002-20250110    gcc-14.2.0
sparc64               randconfig-001-20250110    gcc-14.2.0
sparc64               randconfig-002-20250110    gcc-14.2.0
um                                allnoconfig    clang-18
um                               allyesconfig    gcc-12
um                    randconfig-001-20250110    clang-20
um                    randconfig-002-20250110    gcc-12
x86_64      buildonly-randconfig-001-20250110    gcc-12
x86_64      buildonly-randconfig-002-20250110    clang-19
x86_64      buildonly-randconfig-003-20250110    clang-19
x86_64      buildonly-randconfig-004-20250110    gcc-12
x86_64      buildonly-randconfig-005-20250110    clang-19
x86_64      buildonly-randconfig-006-20250110    clang-19
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250110    gcc-14.2.0
xtensa                randconfig-002-20250110    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
