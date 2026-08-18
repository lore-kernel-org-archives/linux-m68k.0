Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6892C1D95A3
	for <linux-m68k@lists.linux-m68k.org>; Tue, 18 Aug 2026 21:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787089304; cv=none; b=fZAhRovRW8S+2VCZT98H3SYs2135S+qHexZF9AMVbgYSKGKGrKRO+Frqwj8JLBzly5CXzWqLbgFaeDNq43SiHMooQLqvfFWpnkJ7DMG5mLSEIfe1DettWPRTZX1pDnoBR0xAJ5DSyUPqd4BlThB0qUSKUZrlb2cjV/ogPu959W0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787089304; c=relaxed/simple;
	bh=mK4xZ6wiO7zTBmqfmbeXwVu3Mcy7KCh6p9/hwvmRFjw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uKcCt1JoDS0uTIwh2s73kgdI1Hi1kVgeK4NIQo8g7gJuLRY3b6OeE+PkA/QBgTGV/WZjsdncJiDOH2LIOfj8s/doIisg1FuWJFtu1xNJGgz2vg3fH4hZIFl5cMPZ+BeNVefBd+OOelWdYUGe8BEENuXddQ+krQI6Kqz2soXQJIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WAR8HU6m; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WAR8HU6m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787089302; x=1818625302;
  h=date:from:to:cc:subject:message-id;
  bh=mK4xZ6wiO7zTBmqfmbeXwVu3Mcy7KCh6p9/hwvmRFjw=;
  b=WAR8HU6moL3+M0mBBT6isuxfkzVqPd0dOzvnDI8zck8vHUbkkirRHAZJ
   +XFgCiYZfIlQtgO+MIs9fE1difQSfv15MBImPiDUYBTp0U5lqGF3sAAJq
   PooJt8cWEPnl+ga4Bk0SAgnPynklPN6T8zoq6VLq7LKhlQUmGHSDlQIBH
   uoQtoUHb6T5C5gKr3VnVs6vcmIl+y01afxoz8eOKTvqeLU16Wiv9xsOD7
   K5OO3igQsUEc0nDd3Aup4fKj5tOc9v4wHTMUah9lWENCMZlE+qOCoON+6
   ZkC13mPESGzl67/8ptzp9hP8mWmFd5H7VEJrc7vBcmVaQSg56aFMliRLc
   g==;
X-CSE-ConnectionGUID: v7Y7nzOuSpWoQivrXa8hgQ==
X-CSE-MsgGUID: BpkiNNn4QxmThEXIoRSDRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="97931586"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="97931586"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 14:41:40 -0700
X-CSE-ConnectionGUID: 595a8/7DS5SsE+v4ND4wow==
X-CSE-MsgGUID: CJladGX2ST6KXu0KV2NwZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="269185485"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 18 Aug 2026 14:41:40 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wwRYv-00000000eb4-04Uk;
	Tue, 18 Aug 2026 21:41:37 +0000
Date: Wed, 19 Aug 2026 05:41:21 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:for-linus] BUILD SUCCESS
 2f8e3cad53b5c36ab0ed5d3195bfc55c59ea61a5
Message-ID: <202608190502.1RslVY8R-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git for-linus
branch HEAD: 2f8e3cad53b5c36ab0ed5d3195bfc55c59ea61a5  m68k: nfcon: Do not call console_is_registered() in nfcon_device()

elapsed time: 1471m

