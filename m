Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B9C83ACEFE
	for <linux-m68k@lists.linux-m68k.org>; Wed, 10 Jun 2026 21:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781125437; cv=none; b=TLtGUQ75ZfglWG9vG63MuUUIbuHDkuhCZQ/9e6JyCspHV+Nrauof4K58qxiyNGU0TcUfTnUw+BAylG3CM2MA+f1b44JziFQLPqkGISA6wplMZDNzui6hMINc4l9hZJdF66vwrgx4sG8cU9bBTHVkaHpjMmFrkIeJLXAzw/DwVtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781125437; c=relaxed/simple;
	bh=UNmPlKnr0jF66QiDSbArITTJ4GY2GS/wovxGdfYidOs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Bue2t0tvSKRVCb3INlDRFs51zVJIAYqGyYTXv81g6QsHdiXFoLgdvNox4MlV4sO95xOyJHAZtRGfayppcfGaHOEWw+hXXAStgIpZgAeJx4e9VItgZHEPmxo5fRxJsnqJsS3p+tEBFu5V9pGH3P2mm3mdp9z3kh3sUYHWaLinlrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YiV/F7tl; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YiV/F7tl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781125436; x=1812661436;
  h=date:from:to:cc:subject:message-id;
  bh=UNmPlKnr0jF66QiDSbArITTJ4GY2GS/wovxGdfYidOs=;
  b=YiV/F7tlzlKjgUEQ6ii3PRtBPQTWm0NLU6pX8V2wIzF9K/UIuytcuUfh
   id+2wN+dCULtP7BhZR78p9qUuJodiVUbMfkRPn3yRqYM7swd+thjQQkd7
   tFIOwRs5M3WHG1wD40WJSEzwX6rHk0SqF6vr5TviiaZtoozM/eiiH9WKN
   UuUIP5Kkze8zDhP3pT6vNRhrgrcKbaP6Qk3sfkIs93Y1yBYbAegUgdFJ7
   vEoXSGfpyHD6rzJMc4OsnZzMp1pjrDJcfLALG4ReLBjNG+OiCNhaioLV5
   fw87jZhFt9BijmHRXnebMXtk/V0ry0XrD5kX8FvbhnIq3BinhiPgVdAin
   w==;
X-CSE-ConnectionGUID: XXa+zIIVQASnNol8YvB9+A==
X-CSE-MsgGUID: sdjQtmuiSr+v1HyFCbO5IQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="82039563"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="82039563"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 14:03:55 -0700
X-CSE-ConnectionGUID: cX78Kfd5Sk6HLgj+cCjwIQ==
X-CSE-MsgGUID: YWuGonm/QLKRMMS63eVWng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="246357005"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 10 Jun 2026 14:03:54 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wXQ5W-00000000LuY-2GN7;
	Wed, 10 Jun 2026 21:03:50 +0000
Date: Thu, 11 Jun 2026 05:03:11 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:for-v7.2] BUILD SUCCESS
 dc5200f6b1ada318463dd141b041ec9f044b2bf5
Message-ID: <202606110503.I7CEFeRb-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git for-v7.2
branch HEAD: dc5200f6b1ada318463dd141b041ec9f044b2bf5  m68k: Correct CONFIG_MVME16x macro name in #endif comment

elapsed time: 820m

