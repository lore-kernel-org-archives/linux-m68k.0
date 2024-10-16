Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D108E15C147
	for <linux-m68k@lists.linux-m68k.org>; Wed, 16 Oct 2024 11:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729077554; cv=none; b=hfFwdSsh3LCFDtIg6Taap/fM26KnWfwJNbmfU4nyzoBmenOA2Tf1DV7y9cIz5SPagya0Tf0h8+llBRy4RIqyMvhwLdKqz0ZPKDP8RRQ1+AsmEbAr+sJXU/KT4Ch8li+MYM/ed4sFb3UHkIOfFxe2gl9WM4c6ACctel6wxLnyjjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729077554; c=relaxed/simple;
	bh=s0GWR5tkwXmPZxJ0mNCHveao5XEQy0E13TGKYKacfV4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jHTGWEI/O19F7KBlBKaAtvqdV2twhlSC5MkVNeUhuS51ZTHmur8sUQ7LKIR2m6ulKJMo9SGvX9RXDalm/p8JpHkhaK38a72r9nDDDdX7stNse3TSS7DnU+s5aJv8Xlaunw+lLJWSkAIuDozOQ8m80unC9rpx1/mwwCL8SupKflo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Me7ay6AD; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Me7ay6AD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729077552; x=1760613552;
  h=date:from:to:cc:subject:message-id;
  bh=s0GWR5tkwXmPZxJ0mNCHveao5XEQy0E13TGKYKacfV4=;
  b=Me7ay6ADbt1k9AbNpxLF9pD3yKKf3ZtYM7Y/9Mgh8mY+h1G1bgK7cJhh
   xgTGkxdx7Ean0g4LmuncL2+zvG6B0Zoga6k641DbmW6FFo/GBjnsgHu75
   h1uUoLteY9qXk4PI8pabA4rmy1y1uTGEn1xHFrbvGkRZP95qsWrdhmxDQ
   604hUo+UWNtiIFoE9D9jiK8UKDO291oC4Ju+0jXyl/zeKEkzkFrn9kj2G
   oQ9st/eUHTx20Q3hvFD54/F7vgOqAf/tiWdpxh/Cj3+Lh/UqNDWcTh7RI
   KylPI+L9PRXySuOrToFpPqrZxTzIw/a1TLbhFHQWG1jp73mtCi4yfJ5wX
   Q==;
X-CSE-ConnectionGUID: PW0YmJZVSxmo/mLLjwwkYQ==
X-CSE-MsgGUID: jm7iQ8d7S4O4Oe06NEqNpg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="51054723"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="51054723"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2024 04:19:11 -0700
X-CSE-ConnectionGUID: yUHp+cf/ToafAummAfaDGA==
X-CSE-MsgGUID: tAdBUFNHRQqVfXxTuBAUJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,207,1725346800"; 
   d="scan'208";a="108938415"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 16 Oct 2024 04:19:09 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t123X-000Kpb-0N;
	Wed, 16 Oct 2024 11:19:07 +0000
Date: Wed, 16 Oct 2024 19:19:04 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:master] BUILD SUCCESS
 057f664fb794e8d2a32fbbfb22856f05c1ce59c6
Message-ID: <202410161950.CeeoJNys-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git master
branch HEAD: 057f664fb794e8d2a32fbbfb22856f05c1ce59c6  Merge tag 'v6.12-rc3'

elapsed time: 1358m

