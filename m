Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BB7634BA32
	for <linux-m68k@lists.linux-m68k.org>; Tue, 30 Sep 2025 04:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759205996; cv=none; b=CkCBubcZnZjml2pSFqV4iKDqWH4Xv/9s8HPizXLvcRsOXXBMsgIPThszy2QF6J31RpN9njZRqkCgggmkAXiyxX2NtlI00D4MucgmyqFPyhXbnUR5QpqU2TK1PKrr5AUggi3cl5UZSdRM3/OC2k4zaFVpwjEu73teArb/6Wg9Pks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759205996; c=relaxed/simple;
	bh=egUqtwTN+IOQJzxx/4Wd+HrRaVvW2i6X5Hpib/452pw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KZ6NNJiXwnb6GrSZDO5LGqLiIB2VURfu0oNkImx7ChkUkdI0+UHSbbx9+toPwIrnjy3XUKfbyEeoQtoxzRdtOixT6M88eO1VDshwn+pd1KLNtFSEJR+9bkJAH/qbjNAER754T7+3PyflN6kpQDzMHPbDbFQea4Rd5O7I0k9snMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mUBkkLQT; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mUBkkLQT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759205994; x=1790741994;
  h=date:from:to:cc:subject:message-id;
  bh=egUqtwTN+IOQJzxx/4Wd+HrRaVvW2i6X5Hpib/452pw=;
  b=mUBkkLQT2uTWdfYPz65ze/2EHc4YwXdiImaumOCS1VY1Dv+y9nphhT4k
   MLtoTi61OLHJm9s7ZtYqllqslzCp0w9Awjsgltxmmu/7IU22e8q0j/sED
   7EQ7FsLw867uEowcmoHkL+VfYjHUJy509T9QpPJWaCUvrpxA8OZ1tijXV
   KcvGjTvBUwpw+ToKQGtu4N3M46Q3PAJQm0HH71hNPW1zGzE6f4W2ioq9m
   wtUzLCVO2wlDh/5oOCCtiZw4V4bx3wgpuKelSam7MhWx8aU3lkxCOU+QD
   ksARQGPSPwepU/WfmovL0sAEEWBQfl351lnVOfT1CEIIpRmPEq/2tyFpg
   w==;
X-CSE-ConnectionGUID: Hs7bOIKPTSO76VoYLTn0Hw==
X-CSE-MsgGUID: vBjr0M/aShymeH260eNN7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11568"; a="61498807"
X-IronPort-AV: E=Sophos;i="6.18,303,1751266800"; 
   d="scan'208";a="61498807"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2025 21:19:53 -0700
X-CSE-ConnectionGUID: s0+uDNInQlKG/ggVlIGiSA==
X-CSE-MsgGUID: V7DCiS5ISjGf1taVwYza4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,303,1751266800"; 
   d="scan'208";a="178833342"
Received: from lkp-server01.sh.intel.com (HELO 2f2a1232a4e4) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 29 Sep 2025 21:19:52 -0700
Received: from kbuild by 2f2a1232a4e4 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v3Rq9-0000tb-39;
	Tue, 30 Sep 2025 04:19:50 +0000
Date: Tue, 30 Sep 2025 12:19:20 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:master] BUILD SUCCESS
 f6be823e4af90d31f8670c0d50d016159afe062b
Message-ID: <202509301210.rAgdAnW3-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git master
branch HEAD: f6be823e4af90d31f8670c0d50d016159afe062b  Merge tag 'v6.17'

elapsed time: 1155m

configs tested: 139
configs skipped: 7

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                                 defconfig    gcc-15.1.0
arc                   randconfig-001-20250929    gcc-8.5.0
arc                   randconfig-002-20250929    gcc-8.5.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    gcc-15.1.0
arm                                 defconfig    clang-22
arm                   randconfig-001-20250929    gcc-8.5.0
arm                   randconfig-002-20250929    gcc-14.3.0
arm                   randconfig-003-20250929    clang-22
arm                   randconfig-004-20250929    gcc-10.5.0
arm                       spear13xx_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20250929    gcc-8.5.0
arm64                 randconfig-002-20250929    gcc-13.4.0
arm64                 randconfig-003-20250929    clang-22
arm64                 randconfig-004-20250929    clang-22
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20250929    gcc-9.5.0
csky                  randconfig-001-20250930    gcc-13.4.0
csky                  randconfig-002-20250929    gcc-15.1.0
csky                  randconfig-002-20250930    gcc-13.4.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-22
hexagon                             defconfig    clang-22
hexagon               randconfig-001-20250929    clang-22
hexagon               randconfig-001-20250930    clang-22
hexagon               randconfig-002-20250929    clang-22
hexagon               randconfig-002-20250930    clang-22
i386                              allnoconfig    gcc-14
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20250929    gcc-14
i386        buildonly-randconfig-002-20250929    clang-20
i386        buildonly-randconfig-003-20250929    gcc-14
i386        buildonly-randconfig-004-20250929    gcc-14
i386        buildonly-randconfig-005-20250929    gcc-14
i386        buildonly-randconfig-006-20250929    gcc-14
i386                                defconfig    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20250929    gcc-12.5.0
loongarch             randconfig-001-20250930    clang-22
loongarch             randconfig-002-20250929    gcc-15.1.0
loongarch             randconfig-002-20250930    clang-22
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                           ip30_defconfig    gcc-15.1.0
mips                           xway_defconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20250929    gcc-11.5.0
nios2                 randconfig-001-20250930    gcc-8.5.0
nios2                 randconfig-002-20250930    gcc-8.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250930    gcc-12.5.0
parisc                randconfig-002-20250930    gcc-9.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-22
powerpc                 mpc837x_rdb_defconfig    gcc-15.1.0
powerpc               randconfig-001-20250930    gcc-8.5.0
powerpc               randconfig-002-20250930    gcc-14.3.0
powerpc               randconfig-003-20250930    gcc-15.1.0
powerpc64             randconfig-001-20250930    gcc-14.3.0
powerpc64             randconfig-002-20250930    gcc-12.5.0
powerpc64             randconfig-003-20250930    gcc-11.5.0
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-22
riscv                 randconfig-001-20250929    gcc-9.5.0
riscv                 randconfig-002-20250929    gcc-11.5.0
s390                             alldefconfig    gcc-15.1.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-22
s390                  randconfig-001-20250929    gcc-11.5.0
s390                  randconfig-002-20250929    gcc-13.4.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                    randconfig-001-20250929    gcc-15.1.0
sh                    randconfig-002-20250929    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250929    gcc-8.5.0
sparc                 randconfig-002-20250929    gcc-8.5.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20250929    clang-22
sparc64               randconfig-002-20250929    clang-22
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-14
um                    randconfig-001-20250929    gcc-14
um                    randconfig-002-20250929    gcc-14
um                           x86_64_defconfig    clang-22
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250929    gcc-14
x86_64      buildonly-randconfig-002-20250929    gcc-14
x86_64      buildonly-randconfig-003-20250929    clang-20
x86_64      buildonly-randconfig-004-20250929    gcc-14
x86_64      buildonly-randconfig-005-20250929    gcc-14
x86_64      buildonly-randconfig-006-20250929    gcc-14
x86_64                              defconfig    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250929    gcc-8.5.0
xtensa                randconfig-002-20250929    gcc-13.4.0
xtensa                    smp_lx200_defconfig    gcc-15.1.0
xtensa                    xip_kc705_defconfig    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
