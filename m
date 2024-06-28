Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E75F15099C
	for <linux-m68k@lists.linux-m68k.org>; Fri, 28 Jun 2024 10:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719571657; cv=none; b=sLydz/VQ8zjykzXPwbnrDFkqq6za1lelQLyZTvIZM0KlKz0JiSGnVIvuW7Am0W/umZflUxYzLDafiLehgrnS4ZRuv9l8KHW5pOq+WCZ4wZ/qLVi3sORfFogj8teijzp1aqkWMK3W/d35j5WINwe19IvbQkUxtARZXXbylWRQ8w8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719571657; c=relaxed/simple;
	bh=k2n8167DCsz6Flz/pWRT0XzuddLAIbP0+tDTZVXM6+0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Wk/RfoiM8N1cHs+1FzWa/73sDA3qn6DiLDT/STXVwNa92OzwUZhROe6OBC6GZ3qTrSwC4SShduuWTaSVoWrED6pLsmXr2ZZc5xJwylq8XZOxGvtUMInYle+vdw9vXV4yEjN6Cbwy0C5Gk9jjau52d2TVXqUbqaw0Ch2cMLJmu/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wiz83s4Q; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wiz83s4Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719571656; x=1751107656;
  h=date:from:to:cc:subject:message-id;
  bh=k2n8167DCsz6Flz/pWRT0XzuddLAIbP0+tDTZVXM6+0=;
  b=Wiz83s4QnJahMZ3/C7xngBsKynXgyM6O6/HETj+m4pjJbiqhLloLw+pG
   kbbZLAPkry/GNmGXIUxhkg9PdWKi3bnDeMToIDH+MKYvOg7gGoEVTtX6H
   Uj2qWr4pLIITdOZLhbG3ALY+TVXq3rS+F0c0gvOPKNW/qLgg6zsT/bFSc
   TdbPwu0Q/jVTpcdXUp29JpCSQTVr4jhwtaygYtj8oIcmvWNCEhFZQiGtK
   aKNvtI/rVDe67eHzLZ/mrA4yU+1EMXWgdjI5M3ymZVecroGM3I1aGneC2
   GNxCZE4CpUz1kRXoD0LGOSriitsrGySXIStG+dsSbQrY2+//O5lJo8UJf
   w==;
X-CSE-ConnectionGUID: T8bIxmndQZmyb9nJ9JNb3g==
X-CSE-MsgGUID: cuu/J2QxQv68eFPbj4nSwA==
X-IronPort-AV: E=McAfee;i="6700,10204,11116"; a="42169754"
X-IronPort-AV: E=Sophos;i="6.09,168,1716274800"; 
   d="scan'208";a="42169754"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2024 03:47:34 -0700
X-CSE-ConnectionGUID: 5kBAsn9cQTqI0f2irYoXGg==
X-CSE-MsgGUID: N+UMNlMZR4qAc99vNOTChQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,168,1716274800"; 
   d="scan'208";a="44782432"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 28 Jun 2024 03:47:33 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sN98d-000H0k-0W;
	Fri, 28 Jun 2024 10:47:31 +0000
Date: Fri, 28 Jun 2024 18:47:25 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:for-next] BUILD SUCCESS
 156872f08e33af7a23c1e4827f6127d7861b23fd
Message-ID: <202406281823.uZvQtzcE-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git for-next
branch HEAD: 156872f08e33af7a23c1e4827f6127d7861b23fd  zorro: Use str_plural() in amiga_zorro_probe()

elapsed time: 5751m

