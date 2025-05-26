Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00929F9D9
	for <linux-m68k@lists.linux-m68k.org>; Mon, 26 May 2025 00:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748220946; cv=none; b=S9fEk6kOamZV0X8Ho+9VW2fBdUdP84NLyuWKRpvmZdSjYgH1NUMvUP01clr/86MT05dNl9JlpHBGrMqgfQIjp1XhzZuulYDU9KfiYxXNcO4Qq56gIeehBRyTB3+LVuzjEs8aXI7JfuM2YJ2i2hzV5wC6OUs4l53mkv7xSIUJqt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748220946; c=relaxed/simple;
	bh=zwAEiwFq9sQa6CbD+pdKEnWUOhy+yUM5gdW3bb+1QDI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SDRkb8GdWX3tqcXwoEjysaMe872HkV5dSiyQyXZ5ySWUwGW3Gfpbf1WVubE1VU/nD7xe/QnIPy+jf9YZQXiZmcM86p28bbkfzDMVowCZSk6nYZFbLWxd+goerFcakiUvCIN4DoTXnCCxMIwd9Z5Lg5o5oKuotcY4K6pZsogznpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L3sYdfKn; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L3sYdfKn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748220944; x=1779756944;
  h=date:from:to:cc:subject:message-id;
  bh=zwAEiwFq9sQa6CbD+pdKEnWUOhy+yUM5gdW3bb+1QDI=;
  b=L3sYdfKnJexvvQ67xE9xlbURJ/DPCoVPeB/xH8p2sV/UDwVQaYdFfHEQ
   o2G8nkHcWMiUpHWWfUL2HSe3Hfs3+7/9/ky4RXqupVYCBg6uNGl4BzIpS
   lDrAMFIZB5kqgjjf03vT3wKgP7JABnaPM/O9jPE6e0nmElpOQb9CPp+OT
   P/12wUKKr4XDnKvtgFvRo5y5ZPSk+jF6u2qGFu2cbzMvX0Sbrh4yzeNO4
   7U2+BJeUD8smQ91iCONwr7Wcu5tnb5zW+uOOp2bvCkCp7S990uzHvN/dQ
   jq6jRzjqZ4cTAgiAuVvUruZHMzzC7C7B/DJFm+AF2LfOm+hIQqg2d23E6
   A==;
X-CSE-ConnectionGUID: kJzawtjSRdeBePKkUTNKDg==
X-CSE-MsgGUID: tX3FLpcuQFmfD9M1QGBngw==
X-IronPort-AV: E=McAfee;i="6700,10204,11444"; a="53842991"
X-IronPort-AV: E=Sophos;i="6.15,314,1739865600"; 
   d="scan'208";a="53842991"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2025 17:55:42 -0700
X-CSE-ConnectionGUID: doglEaC0QcSAF0J8t/L58w==
X-CSE-MsgGUID: GDb9/XvwQUivd+ts0JtT+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,314,1739865600"; 
   d="scan'208";a="143078291"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 25 May 2025 17:55:41 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uJM7u-000S3E-0U;
	Mon, 26 May 2025 00:55:38 +0000
Date: Mon, 26 May 2025 08:54:45 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:atari-drm-wip-rebasing] BUILD SUCCESS WITH
 WARNING c9e868e85b8e39710359f076a7c22c0659838e51
Message-ID: <202505260833.tUaKkBKU-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git atari-drm-wip-rebasing
branch HEAD: c9e868e85b8e39710359f076a7c22c0659838e51  drm: atari: Update to v6.15-rc1

Warning (recently discovered and may have been fixed):

    https://lore.kernel.org/oe-kbuild-all/202505252258.NK6eVqzV-lkp@intel.com

    drivers/gpu/drm/atari/atari_drm.c:3605: warning: Function parameter or struct member 'conn' not described in 'atari_drm_conn_mode_valid'
    drivers/gpu/drm/atari/atari_drm.c:3605: warning: Function parameter or struct member 'mode' not described in 'atari_drm_conn_mode_valid'
    drivers/gpu/drm/atari/atari_drm.c:3970: warning: Function parameter or struct member 'mode' not described in 'atari_drm_pipe_mode_valid'
    drivers/gpu/drm/atari/atari_drm.c:3970: warning: Function parameter or struct member 'pipe' not described in 'atari_drm_pipe_mode_valid'
    drivers/gpu/drm/atari/atari_drm.c:4019: warning: Function parameter or struct member 'adjusted_mode' not described in 'atari_drm_pipe_mode_fixup'
    drivers/gpu/drm/atari/atari_drm.c:4019: warning: Function parameter or struct member 'crtc' not described in 'atari_drm_pipe_mode_fixup'
    drivers/gpu/drm/atari/atari_drm.c:4019: warning: Function parameter or struct member 'mode' not described in 'atari_drm_pipe_mode_fixup'

