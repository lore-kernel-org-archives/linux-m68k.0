Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3592517623D
	for <linux-m68k@lists.linux-m68k.org>; Tue, 11 Jun 2024 12:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718108665; cv=none; b=PKNyx7PGuC2YFmxAkc1fexurkwDG9kdk0Gqtz8nK99atL/vNdpvfud88vs3wT09QNa1Lv84DEqP+j/hnvxBbUo8LTFj9LV7C4dW/oJr5H+2ahokPLXBNnDl3nSQ4zgp9VYYba80nTu50r7mHM1z5ue2xVKhTIQaaFR+LIfdKK+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718108665; c=relaxed/simple;
	bh=MvomJn3ESAXi+b/W+tkDo7zcJ9Sng8YxvcrkpntZRm8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jx3pqhotBF6QM1LS5tQEq+sfDA6IVs9Xyae0nxY47/9+JrC8BKYsj5WWGBAuEopeDZU0XgjEdwBvfUoqn6r5bHzaCVBZI8f/rDJ7pVxgTRdhfZD8E+jisrqK9QvnO/p2yi9NcI1/kTbJJXVwMRvLdBiGwkDp1dK636vpNu0109Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fe1N38ki; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fe1N38ki"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718108665; x=1749644665;
  h=date:from:to:cc:subject:message-id;
  bh=MvomJn3ESAXi+b/W+tkDo7zcJ9Sng8YxvcrkpntZRm8=;
  b=Fe1N38kijKTclCf92BZTC1u/5YQPOGdKqTd8vjxIsQu1jI43kQMo3xSk
   tIWkwAh6P4Gp67V+J65vpy3VpmwQjyH2tgfR4sS71iP6CoC+S4axtpfsW
   jvSo/2pnhdmgWKTlptLoIt9QltakZqEoFJyEo/fD7jvvKUpAD5oVsRSkq
   OaQ14bbTROWvX71m+zAi0nKkZTcQptALu7C2zbBsBxs0aFkQov8KlNcf/
   3cNFqP5GSK4VM4GdoHR2tqHW8l+9mn0Cmss2MLgXlVG1lTKbarMPujaDk
   DxlZ2YcPKjdxWAF8OXQYO7ysMonda8r/gQow58GkZmcFGPY1sKFAR4u/F
   A==;
X-CSE-ConnectionGUID: RZJzYuQiQKiz/rI53tvBxA==
X-CSE-MsgGUID: l0QNjYGJQwWUd2hY1xCbfQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="37335750"
X-IronPort-AV: E=Sophos;i="6.08,230,1712646000"; 
   d="scan'208";a="37335750"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2024 05:24:23 -0700
X-CSE-ConnectionGUID: 67t2BDj5SDWsF1k+2dVRvQ==
X-CSE-MsgGUID: ImRDjdx/RvKQY0i1d4vpsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,230,1712646000"; 
   d="scan'208";a="70597152"
Received: from lkp-server01.sh.intel.com (HELO 628d7d8b9fc6) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 11 Jun 2024 05:24:22 -0700
Received: from kbuild by 628d7d8b9fc6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sH0Xz-0000Q8-2Y;
	Tue, 11 Jun 2024 12:24:19 +0000
Date: Tue, 11 Jun 2024 20:23:27 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:master] BUILD SUCCESS
 1eb862e5a3026b81b3c1fd26af3b9fc0e44887bb
Message-ID: <202406112024.UXSpLGJ7-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git master
branch HEAD: 1eb862e5a3026b81b3c1fd26af3b9fc0e44887bb  Merge tag 'v6.10-rc3'

elapsed time: 1470m