configs tested: 111
configs skipped: 154

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allnoconfig    gcc-16.1.0
alpha                           allyesconfig    gcc-16.1.0
alpha                              defconfig    gcc-16.1.0
arc                             allmodconfig    gcc-16.1.0
arc                             allyesconfig    gcc-16.1.0
arc                           randconfig-001    gcc-10.5.0
arc                  randconfig-001-20260818    gcc-10.5.0
arc                  randconfig-002-20260818    gcc-10.5.0
arm                        at91_dt_defconfig    clang-17
arm                  randconfig-001-20260818    gcc-10.5.0
arm                  randconfig-002-20260818    gcc-10.5.0
arm                  randconfig-003-20260818    gcc-10.5.0
arm                  randconfig-004-20260818    gcc-10.5.0
arm64                         randconfig-001    gcc-14.3.0
arm64                randconfig-001-20260818    gcc-12.5.0
arm64                randconfig-001-20260818    gcc-14.3.0
arm64                randconfig-002-20260818    gcc-12.5.0
arm64                randconfig-002-20260818    gcc-14.3.0
arm64                randconfig-003-20260818    gcc-12.5.0
arm64                randconfig-003-20260818    gcc-14.3.0
arm64                randconfig-004-20260818    gcc-12.5.0
arm64                randconfig-004-20260818    gcc-14.3.0
csky                            allmodconfig    gcc-16.1.0
csky                 randconfig-001-20260818    gcc-12.5.0
csky                 randconfig-001-20260818    gcc-14.3.0
csky                 randconfig-002-20260818    gcc-12.5.0
csky                 randconfig-002-20260818    gcc-14.3.0
hexagon              randconfig-001-20260818    gcc-10.5.0
hexagon              randconfig-002-20260818    gcc-10.5.0
i386                            allmodconfig    gcc-14
i386       buildonly-randconfig-001-20260818    clang-22
i386       buildonly-randconfig-002-20260818    clang-22
i386       buildonly-randconfig-003-20260818    clang-22
i386       buildonly-randconfig-004-20260818    clang-22
i386       buildonly-randconfig-005-20260818    clang-22
i386       buildonly-randconfig-006-20260818    clang-22
i386                 randconfig-001-20260818    clang-22
i386                 randconfig-002-20260818    clang-22
i386                 randconfig-003-20260818    clang-22
i386                 randconfig-004-20260818    clang-22
i386                 randconfig-005-20260818    clang-22
i386                 randconfig-006-20260818    clang-22
i386                 randconfig-007-20260818    clang-22
i386                 randconfig-011-20260818    gcc-12
i386                 randconfig-012-20260818    gcc-12
i386                 randconfig-013-20260818    gcc-12
i386                 randconfig-014-20260818    gcc-12
i386                 randconfig-015-20260818    gcc-12
i386                 randconfig-016-20260818    gcc-12
i386                 randconfig-017-20260818    gcc-12
loongarch                          defconfig    clang-24
loongarch            randconfig-001-20260818    gcc-10.5.0
loongarch            randconfig-002-20260818    gcc-10.5.0
nios2                           allmodconfig    gcc-11.5.0
nios2                            allnoconfig    gcc-11.5.0
nios2                randconfig-001-20260818    gcc-10.5.0
nios2                randconfig-002-20260818    gcc-10.5.0
parisc                          allmodconfig    gcc-16.1.0
parisc                          allyesconfig    gcc-16.1.0
parisc                             defconfig    gcc-16.1.0
parisc               randconfig-001-20260818    clang-24
parisc               randconfig-002-20260818    clang-24
powerpc                  microwatt_defconfig    gcc-16.1.0
powerpc              randconfig-001-20260818    clang-24
powerpc              randconfig-002-20260818    clang-24
powerpc64            randconfig-001-20260818    clang-24
powerpc64            randconfig-002-20260818    clang-24
riscv                         randconfig-001    clang-18
riscv                randconfig-001-20260818    clang-18
riscv                randconfig-002-20260818    clang-18
s390                 randconfig-001-20260818    clang-18
s390                 randconfig-002-20260818    clang-18
sh                                 defconfig    gcc-16.1.0
sh                   randconfig-001-20260818    clang-18
sh                   randconfig-002-20260818    clang-18
sparc                randconfig-001-20260818    gcc-11.5.0
sparc                randconfig-002-20260818    gcc-11.5.0
sparc64              randconfig-001-20260818    gcc-11.5.0
sparc64              randconfig-002-20260818    gcc-11.5.0
um                   randconfig-001-20260818    gcc-11.5.0
um                   randconfig-002-20260818    gcc-11.5.0
x86_64     buildonly-randconfig-001-20260818    clang-22
x86_64     buildonly-randconfig-002-20260818    clang-22
x86_64     buildonly-randconfig-003-20260818    clang-22
x86_64     buildonly-randconfig-004-20260818    clang-22
x86_64     buildonly-randconfig-005-20260818    clang-22
x86_64     buildonly-randconfig-006-20260818    clang-22
x86_64                                 kexec    clang-22
x86_64               randconfig-001-20260818    clang-22
x86_64               randconfig-002-20260818    clang-22
x86_64               randconfig-003-20260818    clang-22
x86_64               randconfig-004-20260818    clang-22
x86_64               randconfig-005-20260818    clang-22
x86_64               randconfig-006-20260818    clang-22
x86_64                        randconfig-011    clang-22
x86_64               randconfig-011-20260818    clang-22
x86_64               randconfig-012-20260818    clang-22
x86_64               randconfig-013-20260818    clang-22
x86_64               randconfig-014-20260818    clang-22
x86_64               randconfig-015-20260818    clang-22
x86_64               randconfig-016-20260818    clang-22
x86_64                        randconfig-071    gcc-13
x86_64               randconfig-071-20260818    gcc-13
x86_64               randconfig-072-20260818    gcc-13
x86_64               randconfig-073-20260818    gcc-13
x86_64               randconfig-074-20260818    gcc-13
x86_64               randconfig-075-20260818    gcc-13
x86_64               randconfig-076-20260818    gcc-13
x86_64                          rhel-9.4-bpf    gcc-14
xtensa               randconfig-001-20260818    gcc-11.5.0
xtensa               randconfig-002-20260818    gcc-11.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
