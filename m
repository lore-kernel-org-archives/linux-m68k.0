Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA5731991B6
	for <linux-m68k@lists.linux-m68k.org>; Tue, 16 Sep 2025 03:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757993884; cv=none; b=riRP75zOQaZF/4Nt+fTNuo7W7gbv7fxfa2UDs/YA9HqwWamPJhwxsqxA9n91OGftLJbQmjklZHJLovKow2y8iWxeuyh0uH2pQZWUm/uJNOT1skuIUBU+TToqlrcxPeGR8gfkzzeH8p4hgc755mTkxY7MzoCycpLD0rSQCdBiXd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757993884; c=relaxed/simple;
	bh=oWYBDZUsJWcyytTznfOEUqG4KSOo3B0DOdGVUXADuyM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sGzp6Fc/0N4qp53a1aI9MZ6iZMfavGaQdOG4buNXAAlbm/tHw0dKOuh2pHPAbOiuf3Mdn+fVsdwOHjHI28QDNIzeXJCeEYVgfzhy2auhDxqgqZuXEpZptM/bwbV4SAAg8bUrOE8yZ4TRpzI6qWs+rQiBjipZ1zc4EoC55VlQ1tI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mq06nS90; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mq06nS90"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757993882; x=1789529882;
  h=date:from:to:cc:subject:message-id;
  bh=oWYBDZUsJWcyytTznfOEUqG4KSOo3B0DOdGVUXADuyM=;
  b=mq06nS90Z56uiO2YMC9Bj+jopWZG1YV/+T+zTPWCX7cWsSWffm4vRjJt
   r2fs8v2IZ1oYa09LoomUKBy+b4/wExpevkpAjmU7w73p8T6kpITPR8x1Q
   Jmir8ecHNImT0MsU6RTxXrMbCa3a3/dyQ4iwWPzaB7nKBDcscFHniWNDy
   FEJM58C4xARR4U2PUWRtZlIPnm7a1Eh7i/Ly2HIlbyBzyF+/1xnNAJp42
   01cv2XxI9WB01K9ZODPuC3/zC0f/6GDJT6PU7jQ7QE5RJQgsCKuoqKOKW
   csvHfP9bwlCn8Fz1S5T92ti0UDSZUa/H+r5F+GObKWhRHMLD8/jl+L2nJ
   A==;
X-CSE-ConnectionGUID: zHXisPG+QC6EjoVsQ90BQA==
X-CSE-MsgGUID: +gsJ4KUxTHCn2VpIQRBPsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11554"; a="60335880"
X-IronPort-AV: E=Sophos;i="6.18,268,1751266800"; 
   d="scan'208";a="60335880"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2025 20:38:01 -0700
X-CSE-ConnectionGUID: XU1FhgSvQ2OTZ2+MhPUn8w==
X-CSE-MsgGUID: UpKYfQOXTWWZJPTCT0ujuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,268,1751266800"; 
   d="scan'208";a="173941338"
Received: from lkp-server01.sh.intel.com (HELO 5b01dd97f97c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 15 Sep 2025 20:38:01 -0700
Received: from kbuild by 5b01dd97f97c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uyMVx-0000yR-2p;
	Tue, 16 Sep 2025 03:37:57 +0000
Date: Tue, 16 Sep 2025 11:37:24 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:master] BUILD SUCCESS
 793f4a5da91fe6f127eeb5f479342d163e7444bb
Message-ID: <202509161109.QffrFkPb-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git master
branch HEAD: 793f4a5da91fe6f127eeb5f479342d163e7444bb  m68k: bitops: Fix find_*_bit() signatures

elapsed time: 860m

configs tested: 120
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                   randconfig-001-20250915    gcc-9.5.0
arc                   randconfig-002-20250915    gcc-9.5.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    gcc-15.1.0
arm                         bcm2835_defconfig    clang-22
arm                       imx_v4_v5_defconfig    clang-22
arm                   randconfig-001-20250915    gcc-13.4.0
arm                   randconfig-002-20250915    clang-20
arm                   randconfig-003-20250915    gcc-8.5.0
arm                   randconfig-004-20250915    gcc-11.5.0
arm                           sama5_defconfig    gcc-15.1.0
arm                           sama7_defconfig    clang-22
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250915    clang-22
arm64                 randconfig-002-20250915    clang-22
arm64                 randconfig-003-20250915    gcc-8.5.0
arm64                 randconfig-004-20250915    gcc-11.5.0
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20250915    gcc-15.1.0
csky                  randconfig-002-20250915    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-22
hexagon               randconfig-001-20250915    clang-22
hexagon               randconfig-002-20250915    clang-22
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20250915    clang-20
i386        buildonly-randconfig-002-20250915    gcc-14
i386        buildonly-randconfig-003-20250915    gcc-14
i386        buildonly-randconfig-004-20250915    gcc-14
i386        buildonly-randconfig-005-20250915    gcc-14
i386        buildonly-randconfig-006-20250915    gcc-14
i386                                defconfig    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch             randconfig-001-20250915    clang-22
loongarch             randconfig-002-20250915    gcc-12.5.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20250915    gcc-11.5.0
nios2                 randconfig-002-20250915    gcc-11.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                    or1ksim_defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250915    gcc-9.5.0
parisc                randconfig-002-20250915    gcc-14.3.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-22
powerpc                 canyonlands_defconfig    clang-22
powerpc               randconfig-001-20250915    gcc-14.3.0
powerpc               randconfig-002-20250915    gcc-8.5.0
powerpc               randconfig-003-20250915    clang-22
powerpc                     tqm5200_defconfig    gcc-15.1.0
powerpc64             randconfig-001-20250915    clang-20
powerpc64             randconfig-002-20250915    clang-22
powerpc64             randconfig-003-20250915    clang-22
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                 randconfig-001-20250915    gcc-8.5.0
riscv                 randconfig-002-20250915    clang-22
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                          debug_defconfig    gcc-15.1.0
s390                  randconfig-001-20250915    clang-22
s390                  randconfig-002-20250915    clang-22
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                    randconfig-001-20250915    gcc-15.1.0
sh                    randconfig-002-20250915    gcc-13.4.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250915    gcc-8.5.0
sparc                 randconfig-002-20250915    gcc-8.5.0
sparc64               randconfig-001-20250915    gcc-13.4.0
sparc64               randconfig-002-20250915    gcc-12.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                    randconfig-001-20250915    gcc-14
um                    randconfig-002-20250915    gcc-14
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250915    clang-20
x86_64      buildonly-randconfig-002-20250915    gcc-12
x86_64      buildonly-randconfig-003-20250915    gcc-14
x86_64      buildonly-randconfig-004-20250915    clang-20
x86_64      buildonly-randconfig-005-20250915    clang-20
x86_64      buildonly-randconfig-006-20250915    gcc-14
x86_64                              defconfig    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250915    gcc-9.5.0
xtensa                randconfig-002-20250915    gcc-11.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
