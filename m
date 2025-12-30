Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67D7D2D9EF3
	for <linux-m68k@lists.linux-m68k.org>; Tue, 30 Dec 2025 01:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767057004; cv=none; b=pOuzAwGONnkHOqslTdBkgUetnLJ45HtV/hxQMiYZkyNDdh18EV7nYHYYO3qKWp97HfRyyVNtdjgfPuktHxgrwtewhNhPPkfhHmciWUsLl5AKS9NyTUNVPDHn1umFni8JWupnc82cJF1meLBrRuNtot5Y6BV71lJQCvXUcsEaH0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767057004; c=relaxed/simple;
	bh=IVemUSQre8j+M1zNN7Q4RnzIYf4+/sCnxMpt0ue7kjM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WEEqFRIz4e4f8Mvk0jNLWnAnuY7rtA/Sxbm4b1TbrkAo6Y95tBv4a5C7AllDqZotpq4anGxShRdAXqoAP4JxGFxQSIJW1WVRSWX/WFEfwP9Gnl2KHptfQrxNkdMcs2rSnu6FbCHuQtt42f4BXW6Mgt3h34eZDAowgsUN9GBUK+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SVF8+3MG; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SVF8+3MG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767057002; x=1798593002;
  h=date:from:to:cc:subject:message-id;
  bh=IVemUSQre8j+M1zNN7Q4RnzIYf4+/sCnxMpt0ue7kjM=;
  b=SVF8+3MGleEd4yxz8eojyED09EcwhK3TGDoWABupVRQiLHdZKNOjqJyk
   Gvakbe/QYQfsNzeDFNc/gnbuga5Vwdm8NjTUV8ry0qzDPWXjLg2VISv6j
   GO+re8GbydOTrv1yB1IrAiBcEwM5T+JS6UOo1qHXd6MSMRWYEpGQxfJMl
   LzqkWUxGvjmEhLgJbBs09rFnp537y0DPo2c4QXjiebIYGmY7WBMXglzLb
   JPMZj+v5SbC3+A/Url8m9dOZMU2KhTg/ZB9BENjcgfK5MkZ6iIq4lgtvm
   gSpx0h9L61k/rFoId2MRsS+NkGOHSsLMylq4HTyQyYoA6ur5RIG8VwJyP
   A==;
X-CSE-ConnectionGUID: L45FkAV4QWC9DLk+f9bfJw==
X-CSE-MsgGUID: eDenf8EeQZKkauwBBp8biw==
X-IronPort-AV: E=McAfee;i="6800,10657,11656"; a="80026517"
X-IronPort-AV: E=Sophos;i="6.21,187,1763452800"; 
   d="scan'208";a="80026517"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2025 17:10:01 -0800
X-CSE-ConnectionGUID: RZTvnTFPRayBexhLX9/esA==
X-CSE-MsgGUID: 46LnFm42SYa1NYpzqAqY8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,187,1763452800"; 
   d="scan'208";a="202009257"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 29 Dec 2025 17:09:59 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vaOFJ-000000008AL-1m5B;
	Tue, 30 Dec 2025 01:09:57 +0000
Date: Tue, 30 Dec 2025 09:09:00 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:master] BUILD SUCCESS
 5b740f72fc00738541fc856f777d02820c530fbd
Message-ID: <202512300954.8MBTJAhh-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git master
branch HEAD: 5b740f72fc00738541fc856f777d02820c530fbd  Merge tag 'v6.19-rc3'

elapsed time: 824m

