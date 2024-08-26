Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86C20881E
	for <linux-m68k@lists.linux-m68k.org>; Mon, 26 Aug 2024 20:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724704593; cv=none; b=ILiRLCHJ09ig/4RdfjTBLZu/HOTonyDyHtX+CFfdP8foxZra5msSGdAZ4qrGodudo5Mkg3lX1gQy3CkiPolEJjatHRV1asHGtdCoOs2ebckczBDaAkxFx1VgKfyLk2t9VHzhLgGbHOr+fvaVo/8urLiO7w5IHm4fFbTmOcmkotU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724704593; c=relaxed/simple;
	bh=ogVhTbBHfj2BB/d4WbrttX5/y49b8j9tICDWpEkKXFA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=oAx2P3Blde2XJRhAK8czFnk7QzSXjHN1ilMp0K+6tJ6Uu/+RXxi4/xqgHvmWKKe/tQo/WQ0v6TBagE/RTASBgrxX5ykZ2E1I3Xj2YUAdmAjZQoA4VYREl9JHpWEoMSWdpvuL73XY5XW1NvBLkopDVM2qH+PuA04ivMgf1ncyjl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yf5u1s2x; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yf5u1s2x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724704591; x=1756240591;
  h=date:from:to:cc:subject:message-id;
  bh=ogVhTbBHfj2BB/d4WbrttX5/y49b8j9tICDWpEkKXFA=;
  b=Yf5u1s2xCR1ptao4Td114TLrEqRwHwcfDVbh9LBWa2PVbLMso4qlvR3i
   kproEYjIknKmKlJwdkymEnhSh0wMeNwoGknk+8lN6qhGiQAdkM6sQPth2
   DBeeravMqyTAoNVPS99vF6kmhoQuDvZ5g1N9TU//IWJS2/j9c6KMNSUuL
   Hbzao3cUxGX2OMTSGqPJaQZNcVDaeIlwhs+4CxVtD2N13fQ4j0NQnBYus
   tpWOxJ98HO3W4XxbPIJ/JvsbEcwUZwLe1+al3pas7OypjSq+pxY3N7046
   fYnSVKddOJo9x4aIZLK0JnKZLUNP5QcJfbVMjhPe7PlkecrSFUJcFLo4P
   g==;
X-CSE-ConnectionGUID: uULfpgNPS1SaoRkIcUmLMA==
X-CSE-MsgGUID: EuYQde3BQruhI3a3/odYBQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="40621415"
X-IronPort-AV: E=Sophos;i="6.10,178,1719903600"; 
   d="scan'208";a="40621415"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2024 13:36:30 -0700
X-CSE-ConnectionGUID: 4DRpIfOERU+nRn/WPH1g9Q==
X-CSE-MsgGUID: sl6XJ76SS0ihXm0MlKASYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,178,1719903600"; 
   d="scan'208";a="63363358"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 26 Aug 2024 13:36:29 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sigRu-000HZw-1o;
	Mon, 26 Aug 2024 20:36:26 +0000
Date: Tue, 27 Aug 2024 04:35:46 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:for-v6.12] BUILD SUCCESS
 b90fae5df91744e45e683c17bb1a38e466770df3
Message-ID: <202408270444.44C2AYQ8-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git for-v6.12
branch HEAD: b90fae5df91744e45e683c17bb1a38e466770df3  m68k: defconfig: Update defconfigs for v6.11-rc1

elapsed time: 727m

configs tested: 60
configs skipped: 149

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arm                               allnoconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-13.2.0
csky                              allnoconfig   gcc-13.2.0
i386         buildonly-randconfig-001-20240827   gcc-12
i386         buildonly-randconfig-002-20240827   gcc-12
i386         buildonly-randconfig-003-20240827   gcc-12
i386         buildonly-randconfig-004-20240827   gcc-12
i386         buildonly-randconfig-005-20240827   gcc-12
i386         buildonly-randconfig-006-20240827   gcc-12
i386                  randconfig-001-20240827   gcc-12
i386                  randconfig-002-20240827   gcc-12
i386                  randconfig-003-20240827   gcc-12
i386                  randconfig-004-20240827   gcc-12
i386                  randconfig-005-20240827   gcc-12
i386                  randconfig-006-20240827   gcc-12
i386                  randconfig-011-20240827   gcc-12
i386                  randconfig-012-20240827   gcc-12
i386                  randconfig-013-20240827   gcc-12
i386                  randconfig-014-20240827   gcc-12
i386                  randconfig-015-20240827   gcc-12
i386                  randconfig-016-20240827   gcc-12
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-13.2.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-13.2.0
m68k                             allyesconfig   gcc-14.1.0
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-13.2.0
microblaze                       allyesconfig   gcc-14.1.0
mips                              allnoconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-13.2.0
s390                             allmodconfig   clang-20
s390                             allyesconfig   clang-20
sh                                allnoconfig   gcc-13.2.0
x86_64       buildonly-randconfig-002-20240827   clang-18
x86_64       buildonly-randconfig-003-20240827   clang-18
x86_64       buildonly-randconfig-004-20240827   clang-18
x86_64       buildonly-randconfig-005-20240827   clang-18
x86_64       buildonly-randconfig-006-20240827   clang-18
x86_64                randconfig-001-20240827   clang-18
x86_64                randconfig-002-20240827   clang-18
x86_64                randconfig-003-20240827   clang-18
x86_64                randconfig-004-20240827   clang-18
x86_64                randconfig-005-20240827   clang-18
x86_64                randconfig-006-20240827   clang-18
x86_64                randconfig-011-20240827   clang-18
x86_64                randconfig-012-20240827   clang-18
x86_64                randconfig-013-20240827   clang-18
x86_64                randconfig-014-20240827   clang-18
x86_64                randconfig-015-20240827   clang-18
x86_64                randconfig-016-20240827   clang-18
x86_64                randconfig-071-20240827   clang-18
x86_64                randconfig-072-20240827   clang-18
x86_64                randconfig-073-20240827   clang-18
x86_64                randconfig-074-20240827   clang-18
x86_64                randconfig-075-20240827   clang-18
x86_64                randconfig-076-20240827   clang-18
xtensa                            allnoconfig   gcc-13.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
