Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 378961946AA
	for <linux-m68k@lists.linux-m68k.org>; Tue, 25 Mar 2025 09:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742896081; cv=none; b=ItNLEkiBBX6qm+3Qp0ay4DlErtjMTuKTAM8Cm0dopEH/iC7ctb4nikw42vfyS8HPbDUaRHa8aPipcD3fk1M9UeTRqCES96ue5bcw48bpc/ZJjpXdNHVRIXWfT95UvRtcbrLoUbGxyWocTCpg4SZL+QgBYUzUP7D+S+6kNEvKZ2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742896081; c=relaxed/simple;
	bh=a46u42tn0EMVEYhwGtxLarv6XmRbndJK47iB5OpYWNk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TLFmIka2OPCSbkLZBZnDL8ab0WZNHs4fBharbIVhdjlatnayG57Bf3oQYJVKdKXeTl+8uQEIzLGx5fjI9q6x7fo3YbVxwibaOLckJexaZWD675IxhtCvxxyoL/UIvss2kQWnbVq/CtXkW96Rj0ssGN5qw8/OjSItqGNVTYisauM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IJhxlY1E; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IJhxlY1E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742896080; x=1774432080;
  h=date:from:to:cc:subject:message-id;
  bh=a46u42tn0EMVEYhwGtxLarv6XmRbndJK47iB5OpYWNk=;
  b=IJhxlY1El8sB02w4IIYG1GJpYwumCLgyz4ChEZGxMqsPsrE8+kcSLWrg
   DEvZBdCh1spVv0QMl35KB+gaW2Z4lonDXkpfrDvGa4vaxgp34hTwXxDGm
   hXe5/pRmfb38LSCOaBBCxU3HxB/Rf6gM91TsoSpDP1alWWbNiA8CI4QKa
   7BoIVGMGsLkzpOkClGHHaYmPCOzuMC1aOnN/h0l0OUA2X/lQp0x5yiUGW
   jKr9ahunr5RuQIdmiUWQcBWZqLIa6bF4VEEMBk4PGgGBN/y+ztCkrNZS+
   0EDFgAy+BL1UWb/7xeaBa3CptpeRUg+jAzIYfENFRG394tXuaS+UaQE/4
   A==;
X-CSE-ConnectionGUID: tn2r0TPyRFmSkf5ikiMkRg==
X-CSE-MsgGUID: 6KgnzXwXQzOG5nSTl/2L+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="66591241"
X-IronPort-AV: E=Sophos;i="6.14,274,1736841600"; 
   d="scan'208";a="66591241"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2025 02:47:58 -0700
X-CSE-ConnectionGUID: /RUmdi72R0iZGjnTbb/1IQ==
X-CSE-MsgGUID: uBuAt1lNT0GAUmuVRtpdQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,274,1736841600"; 
   d="scan'208";a="129146115"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 25 Mar 2025 02:47:57 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tx0t0-0004H4-28;
	Tue, 25 Mar 2025 09:47:54 +0000
Date: Tue, 25 Mar 2025 17:47:07 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:zorro-mfd] BUILD SUCCESS
 af4c780f235ce709d5e70334bce74c518a12290c
Message-ID: <202503251700.np1FfhdX-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git zorro-mfd
branch HEAD: af4c780f235ce709d5e70334bce74c518a12290c  [WIP] zorro: Add helper macro for zorro_register_driver boilerplate

elapsed time: 1449m

configs tested: 128
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-14.2.0
arc                      axs103_smp_defconfig    gcc-14.2.0
arc                                 defconfig    gcc-14.2.0
arc                 nsimosci_hs_smp_defconfig    gcc-14.2.0
arc                   randconfig-001-20250324    gcc-12.4.0
arc                   randconfig-002-20250324    gcc-14.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-14.2.0
arm                                 defconfig    clang-14
arm                          gemini_defconfig    clang-20
arm                          pxa3xx_defconfig    clang-21
arm                   randconfig-001-20250324    gcc-8.5.0
arm                   randconfig-002-20250324    gcc-7.5.0
arm                   randconfig-003-20250324    clang-21
arm                   randconfig-004-20250324    clang-21
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250324    gcc-8.5.0
arm64                 randconfig-002-20250324    clang-14
arm64                 randconfig-003-20250324    clang-21
arm64                 randconfig-004-20250324    gcc-6.5.0
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20250324    gcc-14.2.0
csky                  randconfig-002-20250324    gcc-14.2.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250324    clang-21
hexagon               randconfig-002-20250324    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250324    clang-20
i386        buildonly-randconfig-002-20250324    clang-20
i386        buildonly-randconfig-003-20250324    gcc-12
i386        buildonly-randconfig-004-20250324    clang-20
i386        buildonly-randconfig-005-20250324    gcc-12
i386        buildonly-randconfig-006-20250324    gcc-12
i386                                defconfig    clang-20
loongarch                        alldefconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250324    gcc-14.2.0
loongarch             randconfig-002-20250324    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                          hp300_defconfig    gcc-14.2.0
m68k                        m5307c3_defconfig    gcc-14.2.0
microblaze                       alldefconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250324    gcc-8.5.0
nios2                 randconfig-002-20250324    gcc-10.5.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250324    gcc-13.3.0
parisc                randconfig-002-20250324    gcc-5.5.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-21
powerpc                    amigaone_defconfig    gcc-14.2.0
powerpc                        icon_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250324    gcc-6.5.0
powerpc               randconfig-002-20250324    clang-19
powerpc               randconfig-003-20250324    clang-21
powerpc64             randconfig-001-20250324    gcc-6.5.0
powerpc64             randconfig-002-20250324    clang-15
powerpc64             randconfig-003-20250324    gcc-6.5.0
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-21
riscv                 randconfig-001-20250324    clang-21
riscv                 randconfig-002-20250324    clang-21
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-15
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-15
s390                  randconfig-001-20250324    clang-15
s390                  randconfig-002-20250324    clang-15
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-14.2.0
sh                        edosk7760_defconfig    gcc-14.2.0
sh                          kfr2r09_defconfig    gcc-14.2.0
sh                          landisk_defconfig    gcc-14.2.0
sh                    randconfig-001-20250324    gcc-12.4.0
sh                    randconfig-002-20250324    gcc-12.4.0
sh                      rts7751r2d1_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250324    gcc-5.5.0
sparc                 randconfig-002-20250324    gcc-11.5.0
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20250324    gcc-13.3.0
sparc64               randconfig-002-20250324    gcc-5.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250324    clang-21
um                    randconfig-002-20250324    clang-21
um                           x86_64_defconfig    clang-15
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250324    clang-20
x86_64      buildonly-randconfig-002-20250324    gcc-12
x86_64      buildonly-randconfig-003-20250324    clang-20
x86_64      buildonly-randconfig-004-20250324    clang-20
x86_64      buildonly-randconfig-005-20250324    clang-20
x86_64      buildonly-randconfig-006-20250324    clang-20
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250324    gcc-13.3.0
xtensa                randconfig-002-20250324    gcc-9.3.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
