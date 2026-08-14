Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D9E91A23A6
	for <linux-m68k@lists.linux-m68k.org>; Fri, 14 Aug 2026 05:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786684854; cv=none; b=h7EsG9HbL3DYaOL0y9R+TAwufFJ8KBMsejG4n88SjHv+bH519YoBIvBAk56x+V3Kt/l2u/uTvoEGhWffK5O1HTrVgA+BX0WZKu2g3/IqgM2q3e1QP0fphLgWT/KEo5o4QLR+r+1+8pdqPmVm1BtyEYBJe6FiJ9CrgXpHIXmMEUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786684854; c=relaxed/simple;
	bh=rD8DlKz3V6/5oKu7AYRljR9Fq2HGo9nLZBiBmAXYFtw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Y3pzAaBAra08KAuw8Qk/cF0Xcx1N/1rLPeMEe+5H07JA3gHyaVs5QTk8S4lLtWVi1yc8//WnNRH80xL2s5RUGKGPFARq9LzviuThcLmWsRPa6SB/To/1ZqyRHy0RkWNa2MZOlHUvkZyYNjbdBxNVO9Tbp2dMgMhM0qSEjwTqvZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V6Zecr3k; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V6Zecr3k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786684853; x=1818220853;
  h=date:from:to:cc:subject:message-id;
  bh=rD8DlKz3V6/5oKu7AYRljR9Fq2HGo9nLZBiBmAXYFtw=;
  b=V6Zecr3k88dhRbjLLrei8ky3RjXzfjl5Eey34scbkyZvvf5SRPJXJtfY
   Kw+P0WpO4bJY21EUdm8yfnB6cJDMKOvfl0VBth+5v/cCKb1zPcFpTbCAP
   V4bUPtfIiMk3rj21PavJXiQ/6iO+FglTxs1nlpHTqzI75Nf+XQFtVDVyj
   b1RaXFZF65hmIp8sl5MjgamcWgAiYYco0nY7C4jOihZCPJvsd18Ayik+X
   fkcUPIueDCM6wXHbsP9j/TnZUkOOGlgw/U/yxN0cfws7OTDtuBUdlLQrQ
   d/q+aFpSlEXj94lRFu7R7dZ9liu3LM5WSkNilvGrOe8vwINFWamOk6KCY
   w==;
X-CSE-ConnectionGUID: 5AEYUjCzR86hqx8QDZdO+g==
X-CSE-MsgGUID: BoipbnX3SMK6Sn9nP+yoUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11874"; a="87189512"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; 
   d="scan'208";a="87189512"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2026 22:20:52 -0700
X-CSE-ConnectionGUID: svs9CheKSPaiWq7uNnL71g==
X-CSE-MsgGUID: 7MeJT9zYQLqYjxiHA7Pz1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; 
   d="scan'208";a="262384897"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 13 Aug 2026 22:20:51 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wukLZ-00000000XqY-09lT;
	Fri, 14 Aug 2026 05:20:49 +0000
Date: Fri, 14 Aug 2026 13:20:17 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:master] BUILD SUCCESS
 72cd0f7b1c0fbc889461845742f106803a6c1cf2
Message-ID: <202608141306.eL5itNqB-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git master
branch HEAD: 72cd0f7b1c0fbc889461845742f106803a6c1cf2  m68k: Define NR_CPUS to 1

elapsed time: 2480m

