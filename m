Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D99423DE9A
	for <linux-m68k@lists.linux-m68k.org>; Tue, 10 Dec 2024 12:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733833224; cv=none; b=eppJ6fmE+1rbhw/WPx8i6bG99cHYFYtzBVA/8iIeBrIH9G0qZuh2kd/apJnP3ZFYc4UEX0wNXDaQT0qdtfN33hPn0D9KKEo1acBVKUmrUqpEKPssuJ6l2NducTFhzLNkVEZTld5YZKTInPZkab+w7b2z4bCCD1ItD7/s6xbMwp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733833224; c=relaxed/simple;
	bh=rAeKhWYwDdb7g+3dOMobwLLUO1Fa2LCHU7ryLSWKanM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pmBDuo/zMO1A8oAcjoDd5bgyaoKh9NyT/OFb0VJ0w7WPdGWgLxV/uSsU9Htylx5FE9gwmQVsOO263TehToeh5rSysvRuPFXy9+pDuw3EweqJtIJx5M6uTKDqQwt2TmIpgsBLtuNqT0g9R0+gWfE/opti6SGnWCGl4vfQOGHxgCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BSMrlNvH; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BSMrlNvH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733833221; x=1765369221;
  h=date:from:to:cc:subject:message-id;
  bh=rAeKhWYwDdb7g+3dOMobwLLUO1Fa2LCHU7ryLSWKanM=;
  b=BSMrlNvHpqshx2dnGrBMHTiNKVmpjOUqO0j1tbm7tspClqXjnCslsoVU
   PhjGxDmvmEz+DyBOR6EE5inryrKtccKIQGYbAD+GinuCDuZ636FxaXNwu
   CS2uHFT4+EqqJwdw4Xn1DhDlJUndzM3jO5rml3XuCR33fTD+aSm0mBClp
   wPdvQOIx+933jYo780mu2m8K9v8kqvYMTEndxvGqpCc0DKw3y67/ZMyXU
   foxZ3aJNpCJ8q207ryqC+HRZH1c4odWbYWC5LhOZXipHuFyB0BPKPyvB4
   TdDFHdImg5vEl0sM40SwaJnrFFWtefY09CE+3oMg2Tgg1FJguHuqQiJHW
   A==;
X-CSE-ConnectionGUID: QEVNQQZPQvSbCVMwsRCrng==
X-CSE-MsgGUID: bQ5pRMN+TOCC7uwDWrEY7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="44642395"
X-IronPort-AV: E=Sophos;i="6.12,222,1728975600"; 
   d="scan'208";a="44642395"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2024 04:20:21 -0800
X-CSE-ConnectionGUID: rK8usz4mR3OuPO2nMCVlew==
X-CSE-MsgGUID: r6oKxBMFTJOUq2Vp4d+Swg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,222,1728975600"; 
   d="scan'208";a="126294344"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 10 Dec 2024 04:20:19 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKzDt-0005WT-0L;
	Tue, 10 Dec 2024 12:20:17 +0000
Date: Tue, 10 Dec 2024 20:19:56 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:master] BUILD SUCCESS
 e96424b86d5098f44279399b85551e0f84a1c9e9
Message-ID: <202412102050.oLjlgq8x-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git master
branch HEAD: e96424b86d5098f44279399b85551e0f84a1c9e9  m68k: Use kernel's generic muldi3 libgcc function

elapsed time: 1356m

