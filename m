Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 320DE5383
	for <linux-m68k@lists.linux-m68k.org>; Tue,  8 Jul 2025 05:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751951119; cv=none; b=FwvQQaz2OZe7LUJmQCcRnq2l+2pH8IIjpbpm/+YZ/bhDGnA2RDKbNjBOF1Ra6SqGALk1Vrvi6AY/I9Ri2GOWRs4ZPCUCqSfIrfM5RLpTjmrJBO7pViP23ITJ5BX088bHv36+2UhNNVSN1O3cmtmh8QUEBFkjOLpn+pQSQn1n66c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751951119; c=relaxed/simple;
	bh=uOJt9zOMe5rk+yeaMDFWEUOiCLicVCF5PvmGzwookMc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Oyannh4fhllrgcxla2kgg1G/Y9vVP9VILBACqlPjBcaW7mZGcNpd4oKCsKaPDTukTLYhVKec2W603LDRD8lOpHVnlbbvp1I0G4FWJQQnDm9GNc8MCofMqgX2XyyfJbvnM80V1aPcrEi+9X72NNDr91EjUcGlZg4DjTrGlOr44sQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hp9jodm6; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hp9jodm6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751951117; x=1783487117;
  h=date:from:to:cc:subject:message-id;
  bh=uOJt9zOMe5rk+yeaMDFWEUOiCLicVCF5PvmGzwookMc=;
  b=Hp9jodm6NPOi8G3CMqvvkXYifXQVRHnaqDkjKsAgCtYpPcI/dHiZhPIQ
   CXmaophlXizgqlFJuengZcigjGv6k9NH0VllJIDYirblwSho7GGnGhGU0
   nyCPeoicqVWbgcyxqXTlwFQ417I89Tnnm+C8vBfVFf9QCmfO3UOaWLMAA
   58YRHDtg5OFfcw8f9Eo6SI0HwvpkUo4/dnFr0WlXxCSO3gXK52/M/3ZVV
   WJRyV12FrF0RTUUWjFUjwlG/MaKzGZq+08S3yTcPURcyh87TWH3QbqIb1
   h23t6MxD4LMvht9PE8+6DpNOzfmFqDhHZwhbw7p3/7jOhbS1RuOF4tOOI
   Q==;
X-CSE-ConnectionGUID: oN8uKloVRw+vQTOfeFIgoA==
X-CSE-MsgGUID: oN0CLxyeQ/uEUnNK51kReQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="57947352"
X-IronPort-AV: E=Sophos;i="6.16,296,1744095600"; 
   d="scan'208";a="57947352"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2025 22:05:15 -0700
X-CSE-ConnectionGUID: f+jS96V5Qn2VcM0oR3dp8Q==
X-CSE-MsgGUID: O71gVY47T06XSJwBeVokVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,296,1744095600"; 
   d="scan'208";a="159732586"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 07 Jul 2025 22:05:13 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uZ0Vz-00010Z-1T;
	Tue, 08 Jul 2025 05:05:11 +0000
Date: Tue, 08 Jul 2025 13:04:41 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:master] BUILD SUCCESS
 0fe926a05d02a3f4406c16c66a6d95c86fbbc826
Message-ID: <202507081328.1LAgblNU-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git master
branch HEAD: 0fe926a05d02a3f4406c16c66a6d95c86fbbc826  Merge tag 'v6.16-rc5'

elapsed time: 1151m

