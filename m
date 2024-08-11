Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E911C1366
	for <linux-m68k@lists.linux-m68k.org>; Sun, 11 Aug 2024 08:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723363246; cv=none; b=YxJuWtyF9wUGw5wChfLJ4UgcHWC+iXT7BGh87z46oFl3DIiRUvFMvaOvUyTarKQOod4u/Ncty6ZNnXtd5giPzGZnZBUyeFxCd3cICFVhjhYxq6V4bxydyW/gxaNdX29yb+7Nb9p1mx3SFfKdDkRXAbh3hJU3h5hHe/HCvqMQPN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723363246; c=relaxed/simple;
	bh=lMzP/1dU7UGawWesovownqY/4uvATVZqCPfurHW/BIc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=j9CofvzU3XIbbLKdE0ZlmWWE8K//JqlFJuIFkR3e2sJfb33uPzkl2Kl/QysPPlD1nwaB82bTCinTBMPYWsgGU7RkOBa8dRHSsrkUapsOgXshJztdMrtx4OL7byUJYdiXQDzHOS8hCDCPAYJqCGZnVO5ECrg6K6QsHhQbyIuTkYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dJ65fp+7; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dJ65fp+7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723363244; x=1754899244;
  h=date:from:to:cc:subject:message-id;
  bh=lMzP/1dU7UGawWesovownqY/4uvATVZqCPfurHW/BIc=;
  b=dJ65fp+75D9lmkm6mwWJtMaFLNh83NuBA+3eo5yA7nUQj3ScChgJmBZ3
   4WVOmKdfLi44mctrHO6PTHXCpz+J5+USHMyZWrg+4vAtiArlMmTbLYRB3
   U02zBQCPwHMLw7q9dgLmbGo40SLTU3szETslq+XF3zTLoTMkyKRqZshtl
   CsM31uSXnvcNSI7XTh6pPSznmEbUJPA7ieDimncdWE49fAnqVJGS897tE
   xuJbWkqTnrCNAqzvv0KvG693xS+j3SJ5JamFXeGjkRQg+3hJzil/SACx6
   FsuqIaH/DmzSZB5Li/apjOzCSl29NiO8KnQHx6mM5A9twYW9xTLUB5B65
   w==;
X-CSE-ConnectionGUID: AhfIRyFDRmu2xUyupdQwpw==
X-CSE-MsgGUID: fY86TL+jSyyCIrEvto+2IA==
X-IronPort-AV: E=McAfee;i="6700,10204,11160"; a="38997878"
X-IronPort-AV: E=Sophos;i="6.09,280,1716274800"; 
   d="scan'208";a="38997878"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2024 01:00:42 -0700
X-CSE-ConnectionGUID: dM+KE6ntQ+iDTsDAGNaLuQ==
X-CSE-MsgGUID: y7utG95bRjq/RSbz7v2w3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,280,1716274800"; 
   d="scan'208";a="58038656"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 11 Aug 2024 01:00:41 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sd3VH-000AgF-0x;
	Sun, 11 Aug 2024 08:00:39 +0000
Date: Sun, 11 Aug 2024 16:00:17 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:master] BUILD SUCCESS
 9156bb59c9b5d35b3363c1cf7615fa45e5e55130
Message-ID: <202408111615.aX59a60M-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git master
branch HEAD: 9156bb59c9b5d35b3363c1cf7615fa45e5e55130  Merge tag 'v6.11-rc2'

elapsed time: 1041m

