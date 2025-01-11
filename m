Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A433214E2C2
	for <linux-m68k@lists.linux-m68k.org>; Sat, 11 Jan 2025 10:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736593058; cv=none; b=HhP+q2+oYRZv8legCVIVf7tri4Vl+g8XtEA4GjHOk/1wR7IZtzRLJXfhsk9Fab4aTk5+LuP5+FmNDOGaYJjXv354Nhf4T2ZfJAn/eKTlQSPAwTRAW5oAth7JfpFyA8IJzv6KzJVdADw/n52xH93ahrZLp/bjWPAwztn9H7/aOAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736593058; c=relaxed/simple;
	bh=q0dPoNpwQof15XTCIBkLGtzUc62e1/IMe2vRUSmW0Mw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=avVZIVHAg5Lmi6JwLcZFTYaMrFaKxgEwATQ7+AmiaHTArGNgbvN8yKhnE7fyVellg5SLsF2iCAcEn72h/QR41EnGIRZjGTP0QWXwOVmDZPp1hfywnCJYBsWVD9wdtAFxkBZ9WyhmjVd+UC3Rc/UIWcjOESqnexRSgKsvCiYJyMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qxg/rOWi; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qxg/rOWi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736593057; x=1768129057;
  h=date:from:to:cc:subject:message-id;
  bh=q0dPoNpwQof15XTCIBkLGtzUc62e1/IMe2vRUSmW0Mw=;
  b=Qxg/rOWijYMs23jDYdMJtY4sUr7WBd14qhDoj3mjpE4/RbpSsTo/hcW1
   c1pJn0VL0yKp7gUdPdeG28bJfozGxuSzB+4d5qP2O3TeoKm5VNWBrC7DR
   vp0R598DkuFieOzhKXCSQis+mGt/pfKrC234OB9UDlqbSJTxqFpmbzAHY
   Xjmgunp9SwEWq4j34TNBFdQvUL2bhttNy5ZZIQxw1DueaKY4XJWZrclt/
   pO+zCTeQ+AFrUzGs88pjfR5Lb6fXfHmGW+9PMF4iasPmN24D0ukOJPdau
   3aqjJrA7b8N+TW5jvsbJaPJEpbkVbwwIvIAE8DGsoZ3UUrZvQeAt/RGKr
   g==;
X-CSE-ConnectionGUID: 7SdVoIV4RjKniO7/uXMblw==
X-CSE-MsgGUID: A0FLcpZKSvONzhrAaYdHsw==
X-IronPort-AV: E=McAfee;i="6700,10204,11311"; a="40823607"
X-IronPort-AV: E=Sophos;i="6.12,307,1728975600"; 
   d="scan'208";a="40823607"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2025 02:57:36 -0800
X-CSE-ConnectionGUID: 7GMhGuPwQ0OSJb5sdwLXnA==
X-CSE-MsgGUID: KXUZlCFrRBmtnf3yZ6Ezvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,307,1728975600"; 
   d="scan'208";a="108870702"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 11 Jan 2025 02:57:35 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWZBM-000KWp-2c;
	Sat, 11 Jan 2025 10:57:32 +0000
Date: Sat, 11 Jan 2025 18:56:48 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:for-v6.14] BUILD SUCCESS
 bb2e0fb1e6aa9f737d6e0cbcf6494c51180e6d6d
Message-ID: <202501111838.FP1bLuyj-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git for-v6.14
branch HEAD: bb2e0fb1e6aa9f737d6e0cbcf6494c51180e6d6d  m68k: libgcc: Fix lvalue abuse in umul_ppmm()

elapsed time: 1457m

