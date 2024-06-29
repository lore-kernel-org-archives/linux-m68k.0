Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EC00A945
	for <linux-m68k@lists.linux-m68k.org>; Sat, 29 Jun 2024 16:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719676915; cv=none; b=NgAgcq0TrRqf1YhDdGS9x+I18oRekco+dDBNKW66VBbOA3n0zqHy7YIv0ei8K+Noxrn3lo9oHQ8a3cbnT7Y/K8WdgYNjyqpPI9TUhlPhgJ9ieIj9ws2QGRY3S4NtBr169HR48lk7Bog9ubzIb2lcIq09Ti4EaemDC9b6IHpaGHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719676915; c=relaxed/simple;
	bh=tmYsNpANCYSKrBdTgxP8trOYDsk5suY57SVDJ/BJmgw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WWvAsj5V59UuKCj4MnAhqVhwGHp9eZozrPdk+QBetUL/E9sR6l4GZl0Kr5bgtiWcpOxpYFaXHTgl8Ijd0M14OpSp7e/NKz+EwRL9Zbt56Uu7mZ87tEgktYwj8spgYqi5t2rXMEptxONE77E208JfA/Lq3l/oOH2hZ4Swonj6Vus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F4ZBE2eG; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F4ZBE2eG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719676913; x=1751212913;
  h=date:from:to:cc:subject:message-id;
  bh=tmYsNpANCYSKrBdTgxP8trOYDsk5suY57SVDJ/BJmgw=;
  b=F4ZBE2eGb30s/fLyuyGO6uF5FyIN+qYNGZt2EhkM3ANRvO61xDfd1GHB
   r4NvTyVQ0kDnSUSfqGgPaCjY5r40K5qUYWLvSzKV1Xc6GIpaEHolt8Ukg
   TnruYeKwQv6GC/KQJ8NiXE+DGcl+wrdtBybvbIvmFnwH+yPipQMMhWa6q
   zj3NObIIZborHzBeBtSR1x6TYRbBsZvBgFuD6DDQZ2w9kRXOktbzq0ZHQ
   rjUcFqacUfUUSU+00pDyERrYZ+KVCSfDi1jWDfhgFjbsmxwRkV9LliV1g
   SIq5l+/p2YNLKzAqprAn5puETMnAtIwxL1A3fa7eiPa7XfmwFocjiTJqD
   w==;
X-CSE-ConnectionGUID: hhZKtHNTRdaLY9PhwBmM/g==
X-CSE-MsgGUID: 5JxuI2X0TISafmNMlhZ8iA==
X-IronPort-AV: E=McAfee;i="6700,10204,11117"; a="17067795"
X-IronPort-AV: E=Sophos;i="6.09,172,1716274800"; 
   d="scan'208";a="17067795"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2024 09:01:52 -0700
X-CSE-ConnectionGUID: 9G/wbo1PR/W9YIWgc9nIiQ==
X-CSE-MsgGUID: 0FsYo/6YTgO7Q6cHBcjO2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,172,1716274800"; 
   d="scan'208";a="49510965"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 29 Jun 2024 09:01:51 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sNaWL-000JaY-0T;
	Sat, 29 Jun 2024 16:01:49 +0000
Date: Sun, 30 Jun 2024 00:01:42 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:master] BUILD SUCCESS
 bdf4cd121bfdde0794b391c3aa9382ec8bd2f426
Message-ID: <202406300040.5JGnGxxT-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git master
branch HEAD: bdf4cd121bfdde0794b391c3aa9382ec8bd2f426  zorro: Use str_plural() in amiga_zorro_probe()

elapsed time: 7505m

