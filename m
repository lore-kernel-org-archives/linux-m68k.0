Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A09B0288B1
	for <linux-m68k@lists.linux-m68k.org>; Mon,  9 Mar 2026 23:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773100003; cv=none; b=RSZvc5jp8OaVHEBDzxN3hn8GtJjiB7r9QpIsxbRU+JEVXrlEwsaTzrlf6dzdje+C5u/eyVBbKKZu1PD9cg5zj0TWcftWnezy1ABX4eC8+5IOzSGrvIKsc9CEgdD6tNW+weegDeG0a5ZL+o2AjVmAkRl+9EJtHfTg1kSUE9TAXlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773100003; c=relaxed/simple;
	bh=7rFt6M2xjyI8hUl6rHu28b4z7kN2GUavz8QnbJSz8gs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gJKgz03IGHx0f5iOWUzpXxtv24BURtiw4w5MWUjvaOT5ICHe8v6M6KATskL4MSr3JYtEUxn4uciF+jAmU6hwFCO0bcBohY88MuGljRS2wzPeqvbNM2liupss6T7Paw5JWHqTYfYekfOSHEI/kXrgy1T6HWqgOcikkf9PRx6jKFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k8zb/2rO; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k8zb/2rO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773100001; x=1804636001;
  h=date:from:to:cc:subject:message-id;
  bh=7rFt6M2xjyI8hUl6rHu28b4z7kN2GUavz8QnbJSz8gs=;
  b=k8zb/2rOF4Z03KQaaYTLmuliLhkxe3b7bnHNGL+U3rIQ+UkSQRdAuaU6
   wobi0q+ws0EkLBdvkWSfYlNyHmErP+60nStXLYb4XZAOz06w5aD6jXqut
   QuQq/iOF7mHsgtcaa4TdpDWA2agEcB3gfQedTGfSa9x55+boVTZM2K/KZ
   KhHiHlRLQmw1Dr0vT9xgVlwbeOGTbCr6VZM7t+MQ4rcrZlNpECW7BN2rY
   DJHx4TLwNnKdfduohAmH/G5KpZEa6DFM1AmuRd5SpVr/iIu2YdYmUaw10
   Megd9Smb1q1QaD3C7AsBphAO0QQOIVfPdLou1p0GCe5kQfTbCSuEeOoE+
   g==;
X-CSE-ConnectionGUID: q8o9DPnPTtCrPXFlxPUF7g==
X-CSE-MsgGUID: 5lYll7HVQ2yJ0buZ4Z0T+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="73336743"
X-IronPort-AV: E=Sophos;i="6.23,111,1770624000"; 
   d="scan'208";a="73336743"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2026 16:46:39 -0700
X-CSE-ConnectionGUID: DUa1EO4xSb+Cr6eDcUVeoA==
X-CSE-MsgGUID: SmJct27VQEmsMs4XngHZmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,111,1770624000"; 
   d="scan'208";a="224613773"
Received: from lkp-server01.sh.intel.com (HELO 434e41ea3c86) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 09 Mar 2026 16:46:38 -0700
Received: from kbuild by 434e41ea3c86 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vzkJ1-000000000yq-1sXj;
	Mon, 09 Mar 2026 23:46:35 +0000
Date: Tue, 10 Mar 2026 07:46:34 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:master] BUILD SUCCESS
 fab8e068199a17ab8cb2ba47cc6f09d79bbf785a
Message-ID: <202603100725.URPj7zxI-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git master
branch HEAD: fab8e068199a17ab8cb2ba47cc6f09d79bbf785a  Merge tag 'v7.0-rc3'

elapsed time: 809m

