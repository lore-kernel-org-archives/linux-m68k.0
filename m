Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3302523A9
	for <linux-m68k@lists.linux-m68k.org>; Tue, 22 Oct 2024 02:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729565172; cv=none; b=Lwko4FyNfj6bmYtyNK4Wjo/EshNb9ILZL0524mtWcCpIHIOWZC1k4F3ujKItYgk66e77OE7uSzkz8jIbYXG/XX6K153YsBbIwwrMfr6WR96R3ASuIGX2CAtB3e7TVsie130LMP1YFsyTdPZ/i5Sggi3PsekMJiLPWNMO2g4u8AA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729565172; c=relaxed/simple;
	bh=gVstzGY/sU3xo6smifTpp4ITsEnr6/C8YLg8JRK/6b4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CuJhpB9ioIX45fZwTojGfJ5LEOCb/hk5P09qIfDqQLplwezgR6ko4AJJYxx6IgEz6sPi/RnTGhdxqKW74yp0tEZTU3rOjOL+DZRLzTY/ZSRTex1yH8+B0aA2Y1A1MLse6JwiPUkYU1Ny5MeVUBJISVvNhCwTSaV6r5tz0VmktHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W8pNCnPA; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W8pNCnPA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729565170; x=1761101170;
  h=date:from:to:cc:subject:message-id;
  bh=gVstzGY/sU3xo6smifTpp4ITsEnr6/C8YLg8JRK/6b4=;
  b=W8pNCnPA/y7BGCvLmUitKvLkJktnzSeTcO9X50cEy0ZqUw4R+gP/5U2W
   bjMeHGGOqrnyR2desiFBglaCKVIFguuVhZYR3srV9L+Ax7CU1NOR5uiVA
   BTqpx5Bule513TO7if6gFXmSJ5MtjL6WONMdF4iUxX+TsdxYFRcncaDRd
   9XZoEEWRh9IJgClA7QfnVjqzx+cCfYBDQqQWTlJs2v4RGkiOvjkV43SvV
   h+zUFOUh2btSKXbwMzfo+gB6rUDO+6PRImfn5JfRMIXljMinwqtEn2k4t
   cfDXZgDLnamxbLYXu+TM9pX7i4hyGqD5cczxdcDdQVhl+2+oatx/C5JHp
   A==;
X-CSE-ConnectionGUID: DIPsR0RsR7aRt/NAWmho2Q==
X-CSE-MsgGUID: 3zH4imPSRP++eD8pnwYfPw==
X-IronPort-AV: E=McAfee;i="6700,10204,11232"; a="29191565"
X-IronPort-AV: E=Sophos;i="6.11,222,1725346800"; 
   d="scan'208";a="29191565"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2024 19:46:09 -0700
X-CSE-ConnectionGUID: w21ygrV7RIyy8GzM+IwtpQ==
X-CSE-MsgGUID: AJeF3LIrS3aHeR4D9lcSFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,222,1725346800"; 
   d="scan'208";a="110538209"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 21 Oct 2024 19:46:08 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t34uL-000Sx8-0y;
	Tue, 22 Oct 2024 02:46:05 +0000
Date: Tue, 22 Oct 2024 10:45:09 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:master] BUILD SUCCESS
 df25f67c11f7a4efb342380ebb0d069164bea11f
Message-ID: <202410221001.Wy1y2ba2-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git master
branch HEAD: df25f67c11f7a4efb342380ebb0d069164bea11f  Merge tag 'v6.12-rc4'

elapsed time: 903m

