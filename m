Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA25C2A1B2
	for <linux-m68k@lists.linux-m68k.org>; Tue,  7 Apr 2026 01:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775524243; cv=none; b=K4ELN6bgP6GAGxNT63+OLE1nrd8klBXm6GEIbTeVuFW5Gwji/rsRPKyxQd5njihJCeorfxJ/BvE66M5xI1VtwHlzOkA3rOzBnkUBMtHC6oSW7SQX0VotM2B4/mxnBshCm325TefVyWkpXCj1LgxPmpNsGxgRGIuqbqgXb7l8WPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775524243; c=relaxed/simple;
	bh=vaUrKEP7mESegwzmzoWlzzbnKduisG1ywhxe01RBlrg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=L8DxpHZaV1RHWOYB0VpO5GNM/Nm9oK62cbJoXip8E3KD7/JoIdW0JR05fiOfd+DrwMZmNXF92TqsHaQA+YwrOZSXEpQ11plD7cjKqLbnFNClLIXCNJjTA7N/XK7jcQGfNZBp8qHE/gHhWTcd8WM9dqyGZx+milQi2kFHSqwLxP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QzMFw0tI; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QzMFw0tI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775524242; x=1807060242;
  h=date:from:to:cc:subject:message-id;
  bh=vaUrKEP7mESegwzmzoWlzzbnKduisG1ywhxe01RBlrg=;
  b=QzMFw0tItc5i9qNFGBWhoN4evgUxikZsdgvzGVA5QcttlIlcwLEd4CDN
   dbIcNLcLoPmcYu8VKEU1JJnNU9KPZkY7RfPOgAO5g9FmnCr6knEpcujxE
   QzC8VmgamY0L6gKIHJgRhYDvjO9Nx8JnSAk5drEABnRfYFKVhN/qVshqW
   wXTdMla3NcwvKSvS3tqD5w/piV47aHe0gCN+rstQcR9p2sQ+hnsavalWj
   +isR82MK7f5A5YMKau0F0Zrm4+Q32jQOobpsJVzUHIqfO7Npz1hXA9qXD
   +KYvgz05nV4+YEg5BOwW01JG5bR7IpcFSs0Tg6CJ2WZCQKeO8Qv4fgCy1
   g==;
X-CSE-ConnectionGUID: enmIrT71Q2Wd4+REkl4Dew==
X-CSE-MsgGUID: nYzbfAh5Se6i1vEa9uoH/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="75653607"
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="75653607"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2026 18:10:41 -0700
X-CSE-ConnectionGUID: DNcHLr6gRWySBHoOE5Cv1A==
X-CSE-MsgGUID: H48nN80NQaKPVA14LpO+mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="223222577"
Received: from lkp-server01.sh.intel.com (HELO 3afb7d003cac) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 06 Apr 2026 18:10:39 -0700
Received: from kbuild by 3afb7d003cac with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w9uxg-000000003RJ-2w1j;
	Tue, 07 Apr 2026 01:10:36 +0000
Date: Tue, 07 Apr 2026 09:10:25 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:master] BUILD SUCCESS
 a1f784b1201fd5e74421c39ba7a551e38b1ae5e9
Message-ID: <202604070916.0jytmIOp-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git master
branch HEAD: a1f784b1201fd5e74421c39ba7a551e38b1ae5e9  Merge tag 'v7.0-rc7'

elapsed time: 964m

