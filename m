Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DC225C8E6
	for <linux-m68k@lists.linux-m68k.org>; Tue,  2 Apr 2024 20:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712088912; cv=none; b=ou8buSC0kXsI1WdS6oPrD+xBEVEBJ0f3BCEW8GbYO+Ret6lG0xiOunCEHYvU/adxC0ZwBsiv5uiYO8TMe9U0jt+1e1SofpDBn/0QX21Ioyohtuu1N2C7yz1d2gvpdXOWjwfZLjeKiH109A4gMAkSWrAO5/f7BBX5U14HQ80g+6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712088912; c=relaxed/simple;
	bh=AO+JXR8w+wOUkrc5Mc4YRNR9q5MwVn4RWoqSSQtzSqU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=MdUrao3eWlFyBCgUbQ+7Aa+7oy4vCd5QkE1IAs6abxqqgwh2Hf+AzYW3hMWMp7XEbPMhohMQHo77W6i9RPkUBbgr6D1YrWnfM4NXHin3BV+WwiEL0z+8g2+/8h8H9qmAOkBaVov5ry2ksyhDCm1g37QgyRsRmd3OAh+FTfZnS9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GHCu5TUb; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GHCu5TUb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712088910; x=1743624910;
  h=date:from:to:cc:subject:message-id;
  bh=AO+JXR8w+wOUkrc5Mc4YRNR9q5MwVn4RWoqSSQtzSqU=;
  b=GHCu5TUbkaoDVpuYHg6e+YoKiT4XJc98RmwkO04hDdV9kRaskSgpBHJh
   Ztncng/bDQU9s+T8r/RfgT9/GanhbjCY9pG5p+xI2smMPP54u2hWIouSp
   kPlyHo6cWnyL70U5eCX8ntZRLyDHS3Hw+zBPIJRTwxa4Zy0uSmhLXsZx8
   ZKXVJ2ynnS1GY9Y6zBjARUu8djam8++I7h636DZId+L5S46xsg7LH+8IK
   R/r9njpkvwzcuXhxrtXgBZpaYIph9QvVucUoj7kcEEB5Kg1Z0wPsk0eXN
   vk0XGMB6u+ejI0FRX1m1RvMEwVdsJrAQXxKhdMAeLIYCIXtVkeOjhGN15
   Q==;
X-CSE-ConnectionGUID: 97CUP1m3S42FGKVy/nAmxQ==
X-CSE-MsgGUID: QEonJH7/TM+7ET+T4qnDfQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="32682221"
X-IronPort-AV: E=Sophos;i="6.07,176,1708416000"; 
   d="scan'208";a="32682221"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2024 13:15:08 -0700
X-CSE-ConnectionGUID: vhsyx2N8TKCEQqMbEcFB/w==
X-CSE-MsgGUID: yAqS6hV6QzaAUvnaepT2rA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,176,1708416000"; 
   d="scan'208";a="18765479"
Received: from lkp-server02.sh.intel.com (HELO 90ee3aa53dbd) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 02 Apr 2024 13:15:08 -0700
Received: from kbuild by 90ee3aa53dbd with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rrkX9-0001Vt-0n;
	Tue, 02 Apr 2024 20:15:03 +0000
Date: Wed, 03 Apr 2024 04:14:19 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:for-v6.10] BUILD SUCCESS
 70d830e337f999ad186d0093e973805eaf6fb8ca
Message-ID: <202404030417.iAiJnDf6-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git for-v6.10
branch HEAD: 70d830e337f999ad186d0093e973805eaf6fb8ca  m68k: Calculate THREAD_SIZE from THREAD_SIZE_ORDER

elapsed time: 727m

configs tested: 87
configs skipped: 181

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                               allnoconfig   gcc  
arc                                 defconfig   gcc  
arm                               allnoconfig   clang
arm                       aspeed_g5_defconfig   gcc  
arm                                 defconfig   clang
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
csky                              allnoconfig   gcc  
csky                                defconfig   gcc  
hexagon                           allnoconfig   clang
hexagon                             defconfig   clang
i386         buildonly-randconfig-001-20240402   gcc  
i386         buildonly-randconfig-002-20240402   gcc  
i386                  randconfig-001-20240402   gcc  
i386                  randconfig-011-20240402   gcc  
i386                  randconfig-015-20240402   gcc  
i386                  randconfig-016-20240402   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                        m5307c3_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                      loongson3_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
openrisc                         allmodconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                 mpc837x_rdb_defconfig   gcc  
powerpc                    mvme5100_defconfig   gcc  
powerpc                      ppc64e_defconfig   gcc  
riscv                            allmodconfig   clang
riscv                            allyesconfig   clang
riscv                               defconfig   clang
s390                             alldefconfig   gcc  
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
sh                               allmodconfig   gcc  
sh                               allyesconfig   gcc  
sh                           se7721_defconfig   gcc  
sh                        sh7763rdp_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                            allyesconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   clang
x86_64       buildonly-randconfig-001-20240402   clang
x86_64       buildonly-randconfig-002-20240402   clang
x86_64       buildonly-randconfig-003-20240402   clang
x86_64       buildonly-randconfig-004-20240402   clang
x86_64       buildonly-randconfig-005-20240402   clang
x86_64       buildonly-randconfig-006-20240402   clang
x86_64                randconfig-001-20240402   clang
x86_64                randconfig-002-20240402   clang
x86_64                randconfig-004-20240402   clang
x86_64                randconfig-013-20240402   clang
x86_64                randconfig-015-20240402   clang
x86_64                randconfig-071-20240402   clang
x86_64                randconfig-072-20240402   clang
x86_64                randconfig-073-20240402   clang
x86_64                randconfig-075-20240402   clang
x86_64                randconfig-076-20240402   clang
x86_64                           rhel-8.3-bpf   gcc  
x86_64                          rhel-8.3-func   gcc  
x86_64                               rhel-8.3   gcc  
xtensa                           allyesconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
