Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC1DF147C71
	for <linux-m68k@lists.linux-m68k.org>; Mon, 18 Nov 2024 23:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731972341; cv=none; b=jGku8TcF63ZAQCw5jOVBpM9j2XJdzIQgqvnhlAw5YEsAuFB7kqyDHdOXVylmnwYDDjIN4y5EdGdx7Zfp9pga7gHDUrJdGNT0SyUZKtHVLwCMoaHG+rjCgU9gwX3gvoTdCyP1eyeXIxSv6vdrC1oYVIb37DoUN/BjNUWVqQIZKpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731972341; c=relaxed/simple;
	bh=9sg594MGHWzg7LqfQTRPdxNnk062uB7vbS7bIs5zFlo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DDVAXhnaGalLCEdgcI2QRrQr8agfp+7ePBS+ALei+tI3BPffo34DqGpdl156q0hMOFbIwN2NxdOMT4VHwqYJtDVZMlDW0dTTA6wCXEyjUwDmkPjWcyVQ5kMCef7ySaR9Sq7r639i/vxongamTUj1pJfQovyVQ5yEJyMpfVZagmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OIvGeb32; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OIvGeb32"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731972340; x=1763508340;
  h=date:from:to:cc:subject:message-id;
  bh=9sg594MGHWzg7LqfQTRPdxNnk062uB7vbS7bIs5zFlo=;
  b=OIvGeb32EUAlxvwfsgzCy4DU/FmrM9aGCMPWYnJjPGMrjxm5iHxGSZH9
   EK3tG56nsDCJnAJpRdnxodRKwbL/WIrK6wwmo5hXHaH0/dxq6olUTadCE
   gPvpEQQ5sHfxQU4qZO585TFxTdEOQvI3qZNhWHpRpGtn/cmeotP2+FNsc
   9dVKvpXH2ijxXy1TtIOcYv2JfCrIo80NkGtFiHo9EkYHiDSe3BcvVdq+S
   iM3QpEgFoJL4aY1x66zB2a7ClHsjH40C0DPKuYziore0l4Uko3LSk+yAg
   RW/5gNDaTIUezJZkuK/u4SsRVdLNjuJXyccqt3HxGGVzWMAj+lGd/koRh
   A==;
X-CSE-ConnectionGUID: 39xglztZQROszmIQWkzBXQ==
X-CSE-MsgGUID: 05TIOdODQGak6u7zc/ao1Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="42589069"
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; 
   d="scan'208";a="42589069"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2024 15:25:38 -0800
X-CSE-ConnectionGUID: eYEYA6hhQeOd7/6p22YLAg==
X-CSE-MsgGUID: a+UVAwDmTxmyLa2pfv4Ncw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; 
   d="scan'208";a="89295976"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 18 Nov 2024 15:25:37 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tDB7e-0002gz-16;
	Mon, 18 Nov 2024 23:25:34 +0000
Date: Tue, 19 Nov 2024 07:24:33 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:master] BUILD SUCCESS
 190aac013000ed04cda6b1dbf06f0ace14dbd055
Message-ID: <202411190727.9FQPS6t0-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git master
branch HEAD: 190aac013000ed04cda6b1dbf06f0ace14dbd055  Merge tag 'v6.12'

elapsed time: 724m

