Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FB26C2ED
	for <linux-m68k@lists.linux-m68k.org>; Tue, 30 Apr 2024 05:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714456590; cv=none; b=fH2pmAVjb0LZY9jVuFWdZEgeV/PmqCkpnSRkxvPO/tFs5r1eOlEytwS0cgTDVmDzomI/vGtSnEsRdek6cKaZkSTtnRZ9pugFjjQv60jFL2Qrp+F88ONiOGjDaacoGe/9sOAFC6AzTdm6QJbryxGCJiWMKVZMhhIfAXZuVcgWpHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714456590; c=relaxed/simple;
	bh=rLzpC5UvtCsxcQPI6CV9kb381T4RKIVZ8t6Tf4vdOmw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ekIV4iJ/E7S6mmndr+jNF+cFW5mHXPHplyBR6AHPqTfOe5kxaTaLpiPpZGitRmj5nHVZTXZtI6md7DjK4tK5onKDA9qPrz2Twm7aHy5rgklUQ8jFwJAv8hTdXvnxlLVtBFB2zV3Yb7hZFfPpEgtnRg5gzXHgfWgL+R//zF1QE/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HfAJVlBC; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HfAJVlBC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714456588; x=1745992588;
  h=date:from:to:cc:subject:message-id;
  bh=rLzpC5UvtCsxcQPI6CV9kb381T4RKIVZ8t6Tf4vdOmw=;
  b=HfAJVlBCDDBpBPf8nRj6IIud+iEr5w5KxWicY8gkIox5Uj1vXMEUj6/f
   3aGhnyZ8fuY7mumeu7z3j4D1K07j7bmUS6lv4r+HH77bBtquJzRFn/qY6
   eOnthAIsoFf3nL7VeU4DeafDMjvdxYOmO5F1SsL9ZZhXHple+pKlOqUFp
   DRTwfXjlM9FMM5OqNPG+yYYmLJ3DuIZGRd2G1o+aTuQCbZdsGL901Tsbx
   yfJK8gmJcpjY0rRXgCbUQ1tR6SVso5UOWjDg/Ao60WEXoMBfYUq38NWud
   aU6pA0SMo6pxpy2mcwR1+lHwbHlarSVHFG4c1JkeKzA34MqgXfEhYuhEl
   A==;
X-CSE-ConnectionGUID: IKMLaT7MStuqqHCTd0KFQw==
X-CSE-MsgGUID: /NkxOsNUSq2fasm9qdfOWw==
X-IronPort-AV: E=McAfee;i="6600,9927,11059"; a="10020986"
X-IronPort-AV: E=Sophos;i="6.07,241,1708416000"; 
   d="scan'208";a="10020986"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2024 22:56:15 -0700
X-CSE-ConnectionGUID: mgSi5DAYTsCZZYDuPMDm/A==
X-CSE-MsgGUID: 2tBF//N9Qoiz5bNTlvR0DQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,241,1708416000"; 
   d="scan'208";a="26435490"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 29 Apr 2024 22:56:11 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s1gTJ-0007n6-1A;
	Tue, 30 Apr 2024 05:56:09 +0000
Date: Tue, 30 Apr 2024 13:55:12 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:master] BUILD SUCCESS
 3269a156e5b091ac589f3b232ffa73582df10f4f
Message-ID: <202404301309.opaLJ5vw-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git master
branch HEAD: 3269a156e5b091ac589f3b232ffa73582df10f4f  m68k: amiga: Use str_plural() to fix Coccinelle warning

elapsed time: 882m

configs tested: 132
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20240430   gcc  
arc                   randconfig-002-20240430   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                   randconfig-001-20240430   clang
arm                   randconfig-002-20240430   clang
arm                   randconfig-003-20240430   clang
arm                   randconfig-004-20240430   clang
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240430   clang
arm64                 randconfig-002-20240430   gcc  
arm64                 randconfig-003-20240430   clang
arm64                 randconfig-004-20240430   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240430   gcc  
csky                  randconfig-002-20240430   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240430   clang
hexagon               randconfig-002-20240430   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240430   gcc  
i386         buildonly-randconfig-002-20240430   clang
i386         buildonly-randconfig-003-20240430   gcc  
i386         buildonly-randconfig-004-20240430   clang
i386         buildonly-randconfig-005-20240430   clang
i386         buildonly-randconfig-006-20240430   gcc  
i386                                defconfig   clang
i386                  randconfig-001-20240430   clang
i386                  randconfig-002-20240430   gcc  
i386                  randconfig-003-20240430   gcc  
i386                  randconfig-004-20240430   gcc  
i386                  randconfig-005-20240430   gcc  
i386                  randconfig-006-20240430   gcc  
i386                  randconfig-011-20240430   gcc  
i386                  randconfig-012-20240430   clang
i386                  randconfig-013-20240430   clang
i386                  randconfig-014-20240430   gcc  
i386                  randconfig-015-20240430   gcc  
i386                  randconfig-016-20240430   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240430   gcc  
loongarch             randconfig-002-20240430   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240430   gcc  
nios2                 randconfig-002-20240430   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240430   gcc  
parisc                randconfig-002-20240430   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc               randconfig-001-20240430   gcc  
powerpc               randconfig-002-20240430   gcc  
powerpc               randconfig-003-20240430   clang
powerpc64             randconfig-001-20240430   clang
powerpc64             randconfig-002-20240430   clang
powerpc64             randconfig-003-20240430   clang
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240430   gcc  
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240430   gcc  
s390                  randconfig-002-20240430   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                    randconfig-001-20240430   gcc  
sh                    randconfig-002-20240430   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64                              defconfig   gcc  
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
