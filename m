Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE7EC2E7186
	for <linux-m68k@lists.linux-m68k.org>; Tue,  9 Sep 2025 06:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757397993; cv=none; b=D7aQwFwJgE7CyFP1racaLaul8WuzaFOFC762C38GllZSGszivEJ+/8oRmjk1TlHHzoISpGea9NmSIlNzzzLU7o9mj9IdOrvsXVHqKNiJhOQKqtg0XNztmoeB0adBYcwl3bPOmiJgZwqDgLxJPZFiLzR8HZqpt82qMuxfJ/cYuZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757397993; c=relaxed/simple;
	bh=IoZBpQyKP8BgvtdolmbC2/F9L3Kin/hDbyxmqql+cy0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=AzG3PrpWz5a5GspuVotbnDhcDfM1d5Lj92aSo2nDhywHOcPKvYH/no26cqmtNe3XQhKKqiW5lcI6FTV6iCVyve+MtrUbAlK3A4b4DQ/jzUSP7b0ilT0SP7czwv8iYepEufhp57W4MsYmIxedrZtwfcjS2SFN7EZywYfJHObnJrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i/0dAkqV; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i/0dAkqV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757397992; x=1788933992;
  h=date:from:to:cc:subject:message-id;
  bh=IoZBpQyKP8BgvtdolmbC2/F9L3Kin/hDbyxmqql+cy0=;
  b=i/0dAkqVuvqmIthQBK2UmjJl13swbHlVEGToVEco47bQooIoH6u++pFa
   MgaEyJuPaKnFegjUY/JbsZGXNI6OG7c1XiPw8k0YhdWo4cfEyaMJ5iRkb
   yydVxSro44WPkfs80YC5e9sTkhRpyOIwdZWFA9QhWWej8PTu1w/KLTy5G
   4ZIjavj6EzagG3f/aH1jM2ZDh0QPdJYgLlRa9rFR6HJGPSkEt238OAGZ+
   PZr2Eir0D2O7E9pI8aoWCtaodcVsezKp6hyU+kSRiALdnUqinvDDWMAp6
   MOGY2rC0TRi8SQchNpWdUtUh3R9BeKhihzGBCauuAzP5w8WqjTGQu8w0V
   Q==;
X-CSE-ConnectionGUID: 1qh+e9TzTEOHhty1AArDHg==
X-CSE-MsgGUID: onCEHkipQQin1jgcBQ8nMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63500928"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="63500928"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2025 23:06:31 -0700
X-CSE-ConnectionGUID: KYaiJxEaTbCYCcW/d03U8Q==
X-CSE-MsgGUID: /Qz+odBbQmOZ118EhiV/dA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,250,1751266800"; 
   d="scan'208";a="172167852"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 08 Sep 2025 23:06:29 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uvrUo-0004Ux-3A;
	Tue, 09 Sep 2025 06:06:26 +0000
Date: Tue, 09 Sep 2025 14:05:37 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:master] BUILD SUCCESS
 267e0c6d2da10dd807e37e580768e4486b62f37e
Message-ID: <202509091427.ofjkcdHl-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git master
branch HEAD: 267e0c6d2da10dd807e37e580768e4486b62f37e  Merge tag 'v6.17-rc5'

elapsed time: 1152m

configs tested: 122
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                   randconfig-001-20250908    gcc-8.5.0
arc                   randconfig-002-20250908    gcc-13.4.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    gcc-15.1.0
arm                   randconfig-001-20250908    clang-22
arm                   randconfig-002-20250908    clang-22
arm                   randconfig-003-20250908    gcc-12.5.0
arm                   randconfig-004-20250908    gcc-14.3.0
arm                         s3c6400_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250908    clang-20
arm64                 randconfig-002-20250908    clang-16
arm64                 randconfig-003-20250908    gcc-9.5.0
arm64                 randconfig-004-20250908    gcc-8.5.0
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20250908    gcc-14.3.0
csky                  randconfig-002-20250908    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-22
hexagon               randconfig-001-20250908    clang-17
hexagon               randconfig-002-20250908    clang-20
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20250908    gcc-13
i386        buildonly-randconfig-002-20250908    gcc-13
i386        buildonly-randconfig-003-20250908    gcc-13
i386        buildonly-randconfig-004-20250908    gcc-13
i386        buildonly-randconfig-005-20250908    clang-20
i386        buildonly-randconfig-006-20250908    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch             randconfig-001-20250908    gcc-15.1.0
loongarch             randconfig-002-20250908    clang-18
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20250908    gcc-8.5.0
nios2                 randconfig-002-20250908    gcc-11.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250908    gcc-13.4.0
parisc                randconfig-002-20250908    gcc-8.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-22
powerpc                     ep8248e_defconfig    gcc-15.1.0
powerpc               randconfig-001-20250908    gcc-15.1.0
powerpc               randconfig-002-20250908    clang-19
powerpc               randconfig-003-20250908    gcc-9.5.0
powerpc                     taishan_defconfig    clang-17
powerpc64             randconfig-001-20250908    gcc-8.5.0
powerpc64             randconfig-002-20250908    gcc-10.5.0
powerpc64             randconfig-003-20250908    clang-22
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                 randconfig-001-20250908    gcc-11.5.0
riscv                 randconfig-002-20250908    gcc-13.4.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                  randconfig-001-20250908    clang-22
s390                  randconfig-002-20250908    gcc-12.5.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                    randconfig-001-20250908    gcc-14.3.0
sh                    randconfig-002-20250908    gcc-14.3.0
sh                   secureedge5410_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250908    gcc-8.5.0
sparc                 randconfig-002-20250908    gcc-12.5.0
sparc64               randconfig-001-20250908    gcc-13.4.0
sparc64               randconfig-002-20250908    gcc-8.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20250908    gcc-14
um                    randconfig-002-20250908    clang-22
um                           x86_64_defconfig    clang-22
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250908    clang-20
x86_64      buildonly-randconfig-002-20250908    gcc-14
x86_64      buildonly-randconfig-003-20250908    gcc-13
x86_64      buildonly-randconfig-004-20250908    gcc-14
x86_64      buildonly-randconfig-005-20250908    gcc-14
x86_64      buildonly-randconfig-006-20250908    clang-20
x86_64                              defconfig    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250908    gcc-9.5.0
xtensa                randconfig-002-20250908    gcc-11.5.0
xtensa                    smp_lx200_defconfig    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