configs tested: 172
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            alldefconfig    gcc-13.2.0
alpha                             allnoconfig    gcc-14.1.0
alpha                            allyesconfig    clang-20
alpha                               defconfig    gcc-14.1.0
arc                              allmodconfig    clang-20
arc                               allnoconfig    gcc-14.1.0
arc                              allyesconfig    clang-20
arc                                 defconfig    gcc-14.1.0
arc                     nsimosci_hs_defconfig    gcc-13.2.0
arc                   randconfig-001-20241016    clang-20
arc                   randconfig-002-20241016    clang-20
arm                              allmodconfig    clang-20
arm                               allnoconfig    gcc-14.1.0
arm                              allyesconfig    clang-20
arm                         at91_dt_defconfig    gcc-13.2.0
arm                                 defconfig    gcc-14.1.0
arm                   milbeaut_m10v_defconfig    gcc-13.2.0
arm                          pxa910_defconfig    gcc-13.2.0
arm                   randconfig-001-20241016    clang-20
arm                   randconfig-002-20241016    clang-20
arm                   randconfig-003-20241016    clang-20
arm                   randconfig-004-20241016    clang-20
arm                         s3c6400_defconfig    gcc-13.2.0
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.1.0
arm64                               defconfig    gcc-14.1.0
arm64                 randconfig-001-20241016    clang-20
arm64                 randconfig-002-20241016    clang-20
arm64                 randconfig-003-20241016    clang-20
arm64                 randconfig-004-20241016    clang-20
csky                              allnoconfig    gcc-14.1.0
csky                                defconfig    gcc-14.1.0
csky                  randconfig-001-20241016    clang-20
csky                  randconfig-002-20241016    clang-20
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    gcc-14.1.0
hexagon                          allyesconfig    clang-20
hexagon                             defconfig    gcc-14.1.0
hexagon               randconfig-001-20241016    clang-20
hexagon               randconfig-002-20241016    clang-20
i386                             allmodconfig    clang-18
i386                              allnoconfig    clang-18
i386                             allyesconfig    clang-18
i386        buildonly-randconfig-001-20241016    gcc-11
i386        buildonly-randconfig-002-20241016    gcc-11
i386        buildonly-randconfig-003-20241016    gcc-11
i386        buildonly-randconfig-004-20241016    gcc-11
i386        buildonly-randconfig-005-20241016    gcc-11
i386        buildonly-randconfig-006-20241016    gcc-11
i386                                defconfig    clang-18
i386                  randconfig-001-20241016    gcc-11
i386                  randconfig-002-20241016    gcc-11
i386                  randconfig-003-20241016    gcc-11
i386                  randconfig-004-20241016    gcc-11
i386                  randconfig-005-20241016    gcc-11
i386                  randconfig-006-20241016    gcc-11
i386                  randconfig-011-20241016    gcc-11
i386                  randconfig-012-20241016    gcc-11
i386                  randconfig-013-20241016    gcc-11
i386                  randconfig-014-20241016    gcc-11
i386                  randconfig-015-20241016    gcc-11
i386                  randconfig-016-20241016    gcc-11
loongarch                        allmodconfig    gcc-14.1.0
loongarch                         allnoconfig    gcc-14.1.0
loongarch                           defconfig    gcc-14.1.0
loongarch             randconfig-001-20241016    clang-20
loongarch             randconfig-002-20241016    clang-20
m68k                             allmodconfig    gcc-14.1.0
m68k                              allnoconfig    gcc-14.1.0
m68k                             allyesconfig    gcc-14.1.0
m68k                                defconfig    gcc-14.1.0
microblaze                       allmodconfig    gcc-14.1.0
microblaze                        allnoconfig    gcc-14.1.0
microblaze                       allyesconfig    gcc-14.1.0
microblaze                          defconfig    gcc-14.1.0
mips                              allnoconfig    gcc-14.1.0
mips                          eyeq5_defconfig    gcc-13.2.0
nios2                             allnoconfig    gcc-14.1.0
nios2                               defconfig    gcc-14.1.0
nios2                 randconfig-001-20241016    clang-20
nios2                 randconfig-002-20241016    clang-20
openrisc                          allnoconfig    clang-20
openrisc                         allyesconfig    gcc-14.1.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-14.1.0
parisc                            allnoconfig    clang-20
parisc                           allyesconfig    gcc-14.1.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20241016    clang-20
parisc                randconfig-002-20241016    clang-20
parisc64                            defconfig    gcc-14.1.0
powerpc                          allmodconfig    gcc-14.1.0
powerpc                           allnoconfig    clang-20
powerpc                          allyesconfig    gcc-14.1.0
powerpc                    amigaone_defconfig    gcc-13.2.0
powerpc                      chrp32_defconfig    gcc-13.2.0
powerpc                 mpc832x_rdb_defconfig    gcc-13.2.0
powerpc                      pcm030_defconfig    gcc-13.2.0
powerpc               randconfig-001-20241016    clang-20
powerpc               randconfig-002-20241016    clang-20
powerpc               randconfig-003-20241016    clang-20
powerpc                  storcenter_defconfig    gcc-13.2.0
powerpc64             randconfig-001-20241016    clang-20
powerpc64             randconfig-002-20241016    clang-20
powerpc64             randconfig-003-20241016    clang-20
riscv                            allmodconfig    gcc-14.1.0
riscv                             allnoconfig    clang-20
riscv                            allyesconfig    gcc-14.1.0
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20241016    clang-20
riscv                 randconfig-002-20241016    clang-20
s390                             allmodconfig    gcc-14.1.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.1.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20241016    clang-20
s390                  randconfig-002-20241016    clang-20
sh                               allmodconfig    gcc-14.1.0
sh                                allnoconfig    gcc-14.1.0
sh                               allyesconfig    gcc-14.1.0
sh                                  defconfig    gcc-12
sh                         ecovec24_defconfig    gcc-13.2.0
sh                        edosk7760_defconfig    gcc-13.2.0
sh                    randconfig-001-20241016    clang-20
sh                    randconfig-002-20241016    clang-20
sh                          sdk7780_defconfig    gcc-13.2.0
sh                   sh7770_generic_defconfig    gcc-13.2.0
sparc                            allmodconfig    gcc-14.1.0
sparc                       sparc32_defconfig    gcc-13.2.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20241016    clang-20
sparc64               randconfig-002-20241016    clang-20
um                               allmodconfig    clang-20
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20241016    clang-20
um                    randconfig-002-20241016    clang-20
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-18
x86_64                           allyesconfig    clang-18
x86_64      buildonly-randconfig-001-20241016    gcc-12
x86_64      buildonly-randconfig-002-20241016    gcc-12
x86_64      buildonly-randconfig-003-20241016    gcc-12
x86_64      buildonly-randconfig-004-20241016    gcc-12
x86_64      buildonly-randconfig-005-20241016    gcc-12
x86_64      buildonly-randconfig-006-20241016    gcc-12
x86_64                              defconfig    clang-18
x86_64                                  kexec    gcc-12
x86_64                randconfig-001-20241016    gcc-12
x86_64                randconfig-002-20241016    gcc-12
x86_64                randconfig-003-20241016    gcc-12
x86_64                randconfig-004-20241016    gcc-12
x86_64                randconfig-005-20241016    gcc-12
x86_64                randconfig-006-20241016    gcc-12
x86_64                randconfig-011-20241016    gcc-12
x86_64                randconfig-012-20241016    gcc-12
x86_64                randconfig-013-20241016    gcc-12
x86_64                randconfig-014-20241016    gcc-12
x86_64                randconfig-015-20241016    gcc-12
x86_64                randconfig-016-20241016    gcc-12
x86_64                randconfig-071-20241016    gcc-12
x86_64                randconfig-072-20241016    gcc-12
x86_64                randconfig-073-20241016    gcc-12
x86_64                randconfig-074-20241016    gcc-12
x86_64                randconfig-075-20241016    gcc-12
x86_64                randconfig-076-20241016    gcc-12
x86_64                               rhel-8.3    gcc-12
xtensa                            allnoconfig    gcc-14.1.0
xtensa                randconfig-001-20241016    clang-20
xtensa                randconfig-002-20241016    clang-20

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
