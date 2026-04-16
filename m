Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EFF4373BEC
	for <linux-m68k@lists.linux-m68k.org>; Thu, 16 Apr 2026 20:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776371424; cv=none; b=d6a7H3qbqjcbiLaw4sk6/8WnXfdLEKk//q0GsZeQtaT4unWL6RBbZhP65QCtmWSEPN2DSIlaHJ4JbhfYb+0m5iNVg1GrjcWVSICHSKDc8JG/BzpvAhW1E6L1TceiXeM7ZaH8k7cRbDm5Jlxi+aBcT1WetVxJqlvcoyT20Ughy60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776371424; c=relaxed/simple;
	bh=ALPnb6mRnngQfHB6o7hJLW74PmHQufvlybcN0iZyGjQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=aPHX6OHa1/iBRbyuqhi/JTxZsHnBrwwKBYRoa+/zEbp8K71oynycT3FuYtn80OoHk9E+5qJItjrYNB0VoQFL/DS83uQVhDlToYz3u4NWIEDhkbFngtq+RcJQXI1khqfELbMC8pG4I3oKfBauG5K5UOLBslfSfV00FhZrRiO1dsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UGPkQcdH; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UGPkQcdH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776371421; x=1807907421;
  h=date:from:to:cc:subject:message-id;
  bh=ALPnb6mRnngQfHB6o7hJLW74PmHQufvlybcN0iZyGjQ=;
  b=UGPkQcdHgJB3amSeAbG3P6s9PSenJXZVCJseRRT6nzYfF5avFsSS8wW7
   dGoCcwOMkL7GEeClvv1s9NiRk8r8Ox4/X+tCCP4hmxDVDk4AD25vFcS2U
   JW5nf6Ax9LA/2Q2OVaIRgiz9dC+RUwAQxMcQMQAebof7L4vgWuajgw+PP
   HxtiKJwbsAoOVe4YyqPJ6993kGq96Bysr68/Ep8njfJRqhBq/i2uBiPor
   bjV7UEYrSlBxfGtDhJRmjW3muk0p3P+ja2zQFpjIRyHO8O1ZERGi+C3X5
   ym+LWpe0E2hBT/4mzYoGgXvQ0BShRVNd4H3eX3qSlwjDXZIDumgUudVVm
   g==;
X-CSE-ConnectionGUID: 7iOlQrbCRRibPdlwNy2Fuw==
X-CSE-MsgGUID: y3LfX8HYRGSbMujP/ho4fA==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="81256117"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; 
   d="scan'208";a="81256117"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2026 13:30:20 -0700
X-CSE-ConnectionGUID: Onhcl0U4Qa2AQHK1DJmvEA==
X-CSE-MsgGUID: LFZ2WRTrS3CbjT+jcbXOkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; 
   d="scan'208";a="228166822"
Received: from lkp-server01.sh.intel.com (HELO 7f3b36e5d6a5) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 16 Apr 2026 13:30:18 -0700
Received: from kbuild by 7f3b36e5d6a5 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wDTLs-000000001v0-0i1a;
	Thu, 16 Apr 2026 20:30:16 +0000
Date: Fri, 17 Apr 2026 04:29:25 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:m68k-v7.0] BUILD SUCCESS
 924f5158af6b6b049ca54bc1601d313feb270f6d
Message-ID: <202604170417.eM9aNAE3-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git m68k-v7.0
branch HEAD: 924f5158af6b6b049ca54bc1601d313feb270f6d  m68k: defconfig: Enable Atari EtherNAT and NetUSBee USB support

elapsed time: 753m

