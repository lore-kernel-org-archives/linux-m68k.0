Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD77E17A591
	for <linux-m68k@lists.linux-m68k.org>; Tue, 17 Sep 2024 21:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726607380; cv=none; b=iIsn9HxUU+KX/iY2+aD/LSmuZnGXHI6Bt3XNODPGfBrIJszK6jekhjTnaXo9sWD1nRiKf1P9at/sS0b6Gtn1My7WdqURoy41uG6EXkASgi+CKBisvyuNz+bkNY347TydIGaf5yrely2EdjQ5qew8wbf8YBffDBdVFsnkCrNhY/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726607380; c=relaxed/simple;
	bh=aaId1CXTkSTjT13+8JZBxHGYTy+DsaTbya/Iwmt8xyc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hiWZr5FAVPHV8f0qaBrW1t6iTrKBP8j0jNAdcSfTOXC9GfFjV/nL2iB2R3N0KV23wPWINCP1BgqT6sWk3OzMKcrCtjJViCr0O5pFXKCpz/EHiURR+HhmNjhUmgROISHrQU/4D4KApXfNoxQ/Ujrq26uljs2XGJHfZny2N+xKaLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gbYiHKEb; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gbYiHKEb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726607378; x=1758143378;
  h=date:from:to:cc:subject:message-id;
  bh=aaId1CXTkSTjT13+8JZBxHGYTy+DsaTbya/Iwmt8xyc=;
  b=gbYiHKEbp72LxzIlX3rS6l46bcqx7bhTZK3KM4WoL1twS6b/kw1hlTmq
   N70+5py1fXcszN8ajW4V+U/Q/vQ+f5B1a2G0SFYPLpjnHUYWh05Q0WfpW
   a/+Z9clUyu2ZsRsBUnhPzoK/b/XSWH24JdB7MDQPvNlop6xaFfuqi93g+
   9CWcnF1mkspsXsJcLe+Wu/KGJ+6vF/mPBerk6iePSPsMSpdcTydv0/LQS
   c4Lq7fwS5Xc4oV2HiwRGUcIU7D7loYKqOt85pzYZfmtC3VQQZB9f/XTJ5
   TPUY1mz5Wh9WOM1UdJ200pjDj8JL4QtBmf49jU4rVexJVCHuCpQBiE/pS
   w==;
X-CSE-ConnectionGUID: ZZidR3j5QjOeZpiJH2PPuA==
X-CSE-MsgGUID: +G0eDT9AQai+Y3h4m/5J9Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11198"; a="29386815"
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; 
   d="scan'208";a="29386815"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2024 14:09:37 -0700
X-CSE-ConnectionGUID: Kv5JL6c1Tm+pbM+ptBGckg==
X-CSE-MsgGUID: 7XFNN60mQZC6vHtUVfMnYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; 
   d="scan'208";a="73884679"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 17 Sep 2024 14:09:36 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sqfS2-000BXg-11;
	Tue, 17 Sep 2024 21:09:34 +0000
Date: Wed, 18 Sep 2024 05:08:47 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:master] BUILD SUCCESS
 5c8d618072705e3043c69077b9328aaef6888037
Message-ID: <202409180539.npP0R6wU-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git master
branch HEAD: 5c8d618072705e3043c69077b9328aaef6888037  Merge tag 'v6.11'

elapsed time: 1797m

