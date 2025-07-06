Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23CB51F9F73
	for <linux-m68k@lists.linux-m68k.org>; Sun,  6 Jul 2025 23:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751843101; cv=none; b=UmNZofVtPnOzaoSDQnJea80Tr4YcqOrgOdj8CSfW/4UNF+PMkJwgus/8YUmo8D3Gk0ms+LmRIy/WOr10l3EVdFOTgDthnjrPHYD3ePdcJUXmLr1TmayUd5tbTH592Exurkg24tRqBUozGjnELiylBBCVwE0c+VgPKO2MNFAijqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751843101; c=relaxed/simple;
	bh=kETt6br5OfrKb+Exklt3CA6TZezBaA3suzOMabmWyEM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qEVV9XiZkNvR8ucczGaOwPHsdoRaVBK8Ek5NzQELPWLflFGpwmZFraWesiC41BXv2huh0GcIkUa37dsG/EaewEn2ZcFBemYi2RalogFdQ5i93fUUg0sEi+J4PRiOZVE3IxNRUT047vf587z2yYV6K9aVIWgb/u7RoZayS3Yo7OI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YkeUJeHt; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YkeUJeHt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751843100; x=1783379100;
  h=date:from:to:cc:subject:message-id;
  bh=kETt6br5OfrKb+Exklt3CA6TZezBaA3suzOMabmWyEM=;
  b=YkeUJeHt2lQ4EpEUNJuLrM3qsDd8wEufEypTRXuzzJ2nnylCirC23ned
   WgTvAhEt722wwU6vXOCvpfhA76CUGZCSJNv3C/JU0DiT9z0QM36Lyue1d
   sHMbQ7xPfZvINpQsnIVrEWQ+vERDYgDa/oC4qVcWKOuNRPDMWAFi7Y2/e
   qjVP93/XhQ69YD4GZ82fLGbRDPt47RGM5bLjvOlXtbqFCQtdTulTOWIh2
   0SGic+FaaOFWBJRKx8xzgzGdMmkDy39P8DLFUB+iq4KtHGLySrqcw7749
   PuZiDjb+45S557niGxdScmiaEEP+kI3HJKIyrHJuc6o8zoDCaOF3q875I
   w==;
X-CSE-ConnectionGUID: RrzooWz8RKKT0I54U4n4Cw==
X-CSE-MsgGUID: MmCNlxUBRXWhSa/EyIagWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11486"; a="53986687"
X-IronPort-AV: E=Sophos;i="6.16,292,1744095600"; 
   d="scan'208";a="53986687"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2025 16:04:56 -0700
X-CSE-ConnectionGUID: RmglZcAaRKihq9kAWwl7EA==
X-CSE-MsgGUID: /oTWVhXGR9mErdz+9EAKDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,292,1744095600"; 
   d="scan'208";a="154806820"
Received: from lkp-server01.sh.intel.com (HELO def1aeed4587) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 06 Jul 2025 16:04:56 -0700
Received: from kbuild by def1aeed4587 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uYYPl-00004j-1U;
	Sun, 06 Jul 2025 23:04:53 +0000
Date: Mon, 07 Jul 2025 07:03:56 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:master] BUILD SUCCESS
 f0638b4fd3769e4f39dd7b12b81dea456a5e1e40
Message-ID: <202507070743.AlOUd380-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git master
branch HEAD: f0638b4fd3769e4f39dd7b12b81dea456a5e1e40  m68k: mac: Improve clocksource driver commentary

elapsed time: 721m

configs tested: 135
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                                 defconfig    gcc-15.1.0
arc                   randconfig-001-20250706    gcc-8.5.0
arc                   randconfig-002-20250706    gcc-12.4.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-15.1.0
arm                                 defconfig    clang-21
arm                   randconfig-001-20250706    clang-21
arm                   randconfig-002-20250706    clang-21
arm                   randconfig-003-20250706    gcc-8.5.0
arm                   randconfig-004-20250706    gcc-14.3.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20250706    clang-21
arm64                 randconfig-002-20250706    clang-21
arm64                 randconfig-003-20250706    clang-17
arm64                 randconfig-004-20250706    gcc-9.5.0
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20250706    gcc-9.3.0
csky                  randconfig-002-20250706    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon                             defconfig    clang-21
hexagon               randconfig-001-20250706    clang-21
hexagon               randconfig-002-20250706    clang-18
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250706    gcc-12
i386        buildonly-randconfig-002-20250706    gcc-12
i386        buildonly-randconfig-003-20250706    clang-20
i386        buildonly-randconfig-004-20250706    clang-20
i386        buildonly-randconfig-005-20250706    gcc-12
i386        buildonly-randconfig-006-20250706    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-21
loongarch             randconfig-001-20250706    clang-18
loongarch             randconfig-002-20250706    clang-18
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    gcc-15.1.0
microblaze                       alldefconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20250706    gcc-9.3.0
nios2                 randconfig-002-20250706    gcc-13.3.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250706    gcc-15.1.0
parisc                randconfig-002-20250706    gcc-9.3.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-21
powerpc                     mpc5200_defconfig    clang-21
powerpc               randconfig-001-20250706    gcc-8.5.0
powerpc               randconfig-002-20250706    clang-21
powerpc               randconfig-003-20250706    clang-21
powerpc64             randconfig-001-20250706    gcc-8.5.0
powerpc64             randconfig-002-20250706    clang-17
powerpc64             randconfig-003-20250706    gcc-13.4.0
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-21
riscv             nommu_k210_sdcard_defconfig    gcc-15.1.0
riscv                    nommu_virt_defconfig    clang-21
riscv                 randconfig-001-20250706    gcc-11.5.0
riscv                 randconfig-002-20250706    clang-19
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-21
s390                  randconfig-001-20250706    gcc-8.5.0
s390                  randconfig-002-20250706    gcc-9.3.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                          polaris_defconfig    gcc-15.1.0
sh                    randconfig-001-20250706    gcc-14.3.0
sh                    randconfig-002-20250706    gcc-15.1.0
sh                           se7721_defconfig    gcc-15.1.0
sh                           sh2007_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250706    gcc-8.5.0
sparc                 randconfig-002-20250706    gcc-15.1.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20250706    gcc-10.5.0
sparc64               randconfig-002-20250706    clang-20
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250706    gcc-12
um                    randconfig-002-20250706    gcc-12
um                           x86_64_defconfig    clang-21
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250706    gcc-12
x86_64      buildonly-randconfig-002-20250706    gcc-12
x86_64      buildonly-randconfig-003-20250706    clang-20
x86_64      buildonly-randconfig-004-20250706    clang-20
x86_64      buildonly-randconfig-005-20250706    clang-20
x86_64      buildonly-randconfig-006-20250706    clang-20
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                  nommu_kc705_defconfig    gcc-15.1.0
xtensa                randconfig-001-20250706    gcc-8.5.0
xtensa                randconfig-002-20250706    gcc-10.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
