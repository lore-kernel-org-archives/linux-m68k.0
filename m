Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDF6726F296
	for <linux-m68k@lists.linux-m68k.org>; Tue, 27 Jan 2026 01:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769477544; cv=none; b=lbpCM1iCT7oRVWRDMgHP4KwS0v3R1ZDwn/mY6hClJfBdTS0RRuacjpjHRdnlU8uc5U4BKWnQ5Vo0NEBqsidHMjvpmiBZwB56qMLKtXjaY+dzOEG29nsn56MP8HurWI8y7JFjxlTRkgGFQ7eyc6uvyqcBJ+IG8hGgyxfu6Ha+VzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769477544; c=relaxed/simple;
	bh=i7siO1+DXThkPLO3P/RktXtpQX0WFnrz99pFPZ8gkqc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sEadv5YDnh6PJRH81NHlt3+Zd0zOQKJpM1Zy4kSkoQ3yoQtn7nG6EMEinnCrjuJwGjLXyk81hU54tlvADqyXb6tHCiWVG2ND6vyGMA2NjDQRmtbNUOU4g+UjjRZc7p2Z0Z9r+DFwMNvW0tXyAGG2RbmqYgwCHL+NvIAHRLVT0ZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HsuG6plK; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HsuG6plK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769477542; x=1801013542;
  h=date:from:to:cc:subject:message-id;
  bh=i7siO1+DXThkPLO3P/RktXtpQX0WFnrz99pFPZ8gkqc=;
  b=HsuG6plK3Fl8cOMdkB93VZOi91HOrkncqgh9jKZh1oVHIc33Alrki2Nd
   0UjAiSzbAcwO+K/cFmDhvjRrmwNr14nzL2W7te2EM/17zO2Owj3KphroI
   QzIZgaidKZnj6xXbpmxQqvRCOr+No1NMTYLWMQ2oQZypw4jUw+focWSPq
   VPcavq6SDofn6dhyZkxSHzkdkI1Vx2rDKjlZSSG5eYJlN9P05ZiIpI+EW
   40hcWQiQlQZLBx5zefX6XfjF6THyVaAxydekR8vFBUZpQtkuopT9Y3Yd8
   r6UiTV7dEl8PKaaSFGWqJV/v5u9pGijlix6DorA4mlyZq7McvhXQINT78
   w==;
X-CSE-ConnectionGUID: wMxDENC7SNiWvgnNQ4acjQ==
X-CSE-MsgGUID: 1WoMiHuiRa2ylJm0A8SIQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="88240259"
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="88240259"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 17:32:20 -0800
X-CSE-ConnectionGUID: P1Mp072GSeWnEI4shFXxRQ==
X-CSE-MsgGUID: dKHh3yGCSdWVA+iNlIYfsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="207893357"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 26 Jan 2026 17:32:18 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkXwF-00000000XqQ-2QEn;
	Tue, 27 Jan 2026 01:32:15 +0000
Date: Tue, 27 Jan 2026 09:31:33 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:master] BUILD SUCCESS
 f2693a92627bad63deaee86b1b68b72da8654dbd
Message-ID: <202601270927.ysaDof46-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git master
branch HEAD: f2693a92627bad63deaee86b1b68b72da8654dbd  m68k: sun3: Replace vsprintf() with bounded vsnprintf()

elapsed time: 818m

