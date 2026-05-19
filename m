Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DD1C3314BF
	for <linux-m68k@lists.linux-m68k.org>; Tue, 19 May 2026 02:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779159259; cv=none; b=dfQxMgRRDGZ8QxeTuxDzdlo0YvhL7dtkaf7KkHcYx4hoj2l+Rp2BxRxs+Nre1tgAJTZKgd3PWsddb2qjRWWR2+bmBvIK1GL9IOJvONhTyJQqAG8DFX01NMzARu9M6kC6D/w5KTK8CPt0CgJNp+b/pGDRl8B6aL7O7scU0ukbJ2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779159259; c=relaxed/simple;
	bh=DED3eu5rxU+mHVtVT9fJqZQLfWI+FhZ4XqmkmLWebqU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=f29thRxRzHcqaDwaUpCtxPaP8Jc47j8s1bIZ5oxJSfBLxnRnavWwiznnD8rmJDqjQCPmCat5vaYDIRjQ3j7KVmjkiAEXZS+Vmf7YFDo3q33gXKqP0I7WxombClTybmptATM9KIBvzLE7gX00orQKDaceBInIyLdEJDcvGkvW7LE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b8+rZkGO; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b8+rZkGO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779159258; x=1810695258;
  h=date:from:to:cc:subject:message-id;
  bh=DED3eu5rxU+mHVtVT9fJqZQLfWI+FhZ4XqmkmLWebqU=;
  b=b8+rZkGOgptvMAHLRqoc/WOAAfDCnrxT8fTwE65gC9lC3v5OG6UXNC+i
   lTUrgkLE5fZvx89NXK38fbLCRqGvaVH/WNAaGC8eaqf8iQwmoDTJ7JQjQ
   WWgudbZUoXbJtKcF0HVEDHGvLWlCMdTztS+FoqfaDYivsVThszypjMJeG
   u/0cs/XFeqi6QQOYqiqHbaUiaqZEQImLHcgCQTEuNsFqHjPo5oKVxTgZh
   ywDSbvo3u8JOv/DZ67wAp26jPbigsiqYF2DVXy8DuPNH5JX/G02ZvJ30+
   GIILBGecn4gcHiM54Z2Re7TJd5Hm10O/WdUcp2XfTBr0Mec7Wr/Q1VnD9
   A==;
X-CSE-ConnectionGUID: 1kB1uE4ER+mewNXSgYNaOg==
X-CSE-MsgGUID: IP+TWye5QCyY7hcEeRwEow==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="83903011"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="83903011"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 19:54:17 -0700
X-CSE-ConnectionGUID: V/2B3kTBRGqKTfw1KDrB1A==
X-CSE-MsgGUID: jzKMc4t2T8KGyyaLkyLDwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="236617976"
Received: from lkp-server02.sh.intel.com (HELO 30e86e9c1927) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 18 May 2026 19:54:15 -0700
Received: from kbuild by 30e86e9c1927 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPAab-000000000IR-281K;
	Tue, 19 May 2026 02:53:54 +0000
Date: Tue, 19 May 2026 10:52:27 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:for-v7.2] BUILD SUCCESS
 e321561b915378d2e9eacd1bc4d7fb2338d09961
Message-ID: <202605191020.WchfgniO-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git for-v7.2
branch HEAD: e321561b915378d2e9eacd1bc4d7fb2338d09961  dio: Update DIO_SCMAX comment

elapsed time: 923m