configs tested: 91
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.2.0
alpha                               defconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                                 defconfig   gcc-13.2.0
arc                 nsimosci_hs_smp_defconfig   gcc-13.2.0
arc                   randconfig-001-20240624   gcc-13.2.0
arc                   randconfig-002-20240624   gcc-13.2.0
arm                          collie_defconfig   gcc-13.2.0
arm                         lpc18xx_defconfig   clang-19
arm                   randconfig-002-20240624   gcc-13.2.0
arm                   randconfig-003-20240624   gcc-13.2.0
arm                   randconfig-004-20240624   gcc-13.2.0
arm                           sama5_defconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-13.2.0
arm64                               defconfig   gcc-13.2.0
arm64                 randconfig-002-20240624   gcc-13.2.0
arm64                 randconfig-003-20240624   gcc-13.2.0
arm64                 randconfig-004-20240624   gcc-13.2.0
csky                              allnoconfig   gcc-13.2.0
csky                                defconfig   gcc-13.2.0
csky                  randconfig-001-20240624   gcc-13.2.0
csky                  randconfig-002-20240624   gcc-13.2.0
i386         buildonly-randconfig-001-20240624   gcc-8
i386         buildonly-randconfig-002-20240624   gcc-13
i386         buildonly-randconfig-004-20240624   gcc-10
i386                  randconfig-003-20240624   gcc-13
i386                  randconfig-004-20240624   gcc-13
i386                  randconfig-005-20240624   gcc-13
i386                  randconfig-013-20240624   gcc-9
i386                  randconfig-016-20240624   gcc-9
loongarch                         allnoconfig   gcc-13.2.0
loongarch                           defconfig   gcc-13.2.0
loongarch             randconfig-001-20240624   gcc-13.2.0
loongarch             randconfig-002-20240624   gcc-13.2.0
m68k                              allnoconfig   gcc-13.2.0
m68k                                defconfig   gcc-13.2.0
m68k                        m5407c3_defconfig   gcc-13.2.0
m68k                           sun3_defconfig   gcc-13.2.0
microblaze                       alldefconfig   gcc-13.2.0
microblaze                        allnoconfig   gcc-13.2.0
microblaze                          defconfig   gcc-13.2.0
mips                              allnoconfig   gcc-13.2.0
mips                           mtx1_defconfig   clang-16
nios2                             allnoconfig   gcc-13.2.0
nios2                               defconfig   gcc-13.2.0
nios2                 randconfig-001-20240624   gcc-13.2.0
nios2                 randconfig-002-20240624   gcc-13.2.0
openrisc                          allnoconfig   gcc-13.2.0
openrisc                            defconfig   gcc-13.2.0
openrisc                  or1klitex_defconfig   gcc-13.2.0
openrisc                 simple_smp_defconfig   gcc-13.2.0
parisc                            allnoconfig   gcc-13.2.0
parisc                              defconfig   gcc-13.2.0
parisc                randconfig-001-20240624   gcc-13.2.0
parisc                randconfig-002-20240624   gcc-13.2.0
parisc64                            defconfig   gcc-13.2.0
powerpc                           allnoconfig   gcc-13.2.0
powerpc                   microwatt_defconfig   gcc-13.2.0
powerpc                   motionpro_defconfig   clang-17
powerpc                     rainier_defconfig   gcc-13.2.0
powerpc               randconfig-002-20240624   gcc-13.2.0
riscv                             allnoconfig   gcc-13.2.0
riscv                 randconfig-002-20240624   gcc-13.2.0
s390                  randconfig-002-20240624   gcc-13.2.0
sh                                allnoconfig   gcc-13.2.0
sh                                  defconfig   gcc-13.2.0
sh                    randconfig-001-20240624   gcc-13.2.0
sh                    randconfig-002-20240624   gcc-13.2.0
sh                   rts7751r2dplus_defconfig   gcc-13.2.0
sh                           se7343_defconfig   gcc-13.2.0
sh                             shx3_defconfig   gcc-13.2.0
sparc64                             defconfig   gcc-13.2.0
sparc64               randconfig-001-20240624   gcc-13.2.0
sparc64               randconfig-002-20240624   gcc-13.2.0
um                             i386_defconfig   gcc-13
x86_64       buildonly-randconfig-001-20240624   gcc-13
x86_64       buildonly-randconfig-002-20240624   gcc-13
x86_64                randconfig-005-20240624   gcc-11
x86_64                randconfig-006-20240624   gcc-13
x86_64                randconfig-012-20240624   gcc-8
x86_64                randconfig-014-20240624   gcc-8
x86_64                randconfig-015-20240624   gcc-13
x86_64                randconfig-071-20240624   gcc-10
x86_64                randconfig-072-20240624   gcc-10
x86_64                randconfig-073-20240624   gcc-13
x86_64                randconfig-074-20240624   gcc-13
x86_64                randconfig-075-20240624   gcc-13
x86_64                randconfig-076-20240624   gcc-8
xtensa                            allnoconfig   gcc-13.2.0
xtensa                randconfig-001-20240624   gcc-13.2.0
xtensa                randconfig-002-20240624   gcc-13.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