configs tested: 140
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    clang-18
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    clang-18
arc                              allyesconfig    gcc-13.2.0
arc                   randconfig-001-20241210    gcc-13.2.0
arc                   randconfig-002-20241210    gcc-13.2.0
arm                              allmodconfig    clang-18
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    clang-18
arm                              allyesconfig    gcc-14.2.0
arm                   randconfig-004-20241210    clang-20
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20241210    clang-20
arm64                 randconfig-002-20241210    clang-20
arm64                 randconfig-003-20241210    clang-20
arm64                 randconfig-004-20241210    clang-20
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20241209    gcc-14.2.0
csky                  randconfig-002-20241209    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-18
hexagon               randconfig-001-20241209    clang-16
hexagon               randconfig-002-20241209    clang-20
i386                             allmodconfig    clang-19
i386                              allnoconfig    clang-19
i386                             allyesconfig    clang-19
i386        buildonly-randconfig-001-20241209    clang-19
i386        buildonly-randconfig-001-20241210    gcc-12
i386        buildonly-randconfig-002-20241209    clang-19
i386        buildonly-randconfig-002-20241210    gcc-12
i386        buildonly-randconfig-003-20241209    clang-19
i386        buildonly-randconfig-003-20241210    gcc-12
i386        buildonly-randconfig-004-20241209    clang-19
i386        buildonly-randconfig-004-20241210    gcc-12
i386        buildonly-randconfig-005-20241209    clang-19
i386        buildonly-randconfig-005-20241210    gcc-12
i386        buildonly-randconfig-006-20241209    clang-19
i386        buildonly-randconfig-006-20241210    gcc-12
i386                                defconfig    clang-19
i386                  randconfig-001-20241210    clang-19
i386                  randconfig-002-20241210    clang-19
i386                  randconfig-003-20241210    clang-19
i386                  randconfig-004-20241210    clang-19
i386                  randconfig-005-20241210    clang-19
i386                  randconfig-006-20241210    clang-19
i386                  randconfig-007-20241210    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20241209    gcc-14.2.0
loongarch             randconfig-002-20241209    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20241209    gcc-14.2.0
nios2                 randconfig-002-20241209    gcc-14.2.0
openrisc                          allnoconfig    clang-20
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-20
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20241209    gcc-14.2.0
parisc                randconfig-002-20241209    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-20
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc                          allyesconfig    gcc-14.2.0
powerpc               randconfig-001-20241209    gcc-14.2.0
powerpc               randconfig-002-20241209    clang-15
powerpc               randconfig-003-20241209    clang-17
powerpc64             randconfig-001-20241209    gcc-14.2.0
powerpc64             randconfig-002-20241209    clang-17
powerpc64             randconfig-003-20241209    clang-20
riscv                            allmodconfig    clang-20
riscv                            allmodconfig    gcc-14.2.0
riscv                             allnoconfig    clang-20
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-20
riscv                            allyesconfig    gcc-14.2.0
riscv                               defconfig    clang-19
riscv                 randconfig-001-20241209    clang-19
riscv                 randconfig-002-20241209    clang-20
s390                             allmodconfig    clang-19
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-15
s390                  randconfig-001-20241209    clang-16
s390                  randconfig-002-20241209    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-14.2.0
sh                    randconfig-001-20241209    gcc-14.2.0
sh                    randconfig-002-20241209    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20241209    gcc-14.2.0
sparc                 randconfig-002-20241209    gcc-14.2.0
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20241209    gcc-14.2.0
sparc64               randconfig-002-20241209    gcc-14.2.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-18
um                                allnoconfig    clang-20
um                               allyesconfig    gcc-12
um                                  defconfig    clang-20
um                             i386_defconfig    gcc-12
um                    randconfig-001-20241209    clang-19
um                    randconfig-002-20241209    gcc-12
um                           x86_64_defconfig    clang-15
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20241210    gcc-12
x86_64      buildonly-randconfig-002-20241210    clang-19
x86_64      buildonly-randconfig-003-20241210    clang-19
x86_64      buildonly-randconfig-004-20241210    gcc-12
x86_64      buildonly-randconfig-005-20241210    gcc-12
x86_64      buildonly-randconfig-006-20241210    clang-19
x86_64                              defconfig    clang-19
x86_64                                  kexec    clang-19
x86_64                               rhel-9.4    clang-19
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20241209    gcc-14.2.0
xtensa                randconfig-002-20241209    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