configs tested: 335
configs skipped: 8

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    clang-16
arc                              allmodconfig    gcc-15.2.0
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    clang-23
arc                              allyesconfig    gcc-15.2.0
arc                                 defconfig    gcc-15.2.0
arc                   randconfig-001-20260309    clang-17
arc                   randconfig-001-20260309    gcc-11.5.0
arc                   randconfig-001-20260310    gcc-8.5.0
arc                   randconfig-002-20260309    clang-17
arc                   randconfig-002-20260309    gcc-14.3.0
arc                   randconfig-002-20260310    gcc-8.5.0
arm                               allnoconfig    clang-23
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                              allyesconfig    gcc-15.2.0
arm                                 defconfig    clang-23
arm                                 defconfig    gcc-15.2.0
arm                   randconfig-001-20260309    clang-16
arm                   randconfig-001-20260309    clang-17
arm                   randconfig-001-20260310    gcc-8.5.0
arm                   randconfig-002-20260309    clang-17
arm                   randconfig-002-20260310    gcc-8.5.0
arm                   randconfig-003-20260309    clang-17
arm                   randconfig-003-20260309    clang-23
arm                   randconfig-003-20260310    gcc-8.5.0
arm                   randconfig-004-20260309    clang-17
arm                   randconfig-004-20260309    gcc-10.5.0
arm                   randconfig-004-20260310    gcc-8.5.0
arm                         s3c6400_defconfig    gcc-15.2.0
arm                           sama7_defconfig    clang-23
arm64                            allmodconfig    clang-19
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260309    clang-20
arm64                 randconfig-001-20260309    clang-23
arm64                 randconfig-001-20260310    gcc-11.5.0
arm64                 randconfig-002-20260309    clang-23
arm64                 randconfig-002-20260310    gcc-11.5.0
arm64                 randconfig-003-20260309    clang-23
arm64                 randconfig-003-20260310    gcc-11.5.0
arm64                 randconfig-004-20260309    clang-23
arm64                 randconfig-004-20260310    gcc-11.5.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260309    clang-23
csky                  randconfig-001-20260309    gcc-14.3.0
csky                  randconfig-001-20260310    gcc-11.5.0
csky                  randconfig-002-20260309    clang-23
csky                  randconfig-002-20260309    gcc-13.4.0
csky                  randconfig-002-20260310    gcc-11.5.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    clang-23
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    clang-23
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260309    clang-19
hexagon               randconfig-001-20260309    gcc-15.2.0
hexagon               randconfig-001-20260310    gcc-11.5.0
hexagon               randconfig-002-20260309    clang-23
hexagon               randconfig-002-20260309    gcc-15.2.0
hexagon               randconfig-002-20260310    gcc-11.5.0
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20260309    clang-20
i386        buildonly-randconfig-001-20260310    clang-20
i386        buildonly-randconfig-002-20260309    clang-20
i386        buildonly-randconfig-002-20260310    clang-20
i386        buildonly-randconfig-003-20260309    clang-20
i386        buildonly-randconfig-003-20260310    clang-20
i386        buildonly-randconfig-004-20260309    clang-20
i386        buildonly-randconfig-004-20260310    clang-20
i386        buildonly-randconfig-005-20260309    clang-20
i386        buildonly-randconfig-005-20260309    gcc-14
i386        buildonly-randconfig-005-20260310    clang-20
i386        buildonly-randconfig-006-20260309    clang-20
i386        buildonly-randconfig-006-20260310    clang-20
i386                                defconfig    clang-20
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260309    gcc-14
i386                  randconfig-001-20260310    clang-20
i386                  randconfig-002-20260309    clang-20
i386                  randconfig-002-20260309    gcc-14
i386                  randconfig-002-20260310    clang-20
i386                  randconfig-003-20260309    gcc-14
i386                  randconfig-003-20260310    clang-20
i386                  randconfig-004-20260309    gcc-14
i386                  randconfig-004-20260310    clang-20
i386                  randconfig-005-20260309    gcc-14
i386                  randconfig-005-20260310    clang-20
i386                  randconfig-006-20260309    gcc-14
i386                  randconfig-006-20260310    clang-20
i386                  randconfig-007-20260309    gcc-12
i386                  randconfig-007-20260309    gcc-14
i386                  randconfig-007-20260310    clang-20
i386                  randconfig-011-20260309    clang-20
i386                  randconfig-011-20260309    gcc-14
i386                  randconfig-011-20260310    clang-20
i386                  randconfig-012-20260309    clang-20
i386                  randconfig-012-20260310    clang-20
i386                  randconfig-013-20260309    clang-20
i386                  randconfig-013-20260309    gcc-14
i386                  randconfig-013-20260310    clang-20
i386                  randconfig-014-20260309    clang-20
i386                  randconfig-014-20260309    gcc-14
i386                  randconfig-014-20260310    clang-20
i386                  randconfig-015-20260309    clang-20
i386                  randconfig-015-20260309    gcc-14
i386                  randconfig-015-20260310    clang-20
i386                  randconfig-016-20260309    clang-20
i386                  randconfig-016-20260310    clang-20
i386                  randconfig-017-20260309    clang-20
i386                  randconfig-017-20260310    clang-20
loongarch                        allmodconfig    clang-19
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260309    gcc-13.4.0
loongarch             randconfig-001-20260309    gcc-15.2.0
loongarch             randconfig-001-20260310    gcc-11.5.0
loongarch             randconfig-002-20260309    gcc-15.2.0
loongarch             randconfig-002-20260310    gcc-11.5.0
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                             allyesconfig    gcc-15.2.0
m68k                                defconfig    clang-19
m68k                                defconfig    gcc-15.2.0
m68k                        stmark2_defconfig    gcc-15.2.0
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
microblaze                          defconfig    gcc-15.2.0
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
mips                           ip28_defconfig    gcc-15.2.0
nios2                            allmodconfig    clang-23
nios2                             allnoconfig    clang-23
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20260309    gcc-10.5.0
nios2                 randconfig-001-20260309    gcc-15.2.0
nios2                 randconfig-001-20260310    gcc-11.5.0
nios2                 randconfig-002-20260309    gcc-11.5.0
nios2                 randconfig-002-20260309    gcc-15.2.0
nios2                 randconfig-002-20260310    gcc-11.5.0
openrisc                         allmodconfig    clang-23
openrisc                          allnoconfig    clang-23
openrisc                          allnoconfig    gcc-15.2.0
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-23
parisc                            allnoconfig    gcc-15.2.0
parisc                           allyesconfig    clang-19
parisc                           allyesconfig    gcc-15.2.0
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260309    gcc-8.5.0
parisc                randconfig-001-20260310    gcc-15.2.0
parisc                randconfig-002-20260309    gcc-14.3.0
parisc                randconfig-002-20260309    gcc-8.5.0
parisc                randconfig-002-20260310    gcc-15.2.0
parisc64                            defconfig    clang-19
parisc64                            defconfig    gcc-15.2.0
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc                           allnoconfig    gcc-15.2.0
powerpc               randconfig-001-20260309    gcc-14.3.0
powerpc               randconfig-001-20260309    gcc-8.5.0
powerpc               randconfig-001-20260310    gcc-15.2.0
powerpc               randconfig-002-20260309    clang-23
powerpc               randconfig-002-20260309    gcc-8.5.0
powerpc               randconfig-002-20260310    gcc-15.2.0
powerpc64             randconfig-001-20260309    gcc-11.5.0
powerpc64             randconfig-001-20260309    gcc-8.5.0
powerpc64             randconfig-001-20260310    gcc-15.2.0
powerpc64             randconfig-002-20260309    clang-23
powerpc64             randconfig-002-20260309    gcc-8.5.0
powerpc64             randconfig-002-20260310    gcc-15.2.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-23
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260309    gcc-12.5.0
riscv                 randconfig-001-20260309    gcc-8.5.0
riscv                 randconfig-001-20260310    gcc-15.2.0
riscv                 randconfig-002-20260309    clang-23
riscv                 randconfig-002-20260309    gcc-8.5.0
riscv                 randconfig-002-20260310    gcc-15.2.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    clang-23
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260309    gcc-8.5.0
s390                  randconfig-001-20260310    gcc-15.2.0
s390                  randconfig-002-20260309    gcc-8.5.0
s390                  randconfig-002-20260309    gcc-9.5.0
s390                  randconfig-002-20260310    gcc-15.2.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    clang-19
sh                               allyesconfig    gcc-15.2.0
sh                                  defconfig    gcc-14
sh                                  defconfig    gcc-15.2.0
sh                    randconfig-001-20260309    gcc-13.4.0
sh                    randconfig-001-20260309    gcc-8.5.0
sh                    randconfig-001-20260310    gcc-15.2.0
sh                    randconfig-002-20260309    gcc-8.5.0
sh                    randconfig-002-20260309    gcc-9.5.0
sh                    randconfig-002-20260310    gcc-15.2.0
sparc                             allnoconfig    clang-23
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260309    gcc-12.5.0
sparc                 randconfig-001-20260309    gcc-13.4.0
sparc                 randconfig-001-20260310    gcc-12.5.0
sparc                 randconfig-002-20260309    gcc-13.4.0
sparc                 randconfig-002-20260310    gcc-12.5.0
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    clang-20
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260309    clang-23
sparc64               randconfig-001-20260309    gcc-13.4.0
sparc64               randconfig-001-20260310    gcc-12.5.0
sparc64               randconfig-002-20260309    clang-20
sparc64               randconfig-002-20260309    gcc-13.4.0
sparc64               randconfig-002-20260310    gcc-12.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    clang-23
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260309    clang-23
um                    randconfig-001-20260309    gcc-13.4.0
um                    randconfig-001-20260310    gcc-12.5.0
um                    randconfig-002-20260309    gcc-13.4.0
um                    randconfig-002-20260309    gcc-14
um                    randconfig-002-20260310    gcc-12.5.0
um                           x86_64_defconfig    clang-23
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260309    gcc-14
x86_64      buildonly-randconfig-001-20260310    gcc-14
x86_64      buildonly-randconfig-002-20260309    gcc-14
x86_64      buildonly-randconfig-002-20260310    gcc-14
x86_64      buildonly-randconfig-003-20260309    clang-20
x86_64      buildonly-randconfig-003-20260309    gcc-14
x86_64      buildonly-randconfig-003-20260310    gcc-14
x86_64      buildonly-randconfig-004-20260309    gcc-14
x86_64      buildonly-randconfig-004-20260310    gcc-14
x86_64      buildonly-randconfig-005-20260309    gcc-14
x86_64      buildonly-randconfig-005-20260310    gcc-14
x86_64      buildonly-randconfig-006-20260309    clang-20
x86_64      buildonly-randconfig-006-20260309    gcc-14
x86_64      buildonly-randconfig-006-20260310    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260309    clang-20
x86_64                randconfig-001-20260309    gcc-13
x86_64                randconfig-001-20260310    clang-20
x86_64                randconfig-002-20260309    gcc-13
x86_64                randconfig-002-20260310    clang-20
x86_64                randconfig-003-20260309    gcc-13
x86_64                randconfig-003-20260309    gcc-14
x86_64                randconfig-003-20260310    clang-20
x86_64                randconfig-004-20260309    clang-20
x86_64                randconfig-004-20260309    gcc-13
x86_64                randconfig-004-20260310    clang-20
x86_64                randconfig-005-20260309    gcc-13
x86_64                randconfig-005-20260309    gcc-14
x86_64                randconfig-005-20260310    clang-20
x86_64                randconfig-006-20260309    gcc-13
x86_64                randconfig-006-20260309    gcc-14
x86_64                randconfig-006-20260310    clang-20
x86_64                randconfig-011-20260309    gcc-14
x86_64                randconfig-011-20260310    clang-20
x86_64                randconfig-012-20260309    gcc-14
x86_64                randconfig-012-20260310    clang-20
x86_64                randconfig-013-20260309    gcc-14
x86_64                randconfig-013-20260310    clang-20
x86_64                randconfig-014-20260309    gcc-14
x86_64                randconfig-014-20260310    clang-20
x86_64                randconfig-015-20260309    gcc-14
x86_64                randconfig-015-20260310    clang-20
x86_64                randconfig-016-20260309    gcc-14
x86_64                randconfig-016-20260310    clang-20
x86_64                randconfig-071-20260309    gcc-14
x86_64                randconfig-071-20260310    clang-20
x86_64                randconfig-072-20260309    gcc-14
x86_64                randconfig-072-20260310    clang-20
x86_64                randconfig-073-20260309    gcc-14
x86_64                randconfig-073-20260310    clang-20
x86_64                randconfig-074-20260309    clang-20
x86_64                randconfig-074-20260309    gcc-14
x86_64                randconfig-074-20260310    clang-20
x86_64                randconfig-075-20260309    gcc-14
x86_64                randconfig-075-20260310    clang-20
x86_64                randconfig-076-20260309    gcc-14
x86_64                randconfig-076-20260310    clang-20
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
xtensa                randconfig-001-20260309    gcc-13.4.0
xtensa                randconfig-001-20260310    gcc-12.5.0
xtensa                randconfig-002-20260309    gcc-13.4.0
xtensa                randconfig-002-20260310    gcc-12.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