configs tested: 133
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allnoconfig    gcc-16.1.0
alpha                           allyesconfig    gcc-16.1.0
alpha                              defconfig    gcc-16.1.0
arc                             allmodconfig    gcc-16.1.0
arc                             allyesconfig    gcc-16.1.0
arc                           randconfig-001    gcc-13.4.0
arc                  randconfig-001-20260813    gcc-13.4.0
arc                  randconfig-001-20260814    gcc-10.5.0
arc                  randconfig-002-20260813    gcc-13.4.0
arc                  randconfig-002-20260814    gcc-10.5.0
arm                       keystone_defconfig    gcc-16.1.0
arm                  randconfig-001-20260813    gcc-13.4.0
arm                  randconfig-001-20260814    gcc-10.5.0
arm                  randconfig-002-20260813    gcc-13.4.0
arm                  randconfig-002-20260814    gcc-10.5.0
arm                  randconfig-003-20260813    gcc-13.4.0
arm                  randconfig-003-20260814    gcc-10.5.0
arm                  randconfig-004-20260813    gcc-13.4.0
arm                  randconfig-004-20260814    gcc-10.5.0
arm                       shmobile_defconfig    gcc-16.1.0
arm64                randconfig-001-20260813    gcc-16.1.0
arm64                randconfig-002-20260813    gcc-16.1.0
arm64                randconfig-003-20260813    gcc-16.1.0
arm64                randconfig-004-20260813    gcc-16.1.0
csky                            allmodconfig    gcc-16.1.0
csky                 randconfig-001-20260813    gcc-16.1.0
csky                 randconfig-002-20260813    gcc-16.1.0
hexagon              randconfig-001-20260813    gcc-11.5.0
hexagon              randconfig-002-20260813    gcc-11.5.0
i386                            allmodconfig    gcc-14
i386                buildonly-randconfig-001    gcc-14
i386       buildonly-randconfig-001-20260813    gcc-14
i386       buildonly-randconfig-001-20260814    clang-22
i386       buildonly-randconfig-002-20260813    gcc-14
i386       buildonly-randconfig-002-20260814    clang-22
i386       buildonly-randconfig-003-20260813    gcc-14
i386       buildonly-randconfig-003-20260814    clang-22
i386       buildonly-randconfig-004-20260813    gcc-14
i386       buildonly-randconfig-004-20260814    clang-22
i386       buildonly-randconfig-005-20260813    gcc-14
i386       buildonly-randconfig-005-20260814    clang-22
i386       buildonly-randconfig-006-20260813    gcc-14
i386       buildonly-randconfig-006-20260814    clang-22
i386                 randconfig-001-20260813    clang-22
i386                 randconfig-002-20260813    clang-22
i386                 randconfig-003-20260813    clang-22
i386                 randconfig-004-20260813    clang-22
i386                 randconfig-005-20260813    clang-22
i386                 randconfig-006-20260813    clang-22
i386                 randconfig-007-20260813    clang-22
i386                 randconfig-011-20260813    clang-22
i386                 randconfig-012-20260813    clang-22
i386                 randconfig-013-20260813    clang-22
i386                 randconfig-014-20260813    clang-22
i386                 randconfig-015-20260813    clang-22
i386                 randconfig-016-20260813    clang-22
i386                 randconfig-017-20260813    clang-22
loongarch                          defconfig    clang-24
loongarch            randconfig-001-20260813    gcc-11.5.0
loongarch            randconfig-002-20260813    gcc-11.5.0
nios2                           allmodconfig    gcc-11.5.0
nios2                            allnoconfig    gcc-11.5.0
nios2                randconfig-001-20260813    gcc-11.5.0
nios2                randconfig-002-20260813    gcc-11.5.0
parisc                          allmodconfig    gcc-16.1.0
parisc                          allyesconfig    gcc-16.1.0
parisc                             defconfig    gcc-16.1.0
parisc                        randconfig-001    gcc-10.5.0
parisc               randconfig-001-20260813    gcc-10.5.0
parisc               randconfig-002-20260813    gcc-10.5.0
powerpc                   adder875_defconfig    gcc-16.1.0
powerpc              randconfig-001-20260813    gcc-10.5.0
powerpc              randconfig-002-20260813    gcc-10.5.0
powerpc                    taishan_defconfig    clang-21
powerpc64            randconfig-001-20260813    gcc-10.5.0
powerpc64            randconfig-002-20260813    gcc-10.5.0
riscv                         randconfig-001    gcc-10.5.0
riscv                randconfig-001-20260813    gcc-10.5.0
riscv                randconfig-001-20260814    gcc-13.4.0
riscv                randconfig-002-20260813    gcc-10.5.0
riscv                randconfig-002-20260814    gcc-13.4.0
s390                 randconfig-001-20260813    gcc-10.5.0
s390                 randconfig-001-20260814    gcc-13.4.0
s390                 randconfig-002-20260813    gcc-10.5.0
s390                 randconfig-002-20260814    gcc-13.4.0
sh                                 defconfig    gcc-16.1.0
sh                   randconfig-001-20260813    gcc-10.5.0
sh                   randconfig-001-20260814    gcc-13.4.0
sh                   randconfig-002-20260813    gcc-10.5.0
sh                   randconfig-002-20260814    gcc-13.4.0
sparc                         randconfig-001    clang-20
sparc                randconfig-001-20260813    clang-20
sparc                randconfig-001-20260814    clang-24
sparc                randconfig-002-20260813    clang-20
sparc                randconfig-002-20260814    clang-24
sparc64              randconfig-001-20260813    clang-20
sparc64              randconfig-001-20260814    clang-24
sparc64              randconfig-002-20260813    clang-20
sparc64              randconfig-002-20260814    clang-24
um                   randconfig-001-20260813    clang-20
um                   randconfig-001-20260814    clang-24
um                   randconfig-002-20260813    clang-20
um                   randconfig-002-20260814    clang-24
x86_64     buildonly-randconfig-001-20260813    gcc-14
x86_64     buildonly-randconfig-002-20260813    gcc-14
x86_64     buildonly-randconfig-003-20260813    gcc-14
x86_64     buildonly-randconfig-004-20260813    gcc-14
x86_64     buildonly-randconfig-005-20260813    gcc-14
x86_64     buildonly-randconfig-006-20260813    gcc-14
x86_64                                 kexec    clang-22
x86_64               randconfig-001-20260813    gcc-13
x86_64               randconfig-002-20260813    gcc-13
x86_64               randconfig-003-20260813    gcc-13
x86_64               randconfig-004-20260813    gcc-13
x86_64               randconfig-005-20260813    gcc-13
x86_64               randconfig-006-20260813    gcc-13
x86_64               randconfig-011-20260813    gcc-14
x86_64               randconfig-012-20260813    gcc-14
x86_64               randconfig-013-20260813    gcc-14
x86_64               randconfig-014-20260813    gcc-14
x86_64               randconfig-015-20260813    gcc-14
x86_64               randconfig-016-20260813    gcc-14
x86_64               randconfig-071-20260813    gcc-14
x86_64               randconfig-072-20260813    gcc-14
x86_64               randconfig-073-20260813    gcc-14
x86_64               randconfig-074-20260813    gcc-14
x86_64               randconfig-075-20260813    gcc-14
x86_64               randconfig-076-20260813    gcc-14
x86_64                          rhel-9.4-bpf    gcc-14
xtensa               randconfig-001-20260813    clang-20
xtensa               randconfig-001-20260814    clang-24
xtensa               randconfig-002-20260813    clang-20
xtensa               randconfig-002-20260814    clang-24

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
