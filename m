Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0568D2E3708
	for <linux-m68k@lists.linux-m68k.org>; Mon, 28 Jul 2025 22:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753742934; cv=none; b=nnz4TMdSTVSTda/yGUBL2UenRii4jBJOmVTqwiRNIz4l1PFfETZ7i1+Va/oWS1O6UDndA0KvBpfOx41sxnK8iGaDBRUdcZ2QufW4EtQSA1n7cy3Ch3TsytsW6YXejvNZPEj3BpAi772bZjbdiB9IEWORtl/lX75cWz9QS2MCIoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753742934; c=relaxed/simple;
	bh=PeP8SE0B5fcvwjNLXjO23GgOeEcq8ckpCuicOmwlBO8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YLJjA38EiXtokrEnvRVX0iBX15+a14sED4hJJRMmjyvU39+HTOsfdbq6YdQoRMCBKDBJzXx3AD6QVts/1IaAL/zIxxYLtv5o2ZjbreBSyug9bV/EzaWrmTjNnVljZ12TpCiJdGo7G+e5rkIY1ktuh6o8iJBTQBozwBX+/KvOGaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CISzgPD+; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CISzgPD+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753742933; x=1785278933;
  h=date:from:to:cc:subject:message-id;
  bh=PeP8SE0B5fcvwjNLXjO23GgOeEcq8ckpCuicOmwlBO8=;
  b=CISzgPD+u4tQd/t9GaFHlSzdLnW4a8bDR8j0kyBrej+TG1aq7gR7AXPa
   wYioIJxyzdQNa2ffD/fSvlNYys10HDD17ihoFJT65KI9kKHwkECgomo1c
   uKM0rXz5pIu07CWShrJn2pPfBk5a3sn+BRLOy5QDYOEbdKveHpptA0Nho
   7Q9PVwIlyJlT5WMrufnS+FipeKaf3N69RUeNHM/HuhN7yjbsAX1TqFbUG
   NhmE/fNIGBUu2C3TMkI3rK/k2h2CWgJRV5LBVeNQhRk+Jp6GkSMlWfnVS
   bR5DH2STUerQKtD/Z0ROJbrt76O/NGL9D6V4rjCJRX2CwBvP16o7p1Yab
   Q==;
X-CSE-ConnectionGUID: n3GNK8y8R6G3k3S+XQh/Yg==
X-CSE-MsgGUID: w+snGnPoTpWe+Cge2qk9Qw==
X-IronPort-AV: E=McAfee;i="6800,10657,11505"; a="58624672"
X-IronPort-AV: E=Sophos;i="6.16,348,1744095600"; 
   d="scan'208";a="58624672"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2025 15:48:50 -0700
X-CSE-ConnectionGUID: hDMFr4cwQB6bp8wd9q0IXA==
X-CSE-MsgGUID: EDTaNIzEQdibz+SCV2Ds8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,348,1744095600"; 
   d="scan'208";a="162982193"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 28 Jul 2025 15:48:48 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ugWeE-0000oZ-0K;
	Mon, 28 Jul 2025 22:48:46 +0000
Date: Tue, 29 Jul 2025 06:47:59 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:master] BUILD SUCCESS
 042639c54c6e94a7a02f8a7ff0ee10b809c0859e
Message-ID: <202507290646.Kev35jdw-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git master
branch HEAD: 042639c54c6e94a7a02f8a7ff0ee10b809c0859e  Merge tag 'v6.16'

elapsed time: 732m