configs tested: 198
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-13.2.0
arc                   randconfig-001-20250110    gcc-13.2.0
arc                   randconfig-001-20250111    clang-18
arc                   randconfig-002-20250110    gcc-13.2.0
arc                   randconfig-002-20250111    clang-18
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    gcc-14.2.0
arm                            hisi_defconfig    gcc-14.2.0
arm                         lpc18xx_defconfig    clang-20
arm                   milbeaut_m10v_defconfig    clang-20
arm                   randconfig-001-20250110    clang-20
arm                   randconfig-001-20250111    clang-18
arm                   randconfig-002-20250110    gcc-14.2.0
arm                   randconfig-002-20250111    clang-18
arm                   randconfig-003-20250110    clang-19
arm                   randconfig-003-20250111    clang-18
arm                   randconfig-004-20250110    gcc-14.2.0
arm                   randconfig-004-20250111    clang-18
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250110    gcc-14.2.0
arm64                 randconfig-001-20250111    clang-18
arm64                 randconfig-002-20250110    gcc-14.2.0
arm64                 randconfig-002-20250111    clang-18
arm64                 randconfig-003-20250110    clang-17
arm64                 randconfig-003-20250111    clang-18
arm64                 randconfig-004-20250110    gcc-14.2.0
arm64                 randconfig-004-20250111    clang-18
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250110    gcc-14.2.0
csky                  randconfig-002-20250110    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-18
hexagon               randconfig-001-20250110    clang-20
hexagon               randconfig-002-20250110    clang-20
i386                             allmodconfig    clang-19
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-19
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-19
i386        buildonly-randconfig-001-20250110    clang-19
i386        buildonly-randconfig-001-20250111    gcc-11
i386        buildonly-randconfig-002-20250110    clang-19
i386        buildonly-randconfig-002-20250111    gcc-11
i386        buildonly-randconfig-003-20250110    clang-19
i386        buildonly-randconfig-003-20250111    gcc-11
i386        buildonly-randconfig-004-20250110    gcc-12
i386        buildonly-randconfig-004-20250111    gcc-11
i386        buildonly-randconfig-005-20250110    gcc-12
i386        buildonly-randconfig-005-20250111    gcc-11
i386        buildonly-randconfig-006-20250110    clang-19
i386        buildonly-randconfig-006-20250111    gcc-11
i386                                defconfig    clang-19
i386                  randconfig-001-20250111    clang-19
i386                  randconfig-002-20250111    clang-19
i386                  randconfig-003-20250111    clang-19
i386                  randconfig-004-20250111    clang-19
i386                  randconfig-005-20250111    clang-19
i386                  randconfig-006-20250111    clang-19
i386                  randconfig-007-20250111    clang-19
i386                  randconfig-011-20250111    clang-19
i386                  randconfig-012-20250111    clang-19
i386                  randconfig-013-20250111    clang-19
i386                  randconfig-014-20250111    clang-19
i386                  randconfig-015-20250111    clang-19
i386                  randconfig-016-20250111    clang-19
i386                  randconfig-017-20250111    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250110    gcc-14.2.0
loongarch             randconfig-002-20250110    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                          multi_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                           ci20_defconfig    gcc-14.2.0
mips                            gpr_defconfig    clang-20
nios2                         3c120_defconfig    clang-20
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250110    gcc-14.2.0
nios2                 randconfig-002-20250110    gcc-14.2.0
openrisc                         alldefconfig    gcc-14.2.0
openrisc                          allnoconfig    clang-20
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-20
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                randconfig-001-20250110    gcc-14.2.0
parisc                randconfig-002-20250110    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-20
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc                     asp8347_defconfig    gcc-14.2.0
powerpc                     mpc512x_defconfig    clang-20
powerpc               randconfig-001-20250110    clang-20
powerpc               randconfig-002-20250110    clang-20
powerpc               randconfig-003-20250110    clang-20
powerpc64             randconfig-001-20250110    clang-17
powerpc64             randconfig-002-20250110    clang-19
powerpc64             randconfig-003-20250110    clang-17
riscv                            allmodconfig    clang-20
riscv                             allnoconfig    clang-20
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-20
riscv                 randconfig-001-20250110    clang-17
riscv                 randconfig-001-20250111    gcc-14.2.0
riscv                 randconfig-002-20250110    clang-20
riscv                 randconfig-002-20250111    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250110    gcc-14.2.0
s390                  randconfig-001-20250111    gcc-14.2.0
s390                  randconfig-002-20250110    gcc-14.2.0
s390                  randconfig-002-20250111    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                     magicpanelr2_defconfig    gcc-14.2.0
sh                    randconfig-001-20250110    gcc-14.2.0
sh                    randconfig-001-20250111    gcc-14.2.0
sh                    randconfig-002-20250110    gcc-14.2.0
sh                    randconfig-002-20250111    gcc-14.2.0
sh                          rsk7203_defconfig    clang-20
sh                           sh2007_defconfig    clang-20
sh                              ul2_defconfig    clang-20
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250110    gcc-14.2.0
sparc                 randconfig-001-20250111    gcc-14.2.0
sparc                 randconfig-002-20250110    gcc-14.2.0
sparc                 randconfig-002-20250111    gcc-14.2.0
sparc                       sparc32_defconfig    gcc-14.2.0
sparc64               randconfig-001-20250110    gcc-14.2.0
sparc64               randconfig-001-20250111    gcc-14.2.0
sparc64               randconfig-002-20250110    gcc-14.2.0
sparc64               randconfig-002-20250111    gcc-14.2.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-18
um                                allnoconfig    clang-20
um                               allyesconfig    gcc-12
um                    randconfig-001-20250110    clang-20
um                    randconfig-001-20250111    gcc-14.2.0
um                    randconfig-002-20250110    gcc-12
um                    randconfig-002-20250111    gcc-14.2.0
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250110    gcc-12
x86_64      buildonly-randconfig-001-20250111    clang-19
x86_64      buildonly-randconfig-002-20250110    clang-19
x86_64      buildonly-randconfig-002-20250111    clang-19
x86_64      buildonly-randconfig-003-20250110    clang-19
x86_64      buildonly-randconfig-003-20250111    clang-19
x86_64      buildonly-randconfig-004-20250110    gcc-12
x86_64      buildonly-randconfig-004-20250111    clang-19
x86_64      buildonly-randconfig-005-20250110    clang-19
x86_64      buildonly-randconfig-005-20250111    clang-19
x86_64      buildonly-randconfig-006-20250110    clang-19
x86_64      buildonly-randconfig-006-20250111    clang-19
x86_64                              defconfig    clang-19
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-19
x86_64                randconfig-001-20250111    clang-19
x86_64                randconfig-002-20250111    clang-19
x86_64                randconfig-003-20250111    clang-19
x86_64                randconfig-004-20250111    clang-19
x86_64                randconfig-005-20250111    clang-19
x86_64                randconfig-006-20250111    clang-19
x86_64                randconfig-007-20250111    clang-19
x86_64                randconfig-008-20250111    clang-19
x86_64                randconfig-071-20250111    gcc-12
x86_64                randconfig-072-20250111    gcc-12
x86_64                randconfig-073-20250111    gcc-12
x86_64                randconfig-074-20250111    gcc-12
x86_64                randconfig-075-20250111    gcc-12
x86_64                randconfig-076-20250111    gcc-12
x86_64                randconfig-077-20250111    gcc-12
x86_64                randconfig-078-20250111    gcc-12
x86_64                               rhel-9.4    clang-19
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250110    gcc-14.2.0
xtensa                randconfig-001-20250111    gcc-14.2.0
xtensa                randconfig-002-20250110    gcc-14.2.0
xtensa                randconfig-002-20250111    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
