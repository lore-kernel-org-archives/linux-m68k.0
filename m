Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB5913537F2
	for <linux-m68k@lists.linux-m68k.org>; Tue, 14 Apr 2026 07:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776150023; cv=none; b=bNdJDH3uDqrnXrS2AB6/H9GTMABQzEMEK6IReSImuRDOnt1++QXIFgIfjHEEshOTJKS7uQIExcwaSgYCdbyE7gjgbDRgMvPomtG4vJphm406aHhoeBhSfQyaELi0/fYfnn9gnv6jafSvpIE54j/7oczeW2ak2Q6ckQSvFuTkO4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776150023; c=relaxed/simple;
	bh=K+HOfWIioP06Pp/lEf9yLdmTdaJd60Nk8unXjyXxl2U=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kl0lTrpDcReoWiLXCCGG4lSUtNngejhMrbjIMqyUtRExh2bi0VrudonaFv16vxF8XoqdevCrJS+0t1GqjlAgdqGQHT7ug5sGW7OwAZCYtWnxXeaM0UBtY+M4Wz0u/vK+FMR1KzcD1AY5Av9SAbryIxFNFDHMHXhpuJq5yu4zQPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hk6iFz7N; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hk6iFz7N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776150022; x=1807686022;
  h=date:from:to:cc:subject:message-id;
  bh=K+HOfWIioP06Pp/lEf9yLdmTdaJd60Nk8unXjyXxl2U=;
  b=Hk6iFz7NPUDI/rAJld/Hhh7Mj3Mh/TLKKtNoGJ1d5WglMs1ZZjIYjW/Z
   3EcTR3/QKbO/1TnkQh9eGIkPMQgKjNsn5QY2jp1k+oMK1tNK2YVX1dR1j
   e+ut5UyyCN5B+wksJxwGlJ/qSMkwVTLj4zTU9OYjQoymTxUuZKRD94NVR
   ApjNZHJUKuhjWLWcmXmhLiBhkmSZEXVrxhg8s/e2+TklUfD9GF7gU9Rfz
   +AGdC2s5IfAl6YddG5GGbGhJL+pdIYMc55qwUrO6eE7k/k7OAxQEVY5uL
   z0DlHd0CZ3LmAnE4yy+uTUPxC8mvtsMdnrNa29Nyn0LM59cB6MiwQojgL
   A==;
X-CSE-ConnectionGUID: HIxLs8E7RUm+yiZo9LM9rw==
X-CSE-MsgGUID: yH0tUjG7Rp2OsmTzRlK0Ew==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="76975513"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="76975513"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 00:00:20 -0700
X-CSE-ConnectionGUID: +Ai0yKayQEC1CqZkpFRtGw==
X-CSE-MsgGUID: MNgSmocnQWiFacE6ywnqvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="227349906"
Received: from lkp-server01.sh.intel.com (HELO 7b0b59b3a0d4) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 14 Apr 2026 00:00:14 -0700
Received: from kbuild by 7b0b59b3a0d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wCXkp-000000001D7-39Lh;
	Tue, 14 Apr 2026 07:00:11 +0000
Date: Tue, 14 Apr 2026 14:59:28 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:for-v7.1] BUILD SUCCESS
 56f295853f38d3202c20fd0d98939e7a4c56c3fb
Message-ID: <202604141421.aiGQaVvE-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git for-v7.1
branch HEAD: 56f295853f38d3202c20fd0d98939e7a4c56c3fb  m68k: virt: Switch to qemu-virt-ctrl driver

elapsed time: 724m