Warning ids grouped by kconfigs:

recent_errors
`-- m68k-allyesconfig
    |-- drivers-gpu-drm-atari-atari_drm.c:warning:Function-parameter-or-struct-member-adjusted_mode-not-described-in-atari_drm_pipe_mode_fixup
    |-- drivers-gpu-drm-atari-atari_drm.c:warning:Function-parameter-or-struct-member-conn-not-described-in-atari_drm_conn_mode_valid
    |-- drivers-gpu-drm-atari-atari_drm.c:warning:Function-parameter-or-struct-member-crtc-not-described-in-atari_drm_pipe_mode_fixup
    |-- drivers-gpu-drm-atari-atari_drm.c:warning:Function-parameter-or-struct-member-mode-not-described-in-atari_drm_conn_mode_valid
    |-- drivers-gpu-drm-atari-atari_drm.c:warning:Function-parameter-or-struct-member-mode-not-described-in-atari_drm_pipe_mode_fixup
    |-- drivers-gpu-drm-atari-atari_drm.c:warning:Function-parameter-or-struct-member-mode-not-described-in-atari_drm_pipe_mode_valid
    `-- drivers-gpu-drm-atari-atari_drm.c:warning:Function-parameter-or-struct-member-pipe-not-described-in-atari_drm_pipe_mode_valid

elapsed time: 868m

