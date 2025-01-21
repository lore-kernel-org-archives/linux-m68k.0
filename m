Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4178383
	for <linux-m68k@lists.linux-m68k.org>; Tue, 21 Jan 2025 05:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737437644; cv=none; b=nnDyImGefCojT3NGMne2aMZUyW/JEwaeEf7+1nqo1iZutGIiJh9bFpxU25BnH73Ra6+4VpF3UE6PnBoLrstyFJW9FoagSgWfmlyeYOVj5RvlQF75f/OhY9YX34IueqVuTCRbdpX2JAoHIT3mtCPiiWmBPc7XgDrTlZ6UVRsIMdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737437644; c=relaxed/simple;
	bh=tcODJ7XSOef33RddFTqVWEmbTKrWv6NEirlxqN44oqI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rKW16cTjzrHePl5Ay5vLQ0x9dfF8pTQbCKz4wgnIfOztsA/j/TqQxEgnmvMAJhg+7d4gfy0muhcU5Km5BWTqcmLjXECiv35XUmWaNbe1JEPD4prz5u//KC7JoFCANSzO3Wwt+5gCy7YAlxKC+Bquces9lARkfjjzGxxYGDbQ2Xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gjprLoOp; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gjprLoOp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737437643; x=1768973643;
  h=date:from:to:cc:subject:message-id;
  bh=tcODJ7XSOef33RddFTqVWEmbTKrWv6NEirlxqN44oqI=;
  b=gjprLoOp98HEcUQE17kYX3OwyRjhCC2N+3780jaVlzqXfVFRuapuNbi7
   XGX4NI9ebhACW4iq4h0foWZa+rKf+CI9ll0kgN47uknFUa/IOSwWbo/IT
   gwBIzPVwnmZHSHxq+++9dgJG0UX481jbY6OvK2RJu10ftgrar9I14JGoo
   3cmNWGEg6ETrD9Dptm0jyI4cesNKTb/xFHOEs2XRMaJXCEZkVTDLirBs0
   3gCDkb7vbqyVHD574epugT4sNyq7LPdnZ+EB+gYx76azOfETBuNT46MNs
   /RKu8HhCImue1t+T+1LRrn76/I0Of5Vw6P1/QDW8OwXvFumIqUyN38eeI
   Q==;
X-CSE-ConnectionGUID: poWlEckJR8+QFAIHAWJeuQ==
X-CSE-MsgGUID: nFZgaT0gRoijX6qpcUVPkQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11321"; a="38080245"
X-IronPort-AV: E=Sophos;i="6.13,221,1732608000"; 
   d="scan'208";a="38080245"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2025 21:33:44 -0800
X-CSE-ConnectionGUID: GpnpI5GmTl2Q52pQW/GF/g==
X-CSE-MsgGUID: hO5Xb7NuQGmtG+JCj81Q0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="111673197"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 20 Jan 2025 21:33:43 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ta6tR-000XfO-1X;
	Tue, 21 Jan 2025 05:33:41 +0000
Date: Tue, 21 Jan 2025 13:33:32 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:m68k-v6.13] BUILD SUCCESS
 3e71c1002f130e752b283f202df639f8fa96e10e
Message-ID: <202501211324.iYXebvI9-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git m68k-v6.13
branch HEAD: 3e71c1002f130e752b283f202df639f8fa96e10e  m68k: defconfig: Enable Atari EtherNAT and NetUSBee USB support

elapsed time: 909m

configs tested: 125
configs skipped: 7

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                   randconfig-001-20250120    gcc-13.2.0
arc                   randconfig-002-20250120    gcc-13.2.0
arm                               allnoconfig    clang-17
arm                              allyesconfig    gcc-14.2.0
arm                   randconfig-001-20250120    clang-20
arm                   randconfig-002-20250120    clang-20
arm                   randconfig-003-20250120    clang-20
arm                   randconfig-004-20250120    clang-19
arm                        spear6xx_defconfig    clang-19
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250120    gcc-14.2.0
arm64                 randconfig-002-20250120    clang-20
arm64                 randconfig-003-20250120    clang-19
arm64                 randconfig-004-20250120    clang-20
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250121    gcc-14.2.0
csky                  randconfig-002-20250121    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon                          allyesconfig    clang-18
hexagon               randconfig-001-20250121    clang-19
hexagon               randconfig-002-20250121    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250120    gcc-11
i386        buildonly-randconfig-002-20250120    clang-19
i386        buildonly-randconfig-003-20250120    gcc-12
i386        buildonly-randconfig-004-20250120    gcc-12
i386        buildonly-randconfig-005-20250120    clang-19
i386        buildonly-randconfig-006-20250120    clang-19
i386                                defconfig    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250121    gcc-14.2.0
loongarch             randconfig-002-20250121    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                        mvme147_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                         10m50_defconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250121    gcc-14.2.0
nios2                 randconfig-002-20250121    gcc-14.2.0
openrisc                         alldefconfig    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250121    gcc-14.2.0
parisc                randconfig-002-20250121    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc                       eiger_defconfig    clang-17
powerpc                     ep8248e_defconfig    gcc-14.2.0
powerpc                      pcm030_defconfig    clang-17
powerpc                     rainier_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250121    clang-20
powerpc               randconfig-002-20250121    gcc-14.2.0
powerpc               randconfig-003-20250121    gcc-14.2.0
powerpc64             randconfig-001-20250121    gcc-14.2.0
powerpc64             randconfig-002-20250121    clang-20
powerpc64             randconfig-003-20250121    clang-16
riscv                            allmodconfig    clang-20
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-20
riscv                               defconfig    clang-19
riscv                 randconfig-001-20250121    gcc-14.2.0
riscv                 randconfig-002-20250121    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-15
s390                  randconfig-001-20250121    clang-15
s390                  randconfig-002-20250121    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-14.2.0
sh                         ecovec24_defconfig    gcc-14.2.0
sh                            migor_defconfig    gcc-14.2.0
sh                    randconfig-001-20250121    gcc-14.2.0
sh                    randconfig-002-20250121    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250121    gcc-14.2.0
sparc                 randconfig-002-20250121    gcc-14.2.0
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20250121    gcc-14.2.0
sparc64               randconfig-002-20250121    gcc-14.2.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-18
um                               allyesconfig    gcc-12
um                                  defconfig    clang-20
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250121    clang-16
um                    randconfig-002-20250121    gcc-12
um                           x86_64_defconfig    clang-15
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250121    gcc-12
x86_64      buildonly-randconfig-002-20250121    clang-19
x86_64      buildonly-randconfig-003-20250121    gcc-12
x86_64      buildonly-randconfig-004-20250121    clang-19
x86_64      buildonly-randconfig-005-20250121    clang-19
x86_64      buildonly-randconfig-006-20250121    gcc-12
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250121    gcc-14.2.0
xtensa                randconfig-002-20250121    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
