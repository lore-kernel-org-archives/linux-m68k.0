Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 118F637DEB7
	for <linux-m68k@lists.linux-m68k.org>; Wed, 12 Aug 2026 11:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786533618; cv=none; b=sCp413VF4X3xdxQb67BrMC222jQv+tQPlOeaQVHDPOW7wtyUk4+MbKZsKjUtnWwzwbwk80m5IastKP3o8/awfwFO4weQHlNqi4CjqK3r3xFUdhFHYnul/MzekyR1SAugmv5yWkiRNTXkhW+Tx/SGfNw/SZv2ztMnGEBmFt3ce8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786533618; c=relaxed/simple;
	bh=1cHKmx5I53hfWTMydzaypJcFE6NCqiJkveAIkzao7c8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qwVigHu9OsOmwOy9AnfD56kjUvxWQjzEwWRk1fmm9YtvK0kchztN7UCq0qV7AMXR4Y9o7yWYj5mn00NoAdW6yFwAxm8SDIIqVVWs+uypfL0uF1l5bpdzAmrABgj096hd17AReozBnYQzL0V8dvaCk0Qy+TS350l8QdSj9CEBZ0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Kxhz0UV+; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kxhz0UV+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786533616; x=1818069616;
  h=date:from:to:cc:subject:message-id;
  bh=1cHKmx5I53hfWTMydzaypJcFE6NCqiJkveAIkzao7c8=;
  b=Kxhz0UV+J48rFI5Lvx8WZWuYlZQP+QH107VvH7498A7uHgeXGi/8MIr7
   LE76y4savcNvVX8VoPadX0ti7RWDhIhiTmXU0yDN3X4SjHLDyeqvXyg1x
   kcFZpWITqV3AcVET0AHu7K1sZHkFVO76z/R4755NLdu+Js2ixIJzinTPo
   nfmHfWCNJFuWBlRbacMHEMxsiEPWuynR5tqPq2ojdmUMXBLOYfCIgOjoo
   WhNziUI/JpEfZsCyyh5sa5CwXd5Advv6PJpPxJkRy/LgMpeeYL4KnuE2S
   HYhlJWSeDavFqEA3rTpjaRETHLu5QQnoDhOJaVGmtVJvZgDFKUDtoakjW
   w==;
X-CSE-ConnectionGUID: Agb76IyuT0CHZ8AOOq03eg==
X-CSE-MsgGUID: vlM7hn4nQwuLS4lFwxIPow==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="86940521"
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; 
   d="scan'208";a="86940521"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 04:20:15 -0700
X-CSE-ConnectionGUID: wxsfQriKSHKSAQBMupUqaw==
X-CSE-MsgGUID: Czep3t2kQ72IsQRUr436nQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; 
   d="scan'208";a="259369600"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 12 Aug 2026 04:20:13 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wu70F-00000000QUY-0Fqr;
	Wed, 12 Aug 2026 11:20:11 +0000
Date: Wed, 12 Aug 2026 19:20:08 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:for-next] BUILD SUCCESS
 09f71dbeb287e367beea56d9ac8a3d356ef5e02a
Message-ID: <202608121956.1BdieZZr-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git for-next
branch HEAD: 09f71dbeb287e367beea56d9ac8a3d356ef5e02a  m68k: Fix backtraces for non-running tasks

elapsed time: 1512m