configs tested: 168
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
arc                   randconfig-001-20251230    gcc-12.5.0
arc                   randconfig-002-20251230    gcc-9.5.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    gcc-15.1.0
arm                   randconfig-001-20251230    gcc-8.5.0
arm                   randconfig-002-20251230    gcc-8.5.0
arm                   randconfig-003-20251230    gcc-10.5.0
arm                   randconfig-004-20251230    gcc-8.5.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20251229    clang-22
arm64                 randconfig-002-20251229    clang-22
arm64                 randconfig-003-20251229    gcc-10.5.0
arm64                 randconfig-004-20251229    gcc-9.5.0
csky                             allmodconfig    gcc-15.1.0
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20251229    gcc-15.1.0
csky                  randconfig-002-20251229    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon               randconfig-001-20251229    clang-22
hexagon               randconfig-002-20251229    clang-22
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20251230    gcc-14
i386        buildonly-randconfig-002-20251230    clang-20
i386        buildonly-randconfig-003-20251230    clang-20
i386        buildonly-randconfig-004-20251230    clang-20
i386        buildonly-randconfig-005-20251230    clang-20
i386        buildonly-randconfig-006-20251230    clang-20
i386                                defconfig    clang-20
i386                  randconfig-001-20251229    gcc-14
i386                  randconfig-001-20251230    gcc-14
i386                  randconfig-002-20251229    clang-20
i386                  randconfig-002-20251230    clang-20
i386                  randconfig-003-20251229    clang-20
i386                  randconfig-003-20251230    clang-20
i386                  randconfig-004-20251229    clang-20
i386                  randconfig-004-20251230    clang-20
i386                  randconfig-005-20251230    clang-20
i386                  randconfig-006-20251230    clang-20
i386                  randconfig-007-20251230    clang-20
i386                  randconfig-011-20251230    gcc-14
i386                  randconfig-012-20251230    gcc-14
i386                  randconfig-013-20251230    clang-20
i386                  randconfig-014-20251230    gcc-12
i386                  randconfig-015-20251230    gcc-14
i386                  randconfig-016-20251230    gcc-14
i386                  randconfig-017-20251230    gcc-12
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20251229    clang-18
loongarch             randconfig-002-20251229    clang-18
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                             allmodconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                             allyesconfig    gcc-15.1.0
mips                      maltaaprp_defconfig    clang-22
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20251229    gcc-11.5.0
nios2                 randconfig-002-20251229    gcc-11.5.0
openrisc                         allmodconfig    gcc-15.1.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251229    gcc-13.4.0
parisc                randconfig-002-20251229    gcc-13.4.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                      arches_defconfig    gcc-15.1.0
powerpc                    ge_imp3a_defconfig    gcc-15.1.0
powerpc                   lite5200b_defconfig    clang-22
powerpc                         ps3_defconfig    gcc-15.1.0
powerpc               randconfig-001-20251229    gcc-12.5.0
powerpc               randconfig-002-20251229    clang-18
powerpc64             randconfig-001-20251229    clang-20
powerpc64             randconfig-002-20251229    clang-22
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-22
riscv                 randconfig-001-20251229    gcc-15.1.0
riscv                 randconfig-002-20251229    clang-20
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-22
s390                  randconfig-001-20251229    clang-22
s390                  randconfig-002-20251229    gcc-12.5.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                    randconfig-001-20251229    gcc-10.5.0
sh                    randconfig-002-20251229    gcc-15.1.0
sh                           se7712_defconfig    gcc-15.1.0
sh                   secureedge5410_defconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251230    gcc-8.5.0
sparc                 randconfig-002-20251230    gcc-11.5.0
sparc64                          allmodconfig    clang-22
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20251230    clang-22
sparc64               randconfig-002-20251230    clang-20
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251230    gcc-13
um                    randconfig-002-20251230    clang-18
um                           x86_64_defconfig    clang-22
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20251230    gcc-14
x86_64      buildonly-randconfig-002-20251230    gcc-14
x86_64      buildonly-randconfig-003-20251230    clang-20
x86_64      buildonly-randconfig-004-20251230    clang-20
x86_64      buildonly-randconfig-005-20251230    clang-20
x86_64      buildonly-randconfig-006-20251230    clang-20
x86_64                              defconfig    gcc-14
x86_64                randconfig-001-20251230    gcc-14
x86_64                randconfig-002-20251230    clang-20
x86_64                randconfig-003-20251230    clang-20
x86_64                randconfig-004-20251230    clang-20
x86_64                randconfig-005-20251230    clang-20
x86_64                randconfig-006-20251230    gcc-14
x86_64                randconfig-011-20251229    clang-20
x86_64                randconfig-012-20251229    gcc-14
x86_64                randconfig-013-20251229    clang-20
x86_64                randconfig-014-20251229    clang-20
x86_64                randconfig-015-20251229    clang-20
x86_64                randconfig-016-20251229    gcc-14
x86_64                randconfig-071-20251230    clang-20
x86_64                randconfig-072-20251230    clang-20
x86_64                randconfig-073-20251230    gcc-14
x86_64                randconfig-074-20251230    clang-20
x86_64                randconfig-075-20251230    clang-20
x86_64                randconfig-076-20251230    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                           allyesconfig    gcc-15.1.0
xtensa                randconfig-001-20251230    gcc-8.5.0
xtensa                randconfig-002-20251230    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