configs tested: 158
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    gcc-15.2.0
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    gcc-15.2.0
arc                                 defconfig    gcc-15.2.0
arc                   randconfig-001-20260416    gcc-14.3.0
arc                   randconfig-002-20260416    gcc-10.5.0
arm                               allnoconfig    clang-23
arm                              allyesconfig    gcc-15.2.0
arm                                 defconfig    clang-23
arm                   randconfig-001-20260416    clang-23
arm                   randconfig-002-20260416    gcc-8.5.0
arm                   randconfig-003-20260416    gcc-8.5.0
arm                   randconfig-004-20260416    gcc-11.5.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260417    clang-19
arm64                 randconfig-002-20260417    clang-23
arm64                 randconfig-003-20260417    clang-23
arm64                 randconfig-004-20260417    gcc-15.2.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260417    gcc-13.4.0
csky                  randconfig-002-20260417    gcc-14.3.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-23
hexagon                             defconfig    clang-23
hexagon               randconfig-001-20260416    clang-23
hexagon               randconfig-002-20260416    clang-23
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20260416    gcc-14
i386        buildonly-randconfig-002-20260416    gcc-12
i386        buildonly-randconfig-003-20260416    clang-20
i386        buildonly-randconfig-004-20260416    clang-20
i386        buildonly-randconfig-005-20260416    clang-20
i386        buildonly-randconfig-006-20260416    gcc-14
i386                                defconfig    clang-20
i386                  randconfig-001-20260416    gcc-14
i386                  randconfig-002-20260416    clang-20
i386                  randconfig-003-20260416    clang-20
i386                  randconfig-004-20260416    clang-20
i386                  randconfig-005-20260416    clang-20
i386                  randconfig-006-20260416    clang-20
i386                  randconfig-007-20260416    gcc-14
i386                  randconfig-011-20260416    gcc-14
i386                  randconfig-012-20260416    gcc-14
i386                  randconfig-013-20260416    clang-20
i386                  randconfig-014-20260416    clang-20
i386                  randconfig-015-20260416    clang-20
i386                  randconfig-016-20260416    clang-20
i386                  randconfig-017-20260416    gcc-14
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-23
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260416    gcc-15.2.0
loongarch             randconfig-002-20260416    gcc-15.2.0
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    gcc-15.2.0
m68k                                defconfig    gcc-15.2.0
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    gcc-15.2.0
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20260416    gcc-8.5.0
nios2                 randconfig-002-20260416    gcc-8.5.0
openrisc                         allmodconfig    gcc-15.2.0
openrisc                          allnoconfig    gcc-15.2.0
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    gcc-15.2.0
parisc                           allyesconfig    gcc-15.2.0
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260416    gcc-10.5.0
parisc                randconfig-002-20260416    gcc-8.5.0
parisc64                            defconfig    gcc-15.2.0
powerpc                           allnoconfig    gcc-15.2.0
powerpc               randconfig-001-20260416    clang-23
powerpc               randconfig-002-20260416    gcc-8.5.0
powerpc64             randconfig-001-20260416    clang-16
powerpc64             randconfig-002-20260416    gcc-8.5.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-23
riscv                 randconfig-001-20260416    gcc-11.5.0
riscv                 randconfig-002-20260416    clang-23
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    clang-23
s390                  randconfig-001-20260416    clang-23
s390                  randconfig-002-20260416    clang-20
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    gcc-15.2.0
sh                                  defconfig    gcc-15.2.0
sh                    randconfig-001-20260416    gcc-9.5.0
sh                    randconfig-002-20260416    gcc-15.2.0
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260416    gcc-15.2.0
sparc                 randconfig-002-20260416    gcc-15.2.0
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20260416    clang-23
sparc64               randconfig-002-20260416    gcc-8.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                                  defconfig    clang-23
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260416    clang-23
um                    randconfig-002-20260416    clang-23
um                           x86_64_defconfig    clang-23
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260416    gcc-12
x86_64      buildonly-randconfig-002-20260416    gcc-14
x86_64      buildonly-randconfig-003-20260416    clang-20
x86_64      buildonly-randconfig-004-20260416    gcc-14
x86_64      buildonly-randconfig-005-20260416    clang-20
x86_64      buildonly-randconfig-006-20260416    clang-20
x86_64                              defconfig    gcc-14
x86_64                randconfig-001-20260416    gcc-13
x86_64                randconfig-002-20260416    gcc-14
x86_64                randconfig-003-20260416    clang-20
x86_64                randconfig-004-20260416    clang-20
x86_64                randconfig-005-20260416    gcc-14
x86_64                randconfig-006-20260416    gcc-14
x86_64                randconfig-011-20260416    clang-20
x86_64                randconfig-012-20260416    gcc-14
x86_64                randconfig-013-20260416    gcc-14
x86_64                randconfig-014-20260416    gcc-12
x86_64                randconfig-015-20260416    clang-20
x86_64                randconfig-016-20260416    gcc-12
x86_64                randconfig-071-20260416    gcc-14
x86_64                randconfig-072-20260416    gcc-14
x86_64                randconfig-073-20260416    gcc-14
x86_64                randconfig-074-20260416    clang-20
x86_64                randconfig-075-20260416    clang-20
x86_64                randconfig-076-20260416    clang-20
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.2.0
xtensa                randconfig-001-20260416    gcc-11.5.0
xtensa                randconfig-002-20260416    gcc-10.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
