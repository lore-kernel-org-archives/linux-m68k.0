Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDEF422157B
	for <linux-m68k@lists.linux-m68k.org>; Tue, 11 Nov 2025 17:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762883287; cv=none; b=JBa9VpltIAkwWoti32AkzBgzqoSqVM830lAuSNXJPKj6rPMANNPLCO2J2dSSZcQagBgqljb5My7haovWefMAzFH3gDwZORukP1lsA9GafdOYSSjIUP4N1OZbqk3Bw4jvTcK1zXfX4xqQ4cQAQLgHoRuO9Wz7BKMVTzefa6WpTSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762883287; c=relaxed/simple;
	bh=Y74Lv1vCXGLFdFzav1ZJujVLsB4kBRt8N933J49B3c8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=U2md4i78iEtEXpPf8Hu+ie2qHmLyF4SgGE5f9Fg9v4mrVpRTMFxBitmgsTzUfLdXUFfae6pGNL8DVHW/KsfIb3k7TSuRKoMq9GjNrWbpZJFBvjtK4+76ILvtYXowKXOrjBlzVk6MlxmXKoh7vzNhV7fnlw4FClB4lL4Twv1GEDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=juFoWeg8; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="juFoWeg8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762883286; x=1794419286;
  h=date:from:to:cc:subject:message-id;
  bh=Y74Lv1vCXGLFdFzav1ZJujVLsB4kBRt8N933J49B3c8=;
  b=juFoWeg8gVyUtr3ESTvXgnmJD6364k8X4p7VEhzSnS7qQa1m6YNiYiIo
   53SK31uu+2J5WTC90pe/npYx8MqulVh5fP+lNjlXKE5uplWqE2E2ADrzT
   fxIqtb3A5MDaNkZ5RGdtWysQ4JpS/7dTy9/OTqTQEmwJaSppu/xtUkVam
   kdfEvSRC3gC+9B6SBa7reaG5+tv1Jtf8eaZ30Z84dmaGTiJPxNQT8Ec7W
   diNcWu4XYSXHEzC/alnl2lXQeQfbEV5tObJWaZn01/6lATL25zGsTa7A7
   2RofKiaEcuhtUpbPaR9CdsDuwi4g5wUXKoQ5qO5B5HP5NIL7+UxfhCJdp
   A==;
X-CSE-ConnectionGUID: 6cq/5MUTRsafEeXzK926xg==
X-CSE-MsgGUID: 8zb5IdQ4SjuqgLTBybut1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11610"; a="63954715"
X-IronPort-AV: E=Sophos;i="6.19,297,1754982000"; 
   d="scan'208";a="63954715"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2025 09:48:04 -0800
X-CSE-ConnectionGUID: x5U9LZloStClUXm84BPZlg==
X-CSE-MsgGUID: VowgiYekQXuq3MpBkVdu3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,297,1754982000"; 
   d="scan'208";a="188278772"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 11 Nov 2025 09:48:04 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vIsTJ-0003RP-1C;
	Tue, 11 Nov 2025 17:48:01 +0000
Date: Wed, 12 Nov 2025 01:47:39 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:master] BUILD SUCCESS
 08e3e49c7411b6d09598e2c133ff2dbe492c0a37
Message-ID: <202511120134.nEJWtmBk-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git master
branch HEAD: 08e3e49c7411b6d09598e2c133ff2dbe492c0a37  Merge tag 'v6.18-rc5'

elapsed time: 1863m

configs tested: 96
configs skipped: 12

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                   randconfig-001-20251111    gcc-11.5.0
arc                   randconfig-002-20251111    gcc-12.5.0
arm                               allnoconfig    clang-22
arm                   randconfig-001-20251111    clang-22
arm                   randconfig-002-20251111    clang-17
arm                   randconfig-003-20251111    clang-22
arm                   randconfig-004-20251111    gcc-10.5.0
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20251111    clang-22
arm64                 randconfig-002-20251111    gcc-11.5.0
arm64                 randconfig-003-20251111    clang-16
arm64                 randconfig-004-20251111    clang-22
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20251111    gcc-15.1.0
csky                  randconfig-002-20251111    gcc-15.1.0
hexagon                           allnoconfig    clang-22
i386                              allnoconfig    gcc-14
i386        buildonly-randconfig-001-20251111    clang-20
i386        buildonly-randconfig-002-20251111    gcc-14
i386        buildonly-randconfig-003-20251111    gcc-14
i386        buildonly-randconfig-004-20251111    gcc-14
i386        buildonly-randconfig-005-20251111    gcc-14
i386        buildonly-randconfig-006-20251111    gcc-12
i386                  randconfig-001-20251111    gcc-14
i386                  randconfig-002-20251111    gcc-14
i386                  randconfig-003-20251111    gcc-14
i386                  randconfig-004-20251111    clang-20
i386                  randconfig-011-20251111    clang-20
i386                  randconfig-012-20251111    clang-20
i386                  randconfig-013-20251111    gcc-14
i386                  randconfig-014-20251111    gcc-14
i386                  randconfig-015-20251111    gcc-14
loongarch                         allnoconfig    clang-22
m68k                              allnoconfig    gcc-15.1.0
m68k                                defconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251111    gcc-9.5.0
parisc                randconfig-002-20251111    gcc-8.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc               randconfig-001-20251111    gcc-8.5.0
powerpc               randconfig-002-20251111    clang-22
powerpc64             randconfig-002-20251111    gcc-12.5.0
riscv                             allnoconfig    gcc-15.1.0
riscv                               defconfig    clang-22
riscv                 randconfig-001-20251111    clang-22
riscv                 randconfig-002-20251111    gcc-8.5.0
s390                              allnoconfig    clang-22
s390                                defconfig    clang-22
s390                  randconfig-001-20251111    clang-18
sh                                allnoconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                    randconfig-001-20251111    gcc-14.3.0
sh                    randconfig-002-20251111    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251111    gcc-11.5.0
sparc                 randconfig-002-20251111    gcc-8.5.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20251111    clang-22
sparc64               randconfig-002-20251111    clang-20
um                                allnoconfig    clang-22
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251111    clang-19
um                    randconfig-002-20251111    clang-20
um                           x86_64_defconfig    clang-22
x86_64                            allnoconfig    clang-20
x86_64      buildonly-randconfig-001-20251111    gcc-14
x86_64      buildonly-randconfig-002-20251111    clang-20
x86_64      buildonly-randconfig-003-20251111    gcc-14
x86_64      buildonly-randconfig-004-20251111    gcc-14
x86_64      buildonly-randconfig-005-20251111    gcc-14
x86_64      buildonly-randconfig-006-20251111    gcc-14
x86_64                              defconfig    gcc-14
x86_64                randconfig-012-20251112    gcc-14
x86_64                randconfig-013-20251112    gcc-14
x86_64                randconfig-071-20251111    gcc-14
x86_64                randconfig-072-20251111    clang-20
x86_64                randconfig-073-20251111    gcc-14
x86_64                randconfig-074-20251111    gcc-14
x86_64                randconfig-075-20251111    gcc-14
x86_64                randconfig-076-20251111    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20251111    gcc-12.5.0
xtensa                randconfig-002-20251111    gcc-12.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
