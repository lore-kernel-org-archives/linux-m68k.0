Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7887147ECC2
	for <linux-m68k@lists.linux-m68k.org>; Mon, 28 Sep 2026 21:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790631667; cv=none; b=pqm+yufYzlA8QKIfjTsbgCN5LvZVO0VZmZmygbhglPjGeo1td8lwVmO58hkIt2zjA2J0r1mbCbKyO3bUDL4A/Gx0hrFuRoe2HbNHp87JIY4zm6FHPaP7Q+p5rj0Ao7ULGtEEIhcZRLVa3I2YZ2bZMo6m5o2llmthvUc45deANiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790631667; c=relaxed/simple;
	bh=WQKMv2SbcleZRZ/BaGbhcUNF+KMyZv+v2qeXBjn71sI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CwDHeq1W8nV0onhV92McExMYne6TbBR7cuunZ0Uxg6rQ2VgifgfD6IERh6HEV5WKKz9ygnkzsgCFuigJLG1kXG+uTX275TkdtSsxygdXhOy7Wc0bI7YYjmCa8O4C43DPlRqzniIxWap7LDqaKV3NfxdS1YrkNOMe/HnirJ9UuXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gZkCHSO9; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gZkCHSO9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790631665; x=1822167665;
  h=date:from:to:cc:subject:message-id;
  bh=WQKMv2SbcleZRZ/BaGbhcUNF+KMyZv+v2qeXBjn71sI=;
  b=gZkCHSO9Dd+VWyURJu5hFzlFwfdBj4SDg2KEZHP1w95zG6i1bmKGU44h
   gL4AiaqZpGOU6PZZq1Zr/Vv2yvNfyKJEJjw+l/wyrNi4mRIe64Bidn6a+
   zIqP0IdPJKkm/kJnPbefM5IBTId3fS0xPwPh7z3cdukI94vYn31uu84Am
   9xj0iRswgxRKq8rXwq33h+J0bqTObTbi1H5QGeoXe70Qp/x1bgDGDaMOc
   JvlK+xCyLW5QO4GzvDpc6NFSld0y3jMQvQaCE6iSatwR+hWFgZkU/IIe8
   s7XFAhAliN8lmY2LKEwYl3bppQTGQo3gGhgVbHMIwxFDHp+jxJbRGjOY6
   g==;
X-CSE-ConnectionGUID: GU+nzCHWS1m2VXQCdjnceg==
X-CSE-MsgGUID: vDF+KobVRS2Ie9/v1f4W8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="91363737"
X-IronPort-AV: E=Sophos;i="6.27,129,1787036400"; 
   d="scan'208";a="91363737"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2026 14:41:01 -0700
X-CSE-ConnectionGUID: 4shZin8VSO2NsoOJo5CGMA==
X-CSE-MsgGUID: G3r7Kbi9QnKnm7nnn9nchA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,129,1787036400"; 
   d="scan'208";a="275302539"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 28 Sep 2026 14:40:52 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xBJ5d-00000000OX9-49oB;
	Mon, 28 Sep 2026 21:40:49 +0000
Date: Tue, 29 Sep 2026 05:40:02 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:for-next] BUILD SUCCESS
 af32c3cb72529b14bfb2685bbdaa2b1514496b58
Message-ID: <202609290559.cl4R9yRn-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git for-next
branch HEAD: af32c3cb72529b14bfb2685bbdaa2b1514496b58  m68k: defconfig: Enable ATARI_SVETHLANA and ETHOC

elapsed time: 1317m

