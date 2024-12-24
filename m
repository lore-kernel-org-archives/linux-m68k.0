Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AA7DEC0
	for <linux-m68k@lists.linux-m68k.org>; Tue, 24 Dec 2024 09:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735031023; cv=none; b=bb5e/a7rUdiNbSRpU2HHHZcjbdjDvsq/fh7ga4DsUkfGj1p4i3bO1VjRZT0NOTtwdR48NseXo1B5bH647wgjDyH6O1kSjcXT89ZFw9FtPPExWHO3gzV+wTqhPky1S4yw3mVKvX8pMcIrUM9xhw9RfbetGMvD+cazBBlY2BKzogo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735031023; c=relaxed/simple;
	bh=JY2iZgAgeG8k051Hgj0tSbNJAlBgvRfhcqy8vob3y0o=;
	h=Date:From:To:Cc:Subject:Message-ID; b=c/5Hkz1yv8LrXn8bj5/6Lwmd+4ETELgeKe2+8jFQuElNpTmhk6e+zlP0boavslpobJQheG49HPlRT5pUPm4eJtH2ZZYmnPNkdeOFZ6fKoyd6g0fVlNNILXS7UgZK9KrXsb17c5J2vqLdy45CGgSWIx4k5/Rr9ZO0LsrAkBr3IzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mu/zN4p6; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mu/zN4p6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735031021; x=1766567021;
  h=date:from:to:cc:subject:message-id;
  bh=JY2iZgAgeG8k051Hgj0tSbNJAlBgvRfhcqy8vob3y0o=;
  b=Mu/zN4p6WTFXj0LnS36iqHWPc/HB8w/ZyZ23JoS92Sf2AXHLiap/sZu1
   apQ8rEVsgS3zcuQa7fFNrUe3cAqNZZq2lZeGFkFvI4WdsJ334nIidlVDW
   lGXqnCT6u6+fmm0BPcvG53vuyXJa1E7VzangjaseGZDev2o0EQTh9i0Uq
   /MJ7oI0L5fRpPAWfWrz0NZlmWH7ijoPuvzC+K/YrTN5gGGUfG28sjC1EI
   FXE0Ha9xETSoYipTmY1SzFr77ceqfqyGA30WvulRoByl+Q3VY+qXs6TTY
   zirzOO3IwFhk40Y0iSonFQOuj3Bg/4Mqh2Cy0Hfz/XQC9uxJJ5JYdz4a1
   w==;
X-CSE-ConnectionGUID: l6PJ76KLSei+/A4vOx03vA==
X-CSE-MsgGUID: ySZJ8qBVQbqL0qrYPir5gQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11295"; a="46874678"
X-IronPort-AV: E=Sophos;i="6.12,259,1728975600"; 
   d="scan'208";a="46874678"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2024 01:03:40 -0800
X-CSE-ConnectionGUID: SICq7AO7T6O5+uf7CZT5ow==
X-CSE-MsgGUID: ByRTkky9TZSTo5UEgtgLxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,259,1728975600"; 
   d="scan'208";a="104293628"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 24 Dec 2024 01:03:39 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tQ0pF-0000zL-1F;
	Tue, 24 Dec 2024 09:03:37 +0000
Date: Tue, 24 Dec 2024 17:02:42 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:master] BUILD SUCCESS
 523da2cae9f513b9e639df475fb1ebbdeff58a39
Message-ID: <202412241737.Z8lSW2fB-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git master
branch HEAD: 523da2cae9f513b9e639df475fb1ebbdeff58a39  Merge tag 'v6.13-rc4'

elapsed time: 1003m

configs tested: 110
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                   randconfig-001-20241224    gcc-13.2.0
arc                   randconfig-002-20241224    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                              allyesconfig    gcc-14.2.0
arm                             pxa_defconfig    gcc-14.2.0
arm                   randconfig-001-20241224    gcc-14.2.0
arm                   randconfig-002-20241224    gcc-14.2.0
arm                   randconfig-003-20241224    clang-19
arm                   randconfig-004-20241224    gcc-14.2.0
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20241224    gcc-14.2.0
arm64                 randconfig-002-20241224    clang-20
arm64                 randconfig-003-20241224    gcc-14.2.0
arm64                 randconfig-004-20241224    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20241224    gcc-14.2.0
csky                  randconfig-002-20241224    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon                          allyesconfig    clang-18
hexagon               randconfig-001-20241224    clang-20
hexagon               randconfig-002-20241224    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20241224    clang-19
i386        buildonly-randconfig-002-20241224    gcc-12
i386        buildonly-randconfig-003-20241224    clang-19
i386        buildonly-randconfig-004-20241224    clang-19
i386        buildonly-randconfig-005-20241224    clang-19
i386                                defconfig    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20241224    gcc-14.2.0
loongarch             randconfig-002-20241224    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                        bcm63xx_defconfig    clang-20
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20241224    gcc-14.2.0
nios2                 randconfig-002-20241224    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                randconfig-001-20241224    gcc-14.2.0
parisc                randconfig-002-20241224    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc                     kmeter1_defconfig    gcc-14.2.0
powerpc               randconfig-001-20241224    clang-15
powerpc               randconfig-002-20241224    clang-20
powerpc               randconfig-003-20241224    gcc-14.2.0
powerpc                  storcenter_defconfig    gcc-14.2.0
powerpc                     tqm8540_defconfig    gcc-14.2.0
powerpc64             randconfig-001-20241224    clang-20
powerpc64             randconfig-002-20241224    clang-20
powerpc64             randconfig-003-20241224    clang-20
riscv                            allmodconfig    clang-20
riscv                             allnoconfig    gcc-14.2.0
riscv                 randconfig-001-20241224    clang-17
riscv                 randconfig-002-20241224    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20241224    gcc-14.2.0
s390                  randconfig-002-20241224    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                    randconfig-001-20241224    gcc-14.2.0
sh                    randconfig-002-20241224    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20241224    gcc-14.2.0
sparc                 randconfig-002-20241224    gcc-14.2.0
sparc64               randconfig-001-20241224    gcc-14.2.0
sparc64               randconfig-002-20241224    gcc-14.2.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-18
um                               allyesconfig    gcc-12
um                    randconfig-001-20241224    gcc-12
um                    randconfig-002-20241224    clang-15
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20241224    clang-19
x86_64      buildonly-randconfig-002-20241224    gcc-12
x86_64      buildonly-randconfig-003-20241224    gcc-12
x86_64      buildonly-randconfig-004-20241224    clang-19
x86_64      buildonly-randconfig-005-20241224    gcc-11
x86_64      buildonly-randconfig-006-20241224    gcc-11
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20241224    gcc-14.2.0
xtensa                randconfig-002-20241224    gcc-14.2.0
xtensa                         virt_defconfig    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