configs tested: 174
configs skipped: 24

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    clang-16
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    gcc-15.2.0
arc                                 defconfig    gcc-15.2.0
arc                   randconfig-001-20260406    gcc-10.5.0
arc                   randconfig-002-20260406    gcc-10.5.0
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                                 defconfig    gcc-15.2.0
arm                   randconfig-001-20260406    clang-17
arm                   randconfig-002-20260406    clang-23
arm                   randconfig-003-20260406    clang-23
arm                   randconfig-004-20260406    gcc-13.4.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260406    gcc-10.5.0
arm64                 randconfig-002-20260406    gcc-10.5.0
arm64                 randconfig-003-20260406    gcc-10.5.0
arm64                 randconfig-004-20260406    gcc-10.5.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260406    gcc-10.5.0
csky                  randconfig-002-20260406    gcc-10.5.0
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260406    clang-23
hexagon               randconfig-002-20260406    clang-23
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20260406    gcc-14
i386        buildonly-randconfig-002-20260406    gcc-14
i386        buildonly-randconfig-003-20260406    gcc-14
i386        buildonly-randconfig-004-20260406    gcc-14
i386        buildonly-randconfig-005-20260406    gcc-14
i386        buildonly-randconfig-006-20260406    gcc-14
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260406    clang-20
i386                  randconfig-002-20260406    clang-20
i386                  randconfig-003-20260406    clang-20
i386                  randconfig-004-20260406    clang-20
i386                  randconfig-005-20260406    clang-20
i386                  randconfig-006-20260406    clang-20
i386                  randconfig-007-20260406    clang-20
i386                  randconfig-011-20260406    gcc-14
i386                  randconfig-012-20260406    gcc-14
i386                  randconfig-013-20260406    gcc-14
i386                  randconfig-014-20260406    gcc-14
i386                  randconfig-015-20260406    gcc-14
i386                  randconfig-016-20260406    gcc-14
i386                  randconfig-017-20260406    gcc-14
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260406    clang-23
loongarch             randconfig-002-20260406    clang-23
loongarch             randconfig-002-20260406    gcc-15.2.0
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                                defconfig    clang-19
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
mips                      loongson3_defconfig    gcc-15.2.0
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-23
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260406    clang-23
nios2                 randconfig-001-20260406    gcc-11.5.0
nios2                 randconfig-002-20260406    clang-23
nios2                 randconfig-002-20260406    gcc-8.5.0
openrisc                         allmodconfig    gcc-11.5.0
openrisc                          allnoconfig    clang-23
openrisc                          allnoconfig    gcc-15.2.0
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-23
parisc                            allnoconfig    gcc-15.2.0
parisc                           allyesconfig    gcc-15.2.0
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260406    clang-23
parisc                randconfig-001-20260406    gcc-15.2.0
parisc                randconfig-002-20260406    clang-23
parisc                randconfig-002-20260406    gcc-8.5.0
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc                           allnoconfig    gcc-15.2.0
powerpc               randconfig-001-20260406    clang-20
powerpc               randconfig-001-20260406    clang-23
powerpc               randconfig-002-20260406    clang-18
powerpc               randconfig-002-20260406    clang-23
powerpc64             randconfig-001-20260406    clang-23
powerpc64             randconfig-001-20260406    gcc-14.3.0
powerpc64             randconfig-002-20260406    clang-23
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260406    gcc-8.5.0
riscv                 randconfig-002-20260406    gcc-8.5.0
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260406    gcc-8.5.0
s390                  randconfig-002-20260406    gcc-8.5.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    gcc-15.2.0
sh                                  defconfig    gcc-14
sh                    randconfig-001-20260406    gcc-8.5.0
sh                    randconfig-002-20260406    gcc-8.5.0
sparc                             allnoconfig    clang-23
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260406    gcc-11.5.0
sparc                 randconfig-002-20260406    gcc-15.2.0
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260406    clang-23
sparc64               randconfig-002-20260406    gcc-12.5.0
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260406    clang-17
um                    randconfig-002-20260406    clang-23
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-002-20260406    gcc-14
x86_64      buildonly-randconfig-003-20260406    gcc-14
x86_64      buildonly-randconfig-005-20260406    gcc-14
x86_64      buildonly-randconfig-006-20260406    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-002-20260406    gcc-14
x86_64                randconfig-005-20260406    gcc-14
x86_64                randconfig-006-20260406    gcc-14
x86_64                randconfig-011-20260406    gcc-14
x86_64                randconfig-014-20260406    gcc-14
x86_64                randconfig-016-20260406    gcc-14
x86_64                randconfig-071-20260406    clang-20
x86_64                randconfig-072-20260406    clang-20
x86_64                randconfig-073-20260406    clang-20
x86_64                randconfig-074-20260406    clang-20
x86_64                randconfig-075-20260406    gcc-13
x86_64                randconfig-076-20260406    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-23
xtensa                            allnoconfig    gcc-15.2.0
xtensa                randconfig-001-20260406    gcc-12.5.0
xtensa                randconfig-002-20260406    gcc-13.4.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