configs tested: 244
configs skipped: 8

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.2.0
alpha                             allnoconfig   gcc-13.3.0
alpha                            allyesconfig   gcc-13.3.0
alpha                               defconfig   gcc-13.2.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                                 defconfig   gcc-13.2.0
arc                         haps_hs_defconfig   gcc-13.2.0
arc                   randconfig-001-20240811   gcc-13.2.0
arc                   randconfig-002-20240811   gcc-13.2.0
arc                           tb10x_defconfig   gcc-13.2.0
arm                              allmodconfig   gcc-13.2.0
arm                              allmodconfig   gcc-14.1.0
arm                               allnoconfig   clang-20
arm                               allnoconfig   gcc-13.2.0
arm                              allyesconfig   gcc-13.2.0
arm                              allyesconfig   gcc-14.1.0
arm                         axm55xx_defconfig   gcc-13.2.0
arm                                 defconfig   gcc-13.2.0
arm                            hisi_defconfig   gcc-13.2.0
arm                      integrator_defconfig   gcc-13.2.0
arm                        mvebu_v7_defconfig   gcc-13.2.0
arm                       omap2plus_defconfig   gcc-13.2.0
arm                   randconfig-001-20240811   clang-14
arm                   randconfig-001-20240811   gcc-13.2.0
arm                   randconfig-002-20240811   clang-20
arm                   randconfig-002-20240811   gcc-13.2.0
arm                   randconfig-003-20240811   gcc-13.2.0
arm                   randconfig-003-20240811   gcc-14.1.0
arm                   randconfig-004-20240811   gcc-13.2.0
arm                   randconfig-004-20240811   gcc-14.1.0
arm                        shmobile_defconfig   gcc-13.2.0
arm64                            allmodconfig   clang-20
arm64                            allmodconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-14.1.0
arm64                               defconfig   gcc-13.2.0
arm64                 randconfig-001-20240811   clang-20
arm64                 randconfig-001-20240811   gcc-13.2.0
arm64                 randconfig-002-20240811   gcc-13.2.0
arm64                 randconfig-002-20240811   gcc-14.1.0
arm64                 randconfig-003-20240811   gcc-13.2.0
arm64                 randconfig-003-20240811   gcc-14.1.0
arm64                 randconfig-004-20240811   gcc-13.2.0
arm64                 randconfig-004-20240811   gcc-14.1.0
csky                              allnoconfig   gcc-13.2.0
csky                              allnoconfig   gcc-14.1.0
csky                                defconfig   gcc-13.2.0
csky                  randconfig-001-20240811   gcc-13.2.0
csky                  randconfig-001-20240811   gcc-14.1.0
csky                  randconfig-002-20240811   gcc-13.2.0
csky                  randconfig-002-20240811   gcc-14.1.0
hexagon                          allmodconfig   clang-20
hexagon                           allnoconfig   clang-20
hexagon                          allyesconfig   clang-20
hexagon               randconfig-001-20240811   clang-20
hexagon               randconfig-002-20240811   clang-20
i386                             allmodconfig   clang-18
i386                              allnoconfig   clang-18
i386                             allyesconfig   clang-18
i386         buildonly-randconfig-001-20240811   gcc-12
i386         buildonly-randconfig-002-20240811   gcc-12
i386         buildonly-randconfig-003-20240811   gcc-12
i386         buildonly-randconfig-004-20240811   clang-18
i386         buildonly-randconfig-004-20240811   gcc-12
i386         buildonly-randconfig-005-20240811   gcc-12
i386         buildonly-randconfig-006-20240811   gcc-12
i386                                defconfig   clang-18
i386                  randconfig-001-20240811   clang-18
i386                  randconfig-001-20240811   gcc-12
i386                  randconfig-002-20240811   clang-18
i386                  randconfig-002-20240811   gcc-12
i386                  randconfig-003-20240811   clang-18
i386                  randconfig-003-20240811   gcc-12
i386                  randconfig-004-20240811   clang-18
i386                  randconfig-004-20240811   gcc-12
i386                  randconfig-005-20240811   gcc-12
i386                  randconfig-006-20240811   gcc-12
i386                  randconfig-011-20240811   gcc-11
i386                  randconfig-011-20240811   gcc-12
i386                  randconfig-012-20240811   gcc-12
i386                  randconfig-013-20240811   clang-18
i386                  randconfig-013-20240811   gcc-12
i386                  randconfig-014-20240811   gcc-12
i386                  randconfig-015-20240811   clang-18
i386                  randconfig-015-20240811   gcc-12
i386                  randconfig-016-20240811   clang-18
i386                  randconfig-016-20240811   gcc-12
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-13.2.0
loongarch                         allnoconfig   gcc-14.1.0
loongarch                           defconfig   gcc-13.2.0
loongarch             randconfig-001-20240811   gcc-13.2.0
loongarch             randconfig-001-20240811   gcc-14.1.0
loongarch             randconfig-002-20240811   gcc-13.2.0
loongarch             randconfig-002-20240811   gcc-14.1.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-13.2.0
m68k                              allnoconfig   gcc-14.1.0
m68k                             allyesconfig   gcc-14.1.0
m68k                                defconfig   gcc-13.2.0
m68k                        mvme147_defconfig   gcc-13.2.0
m68k                           sun3_defconfig   gcc-13.2.0
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-13.2.0
microblaze                        allnoconfig   gcc-14.1.0
microblaze                       allyesconfig   gcc-14.1.0
microblaze                          defconfig   gcc-13.2.0
mips                              allnoconfig   gcc-13.2.0
mips                              allnoconfig   gcc-14.1.0
mips                         bigsur_defconfig   gcc-13.2.0
mips                      bmips_stb_defconfig   gcc-13.2.0
mips                          eyeq6_defconfig   gcc-13.2.0
mips                           ip28_defconfig   gcc-13.2.0
mips                     loongson1b_defconfig   gcc-13.2.0
mips                        maltaup_defconfig   gcc-13.2.0
mips                        vocore2_defconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-14.1.0
nios2                               defconfig   gcc-13.2.0
nios2                 randconfig-001-20240811   gcc-13.2.0
nios2                 randconfig-001-20240811   gcc-14.1.0
nios2                 randconfig-002-20240811   gcc-13.2.0
nios2                 randconfig-002-20240811   gcc-14.1.0
openrisc                          allnoconfig   gcc-14.1.0
openrisc                         allyesconfig   gcc-14.1.0
openrisc                            defconfig   gcc-14.1.0
parisc                           allmodconfig   gcc-14.1.0
parisc                            allnoconfig   gcc-14.1.0
parisc                           allyesconfig   gcc-14.1.0
parisc                              defconfig   gcc-14.1.0
parisc                randconfig-001-20240811   gcc-13.2.0
parisc                randconfig-001-20240811   gcc-14.1.0
parisc                randconfig-002-20240811   gcc-13.2.0
parisc                randconfig-002-20240811   gcc-14.1.0
parisc64                            defconfig   gcc-13.2.0
powerpc                          allmodconfig   gcc-14.1.0
powerpc                           allnoconfig   gcc-14.1.0
powerpc                          allyesconfig   clang-20
powerpc                          allyesconfig   gcc-14.1.0
powerpc                   bluestone_defconfig   gcc-13.2.0
powerpc                     ep8248e_defconfig   gcc-13.2.0
powerpc                 mpc834x_itx_defconfig   gcc-13.2.0
powerpc                      pmac32_defconfig   gcc-13.2.0
powerpc                     rainier_defconfig   gcc-13.2.0
powerpc               randconfig-001-20240811   clang-20
powerpc               randconfig-001-20240811   gcc-13.2.0
powerpc               randconfig-003-20240811   clang-20
powerpc               randconfig-003-20240811   gcc-13.2.0
powerpc                     redwood_defconfig   gcc-13.2.0
powerpc                     tqm8541_defconfig   gcc-13.2.0
powerpc64                        alldefconfig   gcc-13.2.0
powerpc64             randconfig-001-20240811   clang-14
powerpc64             randconfig-001-20240811   gcc-13.2.0
powerpc64             randconfig-002-20240811   gcc-13.2.0
powerpc64             randconfig-002-20240811   gcc-14.1.0
powerpc64             randconfig-003-20240811   clang-20
powerpc64             randconfig-003-20240811   gcc-13.2.0
riscv                            allmodconfig   clang-20
riscv                            allmodconfig   gcc-14.1.0
riscv                             allnoconfig   gcc-14.1.0
riscv                            allyesconfig   clang-20
riscv                            allyesconfig   gcc-14.1.0
riscv                               defconfig   gcc-14.1.0
riscv                 randconfig-001-20240811   gcc-13.2.0
riscv                 randconfig-001-20240811   gcc-14.1.0
riscv                 randconfig-002-20240811   clang-20
riscv                 randconfig-002-20240811   gcc-13.2.0
s390                             allmodconfig   clang-20
s390                              allnoconfig   clang-20
s390                             allyesconfig   clang-20
s390                             allyesconfig   gcc-14.1.0
s390                                defconfig   gcc-14.1.0
s390                  randconfig-001-20240811   clang-20
s390                  randconfig-001-20240811   gcc-13.2.0
s390                  randconfig-002-20240811   clang-20
s390                  randconfig-002-20240811   gcc-13.2.0
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-13.2.0
sh                                allnoconfig   gcc-14.1.0
sh                               allyesconfig   gcc-14.1.0
sh                                  defconfig   gcc-14.1.0
sh                          kfr2r09_defconfig   gcc-13.2.0
sh                    randconfig-001-20240811   gcc-13.2.0
sh                    randconfig-001-20240811   gcc-14.1.0
sh                    randconfig-002-20240811   gcc-13.2.0
sh                    randconfig-002-20240811   gcc-14.1.0
sh                          rsk7269_defconfig   gcc-13.2.0
sh                             shx3_defconfig   gcc-13.2.0
sparc                            allmodconfig   gcc-14.1.0
sparc                       sparc32_defconfig   gcc-13.2.0
sparc64                          alldefconfig   gcc-13.2.0
sparc64                             defconfig   gcc-14.1.0
sparc64               randconfig-001-20240811   gcc-13.2.0
sparc64               randconfig-001-20240811   gcc-14.1.0
sparc64               randconfig-002-20240811   gcc-13.2.0
sparc64               randconfig-002-20240811   gcc-14.1.0
um                               allmodconfig   clang-20
um                               allmodconfig   gcc-13.3.0
um                                allnoconfig   clang-17
um                               allyesconfig   gcc-12
um                               allyesconfig   gcc-13.3.0
um                                  defconfig   gcc-14.1.0
um                             i386_defconfig   gcc-14.1.0
um                    randconfig-001-20240811   gcc-12
um                    randconfig-001-20240811   gcc-13.2.0
um                    randconfig-002-20240811   clang-20
um                    randconfig-002-20240811   gcc-13.2.0
um                           x86_64_defconfig   gcc-14.1.0
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240811   gcc-12
x86_64       buildonly-randconfig-002-20240811   gcc-12
x86_64       buildonly-randconfig-003-20240811   gcc-12
x86_64       buildonly-randconfig-004-20240811   gcc-12
x86_64       buildonly-randconfig-005-20240811   gcc-12
x86_64       buildonly-randconfig-006-20240811   gcc-12
x86_64                              defconfig   clang-18
x86_64                randconfig-001-20240811   gcc-12
x86_64                randconfig-002-20240811   gcc-12
x86_64                randconfig-003-20240811   gcc-12
x86_64                randconfig-004-20240811   gcc-12
x86_64                randconfig-005-20240811   gcc-12
x86_64                randconfig-006-20240811   gcc-12
x86_64                randconfig-011-20240811   gcc-12
x86_64                randconfig-012-20240811   gcc-12
x86_64                randconfig-013-20240811   gcc-12
x86_64                randconfig-014-20240811   gcc-12
x86_64                randconfig-015-20240811   gcc-12
x86_64                randconfig-016-20240811   gcc-12
x86_64                randconfig-071-20240811   gcc-12
x86_64                randconfig-072-20240811   gcc-12
x86_64                randconfig-073-20240811   gcc-12
x86_64                randconfig-074-20240811   gcc-12
x86_64                randconfig-075-20240811   gcc-12
x86_64                randconfig-076-20240811   gcc-12
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-13.2.0
xtensa                            allnoconfig   gcc-14.1.0
xtensa                randconfig-001-20240811   gcc-13.2.0
xtensa                randconfig-001-20240811   gcc-14.1.0
xtensa                randconfig-002-20240811   gcc-13.2.0
xtensa                randconfig-002-20240811   gcc-14.1.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
