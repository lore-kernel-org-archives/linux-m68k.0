Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B5331891BB
	for <linux-m68k@lists.linux-m68k.org>; Tue, 17 Sep 2024 21:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726607440; cv=none; b=rRAcA9OfwKNT2yoFONxD7OvZe8RNTaSiSyLTv05+uyZIRd4JcrZA7Sg1q0qNz8JAM8rvWuLTDW+YJr7Rr3Yo50xkbOGyFKPl3sfDs6js06TyAM2KV+soPejv4SHofOdKsq2EVhjb/9wlG5AtSv/S3mdMUcFwzUftoy77w1On3dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726607440; c=relaxed/simple;
	bh=JBZ9RoXdRULq8SxnJBIb+pjeftOkXhxQHeX5sy3XZHg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XAQ4xivU7pBotRkW1ECYD9SL/BNmP8MxzqWD1nR3ATEuecvWNfPT1c0hm+OBwEHfqhzEaOMnZnkztzoRVU8B4EYTOoLkCO9+mcSXR9suphd+G0TpFbClYYG+6eCRRnOkHBlZLUvJe1N2wa4NJnZFYNxY39EzKdOi7SDA4CgnhQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XxE2a9sx; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XxE2a9sx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726607439; x=1758143439;
  h=date:from:to:cc:subject:message-id;
  bh=JBZ9RoXdRULq8SxnJBIb+pjeftOkXhxQHeX5sy3XZHg=;
  b=XxE2a9sxZUIA2LMsfk8OnUrSA739wIZrSlVZNP7C/xZTwyGhvO24ozue
   LeJIzFIjlie+G1rO5k+hsucTcX2NDlA0+qdTMGws3Jk6ATMYvWjknLJ4x
   s/w8vus7tQSqdmmNPUEphoHdyneALiKDZQtKqfxPxNHwEFOY3WXIZwH7S
   J+P/Xk7Wiyr4+jeOoM3RIp1pk24NsMjMeFFY4yiPsDapsPcZbGdSiuggc
   ag+lcNuCtkKxlTiW3eiThLaRj3VphUgiThCCxf9k13x8m7bl/z1bsdwdX
   u4+107hvlTR+6RZ6sKNN7giiqtD16oCuoKu4sZffBe9VbIcf3iCgB6r4C
   w==;
X-CSE-ConnectionGUID: 2rK26nUDQe6IFZW4OuN8cw==
X-CSE-MsgGUID: gh30BEM1QKmk6SIff6txhA==
X-IronPort-AV: E=McAfee;i="6700,10204,11198"; a="36063319"
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; 
   d="scan'208";a="36063319"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2024 14:10:38 -0700
X-CSE-ConnectionGUID: VI2ma9XrQDOMR/UOcs1YjQ==
X-CSE-MsgGUID: xjkiyb6/Qhufe81ZHS+MVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; 
   d="scan'208";a="69423711"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 17 Sep 2024 14:10:37 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sqfT0-000BXm-19;
	Tue, 17 Sep 2024 21:10:34 +0000
Date: Wed, 18 Sep 2024 05:10:22 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:m68k-v6.11] BUILD SUCCESS
 4db74a187382ab35b65b5af67193aa23242ff1ff
Message-ID: <202409180514.L9oWMtW0-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git m68k-v6.11
branch HEAD: 4db74a187382ab35b65b5af67193aa23242ff1ff  m68k: defconfig: Enable Atari EtherNAT and NetUSBee USB support

elapsed time: 1799m