configs tested: 106
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.2.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                   randconfig-001-20240624   gcc-13.2.0
arc                   randconfig-002-20240624   gcc-13.2.0
arm                              allmodconfig   gcc-13.2.0
arm                              allyesconfig   gcc-13.2.0
arm                   randconfig-002-20240624   gcc-13.2.0
arm                   randconfig-003-20240624   gcc-13.2.0
arm                   randconfig-004-20240624   gcc-13.2.0
arm64                            allmodconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-13.2.0
arm64                            allyesconfig   clang-19
arm64                 randconfig-002-20240624   gcc-13.2.0
arm64                 randconfig-003-20240624   gcc-13.2.0
arm64                 randconfig-004-20240624   gcc-13.2.0
csky                              allnoconfig   gcc-13.2.0
csky                  randconfig-001-20240624   gcc-13.2.0
csky                  randconfig-002-20240624   gcc-13.2.0
i386                             allmodconfig   clang-18
i386                              allnoconfig   clang-18
i386                             allyesconfig   clang-18
i386         buildonly-randconfig-001-20240624   gcc-8
i386         buildonly-randconfig-002-20240624   gcc-13
i386         buildonly-randconfig-004-20240624   gcc-10
i386         buildonly-randconfig-004-20240625   gcc-13
i386                                defconfig   clang-18
i386                  randconfig-001-20240625   gcc-13
i386                  randconfig-003-20240624   gcc-13
i386                  randconfig-003-20240625   gcc-7
i386                  randconfig-004-20240624   gcc-13
i386                  randconfig-005-20240624   gcc-13
i386                  randconfig-006-20240625   gcc-13
i386                  randconfig-012-20240625   gcc-13
i386                  randconfig-015-20240625   gcc-12
i386                  randconfig-016-20240625   gcc-10
loongarch                         allnoconfig   gcc-13.2.0
loongarch             randconfig-001-20240624   gcc-13.2.0
loongarch             randconfig-002-20240624   gcc-13.2.0
m68k                              allnoconfig   gcc-13.2.0
microblaze                        allnoconfig   gcc-13.2.0
mips                             allmodconfig   clang-19
mips                              allnoconfig   gcc-13.2.0
mips                             allyesconfig   clang-19
nios2                            allmodconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-13.2.0
nios2                            allyesconfig   gcc-13.2.0
nios2                 randconfig-001-20240624   gcc-13.2.0
nios2                 randconfig-002-20240624   gcc-13.2.0
openrisc                         allmodconfig   gcc-13.2.0
openrisc                          allnoconfig   gcc-13.2.0
openrisc                         allyesconfig   gcc-13.2.0
openrisc                            defconfig   gcc-13.2.0
parisc                           allmodconfig   gcc-13.2.0
parisc                            allnoconfig   gcc-13.2.0
parisc                           allyesconfig   gcc-13.2.0
parisc                              defconfig   gcc-13.2.0
parisc                randconfig-001-20240624   gcc-13.2.0
parisc                randconfig-002-20240624   gcc-13.2.0
powerpc                          allmodconfig   gcc-13.2.0
powerpc                           allnoconfig   gcc-13.2.0
powerpc                          allyesconfig   gcc-13.2.0
powerpc               randconfig-002-20240624   gcc-13.2.0
riscv                            allmodconfig   gcc-13.2.0
riscv                             allnoconfig   gcc-13.2.0
riscv                            allyesconfig   gcc-13.2.0
riscv                 randconfig-002-20240624   gcc-13.2.0
s390                              allnoconfig   gcc-13.2.0
s390                  randconfig-002-20240624   gcc-13.2.0
sh                                allnoconfig   gcc-13.2.0
sh                                  defconfig   gcc-13.2.0
sh                    randconfig-001-20240624   gcc-13.2.0
sh                    randconfig-002-20240624   gcc-13.2.0
sparc                            allyesconfig   gcc-13.2.0
sparc64                          allmodconfig   gcc-13.2.0
sparc64                          allyesconfig   gcc-13.2.0
sparc64                             defconfig   gcc-13.2.0
sparc64               randconfig-001-20240624   gcc-13.2.0
sparc64               randconfig-002-20240624   gcc-13.2.0
um                                allnoconfig   gcc-13.2.0
um                             i386_defconfig   gcc-13
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240624   gcc-13
x86_64       buildonly-randconfig-002-20240624   gcc-13
x86_64                              defconfig   clang-18
x86_64                                  kexec   clang-18
x86_64                randconfig-005-20240624   gcc-11
x86_64                randconfig-006-20240624   gcc-13
x86_64                randconfig-012-20240624   gcc-8
x86_64                randconfig-014-20240624   gcc-8
x86_64                randconfig-015-20240624   gcc-13
x86_64                randconfig-071-20240624   gcc-10
x86_64                randconfig-072-20240624   gcc-10
x86_64                randconfig-073-20240624   gcc-13
x86_64                randconfig-074-20240624   gcc-13
x86_64                randconfig-075-20240624   gcc-13
x86_64                randconfig-076-20240624   gcc-8
x86_64                          rhel-8.3-func   clang-18
x86_64                          rhel-8.3-rust   clang-18
x86_64                               rhel-8.3   clang-18
xtensa                            allnoconfig   gcc-13.2.0
xtensa                           allyesconfig   gcc-13.2.0
xtensa                randconfig-001-20240624   gcc-13.2.0
xtensa                randconfig-002-20240624   gcc-13.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
