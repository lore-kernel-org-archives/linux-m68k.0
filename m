Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 091FA2750F6
	for <linux-m68k@lists.linux-m68k.org>; Tue, 27 May 2025 13:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748354305; cv=none; b=bbMn62LqcX+tSX+8UMUo2Sv5JJ/LlGJsAS2WXOjgC/6/aIGIFqgdWgE04rKYNYmigxTZ8l1j/AvmQ/GGjxckDTXRSi3ZDwI5H7izNwqZoEjHlcb3lGt5cIffOlDx2AUJ3Q9m6By7VXE2gNNjhGUDSbr9dAr75N57a9p2n3YERSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748354305; c=relaxed/simple;
	bh=LKYU92lVeb99Fk9yNfYON/hkxUyZmTjEhx5e3tzJf7E=;
	h=Date:From:To:Cc:Subject:Message-ID; b=G/GZcGHsNffdHtYaKWZkwSrpISnu8HI5EXzc5Q0KJfg7wfDfy8aGUQtEEj0fF34BguyvTrGhz++uc2uJSB2z3d/Hg//7gHpAB4LisJZJ0EubRL1ClDo5rLDCGaYHA72/g9AX4I8+HOA3WesHgGcUnB6zgiu+eb1OnhxeTOwyxg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OsAtnOqJ; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OsAtnOqJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748354304; x=1779890304;
  h=date:from:to:cc:subject:message-id;
  bh=LKYU92lVeb99Fk9yNfYON/hkxUyZmTjEhx5e3tzJf7E=;
  b=OsAtnOqJ+DUhfJNeDo4eWkCwpHMPUj02O0567VjD747s43dK8I1FCq8C
   Uj5DoMP4EiZeUJ9HRzBN52LVkvEbEJRZXpNx3jXW90qGkg7zi3rW56t+4
   D7Y5Qi9yniuj/Ri2hAaZd1TVRFnwyIsXFZU7mA3g1kycOFw0TW2AEV41D
   bXjoxAA8/mmHnDAHQsosiRDILpIhMeyu98q7Okd6rgCW7+0O4CgrcRHaA
   fbPoNa+765TVq412E61sPAK2PO9oKeLWUhUQ0ybrIl8ZQTuPUNb24Yg5a
   Zgmi+u8r6tyKtmMnz6XuUfOp8et8tMdVx3KA+byGIhotC2KupxeMTWI6w
   w==;
X-CSE-ConnectionGUID: 1by6IdZFSHKe/jGgfKf56A==
X-CSE-MsgGUID: NdPC+f/yQfmAbkAxhZ75Xw==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="49596675"
X-IronPort-AV: E=Sophos;i="6.15,318,1739865600"; 
   d="scan'208";a="49596675"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2025 06:58:22 -0700
X-CSE-ConnectionGUID: PIIPpjWwQoSQS+INq0rpIg==
X-CSE-MsgGUID: wApGDY7HRPSukpJNXYYNXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,318,1739865600"; 
   d="scan'208";a="147853834"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 27 May 2025 06:58:22 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uJuot-000TG2-0R;
	Tue, 27 May 2025 13:58:19 +0000
Date: Tue, 27 May 2025 21:57:48 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:master] BUILD SUCCESS
 90467079d7ec67d7fc50742e26fbb78f20f19007
Message-ID: <202505272139.3seJlz67-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git master
branch HEAD: 90467079d7ec67d7fc50742e26fbb78f20f19007  Merge tag 'v6.15'

elapsed time: 1444m

