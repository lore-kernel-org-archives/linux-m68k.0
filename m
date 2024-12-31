Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E93FFBA50
	for <linux-m68k@lists.linux-m68k.org>; Tue, 31 Dec 2024 05:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735621372; cv=none; b=mg3x8WiWFh21TcrllVQjRG78I5R7g6qmdxvGX5rnMt4ICcajfsv50mFcxL7OlTAcVMp+FKJcqvnSyBbiEGpj6SUikEceNQlESECeVjgl+qAcLPOvndBQm8W9/LdtkdIDJ7wUJEZTYhHB6f8vlelip3vWEUjlCmqidX8mox5p2AA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735621372; c=relaxed/simple;
	bh=W3r1O+gr4YE06e0fDAhIjp7JHqQbMlWE09htcY493ew=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pu7qTrEth1qfc216R3VlFQCzwByswGTd7hHQvOS43qmJV1Y3MPB5HYO806bRmlovBP6UeBrwpyEFiZyZDlDFjwsLuG2jtvngJ5l3EvUY0R8tIIwMUzxKV/HHRptmSKcViWjBQdt+ruOQmqU7n+GPKKwZrjk3yxjZx8Lr/fTu5hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iiMSA1p1; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iiMSA1p1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735621370; x=1767157370;
  h=date:from:to:cc:subject:message-id;
  bh=W3r1O+gr4YE06e0fDAhIjp7JHqQbMlWE09htcY493ew=;
  b=iiMSA1p1U9W2VsbRZ2wsxQsqu0KiWTZei7vym1AAX7wtMTDn9VxqEc5w
   5KcHkju2SGdovCpDluFnuPnnaZjUGbu67SYo54AgfQGKbIpfCQJkL4x8G
   JjmL/jxYOIJCLtLdpfK0VBsK9EhheZMLi4OE3vlUu1zZ4+4MRLvNnQK1k
   AQzxbcYB4UbNvdXtN60WaGGG6WVvySvxQ7GkDc8mCe4hRVwQ5ZbQVN9v3
   Q7v88NjnyGPYSH9FymEGCaHQ+UJN3ZKh7KWdyG/QmtI2rH7PhKXq6AwXN
   2nMYc9VEWHyomquLfM0FqCi139X1SrLWJ2kFA+mCxHB7gqB+9+MYFtP5t
   Q==;
X-CSE-ConnectionGUID: 79pXWrBuT72Vdo22ROkClg==
X-CSE-MsgGUID: wj7jDWeYSieCBTZ3mikh9w==
X-IronPort-AV: E=McAfee;i="6700,10204,11301"; a="39673712"
X-IronPort-AV: E=Sophos;i="6.12,278,1728975600"; 
   d="scan'208";a="39673712"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2024 21:02:49 -0800
X-CSE-ConnectionGUID: bQ9wTdh0R1GMg3xIA+/0Sg==
X-CSE-MsgGUID: 9EQJ9/IzScebz6Rb+QErZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="105965816"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 30 Dec 2024 21:02:49 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tSUP0-0006kw-1g;
	Tue, 31 Dec 2024 05:02:46 +0000
Date: Tue, 31 Dec 2024 13:02:04 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:master] BUILD SUCCESS
 17810b1de0e9e5c1000cf8f5b4787ad930b0353e
Message-ID: <202412311358.US5OkE8h-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git master
branch HEAD: 17810b1de0e9e5c1000cf8f5b4787ad930b0353e  Merge tag 'v6.13-rc5'

elapsed time: 721m

configs tested: 129
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                                 defconfig    gcc-13.2.0
arc                   randconfig-001-20241231    gcc-13.2.0
arc                   randconfig-002-20241231    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                              allyesconfig    gcc-14.2.0
arm                                 defconfig    clang-20
arm                            dove_defconfig    gcc-14.2.0
arm                            mps2_defconfig    clang-15
arm                   randconfig-001-20241231    clang-19
arm                   randconfig-002-20241231    clang-17
arm                   randconfig-003-20241231    gcc-14.2.0
arm                   randconfig-004-20241231    gcc-14.2.0
arm                           sunxi_defconfig    gcc-14.2.0
arm                         wpcm450_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20241231    clang-20
arm64                 randconfig-002-20241231    clang-20
arm64                 randconfig-003-20241231    gcc-14.2.0
arm64                 randconfig-004-20241231    clang-19
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20241231    gcc-14.2.0
csky                  randconfig-002-20241231    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon                          allyesconfig    clang-18
hexagon                             defconfig    clang-20
hexagon               randconfig-001-20241231    clang-20
hexagon               randconfig-002-20241231    clang-16
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20241231    gcc-11
i386        buildonly-randconfig-002-20241231    clang-19
i386        buildonly-randconfig-003-20241231    clang-19
i386        buildonly-randconfig-004-20241231    clang-19
i386        buildonly-randconfig-005-20241231    gcc-12
i386        buildonly-randconfig-006-20241231    clang-19
i386                                defconfig    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20241231    gcc-14.2.0
loongarch             randconfig-002-20241231    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                        stmark2_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                        bcm47xx_defconfig    clang-20
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20241231    gcc-14.2.0
nios2                 randconfig-002-20241231    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
openrisc                    or1ksim_defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20241231    gcc-14.2.0
parisc                randconfig-002-20241231    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                      cm5200_defconfig    clang-20
powerpc                     ep8248e_defconfig    gcc-14.2.0
powerpc                        fsp2_defconfig    gcc-14.2.0
powerpc                      mgcoge_defconfig    clang-20
powerpc                    mvme5100_defconfig    gcc-14.2.0
powerpc               randconfig-001-20241231    clang-15
powerpc               randconfig-002-20241231    clang-20
powerpc               randconfig-003-20241231    clang-15
powerpc                     sequoia_defconfig    clang-17
powerpc64             randconfig-001-20241231    clang-20
powerpc64             randconfig-002-20241231    clang-19
powerpc64             randconfig-003-20241231    clang-20
riscv                            allmodconfig    clang-20
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-20
riscv                               defconfig    clang-19
riscv                 randconfig-001-20241231    clang-20
riscv                 randconfig-002-20241231    clang-15
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-15
s390                  randconfig-001-20241231    gcc-14.2.0
s390                  randconfig-002-20241231    clang-16
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-14.2.0
sh                        edosk7760_defconfig    gcc-14.2.0
sh                    randconfig-001-20241231    gcc-14.2.0
sh                    randconfig-002-20241231    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20241231    gcc-14.2.0
sparc                 randconfig-002-20241231    gcc-14.2.0
sparc64               randconfig-001-20241231    gcc-14.2.0
sparc64               randconfig-002-20241231    gcc-14.2.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-18
um                               allyesconfig    gcc-12
um                    randconfig-001-20241231    clang-20
um                    randconfig-002-20241231    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20241231    clang-19
x86_64      buildonly-randconfig-002-20241231    gcc-12
x86_64      buildonly-randconfig-003-20241231    clang-19
x86_64      buildonly-randconfig-004-20241231    gcc-12
x86_64      buildonly-randconfig-005-20241231    clang-19
x86_64      buildonly-randconfig-006-20241231    clang-19
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20241231    gcc-14.2.0
xtensa                randconfig-002-20241231    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