configs tested: 271
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-16.1.0
alpha                            allyesconfig    gcc-16.1.0
alpha                               defconfig    gcc-16.1.0
arc                              allmodconfig    clang-23
arc                              allmodconfig    gcc-16.1.0
arc                               allnoconfig    gcc-16.1.0
arc                              allyesconfig    clang-23
arc                              allyesconfig    gcc-16.1.0
arc                                 defconfig    gcc-16.1.0
arc                   randconfig-001-20260610    gcc-8.5.0
arc                   randconfig-001-20260611    gcc-14.3.0
arc                   randconfig-002-20260610    gcc-8.5.0
arc                   randconfig-002-20260611    gcc-14.3.0
arm                               allnoconfig    clang-23
arm                               allnoconfig    gcc-16.1.0
arm                              allyesconfig    clang-23
arm                              allyesconfig    gcc-16.1.0
arm                                 defconfig    gcc-16.1.0
arm                        mvebu_v7_defconfig    clang-23
arm                   randconfig-001-20260610    gcc-8.5.0
arm                   randconfig-001-20260611    gcc-14.3.0
arm                   randconfig-002-20260610    gcc-8.5.0
arm                   randconfig-002-20260611    gcc-14.3.0
arm                   randconfig-003-20260610    gcc-8.5.0
arm                   randconfig-003-20260611    gcc-14.3.0
arm                   randconfig-004-20260610    gcc-8.5.0
arm                   randconfig-004-20260611    gcc-14.3.0
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-16.1.0
arm64                               defconfig    gcc-16.1.0
arm64                 randconfig-001-20260610    gcc-11.5.0
arm64                 randconfig-001-20260611    gcc-14.3.0
arm64                 randconfig-002-20260610    gcc-11.5.0
arm64                 randconfig-002-20260611    gcc-14.3.0
arm64                 randconfig-003-20260610    gcc-11.5.0
arm64                 randconfig-003-20260611    gcc-14.3.0
arm64                 randconfig-004-20260610    gcc-11.5.0
arm64                 randconfig-004-20260611    gcc-14.3.0
csky                             allmodconfig    gcc-16.1.0
csky                              allnoconfig    gcc-16.1.0
csky                                defconfig    gcc-16.1.0
csky                  randconfig-001-20260610    gcc-11.5.0
csky                  randconfig-001-20260611    gcc-14.3.0
csky                  randconfig-002-20260610    gcc-11.5.0
csky                  randconfig-002-20260611    gcc-14.3.0
hexagon                          allmodconfig    clang-23
hexagon                          allmodconfig    gcc-16.1.0
hexagon                           allnoconfig    clang-23
hexagon                           allnoconfig    gcc-16.1.0
hexagon                             defconfig    gcc-16.1.0
hexagon               randconfig-001-20260610    clang-22
hexagon               randconfig-001-20260611    clang-17
hexagon               randconfig-002-20260610    clang-22
hexagon               randconfig-002-20260611    clang-17
i386                             allmodconfig    clang-22
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-16.1.0
i386                             allyesconfig    clang-22
i386        buildonly-randconfig-001-20260610    gcc-14
i386        buildonly-randconfig-002-20260610    gcc-14
i386        buildonly-randconfig-003-20260610    gcc-14
i386        buildonly-randconfig-004-20260610    gcc-14
i386        buildonly-randconfig-005-20260610    gcc-14
i386        buildonly-randconfig-006-20260610    gcc-14
i386                                defconfig    gcc-16.1.0
i386                  randconfig-001-20260610    gcc-14
i386                  randconfig-002-20260610    gcc-14
i386                  randconfig-003-20260610    gcc-14
i386                  randconfig-004-20260610    gcc-14
i386                  randconfig-005-20260610    gcc-14
i386                  randconfig-006-20260610    gcc-14
i386                  randconfig-007-20260610    gcc-14
i386                  randconfig-011-20260610    gcc-14
i386                  randconfig-011-20260611    gcc-14
i386                  randconfig-012-20260610    gcc-14
i386                  randconfig-012-20260611    gcc-14
i386                  randconfig-013-20260610    gcc-14
i386                  randconfig-013-20260611    gcc-14
i386                  randconfig-014-20260610    gcc-14
i386                  randconfig-014-20260611    gcc-14
i386                  randconfig-015-20260610    gcc-14
i386                  randconfig-015-20260611    gcc-14
i386                  randconfig-016-20260610    gcc-14
i386                  randconfig-016-20260611    gcc-14
i386                  randconfig-017-20260610    gcc-14
i386                  randconfig-017-20260611    gcc-14
loongarch                        allmodconfig    clang-19
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    clang-20
loongarch                         allnoconfig    gcc-16.1.0
loongarch                           defconfig    clang-23
loongarch             randconfig-001-20260610    clang-22
loongarch             randconfig-001-20260611    clang-17
loongarch             randconfig-002-20260610    clang-22
loongarch             randconfig-002-20260611    clang-17
m68k                             allmodconfig    gcc-16.1.0
m68k                              allnoconfig    gcc-16.1.0
m68k                             allyesconfig    clang-23
m68k                             allyesconfig    gcc-16.1.0
m68k                         apollo_defconfig    gcc-16.1.0
m68k                                defconfig    clang-23
m68k                        m5272c3_defconfig    gcc-16.1.0
microblaze                        allnoconfig    gcc-16.1.0
microblaze                       allyesconfig    gcc-16.1.0
microblaze                          defconfig    clang-23
mips                             allmodconfig    gcc-16.1.0
mips                              allnoconfig    gcc-16.1.0
mips                             allyesconfig    gcc-16.1.0
nios2                            allmodconfig    clang-20
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-23
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-23
nios2                 randconfig-001-20260610    clang-22
nios2                 randconfig-001-20260611    clang-17
nios2                 randconfig-002-20260610    clang-22
nios2                 randconfig-002-20260611    clang-17
openrisc                         allmodconfig    clang-20
openrisc                         allmodconfig    gcc-16.1.0
openrisc                          allnoconfig    clang-23
openrisc                          allnoconfig    gcc-16.1.0
openrisc                            defconfig    gcc-16.1.0
parisc                           allmodconfig    gcc-16.1.0
parisc                            allnoconfig    clang-23
parisc                            allnoconfig    gcc-16.1.0
parisc                           allyesconfig    clang-17
parisc                           allyesconfig    clang-23
parisc                           allyesconfig    gcc-16.1.0
parisc                              defconfig    gcc-16.1.0
parisc                randconfig-001-20260610    gcc-8.5.0
parisc                randconfig-001-20260611    gcc-13.4.0
parisc                randconfig-002-20260610    gcc-8.5.0
parisc                randconfig-002-20260611    gcc-13.4.0
parisc64                            defconfig    clang-23
powerpc                     akebono_defconfig    clang-23
powerpc                          allmodconfig    gcc-16.1.0
powerpc                           allnoconfig    clang-23
powerpc                           allnoconfig    gcc-16.1.0
powerpc               randconfig-001-20260610    gcc-8.5.0
powerpc               randconfig-001-20260611    gcc-13.4.0
powerpc               randconfig-002-20260610    gcc-8.5.0
powerpc               randconfig-002-20260611    gcc-13.4.0
powerpc64             randconfig-001-20260610    gcc-8.5.0
powerpc64             randconfig-001-20260611    gcc-13.4.0
powerpc64             randconfig-002-20260610    gcc-8.5.0
powerpc64             randconfig-002-20260611    gcc-13.4.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                             allnoconfig    gcc-16.1.0
riscv                            allyesconfig    clang-23
riscv                               defconfig    gcc-16.1.0
riscv                          randconfig-001    gcc-16.1.0
riscv                 randconfig-001-20260610    gcc-16.1.0
riscv                 randconfig-001-20260611    gcc-12.5.0
riscv                          randconfig-002    gcc-16.1.0
riscv                 randconfig-002-20260610    gcc-16.1.0
riscv                 randconfig-002-20260611    gcc-12.5.0
s390                             allmodconfig    clang-17
s390                             allmodconfig    clang-23
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-16.1.0
s390                                defconfig    gcc-16.1.0
s390                           randconfig-001    gcc-16.1.0
s390                  randconfig-001-20260610    gcc-16.1.0
s390                  randconfig-001-20260611    gcc-12.5.0
s390                           randconfig-002    gcc-16.1.0
s390                  randconfig-002-20260610    gcc-16.1.0
s390                  randconfig-002-20260611    gcc-12.5.0
sh                               allmodconfig    gcc-16.1.0
sh                                allnoconfig    clang-23
sh                                allnoconfig    gcc-16.1.0
sh                               allyesconfig    clang-17
sh                               allyesconfig    clang-23
sh                               allyesconfig    gcc-16.1.0
sh                                  defconfig    gcc-14
sh                             randconfig-001    gcc-16.1.0
sh                    randconfig-001-20260610    gcc-16.1.0
sh                    randconfig-001-20260611    gcc-12.5.0
sh                             randconfig-002    gcc-16.1.0
sh                    randconfig-002-20260610    gcc-16.1.0
sh                    randconfig-002-20260611    gcc-12.5.0
sparc                             allnoconfig    clang-23
sparc                             allnoconfig    gcc-16.1.0
sparc                               defconfig    gcc-16.1.0
sparc                          randconfig-001    gcc-14.3.0
sparc                 randconfig-001-20260610    gcc-14.3.0
sparc                 randconfig-001-20260611    gcc-15.2.0
sparc                          randconfig-002    gcc-14.3.0
sparc                 randconfig-002-20260610    gcc-14.3.0
sparc                 randconfig-002-20260611    gcc-15.2.0
sparc64                          allmodconfig    clang-20
sparc64                             defconfig    gcc-14
sparc64                        randconfig-001    gcc-14.3.0
sparc64               randconfig-001-20260610    gcc-14.3.0
sparc64               randconfig-001-20260611    gcc-15.2.0
sparc64                        randconfig-002    gcc-14.3.0
sparc64               randconfig-002-20260610    gcc-14.3.0
sparc64               randconfig-002-20260611    gcc-15.2.0
um                               allmodconfig    clang-17
um                               allmodconfig    clang-23
um                                allnoconfig    clang-16
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-16.1.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                             randconfig-001    gcc-14.3.0
um                    randconfig-001-20260610    gcc-14.3.0
um                    randconfig-001-20260611    gcc-15.2.0
um                             randconfig-002    gcc-14.3.0
um                    randconfig-002-20260610    gcc-14.3.0
um                    randconfig-002-20260611    gcc-15.2.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-22
x86_64                            allnoconfig    clang-22
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-22
x86_64      buildonly-randconfig-001-20260610    gcc-14
x86_64      buildonly-randconfig-001-20260611    gcc-14
x86_64      buildonly-randconfig-002-20260610    gcc-14
x86_64      buildonly-randconfig-002-20260611    gcc-14
x86_64      buildonly-randconfig-003-20260610    gcc-14
x86_64      buildonly-randconfig-003-20260611    gcc-14
x86_64      buildonly-randconfig-004-20260610    gcc-14
x86_64      buildonly-randconfig-004-20260611    gcc-14
x86_64      buildonly-randconfig-005-20260610    gcc-14
x86_64      buildonly-randconfig-005-20260611    gcc-14
x86_64      buildonly-randconfig-006-20260610    gcc-14
x86_64      buildonly-randconfig-006-20260611    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-22
x86_64                randconfig-001-20260610    gcc-13
x86_64                randconfig-001-20260611    gcc-14
x86_64                randconfig-002-20260610    gcc-13
x86_64                randconfig-002-20260611    gcc-14
x86_64                randconfig-003-20260610    gcc-13
x86_64                randconfig-003-20260611    gcc-14
x86_64                randconfig-004-20260610    gcc-13
x86_64                randconfig-004-20260611    gcc-14
x86_64                randconfig-005-20260610    gcc-13
x86_64                randconfig-005-20260611    gcc-14
x86_64                randconfig-006-20260610    gcc-13
x86_64                randconfig-006-20260611    gcc-14
x86_64                randconfig-011-20260610    gcc-14
x86_64                randconfig-012-20260610    gcc-14
x86_64                randconfig-013-20260610    gcc-14
x86_64                randconfig-014-20260610    gcc-14
x86_64                randconfig-015-20260610    gcc-14
x86_64                randconfig-016-20260610    gcc-14
x86_64                randconfig-071-20260610    gcc-14
x86_64                randconfig-072-20260610    gcc-14
x86_64                randconfig-073-20260610    gcc-14
x86_64                randconfig-074-20260610    gcc-14
x86_64                randconfig-075-20260610    gcc-14
x86_64                randconfig-076-20260610    gcc-14
x86_64                               rhel-9.4    clang-22
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-22
x86_64                    rhel-9.4-kselftests    clang-22
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-22
xtensa                            allnoconfig    clang-23
xtensa                            allnoconfig    gcc-16.1.0
xtensa                           allyesconfig    clang-20
xtensa                         randconfig-001    gcc-14.3.0
xtensa                randconfig-001-20260610    gcc-14.3.0
xtensa                randconfig-001-20260611    gcc-15.2.0
xtensa                         randconfig-002    gcc-14.3.0
xtensa                randconfig-002-20260610    gcc-14.3.0
xtensa                randconfig-002-20260611    gcc-15.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
