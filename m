Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87D8C342517
	for <linux-m68k@lists.linux-m68k.org>; Tue, 17 Mar 2026 19:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773776559; cv=none; b=DQviPiFo26IFj16c1dwkINQI+Ax1qgDaNqpfsi1IN8ZZvdNXADhwmzumFErNsv2NXPQu8aTg9kIimQAcn3T/hghFWGI06AKthp/zxqLB1K33Ndb1BFhU6rFPAGtrX/zB6uOmYgNhq7dtffOPIQyFJ2qf1dvSDm6G6tsKvBPgl2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773776559; c=relaxed/simple;
	bh=tZSsiFUDFD6ZHBl1AnYPiFpYVvY8CiVAGUtLDBrLICI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RelgHQLr/YYJKXJ1EB90mJLpuGGkSPZWlT3X0KsUdhca2K8dvpRlVTnHCSE59NoC8Zr1z4PusvEkOR+vM2ZIfwX1+9bsf/AczsRo5D0phiSHRqvngrmbIPZU4PdqSpKrgVvgCPSOH1zBrSHRS0ZuLVfm3mrwjpFnodYFUlW2HfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JxHK1DvX; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JxHK1DvX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773776557; x=1805312557;
  h=date:from:to:cc:subject:message-id;
  bh=tZSsiFUDFD6ZHBl1AnYPiFpYVvY8CiVAGUtLDBrLICI=;
  b=JxHK1DvXSa1ZEAJ28ajF0VENjPEP2bLafe99N/byAcR/uWDInxgEjHNW
   Mu3MAlWUuhmP3JxN/wjaZJsCk5UdKsUu9FcyqkbCSI/iHn3oCTmEGWqGL
   pI+CKdZLjjlqv+v+9OsSdM/O7RE7WH/ftz0Jzu1ULhT1haF5S2hhe2dAK
   JukrkuSzuZX8IIsMAIPJqzUZTEC73AJ/4mh9QSQx/9YLCOg0dTy6uvCjw
   pQxSvTtpi2RpG/9e6qpHgn0tN24GFLLKoVncrBF9zdbVa4SPtByKEkFR/
   Gl+nNi7TWIIQIctOGqcG11POkBBqfUhpxh0nkVUY61tE+s/cTnzcXvmWC
   g==;
X-CSE-ConnectionGUID: CsOPxoMWT46beX/QSneLVQ==
X-CSE-MsgGUID: 6ftOuo8aTMSy6tqnGQ/qMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="75006274"
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="75006274"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 12:42:36 -0700
X-CSE-ConnectionGUID: 2k7+SdlvSiSPgio9O1j0Qw==
X-CSE-MsgGUID: hBa+ZivRTseQ3+cAWsqh7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="219855427"
Received: from lkp-server01.sh.intel.com (HELO 63737dd503cb) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 17 Mar 2026 12:42:35 -0700
Received: from kbuild by 63737dd503cb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2aJE-000000001th-0WHA;
	Tue, 17 Mar 2026 19:42:32 +0000
Date: Wed, 18 Mar 2026 03:42:02 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:master] BUILD SUCCESS
 932a802090cf33ad91e86ba0688fd56b49b014b9
Message-ID: <202603180356.KuVuk3a3-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git master
branch HEAD: 932a802090cf33ad91e86ba0688fd56b49b014b9  Merge tag 'v7.0-rc4'

elapsed time: 1989m

