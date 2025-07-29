Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52ED414F98
	for <linux-m68k@lists.linux-m68k.org>; Tue, 29 Jul 2025 09:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753780565; cv=none; b=EJDebNH6gr/4facpfGVpxXUc5AQOCrmDGO71PMiGc7Ng/GFkz1nT6F4KEvno72kDNQMc7KxQOX5lTlLJZBb1eioWj/HfA6+JDi6X0HL0903IWvCWWPW9+hOYwtrpJhDDQWS5b/xvbkq5XRFoC2LCudGtZuyOmxcCmDWSNpVRKRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753780565; c=relaxed/simple;
	bh=VV1ArnLuCrmdkOde08GnmyiZd/yohZ6OlJy+xWTsEsU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kdR9HxudWQkbFLpcFN9DLJPrRM+91BaD8niX5BxrnsNwbCyjFWQ6L0BvefBBHvPFoiBNI2ac4uyYmKVmpdmO0c+2Xzw1V8E97IiBLHMU3ELYBrrQcco8UXfvUIH9kCX+CPeCf9NysOYnRJsRXcg76fr1JQs3ROullacrDzUPHzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zdbaln+i; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zdbaln+i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753780561; x=1785316561;
  h=date:from:to:cc:subject:message-id;
  bh=VV1ArnLuCrmdkOde08GnmyiZd/yohZ6OlJy+xWTsEsU=;
  b=Zdbaln+ixZfFJwAeV44hGyT1kCHZBazNEjpgQGFHbhhU08JF77sxY1FM
   g0llpR7W3gcpkmQYXK0EOFcXWQqoSHj/XGNKwd4BgV7EolRTQS0h2sarY
   lAQVpET8Ho/NKED+sWy5QQbg7W2MdduvL6SFCQBAcCsSdvaVj02hDVBDC
   DxTbfWou7GiIU26Op8nqqDdIqmopV7+0yr52xCOYOpUcBpPK7/4mVuUij
   YB+Jy+/q9aBwbbdUd+tGJ3r5NnulIQdfIoBQcGXcl8IC9h1rBQIHZ6t5v
   IvE1h4RliQyO5KjOTbgijJpq/lF6jzXXTN1wOfSuWiRryPx8cX2952WK7
   A==;
X-CSE-ConnectionGUID: HhBRR3XmRVeVyFp+fvtmOQ==
X-CSE-MsgGUID: rcP72wlsTjCqoADYMfSPVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11505"; a="55981327"
X-IronPort-AV: E=Sophos;i="6.16,348,1744095600"; 
   d="scan'208";a="55981327"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2025 02:16:00 -0700
X-CSE-ConnectionGUID: pKjgPgTcS/215RMBk8nHbA==
X-CSE-MsgGUID: QP01JKXVQzquBJEzebq42g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,348,1744095600"; 
   d="scan'208";a="162525057"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 29 Jul 2025 02:15:59 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uggRA-00019a-2b;
	Tue, 29 Jul 2025 09:15:56 +0000
Date: Tue, 29 Jul 2025 17:15:23 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:m68k-v6.16] BUILD SUCCESS
 eb92c3f55a6c5f865507acfd8458e1315d423f04
Message-ID: <202507291710.S4LdCw3G-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git m68k-v6.16
branch HEAD: eb92c3f55a6c5f865507acfd8458e1315d423f04  m68k: defconfig: Enable Atari EtherNAT and NetUSBee USB support

elapsed time: 1360m

