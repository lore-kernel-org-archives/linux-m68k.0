Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EB0138D416
	for <linux-m68k@lists.linux-m68k.org>; Wed, 10 Jun 2026 20:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781123036; cv=none; b=CxlumkZKtgfykCMPL+iyp+ZOwvy/mfrX4ygT1FQgR59vS+9ZpNO9LlCd0yw8Ofab2zpPs66+J//KigdeolBz4BOYrgppjGUe9f9wtdBJR8ynzA0NdxpCz87H7Ct9W+YkKrhOz0s4/9M3LMFrDHydxy+v3c2T0bSM4CfTG1hTKus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781123036; c=relaxed/simple;
	bh=0uHYJ6GoKnkD/82MJkztHyRKjLqu8upLD4CDsWqVi5Q=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HtLvFClGxs8TKxTXhnx31xXORD16jU4d8zFVCEJ8ZPzRqZ/0TThEiUBD92vL4l7aUF6i3rzDZBt7Mk5h2sXVXyBJB1jMY9Q8uXKErR1jCEz24bjah+UwDa6dDE2QRXnij6A2Po7p3G5TjMNDXANernmnoGdsX74C5pNU0jrIZ3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cGrDwuVc; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cGrDwuVc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781123034; x=1812659034;
  h=date:from:to:cc:subject:message-id;
  bh=0uHYJ6GoKnkD/82MJkztHyRKjLqu8upLD4CDsWqVi5Q=;
  b=cGrDwuVcobD7GmaxMlTpxMLY6VhkoBG1TubYLe0af/Q9/3ytHs24YWRQ
   ZlVf5b9WblImoOYn3qzV+mn7iNnUxXbp4PQlg6gPqMqjtq4tnVrztLNhX
   TU+HPnVmaCi/L5LgF04792bT+iu+tCsinPH9U8DCgr2XETQMgpc94zTIV
   NhbzpPQFViZShLlqLhcDNxhP7lerA/7MAsNoxyiXVeN+TLAg4k84rQw5g
   /nKC36NuhNX+S+PRctB0Qz+ndyR+VkDsDxpRFYLeKBgtX/8QjCE9SRXcw
   ZgXBLeIfC1G4GdUOG9YOd1cXWwj37BXjxI++iAFW0fDBx0+d2JdBSioNO
   Q==;
X-CSE-ConnectionGUID: xgZa0N14Rm+4M85qtbaouQ==
X-CSE-MsgGUID: aP0X29Y3R1+gMUkP8yjD/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="104592154"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="104592154"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 13:23:53 -0700
X-CSE-ConnectionGUID: NpP24xwTQHyxUtUqUFMdeg==
X-CSE-MsgGUID: vOn5J5HxSkupDMTfHfbXbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="241854318"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 10 Jun 2026 13:23:51 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wXPSm-00000000Lso-1wBH;
	Wed, 10 Jun 2026 20:23:48 +0000
Date: Thu, 11 Jun 2026 04:23:26 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:master] BUILD SUCCESS
 06711a7235a6e2f2bc4499dc1384c0cf3de5b188
Message-ID: <202606110417.dVHRkMm2-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git master
branch HEAD: 06711a7235a6e2f2bc4499dc1384c0cf3de5b188  m68k: Correct CONFIG_MVME16x macro name in #endif comment

elapsed time: 780m

