Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 191EE187352
	for <linux-m68k@lists.linux-m68k.org>; Tue,  1 Oct 2024 08:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727771170; cv=none; b=mn0NxBpNSk32rhnVZx87WiRGEkfHcejuySPXx5/7+W4GJqnAZ9Jxg2eFehuI2v5D0fHyQulJTVfUA4D2EKGIq2gp9WRux7V4Tss6q8yyUq556nV1pKNoHN3iYaLwbfG6DKRpIAS88cNGkb0TqXgcxjC75bGTbcipCQJLm6/3Ays=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727771170; c=relaxed/simple;
	bh=H9uU8WSGfO9hKUMKZoFDZ3VHj/GNSP0NrsD7DXL9Crs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UpMCUbZJZzmAzKz/fKfMWx2frY8MnICuAhfIwQVh7AhILxixM7KXHy2mAfXtbrMGL9v5a51URHGI6Q8eajbcrExLdaS+T/7U6F0S5v5anRJfvzwRCFayzA7N0LwbgnxNKI1zKPVkcwzOlsjCkWA6Ry3694Dqqjr0qL6tEKrnC5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qc3HWflF; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qc3HWflF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727771169; x=1759307169;
  h=date:from:to:cc:subject:message-id;
  bh=H9uU8WSGfO9hKUMKZoFDZ3VHj/GNSP0NrsD7DXL9Crs=;
  b=Qc3HWflF0fBPIifwBch2zQ9QzjdsWMmtmnttW0ieNb+0XkXvtIlX66Rh
   5vsxC4emICugMLAlmLbsiOTO3c+5vrSknpg915dfnMqfdpKrczL4FQFJq
   CKNUdgTL0fkLoQH8LdjNBUmpBXBokzA4K7eYZSvp9Td60ZAfTiTBeAHVr
   9VIC9J/I2EGoO1jwHzH0iJ/QuTZkEM2lSP12E0HQVylUs/5KNs8X0Tljo
   Rmn4GqXKhBcKcD2nBW3CV1muWLw56N7qdY09S1/zwdezanqaBTr54hsWb
   /zjBEfQtLKkTqhQpmJu3Qx+HrvVi5yNhoZFKGAH9X78IWVUEINBtSD5CX
   Q==;
X-CSE-ConnectionGUID: 3zMvrxbZTma25uuCoG3a6A==
X-CSE-MsgGUID: z/UDx+T2QZanU5/yG556vg==
X-IronPort-AV: E=McAfee;i="6700,10204,11211"; a="30682467"
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; 
   d="scan'208";a="30682467"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2024 01:26:06 -0700
X-CSE-ConnectionGUID: IucfMjhcTVql1Q+HXOOnPw==
X-CSE-MsgGUID: GZp1VxpVS0uOuyEOVF6FjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; 
   d="scan'208";a="73627205"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 01 Oct 2024 01:26:03 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1svYCl-000QQj-1g;
	Tue, 01 Oct 2024 08:25:59 +0000
Date: Tue, 01 Oct 2024 16:25:16 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:master] BUILD SUCCESS
 f077472a6705df8b3101b5556f4be1fbd02f34ac
Message-ID: <202410011608.m2O3HilC-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git master
branch HEAD: f077472a6705df8b3101b5556f4be1fbd02f34ac  bcachefs: rename version -> bversion for big endian builds

elapsed time: 1164m

