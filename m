Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A65D944E
	for <linux-m68k@lists.linux-m68k.org>; Tue, 13 May 2025 04:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747109647; cv=none; b=fNuwftLdLmpuxe4jrult7JCqpdQWaSl6DBe6q9hFJbp9hvsDtO/jKjU35/3O2MdKGmeNhA0vTvqs8tnytjNuRroGOmE1/XOdP4ckCzjk0YkSAZJUtpMyaAO0Vb/KaS7dwH2ODl1YgyZLhpeIWO582Fm1KIhw+NfhxFqAM4j4Mc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747109647; c=relaxed/simple;
	bh=sYULTRRbkntqhjHr+ZilPT71ifYv+65LIcCVViffSek=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mQvnfpcB58nm+axbgsnFsOZ6Tn64yfTLbgXiQ6gV5i/O+4CeQ0bhF7gMWFN4mupCmTj/AL61HEVwJmbfC7CWLt85kOYR0HIyRUUjKl6ouwQp7nYyfcwDC8rhMkJ7A6+l82Sarld5pc0blTBg36m6xxC5G/Js/Ye0YCg9dNxef4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BInCqThD; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BInCqThD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747109646; x=1778645646;
  h=date:from:to:cc:subject:message-id;
  bh=sYULTRRbkntqhjHr+ZilPT71ifYv+65LIcCVViffSek=;
  b=BInCqThDrd6K/N8bKwdcoT+dmQYtSK1GbaKFw4HGwTm+S2lp4LNMZNxb
   ELsBdi3TL+nHag8hlrAIxgUXf8awjL3ZCm5B5mlVt+jiTMu1YCoMtwIz3
   i81PsrC0uyYhIYFey6uJuGg199ezytBvT5wQSoLLWwuY8z/rKwACeb0kJ
   r8yFez/dr94EiL8DOTg71Yv3zlPAdFXhb1jJTTUWm8dhJJrUknyaL8WtT
   rvDNTG6j3jxW3msH8djISiJNBQRQbFyRc7F1dw82mdykSqof+XlzWV2Lb
   9+9B9NshEA1PL+KDLKMGw42EL4xFa/ieI1vgdCsPlWcj7TDaXY+DjSUjk
   A==;
X-CSE-ConnectionGUID: ctprXvjlT9utst7rdb6GjA==
X-CSE-MsgGUID: tS8U/Wh7Tnig1mpT4xEMag==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="48043174"
X-IronPort-AV: E=Sophos;i="6.15,284,1739865600"; 
   d="scan'208";a="48043174"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 21:14:04 -0700
X-CSE-ConnectionGUID: Dz5bAlunSMaBLGRMFw/wVw==
X-CSE-MsgGUID: Sd94klamSgCe2Now2PpGxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,284,1739865600"; 
   d="scan'208";a="138535491"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 12 May 2025 21:14:03 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uEh1k-000Fdj-2H;
	Tue, 13 May 2025 04:14:00 +0000
Date: Tue, 13 May 2025 12:13:13 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:master] BUILD SUCCESS
 fbf8beff38ad9cf4670150226d0ec203d4978966
Message-ID: <202505131203.WTb9qTox-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git master
branch HEAD: fbf8beff38ad9cf4670150226d0ec203d4978966  Merge tag 'v6.15-rc6'

elapsed time: 1023m

configs tested: 131
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-14.2.0
arc                   randconfig-001-20250512    gcc-14.2.0
arc                   randconfig-002-20250512    gcc-11.5.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-14.2.0
arm                     am200epdkit_defconfig    gcc-14.2.0
arm                      footbridge_defconfig    clang-17
arm                        multi_v5_defconfig    gcc-14.2.0
arm                             mxs_defconfig    clang-21
arm                   randconfig-001-20250512    gcc-7.5.0
arm                   randconfig-002-20250512    clang-17
arm                   randconfig-003-20250512    gcc-6.5.0
arm                   randconfig-004-20250512    clang-21
arm                           tegra_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250512    gcc-7.5.0
arm64                 randconfig-002-20250512    clang-21
arm64                 randconfig-003-20250512    clang-21
arm64                 randconfig-004-20250512    clang-21
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250512    gcc-9.3.0
csky                  randconfig-002-20250512    gcc-14.2.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250512    clang-20
hexagon               randconfig-002-20250512    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250512    gcc-11
i386        buildonly-randconfig-002-20250512    clang-20
i386        buildonly-randconfig-003-20250512    clang-20
i386        buildonly-randconfig-004-20250512    gcc-12
i386        buildonly-randconfig-005-20250512    clang-20
i386        buildonly-randconfig-006-20250512    clang-20
i386                                defconfig    clang-20
loongarch                        alldefconfig    gcc-14.2.0
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250512    gcc-13.3.0
loongarch             randconfig-002-20250512    gcc-13.3.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                        mvme16x_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                        bcm63xx_defconfig    clang-21
mips                          eyeq5_defconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250512    gcc-7.5.0
nios2                 randconfig-002-20250512    gcc-11.5.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250512    gcc-12.4.0
parisc                randconfig-002-20250512    gcc-10.5.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-21
powerpc                      chrp32_defconfig    clang-19
powerpc                  iss476-smp_defconfig    gcc-14.2.0
powerpc                       ppc64_defconfig    clang-21
powerpc               randconfig-001-20250512    gcc-5.5.0
powerpc               randconfig-002-20250512    clang-21
powerpc               randconfig-003-20250512    gcc-7.5.0
powerpc64             randconfig-001-20250512    clang-21
powerpc64             randconfig-002-20250512    gcc-5.5.0
powerpc64             randconfig-003-20250512    clang-21
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-21
riscv                 randconfig-001-20250512    gcc-7.5.0
riscv                 randconfig-002-20250512    clang-21
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-21
s390                  randconfig-001-20250512    clang-18
s390                  randconfig-002-20250512    clang-21
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-14.2.0
sh                             espt_defconfig    gcc-14.2.0
sh                    randconfig-001-20250512    gcc-11.5.0
sh                    randconfig-002-20250512    gcc-9.3.0
sh                          rsk7269_defconfig    gcc-14.2.0
sh                            shmin_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250512    gcc-10.3.0
sparc                 randconfig-002-20250512    gcc-8.5.0
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20250512    gcc-6.5.0
sparc64               randconfig-002-20250512    gcc-10.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250512    gcc-12
um                    randconfig-002-20250512    clang-21
um                           x86_64_defconfig    clang-21
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250512    gcc-12
x86_64      buildonly-randconfig-002-20250512    gcc-12
x86_64      buildonly-randconfig-003-20250512    clang-20
x86_64      buildonly-randconfig-004-20250512    clang-20
x86_64      buildonly-randconfig-005-20250512    clang-20
x86_64      buildonly-randconfig-006-20250512    clang-20
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-18
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250512    gcc-12.4.0
xtensa                randconfig-002-20250512    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