configs tested: 87
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                   allnoconfig    gcc-15.2.0
alpha                  allyesconfig    gcc-15.2.0
arc                    allmodconfig    gcc-15.2.0
arc                     allnoconfig    gcc-15.2.0
arc                    allyesconfig    gcc-15.2.0
arm                     allnoconfig    clang-23
arm                    allyesconfig    gcc-15.2.0
arm64                  allmodconfig    clang-19
arm64                   allnoconfig    gcc-15.2.0
csky                   allmodconfig    gcc-15.2.0
csky                    allnoconfig    gcc-15.2.0
hexagon                allmodconfig    clang-17
hexagon                 allnoconfig    clang-23
hexagon     randconfig-001-20260414    clang-23
hexagon     randconfig-002-20260414    clang-16
i386                   allmodconfig    gcc-14
i386                    allnoconfig    gcc-14
i386                   allyesconfig    gcc-14
loongarch              allmodconfig    clang-19
loongarch               allnoconfig    clang-23
loongarch   randconfig-001-20260414    clang-18
loongarch   randconfig-002-20260414    clang-23
m68k                   allmodconfig    gcc-15.2.0
m68k                    allnoconfig    gcc-15.2.0
m68k                   allyesconfig    gcc-15.2.0
microblaze              allnoconfig    gcc-15.2.0
microblaze             allyesconfig    gcc-15.2.0
mips                   allmodconfig    gcc-15.2.0
mips                    allnoconfig    gcc-15.2.0
mips                   allyesconfig    gcc-15.2.0
nios2                  allmodconfig    gcc-11.5.0
nios2                   allnoconfig    gcc-11.5.0
nios2       randconfig-001-20260414    gcc-11.5.0
nios2       randconfig-002-20260414    gcc-11.5.0
openrisc               allmodconfig    gcc-15.2.0
openrisc                allnoconfig    gcc-15.2.0
openrisc                  defconfig    gcc-15.2.0
parisc                 allmodconfig    gcc-15.2.0
parisc                  allnoconfig    gcc-15.2.0
parisc                 allyesconfig    gcc-15.2.0
parisc                    defconfig    gcc-15.2.0
parisc      randconfig-001-20260414    gcc-8.5.0
parisc      randconfig-002-20260414    gcc-14.3.0
powerpc                allmodconfig    gcc-15.2.0
powerpc                 allnoconfig    gcc-15.2.0
powerpc     randconfig-001-20260414    gcc-8.5.0
powerpc     randconfig-002-20260414    gcc-8.5.0
powerpc64   randconfig-001-20260414    gcc-13.4.0
powerpc64   randconfig-002-20260414    gcc-12.5.0
riscv                  allmodconfig    clang-23
riscv                   allnoconfig    gcc-15.2.0
riscv                  allyesconfig    clang-16
riscv                     defconfig    clang-23
riscv       randconfig-001-20260414    clang-23
riscv       randconfig-002-20260414    gcc-8.5.0
s390                   allmodconfig    clang-18
s390                    allnoconfig    clang-23
s390                   allyesconfig    gcc-15.2.0
s390                      defconfig    clang-23
s390        randconfig-001-20260414    clang-23
s390        randconfig-002-20260414    clang-23
sh                     allmodconfig    gcc-15.2.0
sh                      allnoconfig    gcc-15.2.0
sh                     allyesconfig    gcc-15.2.0
sh                        defconfig    gcc-15.2.0
sh          randconfig-001-20260414    gcc-15.2.0
sh          randconfig-002-20260414    gcc-15.2.0
sparc                   allnoconfig    gcc-15.2.0
sparc                     defconfig    gcc-15.2.0
sparc       randconfig-001-20260414    gcc-15.2.0
sparc       randconfig-002-20260414    gcc-14.3.0
sparc64                allmodconfig    clang-23
sparc64                   defconfig    clang-20
sparc64     randconfig-001-20260414    gcc-8.5.0
um                     allmodconfig    clang-19
um                      allnoconfig    clang-23
um                     allyesconfig    gcc-14
um                        defconfig    clang-23
um                   i386_defconfig    gcc-14
um                 x86_64_defconfig    clang-23
x86_64                 allmodconfig    clang-20
x86_64                  allnoconfig    clang-20
x86_64                 allyesconfig    clang-20
x86_64                    defconfig    gcc-14
x86_64                rhel-9.4-rust    clang-20
xtensa                  allnoconfig    gcc-15.2.0
xtensa                 allyesconfig    gcc-15.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
