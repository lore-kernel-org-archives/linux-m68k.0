Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6FC823C516
	for <linux-m68k@lists.linux-m68k.org>; Mon, 22 Sep 2025 21:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758576016; cv=none; b=SPeKTrO150OnF6m695oR0nRHzhMMb/cLthV4sEphsPDyjFty6hSISL6lTkBDQoi+5sy7zDSKjMmNnbs89TEkHpeV8Tvvim1xCiWrm5P2G8Qbel5hh7bhr40fIslCqMzC/VZCvV9LFFFdjdDvnox8lwiYrLtOQBPosekpanjhKLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758576016; c=relaxed/simple;
	bh=lritopqt0IRbIQNoZJhUtTvqUeD4HBWXxs4cgG59Eys=;
	h=Date:From:To:Cc:Subject:Message-ID; b=W10XqayeaSG4b7y8E0YfwGklbuYUkZhiEF3c39Soh7dvarlvirewEqvng/5MC5P61m+4NS7QU9SS3nwYewTr7lAuaLk+ilUKmxDn4Q5ot/VvLAWmL0Sc9fdY/iSxriTQEGUYqlF/Z2OGOeHb3d3lmiYIvSpyViTxgS4JYfzG8IY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iw0YPHs7; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iw0YPHs7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758576015; x=1790112015;
  h=date:from:to:cc:subject:message-id;
  bh=lritopqt0IRbIQNoZJhUtTvqUeD4HBWXxs4cgG59Eys=;
  b=iw0YPHs7O6Q/bwAp0ZxLKYKTNDZ3OeYbnC6CcbDllU3DLEHb9G2TPXWd
   EH1qA0YirkloI32GyOOc/MQc3pBrQAt0qiqPfdH3nQ18pWN/Y2Ctgk/mn
   sb4f0W/pmURC23gxobAW0RzTS7ZKLRBukw1ckcXsLSUD6A+q//pdt3jCv
   PJ+dBSdNIuhVXOubpmrxz7bdDABZKUbbvHv+NWZS9SMRv0SlqZcDg+fKX
   C07AkSae5GTXxH1Adtgus3QIzLTv/gF1Bch1a2Cz4kQ6X3jm6XKysLOtW
   0ziZfZAGJslgF6A+Onor3UHu/+NKV0bhvE8mGrSDR5y9WokLrEix5IGA4
   Q==;
X-CSE-ConnectionGUID: Ios8RE/5TPyYhzjivN2MrA==
X-CSE-MsgGUID: LPXCXhXCSJemyPSqn4UEQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="63477131"
X-IronPort-AV: E=Sophos;i="6.18,286,1751266800"; 
   d="scan'208";a="63477131"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2025 14:20:12 -0700
X-CSE-ConnectionGUID: fzcmfOhISNmxh9237CtFuw==
X-CSE-MsgGUID: P44OXdVFQGmr/7l1K3oWJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,286,1751266800"; 
   d="scan'208";a="176508001"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 22 Sep 2025 14:20:11 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v0nxB-0002UH-23;
	Mon, 22 Sep 2025 21:20:09 +0000
Date: Tue, 23 Sep 2025 05:19:37 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:master] BUILD SUCCESS
 5a8e23c2d2603cd8c64a5d79ea2a8833bc3799d8
Message-ID: <202509230526.N1Kwy7TG-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git master
branch HEAD: 5a8e23c2d2603cd8c64a5d79ea2a8833bc3799d8  Merge tag 'v6.17-rc7'

elapsed time: 730m

configs tested: 126
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                   randconfig-001-20250922    gcc-8.5.0
arc                   randconfig-002-20250922    gcc-9.5.0
arc                        vdk_hs38_defconfig    gcc-15.1.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    gcc-15.1.0
arm                        multi_v7_defconfig    gcc-15.1.0
arm                   randconfig-001-20250922    clang-22
arm                   randconfig-002-20250922    gcc-12.5.0
arm                   randconfig-003-20250922    clang-17
arm                   randconfig-004-20250922    gcc-8.5.0
arm                             rpc_defconfig    clang-18
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250922    gcc-8.5.0
arm64                 randconfig-002-20250922    gcc-15.1.0
arm64                 randconfig-003-20250922    clang-22
arm64                 randconfig-004-20250922    clang-22
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20250922    gcc-15.1.0
csky                  randconfig-002-20250922    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-22
hexagon               randconfig-001-20250922    clang-20
hexagon               randconfig-002-20250922    clang-19
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20250922    clang-20
i386        buildonly-randconfig-002-20250922    gcc-14
i386        buildonly-randconfig-003-20250922    gcc-14
i386        buildonly-randconfig-004-20250922    gcc-14
i386        buildonly-randconfig-005-20250922    clang-20
i386        buildonly-randconfig-006-20250922    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch             randconfig-001-20250922    clang-22
loongarch             randconfig-002-20250922    clang-18
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                        m5307c3_defconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20250922    gcc-11.5.0
nios2                 randconfig-002-20250922    gcc-8.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250922    gcc-8.5.0
parisc                randconfig-002-20250922    gcc-9.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-22
powerpc                 mpc8315_rdb_defconfig    clang-22
powerpc                 mpc832x_rdb_defconfig    gcc-15.1.0
powerpc               randconfig-001-20250922    clang-22
powerpc               randconfig-002-20250922    gcc-12.5.0
powerpc               randconfig-003-20250922    clang-17
powerpc64             randconfig-002-20250922    clang-20
powerpc64             randconfig-003-20250922    clang-17
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-22
riscv                 randconfig-001-20250922    clang-22
riscv                 randconfig-002-20250922    clang-22
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-22
s390                  randconfig-001-20250922    gcc-8.5.0
s390                  randconfig-002-20250922    gcc-11.5.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                            hp6xx_defconfig    gcc-15.1.0
sh                    randconfig-001-20250922    gcc-15.1.0
sh                    randconfig-002-20250922    gcc-11.5.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250922    gcc-15.1.0
sparc                 randconfig-002-20250922    gcc-14.3.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20250922    gcc-12.5.0
sparc64               randconfig-002-20250922    gcc-14.3.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-14
um                    randconfig-001-20250922    gcc-14
um                    randconfig-002-20250922    clang-22
um                           x86_64_defconfig    clang-22
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250922    clang-20
x86_64      buildonly-randconfig-002-20250922    gcc-13
x86_64      buildonly-randconfig-003-20250922    gcc-13
x86_64      buildonly-randconfig-004-20250922    clang-20
x86_64      buildonly-randconfig-005-20250922    clang-20
x86_64      buildonly-randconfig-006-20250922    clang-20
x86_64                              defconfig    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250922    gcc-9.5.0
xtensa                randconfig-002-20250922    gcc-11.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