configs tested: 254
configs skipped: 13

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    clang-16
arc                              allmodconfig    gcc-15.2.0
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    clang-22
arc                                 defconfig    gcc-15.2.0
arc                   randconfig-001-20260126    gcc-10.5.0
arc                   randconfig-001-20260127    gcc-14.3.0
arc                   randconfig-002-20260126    gcc-10.5.0
arc                   randconfig-002-20260127    gcc-14.3.0
arm                               allnoconfig    clang-22
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                              allyesconfig    gcc-15.2.0
arm                                 defconfig    gcc-15.2.0
arm                   randconfig-001-20260126    gcc-10.5.0
arm                   randconfig-001-20260127    gcc-14.3.0
arm                   randconfig-002-20260126    gcc-10.5.0
arm                   randconfig-002-20260127    gcc-14.3.0
arm                   randconfig-003-20260126    gcc-10.5.0
arm                   randconfig-003-20260127    gcc-14.3.0
arm                   randconfig-004-20260126    gcc-10.5.0
arm                   randconfig-004-20260127    gcc-14.3.0
arm                           u8500_defconfig    gcc-15.2.0
arm64                            allmodconfig    clang-22
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260126    gcc-15.2.0
arm64                 randconfig-001-20260127    gcc-15.2.0
arm64                 randconfig-002-20260126    gcc-15.2.0
arm64                 randconfig-002-20260127    gcc-15.2.0
arm64                 randconfig-003-20260126    gcc-15.2.0
arm64                 randconfig-003-20260127    gcc-15.2.0
arm64                 randconfig-004-20260126    gcc-15.2.0
arm64                 randconfig-004-20260127    gcc-15.2.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260126    gcc-15.2.0
csky                  randconfig-001-20260127    gcc-15.2.0
csky                  randconfig-002-20260126    gcc-15.2.0
csky                  randconfig-002-20260127    gcc-15.2.0
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    clang-22
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260127    gcc-15.2.0
hexagon               randconfig-002-20260127    gcc-15.2.0
i386                             allmodconfig    clang-20
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20260126    clang-20
i386        buildonly-randconfig-001-20260127    gcc-14
i386        buildonly-randconfig-002-20260126    clang-20
i386        buildonly-randconfig-002-20260127    gcc-14
i386        buildonly-randconfig-003-20260126    clang-20
i386        buildonly-randconfig-003-20260127    gcc-14
i386        buildonly-randconfig-004-20260126    clang-20
i386        buildonly-randconfig-004-20260127    gcc-14
i386        buildonly-randconfig-005-20260126    clang-20
i386        buildonly-randconfig-005-20260127    gcc-14
i386        buildonly-randconfig-006-20260126    clang-20
i386        buildonly-randconfig-006-20260127    gcc-14
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260126    gcc-14
i386                  randconfig-002-20260126    gcc-14
i386                  randconfig-003-20260126    gcc-14
i386                  randconfig-004-20260126    gcc-14
i386                  randconfig-005-20260126    gcc-14
i386                  randconfig-007-20260126    gcc-14
i386                  randconfig-011-20260127    gcc-14
i386                  randconfig-012-20260127    gcc-14
i386                  randconfig-013-20260127    gcc-14
i386                  randconfig-014-20260127    gcc-14
i386                  randconfig-015-20260127    gcc-14
i386                  randconfig-016-20260127    gcc-14
i386                  randconfig-017-20260127    gcc-14
loongarch                        allmodconfig    clang-22
loongarch                         allnoconfig    clang-22
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260127    gcc-15.2.0
loongarch             randconfig-002-20260127    gcc-15.2.0
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                             allyesconfig    gcc-15.2.0
m68k                       bvme6000_defconfig    gcc-15.2.0
m68k                                defconfig    clang-19
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
mips                           ip22_defconfig    gcc-15.2.0
nios2                            allmodconfig    clang-22
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260127    gcc-15.2.0
nios2                 randconfig-002-20260127    gcc-15.2.0
openrisc                         allmodconfig    clang-22
openrisc                         allmodconfig    gcc-15.2.0
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.2.0
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.2.0
parisc                           allyesconfig    clang-19
parisc                           allyesconfig    gcc-15.2.0
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260127    gcc-11.5.0
parisc                randconfig-002-20260127    gcc-11.5.0
parisc64                         alldefconfig    gcc-15.2.0
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.2.0
powerpc                      pcm030_defconfig    gcc-15.2.0
powerpc                     powernv_defconfig    clang-22
powerpc                      ppc44x_defconfig    clang-22
powerpc               randconfig-001-20260127    gcc-11.5.0
powerpc               randconfig-002-20260127    gcc-11.5.0
powerpc                     tqm8540_defconfig    gcc-15.2.0
powerpc                     tqm8548_defconfig    gcc-15.2.0
powerpc64             randconfig-001-20260127    gcc-11.5.0
powerpc64             randconfig-002-20260127    gcc-11.5.0
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260126    gcc-9.5.0
riscv                 randconfig-001-20260127    clang-22
riscv                 randconfig-002-20260126    gcc-9.5.0
riscv                 randconfig-002-20260127    clang-22
riscv                 randconfig-002-20260127    gcc-13.4.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.2.0
s390                          debug_defconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260126    gcc-9.5.0
s390                  randconfig-001-20260127    clang-22
s390                  randconfig-001-20260127    gcc-13.4.0
s390                  randconfig-002-20260126    gcc-9.5.0
s390                  randconfig-002-20260127    clang-22
s390                  randconfig-002-20260127    gcc-13.4.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-22
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    clang-19
sh                               allyesconfig    gcc-15.2.0
sh                                  defconfig    gcc-14
sh                        edosk7760_defconfig    clang-22
sh                            migor_defconfig    gcc-15.2.0
sh                    randconfig-001-20260126    gcc-9.5.0
sh                    randconfig-001-20260127    clang-22
sh                    randconfig-001-20260127    gcc-13.4.0
sh                    randconfig-002-20260126    gcc-9.5.0
sh                    randconfig-002-20260127    clang-22
sh                    randconfig-002-20260127    gcc-13.4.0
sh                   rts7751r2dplus_defconfig    clang-22
sh                           se7724_defconfig    clang-22
sparc                            alldefconfig    gcc-15.2.0
sparc                             allnoconfig    clang-22
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260127    gcc-15.2.0
sparc                 randconfig-002-20260127    gcc-15.2.0
sparc64                          allmodconfig    clang-22
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260127    gcc-15.2.0
sparc64               randconfig-002-20260127    gcc-15.2.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260127    gcc-15.2.0
um                    randconfig-002-20260127    gcc-15.2.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-22
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260127    gcc-14
x86_64      buildonly-randconfig-002-20260127    gcc-14
x86_64      buildonly-randconfig-003-20260127    gcc-14
x86_64      buildonly-randconfig-004-20260127    gcc-14
x86_64      buildonly-randconfig-005-20260127    gcc-14
x86_64      buildonly-randconfig-006-20260127    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260126    gcc-14
x86_64                randconfig-001-20260127    clang-20
x86_64                randconfig-002-20260126    clang-20
x86_64                randconfig-002-20260126    gcc-14
x86_64                randconfig-002-20260127    clang-20
x86_64                randconfig-003-20260126    clang-20
x86_64                randconfig-003-20260126    gcc-14
x86_64                randconfig-003-20260127    clang-20
x86_64                randconfig-004-20260126    clang-20
x86_64                randconfig-004-20260126    gcc-14
x86_64                randconfig-004-20260127    clang-20
x86_64                randconfig-005-20260126    gcc-14
x86_64                randconfig-005-20260127    clang-20
x86_64                randconfig-006-20260126    clang-20
x86_64                randconfig-006-20260126    gcc-14
x86_64                randconfig-006-20260127    clang-20
x86_64                randconfig-011-20260126    gcc-14
x86_64                randconfig-011-20260127    clang-20
x86_64                randconfig-012-20260126    gcc-14
x86_64                randconfig-012-20260127    clang-20
x86_64                randconfig-013-20260126    gcc-14
x86_64                randconfig-013-20260127    clang-20
x86_64                randconfig-014-20260126    gcc-14
x86_64                randconfig-014-20260127    clang-20
x86_64                randconfig-015-20260126    gcc-14
x86_64                randconfig-015-20260127    clang-20
x86_64                randconfig-016-20260126    gcc-14
x86_64                randconfig-016-20260127    clang-20
x86_64                randconfig-071-20260126    gcc-14
x86_64                randconfig-071-20260127    gcc-14
x86_64                randconfig-072-20260126    gcc-14
x86_64                randconfig-072-20260127    gcc-14
x86_64                randconfig-073-20260126    gcc-14
x86_64                randconfig-073-20260127    gcc-14
x86_64                randconfig-074-20260126    gcc-14
x86_64                randconfig-074-20260127    gcc-14
x86_64                randconfig-075-20260126    gcc-14
x86_64                randconfig-075-20260127    gcc-14
x86_64                randconfig-076-20260127    gcc-14
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-22
xtensa                            allnoconfig    gcc-15.2.0
xtensa                           allyesconfig    clang-22
xtensa                  audio_kc705_defconfig    gcc-15.2.0
xtensa                       common_defconfig    gcc-15.2.0
xtensa                randconfig-001-20260127    gcc-15.2.0
xtensa                randconfig-002-20260127    gcc-15.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