configs tested: 178
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-13.3.0
alpha                             allnoconfig    gcc-14.1.0
alpha                            allyesconfig    clang-20
alpha                            allyesconfig    gcc-13.3.0
alpha                               defconfig    gcc-14.1.0
arc                              allmodconfig    clang-20
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                               allnoconfig    gcc-14.1.0
arc                              allyesconfig    clang-20
arc                              allyesconfig    gcc-13.2.0
arc                          axs103_defconfig    gcc-14.1.0
arc                                 defconfig    gcc-14.1.0
arc                    vdk_hs38_smp_defconfig    clang-20
arm                              allmodconfig    clang-20
arm                              allmodconfig    gcc-14.1.0
arm                               allnoconfig    clang-20
arm                               allnoconfig    gcc-14.1.0
arm                              allyesconfig    clang-20
arm                              allyesconfig    gcc-14.1.0
arm                         at91_dt_defconfig    clang-20
arm                          collie_defconfig    gcc-14.1.0
arm                     davinci_all_defconfig    gcc-14.1.0
arm                                 defconfig    gcc-14.1.0
arm                          exynos_defconfig    clang-20
arm                      jornada720_defconfig    clang-20
arm                         lpc18xx_defconfig    gcc-14.1.0
arm                            mmp2_defconfig    clang-20
arm                          pxa910_defconfig    clang-20
arm                         s5pv210_defconfig    clang-20
arm                        shmobile_defconfig    clang-20
arm                       versatile_defconfig    gcc-14.1.0
arm                         wpcm450_defconfig    clang-20
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.1.0
arm64                               defconfig    gcc-14.1.0
csky                              allnoconfig    gcc-14.1.0
csky                                defconfig    gcc-14.1.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon                           allnoconfig    gcc-14.1.0
hexagon                          allyesconfig    clang-20
hexagon                             defconfig    gcc-14.1.0
i386                             allmodconfig    clang-18
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-18
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-18
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20241001    clang-18
i386        buildonly-randconfig-002-20241001    clang-18
i386        buildonly-randconfig-002-20241001    gcc-12
i386        buildonly-randconfig-003-20241001    clang-18
i386        buildonly-randconfig-004-20241001    clang-18
i386        buildonly-randconfig-004-20241001    gcc-12
i386        buildonly-randconfig-005-20241001    clang-18
i386        buildonly-randconfig-006-20241001    clang-18
i386        buildonly-randconfig-006-20241001    gcc-12
i386                                defconfig    clang-18
i386                  randconfig-001-20241001    clang-18
i386                  randconfig-001-20241001    gcc-12
i386                  randconfig-002-20241001    clang-18
i386                  randconfig-003-20241001    clang-18
i386                  randconfig-004-20241001    clang-18
i386                  randconfig-004-20241001    gcc-12
i386                  randconfig-005-20241001    clang-18
i386                  randconfig-006-20241001    clang-18
i386                  randconfig-011-20241001    clang-18
i386                  randconfig-011-20241001    gcc-12
i386                  randconfig-012-20241001    clang-18
i386                  randconfig-012-20241001    gcc-12
i386                  randconfig-013-20241001    clang-18
i386                  randconfig-013-20241001    gcc-12
i386                  randconfig-014-20241001    clang-18
i386                  randconfig-014-20241001    gcc-11
i386                  randconfig-015-20241001    clang-18
i386                  randconfig-015-20241001    gcc-12
i386                  randconfig-016-20241001    clang-18
i386                  randconfig-016-20241001    gcc-12
loongarch                        allmodconfig    gcc-14.1.0
loongarch                         allnoconfig    gcc-14.1.0
loongarch                           defconfig    gcc-14.1.0
m68k                             allmodconfig    gcc-14.1.0
m68k                              allnoconfig    gcc-14.1.0
m68k                             allyesconfig    gcc-14.1.0
m68k                                defconfig    gcc-14.1.0
m68k                        mvme147_defconfig    clang-20
microblaze                       allmodconfig    gcc-14.1.0
microblaze                        allnoconfig    gcc-14.1.0
microblaze                       allyesconfig    gcc-14.1.0
microblaze                          defconfig    gcc-14.1.0
mips                              allnoconfig    gcc-14.1.0
mips                      bmips_stb_defconfig    clang-20
mips                         db1xxx_defconfig    gcc-14.1.0
mips                           ip32_defconfig    clang-20
mips                      maltasmvp_defconfig    clang-20
mips                        maltaup_defconfig    clang-20
mips                        omega2p_defconfig    clang-20
mips                           rs90_defconfig    gcc-14.1.0
mips                           xway_defconfig    clang-20
nios2                             allnoconfig    gcc-14.1.0
nios2                               defconfig    gcc-14.1.0
openrisc                          allnoconfig    clang-20
openrisc                          allnoconfig    gcc-14.1.0
openrisc                         allyesconfig    gcc-14.1.0
openrisc                            defconfig    gcc-12
openrisc                  or1klitex_defconfig    clang-20
openrisc                  or1klitex_defconfig    gcc-14.1.0
parisc                           allmodconfig    gcc-14.1.0
parisc                            allnoconfig    clang-20
parisc                            allnoconfig    gcc-14.1.0
parisc                           allyesconfig    gcc-14.1.0
parisc                              defconfig    gcc-12
parisc                generic-64bit_defconfig    clang-20
parisc64                            defconfig    gcc-14.1.0
powerpc                          allmodconfig    gcc-14.1.0
powerpc                           allnoconfig    clang-20
powerpc                           allnoconfig    gcc-14.1.0
powerpc                          allyesconfig    clang-20
powerpc                          allyesconfig    gcc-14.1.0
powerpc                 canyonlands_defconfig    clang-20
powerpc                 canyonlands_defconfig    gcc-14.1.0
powerpc                        cell_defconfig    gcc-14.1.0
powerpc                        fsp2_defconfig    gcc-14.1.0
powerpc                        icon_defconfig    clang-20
powerpc                   motionpro_defconfig    clang-20
powerpc                 mpc834x_itx_defconfig    clang-20
powerpc               mpc834x_itxgp_defconfig    gcc-14.1.0
powerpc                         wii_defconfig    gcc-14.1.0
riscv                            allmodconfig    clang-20
riscv                            allmodconfig    gcc-14.1.0
riscv                             allnoconfig    clang-20
riscv                             allnoconfig    gcc-14.1.0
riscv                            allyesconfig    clang-20
riscv                            allyesconfig    gcc-14.1.0
riscv                               defconfig    gcc-12
s390                             allmodconfig    clang-20
s390                             allmodconfig    gcc-14.1.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.1.0
s390                                defconfig    gcc-12
sh                               alldefconfig    gcc-14.1.0
sh                               allmodconfig    gcc-14.1.0
sh                                allnoconfig    gcc-14.1.0
sh                               allyesconfig    gcc-14.1.0
sh                                  defconfig    gcc-12
sh                ecovec24-romimage_defconfig    gcc-14.1.0
sh                 kfr2r09-romimage_defconfig    clang-20
sh                     magicpanelr2_defconfig    clang-20
sh                          r7780mp_defconfig    clang-20
sh                      rts7751r2d1_defconfig    clang-20
sh                          sdk7780_defconfig    clang-20
sh                          sdk7786_defconfig    clang-20
sh                           se7750_defconfig    clang-20
sh                        sh7785lcr_defconfig    clang-20
sh                            titan_defconfig    gcc-14.1.0
sh                              ul2_defconfig    gcc-14.1.0
sparc                            allmodconfig    gcc-14.1.0
sparc64                             defconfig    gcc-12
um                               allmodconfig    clang-20
um                                allnoconfig    clang-17
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                           x86_64_defconfig    gcc-12
x86_64                           alldefconfig    clang-20
x86_64                            allnoconfig    clang-18
x86_64                           allyesconfig    clang-18
x86_64                              defconfig    clang-18
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-18
x86_64                                  kexec    gcc-12
x86_64                               rhel-8.3    gcc-12
x86_64                          rhel-8.3-rust    clang-18
xtensa                            allnoconfig    gcc-14.1.0
xtensa                    smp_lx200_defconfig    clang-20

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
