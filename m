Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 754C121FF25
	for <linux-m68k@lists.linux-m68k.org>; Tue, 10 Jun 2025 07:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749538902; cv=none; b=SZZQ49WHkl1DnDg3rA+sG/2mgnnvT/iArZXBIZ8r4ul535KPvxxpDaRbAhz4nzOAJ+7i8hfcfCIs9Ir6HncVlDf18vSablvCpJJNvqhFyCDsVYrYQnPlV7iGC5VvU/OFmGdTFLhQyV8pUOqKTdX7s88kfGpEd4g1Dd3JACJ2XY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749538902; c=relaxed/simple;
	bh=e1fNf1lkESCDB9KBiqDSX/IX9v7WLEHxf4EDe8eiSnA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=khv1Qd40c6lyflGOPv8uADU8KnzNrjBG82GObwPMLVY5gokIxfH93/7v7nSPBBhoqqXt2Gsy9lGm19JpvGfcCYmGL0+l1ZsAy30RgnvaNtCaPWJ3Wfmu44uI04v/CFZdAh9L5gFJCbg47O/uFtAt2jQ/jJ2L3eY+gQNbWi8ClPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fi8Oxk7K; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fi8Oxk7K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749538900; x=1781074900;
  h=date:from:to:cc:subject:message-id;
  bh=e1fNf1lkESCDB9KBiqDSX/IX9v7WLEHxf4EDe8eiSnA=;
  b=Fi8Oxk7KB+OWL5L6D0ODKJyn9hzRUjDEgOwkvncnWUXayRxBY890IBY/
   qZezWo+rje9/4Q0JXGfJ2WDA8I8dsVwN3e7y+WlrQp0QShRhTeox/PXAD
   P6zACqXotjfDN/gW80WYXlRu8O/vZMnjmxukgFL5TcBOjLD1iBGDHhn/Q
   QVZLzrsX+DwgKQxqhweIkt6Y+41gj7dqZ4BSezMEIwG5khLgi07r8+PDT
   OlaHh28vRBePCoVrR+k+K7UXTo+Jr6Azk/2PqxB3Y/7ElYpBX+4RWI3Qw
   1kIwo5U4kFlppqim92oc5Xc1tORENDcWAE9/sbBj5J9f6Skl2T3+R+MZ2
   Q==;
X-CSE-ConnectionGUID: I3UruZzZTgiWg3J1qXYt5g==
X-CSE-MsgGUID: JZ7EqyABTeC35sq9TmSYaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="50859554"
X-IronPort-AV: E=Sophos;i="6.16,224,1744095600"; 
   d="scan'208";a="50859554"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 00:01:38 -0700
X-CSE-ConnectionGUID: piIXk0RSQnyOUpXNi9Ch0w==
X-CSE-MsgGUID: GgRV4YdvTnOo8lTK9Krn3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,224,1744095600"; 
   d="scan'208";a="146670421"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 10 Jun 2025 00:01:37 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uOszG-0007uH-22;
	Tue, 10 Jun 2025 07:01:34 +0000
Date: Tue, 10 Jun 2025 15:00:54 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:master] BUILD SUCCESS
 00108b669f880b96e46183c440fdda152d58b77d
Message-ID: <202506101544.k5ukg7si-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git master
branch HEAD: 00108b669f880b96e46183c440fdda152d58b77d  Merge tag 'v6.16-rc1'

elapsed time: 1108m