configs tested: 228
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    clang-21
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    clang-19
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    clang-21
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                                 defconfig    clang-19
arc                   randconfig-001-20250707    gcc-15.1.0
arc                   randconfig-001-20250708    clang-17
arc                   randconfig-002-20250707    gcc-8.5.0
arc                   randconfig-002-20250708    clang-17
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-15.1.0
arm                     am200epdkit_defconfig    gcc-15.1.0
arm                                 defconfig    clang-19
arm                        mvebu_v7_defconfig    clang-21
arm                   randconfig-001-20250707    gcc-10.5.0
arm                   randconfig-001-20250708    clang-17
arm                   randconfig-002-20250707    gcc-11.5.0
arm                   randconfig-002-20250708    clang-17
arm                   randconfig-003-20250707    clang-21
arm                   randconfig-003-20250708    clang-17
arm                   randconfig-004-20250707    clang-21
arm                   randconfig-004-20250708    clang-17
arm                           u8500_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    clang-21
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    clang-19
arm64                 randconfig-001-20250707    gcc-8.5.0
arm64                 randconfig-001-20250708    clang-17
arm64                 randconfig-002-20250707    gcc-11.5.0
arm64                 randconfig-002-20250708    clang-17
arm64                 randconfig-003-20250707    gcc-12.3.0
arm64                 randconfig-003-20250708    clang-17
arm64                 randconfig-004-20250707    gcc-14.3.0
arm64                 randconfig-004-20250708    clang-17
csky                              allnoconfig    clang-21
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    clang-19
csky                  randconfig-001-20250707    gcc-15.1.0
csky                  randconfig-001-20250708    gcc-8.5.0
csky                  randconfig-002-20250707    gcc-12.4.0
csky                  randconfig-002-20250708    gcc-8.5.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon                             defconfig    clang-19
hexagon               randconfig-001-20250707    clang-21
hexagon               randconfig-001-20250708    gcc-8.5.0
hexagon               randconfig-002-20250707    clang-21
hexagon               randconfig-002-20250708    gcc-8.5.0
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-20
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250707    gcc-12
i386        buildonly-randconfig-002-20250707    clang-20
i386        buildonly-randconfig-003-20250707    gcc-12
i386        buildonly-randconfig-004-20250707    gcc-12
i386        buildonly-randconfig-005-20250707    gcc-12
i386        buildonly-randconfig-006-20250707    gcc-12
i386                                defconfig    clang-20
i386                  randconfig-001-20250708    gcc-11
i386                  randconfig-002-20250708    gcc-11
i386                  randconfig-003-20250708    gcc-11
i386                  randconfig-004-20250708    gcc-11
i386                  randconfig-005-20250708    gcc-11
i386                  randconfig-006-20250708    gcc-11
i386                  randconfig-007-20250708    gcc-11
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-21
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20250707    clang-21
loongarch             randconfig-001-20250708    gcc-8.5.0
loongarch             randconfig-002-20250707    gcc-15.1.0
loongarch             randconfig-002-20250708    gcc-8.5.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    clang-19
m68k                        m5272c3_defconfig    gcc-15.1.0
m68k                           sun3_defconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-15.1.0
nios2                               defconfig    gcc-14.2.0
nios2                               defconfig    gcc-15.1.0
nios2                 randconfig-001-20250707    gcc-10.5.0
nios2                 randconfig-001-20250708    gcc-8.5.0
nios2                 randconfig-002-20250707    gcc-12.4.0
nios2                 randconfig-002-20250708    gcc-8.5.0
openrisc                          allnoconfig    clang-21
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-12
openrisc                            defconfig    gcc-15.1.0
openrisc                    or1ksim_defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-21
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250707    gcc-8.5.0
parisc                randconfig-001-20250708    gcc-8.5.0
parisc                randconfig-002-20250707    gcc-15.1.0
parisc                randconfig-002-20250708    gcc-8.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-21
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-21
powerpc                      arches_defconfig    gcc-15.1.0
powerpc                       eiger_defconfig    gcc-15.1.0
powerpc                     mpc512x_defconfig    clang-21
powerpc               randconfig-001-20250707    gcc-8.5.0
powerpc               randconfig-001-20250708    gcc-8.5.0
powerpc               randconfig-002-20250707    clang-21
powerpc               randconfig-002-20250708    gcc-8.5.0
powerpc               randconfig-003-20250707    gcc-8.5.0
powerpc               randconfig-003-20250708    gcc-8.5.0
powerpc64             randconfig-001-20250707    gcc-8.5.0
powerpc64             randconfig-001-20250708    gcc-8.5.0
powerpc64             randconfig-002-20250707    gcc-10.5.0
powerpc64             randconfig-002-20250708    gcc-8.5.0
powerpc64             randconfig-003-20250707    clang-21
powerpc64             randconfig-003-20250708    gcc-8.5.0
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    clang-21
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-21
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20250707    clang-21
riscv                 randconfig-001-20250708    clang-17
riscv                 randconfig-002-20250707    clang-21
riscv                 randconfig-002-20250708    clang-17
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-21
s390                                defconfig    gcc-12
s390                  randconfig-001-20250707    clang-21
s390                  randconfig-001-20250708    clang-17
s390                  randconfig-002-20250707    gcc-11.5.0
s390                  randconfig-002-20250708    clang-17
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-12
sh                                  defconfig    gcc-15.1.0
sh                          landisk_defconfig    gcc-15.1.0
sh                    randconfig-001-20250707    gcc-15.1.0
sh                    randconfig-001-20250708    clang-17
sh                    randconfig-002-20250707    gcc-15.1.0
sh                    randconfig-002-20250708    clang-17
sh                           se7712_defconfig    gcc-15.1.0
sh                           se7721_defconfig    gcc-15.1.0
sh                           se7724_defconfig    gcc-15.1.0
sh                           se7751_defconfig    gcc-15.1.0
sh                   secureedge5410_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250707    gcc-12.4.0
sparc                 randconfig-001-20250708    clang-17
sparc                 randconfig-002-20250707    gcc-8.5.0
sparc                 randconfig-002-20250708    clang-17
sparc64                             defconfig    clang-20
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250707    clang-20
sparc64               randconfig-001-20250708    clang-17
sparc64               randconfig-002-20250707    gcc-15.1.0
sparc64               randconfig-002-20250708    clang-17
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250707    gcc-12
um                    randconfig-001-20250708    clang-17
um                    randconfig-002-20250707    gcc-12
um                    randconfig-002-20250708    clang-17
um                           x86_64_defconfig    clang-21
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250707    gcc-12
x86_64      buildonly-randconfig-001-20250708    gcc-12
x86_64      buildonly-randconfig-002-20250707    gcc-12
x86_64      buildonly-randconfig-002-20250708    gcc-12
x86_64      buildonly-randconfig-003-20250707    gcc-12
x86_64      buildonly-randconfig-003-20250708    gcc-12
x86_64      buildonly-randconfig-004-20250707    clang-20
x86_64      buildonly-randconfig-004-20250708    gcc-12
x86_64      buildonly-randconfig-005-20250707    gcc-12
x86_64      buildonly-randconfig-005-20250708    gcc-12
x86_64      buildonly-randconfig-006-20250707    clang-20
x86_64      buildonly-randconfig-006-20250708    gcc-12
x86_64                              defconfig    clang-20
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250708    gcc-12
x86_64                randconfig-002-20250708    gcc-12
x86_64                randconfig-003-20250708    gcc-12
x86_64                randconfig-004-20250708    gcc-12
x86_64                randconfig-005-20250708    gcc-12
x86_64                randconfig-006-20250708    gcc-12
x86_64                randconfig-007-20250708    gcc-12
x86_64                randconfig-008-20250708    gcc-12
x86_64                               rhel-9.4    clang-20
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250707    gcc-12.4.0
xtensa                randconfig-001-20250708    clang-17
xtensa                randconfig-002-20250707    gcc-8.5.0
xtensa                randconfig-002-20250708    clang-17

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