configs tested: 197
configs skipped: 8

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    clang-19
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    clang-19
arc                              allyesconfig    gcc-14.2.0
arc                          axs101_defconfig    gcc-14.2.0
arc                                 defconfig    gcc-14.2.0
arc                 nsimosci_hs_smp_defconfig    gcc-14.2.0
arc                   randconfig-001-20250525    gcc-12.4.0
arc                   randconfig-002-20250525    gcc-8.5.0
arm                              allmodconfig    clang-19
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    clang-19
arm                              allyesconfig    gcc-14.2.0
arm                         at91_dt_defconfig    clang-21
arm                                 defconfig    clang-21
arm                           imxrt_defconfig    clang-21
arm                       multi_v4t_defconfig    gcc-14.2.0
arm                   randconfig-001-20250525    clang-21
arm                   randconfig-002-20250525    clang-21
arm                   randconfig-003-20250525    gcc-8.5.0
arm                   randconfig-004-20250525    gcc-7.5.0
arm                          sp7021_defconfig    gcc-14.2.0
arm                           spitz_defconfig    gcc-14.2.0
arm                           u8500_defconfig    clang-21
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                               defconfig    gcc-14.2.0
arm64                 randconfig-001-20250525    clang-21
arm64                 randconfig-002-20250525    gcc-8.5.0
arm64                 randconfig-003-20250525    gcc-6.5.0
arm64                 randconfig-004-20250525    clang-21
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20250525    gcc-14.2.0
csky                  randconfig-002-20250525    gcc-10.5.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon                             defconfig    clang-21
hexagon               randconfig-001-20250525    clang-19
hexagon               randconfig-002-20250525    clang-21
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-20
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250525    gcc-11
i386        buildonly-randconfig-002-20250525    clang-20
i386        buildonly-randconfig-003-20250525    gcc-12
i386        buildonly-randconfig-004-20250525    gcc-12
i386        buildonly-randconfig-005-20250525    gcc-12
i386        buildonly-randconfig-006-20250525    clang-20
i386                                defconfig    clang-20
i386                  randconfig-001-20250526    clang-20
i386                  randconfig-002-20250526    clang-20
i386                  randconfig-003-20250526    clang-20
i386                  randconfig-004-20250526    clang-20
i386                  randconfig-005-20250526    clang-20
i386                  randconfig-006-20250526    clang-20
i386                  randconfig-007-20250526    clang-20
i386                  randconfig-011-20250526    gcc-11
i386                  randconfig-012-20250526    gcc-11
i386                  randconfig-013-20250526    gcc-11
i386                  randconfig-014-20250526    gcc-11
i386                  randconfig-015-20250526    gcc-11
i386                  randconfig-016-20250526    gcc-11
i386                  randconfig-017-20250526    gcc-11
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch                           defconfig    gcc-14.2.0
loongarch             randconfig-001-20250525    gcc-15.1.0
loongarch             randconfig-002-20250525    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                                defconfig    gcc-14.2.0
m68k                       m5208evb_defconfig    clang-21
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                          defconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                        bcm63xx_defconfig    clang-21
mips                           ip28_defconfig    clang-21
mips                          rb532_defconfig    clang-18
mips                       rbtx49xx_defconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20250525    gcc-6.5.0
nios2                 randconfig-002-20250525    gcc-10.5.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250525    gcc-7.5.0
parisc                randconfig-002-20250525    gcc-11.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                    adder875_defconfig    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-21
powerpc                      arches_defconfig    gcc-14.2.0
powerpc                        icon_defconfig    clang-21
powerpc                  iss476-smp_defconfig    gcc-14.2.0
powerpc                     ksi8560_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250525    clang-16
powerpc               randconfig-002-20250525    clang-21
powerpc               randconfig-003-20250525    clang-21
powerpc                    sam440ep_defconfig    clang-21
powerpc                     sequoia_defconfig    clang-17
powerpc                     tqm8555_defconfig    gcc-14.2.0
powerpc                 xes_mpc85xx_defconfig    clang-21
powerpc64             randconfig-001-20250525    clang-21
powerpc64             randconfig-002-20250525    clang-18
powerpc64             randconfig-003-20250525    clang-21
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-21
riscv                 randconfig-001-20250525    clang-21
riscv                 randconfig-002-20250525    clang-21
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-21
s390                  randconfig-001-20250525    clang-19
s390                  randconfig-002-20250525    gcc-7.5.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-14.2.0
sh                          r7780mp_defconfig    gcc-14.2.0
sh                    randconfig-001-20250525    gcc-6.5.0
sh                    randconfig-002-20250525    gcc-14.2.0
sh                            titan_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250525    gcc-6.5.0
sparc                 randconfig-002-20250525    gcc-10.3.0
sparc                       sparc32_defconfig    gcc-14.2.0
sparc64                          alldefconfig    gcc-14.2.0
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20250525    gcc-7.5.0
sparc64               randconfig-002-20250525    gcc-13.3.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250525    clang-18
um                    randconfig-002-20250525    gcc-12
um                           x86_64_defconfig    clang-21
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250525    clang-20
x86_64      buildonly-randconfig-002-20250525    clang-20
x86_64      buildonly-randconfig-003-20250525    clang-20
x86_64      buildonly-randconfig-004-20250525    gcc-12
x86_64      buildonly-randconfig-005-20250525    clang-20
x86_64      buildonly-randconfig-006-20250525    clang-20
x86_64                              defconfig    clang-20
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250526    gcc-12
x86_64                randconfig-002-20250526    gcc-12
x86_64                randconfig-003-20250526    gcc-12
x86_64                randconfig-004-20250526    gcc-12
x86_64                randconfig-005-20250526    gcc-12
x86_64                randconfig-006-20250526    gcc-12
x86_64                randconfig-007-20250526    gcc-12
x86_64                randconfig-008-20250526    gcc-12
x86_64                randconfig-071-20250526    gcc-11
x86_64                randconfig-072-20250526    gcc-11
x86_64                randconfig-073-20250526    gcc-11
x86_64                randconfig-074-20250526    gcc-11
x86_64                randconfig-075-20250526    gcc-11
x86_64                randconfig-076-20250526    gcc-11
x86_64                randconfig-077-20250526    gcc-11
x86_64                randconfig-078-20250526    gcc-11
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-12
x86_64                         rhel-9.4-kunit    gcc-12
x86_64                           rhel-9.4-ltp    gcc-12
x86_64                          rhel-9.4-rust    clang-18
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250525    gcc-9.3.0
xtensa                randconfig-002-20250525    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