configs tested: 107
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-16.1.0
alpha                            allyesconfig    gcc-16.1.0
arc                              allmodconfig    gcc-16.1.0
arc                               allnoconfig    gcc-16.1.0
arc                              allyesconfig    gcc-16.1.0
arc                   randconfig-001-20260611    gcc-14.3.0
arc                   randconfig-002-20260611    gcc-8.5.0
arm                               allnoconfig    clang-23
arm                              allyesconfig    gcc-16.1.0
arm                   randconfig-001-20260611    clang-16
arm                   randconfig-002-20260611    gcc-10.5.0
arm                   randconfig-003-20260611    gcc-12.5.0
arm                   randconfig-004-20260611    clang-17
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-16.1.0
csky                             allmodconfig    gcc-16.1.0
csky                              allnoconfig    gcc-16.1.0
hexagon                          allmodconfig    clang-23
hexagon                           allnoconfig    clang-23
hexagon               randconfig-001-20260610    clang-23
hexagon               randconfig-002-20260610    clang-22
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20260611    clang-22
i386        buildonly-randconfig-002-20260611    clang-22
i386        buildonly-randconfig-003-20260611    clang-22
i386        buildonly-randconfig-004-20260611    clang-22
i386        buildonly-randconfig-005-20260611    gcc-14
i386        buildonly-randconfig-006-20260611    gcc-14
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-20
loongarch             randconfig-001-20260610    gcc-16.1.0
loongarch             randconfig-002-20260610    gcc-16.1.0
m68k                             allmodconfig    gcc-16.1.0
m68k                              allnoconfig    gcc-16.1.0
m68k                             allyesconfig    gcc-16.1.0
microblaze                        allnoconfig    gcc-16.1.0
microblaze                       allyesconfig    gcc-16.1.0
mips                             allmodconfig    gcc-16.1.0
mips                              allnoconfig    gcc-16.1.0
mips                             allyesconfig    gcc-16.1.0
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-11.5.0
nios2                 randconfig-001-20260610    gcc-11.5.0
nios2                 randconfig-002-20260610    gcc-11.5.0
openrisc                         allmodconfig    gcc-16.1.0
openrisc                          allnoconfig    gcc-16.1.0
openrisc                            defconfig    gcc-16.1.0
parisc                           allmodconfig    gcc-16.1.0
parisc                            allnoconfig    gcc-16.1.0
parisc                           allyesconfig    gcc-16.1.0
parisc                              defconfig    gcc-16.1.0
parisc                randconfig-001-20260610    gcc-8.5.0
parisc                randconfig-002-20260610    gcc-8.5.0
powerpc                          allmodconfig    gcc-16.1.0
powerpc                           allnoconfig    gcc-16.1.0
powerpc               randconfig-001-20260610    gcc-9.5.0
powerpc               randconfig-002-20260610    clang-23
powerpc64             randconfig-001-20260610    clang-23
powerpc64             randconfig-002-20260610    gcc-10.5.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    gcc-16.1.0
riscv                            allyesconfig    clang-23
riscv                               defconfig    clang-23
riscv                 randconfig-001-20260610    gcc-15.2.0
riscv                 randconfig-002-20260610    gcc-8.5.0
s390                             allmodconfig    clang-23
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-16.1.0
s390                                defconfig    clang-18
s390                  randconfig-001-20260610    clang-23
s390                  randconfig-002-20260610    clang-23
sh                               allmodconfig    gcc-16.1.0
sh                                allnoconfig    gcc-16.1.0
sh                               allyesconfig    gcc-16.1.0
sh                    randconfig-001-20260610    gcc-16.1.0
sh                    randconfig-002-20260610    gcc-16.1.0
sparc                             allnoconfig    gcc-16.1.0
sparc                               defconfig    gcc-16.1.0
sparc                 randconfig-001-20260610    gcc-8.5.0
sparc                 randconfig-002-20260610    gcc-14.3.0
sparc64                          allmodconfig    clang-20
sparc64               randconfig-001-20260610    gcc-12.5.0
sparc64               randconfig-002-20260610    clang-23
um                               allmodconfig    clang-23
um                                allnoconfig    clang-16
um                               allyesconfig    gcc-14
um                    randconfig-001-20260610    clang-23
um                    randconfig-002-20260610    clang-18
x86_64                           allmodconfig    clang-22
x86_64                            allnoconfig    clang-22
x86_64                           allyesconfig    clang-22
x86_64               buildonly-randconfig-001    gcc-12
x86_64      buildonly-randconfig-001-20260610    clang-22
x86_64               buildonly-randconfig-002    clang-22
x86_64      buildonly-randconfig-002-20260610    gcc-14
x86_64               buildonly-randconfig-003    gcc-14
x86_64      buildonly-randconfig-003-20260610    clang-22
x86_64               buildonly-randconfig-004    gcc-14
x86_64      buildonly-randconfig-004-20260610    clang-22
x86_64               buildonly-randconfig-005    gcc-14
x86_64                          rhel-9.4-rust    clang-22
xtensa                            allnoconfig    gcc-16.1.0
xtensa                           allyesconfig    gcc-16.1.0
xtensa                randconfig-001-20260610    gcc-8.5.0
xtensa                randconfig-002-20260610    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
