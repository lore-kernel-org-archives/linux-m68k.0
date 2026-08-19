Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B890436894B
	for <linux-m68k@lists.linux-m68k.org>; Wed, 19 Aug 2026 02:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787105823; cv=none; b=MKW8jbz4gxQNakzXYYRfFaF8KMrSA/2vF7NLGFUBoWZPzrNiwuSctnd4Bq1WwbVNM8x2xIIAwQlCL/uw0HE9/HZNxsgC1nFmL5+JIngCUG+MuZbOZ2l9cuFT4QpvUY66palC2EjHp1q3iIkuK9L/QqGDDT2TX8r9GFcaiwQBkMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787105823; c=relaxed/simple;
	bh=Y7Xay16Jzce9NGHTGb4a2MIEkRzVY9wE2lwvLw84KLg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UliYri0muMswaR4Y9z+DOUKAs4ExHLnGxYGUXqGunPSzm1/sUBczFOF+a4UbTGTyN4DcHiMpg/3C7SjywoQJIaVChg4duB0ZNQ+pcEszSwuQ7YyKf60Xm8FzXfAntIVbOHLmgk7+kou/ZTr6VYpYIvQPQNY/5mof0+6rVwr9uQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G3GvYLuF; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G3GvYLuF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787105822; x=1818641822;
  h=date:from:to:cc:subject:message-id;
  bh=Y7Xay16Jzce9NGHTGb4a2MIEkRzVY9wE2lwvLw84KLg=;
  b=G3GvYLuFALfJHy8Yvq014NLdU3g7fKn1gF5vkrAxaOkbo0eR4oLg8/Z4
   rxrlZW52jY70iGaaNt6XD9zBMVJq5ZONV5iD64Dnq5wawMX5/znYd0Fwv
   Veztr9xY0K9w6r4CilSmfqMdtUkUZ55WoVeV1ycRXZEWVXat6dRKhjRjm
   ayTWBsBtRwkn3KthDhJ8grH0a7EJZrzp/R6Q3zOi0J3wd08ovB00P3qiK
   qvagIp8W4DY41G3zLytVD8125/vkdxVBilP604zdM7TdJTrFu+QmWDelJ
   npltKFH/RRNGwvY0tcl3eo9LItc3f4XyWV96qDX/JPtaSgCfJqEyeIwBE
   A==;
X-CSE-ConnectionGUID: 0VefsoyNR8ecXbiT79a3Ig==
X-CSE-MsgGUID: UyepnmGYRUazrP6mf6CG6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="87370270"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="87370270"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 19:17:00 -0700
X-CSE-ConnectionGUID: c4U3Rx+TTeKTilFyS1HGBA==
X-CSE-MsgGUID: Mmzs+L0GS4Wm9REjVZtn4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="266026656"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 18 Aug 2026 19:16:59 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wwVrM-00000000epC-36ue;
	Wed, 19 Aug 2026 02:16:56 +0000
Date: Wed, 19 Aug 2026 10:16:45 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:master] BUILD SUCCESS
 430075db163607e33af279ef7e246e1a460c6293
Message-ID: <202608191032.uYwucXds-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git master
branch HEAD: 430075db163607e33af279ef7e246e1a460c6293  m68k: nfcon: Do not call console_is_registered() in nfcon_device()

elapsed time: 1745m