configs tested: 182
configs skipped: 10

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-19
alpha                            allyesconfig    gcc-14.2.0
alpha                               defconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                                 defconfig    gcc-14.2.0
arc                            hsdk_defconfig    clang-21
arc                     nsimosci_hs_defconfig    gcc-14.2.0
arc                   randconfig-001-20250526    gcc-15.1.0
arc                   randconfig-002-20250526    gcc-15.1.0
arm                               allnoconfig    clang-21
arm                                 defconfig    clang-21
arm                   milbeaut_m10v_defconfig    clang-21
arm                          pxa910_defconfig    gcc-14.2.0
arm                   randconfig-001-20250526    gcc-6.5.0
arm                   randconfig-002-20250526    clang-21
arm                   randconfig-003-20250526    gcc-7.5.0
arm                   randconfig-004-20250526    gcc-7.5.0
arm                         wpcm450_defconfig    gcc-14.2.0
arm64                             allnoconfig    gcc-14.2.0
arm64                               defconfig    gcc-14.2.0
arm64                 randconfig-001-20250526    clang-21
arm64                 randconfig-002-20250526    clang-19
arm64                 randconfig-003-20250526    clang-20
arm64                 randconfig-004-20250526    gcc-5.5.0
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20250526    gcc-9.3.0
csky                  randconfig-002-20250526    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-21
hexagon                             defconfig    clang-21
hexagon               randconfig-001-20250526    clang-19
hexagon               randconfig-002-20250526    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250526    gcc-12
i386        buildonly-randconfig-002-20250526    clang-20
i386        buildonly-randconfig-003-20250526    clang-20
i386        buildonly-randconfig-004-20250526    gcc-12
i386        buildonly-randconfig-005-20250526    clang-20
i386        buildonly-randconfig-006-20250526    gcc-12
i386                                defconfig    clang-20
i386                  randconfig-001-20250527    clang-20
i386                  randconfig-002-20250527    clang-20
i386                  randconfig-003-20250527    clang-20
i386                  randconfig-004-20250527    clang-20
i386                  randconfig-005-20250527    clang-20
i386                  randconfig-006-20250527    clang-20
i386                  randconfig-007-20250527    clang-20
i386                  randconfig-011-20250527    gcc-12
i386                  randconfig-012-20250527    gcc-12
i386                  randconfig-013-20250527    gcc-12
i386                  randconfig-014-20250527    gcc-12
i386                  randconfig-015-20250527    gcc-12
i386                  randconfig-016-20250527    gcc-12
i386                  randconfig-017-20250527    gcc-12
loongarch                        alldefconfig    gcc-14.2.0
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch                           defconfig    gcc-14.2.0
loongarch             randconfig-001-20250526    gcc-15.1.0
loongarch             randconfig-002-20250526    gcc-15.1.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                         apollo_defconfig    clang-21
m68k                                defconfig    gcc-14.2.0
m68k                        m5407c3_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                          defconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                           ci20_defconfig    clang-21
mips                        qi_lb60_defconfig    clang-21
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20250526    gcc-5.5.0
nios2                 randconfig-002-20250526    gcc-9.3.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250526    gcc-6.5.0
parisc                randconfig-002-20250526    gcc-8.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-21
powerpc                       ebony_defconfig    clang-21
powerpc                          g5_defconfig    clang-21
powerpc                        icon_defconfig    clang-21
powerpc                  mpc866_ads_defconfig    clang-21
powerpc               randconfig-001-20250526    clang-21
powerpc               randconfig-002-20250526    clang-18
powerpc               randconfig-003-20250526    clang-21
powerpc                     tqm5200_defconfig    gcc-14.2.0
powerpc64             randconfig-001-20250526    gcc-7.5.0
powerpc64             randconfig-002-20250526    gcc-7.5.0
powerpc64             randconfig-003-20250526    clang-21
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-21
riscv                 randconfig-001-20250526    clang-21
riscv                 randconfig-002-20250526    clang-16
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-21
s390                  randconfig-001-20250526    clang-18
s390                  randconfig-002-20250526    clang-21
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                         ap325rxa_defconfig    gcc-14.2.0
sh                                  defconfig    gcc-14.2.0
sh                     magicpanelr2_defconfig    gcc-14.2.0
sh                          r7780mp_defconfig    gcc-14.2.0
sh                    randconfig-001-20250526    gcc-11.5.0
sh                    randconfig-002-20250526    gcc-7.5.0
sh                           se7751_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250526    gcc-14.2.0
sparc                 randconfig-002-20250526    gcc-14.2.0
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20250526    gcc-14.2.0
sparc64               randconfig-002-20250526    gcc-14.2.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250526    clang-21
um                    randconfig-002-20250526    gcc-12
um                           x86_64_defconfig    clang-21
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250526    gcc-12
x86_64      buildonly-randconfig-002-20250526    gcc-12
x86_64      buildonly-randconfig-003-20250526    clang-20
x86_64      buildonly-randconfig-004-20250526    gcc-12
x86_64      buildonly-randconfig-005-20250526    gcc-12
x86_64      buildonly-randconfig-006-20250526    gcc-12
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250527    clang-20
x86_64                randconfig-002-20250527    clang-20
x86_64                randconfig-003-20250527    clang-20
x86_64                randconfig-004-20250527    clang-20
x86_64                randconfig-005-20250527    clang-20
x86_64                randconfig-006-20250527    clang-20
x86_64                randconfig-007-20250527    clang-20
x86_64                randconfig-008-20250527    clang-20
x86_64                randconfig-071-20250527    clang-20
x86_64                randconfig-072-20250527    clang-20
x86_64                randconfig-073-20250527    clang-20
x86_64                randconfig-074-20250527    clang-20
x86_64                randconfig-075-20250527    clang-20
x86_64                randconfig-076-20250527    clang-20
x86_64                randconfig-077-20250527    clang-20
x86_64                randconfig-078-20250527    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-12
x86_64                         rhel-9.4-kunit    gcc-12
x86_64                           rhel-9.4-ltp    gcc-12
x86_64                          rhel-9.4-rust    clang-18
xtensa                            allnoconfig    gcc-14.2.0
xtensa                  audio_kc705_defconfig    clang-21
xtensa                randconfig-001-20250526    gcc-12.4.0
xtensa                randconfig-002-20250526    gcc-10.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