configs tested: 187
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
arc                              allmodconfig    clang-16
arc                              allmodconfig    gcc-15.2.0
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    clang-23
arc                              allyesconfig    gcc-15.2.0
arc                   randconfig-001-20260317    clang-23
arc                   randconfig-002-20260317    clang-23
arm                               allnoconfig    clang-23
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                              allyesconfig    gcc-15.2.0
arm                   randconfig-001-20260317    clang-23
arm                   randconfig-002-20260317    clang-23
arm                   randconfig-003-20260317    clang-23
arm                   randconfig-004-20260317    clang-23
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-15.2.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    clang-23
hexagon                           allnoconfig    gcc-15.2.0
hexagon               randconfig-001-20260317    gcc-8.5.0
hexagon               randconfig-002-20260317    gcc-8.5.0
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20260317    clang-20
i386        buildonly-randconfig-002-20260317    clang-20
i386        buildonly-randconfig-003-20260317    clang-20
i386        buildonly-randconfig-004-20260317    clang-20
i386        buildonly-randconfig-005-20260317    clang-20
i386        buildonly-randconfig-006-20260317    clang-20
i386                  randconfig-001-20260317    gcc-14
i386                  randconfig-002-20260317    gcc-14
i386                  randconfig-003-20260317    gcc-14
i386                  randconfig-004-20260317    gcc-14
i386                  randconfig-005-20260317    gcc-14
i386                  randconfig-006-20260317    gcc-14
i386                  randconfig-007-20260317    gcc-14
i386                  randconfig-011-20260317    clang-20
i386                  randconfig-012-20260317    clang-20
i386                  randconfig-013-20260317    clang-20
i386                  randconfig-014-20260317    clang-20
i386                  randconfig-015-20260317    clang-20
i386                  randconfig-016-20260317    clang-20
i386                  randconfig-017-20260317    clang-20
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260317    gcc-8.5.0
loongarch             randconfig-002-20260317    gcc-8.5.0
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                             allyesconfig    gcc-15.2.0
m68k                                defconfig    clang-19
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
mips                 decstation_r4k_defconfig    gcc-15.2.0
nios2                            allmodconfig    clang-23
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-23
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260317    gcc-8.5.0
nios2                 randconfig-002-20260317    gcc-8.5.0
openrisc                         allmodconfig    clang-23
openrisc                         allmodconfig    gcc-15.2.0
openrisc                          allnoconfig    clang-23
openrisc                          allnoconfig    gcc-15.2.0
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-23
parisc                            allnoconfig    gcc-15.2.0
parisc                           allyesconfig    clang-19
parisc                           allyesconfig    gcc-15.2.0
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260317    gcc-11.5.0
parisc                randconfig-001-20260317    gcc-8.5.0
parisc                randconfig-002-20260317    gcc-14.3.0
parisc                randconfig-002-20260317    gcc-8.5.0
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc                           allnoconfig    gcc-15.2.0
powerpc               randconfig-001-20260317    gcc-8.5.0
powerpc               randconfig-002-20260317    clang-23
powerpc               randconfig-002-20260317    gcc-8.5.0
powerpc64             randconfig-001-20260317    gcc-8.5.0
powerpc64             randconfig-002-20260317    clang-23
powerpc64             randconfig-002-20260317    gcc-8.5.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260317    gcc-10.5.0
riscv                 randconfig-002-20260317    gcc-10.5.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260317    gcc-10.5.0
s390                  randconfig-002-20260317    gcc-10.5.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    clang-19
sh                               allyesconfig    gcc-15.2.0
sh                                  defconfig    gcc-14
sh                                  defconfig    gcc-15.2.0
sh                    randconfig-001-20260317    gcc-10.5.0
sh                    randconfig-002-20260317    gcc-10.5.0
sparc                             allnoconfig    clang-23
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260317    gcc-12.5.0
sparc                 randconfig-002-20260317    gcc-12.5.0
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    clang-20
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260317    gcc-12.5.0
sparc64               randconfig-002-20260317    gcc-12.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    clang-23
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260317    gcc-12.5.0
um                    randconfig-002-20260317    gcc-12.5.0
um                           x86_64_defconfig    clang-23
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260317    clang-20
x86_64      buildonly-randconfig-002-20260317    gcc-14
x86_64      buildonly-randconfig-003-20260317    clang-20
x86_64      buildonly-randconfig-004-20260317    clang-20
x86_64      buildonly-randconfig-005-20260317    clang-20
x86_64      buildonly-randconfig-006-20260317    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260317    clang-20
x86_64                randconfig-002-20260317    clang-20
x86_64                randconfig-003-20260317    clang-20
x86_64                randconfig-004-20260317    clang-20
x86_64                randconfig-005-20260317    clang-20
x86_64                randconfig-006-20260317    clang-20
x86_64                randconfig-011-20260317    clang-20
x86_64                randconfig-012-20260317    clang-20
x86_64                randconfig-013-20260317    clang-20
x86_64                randconfig-014-20260317    clang-20
x86_64                randconfig-015-20260317    clang-20
x86_64                randconfig-016-20260317    clang-20
x86_64                randconfig-071-20260317    clang-20
x86_64                randconfig-072-20260317    clang-20
x86_64                randconfig-073-20260317    clang-20
x86_64                randconfig-074-20260317    clang-20
x86_64                randconfig-075-20260317    clang-20
x86_64                randconfig-076-20260317    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-23
xtensa                            allnoconfig    gcc-15.2.0
xtensa                           allyesconfig    clang-23
xtensa                randconfig-001-20260317    gcc-12.5.0
xtensa                randconfig-002-20260317    gcc-12.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
