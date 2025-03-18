Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60DE9207650
	for <linux-m68k@lists.linux-m68k.org>; Tue, 18 Mar 2025 15:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742311322; cv=none; b=qwl9sA+gA8H/y83KlJJxePZvVKD2+O7vj8uqdV4HgIIfqDbfysA/afKV5DA1g3dU1C6BFFKqt2z6z1xadWd4yGDgm3Mf5JFZWVgrnjUXnotbGFKsXMIx9LP2TMqPJaI7P2SvfQUG6BXJp5d6223l5JcRtnLJDoctnsK0wdvR7ZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742311322; c=relaxed/simple;
	bh=QEQGIKhWeJrdHUx4gwN1qcTCaQCbG+swNjytPMSNPTI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jb0t7jnu86coAD5+mA+mL/viUrNYlIA1545uPR4V45DJzcZtA9rr+Z6Ao9U8VE4nfSmkEmJu+po0j3H2hEd+MKoybumouKBgaFF6TRzmFocanftPpNnx71CoQpPdRyQ4S2QXGv04265Ro8TrnvDdBWfcMTj7WuhXGZsj1AR8iX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aW7h4lgZ; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aW7h4lgZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742311321; x=1773847321;
  h=date:from:to:cc:subject:message-id;
  bh=QEQGIKhWeJrdHUx4gwN1qcTCaQCbG+swNjytPMSNPTI=;
  b=aW7h4lgZbFTBCdBbcVwv4Pgj6KIKS+134n42tfcNuBc3jMyAIsQNAqve
   o8xMszT4x8zCEUQ0BVynO7O5rx2q/TffCAuOlJKhEKNw0jVhz0w41gpzb
   XEsenV2ItgE8/IPD4t1Zinyy0eCPebqQW2PhkqrSoUiT50pzmOxFV+zO+
   LLbe/jCRj6k4EFcScpWJJYLUcjAklqCYL13fkkkEKzg8BWeY9D6kRpQP6
   QHcCUWQV5K9AwAl/MlGdiM7vDoFTh0+8FAyuw6Vv3HysvvG4/K4j4W8oh
   V5pFW9SEFH6H22iNPB4oD+rGh9nCIFqR+L0Nak1kX7utMdE73nGTUyq7z
   Q==;
X-CSE-ConnectionGUID: 6MhiZFwCTrGGql2LOO0kag==
X-CSE-MsgGUID: niBVh2dySNSXYmN1GlAOsg==
X-IronPort-AV: E=McAfee;i="6700,10204,11377"; a="54835940"
X-IronPort-AV: E=Sophos;i="6.14,257,1736841600"; 
   d="scan'208";a="54835940"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2025 08:21:59 -0700
X-CSE-ConnectionGUID: Nbj0EzIXRNaTO6QR65VKzQ==
X-CSE-MsgGUID: YRf+Vre4Tk+hfFWNVZgfbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,257,1736841600"; 
   d="scan'208";a="122030250"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 18 Mar 2025 08:21:58 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tuYlP-000Dt0-21;
	Tue, 18 Mar 2025 15:21:55 +0000
Date: Tue, 18 Mar 2025 23:21:15 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:master] BUILD SUCCESS
 3ae0cf875914e331b2239a960d6696ab944733e3
Message-ID: <202503182305.N1AOsipx-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git master
branch HEAD: 3ae0cf875914e331b2239a960d6696ab944733e3  m68k: defconfig: Update defconfigs for v6.14-rc1

elapsed time: 1456m

configs tested: 134
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.3.0
arc                              allyesconfig    gcc-13.2.0
arc                                 defconfig    gcc-14.2.0
arc                         haps_hs_defconfig    gcc-14.2.0
arc                   randconfig-001-20250317    gcc-13.2.0
arc                   randconfig-002-20250317    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-14.2.0
arm                        mvebu_v7_defconfig    clang-21
arm                   randconfig-001-20250317    gcc-14.2.0
arm                   randconfig-002-20250317    gcc-14.2.0
arm                   randconfig-003-20250317    gcc-14.2.0
arm                   randconfig-004-20250317    clang-21
arm                         vf610m4_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-8.5.0
arm64                               defconfig    gcc-6.5.0
arm64                 randconfig-001-20250317    gcc-14.2.0
arm64                 randconfig-002-20250317    gcc-14.2.0
arm64                 randconfig-003-20250317    gcc-14.2.0
arm64                 randconfig-004-20250317    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20250317    gcc-14.2.0
csky                  randconfig-002-20250317    gcc-14.2.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon                             defconfig    clang-21
hexagon               randconfig-001-20250317    clang-21
hexagon               randconfig-002-20250317    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250317    gcc-12
i386        buildonly-randconfig-002-20250317    clang-20
i386        buildonly-randconfig-003-20250317    clang-20
i386        buildonly-randconfig-004-20250317    clang-20
i386        buildonly-randconfig-005-20250317    gcc-12
i386        buildonly-randconfig-006-20250317    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250317    gcc-14.2.0
loongarch             randconfig-002-20250317    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                         apollo_defconfig    gcc-14.2.0
m68k                        m5407c3_defconfig    gcc-9.3.0
m68k                            q40_defconfig    gcc-11.5.0
m68k                          sun3x_defconfig    gcc-5.5.0
microblaze                       allmodconfig    gcc-9.3.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                        bcm47xx_defconfig    clang-18
mips                       bmips_be_defconfig    gcc-6.5.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250317    gcc-14.2.0
nios2                 randconfig-002-20250317    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-9.3.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250317    gcc-14.2.0
parisc                randconfig-002-20250317    gcc-14.2.0
powerpc                          allmodconfig    gcc-10.5.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-21
powerpc                   motionpro_defconfig    clang-15
powerpc                 mpc8313_rdb_defconfig    gcc-14.2.0
powerpc                     rainier_defconfig    gcc-11.5.0
powerpc               randconfig-001-20250317    clang-15
powerpc               randconfig-002-20250317    clang-21
powerpc               randconfig-003-20250317    gcc-14.2.0
powerpc64             randconfig-001-20250317    gcc-14.2.0
powerpc64             randconfig-002-20250317    gcc-14.2.0
powerpc64             randconfig-003-20250317    clang-21
riscv                            alldefconfig    gcc-14.2.0
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-21
riscv                 randconfig-001-20250317    gcc-14.2.0
riscv                 randconfig-002-20250317    gcc-14.2.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-15
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-15
s390                  randconfig-001-20250317    clang-15
s390                  randconfig-002-20250317    clang-15
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-11.5.0
sh                               j2_defconfig    gcc-14.2.0
sh                    randconfig-001-20250317    gcc-14.2.0
sh                    randconfig-002-20250317    gcc-14.2.0
sh                           se7206_defconfig    gcc-14.2.0
sh                           se7751_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250317    gcc-14.2.0
sparc                 randconfig-002-20250317    gcc-14.2.0
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20250317    gcc-14.2.0
sparc64               randconfig-002-20250317    gcc-14.2.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                    randconfig-001-20250317    gcc-12
um                    randconfig-002-20250317    clang-21
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250317    gcc-12
x86_64      buildonly-randconfig-002-20250317    clang-20
x86_64      buildonly-randconfig-003-20250317    gcc-12
x86_64      buildonly-randconfig-004-20250317    gcc-12
x86_64      buildonly-randconfig-005-20250317    gcc-12
x86_64      buildonly-randconfig-006-20250317    gcc-12
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250317    gcc-14.2.0
xtensa                randconfig-002-20250317    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
