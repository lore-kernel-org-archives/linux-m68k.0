Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0085020E6E0
	for <linux-m68k@lists.linux-m68k.org>; Tue, 25 Feb 2025 15:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740495628; cv=none; b=WfXdsyaGkTnX1oJuENYnnswkGwDktKS7ppR1eHPPDNVdjqLzItdIDaKekzKM/PXAN9Soon5yradX0GwVzlfrB6sNZpIMTMkv7qyoRGE7DlrTRvW0HLDy/i668J+3G5IrSQ4/AXOY+BtMZ55GWNGHO/ab5eYbVqoVJ7dJYS4BoSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740495628; c=relaxed/simple;
	bh=bVTxkdApyQMuqdI6Tp6VdjnDjW0PjWbONU4wKoR68d4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lHi6dgwZOuh4crXScSWxJZoWWvajJqUuhZweSLscnL9E0ivjOTOwE9/UFF7gT60F5DmdjMNblwPQ1Ph/+WR0gd89X6e3vZsVv9WkoLXdEeenzmcieo0bZJYSGhkJXWgmoxcH0Fhk4y0Qt1yYCwVK4A64D3YREgRXoW5sryFSxCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=No02nhC8; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="No02nhC8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740495627; x=1772031627;
  h=date:from:to:cc:subject:message-id;
  bh=bVTxkdApyQMuqdI6Tp6VdjnDjW0PjWbONU4wKoR68d4=;
  b=No02nhC88sJdPvCuHiWGq4xSKcRXPLSB90t0PpNiTDf2DLkaI5FPDYDS
   hlEvUiZf4URj62lKapk+ZNuzjjvkWFBgfACo5KRXWP3IukwBbiQujfof3
   3OycOq8G1vhbHHABbXh3zkmn9NoUR1/ftAmxv9LF9urV+hOgXE/goVtiD
   MEYoArUyPfjNSPGyjXYNj6C22uhzS8yWo/VT4r35xu8ZvhPFp+NPrI3/8
   2G1y+NcSaJafqczJ1bcX04RS4IRJlQ75XnsJTaGtMq31WAT4yk9OXVe5+
   ks+ZBp+Hm9bZAezJMlzfuuOW/oExZMJWHecjdcUUObWuoVvyfgFdzPW+R
   Q==;
X-CSE-ConnectionGUID: 2T5uOXJcQp2TY9nQ7iGDpg==
X-CSE-MsgGUID: X3qCu1UhT+mTH+zce1o8gQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="28892309"
X-IronPort-AV: E=Sophos;i="6.13,314,1732608000"; 
   d="scan'208";a="28892309"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2025 07:00:25 -0800
X-CSE-ConnectionGUID: +CrOko5jTvWDZTYdEclUbw==
X-CSE-MsgGUID: D3WN4XFKRqiZnMETEGFuig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,314,1732608000"; 
   d="scan'208";a="121499779"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 25 Feb 2025 07:00:24 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tmwQ2-000ANT-1C;
	Tue, 25 Feb 2025 15:00:22 +0000
Date: Tue, 25 Feb 2025 22:59:27 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:master] BUILD SUCCESS
 408ccbc6e2c615e4ee3ffd7d29bb7c1b8dba7e0d
Message-ID: <202502252221.LLqJHoSK-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git master
branch HEAD: 408ccbc6e2c615e4ee3ffd7d29bb7c1b8dba7e0d  Merge tag 'v6.14-rc4'

elapsed time: 1459m

configs tested: 128
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              alldefconfig    gcc-13.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                   randconfig-001-20250224    gcc-13.2.0
arc                   randconfig-002-20250224    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                              allyesconfig    gcc-14.2.0
arm                       aspeed_g5_defconfig    gcc-14.2.0
arm                            dove_defconfig    gcc-14.2.0
arm                          gemini_defconfig    clang-21
arm                       netwinder_defconfig    gcc-14.2.0
arm                   randconfig-001-20250224    gcc-14.2.0
arm                   randconfig-002-20250224    gcc-14.2.0
arm                   randconfig-003-20250224    gcc-14.2.0
arm                   randconfig-004-20250224    gcc-14.2.0
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250224    gcc-14.2.0
arm64                 randconfig-002-20250224    clang-21
arm64                 randconfig-003-20250224    gcc-14.2.0
arm64                 randconfig-004-20250224    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250225    gcc-14.2.0
csky                  randconfig-002-20250225    gcc-14.2.0
hexagon                          allmodconfig    clang-21
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-18
hexagon               randconfig-001-20250225    clang-21
hexagon               randconfig-002-20250225    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250224    clang-19
i386        buildonly-randconfig-002-20250224    gcc-12
i386        buildonly-randconfig-003-20250224    clang-19
i386        buildonly-randconfig-004-20250224    gcc-12
i386        buildonly-randconfig-005-20250224    clang-19
i386        buildonly-randconfig-006-20250224    clang-19
i386                                defconfig    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250225    gcc-14.2.0
loongarch             randconfig-002-20250225    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                       m5475evb_defconfig    gcc-14.2.0
m68k                           sun3_defconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                          ath79_defconfig    gcc-14.2.0
mips                       bmips_be_defconfig    gcc-14.2.0
mips                           jazz_defconfig    clang-21
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250225    gcc-14.2.0
nios2                 randconfig-002-20250225    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250225    gcc-14.2.0
parisc                randconfig-002-20250225    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc                       ebony_defconfig    clang-18
powerpc                      ppc64e_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250225    gcc-14.2.0
powerpc               randconfig-002-20250225    clang-19
powerpc               randconfig-003-20250225    clang-21
powerpc64             randconfig-001-20250225    gcc-14.2.0
powerpc64             randconfig-002-20250225    gcc-14.2.0
powerpc64             randconfig-003-20250225    gcc-14.2.0
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-21
riscv                               defconfig    clang-19
riscv                    nommu_virt_defconfig    clang-21
riscv                 randconfig-001-20250225    clang-15
riscv                 randconfig-002-20250225    clang-21
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-15
s390                             allyesconfig    gcc-14.2.0
s390                          debug_defconfig    gcc-14.2.0
s390                                defconfig    clang-15
s390                  randconfig-001-20250225    clang-15
s390                  randconfig-002-20250225    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-14.2.0
sh                    randconfig-001-20250225    gcc-14.2.0
sh                    randconfig-002-20250225    gcc-14.2.0
sh                              ul2_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250225    gcc-14.2.0
sparc                 randconfig-002-20250225    gcc-14.2.0
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20250225    gcc-14.2.0
sparc64               randconfig-002-20250225    gcc-14.2.0
um                               allmodconfig    clang-21
um                                allnoconfig    clang-18
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250225    clang-21
um                    randconfig-002-20250225    gcc-12
um                           x86_64_defconfig    clang-15
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250225    gcc-12
x86_64      buildonly-randconfig-002-20250225    clang-19
x86_64      buildonly-randconfig-003-20250225    clang-19
x86_64      buildonly-randconfig-004-20250225    gcc-11
x86_64      buildonly-randconfig-005-20250225    gcc-12
x86_64      buildonly-randconfig-006-20250225    clang-19
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250225    gcc-14.2.0
xtensa                randconfig-002-20250225    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