configs tested: 131
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allnoconfig    gcc-16.1.0
alpha                           allyesconfig    gcc-16.1.0
alpha                              defconfig    gcc-16.1.0
arc                             allmodconfig    gcc-16.1.0
arc                             allyesconfig    gcc-16.1.0
arc                           randconfig-001    gcc-10.5.0
arc                  randconfig-001-20260818    gcc-10.5.0
arc                  randconfig-001-20260819    gcc-11.5.0
arc                  randconfig-002-20260818    gcc-10.5.0
arc                  randconfig-002-20260819    gcc-11.5.0
arm                        at91_dt_defconfig    clang-17
arm                  randconfig-001-20260818    gcc-10.5.0
arm                  randconfig-001-20260819    gcc-11.5.0
arm                  randconfig-002-20260818    gcc-10.5.0
arm                  randconfig-002-20260819    gcc-11.5.0
arm                  randconfig-003-20260818    gcc-10.5.0
arm                  randconfig-003-20260819    gcc-11.5.0
arm                  randconfig-004-20260818    gcc-10.5.0
arm                  randconfig-004-20260819    gcc-11.5.0
arm64                         randconfig-001    gcc-14.3.0
arm64                randconfig-001-20260818    gcc-12.5.0
arm64                randconfig-001-20260818    gcc-14.3.0
arm64                randconfig-001-20260819    gcc-9.5.0
arm64                randconfig-002-20260818    gcc-12.5.0
arm64                randconfig-002-20260818    gcc-14.3.0
arm64                randconfig-002-20260819    gcc-9.5.0
arm64                randconfig-003-20260818    gcc-12.5.0
arm64                randconfig-003-20260818    gcc-14.3.0
arm64                randconfig-003-20260819    gcc-9.5.0
arm64                randconfig-004-20260818    gcc-12.5.0
arm64                randconfig-004-20260818    gcc-14.3.0
arm64                randconfig-004-20260819    gcc-9.5.0
csky                            allmodconfig    gcc-16.1.0
csky                 randconfig-001-20260818    gcc-12.5.0
csky                 randconfig-001-20260818    gcc-14.3.0
csky                 randconfig-001-20260819    gcc-9.5.0
csky                 randconfig-002-20260818    gcc-12.5.0
csky                 randconfig-002-20260818    gcc-14.3.0
csky                 randconfig-002-20260819    gcc-9.5.0
hexagon              randconfig-001-20260818    gcc-10.5.0
hexagon              randconfig-002-20260818    gcc-10.5.0
i386                            allmodconfig    gcc-14
i386       buildonly-randconfig-001-20260818    clang-22
i386       buildonly-randconfig-002-20260818    clang-22
i386       buildonly-randconfig-003-20260818    clang-22
i386       buildonly-randconfig-004-20260818    clang-22
i386       buildonly-randconfig-005-20260818    clang-22
i386       buildonly-randconfig-006-20260818    clang-22
i386                 randconfig-001-20260818    clang-22
i386                 randconfig-002-20260818    clang-22
i386                 randconfig-003-20260818    clang-22
i386                 randconfig-004-20260818    clang-22
i386                 randconfig-005-20260818    clang-22
i386                 randconfig-006-20260818    clang-22
i386                 randconfig-007-20260818    clang-22
i386                 randconfig-011-20260818    gcc-12
i386                 randconfig-012-20260818    gcc-12
i386                 randconfig-013-20260818    gcc-12
i386                 randconfig-014-20260818    gcc-12
i386                 randconfig-015-20260818    gcc-12
i386                 randconfig-016-20260818    gcc-12
i386                 randconfig-017-20260818    gcc-12
loongarch                          defconfig    clang-24
loongarch            randconfig-001-20260818    gcc-10.5.0
loongarch            randconfig-002-20260818    gcc-10.5.0
nios2                           allmodconfig    gcc-11.5.0
nios2                            allnoconfig    gcc-11.5.0
nios2                randconfig-001-20260818    gcc-10.5.0
nios2                randconfig-002-20260818    gcc-10.5.0
parisc                          allmodconfig    gcc-16.1.0
parisc                          allyesconfig    gcc-16.1.0
parisc                             defconfig    gcc-16.1.0
parisc               randconfig-001-20260818    clang-24
parisc               randconfig-002-20260818    clang-24
powerpc                        ps3_defconfig    gcc-16.1.0
powerpc              randconfig-001-20260818    clang-24
powerpc              randconfig-002-20260818    clang-24
powerpc64            randconfig-001-20260818    clang-24
powerpc64            randconfig-002-20260818    clang-24
riscv                         randconfig-001    clang-18
riscv                randconfig-001-20260818    clang-18
riscv                randconfig-002-20260818    clang-18
s390                 randconfig-001-20260818    clang-18
s390                 randconfig-002-20260818    clang-18
sh                                 defconfig    gcc-16.1.0
sh                kfr2r09-romimage_defconfig    gcc-16.1.0
sh                   randconfig-001-20260818    clang-18
sh                   randconfig-002-20260818    clang-18
sh                          se7619_defconfig    gcc-16.1.0
sparc                randconfig-001-20260818    gcc-11.5.0
sparc                randconfig-002-20260818    gcc-11.5.0
sparc64              randconfig-001-20260818    gcc-11.5.0
sparc64              randconfig-002-20260818    gcc-11.5.0
um                   randconfig-001-20260818    gcc-11.5.0
um                   randconfig-002-20260818    gcc-11.5.0
x86_64     buildonly-randconfig-001-20260818    clang-22
x86_64     buildonly-randconfig-001-20260819    gcc-14
x86_64     buildonly-randconfig-002-20260818    clang-22
x86_64     buildonly-randconfig-002-20260819    gcc-14
x86_64     buildonly-randconfig-003-20260818    clang-22
x86_64     buildonly-randconfig-003-20260819    gcc-14
x86_64     buildonly-randconfig-004-20260818    clang-22
x86_64     buildonly-randconfig-004-20260819    gcc-14
x86_64     buildonly-randconfig-005-20260818    clang-22
x86_64     buildonly-randconfig-005-20260819    gcc-14
x86_64     buildonly-randconfig-006-20260818    clang-22
x86_64     buildonly-randconfig-006-20260819    gcc-14
x86_64                                 kexec    clang-22
x86_64               randconfig-001-20260818    clang-22
x86_64               randconfig-002-20260818    clang-22
x86_64               randconfig-003-20260818    clang-22
x86_64               randconfig-004-20260818    clang-22
x86_64               randconfig-005-20260818    clang-22
x86_64               randconfig-006-20260818    clang-22
x86_64                        randconfig-011    clang-22
x86_64               randconfig-011-20260818    clang-22
x86_64               randconfig-012-20260818    clang-22
x86_64               randconfig-013-20260818    clang-22
x86_64               randconfig-014-20260818    clang-22
x86_64               randconfig-015-20260818    clang-22
x86_64               randconfig-016-20260818    clang-22
x86_64                        randconfig-071    gcc-13
x86_64               randconfig-071-20260818    gcc-13
x86_64               randconfig-072-20260818    gcc-13
x86_64               randconfig-073-20260818    gcc-13
x86_64               randconfig-074-20260818    gcc-13
x86_64               randconfig-075-20260818    gcc-13
x86_64               randconfig-076-20260818    gcc-13
x86_64                          rhel-9.4-bpf    gcc-14
xtensa               randconfig-001-20260818    gcc-11.5.0
xtensa               randconfig-002-20260818    gcc-11.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
