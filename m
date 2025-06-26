Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79BBD1DE2DC
	for <linux-m68k@lists.linux-m68k.org>; Thu, 26 Jun 2025 11:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750937108; cv=none; b=QVYk2Mh7+pBitSGmnmDG4wBWHNvmkoqJ6i9eo0JLkeg5bzX44l/JbUvsEN1cBuSb3+l5lT2Zn9LpqdGJ5L17+ArFXP536B2LOfHbAubwtgHGdJrlhqRyobGYK8l515tBkTve1KCB+/JRB0VQ9a+01/u1hjOJbnKTjD7/XCiBj1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750937108; c=relaxed/simple;
	bh=WPi7lZxfyGk2K+kKqnWvYWwj/GG6aQbbRdFMQNfcNX8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hm4o6IUve3WlfsAZWxC61WsheK58w8Yf1A8LKdrHOYtyZDYDS4xOd45/heYEu7Di/DemY8UhALXXm9VHmMzneYfVZ3LLGmbDJ+gWb3LUF9wA1nfy6Y4T7J0KTAlJNIv7Xwc6tFvcDX8vfnFRpkx8rlEJlKIm1C7foW+0axNv0m4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gRe+9wNW; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gRe+9wNW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750937107; x=1782473107;
  h=date:from:to:cc:subject:message-id;
  bh=WPi7lZxfyGk2K+kKqnWvYWwj/GG6aQbbRdFMQNfcNX8=;
  b=gRe+9wNW7wQbOFTA0TqpL7xf5BNuFqBIt3WnTX2P7l+OD+rTP0a60EZm
   WpDyw+Y6bcMJhzIvoTWOFJc6zAcb/tUbl6efnQ7qSCvtELnyIHcLlfUe2
   zau5U0QD/+lLR2pNBrLvbUId55hppjMCHPkkXpdkZ0u8KO7SqV3MNNns0
   HrYX30RtCa4JPGx8NLxwneg0wHkkIQLUNMcetDUBIIgtjoAFCaC46f8u5
   ZiXn9caL+w1UPgvUuciLxt/hZ0BxADgjANfBS//V/6CTqQlrF8o87Dsr1
   jebK2RV9AEOwqXOpJcr6mkGuwtvNVPiXEWEx8K029yTCki04QZ37cxBkB
   g==;
X-CSE-ConnectionGUID: 1a6k7bZhRdCtDf939LYwoA==
X-CSE-MsgGUID: DyShVcNNT123BYF0wINJpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="78665402"
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="78665402"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 04:25:05 -0700
X-CSE-ConnectionGUID: OMT2AG9SThqJ8+ZLidRkCg==
X-CSE-MsgGUID: y7Ofr7cfSDC4XYCYz61EkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="152994913"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 26 Jun 2025 04:25:05 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uUkiz-000Tzy-2y;
	Thu, 26 Jun 2025 11:25:01 +0000
Date: Thu, 26 Jun 2025 19:24:24 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:master] BUILD SUCCESS
 56305a98e411188bfdb8b66d6595d083b96897e7
Message-ID: <202506261914.iLP3Vzv5-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git master
branch HEAD: 56305a98e411188bfdb8b66d6595d083b96897e7  Merge tag 'v6.16-rc3'

elapsed time: 1455m

configs tested: 70
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                   randconfig-001-20250625    gcc-11.5.0
arc                   randconfig-002-20250625    gcc-12.4.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-15.1.0
arm                   randconfig-001-20250625    clang-21
arm                   randconfig-002-20250625    gcc-11.5.0
arm                   randconfig-003-20250625    gcc-13.3.0
arm                   randconfig-004-20250625    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250625    gcc-11.5.0
arm64                 randconfig-002-20250625    clang-20
arm64                 randconfig-003-20250625    gcc-12.3.0
arm64                 randconfig-004-20250625    clang-20
csky                              allnoconfig    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250625    clang-20
i386        buildonly-randconfig-002-20250625    gcc-12
i386        buildonly-randconfig-003-20250625    gcc-12
i386        buildonly-randconfig-004-20250625    gcc-12
i386        buildonly-randconfig-005-20250625    clang-20
i386        buildonly-randconfig-006-20250625    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-15.1.0
loongarch                         allnoconfig    gcc-15.1.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-14.2.0
openrisc                          allnoconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
riscv                             allnoconfig    gcc-15.1.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250626    clang-20
x86_64      buildonly-randconfig-002-20250626    clang-20
x86_64      buildonly-randconfig-003-20250626    clang-20
x86_64      buildonly-randconfig-004-20250626    clang-20
x86_64      buildonly-randconfig-005-20250626    clang-20
x86_64      buildonly-randconfig-006-20250626    clang-20
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-18
xtensa                            allnoconfig    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
