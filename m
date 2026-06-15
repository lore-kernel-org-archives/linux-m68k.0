Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D13921DB95E
	for <linux-m68k@lists.linux-m68k.org>; Mon, 15 Jun 2026 23:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781567232; cv=none; b=RwKFZsVpzSE68EBQTiDAZLCnBmjVyCphBZcqa47maDeWtmP7dL7oZP1aEivXl+uKMiMiX8Ixm2u6ZdZmEJrir9pJ520kaLojQLW2tpTHjg1FlZPQhkzcMlevKPyeLc9LmenbAlq8QWZFM/IrmnPrvnlFwO+o/XcZsJEpfkIQ7ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781567232; c=relaxed/simple;
	bh=hAJgUZJKneaLOnyZLJXqWFGIdGvYxfd9MZb4mqvuV+o=;
	h=Date:From:To:Cc:Subject:Message-ID; b=G5yfnYZ83+RnLdNXmx+RjZh8zEARR7nb5ye/A+LarhigS3LEKCw+JPoTZZxBcx2bxsw2NoVDmkzj04eEvhgR/oCcOZWe5+VYwm2SfN/35/Kcdn8XjyBU+/UFmOPLA44jn7gy4axAvw6duWASbX6/xHuf4XSZYMRCmWXTAEKIo8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AszxUvN7; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AszxUvN7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781567230; x=1813103230;
  h=date:from:to:cc:subject:message-id;
  bh=hAJgUZJKneaLOnyZLJXqWFGIdGvYxfd9MZb4mqvuV+o=;
  b=AszxUvN7SL6uSOuePfGSsOhJVwpVfsvvAcsCdUKV6fAttOhkabyvqRwo
   reNfyGPfKbwGkxvTRIIFCCXzqHieQ4nxhPX5RPah3+yGRzXVxZzKPoxFe
   QXqMK+FhxsaOoSEqWzZzKS+gbkFvb1Xrawr+A41VeEsukGuBh8otW/y6t
   c/I+w0U1lvj4uJ7KOQ5Iq3QNgLxyZymQqaW0uhwmW7HJMDkgrLva0UpIY
   wnTYjf72TejMRVmRlM6Ev8KPE2/iUkhY+5J22HPwyEInq0sl5BrVaSh8y
   1T404N4XYvhl+kk3++/fBi1lsth570spBuQFrg7WCL6jA+Ckm2Cqi85TB
   g==;
X-CSE-ConnectionGUID: o+oQTvC3TXWFr+SzgnGRQQ==
X-CSE-MsgGUID: qrDb5nvKTfKe114AVZsiHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="107750894"
X-IronPort-AV: E=Sophos;i="6.24,207,1774335600"; 
   d="scan'208";a="107750894"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2026 16:47:09 -0700
X-CSE-ConnectionGUID: y7ASfVrIQfm4ebJG71OdOw==
X-CSE-MsgGUID: TVGCwk6+RJKarAi8NjOwXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,207,1774335600"; 
   d="scan'208";a="247667015"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 15 Jun 2026 16:47:08 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wZH1F-00000000SSy-2ndZ;
	Mon, 15 Jun 2026 23:47:05 +0000
Date: Tue, 16 Jun 2026 07:46:26 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:master] BUILD SUCCESS
 270bca1d65c48b4774c19f6961ad3e9b737b5694
Message-ID: <202606160717.2kdAzRfO-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git master
branch HEAD: 270bca1d65c48b4774c19f6961ad3e9b737b5694  Merge tag 'v7.1'

elapsed time: 830m