configs tested: 376
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.1.0
alpha                             allyesconfig    gcc-16.1.0
alpha                                defconfig    gcc-16.1.0
alpha                randconfig-r2103-20260927    clang-24   cocci
alpha                randconfig-r2201-20260928    gcc-16.1.0 smatch
alpha                randconfig-r2305-20260928    clang-18   sparse
alpha                randconfig-r2308-20260928    gcc-12.5.0 sparse
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.1.0
arc                               allyesconfig    clang-24
arc                                  defconfig    gcc-16.1.0
arc                          haps_hs_defconfig    gcc-16.1.0
arc                   randconfig-1000-20260928    clang-24
arc                   randconfig-1000-20260929    clang-17
arc                   randconfig-1001-20260928    clang-24
arc                   randconfig-1001-20260929    clang-17
arc                  randconfig-r2104-20260928    gcc-16.1.0 cocci
arc                  randconfig-r2106-20260928    gcc-16.1.0 cocci
arc                  randconfig-r2303-20260928    clang-24   sparse
arc                     vdk_hs38_smp_defconfig    gcc-16.1.0
arm                                allnoconfig    gcc-16.1.0
arm                               allyesconfig    clang-24
arm                          assabet_defconfig    gcc-16.1.0
arm                                  defconfig    gcc-16.1.0
arm                            h3600_defconfig    gcc-16.1.0
arm                          lpc32xx_defconfig    gcc-16.1.0
arm                             mmp2_defconfig    gcc-16.1.0
arm                         multi_v5_defconfig    gcc-16.1.0
arm                          mv78xx0_defconfig    gcc-16.1.0
arm                         mvebu_v5_defconfig    clang-24
arm                         neponset_defconfig    gcc-16.1.0
arm                   randconfig-1000-20260928    clang-24
arm                   randconfig-1000-20260929    clang-17
arm                   randconfig-1001-20260928    clang-24
arm                   randconfig-1001-20260929    clang-17
arm                   randconfig-1002-20260928    clang-24
arm                   randconfig-1002-20260929    clang-17
arm                   randconfig-1003-20260928    clang-24
arm                   randconfig-1003-20260929    clang-17
arm                  randconfig-r2100-20260927    clang-22   cocci
arm                  randconfig-r2104-20260927    clang-22   cocci
arm                  randconfig-r2107-20260927    clang-17   cocci
arm                  randconfig-r2200-20260927    clang-24   smatch
arm                  randconfig-r2202-20260928    gcc-8.5.0  smatch
arm                  randconfig-r2304-20260928    clang-24   sparse
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.1.0
arm64                                defconfig    gcc-16.1.0
arm64                 randconfig-1000-20260928    gcc-15.2.0
arm64                 randconfig-1000-20260929    clang-24
arm64                 randconfig-1001-20260928    gcc-15.2.0
arm64                 randconfig-1001-20260929    clang-24
arm64                 randconfig-1002-20260928    gcc-15.2.0
arm64                 randconfig-1002-20260929    clang-24
arm64                 randconfig-1003-20260928    gcc-15.2.0
arm64                 randconfig-1003-20260929    clang-24
arm64                randconfig-r2105-20260927    clang-24   cocci
arm64                randconfig-r2201-20260927    gcc-12.5.0 smatch
arm64                randconfig-r2304-20260928    clang-18   sparse
csky                              allmodconfig    gcc-16.1.0
csky                               allnoconfig    gcc-16.1.0
csky                                 defconfig    gcc-16.1.0
csky                  randconfig-1000-20260928    gcc-15.2.0
csky                  randconfig-1000-20260929    clang-24
csky                  randconfig-1001-20260928    gcc-15.2.0
csky                  randconfig-1001-20260929    clang-24
csky                 randconfig-r2102-20260927    gcc-16.1.0 cocci
csky                 randconfig-r2200-20260928    gcc-16.1.0 smatch
csky                 randconfig-r2307-20260928    gcc-12.5.0 sparse
hexagon                           allmodconfig    gcc-16.1.0
hexagon                            allnoconfig    gcc-16.1.0
hexagon                              defconfig    gcc-16.1.0
hexagon               randconfig-1000-20260928    gcc-8.5.0
hexagon               randconfig-1001-20260928    gcc-8.5.0
hexagon              randconfig-r2103-20260927    clang-24   cocci
hexagon              randconfig-r2300-20260928    clang-18   sparse
hexagon              randconfig-r2301-20260928    gcc-16.1.0 sparse
hexagon              randconfig-r2303-20260928    clang-18   sparse
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.1.0
i386                              allyesconfig    clang-22
i386        buildonly-randconfig-1000-20260928    clang-22
i386        buildonly-randconfig-1001-20260928    clang-22
i386        buildonly-randconfig-1002-20260928    clang-22
i386        buildonly-randconfig-1003-20260928    clang-22
i386        buildonly-randconfig-1004-20260928    clang-22
i386        buildonly-randconfig-1005-20260928    clang-22
i386                                 defconfig    gcc-16.1.0
i386                  randconfig-1000-20260928    gcc-14
i386                  randconfig-1001-20260928    gcc-14
i386                  randconfig-1002-20260928    gcc-14
i386                  randconfig-1003-20260928    gcc-14
i386                  randconfig-1004-20260928    gcc-14
i386                  randconfig-1005-20260928    gcc-14
i386                  randconfig-1006-20260928    gcc-14
i386                  randconfig-1007-20260928    clang-22
i386                  randconfig-1008-20260928    clang-22
i386                  randconfig-1009-20260928    clang-22
i386                  randconfig-1010-20260928    clang-22
i386                  randconfig-1011-20260928    clang-22
i386                  randconfig-1012-20260928    clang-22
i386                  randconfig-1013-20260928    clang-22
i386                  randconfig-2100-20260927    clang-22   cocci
i386                  randconfig-2100-20260928    gcc-14     cocci
i386                  randconfig-2101-20260927    clang-22   cocci
i386                  randconfig-2101-20260928    gcc-14     cocci
i386                  randconfig-2102-20260927    clang-22   cocci
i386                  randconfig-2102-20260928    gcc-14     cocci
i386                  randconfig-2103-20260927    clang-22   cocci
i386                  randconfig-2103-20260928    gcc-14     cocci
i386                  randconfig-2200-20260927    clang-22   smatch
i386                  randconfig-2200-20260928    clang-22   smatch
i386                  randconfig-2300-20260927    clang-22   sparse
i386                  randconfig-2300-20260928    clang-22   sparse
i386                  randconfig-2301-20260927    clang-22   sparse
i386                  randconfig-2301-20260928    clang-22   sparse
i386                  randconfig-2302-20260927    clang-22   sparse
i386                  randconfig-2302-20260928    clang-22   sparse
i386                 randconfig-r2102-20260928    gcc-11.5.0 cocci
i386                 randconfig-r2103-20260928    gcc-11.5.0 cocci
i386                 randconfig-r2107-20260928    gcc-16.1.0 cocci
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.1.0
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20260928    gcc-8.5.0
loongarch             randconfig-1001-20260928    gcc-8.5.0
loongarch            randconfig-r2104-20260928    gcc-16.1.0 cocci
loongarch            randconfig-r2202-20260927    gcc-12.5.0 smatch
m68k                              allmodconfig    gcc-16.1.0
m68k                               allnoconfig    gcc-16.1.0
m68k                              allyesconfig    clang-24
m68k                                 defconfig    clang-24
m68k                        m5249evb_defconfig    gcc-16.1.0
microblaze                         allnoconfig    gcc-16.1.0
microblaze                        allyesconfig    gcc-16.1.0
microblaze                           defconfig    clang-24
microblaze           randconfig-r2100-20260927    clang-24   cocci
microblaze           randconfig-r2106-20260928    gcc-16.1.0 cocci
mips                              allmodconfig    gcc-16.1.0
mips                               allnoconfig    gcc-16.1.0
mips                              allyesconfig    gcc-16.1.0
mips                       bmips_stb_defconfig    gcc-16.1.0
mips                       fuloong2e_defconfig    gcc-16.1.0
mips                       loongson3_defconfig    gcc-16.1.0
mips                     maltaup_xpa_defconfig    gcc-16.1.0
mips                         omega2p_defconfig    gcc-16.1.0
mips                 randconfig-r2104-20260928    gcc-16.1.0 cocci
mips                         vocore2_defconfig    gcc-16.1.0
nios2                          3c120_defconfig    gcc-16.1.0
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20260928    gcc-8.5.0
nios2                 randconfig-1001-20260928    gcc-8.5.0
nios2                randconfig-r2101-20260927    gcc-11.5.0 cocci
nios2                randconfig-r2101-20260928    gcc-11.5.0 cocci
nios2                randconfig-r2201-20260927    gcc-11.5.0 smatch
nios2                randconfig-r2202-20260928    gcc-11.5.0 smatch
nios2                randconfig-r2307-20260928    clang-17   sparse
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.1.0
openrisc             randconfig-r2100-20260928    clang-24   cocci
openrisc             randconfig-r2101-20260927    gcc-16.1.0 cocci
openrisc             randconfig-r2101-20260928    clang-24   cocci
openrisc             randconfig-r2107-20260927    gcc-9.5.0  cocci
openrisc             randconfig-r2301-20260928    clang-18   sparse
openrisc             randconfig-r2302-20260928    clang-24   sparse
openrisc             randconfig-r2305-20260928    clang-24   sparse
parisc                            alldefconfig    gcc-16.1.0
parisc                            allmodconfig    gcc-16.1.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.1.0
parisc                randconfig-1000-20260928    clang-24
parisc                randconfig-1000-20260929    gcc-8.5.0
parisc                randconfig-1001-20260928    clang-24
parisc                randconfig-1001-20260929    gcc-8.5.0
parisc               randconfig-r2100-20260927    gcc-8.5.0  cocci
parisc               randconfig-r2200-20260928    gcc-8.5.0  smatch
parisc               randconfig-r2300-20260928    clang-24   sparse
parisc64                             defconfig    clang-24
powerpc                           allmodconfig    gcc-16.1.0
powerpc                            allnoconfig    clang-24
powerpc                       bamboo_defconfig    clang-24
powerpc                         cell_defconfig    gcc-16.1.0
powerpc                    currituck_defconfig    gcc-16.1.0
powerpc                  linkstation_defconfig    clang-24
powerpc                  mpc834x_itx_defconfig    clang-24
powerpc                       ppc6xx_defconfig    gcc-16.1.0
powerpc                      rainier_defconfig    clang-24
powerpc               randconfig-1000-20260928    clang-24
powerpc               randconfig-1000-20260929    gcc-8.5.0
powerpc               randconfig-1001-20260928    clang-24
powerpc               randconfig-1001-20260929    gcc-8.5.0
powerpc              randconfig-r2305-20260928    gcc-16.1.0 sparse
powerpc                      redwood_defconfig    gcc-16.1.0
powerpc                          wii_defconfig    gcc-16.1.0
powerpc64             randconfig-1000-20260928    clang-24
powerpc64             randconfig-1000-20260929    gcc-8.5.0
powerpc64             randconfig-1001-20260928    clang-24
powerpc64             randconfig-1001-20260929    gcc-8.5.0
powerpc64            randconfig-r2200-20260927    clang-24   smatch
powerpc64            randconfig-r2201-20260927    clang-24   smatch
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.1.0
riscv                 randconfig-1000-20260928    clang-24
riscv                 randconfig-1000-20260929    clang-24
riscv                 randconfig-1001-20260928    clang-24
riscv                 randconfig-1001-20260929    clang-24
riscv                 randconfig-2000-20260927    clang-24
riscv                 randconfig-2000-20260928    gcc-8.5.0
riscv                 randconfig-2001-20260927    clang-24
riscv                 randconfig-2001-20260927    gcc-11.5.0
riscv                 randconfig-2001-20260928    gcc-8.5.0
riscv                randconfig-r2102-20260927    clang-24   cocci
riscv                randconfig-r2104-20260927    gcc-15.2.0 cocci
riscv                randconfig-r2105-20260928    gcc-16.1.0 cocci
riscv                randconfig-r2106-20260927    gcc-15.2.0 cocci
riscv                randconfig-r2306-20260928    gcc-12.5.0 sparse
s390                              alldefconfig    gcc-16.1.0
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.1.0
s390                                 defconfig    gcc-16.1.0
s390                  randconfig-1000-20260928    clang-24
s390                  randconfig-1000-20260929    clang-24
s390                  randconfig-1001-20260928    clang-24
s390                  randconfig-1001-20260929    clang-24
s390                  randconfig-2000-20260927    clang-24
s390                  randconfig-2000-20260928    gcc-8.5.0
s390                  randconfig-2001-20260927    clang-24
s390                  randconfig-2001-20260927    gcc-15.2.0
s390                  randconfig-2001-20260928    gcc-8.5.0
s390                 randconfig-r2101-20260927    clang-24   cocci
s390                 randconfig-r2102-20260928    clang-24   cocci
s390                 randconfig-r2306-20260928    clang-17   sparse
s390                        zfcpdump_defconfig    clang-24
sh                                allmodconfig    gcc-16.1.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                   defconfig    gcc-14
sh                         dreamcast_defconfig    clang-24
sh                         edosk7705_defconfig    gcc-16.1.0
sh                             hp6xx_defconfig    gcc-16.1.0
sh                           lboxre2_defconfig    gcc-16.1.0
sh                    randconfig-1000-20260928    clang-24
sh                    randconfig-1000-20260929    clang-24
sh                    randconfig-1001-20260928    clang-24
sh                    randconfig-1001-20260929    clang-24
sh                    randconfig-2000-20260927    clang-24
sh                    randconfig-2000-20260927    gcc-12.5.0
sh                    randconfig-2000-20260928    gcc-8.5.0
sh                    randconfig-2001-20260927    clang-24
sh                    randconfig-2001-20260927    gcc-14.3.0
sh                    randconfig-2001-20260928    gcc-8.5.0
sh                   randconfig-r2105-20260927    gcc-10.5.0 cocci
sh                   randconfig-r2107-20260928    gcc-16.1.0 cocci
sh                   randconfig-r2302-20260928    clang-18   sparse
sh                   randconfig-r2303-20260928    gcc-16.1.0 sparse
sh                    rts7751r2dplus_defconfig    gcc-16.1.0
sh                            se7206_defconfig    gcc-16.1.0
sh                            se7712_defconfig    gcc-16.1.0
sh                    sh7770_generic_defconfig    clang-24
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.1.0
sparc                 randconfig-1000-20260928    clang-17
sparc                 randconfig-1001-20260928    clang-17
sparc                 randconfig-2000-20260927    gcc-16.1.0
sparc                 randconfig-2000-20260928    gcc-13.4.0
sparc                 randconfig-2001-20260927    gcc-16.1.0
sparc                 randconfig-2001-20260928    gcc-13.4.0
sparc                randconfig-r2102-20260927    gcc-16.1.0 cocci
sparc                randconfig-r2106-20260927    gcc-8.5.0  cocci
sparc                randconfig-r2300-20260928    gcc-16.1.0 sparse
sparc                randconfig-r2304-20260928    gcc-16.1.0 sparse
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20260928    clang-17
sparc64               randconfig-1001-20260928    clang-17
sparc64               randconfig-2000-20260927    clang-24
sparc64               randconfig-2000-20260928    gcc-13.4.0
sparc64               randconfig-2001-20260927    clang-20
sparc64               randconfig-2001-20260928    gcc-13.4.0
sparc64              randconfig-r2100-20260928    gcc-11.5.0 cocci
sparc64              randconfig-r2105-20260928    gcc-16.1.0 cocci
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.1.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20260928    clang-17
um                    randconfig-1001-20260928    clang-17
um                    randconfig-2000-20260927    gcc-14
um                    randconfig-2000-20260928    gcc-13.4.0
um                    randconfig-2001-20260927    clang-22
um                    randconfig-2001-20260928    gcc-13.4.0
um                   randconfig-r2103-20260927    gcc-14     cocci
um                   randconfig-r2103-20260928    clang-24   cocci
um                   randconfig-r2301-20260928    clang-24   sparse
um                   randconfig-r2308-20260928    clang-17   sparse
um                            x86_64_defconfig    gcc-14
x86_64                            alldefconfig    gcc-16.1.0
x86_64                            allmodconfig    clang-22
x86_64                             allnoconfig    clang-24
x86_64                            allyesconfig    clang-22
x86_64      buildonly-randconfig-1000-20260928    gcc-14
x86_64      buildonly-randconfig-1001-20260928    gcc-14
x86_64      buildonly-randconfig-1002-20260928    gcc-14
x86_64      buildonly-randconfig-1003-20260928    gcc-14
x86_64      buildonly-randconfig-1004-20260928    gcc-14
x86_64      buildonly-randconfig-1005-20260928    gcc-14
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20260928    gcc-14
x86_64                randconfig-1001-20260928    gcc-14
x86_64                randconfig-1002-20260928    gcc-14
x86_64                randconfig-1003-20260928    gcc-14
x86_64                randconfig-1004-20260928    gcc-14
x86_64                randconfig-1005-20260928    gcc-14
x86_64                randconfig-1006-20260928    gcc-14
x86_64                randconfig-1007-20260928    gcc-14
x86_64                randconfig-1008-20260928    gcc-14
x86_64                randconfig-1009-20260928    gcc-14
x86_64                randconfig-1010-20260928    gcc-14
x86_64                randconfig-1011-20260928    gcc-14
x86_64                randconfig-1012-20260928    clang-22
x86_64                randconfig-1013-20260928    clang-22
x86_64                randconfig-1014-20260928    clang-22
x86_64                randconfig-1015-20260928    clang-22
x86_64                randconfig-1016-20260928    clang-22
x86_64                randconfig-1017-20260928    clang-22
x86_64                randconfig-2100-20260927    clang-22   cocci
x86_64                randconfig-2100-20260928    gcc-12     cocci
x86_64                randconfig-2101-20260927    clang-22   cocci
x86_64                randconfig-2101-20260928    gcc-12     cocci
x86_64                randconfig-2102-20260927    gcc-14     cocci
x86_64                randconfig-2102-20260928    gcc-12     cocci
x86_64                randconfig-2103-20260927    clang-22   cocci
x86_64                randconfig-2103-20260928    gcc-12     cocci
x86_64                randconfig-2200-20260927    gcc-14     smatch
x86_64                randconfig-2200-20260928    gcc-14     smatch
x86_64                randconfig-2300-20260927    gcc-14     sparse
x86_64                randconfig-2300-20260928    clang-22   sparse
x86_64                randconfig-2301-20260927    gcc-14     sparse
x86_64                randconfig-2301-20260928    clang-22   sparse
x86_64                randconfig-2302-20260927    gcc-13     sparse
x86_64                randconfig-2302-20260928    clang-22   sparse
x86_64               randconfig-r2200-20260928    gcc-14     smatch
x86_64               randconfig-r2302-20260928    gcc-16.1.0 sparse
x86_64                                rhel-9.4    clang-22
x86_64                            rhel-9.4-bpf    clang-22
x86_64                            rhel-9.4-bpf    gcc-14
x86_64                           rhel-9.4-func    clang-22
x86_64                     rhel-9.4-kselftests    clang-22
x86_64                          rhel-9.4-kunit    clang-22
x86_64                          rhel-9.4-kunit    gcc-14
x86_64                            rhel-9.4-ltp    clang-22
x86_64                            rhel-9.4-ltp    gcc-14
x86_64                           rhel-9.4-rust    clang-22
x86_64                           rhel-9.4-rust    clang-22
xtensa                             allnoconfig    clang-24
xtensa                            allyesconfig    clang-20
xtensa                randconfig-1000-20260928    clang-17
xtensa                randconfig-1001-20260928    clang-17
xtensa                randconfig-2000-20260927    gcc-8.5.0
xtensa                randconfig-2000-20260928    gcc-13.4.0
xtensa                randconfig-2001-20260927    gcc-16.1.0
xtensa                randconfig-2001-20260928    gcc-13.4.0
xtensa               randconfig-r2106-20260928    gcc-16.1.0 cocci
xtensa               randconfig-r2201-20260928    gcc-15.2.0 smatch
xtensa               randconfig-r2202-20260927    gcc-14.3.0 smatch
xtensa               randconfig-r2309-20260928    clang-17   sparse
xtensa               randconfig-r2309-20260928    gcc-12.5.0 sparse

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