configs tested: 211
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    clang-22
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    clang-22
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                          axs103_defconfig    gcc-15.1.0
arc                        nsim_700_defconfig    gcc-15.1.0
arc                   randconfig-001-20250728    gcc-13.4.0
arc                   randconfig-001-20250729    gcc-10.5.0
arc                   randconfig-002-20250728    gcc-12.5.0
arc                   randconfig-002-20250729    gcc-10.5.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    gcc-15.1.0
arm                       aspeed_g5_defconfig    gcc-15.1.0
arm                          ep93xx_defconfig    clang-22
arm                       netwinder_defconfig    gcc-15.1.0
arm                   randconfig-001-20250728    clang-22
arm                   randconfig-001-20250729    gcc-10.5.0
arm                   randconfig-002-20250728    clang-22
arm                   randconfig-002-20250729    gcc-10.5.0
arm                   randconfig-003-20250728    clang-22
arm                   randconfig-003-20250729    gcc-10.5.0
arm                   randconfig-004-20250728    gcc-8.5.0
arm                   randconfig-004-20250729    gcc-10.5.0
arm                         socfpga_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    clang-22
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250728    clang-22
arm64                 randconfig-001-20250729    gcc-10.5.0
arm64                 randconfig-002-20250728    clang-20
arm64                 randconfig-002-20250729    gcc-10.5.0
arm64                 randconfig-003-20250728    gcc-11.5.0
arm64                 randconfig-003-20250729    gcc-10.5.0
arm64                 randconfig-004-20250728    clang-22
arm64                 randconfig-004-20250729    gcc-10.5.0
csky                              allnoconfig    clang-22
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20250728    gcc-10.5.0
csky                  randconfig-001-20250729    gcc-10.5.0
csky                  randconfig-002-20250728    gcc-9.5.0
csky                  randconfig-002-20250729    gcc-10.5.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-22
hexagon               randconfig-001-20250728    clang-22
hexagon               randconfig-001-20250729    gcc-10.5.0
hexagon               randconfig-002-20250728    clang-16
hexagon               randconfig-002-20250729    gcc-10.5.0
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250728    gcc-12
i386        buildonly-randconfig-001-20250729    gcc-12
i386        buildonly-randconfig-002-20250728    gcc-12
i386        buildonly-randconfig-002-20250729    gcc-12
i386        buildonly-randconfig-003-20250728    gcc-12
i386        buildonly-randconfig-003-20250729    gcc-12
i386        buildonly-randconfig-004-20250728    clang-20
i386        buildonly-randconfig-004-20250729    gcc-12
i386        buildonly-randconfig-005-20250728    gcc-12
i386        buildonly-randconfig-005-20250729    gcc-12
i386        buildonly-randconfig-006-20250728    clang-20
i386        buildonly-randconfig-006-20250729    gcc-12
i386                                defconfig    clang-20
i386                  randconfig-001-20250729    gcc-12
i386                  randconfig-002-20250729    gcc-12
i386                  randconfig-003-20250729    gcc-12
i386                  randconfig-004-20250729    gcc-12
i386                  randconfig-005-20250729    gcc-12
i386                  randconfig-006-20250729    gcc-12
i386                  randconfig-007-20250729    gcc-12
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch             randconfig-001-20250728    clang-22
loongarch             randconfig-001-20250729    gcc-10.5.0
loongarch             randconfig-002-20250728    clang-20
loongarch             randconfig-002-20250729    gcc-10.5.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                          ath79_defconfig    gcc-15.1.0
mips                       bmips_be_defconfig    gcc-15.1.0
mips                  cavium_octeon_defconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20250728    gcc-11.5.0
nios2                 randconfig-001-20250729    gcc-10.5.0
nios2                 randconfig-002-20250728    gcc-11.5.0
nios2                 randconfig-002-20250729    gcc-10.5.0
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-12
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250728    gcc-9.5.0
parisc                randconfig-001-20250729    gcc-10.5.0
parisc                randconfig-002-20250728    gcc-8.5.0
parisc                randconfig-002-20250729    gcc-10.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-22
powerpc                 mpc8313_rdb_defconfig    gcc-15.1.0
powerpc               randconfig-001-20250728    gcc-10.5.0
powerpc               randconfig-001-20250729    gcc-10.5.0
powerpc               randconfig-002-20250728    gcc-13.4.0
powerpc               randconfig-002-20250729    gcc-10.5.0
powerpc               randconfig-003-20250728    gcc-8.5.0
powerpc               randconfig-003-20250729    gcc-10.5.0
powerpc                     tqm8541_defconfig    clang-22
powerpc64             randconfig-001-20250728    clang-22
powerpc64             randconfig-001-20250729    gcc-10.5.0
powerpc64             randconfig-002-20250728    clang-22
powerpc64             randconfig-002-20250729    gcc-10.5.0
powerpc64             randconfig-003-20250728    gcc-8.5.0
powerpc64             randconfig-003-20250729    gcc-10.5.0
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-22
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20250728    clang-22
riscv                 randconfig-001-20250729    clang-22
riscv                 randconfig-002-20250728    gcc-11.5.0
riscv                 randconfig-002-20250729    clang-22
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-22
s390                                defconfig    gcc-12
s390                  randconfig-001-20250728    clang-22
s390                  randconfig-001-20250729    clang-22
s390                  randconfig-002-20250728    clang-17
s390                  randconfig-002-20250729    clang-22
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-12
sh                                  defconfig    gcc-15.1.0
sh                        edosk7705_defconfig    gcc-15.1.0
sh                            migor_defconfig    gcc-15.1.0
sh                    randconfig-001-20250728    gcc-14.3.0
sh                    randconfig-001-20250729    clang-22
sh                    randconfig-002-20250728    gcc-9.5.0
sh                    randconfig-002-20250729    clang-22
sh                          rsk7203_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250728    gcc-8.5.0
sparc                 randconfig-001-20250729    clang-22
sparc                 randconfig-002-20250728    gcc-14.3.0
sparc                 randconfig-002-20250729    clang-22
sparc64                             defconfig    clang-20
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250728    clang-20
sparc64               randconfig-001-20250729    clang-22
sparc64               randconfig-002-20250728    gcc-12.5.0
sparc64               randconfig-002-20250729    clang-22
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-12
um                                  defconfig    clang-22
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250728    clang-22
um                    randconfig-001-20250729    clang-22
um                    randconfig-002-20250728    gcc-12
um                    randconfig-002-20250729    clang-22
um                           x86_64_defconfig    clang-22
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250728    clang-20
x86_64      buildonly-randconfig-001-20250729    clang-20
x86_64      buildonly-randconfig-002-20250728    clang-20
x86_64      buildonly-randconfig-002-20250729    clang-20
x86_64      buildonly-randconfig-003-20250728    clang-20
x86_64      buildonly-randconfig-003-20250729    clang-20
x86_64      buildonly-randconfig-004-20250728    clang-20
x86_64      buildonly-randconfig-004-20250729    clang-20
x86_64      buildonly-randconfig-005-20250728    clang-20
x86_64      buildonly-randconfig-005-20250729    clang-20
x86_64      buildonly-randconfig-006-20250728    gcc-12
x86_64      buildonly-randconfig-006-20250729    clang-20
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250728    gcc-8.5.0
xtensa                randconfig-001-20250729    clang-22
xtensa                randconfig-002-20250728    gcc-8.5.0
xtensa                randconfig-002-20250729    clang-22

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