configs tested: 127
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.1.0
alpha                               defconfig    gcc-14.1.0
arc                              allmodconfig    clang-20
arc                               allnoconfig    gcc-14.1.0
arc                              allyesconfig    clang-20
arc                                 defconfig    gcc-14.1.0
arm                              allmodconfig    clang-20
arm                               allnoconfig    gcc-14.1.0
arm                              allyesconfig    clang-20
arm                                 defconfig    gcc-14.1.0
arm                          ixp4xx_defconfig    gcc-14.1.0
arm                        multi_v7_defconfig    gcc-14.1.0
arm                          sp7021_defconfig    gcc-14.1.0
arm                        spear3xx_defconfig    gcc-14.1.0
arm64                            alldefconfig    gcc-14.1.0
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.1.0
arm64                               defconfig    gcc-14.1.0
csky                              allnoconfig    gcc-14.1.0
csky                                defconfig    gcc-14.1.0
hexagon                           allnoconfig    gcc-14.1.0
hexagon                             defconfig    gcc-14.1.0
i386                             allmodconfig    clang-18
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-18
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-18
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20240917    clang-18
i386        buildonly-randconfig-002-20240917    clang-18
i386        buildonly-randconfig-002-20240917    gcc-12
i386        buildonly-randconfig-003-20240917    clang-18
i386        buildonly-randconfig-004-20240917    clang-18
i386        buildonly-randconfig-005-20240917    clang-18
i386        buildonly-randconfig-006-20240917    clang-18
i386        buildonly-randconfig-006-20240917    gcc-12
i386                                defconfig    clang-18
i386                  randconfig-001-20240917    clang-18
i386                  randconfig-001-20240917    gcc-12
i386                  randconfig-002-20240917    clang-18
i386                  randconfig-002-20240917    gcc-12
i386                  randconfig-003-20240917    clang-18
i386                  randconfig-004-20240917    clang-18
i386                  randconfig-004-20240917    gcc-12
i386                  randconfig-005-20240917    clang-18
i386                  randconfig-005-20240917    gcc-12
i386                  randconfig-006-20240917    clang-18
i386                  randconfig-011-20240917    clang-18
i386                  randconfig-011-20240917    gcc-12
i386                  randconfig-012-20240917    clang-18
i386                  randconfig-013-20240917    clang-18
i386                  randconfig-014-20240917    clang-18
i386                  randconfig-015-20240917    clang-18
i386                  randconfig-015-20240917    gcc-12
i386                  randconfig-016-20240917    clang-18
i386                  randconfig-016-20240917    gcc-12
loongarch                        allmodconfig    gcc-14.1.0
loongarch                         allnoconfig    gcc-14.1.0
loongarch                           defconfig    gcc-14.1.0
m68k                             allmodconfig    gcc-14.1.0
m68k                              allnoconfig    gcc-14.1.0
m68k                             allyesconfig    gcc-14.1.0
m68k                                defconfig    gcc-14.1.0
microblaze                       allmodconfig    gcc-14.1.0
microblaze                        allnoconfig    gcc-14.1.0
microblaze                       allyesconfig    gcc-14.1.0
microblaze                          defconfig    gcc-14.1.0
mips                              allnoconfig    gcc-14.1.0
mips                 decstation_r4k_defconfig    gcc-14.1.0
mips                  maltasmvp_eva_defconfig    gcc-14.1.0
mips                        omega2p_defconfig    gcc-14.1.0
mips                          rm200_defconfig    gcc-14.1.0
nios2                             allnoconfig    gcc-14.1.0
nios2                               defconfig    gcc-14.1.0
openrisc                          allnoconfig    clang-20
openrisc                          allnoconfig    gcc-14.1.0
openrisc                         allyesconfig    gcc-14.1.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-14.1.0
parisc                            allnoconfig    clang-20
parisc                            allnoconfig    gcc-14.1.0
parisc                           allyesconfig    gcc-14.1.0
parisc                              defconfig    gcc-12
parisc64                            defconfig    gcc-14.1.0
powerpc                     akebono_defconfig    gcc-14.1.0
powerpc                          allmodconfig    gcc-14.1.0
powerpc                           allnoconfig    clang-20
powerpc                           allnoconfig    gcc-14.1.0
powerpc                          allyesconfig    gcc-14.1.0
powerpc                       eiger_defconfig    gcc-14.1.0
powerpc                        fsp2_defconfig    gcc-14.1.0
powerpc                     mpc5200_defconfig    gcc-14.1.0
powerpc                     mpc83xx_defconfig    gcc-14.1.0
riscv                            allmodconfig    gcc-14.1.0
riscv                             allnoconfig    clang-20
riscv                             allnoconfig    gcc-14.1.0
riscv                            allyesconfig    gcc-14.1.0
riscv                               defconfig    gcc-12
s390                             allmodconfig    gcc-14.1.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.1.0
s390                                defconfig    gcc-12
sh                               allmodconfig    gcc-14.1.0
sh                                allnoconfig    gcc-14.1.0
sh                               allyesconfig    gcc-14.1.0
sh                                  defconfig    gcc-12
sh                           se7206_defconfig    gcc-14.1.0
sh                  sh7785lcr_32bit_defconfig    gcc-14.1.0
sparc                            allmodconfig    gcc-14.1.0
sparc64                             defconfig    gcc-12
um                                allnoconfig    clang-17
um                                allnoconfig    clang-20
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-18
x86_64                           allyesconfig    clang-18
x86_64                              defconfig    clang-18
x86_64                              defconfig    gcc-11
x86_64                           rhel-8.3-bpf    clang-18
x86_64                           rhel-8.3-bpf    gcc-12
x86_64                         rhel-8.3-kunit    clang-18
x86_64                         rhel-8.3-kunit    gcc-12
x86_64                           rhel-8.3-ltp    clang-18
x86_64                           rhel-8.3-ltp    gcc-12
x86_64                          rhel-8.3-rust    clang-18
xtensa                            allnoconfig    gcc-14.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