configs tested: 136
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   alpha
allnoconfig                        gcc-13.2.0   alpha
allyesconfig                            alpha   defconfig
alpha                               defconfig   gcc-13.2.0
arc                               allnoconfig   arc  
allnoconfig                        gcc-13.2.0   arc  
defconfig                                 arc   defconfig
gcc-13.2.0                                arc   randconfig-001-20240611
arc                   randconfig-002-20240611   arm  
allnoconfig                               arm   defconfig
arm                   randconfig-001-20240611   arm  
randconfig-002-20240611                              arm   randconfig-003-20240611
arm64                             allnoconfig   arm64
defconfig                                csky   allnoconfig
csky                                defconfig   hexagon
allmodconfig                          hexagon   allnoconfig
hexagon                          allyesconfig   hexagon
defconfig                                i386   allmodconfig
gcc-13                                   i386   allnoconfig
gcc-13                                   i386   buildonly-randconfig-001-20240610
i386         buildonly-randconfig-002-20240610   i386 
buildonly-randconfig-003-20240610                             i386   buildonly-randconfig-003-20240611
i386         buildonly-randconfig-004-20240610   i386 
buildonly-randconfig-005-20240610                             i386   buildonly-randconfig-006-20240610
i386                                defconfig   clang-18
i386                  randconfig-001-20240610   i386 
randconfig-001-20240611                             i386   randconfig-002-20240610
i386                  randconfig-003-20240610   i386 
randconfig-004-20240610                             i386   randconfig-004-20240611
i386                  randconfig-005-20240610   i386 
randconfig-006-20240610                             i386   randconfig-006-20240611
i386                  randconfig-011-20240610   i386 
randconfig-011-20240611                             i386   randconfig-012-20240610
i386                  randconfig-013-20240610   i386 
randconfig-013-20240611                             i386   randconfig-014-20240610
i386                  randconfig-015-20240610   i386 
randconfig-015-20240611                             i386   randconfig-016-20240610
i386                  randconfig-016-20240611   loongarch
allmodconfig                        loongarch   allnoconfig
loongarch                           defconfig   m68k 
allmodconfig                             m68k   allmodconfig
gcc-13.2.0                               m68k   allnoconfig
m68k                             allyesconfig   m68k 
defconfig                          microblaze   allmodconfig
microblaze                        allnoconfig   microblaze
allyesconfig                       microblaze   defconfig
mips                              allnoconfig   mips 
allyesconfig                            nios2   allmodconfig
nios2                             allnoconfig   nios2
allyesconfig                            nios2   defconfig
openrisc                          allnoconfig   openrisc
allnoconfig                        gcc-13.2.0   openrisc
defconfig                            openrisc   defconfig
gcc-13.2.0                             parisc   allnoconfig
parisc                            allnoconfig   gcc-13.2.0
parisc                              defconfig   parisc
defconfig                          gcc-13.2.0   parisc64
defconfig                            parisc64   defconfig
gcc-13.2.0                            powerpc   allnoconfig
powerpc                           allnoconfig   gcc-13.2.0
riscv                             allnoconfig   riscv
allnoconfig                        gcc-13.2.0   riscv
defconfig                                s390   allmodconfig
clang-19                                 s390   allnoconfig
s390                             allyesconfig   gcc-13.2.0
s390                                defconfig   sh   
allmodconfig                       gcc-13.2.0   sh   
allnoconfig                                sh   allyesconfig
gcc-13.2.0                                 sh   defconfig
sparc                            allmodconfig   gcc-13.2.0
sparc                             allnoconfig   sparc
defconfig                             sparc64   defconfig
um                               allmodconfig   um   
allnoconfig                                um   allyesconfig
um                                  defconfig   um   
i386_defconfig                               um   x86_64_defconfig
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240611   x86_64
buildonly-randconfig-002-20240611                           x86_64   buildonly-randconfig-003-20240611
x86_64       buildonly-randconfig-004-20240611   x86_64
buildonly-randconfig-005-20240611                           x86_64   buildonly-randconfig-006-20240611
x86_64                              defconfig   gcc-13
x86_64                randconfig-001-20240611   x86_64
randconfig-002-20240611                           x86_64   randconfig-003-20240611
x86_64                randconfig-004-20240611   x86_64
randconfig-005-20240611                           x86_64   randconfig-006-20240611
x86_64                randconfig-011-20240611   x86_64
randconfig-012-20240611                           x86_64   randconfig-013-20240611
x86_64                randconfig-014-20240611   x86_64
randconfig-015-20240611                           x86_64   randconfig-016-20240611
x86_64                randconfig-071-20240611   clang-18
x86_64                randconfig-072-20240611   x86_64
randconfig-073-20240611                         clang-18   x86_64
randconfig-074-20240611                           x86_64   randconfig-074-20240611
gcc-11                                 x86_64   randconfig-075-20240611
x86_64                randconfig-075-20240611   gcc-13
x86_64                randconfig-076-20240611   x86_64
randconfig-076-20240611                           gcc-13   x86_64
rhel-8.3-rust                         clang-18   xtensa
allnoconfig                                          

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
