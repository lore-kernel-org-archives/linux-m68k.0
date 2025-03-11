Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D1FF25BAC3
	for <linux-m68k@lists.linux-m68k.org>; Tue, 11 Mar 2025 14:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741702916; cv=none; b=sOTeqg3czmGv2sL8vK5Bw88gv6ZTtdzKSpKvfcMq81/6w65k5QTlpN9+yP+8yHOkq4ZSmZn6/TaIdbkB7fQZ/cxkI832OHlxd5nIppKGy8xQPwbMPno/DvoiqF4FwZOBgmi67ALlJyiK6sgn2jBdVyoIMBh7c1nvqS+JrevXFyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741702916; c=relaxed/simple;
	bh=v968QPI647DmORGNz2lgsm3LcW/pcymIBrVdxXmTPhc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Ki1DYWjg0PdeDxPGnRyCDlorTkVO/bJnFY3NDYaI3Ua3PqbJ5cQZvpTm1AW1spFW5c9KaWyMP/QIteTu7N3fyHhaISZs6XsMajs6CjiYhbSLNN1UO5NdHRV9vYzcYEybLa9oh70VcGF6IjI+A6g2FTaiverBilnyMTV/GBLw6Hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B1khEV1w; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B1khEV1w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741702914; x=1773238914;
  h=date:from:to:cc:subject:message-id;
  bh=v968QPI647DmORGNz2lgsm3LcW/pcymIBrVdxXmTPhc=;
  b=B1khEV1wEhziadDaH8XZzqJ6bA6cnFeEGxZZYpq2xT++nbI60IaeKpmi
   xCRmu3iow4ILYyRkY3qilnCUR2s/FcVkjq6dXmKIOw8zzpaKgVW9uLtFg
   nw1gWc0L/SxkOF0e71U4/uDZsGgxwpZMCuu4HsI54F2G05ogC+3ozY/s4
   PUq9IExtlFic7gevywdVctGDJxWuQV+t3tc48XcnOrxKGhIkEc5vQwZx8
   E2FfKPPameoRmNYBTaWq/uVB63ia9SX4NAOq6/kNd2GFDE2RtSGoX9b+/
   TKVMyjLMlNMFstKnzN40s900dI+OoHYPrLhHIC7HKui6rMhDoRZYM1GGF
   w==;
X-CSE-ConnectionGUID: gReXgQYyQxmRS46/fEZRPw==
X-CSE-MsgGUID: wbmEo9+PTo+K0RfFaKNndA==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="41997151"
X-IronPort-AV: E=Sophos;i="6.14,239,1736841600"; 
   d="scan'208";a="41997151"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2025 07:21:53 -0700
X-CSE-ConnectionGUID: 7Rq2Kxf5SASKudOddYP6EA==
X-CSE-MsgGUID: I7RDN7miR7WTkEahJwTtrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,239,1736841600"; 
   d="scan'208";a="121039466"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 11 Mar 2025 07:21:52 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ts0UP-0006i0-2V;
	Tue, 11 Mar 2025 14:21:49 +0000
Date: Tue, 11 Mar 2025 22:21:24 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:master] BUILD SUCCESS
 2f4ac69c34b2d4c2a7421048718d27811a2164f7
Message-ID: <202503112216.HFtJ7dNt-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git master
branch HEAD: 2f4ac69c34b2d4c2a7421048718d27811a2164f7  m68k: setup: Remove size argument when calling strscpy()

elapsed time: 1455m

configs tested: 121
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
arc                                 defconfig    gcc-13.2.0
arc                         haps_hs_defconfig    gcc-13.2.0
arc                   randconfig-001-20250311    gcc-13.2.0
arc                   randconfig-002-20250311    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                              allyesconfig    gcc-14.2.0
arm                   randconfig-001-20250311    gcc-14.2.0
arm                   randconfig-002-20250311    clang-16
arm                   randconfig-003-20250311    gcc-14.2.0
arm                   randconfig-004-20250311    gcc-14.2.0
arm                        shmobile_defconfig    gcc-14.2.0
arm                          sp7021_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250311    gcc-14.2.0
arm64                 randconfig-002-20250311    gcc-14.2.0
arm64                 randconfig-003-20250311    gcc-14.2.0
arm64                 randconfig-004-20250311    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250311    gcc-14.2.0
csky                  randconfig-002-20250311    gcc-14.2.0
hexagon                          allmodconfig    clang-21
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-18
hexagon               randconfig-001-20250311    clang-21
hexagon               randconfig-002-20250311    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250311    gcc-12
i386        buildonly-randconfig-002-20250311    clang-19
i386        buildonly-randconfig-003-20250311    clang-19
i386        buildonly-randconfig-004-20250311    clang-19
i386        buildonly-randconfig-005-20250311    clang-19
i386        buildonly-randconfig-006-20250311    gcc-11
i386                                defconfig    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250311    gcc-14.2.0
loongarch             randconfig-002-20250311    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                       m5275evb_defconfig    gcc-14.2.0
m68k                       m5475evb_defconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                           xway_defconfig    clang-21
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250311    gcc-14.2.0
nios2                 randconfig-002-20250311    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250311    gcc-14.2.0
parisc                randconfig-002-20250311    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc                 mpc834x_itx_defconfig    clang-21
powerpc                       ppc64_defconfig    clang-19
powerpc               randconfig-001-20250311    clang-21
powerpc               randconfig-002-20250311    clang-16
powerpc               randconfig-003-20250311    gcc-14.2.0
powerpc64             randconfig-001-20250311    gcc-14.2.0
powerpc64             randconfig-002-20250311    clang-18
powerpc64             randconfig-003-20250311    gcc-14.2.0
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-21
riscv                 randconfig-001-20250310    clang-19
riscv                 randconfig-002-20250310    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-15
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250310    gcc-14.2.0
s390                  randconfig-002-20250310    clang-18
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                         ecovec24_defconfig    gcc-14.2.0
sh                            hp6xx_defconfig    gcc-14.2.0
sh                          landisk_defconfig    gcc-14.2.0
sh                    randconfig-001-20250310    gcc-14.2.0
sh                    randconfig-002-20250310    gcc-14.2.0
sh                        sh7757lcr_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250310    gcc-14.2.0
sparc                 randconfig-002-20250310    gcc-14.2.0
sparc64               randconfig-001-20250310    gcc-14.2.0
sparc64               randconfig-002-20250310    gcc-14.2.0
um                               allmodconfig    clang-21
um                                allnoconfig    clang-18
um                               allyesconfig    gcc-12
um                    randconfig-001-20250310    gcc-12
um                    randconfig-002-20250310    clang-17
um                           x86_64_defconfig    clang-15
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250310    gcc-12
x86_64      buildonly-randconfig-002-20250310    clang-19
x86_64      buildonly-randconfig-003-20250310    clang-19
x86_64      buildonly-randconfig-004-20250310    clang-19
x86_64      buildonly-randconfig-005-20250310    clang-19
x86_64      buildonly-randconfig-006-20250310    gcc-12
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250310    gcc-14.2.0
xtensa                randconfig-002-20250310    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