configs tested: 123
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.1.0
alpha                            allyesconfig    clang-20
alpha                               defconfig    gcc-14.1.0
arc                              allmodconfig    clang-20
arc                               allnoconfig    gcc-14.1.0
arc                              allyesconfig    clang-20
arc                                 defconfig    gcc-14.1.0
arm                              allmodconfig    clang-20
arm                               allnoconfig    gcc-14.1.0
arm                              allyesconfig    clang-20
arm                                 defconfig    gcc-14.1.0
arm                          ixp4xx_defconfig    gcc-14.1.0
arm                        multi_v7_defconfig    gcc-14.1.0
arm                          sp7021_defconfig    gcc-14.1.0
arm                        spear3xx_defconfig    gcc-14.1.0
arm64                            alldefconfig    gcc-14.1.0
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.1.0
arm64                               defconfig    gcc-14.1.0
csky                              allnoconfig    gcc-14.1.0
csky                                defconfig    gcc-14.1.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    gcc-14.1.0
hexagon                          allyesconfig    clang-20
hexagon                             defconfig    gcc-14.1.0
i386                             allmodconfig    clang-18
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-18
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-18
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20240917    clang-18
i386        buildonly-randconfig-002-20240917    gcc-12
i386        buildonly-randconfig-003-20240917    clang-18
i386        buildonly-randconfig-004-20240917    clang-18
i386        buildonly-randconfig-005-20240917    clang-18
i386        buildonly-randconfig-006-20240917    gcc-12
i386                                defconfig    clang-18
i386                  randconfig-001-20240917    gcc-12
i386                  randconfig-002-20240917    gcc-12
i386                  randconfig-003-20240917    clang-18
i386                  randconfig-004-20240917    gcc-12
i386                  randconfig-005-20240917    gcc-12
i386                  randconfig-006-20240917    clang-18
i386                  randconfig-011-20240917    gcc-12
i386                  randconfig-012-20240917    clang-18
i386                  randconfig-013-20240917    clang-18
i386                  randconfig-014-20240917    clang-18
i386                  randconfig-015-20240917    gcc-12
i386                  randconfig-016-20240917    gcc-12
loongarch                        allmodconfig    gcc-14.1.0
loongarch                         allnoconfig    gcc-14.1.0
loongarch                           defconfig    gcc-14.1.0
m68k                             allmodconfig    gcc-14.1.0
m68k                              allnoconfig    gcc-14.1.0
m68k                             allyesconfig    gcc-14.1.0
m68k                                defconfig    gcc-14.1.0
microblaze                       allmodconfig    gcc-14.1.0
microblaze                        allnoconfig    gcc-14.1.0
microblaze                       allyesconfig    gcc-14.1.0
microblaze                          defconfig    gcc-14.1.0
mips                              allnoconfig    gcc-14.1.0
mips                 decstation_r4k_defconfig    gcc-14.1.0
mips                  maltasmvp_eva_defconfig    gcc-14.1.0
mips                        omega2p_defconfig    gcc-14.1.0
mips                          rm200_defconfig    gcc-14.1.0
nios2                             allnoconfig    gcc-14.1.0
nios2                               defconfig    gcc-14.1.0
openrisc                          allnoconfig    clang-20
openrisc                          allnoconfig    gcc-14.1.0
openrisc                         allyesconfig    gcc-14.1.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-14.1.0
parisc                            allnoconfig    clang-20
parisc                            allnoconfig    gcc-14.1.0
parisc                           allyesconfig    gcc-14.1.0
parisc                              defconfig    gcc-12
parisc64                            defconfig    gcc-14.1.0
powerpc                     akebono_defconfig    gcc-14.1.0
powerpc                          allmodconfig    gcc-14.1.0
powerpc                           allnoconfig    clang-20
powerpc                           allnoconfig    gcc-14.1.0
powerpc                          allyesconfig    gcc-14.1.0
powerpc                       eiger_defconfig    gcc-14.1.0
powerpc                        fsp2_defconfig    gcc-14.1.0
powerpc                     mpc5200_defconfig    gcc-14.1.0
powerpc                     mpc83xx_defconfig    gcc-14.1.0
riscv                            allmodconfig    gcc-14.1.0
riscv                             allnoconfig    clang-20
riscv                             allnoconfig    gcc-14.1.0
riscv                            allyesconfig    gcc-14.1.0
riscv                               defconfig    gcc-12
s390                             allmodconfig    gcc-14.1.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.1.0
s390                                defconfig    gcc-12
sh                               allmodconfig    gcc-14.1.0
sh                                allnoconfig    gcc-14.1.0
sh                               allyesconfig    gcc-14.1.0
sh                                  defconfig    gcc-12
sh                           se7206_defconfig    gcc-14.1.0
sh                  sh7785lcr_32bit_defconfig    gcc-14.1.0
sparc                            allmodconfig    gcc-14.1.0
sparc64                             defconfig    gcc-12
um                               allmodconfig    clang-20
um                                allnoconfig    clang-17
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-18
x86_64                           allyesconfig    clang-18
x86_64                              defconfig    clang-18
x86_64                              defconfig    gcc-11
x86_64                           rhel-8.3-bpf    clang-18
x86_64                           rhel-8.3-bpf    gcc-12
x86_64                         rhel-8.3-kunit    clang-18
x86_64                         rhel-8.3-kunit    gcc-12
x86_64                           rhel-8.3-ltp    clang-18
x86_64                           rhel-8.3-ltp    gcc-12
x86_64                          rhel-8.3-rust    clang-18
xtensa                            allnoconfig    gcc-14.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