configs tested: 281
configs skipped: 11

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              alldefconfig    gcc-15.2.0
arc                              allmodconfig    clang-16
arc                              allmodconfig    clang-17
arc                              allmodconfig    gcc-15.2.0
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    clang-23
arc                              allyesconfig    gcc-15.2.0
arc                                 defconfig    gcc-15.2.0
arc                   randconfig-001-20260518    gcc-8.5.0
arc                   randconfig-001-20260519    clang-23
arc                   randconfig-002-20260518    gcc-8.5.0
arc                   randconfig-002-20260519    clang-23
arm                               allnoconfig    clang-23
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                              allyesconfig    clang-17
arm                              allyesconfig    gcc-15.2.0
arm                                 defconfig    gcc-15.2.0
arm                         mv78xx0_defconfig    clang-19
arm                   randconfig-001-20260518    gcc-8.5.0
arm                   randconfig-001-20260519    clang-23
arm                   randconfig-002-20260518    gcc-8.5.0
arm                   randconfig-002-20260519    clang-23
arm                   randconfig-003-20260518    gcc-8.5.0
arm                   randconfig-003-20260519    clang-23
arm                   randconfig-004-20260518    gcc-8.5.0
arm                   randconfig-004-20260519    clang-23
arm64                            allmodconfig    clang-19
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260519    gcc-8.5.0
arm64                 randconfig-002-20260519    gcc-8.5.0
arm64                 randconfig-003-20260519    gcc-8.5.0
arm64                 randconfig-004-20260519    gcc-8.5.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260519    gcc-8.5.0
csky                  randconfig-002-20260519    gcc-8.5.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    clang-23
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260518    gcc-11.5.0
hexagon               randconfig-001-20260519    clang-23
hexagon               randconfig-001-20260519    gcc-10.5.0
hexagon               randconfig-002-20260518    gcc-11.5.0
hexagon               randconfig-002-20260519    clang-23
hexagon               randconfig-002-20260519    gcc-10.5.0
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20260519    gcc-12
i386        buildonly-randconfig-002-20260519    gcc-12
i386        buildonly-randconfig-003-20260519    gcc-12
i386        buildonly-randconfig-004-20260519    gcc-12
i386        buildonly-randconfig-005-20260519    gcc-12
i386        buildonly-randconfig-006-20260519    gcc-12
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260518    gcc-14
i386                  randconfig-001-20260519    gcc-14
i386                  randconfig-002-20260518    gcc-14
i386                  randconfig-002-20260519    gcc-14
i386                  randconfig-003-20260518    gcc-14
i386                  randconfig-003-20260519    gcc-14
i386                  randconfig-004-20260518    gcc-14
i386                  randconfig-004-20260519    gcc-14
i386                  randconfig-005-20260518    gcc-14
i386                  randconfig-005-20260519    gcc-14
i386                  randconfig-006-20260518    gcc-14
i386                  randconfig-006-20260519    gcc-14
i386                  randconfig-007-20260518    gcc-14
i386                  randconfig-007-20260519    gcc-14
i386                  randconfig-011-20260518    gcc-14
i386                  randconfig-011-20260519    gcc-14
i386                  randconfig-012-20260518    gcc-14
i386                  randconfig-012-20260519    gcc-14
i386                  randconfig-013-20260518    gcc-14
i386                  randconfig-013-20260519    gcc-14
i386                  randconfig-014-20260518    gcc-14
i386                  randconfig-014-20260519    gcc-14
i386                  randconfig-015-20260518    gcc-14
i386                  randconfig-015-20260519    gcc-14
i386                  randconfig-016-20260518    gcc-14
i386                  randconfig-016-20260519    gcc-14
i386                  randconfig-017-20260518    gcc-14
i386                  randconfig-017-20260519    gcc-14
loongarch                        allmodconfig    clang-19
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260518    gcc-11.5.0
loongarch             randconfig-001-20260519    clang-23
loongarch             randconfig-001-20260519    gcc-10.5.0
loongarch             randconfig-002-20260518    gcc-11.5.0
loongarch             randconfig-002-20260519    clang-23
loongarch             randconfig-002-20260519    gcc-10.5.0
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                             allyesconfig    clang-17
m68k                             allyesconfig    gcc-15.2.0
m68k                                defconfig    clang-19
m68k                       m5249evb_defconfig    gcc-15.2.0
m68k                        m5407c3_defconfig    gcc-15.2.0
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
mips                        bcm47xx_defconfig    clang-18
nios2                            allmodconfig    clang-23
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-23
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260518    gcc-11.5.0
nios2                 randconfig-001-20260519    gcc-10.5.0
nios2                 randconfig-002-20260518    gcc-11.5.0
nios2                 randconfig-002-20260519    gcc-10.5.0
openrisc                         allmodconfig    clang-23
openrisc                         allmodconfig    gcc-15.2.0
openrisc                          allnoconfig    clang-23
openrisc                          allnoconfig    gcc-15.2.0
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-23
parisc                            allnoconfig    gcc-15.2.0
parisc                           allyesconfig    clang-19
parisc                           allyesconfig    gcc-15.2.0
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260519    gcc-8.5.0
parisc                randconfig-002-20260519    gcc-8.5.0
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc                           allnoconfig    gcc-15.2.0
powerpc               randconfig-001-20260519    gcc-8.5.0
powerpc               randconfig-002-20260519    gcc-8.5.0
powerpc64             randconfig-001-20260519    gcc-8.5.0
powerpc64             randconfig-002-20260519    gcc-8.5.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                            allyesconfig    clang-17
riscv                               defconfig    gcc-15.2.0
riscv                          randconfig-001    gcc-8.5.0
riscv                 randconfig-001-20260518    clang-23
riscv                 randconfig-001-20260519    gcc-13.4.0
riscv                          randconfig-002    clang-23
riscv                 randconfig-002-20260518    clang-23
riscv                 randconfig-002-20260519    gcc-13.4.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                           randconfig-001    gcc-11.5.0
s390                  randconfig-001-20260518    gcc-12.5.0
s390                  randconfig-001-20260519    gcc-13.4.0
s390                           randconfig-002    clang-23
s390                  randconfig-002-20260518    gcc-12.5.0
s390                  randconfig-002-20260519    gcc-13.4.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    clang-19
sh                               allyesconfig    gcc-15.2.0
sh                                  defconfig    gcc-14
sh                             randconfig-001    gcc-15.2.0
sh                    randconfig-001-20260518    gcc-14.3.0
sh                    randconfig-001-20260519    gcc-13.4.0
sh                             randconfig-002    gcc-14.3.0
sh                    randconfig-002-20260518    gcc-11.5.0
sh                    randconfig-002-20260519    gcc-13.4.0
sparc                             allnoconfig    clang-23
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260518    gcc-15.2.0
sparc                 randconfig-001-20260519    gcc-14.3.0
sparc                 randconfig-002-20260518    gcc-15.2.0
sparc                 randconfig-002-20260519    gcc-14.3.0
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260518    gcc-15.2.0
sparc64               randconfig-001-20260519    gcc-14.3.0
sparc64               randconfig-002-20260518    gcc-15.2.0
sparc64               randconfig-002-20260519    gcc-14.3.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260518    gcc-15.2.0
um                    randconfig-001-20260519    gcc-14.3.0
um                    randconfig-002-20260518    gcc-15.2.0
um                    randconfig-002-20260519    gcc-14.3.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260518    gcc-14
x86_64      buildonly-randconfig-001-20260519    gcc-14
x86_64      buildonly-randconfig-002-20260518    gcc-14
x86_64      buildonly-randconfig-002-20260519    gcc-14
x86_64      buildonly-randconfig-003-20260518    gcc-14
x86_64      buildonly-randconfig-003-20260519    gcc-14
x86_64      buildonly-randconfig-004-20260518    gcc-14
x86_64      buildonly-randconfig-004-20260519    gcc-14
x86_64      buildonly-randconfig-005-20260518    gcc-14
x86_64      buildonly-randconfig-005-20260519    gcc-14
x86_64      buildonly-randconfig-006-20260518    gcc-14
x86_64      buildonly-randconfig-006-20260519    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                         randconfig-001    gcc-14
x86_64                randconfig-001-20260518    gcc-14
x86_64                randconfig-001-20260519    clang-20
x86_64                         randconfig-002    gcc-14
x86_64                randconfig-002-20260518    gcc-14
x86_64                randconfig-002-20260519    clang-20
x86_64                         randconfig-003    gcc-14
x86_64                randconfig-003-20260518    gcc-14
x86_64                randconfig-003-20260519    clang-20
x86_64                         randconfig-004    gcc-14
x86_64                randconfig-004-20260518    gcc-14
x86_64                randconfig-004-20260519    clang-20
x86_64                         randconfig-005    gcc-14
x86_64                randconfig-005-20260518    gcc-14
x86_64                randconfig-005-20260519    clang-20
x86_64                         randconfig-006    gcc-14
x86_64                randconfig-006-20260518    gcc-14
x86_64                randconfig-006-20260519    clang-20
x86_64                randconfig-011-20260519    clang-20
x86_64                randconfig-012-20260519    clang-20
x86_64                randconfig-013-20260518    gcc-14
x86_64                randconfig-013-20260519    clang-20
x86_64                randconfig-014-20260519    clang-20
x86_64                randconfig-015-20260519    clang-20
x86_64                randconfig-016-20260518    gcc-14
x86_64                randconfig-016-20260519    clang-20
x86_64                randconfig-071-20260518    clang-20
x86_64                randconfig-071-20260519    gcc-14
x86_64                randconfig-072-20260518    clang-20
x86_64                randconfig-072-20260519    gcc-14
x86_64                randconfig-073-20260518    clang-20
x86_64                randconfig-073-20260519    gcc-14
x86_64                randconfig-074-20260518    clang-20
x86_64                randconfig-074-20260519    gcc-14
x86_64                randconfig-075-20260518    clang-20
x86_64                randconfig-075-20260519    gcc-14
x86_64                randconfig-076-20260518    clang-20
x86_64                randconfig-076-20260519    gcc-14
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-23
xtensa                            allnoconfig    gcc-15.2.0
xtensa                           allyesconfig    clang-23
xtensa                           allyesconfig    gcc-15.2.0
xtensa                randconfig-001-20260518    gcc-15.2.0
xtensa                randconfig-001-20260519    gcc-14.3.0
xtensa                randconfig-002-20260518    gcc-15.2.0
xtensa                randconfig-002-20260519    gcc-14.3.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
