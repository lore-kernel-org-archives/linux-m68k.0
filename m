Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E94B9233D9C
	for <linux-m68k@lists.linux-m68k.org>; Tue, 16 Sep 2025 03:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757994845; cv=none; b=rh9+G0d/eEV/Y83t22ZEfJ/oelxyz5RvC4iW0QCHHct7dMJ7r+QoD82bAN58RILL+4x92YWyLaPqiGc5eNFELo3KuIKqk6dHXBjvDUycu5dbQq8KUYco8iFiWJ67HHlDiTQZ2TtaJDKuARdG7xbc/Sk7npCA01QYCbutSjWVLOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757994845; c=relaxed/simple;
	bh=4Hud9SPKuNEpNPC51qXvlmNUeV0Is6hRV+cjV79sTmk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZUyLHXZxXcppcdbxaNFd5myKLVlU2i5tDBU3tBAai1UtnyQ76xrVTxhNa7IgzNRN9KWWYLS7cGj7TPqOm7qyM6rFgZt/zdRfCoWvTZ7+7TD//TDD28pvfYJq2ZQWvF49TS+1ZlNMHRxfNsb8PN3vMjW8hrPxfQl/3mjlT0w6gVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q/INBBTw; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q/INBBTw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757994843; x=1789530843;
  h=date:from:to:cc:subject:message-id;
  bh=4Hud9SPKuNEpNPC51qXvlmNUeV0Is6hRV+cjV79sTmk=;
  b=Q/INBBTwoQ/wxXe3coFBTisXh8ezlwhwbnonhsFVQjUFPZLXp50q42lp
   yIiywZp/vvTOSrtApqDvN9/e4m19yQYeBJ/SXChW344obaAh7mSxXVYu3
   Vfiluea8jKl5hpYPE2ga5BjcYFCALGdwfzS4RCoyju3y1oLxuH17UtDBb
   wraxYz7WINpTOEOAX2dwuqV22ZXD4ItaGxf7a0NU4HFLKAx58tOqOItcn
   RWWxn3P2L6xqWaVDI+Rca+NSCRi/D9dso/a2Y1AEG9m6MWCeTousDZ4an
   41Qxh7XFZpoQd5U+A6uZDDyL0yAGl5X2MrEUcmW21ERJEyW1tIA4Ev85I
   w==;
X-CSE-ConnectionGUID: YGcwDIHxT8OxbVf1SbVX/A==
X-CSE-MsgGUID: XuZ5o8OaSEu4t692swJwUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11554"; a="59960746"
X-IronPort-AV: E=Sophos;i="6.18,268,1751266800"; 
   d="scan'208";a="59960746"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2025 20:54:02 -0700
X-CSE-ConnectionGUID: JBrrNRxPRj+sus1VXs7XdQ==
X-CSE-MsgGUID: QCo2/tQ3S8+JqS8RQR1V/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,268,1751266800"; 
   d="scan'208";a="211995151"
Received: from lkp-server01.sh.intel.com (HELO 5b01dd97f97c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 15 Sep 2025 20:54:01 -0700
Received: from kbuild by 5b01dd97f97c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uyMlT-0000yt-0G;
	Tue, 16 Sep 2025 03:53:59 +0000
Date: Tue, 16 Sep 2025 11:53:34 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:for-v6.18] BUILD SUCCESS
 695f2c0c25f3c844f9dd177d20c1e8afc55df1ac
Message-ID: <202509161123.5ZGz4ilY-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git for-v6.18
branch HEAD: 695f2c0c25f3c844f9dd177d20c1e8afc55df1ac  m68k: defconfig: Update defconfigs for v6.17-rc1

elapsed time: 876m