configs tested: 249
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                              allmodconfig    clang-19
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    clang-19
arc                              allyesconfig    gcc-15.1.0
arc                          axs103_defconfig    gcc-15.1.0
arc                                 defconfig    gcc-15.1.0
arc                   randconfig-001-20250609    gcc-12.4.0
arc                   randconfig-001-20250610    gcc-12.4.0
arc                   randconfig-002-20250609    gcc-10.5.0
arc                   randconfig-002-20250610    gcc-12.4.0
arc                    vdk_hs38_smp_defconfig    gcc-15.1.0
arm                              allmodconfig    clang-19
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-21
arm                               allnoconfig    gcc-15.1.0
arm                              allyesconfig    clang-19
arm                              allyesconfig    gcc-15.1.0
arm                         at91_dt_defconfig    clang-21
arm                          collie_defconfig    gcc-15.1.0
arm                     davinci_all_defconfig    gcc-15.1.0
arm                                 defconfig    gcc-15.1.0
arm                      integrator_defconfig    gcc-15.1.0
arm                        multi_v5_defconfig    gcc-15.1.0
arm                   randconfig-001-20250609    clang-21
arm                   randconfig-001-20250610    gcc-12.4.0
arm                   randconfig-002-20250609    clang-17
arm                   randconfig-002-20250610    gcc-12.4.0
arm                   randconfig-003-20250609    clang-21
arm                   randconfig-003-20250610    gcc-12.4.0
arm                   randconfig-004-20250609    gcc-8.5.0
arm                   randconfig-004-20250610    gcc-12.4.0
arm                             rpc_defconfig    gcc-15.1.0
arm                         s3c6400_defconfig    gcc-15.1.0
arm                           sama7_defconfig    clang-21
arm                    vt8500_v6_v7_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20250609    clang-21
arm64                 randconfig-001-20250610    gcc-12.4.0
arm64                 randconfig-002-20250609    clang-21
arm64                 randconfig-002-20250610    gcc-12.4.0
arm64                 randconfig-003-20250609    gcc-14.3.0
arm64                 randconfig-003-20250610    gcc-12.4.0
arm64                 randconfig-004-20250609    gcc-9.5.0
arm64                 randconfig-004-20250610    gcc-12.4.0
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20250609    gcc-15.1.0
csky                  randconfig-002-20250609    gcc-12.4.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                           allnoconfig    gcc-15.1.0
hexagon                          allyesconfig    clang-21
hexagon                             defconfig    gcc-15.1.0
hexagon               randconfig-001-20250609    clang-20
hexagon               randconfig-002-20250609    clang-21
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-20
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250609    clang-20
i386        buildonly-randconfig-001-20250610    clang-20
i386        buildonly-randconfig-002-20250609    clang-20
i386        buildonly-randconfig-002-20250610    clang-20
i386        buildonly-randconfig-003-20250609    clang-20
i386        buildonly-randconfig-003-20250610    clang-20
i386        buildonly-randconfig-004-20250609    clang-20
i386        buildonly-randconfig-004-20250610    clang-20
i386        buildonly-randconfig-005-20250609    clang-20
i386        buildonly-randconfig-005-20250610    clang-20
i386        buildonly-randconfig-006-20250609    gcc-12
i386        buildonly-randconfig-006-20250610    clang-20
i386                                defconfig    clang-20
i386                  randconfig-001-20250610    clang-20
i386                  randconfig-002-20250610    clang-20
i386                  randconfig-003-20250610    clang-20
i386                  randconfig-004-20250610    clang-20
i386                  randconfig-005-20250610    clang-20
i386                  randconfig-006-20250610    clang-20
i386                  randconfig-007-20250610    clang-20
i386                  randconfig-011-20250610    clang-20
i386                  randconfig-012-20250610    clang-20
i386                  randconfig-013-20250610    clang-20
i386                  randconfig-014-20250610    clang-20
i386                  randconfig-015-20250610    clang-20
i386                  randconfig-016-20250610    clang-20
i386                  randconfig-017-20250610    clang-20
loongarch                        allmodconfig    gcc-15.1.0
loongarch                         allnoconfig    gcc-15.1.0
loongarch                           defconfig    gcc-15.1.0
loongarch             randconfig-001-20250609    gcc-15.1.0
loongarch             randconfig-002-20250609    gcc-12.4.0
m68k                             alldefconfig    gcc-15.1.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                        bcm63xx_defconfig    clang-21
mips                         db1xxx_defconfig    gcc-15.1.0
mips                           ip32_defconfig    clang-21
mips                          rb532_defconfig    clang-18
nios2                         10m50_defconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-15.1.0
nios2                               defconfig    gcc-15.1.0
nios2                 randconfig-001-20250609    gcc-8.5.0
nios2                 randconfig-002-20250609    gcc-8.5.0
openrisc                          allnoconfig    clang-21
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-21
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20250609    gcc-8.5.0
parisc                randconfig-002-20250609    gcc-8.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-21
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-21
powerpc                          allyesconfig    gcc-15.1.0
powerpc                    gamecube_defconfig    gcc-15.1.0
powerpc                      katmai_defconfig    clang-21
powerpc                     mpc512x_defconfig    gcc-15.1.0
powerpc                 mpc836x_rdk_defconfig    clang-21
powerpc               randconfig-001-20250609    clang-21
powerpc               randconfig-002-20250609    clang-21
powerpc               randconfig-003-20250609    gcc-9.3.0
powerpc                     redwood_defconfig    clang-21
powerpc                  storcenter_defconfig    gcc-15.1.0
powerpc                     stx_gp3_defconfig    gcc-15.1.0
powerpc64             randconfig-001-20250609    clang-21
powerpc64             randconfig-002-20250609    clang-21
powerpc64             randconfig-003-20250609    clang-21
riscv                            allmodconfig    clang-21
riscv                            allmodconfig    gcc-15.1.0
riscv                             allnoconfig    clang-21
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                            allyesconfig    gcc-15.1.0
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20250609    gcc-12.4.0
riscv                 randconfig-001-20250610    gcc-9.3.0
riscv                 randconfig-002-20250609    clang-21
riscv                 randconfig-002-20250610    gcc-9.3.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20250609    clang-21
s390                  randconfig-001-20250610    gcc-9.3.0
s390                  randconfig-002-20250609    clang-21
s390                  randconfig-002-20250610    gcc-9.3.0
s390                       zfcpdump_defconfig    gcc-15.1.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-12
sh                 kfr2r09-romimage_defconfig    gcc-15.1.0
sh                    randconfig-001-20250609    gcc-11.5.0
sh                    randconfig-001-20250610    gcc-9.3.0
sh                    randconfig-002-20250609    gcc-13.3.0
sh                    randconfig-002-20250610    gcc-9.3.0
sh                   rts7751r2dplus_defconfig    gcc-15.1.0
sh                           se7780_defconfig    gcc-15.1.0
sh                     sh7710voipgw_defconfig    gcc-15.1.0
sh                        sh7785lcr_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                 randconfig-001-20250609    gcc-15.1.0
sparc                 randconfig-001-20250610    gcc-9.3.0
sparc                 randconfig-002-20250609    gcc-15.1.0
sparc                 randconfig-002-20250610    gcc-9.3.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250609    gcc-12.4.0
sparc64               randconfig-001-20250610    gcc-9.3.0
sparc64               randconfig-002-20250609    gcc-9.3.0
sparc64               randconfig-002-20250610    gcc-9.3.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250609    clang-21
um                    randconfig-001-20250610    gcc-9.3.0
um                    randconfig-002-20250609    gcc-12
um                    randconfig-002-20250610    gcc-9.3.0
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250609    clang-20
x86_64      buildonly-randconfig-001-20250610    gcc-12
x86_64      buildonly-randconfig-002-20250609    gcc-12
x86_64      buildonly-randconfig-002-20250610    gcc-12
x86_64      buildonly-randconfig-003-20250609    clang-20
x86_64      buildonly-randconfig-003-20250610    gcc-12
x86_64      buildonly-randconfig-004-20250609    clang-20
x86_64      buildonly-randconfig-004-20250610    gcc-12
x86_64      buildonly-randconfig-005-20250609    clang-20
x86_64      buildonly-randconfig-005-20250610    gcc-12
x86_64      buildonly-randconfig-006-20250609    gcc-12
x86_64      buildonly-randconfig-006-20250610    gcc-12
x86_64                              defconfig    clang-20
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250610    clang-20
x86_64                randconfig-002-20250610    clang-20
x86_64                randconfig-003-20250610    clang-20
x86_64                randconfig-004-20250610    clang-20
x86_64                randconfig-005-20250610    clang-20
x86_64                randconfig-006-20250610    clang-20
x86_64                randconfig-007-20250610    clang-20
x86_64                randconfig-008-20250610    clang-20
x86_64                randconfig-071-20250610    clang-20
x86_64                randconfig-072-20250610    clang-20
x86_64                randconfig-073-20250610    clang-20
x86_64                randconfig-074-20250610    clang-20
x86_64                randconfig-075-20250610    clang-20
x86_64                randconfig-076-20250610    clang-20
x86_64                randconfig-077-20250610    clang-20
x86_64                randconfig-078-20250610    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-12
x86_64                         rhel-9.4-kunit    gcc-12
x86_64                           rhel-9.4-ltp    gcc-12
x86_64                          rhel-9.4-rust    clang-18
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250609    gcc-11.5.0
xtensa                randconfig-001-20250610    gcc-9.3.0
xtensa                randconfig-002-20250609    gcc-8.5.0
xtensa                randconfig-002-20250610    gcc-9.3.0
xtensa                    smp_lx200_defconfig    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
