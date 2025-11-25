Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7B8B22541C
	for <linux-m68k@lists.linux-m68k.org>; Tue, 25 Nov 2025 16:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764088744; cv=none; b=CNDJ9YQc4h9f6TNieClE5qceWmRT3DWCXqM3ihUvOmgGZR0xMIqwlrlo+/2Sff3x4z0M5i3Fn/b7bibQaF/sr1qPAxmFf45FUNVZPSks9a1SyKgyOHjmDhhI1O7gdlQ4UCuWIuqQOgGIiNyzpy7nVMl5ieuh6BJs7mL7QWNRyLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764088744; c=relaxed/simple;
	bh=gdW2BOnd+KzfNA7fKv9R2ffgeSgJeAWH+nG6o8e0rBM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=j85vnNdx6UJ8nq9HAVYVwRW77lDCxXNoz3lPqAtHGgLEaGm1rER9xvienC9EfextmOerg0DjnFAGoTxRswblEVp5hkl6Y/nDY96BCxfa7I/5JsAm8nt/5csorXCXstke1/BEKUFszXS1gDzPrZHU+Ky1zyG0eZnsfQ6b8+0pBuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CgHOmZK5; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CgHOmZK5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764088743; x=1795624743;
  h=date:from:to:cc:subject:message-id;
  bh=gdW2BOnd+KzfNA7fKv9R2ffgeSgJeAWH+nG6o8e0rBM=;
  b=CgHOmZK5PLXX+mXu7UCzLucOVnEjhjnQ1uS5nJA+ryr6hjRYUeN4JSgw
   oqTOz3ZWbRn7rhlxx68t3r1DUL/kki6VZXeE5KH10OG8Fr6VLRXTMFrNw
   X4YpBa8fCpKMuXLP2l9Mv7FuiJJgexCUUieJvXgzyyR7DY6AD1/rj3f2L
   65hw6Ocg8jorThFJQl2sLcWo48zhUcpv+wFdtxQbI7LaQIq0aq4/eTkzY
   UIQ+WoCNJ1aJGfvYWKyMEyXbkmvzA5JlYsInEOrN+GGazO0FkENVHrw3d
   Uox+nzodYXQtwGMGhupj7ZOhQCAaT8sSzFETyXMnQ+q11BNK46mPY1sf5
   w==;
X-CSE-ConnectionGUID: PWqY+vVATsuEOXGttNGjBg==
X-CSE-MsgGUID: /WLfuaDRQ3WBNgYHctXLoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="65298878"
X-IronPort-AV: E=Sophos;i="6.20,226,1758610800"; 
   d="scan'208";a="65298878"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2025 08:39:01 -0800
X-CSE-ConnectionGUID: FytqXtZXRiqCPNyAEwKedA==
X-CSE-MsgGUID: Y8yxZj+mQCaAoTVQ3Tjnrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,226,1758610800"; 
   d="scan'208";a="229953513"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 25 Nov 2025 08:38:59 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vNw49-0000000021F-1JcP;
	Tue, 25 Nov 2025 16:38:57 +0000
Date: Wed, 26 Nov 2025 00:38:17 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:master] BUILD SUCCESS
 52d91c66fb199275c4afa84e7fa62b5f991077a1
Message-ID: <202511260011.WmKUXUzt-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git master
branch HEAD: 52d91c66fb199275c4afa84e7fa62b5f991077a1  Merge tag 'v6.18-rc7'

elapsed time: 1478m

configs tested: 103
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                   randconfig-001-20251125    gcc-9.5.0
arc                   randconfig-002-20251125    gcc-8.5.0
arm                               allnoconfig    clang-22
arm                   randconfig-001-20251125    clang-22
arm                   randconfig-002-20251125    gcc-10.5.0
arm                   randconfig-003-20251125    gcc-10.5.0
arm                   randconfig-004-20251125    gcc-8.5.0
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20251125    gcc-11.5.0
arm64                 randconfig-002-20251125    gcc-13.4.0
arm64                 randconfig-003-20251125    gcc-8.5.0
arm64                 randconfig-004-20251125    gcc-11.5.0
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20251125    gcc-11.5.0
csky                  randconfig-002-20251125    gcc-15.1.0
hexagon                           allnoconfig    clang-22
hexagon               randconfig-001-20251125    clang-19
hexagon               randconfig-002-20251125    clang-22
i386                              allnoconfig    gcc-14
i386        buildonly-randconfig-001-20251125    gcc-14
i386        buildonly-randconfig-002-20251125    clang-20
i386        buildonly-randconfig-003-20251125    gcc-14
i386        buildonly-randconfig-004-20251125    gcc-14
i386        buildonly-randconfig-005-20251125    gcc-14
i386        buildonly-randconfig-006-20251125    clang-20
i386                  randconfig-001-20251125    gcc-12
i386                  randconfig-002-20251125    gcc-14
i386                  randconfig-003-20251125    gcc-14
i386                  randconfig-004-20251125    gcc-14
i386                  randconfig-005-20251125    gcc-14
i386                  randconfig-006-20251125    gcc-14
i386                  randconfig-007-20251125    gcc-14
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20251125    gcc-15.1.0
loongarch             randconfig-002-20251125    gcc-12.5.0
m68k                              allnoconfig    gcc-15.1.0
m68k                          atari_defconfig    gcc-15.1.0
m68k                                defconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                        qi_lb60_defconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20251125    gcc-8.5.0
nios2                 randconfig-002-20251125    gcc-11.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251125    gcc-13.4.0
parisc                randconfig-002-20251125    gcc-10.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc               randconfig-001-20251125    clang-19
powerpc               randconfig-002-20251125    gcc-8.5.0
powerpc64             randconfig-001-20251125    clang-16
powerpc64             randconfig-002-20251125    gcc-15.1.0
riscv                             allnoconfig    gcc-15.1.0
riscv                               defconfig    clang-22
riscv                 randconfig-001-20251125    gcc-8.5.0
riscv                 randconfig-002-20251125    gcc-13.4.0
s390                              allnoconfig    clang-22
s390                                defconfig    clang-22
s390                  randconfig-001-20251125    gcc-8.5.0
s390                  randconfig-002-20251125    gcc-14.3.0
s390                       zfcpdump_defconfig    clang-22
sh                                allnoconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                          r7780mp_defconfig    gcc-15.1.0
sh                    randconfig-001-20251125    gcc-15.1.0
sh                    randconfig-002-20251125    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251125    gcc-14.3.0
sparc                 randconfig-002-20251125    gcc-13.4.0
sparc64                          alldefconfig    gcc-15.1.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20251125    clang-22
sparc64               randconfig-002-20251125    gcc-8.5.0
um                                allnoconfig    clang-22
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251125    clang-22
um                    randconfig-002-20251125    clang-22
um                           x86_64_defconfig    clang-22
x86_64                            allnoconfig    clang-20
x86_64                              defconfig    gcc-14
x86_64                randconfig-011-20251125    gcc-12
x86_64                randconfig-012-20251125    clang-20
x86_64                randconfig-013-20251125    gcc-14
x86_64                randconfig-014-20251125    gcc-14
x86_64                randconfig-015-20251125    clang-20
x86_64                randconfig-016-20251125    gcc-14
xtensa                            allnoconfig    gcc-15.1.0
xtensa                       common_defconfig    gcc-15.1.0
xtensa                  nommu_kc705_defconfig    gcc-15.1.0
xtensa                randconfig-001-20251125    gcc-8.5.0
xtensa                randconfig-002-20251125    gcc-8.5.0
xtensa                    smp_lx200_defconfig    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