configs tested: 203
configs skipped: 128

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allnoconfig    gcc-16.1.0
alpha                           allyesconfig    gcc-16.1.0
alpha                              defconfig    gcc-16.1.0
arc                             allmodconfig    gcc-16.1.0
arc                             allyesconfig    gcc-16.1.0
arc                           randconfig-001    gcc-12.5.0
arc                  randconfig-001-20260811    gcc-11.5.0
arc                  randconfig-001-20260812    gcc-12.5.0
arc                  randconfig-002-20260811    gcc-11.5.0
arc                  randconfig-002-20260812    gcc-12.5.0
arm                    am200epdkit_defconfig    gcc-16.1.0
arm                  randconfig-001-20260811    gcc-11.5.0
arm                  randconfig-001-20260812    gcc-12.5.0
arm                  randconfig-002-20260811    gcc-11.5.0
arm                  randconfig-002-20260812    gcc-12.5.0
arm                  randconfig-003-20260811    gcc-11.5.0
arm                  randconfig-003-20260812    gcc-12.5.0
arm                  randconfig-004-20260811    gcc-11.5.0
arm                  randconfig-004-20260812    gcc-12.5.0
arm                        vf610m4_defconfig    gcc-16.1.0
arm64                         randconfig-001    gcc-14.3.0
arm64                randconfig-001-20260811    gcc-13.4.0
arm64                randconfig-001-20260812    gcc-10.5.0
arm64                randconfig-001-20260812    gcc-14.3.0
arm64                randconfig-002-20260811    gcc-13.4.0
arm64                randconfig-002-20260812    gcc-10.5.0
arm64                randconfig-002-20260812    gcc-14.3.0
arm64                randconfig-003-20260811    gcc-13.4.0
arm64                randconfig-003-20260812    gcc-10.5.0
arm64                randconfig-003-20260812    gcc-14.3.0
arm64                randconfig-004-20260811    gcc-13.4.0
arm64                randconfig-004-20260812    gcc-10.5.0
arm64                randconfig-004-20260812    gcc-14.3.0
csky                            allmodconfig    gcc-16.1.0
csky                 randconfig-001-20260811    gcc-13.4.0
csky                 randconfig-001-20260812    gcc-10.5.0
csky                 randconfig-001-20260812    gcc-14.3.0
csky                 randconfig-002-20260811    gcc-13.4.0
csky                 randconfig-002-20260812    gcc-10.5.0
csky                 randconfig-002-20260812    gcc-14.3.0
hexagon                       randconfig-001    gcc-8.5.0
hexagon              randconfig-001-20260811    gcc-8.5.0
hexagon              randconfig-001-20260812    gcc-11.5.0
hexagon              randconfig-002-20260811    gcc-8.5.0
hexagon              randconfig-002-20260812    gcc-11.5.0
i386                            allmodconfig    gcc-14
i386       buildonly-randconfig-001-20260811    gcc-14
i386       buildonly-randconfig-001-20260812    clang-22
i386       buildonly-randconfig-002-20260811    gcc-14
i386       buildonly-randconfig-002-20260812    clang-22
i386       buildonly-randconfig-003-20260811    gcc-14
i386       buildonly-randconfig-003-20260812    clang-22
i386       buildonly-randconfig-004-20260811    gcc-14
i386       buildonly-randconfig-004-20260812    clang-22
i386       buildonly-randconfig-005-20260811    gcc-14
i386       buildonly-randconfig-005-20260812    clang-22
i386       buildonly-randconfig-006-20260811    gcc-14
i386       buildonly-randconfig-006-20260812    clang-22
i386                          randconfig-001    clang-22
i386                          randconfig-001    gcc-14
i386                 randconfig-001-20260811    gcc-14
i386                 randconfig-001-20260812    clang-22
i386                 randconfig-002-20260811    gcc-14
i386                 randconfig-002-20260812    clang-22
i386                 randconfig-003-20260811    gcc-14
i386                 randconfig-003-20260812    clang-22
i386                 randconfig-004-20260811    gcc-14
i386                 randconfig-004-20260812    clang-22
i386                 randconfig-005-20260811    gcc-14
i386                 randconfig-005-20260812    clang-22
i386                 randconfig-006-20260811    gcc-14
i386                 randconfig-006-20260812    clang-22
i386                 randconfig-007-20260811    gcc-14
i386                 randconfig-007-20260812    clang-22
i386                          randconfig-011    gcc-14
i386                 randconfig-011-20260811    gcc-14
i386                 randconfig-011-20260812    gcc-12
i386                 randconfig-012-20260811    gcc-14
i386                 randconfig-012-20260812    gcc-12
i386                 randconfig-013-20260811    gcc-14
i386                 randconfig-013-20260812    gcc-12
i386                 randconfig-014-20260811    gcc-14
i386                 randconfig-014-20260812    gcc-12
i386                 randconfig-015-20260811    gcc-14
i386                 randconfig-015-20260812    gcc-12
i386                 randconfig-016-20260811    gcc-14
i386                 randconfig-016-20260812    gcc-12
i386                 randconfig-017-20260811    gcc-14
i386                 randconfig-017-20260812    gcc-12
loongarch                          defconfig    clang-24
loongarch            randconfig-001-20260811    gcc-8.5.0
loongarch            randconfig-001-20260812    gcc-11.5.0
loongarch            randconfig-002-20260811    gcc-8.5.0
loongarch            randconfig-002-20260812    gcc-11.5.0
mips                       bcm63xx_defconfig    clang-24
mips                    cu1000-neo_defconfig    gcc-16.1.0
mips                          ip22_defconfig    gcc-16.1.0
nios2                           allmodconfig    gcc-11.5.0
nios2                            allnoconfig    gcc-11.5.0
nios2                randconfig-001-20260811    gcc-8.5.0
nios2                randconfig-001-20260812    gcc-11.5.0
nios2                randconfig-002-20260811    gcc-8.5.0
nios2                randconfig-002-20260812    gcc-11.5.0
parisc                          allmodconfig    gcc-16.1.0
parisc                          allyesconfig    gcc-16.1.0
parisc                             defconfig    gcc-16.1.0
parisc                        randconfig-001    gcc-15.2.0
parisc               randconfig-001-20260811    gcc-15.2.0
parisc               randconfig-001-20260812    clang-17
parisc               randconfig-002-20260811    gcc-15.2.0
parisc               randconfig-002-20260812    clang-17
powerpc              randconfig-001-20260811    gcc-15.2.0
powerpc              randconfig-001-20260812    clang-17
powerpc              randconfig-002-20260811    gcc-15.2.0
powerpc              randconfig-002-20260812    clang-17
powerpc64            randconfig-001-20260811    gcc-15.2.0
powerpc64            randconfig-001-20260812    clang-17
powerpc64            randconfig-002-20260811    gcc-15.2.0
powerpc64            randconfig-002-20260812    clang-17
riscv                         randconfig-001    clang-24
riscv                randconfig-001-20260811    clang-24
riscv                randconfig-001-20260812    clang-24
riscv                randconfig-002-20260811    clang-24
riscv                randconfig-002-20260812    clang-24
s390                 randconfig-001-20260811    clang-24
s390                 randconfig-001-20260812    clang-24
s390                 randconfig-002-20260811    clang-24
s390                 randconfig-002-20260812    clang-24
sh                                 defconfig    gcc-16.1.0
sh                   randconfig-001-20260811    clang-24
sh                   randconfig-001-20260812    clang-24
sh                   randconfig-002-20260811    clang-24
sh                   randconfig-002-20260812    clang-24
sparc                         randconfig-001    gcc-8.5.0
sparc                randconfig-001-20260811    gcc-8.5.0
sparc                randconfig-001-20260812    gcc-13.4.0
sparc                randconfig-002-20260811    gcc-8.5.0
sparc                randconfig-002-20260812    gcc-13.4.0
sparc64              randconfig-001-20260811    gcc-8.5.0
sparc64              randconfig-001-20260812    gcc-13.4.0
sparc64              randconfig-002-20260811    gcc-8.5.0
sparc64              randconfig-002-20260812    gcc-13.4.0
um                   randconfig-001-20260811    gcc-8.5.0
um                   randconfig-001-20260812    gcc-13.4.0
um                   randconfig-002-20260811    gcc-8.5.0
um                   randconfig-002-20260812    gcc-13.4.0
x86_64              buildonly-randconfig-001    gcc-12
x86_64     buildonly-randconfig-001-20260811    gcc-12
x86_64     buildonly-randconfig-001-20260812    gcc-14
x86_64     buildonly-randconfig-002-20260811    gcc-12
x86_64     buildonly-randconfig-002-20260812    gcc-14
x86_64     buildonly-randconfig-003-20260811    gcc-12
x86_64     buildonly-randconfig-003-20260812    gcc-14
x86_64     buildonly-randconfig-004-20260811    gcc-12
x86_64     buildonly-randconfig-004-20260812    gcc-14
x86_64     buildonly-randconfig-005-20260811    gcc-12
x86_64     buildonly-randconfig-005-20260812    gcc-14
x86_64     buildonly-randconfig-006-20260811    gcc-12
x86_64     buildonly-randconfig-006-20260812    gcc-14
x86_64                                 kexec    clang-22
x86_64               randconfig-001-20260811    clang-22
x86_64               randconfig-001-20260812    clang-22
x86_64               randconfig-002-20260811    clang-22
x86_64               randconfig-002-20260812    clang-22
x86_64               randconfig-003-20260811    clang-22
x86_64               randconfig-003-20260812    clang-22
x86_64               randconfig-004-20260811    clang-22
x86_64               randconfig-004-20260812    clang-22
x86_64               randconfig-005-20260811    clang-22
x86_64               randconfig-005-20260812    clang-22
x86_64               randconfig-006-20260811    clang-22
x86_64               randconfig-006-20260812    clang-22
x86_64                        randconfig-011    clang-22
x86_64               randconfig-011-20260811    gcc-14
x86_64               randconfig-011-20260812    clang-22
x86_64               randconfig-012-20260811    gcc-14
x86_64               randconfig-012-20260812    clang-22
x86_64               randconfig-013-20260811    gcc-14
x86_64               randconfig-013-20260812    clang-22
x86_64               randconfig-014-20260811    gcc-14
x86_64               randconfig-014-20260812    clang-22
x86_64               randconfig-015-20260811    gcc-14
x86_64               randconfig-015-20260812    clang-22
x86_64               randconfig-016-20260811    gcc-14
x86_64               randconfig-016-20260812    clang-22
x86_64                        randconfig-071    clang-22
x86_64               randconfig-071-20260811    gcc-14
x86_64               randconfig-071-20260812    clang-22
x86_64               randconfig-072-20260811    gcc-14
x86_64               randconfig-072-20260812    clang-22
x86_64               randconfig-073-20260811    gcc-14
x86_64               randconfig-073-20260812    clang-22
x86_64               randconfig-074-20260811    gcc-14
x86_64               randconfig-074-20260812    clang-22
x86_64               randconfig-075-20260811    gcc-14
x86_64               randconfig-075-20260812    clang-22
x86_64               randconfig-076-20260811    gcc-14
x86_64               randconfig-076-20260812    clang-22
x86_64                          rhel-9.4-bpf    gcc-14
xtensa               randconfig-001-20260811    gcc-8.5.0
xtensa               randconfig-001-20260812    gcc-13.4.0
xtensa               randconfig-002-20260811    gcc-8.5.0
xtensa               randconfig-002-20260812    gcc-13.4.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