configs tested: 239
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    clang-22
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    clang-19
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    clang-19
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    clang-22
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    clang-19
arc                              allyesconfig    gcc-15.1.0
arc                   randconfig-001-20250916    gcc-8.5.0
arc                   randconfig-002-20250916    gcc-8.5.0
arc                           tb10x_defconfig    gcc-15.1.0
arm                              allmodconfig    clang-19
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    clang-19
arm                              allyesconfig    gcc-15.1.0
arm                            mmp2_defconfig    gcc-15.1.0
arm                       netwinder_defconfig    gcc-15.1.0
arm                   randconfig-001-20250916    gcc-11.5.0
arm                   randconfig-002-20250916    clang-22
arm                   randconfig-003-20250916    gcc-12.5.0
arm                   randconfig-004-20250916    clang-22
arm                           sama7_defconfig    gcc-15.1.0
arm                        spear6xx_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    clang-22
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250916    clang-18
arm64                 randconfig-002-20250916    clang-22
arm64                 randconfig-003-20250916    clang-22
arm64                 randconfig-004-20250916    clang-22
csky                              allnoconfig    clang-22
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20250915    gcc-15.1.0
csky                  randconfig-001-20250916    clang-22
csky                  randconfig-001-20250916    gcc-14.3.0
csky                  randconfig-002-20250915    gcc-15.1.0
csky                  randconfig-002-20250916    clang-22
csky                  randconfig-002-20250916    gcc-11.5.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-22
hexagon               randconfig-001-20250915    clang-22
hexagon               randconfig-001-20250916    clang-22
hexagon               randconfig-002-20250915    clang-22
hexagon               randconfig-002-20250916    clang-22
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-14
i386                              allnoconfig    clang-20
i386                              allnoconfig    gcc-14
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20250915    clang-20
i386        buildonly-randconfig-001-20250916    clang-20
i386        buildonly-randconfig-002-20250915    gcc-14
i386        buildonly-randconfig-002-20250916    clang-20
i386        buildonly-randconfig-003-20250915    gcc-14
i386        buildonly-randconfig-003-20250916    clang-20
i386        buildonly-randconfig-004-20250915    gcc-14
i386        buildonly-randconfig-004-20250916    clang-20
i386        buildonly-randconfig-005-20250915    gcc-14
i386        buildonly-randconfig-005-20250916    clang-20
i386        buildonly-randconfig-006-20250915    gcc-14
i386        buildonly-randconfig-006-20250916    clang-20
i386                                defconfig    clang-20
i386                  randconfig-001-20250916    clang-20
i386                  randconfig-002-20250916    clang-20
i386                  randconfig-003-20250916    clang-20
i386                  randconfig-004-20250916    clang-20
i386                  randconfig-005-20250916    clang-20
i386                  randconfig-006-20250916    clang-20
i386                  randconfig-007-20250916    clang-20
i386                  randconfig-011-20250916    gcc-14
i386                  randconfig-012-20250916    gcc-14
i386                  randconfig-013-20250916    gcc-14
i386                  randconfig-014-20250916    gcc-14
i386                  randconfig-015-20250916    gcc-14
i386                  randconfig-016-20250916    gcc-14
i386                  randconfig-017-20250916    gcc-14
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch             randconfig-001-20250915    clang-22
loongarch             randconfig-001-20250916    clang-18
loongarch             randconfig-001-20250916    clang-22
loongarch             randconfig-002-20250915    gcc-12.5.0
loongarch             randconfig-002-20250916    clang-22
m68k                             allmodconfig    clang-19
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    clang-19
m68k                             allyesconfig    gcc-15.1.0
microblaze                       allmodconfig    clang-19
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    clang-19
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-15.1.0
nios2                               defconfig    gcc-11.5.0
nios2                               defconfig    gcc-15.1.0
nios2                 randconfig-001-20250915    gcc-11.5.0
nios2                 randconfig-001-20250916    clang-22
nios2                 randconfig-001-20250916    gcc-11.5.0
nios2                 randconfig-002-20250915    gcc-11.5.0
nios2                 randconfig-002-20250916    clang-22
nios2                 randconfig-002-20250916    gcc-8.5.0
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-14
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250915    gcc-9.5.0
parisc                randconfig-001-20250916    clang-22
parisc                randconfig-001-20250916    gcc-9.5.0
parisc                randconfig-002-20250915    gcc-14.3.0
parisc                randconfig-002-20250916    clang-22
parisc                randconfig-002-20250916    gcc-13.4.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-22
powerpc               randconfig-001-20250915    gcc-14.3.0
powerpc               randconfig-001-20250916    clang-16
powerpc               randconfig-001-20250916    clang-22
powerpc               randconfig-002-20250915    gcc-8.5.0
powerpc               randconfig-002-20250916    clang-22
powerpc               randconfig-003-20250915    clang-22
powerpc               randconfig-003-20250916    clang-22
powerpc64             randconfig-001-20250915    clang-20
powerpc64             randconfig-001-20250916    clang-22
powerpc64             randconfig-002-20250915    clang-22
powerpc64             randconfig-002-20250916    clang-22
powerpc64             randconfig-002-20250916    gcc-8.5.0
powerpc64             randconfig-003-20250915    clang-22
powerpc64             randconfig-003-20250916    clang-22
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-14
riscv                 randconfig-001-20250915    gcc-8.5.0
riscv                 randconfig-001-20250916    gcc-15.1.0
riscv                 randconfig-002-20250915    clang-22
riscv                 randconfig-002-20250916    gcc-15.1.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    gcc-14
s390                  randconfig-001-20250915    clang-22
s390                  randconfig-001-20250916    gcc-15.1.0
s390                  randconfig-002-20250915    clang-22
s390                  randconfig-002-20250916    gcc-15.1.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-14
sh                    randconfig-001-20250915    gcc-15.1.0
sh                    randconfig-001-20250916    gcc-15.1.0
sh                    randconfig-002-20250915    gcc-13.4.0
sh                    randconfig-002-20250916    gcc-15.1.0
sh                           se7619_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250915    gcc-8.5.0
sparc                 randconfig-001-20250916    gcc-15.1.0
sparc                 randconfig-002-20250915    gcc-8.5.0
sparc                 randconfig-002-20250916    gcc-15.1.0
sparc                       sparc32_defconfig    gcc-15.1.0
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20250915    gcc-13.4.0
sparc64               randconfig-001-20250916    gcc-15.1.0
sparc64               randconfig-002-20250915    gcc-12.5.0
sparc64               randconfig-002-20250916    gcc-15.1.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-14
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20250915    gcc-14
um                    randconfig-001-20250916    gcc-15.1.0
um                    randconfig-002-20250915    gcc-14
um                    randconfig-002-20250916    gcc-15.1.0
um                           x86_64_defconfig    gcc-14
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250915    clang-20
x86_64      buildonly-randconfig-001-20250916    clang-20
x86_64      buildonly-randconfig-002-20250915    gcc-12
x86_64      buildonly-randconfig-002-20250916    clang-20
x86_64      buildonly-randconfig-003-20250915    gcc-14
x86_64      buildonly-randconfig-003-20250916    clang-20
x86_64      buildonly-randconfig-004-20250915    clang-20
x86_64      buildonly-randconfig-004-20250916    clang-20
x86_64      buildonly-randconfig-005-20250915    clang-20
x86_64      buildonly-randconfig-005-20250916    clang-20
x86_64      buildonly-randconfig-006-20250915    gcc-14
x86_64      buildonly-randconfig-006-20250916    clang-20
x86_64                              defconfig    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250916    clang-20
x86_64                randconfig-002-20250916    clang-20
x86_64                randconfig-003-20250916    clang-20
x86_64                randconfig-004-20250916    clang-20
x86_64                randconfig-005-20250916    clang-20
x86_64                randconfig-006-20250916    clang-20
x86_64                randconfig-007-20250916    clang-20
x86_64                randconfig-008-20250916    clang-20
x86_64                randconfig-071-20250916    gcc-14
x86_64                randconfig-072-20250916    gcc-14
x86_64                randconfig-073-20250916    gcc-14
x86_64                randconfig-074-20250916    gcc-14
x86_64                randconfig-075-20250916    gcc-14
x86_64                randconfig-076-20250916    gcc-14
x86_64                randconfig-077-20250916    gcc-14
x86_64                randconfig-078-20250916    gcc-14
x86_64                               rhel-9.4    clang-20
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250915    gcc-9.5.0
xtensa                randconfig-001-20250916    gcc-15.1.0
xtensa                randconfig-002-20250915    gcc-11.5.0
xtensa                randconfig-002-20250916    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