configs tested: 313
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-16.1.0
alpha                            allyesconfig    gcc-16.1.0
alpha                               defconfig    gcc-16.1.0
arc                              allmodconfig    clang-23
arc                              allmodconfig    gcc-16.1.0
arc                               allnoconfig    gcc-16.1.0
arc                              allyesconfig    clang-23
arc                              allyesconfig    gcc-16.1.0
arc                                 defconfig    gcc-16.1.0
arc                            randconfig-001    gcc-10.5.0
arc                   randconfig-001-20260615    gcc-10.5.0
arc                   randconfig-001-20260616    gcc-9.5.0
arc                            randconfig-002    gcc-10.5.0
arc                   randconfig-002-20260615    gcc-10.5.0
arc                   randconfig-002-20260616    gcc-9.5.0
arm                               allnoconfig    gcc-16.1.0
arm                              allyesconfig    clang-23
arm                              allyesconfig    gcc-16.1.0
arm                                 defconfig    gcc-16.1.0
arm                         orion5x_defconfig    clang-21
arm                            randconfig-001    gcc-10.5.0
arm                   randconfig-001-20260615    gcc-10.5.0
arm                   randconfig-001-20260616    gcc-9.5.0
arm                            randconfig-002    gcc-10.5.0
arm                   randconfig-002-20260615    gcc-10.5.0
arm                   randconfig-002-20260616    gcc-9.5.0
arm                            randconfig-003    gcc-10.5.0
arm                   randconfig-003-20260615    gcc-10.5.0
arm                   randconfig-003-20260616    gcc-9.5.0
arm                            randconfig-004    gcc-10.5.0
arm                   randconfig-004-20260615    gcc-10.5.0
arm                   randconfig-004-20260616    gcc-9.5.0
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-16.1.0
arm64                               defconfig    gcc-16.1.0
arm64                          randconfig-001    clang-23
arm64                 randconfig-001-20260615    clang-23
arm64                 randconfig-001-20260615    gcc-10.5.0
arm64                          randconfig-002    clang-23
arm64                 randconfig-002-20260615    clang-23
arm64                 randconfig-002-20260615    gcc-10.5.0
arm64                          randconfig-003    clang-23
arm64                 randconfig-003-20260615    clang-23
arm64                 randconfig-003-20260615    gcc-10.5.0
arm64                          randconfig-004    clang-23
arm64                 randconfig-004-20260615    clang-23
arm64                 randconfig-004-20260615    gcc-10.5.0
csky                             allmodconfig    gcc-16.1.0
csky                              allnoconfig    gcc-16.1.0
csky                                defconfig    gcc-16.1.0
csky                           randconfig-001    clang-23
csky                  randconfig-001-20260615    clang-23
csky                  randconfig-001-20260615    gcc-10.5.0
csky                           randconfig-002    clang-23
csky                  randconfig-002-20260615    clang-23
csky                  randconfig-002-20260615    gcc-10.5.0
hexagon                          allmodconfig    gcc-16.1.0
hexagon                           allnoconfig    gcc-16.1.0
hexagon                             defconfig    gcc-16.1.0
hexagon               randconfig-001-20260615    clang-18
hexagon               randconfig-002-20260615    clang-18
i386                             allmodconfig    clang-22
i386                              allnoconfig    gcc-16.1.0
i386                             allyesconfig    clang-22
i386        buildonly-randconfig-001-20260615    clang-22
i386        buildonly-randconfig-001-20260616    clang-22
i386        buildonly-randconfig-002-20260615    clang-22
i386        buildonly-randconfig-002-20260616    clang-22
i386        buildonly-randconfig-003-20260615    clang-22
i386        buildonly-randconfig-003-20260616    clang-22
i386        buildonly-randconfig-004-20260615    clang-22
i386        buildonly-randconfig-004-20260616    clang-22
i386        buildonly-randconfig-005-20260615    clang-22
i386        buildonly-randconfig-005-20260616    clang-22
i386        buildonly-randconfig-006-20260615    clang-22
i386        buildonly-randconfig-006-20260616    clang-22
i386                                defconfig    gcc-16.1.0
i386                  randconfig-001-20260615    clang-22
i386                  randconfig-001-20260616    gcc-14
i386                  randconfig-002-20260615    clang-22
i386                  randconfig-002-20260616    gcc-14
i386                  randconfig-003-20260615    clang-22
i386                  randconfig-003-20260616    gcc-14
i386                  randconfig-004-20260615    clang-22
i386                  randconfig-004-20260616    gcc-14
i386                  randconfig-005-20260615    clang-22
i386                  randconfig-005-20260616    gcc-14
i386                  randconfig-006-20260615    clang-22
i386                  randconfig-006-20260616    gcc-14
i386                  randconfig-007-20260615    clang-22
i386                  randconfig-007-20260616    gcc-14
i386                  randconfig-011-20260615    gcc-14
i386                  randconfig-011-20260616    clang-22
i386                  randconfig-012-20260615    gcc-14
i386                  randconfig-012-20260616    clang-22
i386                  randconfig-013-20260615    gcc-14
i386                  randconfig-013-20260616    clang-22
i386                  randconfig-014-20260615    gcc-14
i386                  randconfig-014-20260616    clang-22
i386                  randconfig-015-20260615    gcc-14
i386                  randconfig-015-20260616    clang-22
i386                  randconfig-016-20260615    gcc-14
i386                  randconfig-016-20260616    clang-22
i386                  randconfig-017-20260615    gcc-14
i386                  randconfig-017-20260616    clang-22
loongarch                        allmodconfig    clang-19
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    gcc-16.1.0
loongarch                           defconfig    clang-23
loongarch             randconfig-001-20260615    clang-18
loongarch             randconfig-002-20260615    clang-18
m68k                             allmodconfig    gcc-16.1.0
m68k                              allnoconfig    gcc-16.1.0
m68k                             allyesconfig    clang-23
m68k                             allyesconfig    gcc-16.1.0
m68k                                defconfig    clang-23
m68k                                defconfig    gcc-16.1.0
microblaze                        allnoconfig    gcc-16.1.0
microblaze                       allyesconfig    gcc-16.1.0
microblaze                          defconfig    clang-23
microblaze                          defconfig    gcc-16.1.0
mips                             allmodconfig    gcc-16.1.0
mips                              allnoconfig    gcc-16.1.0
mips                             allyesconfig    gcc-16.1.0
nios2                            allmodconfig    clang-20
nios2                             allnoconfig    clang-23
nios2                               defconfig    clang-23
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20260615    clang-18
nios2                 randconfig-002-20260615    clang-18
openrisc                         allmodconfig    clang-20
openrisc                          allnoconfig    clang-23
openrisc                            defconfig    gcc-16.1.0
parisc                           allmodconfig    gcc-16.1.0
parisc                            allnoconfig    clang-23
parisc                           allyesconfig    clang-17
parisc                           allyesconfig    clang-23
parisc                              defconfig    gcc-16.1.0
parisc                         randconfig-001    gcc-13.4.0
parisc                randconfig-001-20260615    gcc-13.4.0
parisc                randconfig-001-20260616    gcc-8.5.0
parisc                         randconfig-002    gcc-13.4.0
parisc                randconfig-002-20260615    gcc-13.4.0
parisc                randconfig-002-20260616    gcc-8.5.0
parisc64                            defconfig    clang-23
parisc64                            defconfig    gcc-16.1.0
powerpc                          allmodconfig    gcc-16.1.0
powerpc                           allnoconfig    clang-23
powerpc                      pmac32_defconfig    clang-23
powerpc                        randconfig-001    gcc-13.4.0
powerpc               randconfig-001-20260615    gcc-13.4.0
powerpc               randconfig-001-20260616    gcc-8.5.0
powerpc                        randconfig-002    gcc-13.4.0
powerpc               randconfig-002-20260615    gcc-13.4.0
powerpc               randconfig-002-20260616    gcc-8.5.0
powerpc64                      randconfig-001    gcc-13.4.0
powerpc64             randconfig-001-20260615    gcc-13.4.0
powerpc64             randconfig-001-20260616    gcc-8.5.0
powerpc64                      randconfig-002    gcc-13.4.0
powerpc64             randconfig-002-20260615    gcc-13.4.0
powerpc64             randconfig-002-20260616    gcc-8.5.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                            allyesconfig    clang-23
riscv                               defconfig    gcc-16.1.0
riscv                          randconfig-001    gcc-16.1.0
riscv                 randconfig-001-20260615    gcc-16.1.0
riscv                 randconfig-001-20260616    gcc-16.1.0
riscv                          randconfig-002    gcc-16.1.0
riscv                 randconfig-002-20260615    gcc-16.1.0
riscv                 randconfig-002-20260616    gcc-16.1.0
s390                             allmodconfig    clang-17
s390                             allmodconfig    clang-23
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-16.1.0
s390                                defconfig    gcc-16.1.0
s390                           randconfig-001    gcc-16.1.0
s390                  randconfig-001-20260615    gcc-16.1.0
s390                  randconfig-001-20260616    gcc-16.1.0
s390                           randconfig-002    gcc-16.1.0
s390                  randconfig-002-20260615    gcc-16.1.0
s390                  randconfig-002-20260616    gcc-16.1.0
sh                               allmodconfig    gcc-16.1.0
sh                                allnoconfig    clang-23
sh                               allyesconfig    clang-17
sh                               allyesconfig    clang-23
sh                                  defconfig    gcc-14
sh                             randconfig-001    gcc-16.1.0
sh                    randconfig-001-20260615    gcc-16.1.0
sh                    randconfig-001-20260616    gcc-16.1.0
sh                             randconfig-002    gcc-16.1.0
sh                    randconfig-002-20260615    gcc-16.1.0
sh                    randconfig-002-20260616    gcc-16.1.0
sparc                             allnoconfig    clang-23
sparc                               defconfig    gcc-16.1.0
sparc                 randconfig-001-20260615    gcc-15.2.0
sparc                 randconfig-001-20260616    gcc-8.5.0
sparc                 randconfig-002-20260615    gcc-15.2.0
sparc                 randconfig-002-20260616    gcc-8.5.0
sparc64                          allmodconfig    clang-20
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260615    gcc-15.2.0
sparc64               randconfig-001-20260616    gcc-8.5.0
sparc64               randconfig-002-20260615    gcc-15.2.0
sparc64               randconfig-002-20260616    gcc-8.5.0
um                               allmodconfig    clang-17
um                               allmodconfig    clang-23
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-16.1.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260615    gcc-15.2.0
um                    randconfig-001-20260616    gcc-8.5.0
um                    randconfig-002-20260615    gcc-15.2.0
um                    randconfig-002-20260616    gcc-8.5.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-22
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-22
x86_64               buildonly-randconfig-001    clang-22
x86_64      buildonly-randconfig-001-20260615    clang-22
x86_64      buildonly-randconfig-001-20260616    gcc-14
x86_64               buildonly-randconfig-002    clang-22
x86_64      buildonly-randconfig-002-20260615    clang-22
x86_64      buildonly-randconfig-002-20260616    gcc-14
x86_64               buildonly-randconfig-003    clang-22
x86_64      buildonly-randconfig-003-20260615    clang-22
x86_64      buildonly-randconfig-003-20260616    gcc-14
x86_64               buildonly-randconfig-004    clang-22
x86_64      buildonly-randconfig-004-20260615    clang-22
x86_64      buildonly-randconfig-004-20260616    gcc-14
x86_64               buildonly-randconfig-005    clang-22
x86_64      buildonly-randconfig-005-20260615    clang-22
x86_64      buildonly-randconfig-005-20260616    gcc-14
x86_64               buildonly-randconfig-006    clang-22
x86_64      buildonly-randconfig-006-20260615    clang-22
x86_64      buildonly-randconfig-006-20260616    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-22
x86_64                randconfig-001-20260615    clang-22
x86_64                randconfig-001-20260616    clang-22
x86_64                randconfig-002-20260615    clang-22
x86_64                randconfig-002-20260616    clang-22
x86_64                randconfig-003-20260615    clang-22
x86_64                randconfig-003-20260616    clang-22
x86_64                randconfig-004-20260615    clang-22
x86_64                randconfig-004-20260616    clang-22
x86_64                randconfig-005-20260615    clang-22
x86_64                randconfig-005-20260616    clang-22
x86_64                randconfig-006-20260615    clang-22
x86_64                randconfig-006-20260616    clang-22
x86_64                         randconfig-011    clang-22
x86_64                randconfig-011-20260615    clang-22
x86_64                randconfig-011-20260615    gcc-14
x86_64                randconfig-011-20260616    clang-22
x86_64                         randconfig-012    clang-22
x86_64                randconfig-012-20260615    clang-22
x86_64                randconfig-012-20260616    clang-22
x86_64                         randconfig-013    clang-22
x86_64                randconfig-013-20260615    clang-22
x86_64                randconfig-013-20260616    clang-22
x86_64                         randconfig-014    clang-22
x86_64                randconfig-014-20260615    clang-22
x86_64                randconfig-014-20260616    clang-22
x86_64                         randconfig-015    clang-22
x86_64                randconfig-015-20260615    clang-22
x86_64                randconfig-015-20260615    gcc-14
x86_64                randconfig-015-20260616    clang-22
x86_64                         randconfig-016    clang-22
x86_64                randconfig-016-20260615    clang-22
x86_64                randconfig-016-20260615    gcc-14
x86_64                randconfig-016-20260616    clang-22
x86_64                         randconfig-071    gcc-13
x86_64                randconfig-071-20260615    gcc-13
x86_64                randconfig-071-20260615    gcc-14
x86_64                randconfig-071-20260616    gcc-14
x86_64                         randconfig-072    gcc-13
x86_64                randconfig-072-20260615    clang-22
x86_64                randconfig-072-20260615    gcc-13
x86_64                randconfig-072-20260615    gcc-14
x86_64                randconfig-072-20260616    gcc-14
x86_64                         randconfig-073    gcc-13
x86_64                randconfig-073-20260615    clang-22
x86_64                randconfig-073-20260615    gcc-13
x86_64                randconfig-073-20260615    gcc-14
x86_64                randconfig-073-20260616    gcc-14
x86_64                         randconfig-074    gcc-13
x86_64                randconfig-074-20260615    gcc-13
x86_64                randconfig-074-20260615    gcc-14
x86_64                randconfig-074-20260616    gcc-14
x86_64                         randconfig-075    gcc-13
x86_64                randconfig-075-20260615    clang-22
x86_64                randconfig-075-20260615    gcc-13
x86_64                randconfig-075-20260615    gcc-14
x86_64                randconfig-075-20260616    gcc-14
x86_64                         randconfig-076    gcc-13
x86_64                randconfig-076-20260615    clang-22
x86_64                randconfig-076-20260615    gcc-13
x86_64                randconfig-076-20260615    gcc-14
x86_64                randconfig-076-20260616    gcc-14
x86_64                               rhel-9.4    clang-22
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-22
x86_64                    rhel-9.4-kselftests    clang-22
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-22
xtensa                            allnoconfig    clang-23
xtensa                           allyesconfig    clang-20
xtensa                randconfig-001-20260615    gcc-15.2.0
xtensa                randconfig-001-20260616    gcc-8.5.0
xtensa                randconfig-002-20260615    gcc-15.2.0
xtensa                randconfig-002-20260616    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