configs tested: 174
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.1.0
alpha                            allyesconfig    clang-20
alpha                               defconfig    gcc-14.1.0
arc                              allmodconfig    clang-20
arc                               allnoconfig    gcc-14.1.0
arc                              allyesconfig    clang-20
arc                      axs103_smp_defconfig    gcc-14.1.0
arc                                 defconfig    gcc-14.1.0
arc                   randconfig-001-20241022    gcc-14.1.0
arc                   randconfig-002-20241022    gcc-14.1.0
arm                              allmodconfig    clang-20
arm                               allnoconfig    gcc-14.1.0
arm                              allyesconfig    clang-20
arm                                 defconfig    gcc-14.1.0
arm                       omap2plus_defconfig    gcc-14.1.0
arm                   randconfig-001-20241022    gcc-14.1.0
arm                   randconfig-002-20241022    gcc-14.1.0
arm                   randconfig-003-20241022    gcc-14.1.0
arm                   randconfig-004-20241022    gcc-14.1.0
arm                             rpc_defconfig    gcc-14.1.0
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.1.0
arm64                               defconfig    gcc-14.1.0
arm64                 randconfig-001-20241022    gcc-14.1.0
arm64                 randconfig-002-20241022    gcc-14.1.0
arm64                 randconfig-003-20241022    gcc-14.1.0
arm64                 randconfig-004-20241022    gcc-14.1.0
csky                              allnoconfig    gcc-14.1.0
csky                                defconfig    gcc-14.1.0
csky                  randconfig-001-20241022    gcc-14.1.0
csky                  randconfig-002-20241022    gcc-14.1.0
hexagon                          alldefconfig    gcc-14.1.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    gcc-14.1.0
hexagon                          allyesconfig    clang-20
hexagon                             defconfig    gcc-14.1.0
hexagon               randconfig-001-20241022    gcc-14.1.0
hexagon               randconfig-002-20241022    gcc-14.1.0
i386                             allmodconfig    clang-18
i386                              allnoconfig    clang-18
i386                             allyesconfig    clang-18
i386        buildonly-randconfig-001-20241022    clang-18
i386        buildonly-randconfig-002-20241022    clang-18
i386        buildonly-randconfig-003-20241022    clang-18
i386        buildonly-randconfig-004-20241022    clang-18
i386        buildonly-randconfig-005-20241022    clang-18
i386        buildonly-randconfig-006-20241022    clang-18
i386                                defconfig    clang-18
i386                  randconfig-001-20241022    clang-18
i386                  randconfig-002-20241022    clang-18
i386                  randconfig-003-20241022    clang-18
i386                  randconfig-004-20241022    clang-18
i386                  randconfig-005-20241022    clang-18
i386                  randconfig-006-20241022    clang-18
i386                  randconfig-011-20241022    clang-18
i386                  randconfig-012-20241022    clang-18
i386                  randconfig-013-20241022    clang-18
i386                  randconfig-014-20241022    clang-18
i386                  randconfig-015-20241022    clang-18
i386                  randconfig-016-20241022    clang-18
loongarch                        allmodconfig    gcc-14.1.0
loongarch                         allnoconfig    gcc-14.1.0
loongarch                           defconfig    gcc-14.1.0
loongarch             randconfig-001-20241022    gcc-14.1.0
loongarch             randconfig-002-20241022    gcc-14.1.0
m68k                             allmodconfig    gcc-14.1.0
m68k                              allnoconfig    gcc-14.1.0
m68k                             allyesconfig    gcc-14.1.0
m68k                                defconfig    gcc-14.1.0
microblaze                       allmodconfig    gcc-14.1.0
microblaze                        allnoconfig    gcc-14.1.0
microblaze                       allyesconfig    gcc-14.1.0
microblaze                          defconfig    gcc-14.1.0
mips                              allnoconfig    gcc-14.1.0
nios2                             allnoconfig    gcc-14.1.0
nios2                               defconfig    gcc-14.1.0
nios2                 randconfig-001-20241022    gcc-14.1.0
nios2                 randconfig-002-20241022    gcc-14.1.0
openrisc                          allnoconfig    clang-20
openrisc                         allyesconfig    gcc-14.1.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-14.1.0
parisc                            allnoconfig    clang-20
parisc                           allyesconfig    gcc-14.1.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20241022    gcc-14.1.0
parisc                randconfig-002-20241022    gcc-14.1.0
parisc64                            defconfig    gcc-14.1.0
powerpc                          allmodconfig    gcc-14.1.0
powerpc                           allnoconfig    clang-20
powerpc                          allyesconfig    gcc-14.1.0
powerpc                       maple_defconfig    gcc-14.1.0
powerpc                     mpc512x_defconfig    gcc-14.1.0
powerpc                      ppc64e_defconfig    gcc-14.1.0
powerpc                         ps3_defconfig    gcc-14.1.0
powerpc               randconfig-001-20241022    gcc-14.1.0
powerpc               randconfig-002-20241022    gcc-14.1.0
powerpc               randconfig-003-20241022    gcc-14.1.0
powerpc                     tqm5200_defconfig    gcc-14.1.0
powerpc                     tqm8548_defconfig    gcc-14.1.0
powerpc64             randconfig-001-20241022    gcc-14.1.0
powerpc64             randconfig-002-20241022    gcc-14.1.0
powerpc64             randconfig-003-20241022    gcc-14.1.0
riscv                            allmodconfig    gcc-14.1.0
riscv                             allnoconfig    clang-20
riscv                            allyesconfig    gcc-14.1.0
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20241022    gcc-14.1.0
riscv                 randconfig-002-20241022    gcc-14.1.0
s390                             allmodconfig    gcc-14.1.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.1.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20241022    gcc-14.1.0
s390                  randconfig-002-20241022    gcc-14.1.0
sh                               allmodconfig    gcc-14.1.0
sh                                allnoconfig    gcc-14.1.0
sh                               allyesconfig    gcc-14.1.0
sh                        apsh4ad0a_defconfig    gcc-14.1.0
sh                                  defconfig    gcc-12
sh                        edosk7705_defconfig    gcc-14.1.0
sh                          landisk_defconfig    gcc-14.1.0
sh                    randconfig-001-20241022    gcc-14.1.0
sh                    randconfig-002-20241022    gcc-14.1.0
sh                  sh7785lcr_32bit_defconfig    gcc-14.1.0
sparc                            allmodconfig    gcc-14.1.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20241022    gcc-14.1.0
sparc64               randconfig-002-20241022    gcc-14.1.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20241022    gcc-14.1.0
um                    randconfig-002-20241022    gcc-14.1.0
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-18
x86_64                           allyesconfig    clang-18
x86_64      buildonly-randconfig-001-20241022    clang-18
x86_64      buildonly-randconfig-002-20241022    clang-18
x86_64      buildonly-randconfig-003-20241022    clang-18
x86_64      buildonly-randconfig-004-20241022    clang-18
x86_64      buildonly-randconfig-005-20241022    clang-18
x86_64      buildonly-randconfig-006-20241022    clang-18
x86_64                              defconfig    clang-18
x86_64                                  kexec    clang-18
x86_64                                  kexec    gcc-12
x86_64                randconfig-001-20241022    clang-18
x86_64                randconfig-002-20241022    clang-18
x86_64                randconfig-003-20241022    clang-18
x86_64                randconfig-004-20241022    clang-18
x86_64                randconfig-005-20241022    clang-18
x86_64                randconfig-006-20241022    clang-18
x86_64                randconfig-011-20241022    clang-18
x86_64                randconfig-012-20241022    clang-18
x86_64                randconfig-013-20241022    clang-18
x86_64                randconfig-014-20241022    clang-18
x86_64                randconfig-015-20241022    clang-18
x86_64                randconfig-016-20241022    clang-18
x86_64                randconfig-071-20241022    clang-18
x86_64                randconfig-072-20241022    clang-18
x86_64                randconfig-073-20241022    clang-18
x86_64                randconfig-074-20241022    clang-18
x86_64                randconfig-075-20241022    clang-18
x86_64                randconfig-076-20241022    clang-18
x86_64                               rhel-8.3    gcc-12
x86_64                           rhel-8.3-bpf    clang-18
x86_64                         rhel-8.3-kunit    clang-18
x86_64                           rhel-8.3-ltp    clang-18
x86_64                          rhel-8.3-rust    clang-18
xtensa                            allnoconfig    gcc-14.1.0
xtensa                randconfig-001-20241022    gcc-14.1.0
xtensa                randconfig-002-20241022    gcc-14.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
