Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 359727082A
	for <linux-m68k@lists.linux-m68k.org>; Tue,  7 Jan 2025 04:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736223041; cv=none; b=TrNmZmMEtl3ZUir3RTbAq9jM2JE/v+XQSLAMspgFF93tADg0+BrpQ/MjxrvTXjaDV6YuasmaS74gp+arC/xX9FwsTvCkuJx1oVgTB4kvWHb6w8vCjtXHg60wiuV09duULr0zvzUwt6kAq+hu5QQIj/UU8SN6GO3EUcaGQek5XwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736223041; c=relaxed/simple;
	bh=w68O+UEjr0qGos1jNEpvEKC1S11qWC5CYp1DPvYtOtc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Dl6W7tfnDi1T/46jN7yFWShCzN+0rtNk0ZlavcvPrRUQc8ln940wQhKZOTkjkmljp5RkLi5vBWiTwddN4sCZDu9wjOIgG1xI94F+R8SzTn2tnN7mbrx8umzW646YROkeIBFmQolXCrLnKq/CoQ8a1xNT4rQ/CHuPh9G3NmUpu9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a27R9oWR; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a27R9oWR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736223039; x=1767759039;
  h=date:from:to:cc:subject:message-id;
  bh=w68O+UEjr0qGos1jNEpvEKC1S11qWC5CYp1DPvYtOtc=;
  b=a27R9oWRSGf4oXjB+0qB8P0TfkIEILjrSHouIxkaQ6KmToDwVkTAtAB6
   z32ap+G19FY4CckSyaMu450Vbzs9+lJ1lEVCuvllhWFZumWS1Krok8Yed
   hhZA7VYIlixQSsLPcqU06NUhPykqcYKIILC5YYevnu7Z7KQdUlSd7XRPf
   SEIU4w6i5llBpi/R5/06ori2SSAO3cTxDYrzZl4QxJKG/tJizLcjTwmRJ
   NoxE/taD0ApWKssSvH2p1oZrvv6pzlDFfpRFhDC7eqo3Ajf0uZtvRqC9x
   saqYilV9TTZS5IJl3DEEwLB7kbhIz5/5yB11Fjnb3g7DpPTyfylD63QlY
   w==;
X-CSE-ConnectionGUID: 680On6JXQVyQPkMhmjz0gg==
X-CSE-MsgGUID: H56l2m2gQbe0lbzi99WXIg==
X-IronPort-AV: E=McAfee;i="6700,10204,11307"; a="39209500"
X-IronPort-AV: E=Sophos;i="6.12,294,1728975600"; 
   d="scan'208";a="39209500"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2025 20:10:38 -0800
X-CSE-ConnectionGUID: i1pcSMXhTCyq4o7d5+QBdg==
X-CSE-MsgGUID: /w3ap6zbRGGX4NFxV6+8LQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="125927054"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 06 Jan 2025 20:10:37 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tV0vK-000EE3-27;
	Tue, 07 Jan 2025 04:10:34 +0000
Date: Tue, 07 Jan 2025 12:10:24 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:master] BUILD SUCCESS
 4becd8a6b5680906c99cbb7f347ddd4fce4667a3
Message-ID: <202501071218.iyEZRAA1-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git master
branch HEAD: 4becd8a6b5680906c99cbb7f347ddd4fce4667a3  Merge tag 'v6.13-rc6'

elapsed time: 847m

configs tested: 113
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                   randconfig-001-20250106    gcc-13.2.0
arc                   randconfig-002-20250106    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                              allyesconfig    gcc-14.2.0
arm                   randconfig-001-20250106    gcc-14.2.0
arm                   randconfig-002-20250106    gcc-14.2.0
arm                   randconfig-003-20250106    clang-20
arm                   randconfig-004-20250106    gcc-14.2.0
arm                        realview_defconfig    clang-19
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250106    clang-16
arm64                 randconfig-002-20250106    clang-18
arm64                 randconfig-003-20250106    clang-16
arm64                 randconfig-004-20250106    clang-20
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250106    gcc-14.2.0
csky                  randconfig-002-20250106    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon                          allyesconfig    clang-18
hexagon               randconfig-001-20250106    clang-15
hexagon               randconfig-002-20250106    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250106    clang-19
i386        buildonly-randconfig-002-20250106    gcc-12
i386        buildonly-randconfig-003-20250106    clang-19
i386        buildonly-randconfig-004-20250106    gcc-12
i386        buildonly-randconfig-005-20250106    clang-19
i386        buildonly-randconfig-006-20250106    gcc-12
i386                                defconfig    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250106    gcc-14.2.0
loongarch             randconfig-002-20250106    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250106    gcc-14.2.0
nios2                 randconfig-002-20250106    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                randconfig-001-20250106    gcc-14.2.0
parisc                randconfig-002-20250106    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc                      katmai_defconfig    clang-18
powerpc                   motionpro_defconfig    clang-17
powerpc                     mpc83xx_defconfig    clang-20
powerpc               randconfig-001-20250106    clang-20
powerpc               randconfig-002-20250106    clang-20
powerpc               randconfig-003-20250106    clang-20
powerpc64             randconfig-001-20250106    clang-16
powerpc64             randconfig-002-20250106    clang-18
powerpc64             randconfig-003-20250106    clang-20
riscv                            allmodconfig    clang-20
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-20
riscv                 randconfig-001-20250107    clang-15
riscv                 randconfig-002-20250107    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250107    gcc-14.2.0
s390                  randconfig-002-20250107    clang-20
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                    randconfig-001-20250107    gcc-14.2.0
sh                    randconfig-002-20250107    gcc-14.2.0
sh                            shmin_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250107    gcc-14.2.0
sparc                 randconfig-002-20250107    gcc-14.2.0
sparc                       sparc64_defconfig    gcc-14.2.0
sparc64               randconfig-001-20250107    gcc-14.2.0
sparc64               randconfig-002-20250107    gcc-14.2.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-18
um                               allyesconfig    gcc-12
um                    randconfig-001-20250107    gcc-12
um                    randconfig-002-20250107    clang-20
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250106    clang-19
x86_64      buildonly-randconfig-002-20250106    gcc-12
x86_64      buildonly-randconfig-003-20250106    gcc-12
x86_64      buildonly-randconfig-004-20250106    gcc-12
x86_64      buildonly-randconfig-005-20250106    clang-19
x86_64      buildonly-randconfig-006-20250106    gcc-12
x86_64                              defconfig    gcc-11
xtensa                           alldefconfig    gcc-14.2.0
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250107    gcc-14.2.0
xtensa                randconfig-002-20250107    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