configs tested: 221
configs skipped: 12

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-20
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    clang-20
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    clang-20
arc                                 defconfig    gcc-14.2.0
arc                        vdk_hs38_defconfig    clang-20
arc                    vdk_hs38_smp_defconfig    clang-20
arm                              allmodconfig    clang-20
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    clang-20
arm                                 defconfig    gcc-14.2.0
arm                          ep93xx_defconfig    clang-20
arm                            hisi_defconfig    clang-20
arm                        keystone_defconfig    clang-20
arm                   milbeaut_m10v_defconfig    clang-20
arm                            mmp2_defconfig    gcc-14.2.0
arm                         nhk8815_defconfig    clang-20
arm                       omap2plus_defconfig    gcc-14.2.0
arm                          pxa910_defconfig    clang-20
arm                             pxa_defconfig    clang-20
arm                             rpc_defconfig    clang-20
arm                       spear13xx_defconfig    clang-20
arm                        spear6xx_defconfig    clang-20
arm                           u8500_defconfig    clang-20
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.2.0
arm64                               defconfig    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-20
hexagon                             defconfig    gcc-14.2.0
i386                             alldefconfig    clang-20
i386                             allmodconfig    clang-19
i386                              allnoconfig    clang-19
i386                             allyesconfig    clang-19
i386        buildonly-randconfig-001-20241118    gcc-12
i386        buildonly-randconfig-001-20241119    clang-19
i386        buildonly-randconfig-002-20241118    gcc-12
i386        buildonly-randconfig-002-20241119    clang-19
i386        buildonly-randconfig-003-20241118    gcc-12
i386        buildonly-randconfig-003-20241119    clang-19
i386        buildonly-randconfig-004-20241118    gcc-12
i386        buildonly-randconfig-004-20241119    clang-19
i386        buildonly-randconfig-005-20241118    gcc-12
i386        buildonly-randconfig-005-20241119    clang-19
i386        buildonly-randconfig-006-20241118    gcc-12
i386        buildonly-randconfig-006-20241119    clang-19
i386                                defconfig    clang-19
i386                  randconfig-001-20241118    gcc-12
i386                  randconfig-001-20241119    clang-19
i386                  randconfig-002-20241118    gcc-12
i386                  randconfig-002-20241119    clang-19
i386                  randconfig-003-20241118    gcc-12
i386                  randconfig-003-20241119    clang-19
i386                  randconfig-004-20241118    gcc-12
i386                  randconfig-004-20241119    clang-19
i386                  randconfig-005-20241118    gcc-12
i386                  randconfig-005-20241119    clang-19
i386                  randconfig-006-20241118    gcc-12
i386                  randconfig-006-20241119    clang-19
i386                  randconfig-011-20241118    gcc-12
i386                  randconfig-011-20241119    clang-19
i386                  randconfig-012-20241118    gcc-12
i386                  randconfig-012-20241119    clang-19
i386                  randconfig-013-20241118    gcc-12
i386                  randconfig-013-20241119    clang-19
i386                  randconfig-014-20241118    gcc-12
i386                  randconfig-014-20241119    clang-19
i386                  randconfig-015-20241118    gcc-12
i386                  randconfig-015-20241119    clang-19
i386                  randconfig-016-20241118    gcc-12
i386                  randconfig-016-20241119    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch                           defconfig    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                                defconfig    gcc-14.2.0
m68k                       m5208evb_defconfig    clang-20
m68k                       m5249evb_defconfig    clang-20
m68k                        m5307c3_defconfig    clang-20
m68k                            mac_defconfig    clang-20
m68k                          multi_defconfig    gcc-14.2.0
m68k                        mvme147_defconfig    clang-20
m68k                            q40_defconfig    clang-20
m68k                            q40_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                          defconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                      bmips_stb_defconfig    clang-20
mips                          eyeq5_defconfig    clang-20
mips                       rbtx49xx_defconfig    clang-20
mips                           xway_defconfig    clang-20
nios2                         3c120_defconfig    clang-20
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
openrisc                          allnoconfig    clang-20
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-20
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-12
parisc64                            defconfig    gcc-14.2.0
powerpc                    adder875_defconfig    clang-20
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-20
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    gcc-14.2.0
powerpc                   bluestone_defconfig    gcc-14.2.0
powerpc                       eiger_defconfig    clang-20
powerpc                     ep8248e_defconfig    clang-20
powerpc                          g5_defconfig    clang-20
powerpc                       holly_defconfig    clang-20
powerpc                  mpc885_ads_defconfig    clang-20
powerpc                      ppc44x_defconfig    gcc-14.2.0
powerpc                     rainier_defconfig    gcc-14.2.0
powerpc                     redwood_defconfig    clang-20
powerpc                      tqm8xx_defconfig    clang-20
riscv                            allmodconfig    gcc-14.2.0
riscv                             allnoconfig    clang-20
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    gcc-14.2.0
riscv                               defconfig    gcc-12
riscv             nommu_k210_sdcard_defconfig    clang-20
s390                             allmodconfig    clang-20
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    gcc-12
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-12
sh                        dreamcast_defconfig    gcc-14.2.0
sh                             espt_defconfig    clang-20
sh                             espt_defconfig    gcc-14.2.0
sh                 kfr2r09-romimage_defconfig    clang-20
sh                          kfr2r09_defconfig    gcc-14.2.0
sh                           se7712_defconfig    clang-20
sh                           se7722_defconfig    clang-20
sh                        sh7763rdp_defconfig    clang-20
sh                             shx3_defconfig    gcc-14.2.0
sh                          urquell_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                       sparc32_defconfig    clang-20
sparc64                             defconfig    gcc-12
um                               allmodconfig    clang-20
um                                allnoconfig    clang-17
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                             i386_defconfig    gcc-14.2.0
um                           x86_64_defconfig    gcc-12
um                           x86_64_defconfig    gcc-14.2.0
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20241118    gcc-12
x86_64      buildonly-randconfig-001-20241119    gcc-12
x86_64      buildonly-randconfig-002-20241118    gcc-12
x86_64      buildonly-randconfig-002-20241119    gcc-12
x86_64      buildonly-randconfig-003-20241118    gcc-12
x86_64      buildonly-randconfig-003-20241119    gcc-12
x86_64      buildonly-randconfig-004-20241118    gcc-12
x86_64      buildonly-randconfig-004-20241119    gcc-12
x86_64      buildonly-randconfig-005-20241118    gcc-12
x86_64      buildonly-randconfig-005-20241119    gcc-12
x86_64      buildonly-randconfig-006-20241118    gcc-12
x86_64      buildonly-randconfig-006-20241119    gcc-12
x86_64                              defconfig    clang-19
x86_64                                  kexec    clang-19
x86_64                randconfig-001-20241118    gcc-12
x86_64                randconfig-001-20241119    gcc-12
x86_64                randconfig-002-20241118    gcc-12
x86_64                randconfig-002-20241119    gcc-12
x86_64                randconfig-003-20241118    gcc-12
x86_64                randconfig-003-20241119    gcc-12
x86_64                randconfig-004-20241118    gcc-12
x86_64                randconfig-004-20241119    gcc-12
x86_64                randconfig-005-20241118    gcc-12
x86_64                randconfig-005-20241119    gcc-12
x86_64                randconfig-006-20241118    gcc-12
x86_64                randconfig-006-20241119    gcc-12
x86_64                randconfig-011-20241118    gcc-12
x86_64                randconfig-011-20241119    gcc-12
x86_64                randconfig-012-20241118    gcc-12
x86_64                randconfig-012-20241119    gcc-12
x86_64                randconfig-013-20241118    gcc-12
x86_64                randconfig-013-20241119    gcc-12
x86_64                randconfig-014-20241118    gcc-12
x86_64                randconfig-014-20241119    gcc-12
x86_64                randconfig-015-20241118    gcc-12
x86_64                randconfig-015-20241119    gcc-12
x86_64                randconfig-016-20241118    gcc-12
x86_64                randconfig-016-20241119    gcc-12
x86_64                randconfig-071-20241118    gcc-12
x86_64                randconfig-071-20241119    gcc-12
x86_64                randconfig-072-20241118    gcc-12
x86_64                randconfig-072-20241119    gcc-12
x86_64                randconfig-073-20241118    gcc-12
x86_64                randconfig-073-20241119    gcc-12
x86_64                randconfig-074-20241118    gcc-12
x86_64                randconfig-074-20241119    gcc-12
x86_64                randconfig-075-20241118    gcc-12
x86_64                randconfig-075-20241119    gcc-12
x86_64                randconfig-076-20241118    gcc-12
x86_64                randconfig-076-20241119    gcc-12
x86_64                               rhel-9.4    clang-19
x86_64                               rhel-9.4    gcc-12
xtensa                           alldefconfig    gcc-14.2.0
xtensa                            allnoconfig    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