configs tested: 260
configs skipped: 13

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    clang-22
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    clang-19
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    clang-19
arc                              allmodconfig    clang-19
arc                               allnoconfig    clang-22
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    clang-19
arc                          axs103_defconfig    gcc-15.1.0
arc                                 defconfig    clang-19
arc                        nsim_700_defconfig    gcc-15.1.0
arc                   randconfig-001-20250728    gcc-13.4.0
arc                   randconfig-001-20250729    gcc-10.5.0
arc                   randconfig-002-20250728    gcc-12.5.0
arc                   randconfig-002-20250729    gcc-10.5.0
arm                              allmodconfig    clang-19
arm                               allnoconfig    clang-22
arm                              allyesconfig    clang-19
arm                       aspeed_g5_defconfig    gcc-15.1.0
arm                                 defconfig    clang-19
arm                          ep93xx_defconfig    gcc-15.1.0
arm                       netwinder_defconfig    gcc-15.1.0
arm                   randconfig-001-20250728    clang-22
arm                   randconfig-001-20250729    gcc-10.5.0
arm                   randconfig-002-20250728    clang-22
arm                   randconfig-002-20250729    gcc-10.5.0
arm                   randconfig-003-20250728    clang-22
arm                   randconfig-003-20250729    gcc-10.5.0
arm                   randconfig-004-20250728    gcc-8.5.0
arm                   randconfig-004-20250729    gcc-10.5.0
arm                         socfpga_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    clang-22
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    clang-19
arm64                 randconfig-001-20250728    clang-22
arm64                 randconfig-001-20250729    gcc-10.5.0
arm64                 randconfig-002-20250728    clang-20
arm64                 randconfig-002-20250729    gcc-10.5.0
arm64                 randconfig-003-20250728    gcc-11.5.0
arm64                 randconfig-003-20250729    gcc-10.5.0
arm64                 randconfig-004-20250728    clang-22
arm64                 randconfig-004-20250729    gcc-10.5.0
csky                              allnoconfig    clang-22
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    clang-19
csky                  randconfig-001-20250728    gcc-10.5.0
csky                  randconfig-001-20250729    gcc-10.5.0
csky                  randconfig-002-20250728    gcc-9.5.0
csky                  randconfig-002-20250729    gcc-10.5.0
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-22
hexagon                             defconfig    clang-19
hexagon               randconfig-001-20250728    clang-22
hexagon               randconfig-001-20250729    gcc-10.5.0
hexagon               randconfig-002-20250728    clang-16
hexagon               randconfig-002-20250729    gcc-10.5.0
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-20
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250728    gcc-12
i386        buildonly-randconfig-001-20250729    gcc-12
i386        buildonly-randconfig-002-20250728    gcc-12
i386        buildonly-randconfig-002-20250729    gcc-12
i386        buildonly-randconfig-003-20250728    gcc-12
i386        buildonly-randconfig-003-20250729    gcc-12
i386        buildonly-randconfig-004-20250728    clang-20
i386        buildonly-randconfig-004-20250729    gcc-12
i386        buildonly-randconfig-005-20250728    gcc-12
i386        buildonly-randconfig-005-20250729    gcc-12
i386        buildonly-randconfig-006-20250728    clang-20
i386        buildonly-randconfig-006-20250729    gcc-12
i386                                defconfig    clang-20
i386                  randconfig-001-20250729    gcc-12
i386                  randconfig-002-20250729    gcc-12
i386                  randconfig-003-20250729    gcc-12
i386                  randconfig-004-20250729    gcc-12
i386                  randconfig-005-20250729    gcc-12
i386                  randconfig-006-20250729    gcc-12
i386                  randconfig-007-20250729    gcc-12
i386                  randconfig-011-20250729    clang-20
i386                  randconfig-012-20250729    clang-20
i386                  randconfig-013-20250729    clang-20
i386                  randconfig-014-20250729    clang-20
i386                  randconfig-015-20250729    clang-20
i386                  randconfig-016-20250729    clang-20
i386                  randconfig-017-20250729    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20250728    clang-22
loongarch             randconfig-001-20250729    gcc-10.5.0
loongarch             randconfig-002-20250728    clang-20
loongarch             randconfig-002-20250729    gcc-10.5.0
m68k                             allmodconfig    clang-19
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    clang-19
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    clang-19
microblaze                       allmodconfig    clang-19
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    clang-19
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                          ath79_defconfig    gcc-15.1.0
mips                       bmips_be_defconfig    gcc-15.1.0
mips                  cavium_octeon_defconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                               defconfig    gcc-15.1.0
nios2                 randconfig-001-20250728    gcc-11.5.0
nios2                 randconfig-001-20250729    gcc-10.5.0
nios2                 randconfig-002-20250728    gcc-11.5.0
nios2                 randconfig-002-20250729    gcc-10.5.0
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-12
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250728    gcc-9.5.0
parisc                randconfig-001-20250729    gcc-10.5.0
parisc                randconfig-002-20250728    gcc-8.5.0
parisc                randconfig-002-20250729    gcc-10.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-22
powerpc                          allyesconfig    gcc-15.1.0
powerpc                 mpc8313_rdb_defconfig    gcc-15.1.0
powerpc               randconfig-001-20250728    gcc-10.5.0
powerpc               randconfig-001-20250729    gcc-10.5.0
powerpc               randconfig-002-20250728    gcc-13.4.0
powerpc               randconfig-002-20250729    gcc-10.5.0
powerpc               randconfig-003-20250728    gcc-8.5.0
powerpc               randconfig-003-20250729    gcc-10.5.0
powerpc                     tqm8541_defconfig    gcc-15.1.0
powerpc64             randconfig-001-20250728    clang-22
powerpc64             randconfig-001-20250729    gcc-10.5.0
powerpc64             randconfig-002-20250728    clang-22
powerpc64             randconfig-002-20250729    gcc-10.5.0
powerpc64             randconfig-003-20250728    gcc-8.5.0
powerpc64             randconfig-003-20250729    gcc-10.5.0
riscv                            allmodconfig    clang-22
riscv                            allmodconfig    gcc-15.1.0
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                            allyesconfig    gcc-15.1.0
riscv                               defconfig    clang-22
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20250728    clang-22
riscv                 randconfig-001-20250729    clang-22
riscv                 randconfig-002-20250728    gcc-11.5.0
riscv                 randconfig-002-20250729    clang-22
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-22
s390                                defconfig    gcc-12
s390                  randconfig-001-20250728    clang-22
s390                  randconfig-001-20250729    clang-22
s390                  randconfig-002-20250728    clang-17
s390                  randconfig-002-20250729    clang-22
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-12
sh                                  defconfig    gcc-15.1.0
sh                        edosk7705_defconfig    gcc-15.1.0
sh                            migor_defconfig    gcc-15.1.0
sh                    randconfig-001-20250728    gcc-14.3.0
sh                    randconfig-001-20250729    clang-22
sh                    randconfig-002-20250728    gcc-9.5.0
sh                    randconfig-002-20250729    clang-22
sh                          rsk7203_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250728    gcc-8.5.0
sparc                 randconfig-001-20250729    clang-22
sparc                 randconfig-002-20250728    gcc-14.3.0
sparc                 randconfig-002-20250729    clang-22
sparc64                             defconfig    clang-20
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250728    clang-20
sparc64               randconfig-001-20250729    clang-22
sparc64               randconfig-002-20250728    gcc-12.5.0
sparc64               randconfig-002-20250729    clang-22
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-12
um                                  defconfig    clang-22
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250728    clang-22
um                    randconfig-001-20250729    clang-22
um                    randconfig-002-20250728    gcc-12
um                    randconfig-002-20250729    clang-22
um                           x86_64_defconfig    clang-22
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250728    clang-20
x86_64      buildonly-randconfig-001-20250729    clang-20
x86_64      buildonly-randconfig-002-20250728    clang-20
x86_64      buildonly-randconfig-002-20250729    clang-20
x86_64      buildonly-randconfig-003-20250728    clang-20
x86_64      buildonly-randconfig-003-20250729    clang-20
x86_64      buildonly-randconfig-004-20250728    clang-20
x86_64      buildonly-randconfig-004-20250729    clang-20
x86_64      buildonly-randconfig-005-20250728    clang-20
x86_64      buildonly-randconfig-005-20250729    clang-20
x86_64      buildonly-randconfig-006-20250728    gcc-12
x86_64      buildonly-randconfig-006-20250729    clang-20
x86_64                              defconfig    clang-20
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250729    clang-20
x86_64                randconfig-002-20250729    clang-20
x86_64                randconfig-003-20250729    clang-20
x86_64                randconfig-004-20250729    clang-20
x86_64                randconfig-005-20250729    clang-20
x86_64                randconfig-006-20250729    clang-20
x86_64                randconfig-007-20250729    clang-20
x86_64                randconfig-008-20250729    clang-20
x86_64                randconfig-071-20250729    gcc-12
x86_64                randconfig-072-20250729    gcc-12
x86_64                randconfig-073-20250729    gcc-12
x86_64                randconfig-074-20250729    gcc-12
x86_64                randconfig-075-20250729    gcc-12
x86_64                randconfig-076-20250729    gcc-12
x86_64                randconfig-077-20250729    gcc-12
x86_64                randconfig-078-20250729    gcc-12
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-12
x86_64                         rhel-9.4-kunit    gcc-12
x86_64                           rhel-9.4-ltp    gcc-12
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250728    gcc-8.5.0
xtensa                randconfig-001-20250729    clang-22
xtensa                randconfig-002-20250728    gcc-8.5.0
xtensa                randconfig-002-20250729    clang-22

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
