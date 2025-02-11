Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60FAA1E885A
	for <linux-m68k@lists.linux-m68k.org>; Tue, 11 Feb 2025 08:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739261074; cv=none; b=ijMJUcsiF+eiW4krHcJAkSH8BR6u3mCO0zXF5+D2C3e0ORProZpAaFis7cgW8ELhvgOmOZHDwK50XIcCAmaBHEbM2WwbUHjlXoiHJvhCJXK9NFHiI5uk3ZsJP/niDIiHcj7fjFfQqxZSdYzkI9lh4uzKokm1MwiZUIp0wN9PjN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739261074; c=relaxed/simple;
	bh=UBXgiXiwUdDlHtV8mAw2mlfLiDvnhV7EbMiNLTRDTOI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hAG1cfIaukjbHk2eFqpdv0MfEJS9m1Np853/P1tPeFM3feKr+x9fbD7W2rM2NtnFNaE2x5w3oiAk0yQr3zjSb0xikhv3yM1xX9j5L67wFZs8WkZ0QmYKfiuCjRTbY58Y7DWsPkYdhR+/iyzXTYPqFT99dof19ZAbiN2F2HKwp7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=azA+DZBH; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="azA+DZBH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739261072; x=1770797072;
  h=date:from:to:cc:subject:message-id;
  bh=UBXgiXiwUdDlHtV8mAw2mlfLiDvnhV7EbMiNLTRDTOI=;
  b=azA+DZBHOMKm1IsEqgn2acqjWMoxq1/qwgYvsijocnleXzsUeWKzatW+
   gFw/7n2WBNYisOYh2Ad/Cg3wJiseHfToFlIxZ3LO/Rrj4JtYR+osbeO14
   YTNdJKaob96hzOv29TVPiw3q+YQUk30Gi4dmifZGPyYgR9lbgW9L7Yzd6
   uHBDTVW8XiDzA5y/9YRFqBR7jGB0mCaAYQ1n62h4YLusd6BfsLJca6WmB
   SYpbbKAdw/VykwOQ0t8eWjJ78qUrwFZACn6t+0etcgmb5w+3O63MmpCF5
   iz9VtbYg/7izB1SeC+32fEc3pXh9hXp3m3dQl1nqKoOm9v0S+btuwEuLE
   Q==;
X-CSE-ConnectionGUID: SaPUdY7AQ0ypizIlebmX3A==
X-CSE-MsgGUID: CA9irRqQTLehUE1CfoK1Yw==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="39754316"
X-IronPort-AV: E=Sophos;i="6.13,276,1732608000"; 
   d="scan'208";a="39754316"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 00:04:30 -0800
X-CSE-ConnectionGUID: VQDaOe7oRzuYXWmXaw+M8A==
X-CSE-MsgGUID: vhUmoUZySni+kvOIy8FGQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,276,1732608000"; 
   d="scan'208";a="117465789"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 11 Feb 2025 00:04:29 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1thlFq-0013u7-1V;
	Tue, 11 Feb 2025 08:04:26 +0000
Date: Tue, 11 Feb 2025 16:03:47 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:master] BUILD SUCCESS
 962dfbfe6fb163ff65e3481d0585208495080884
Message-ID: <202502111641.Y5gayr9j-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git master
branch HEAD: 962dfbfe6fb163ff65e3481d0585208495080884  Merge tag 'v6.14-rc2'

elapsed time: 1127m

configs tested: 93
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                   randconfig-001-20250210    gcc-13.2.0
arc                   randconfig-002-20250210    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                              allyesconfig    gcc-14.2.0
arm                   randconfig-001-20250210    clang-16
arm                   randconfig-002-20250210    gcc-14.2.0
arm                   randconfig-003-20250210    clang-16
arm                   randconfig-004-20250210    gcc-14.2.0
arm64                            allmodconfig    clang-18
arm64                 randconfig-001-20250210    gcc-14.2.0
arm64                 randconfig-002-20250210    clang-21
arm64                 randconfig-003-20250210    clang-21
arm64                 randconfig-004-20250210    gcc-14.2.0
csky                  randconfig-001-20250211    gcc-14.2.0
csky                  randconfig-002-20250211    gcc-14.2.0
hexagon                          allmodconfig    clang-21
hexagon                          allyesconfig    clang-18
hexagon               randconfig-001-20250211    clang-18
hexagon               randconfig-002-20250211    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250210    gcc-12
i386        buildonly-randconfig-002-20250210    gcc-12
i386        buildonly-randconfig-003-20250210    clang-19
i386        buildonly-randconfig-004-20250210    gcc-12
i386        buildonly-randconfig-005-20250210    gcc-12
i386        buildonly-randconfig-006-20250210    gcc-12
i386                                defconfig    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch             randconfig-001-20250211    gcc-14.2.0
loongarch             randconfig-002-20250211    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250211    gcc-14.2.0
nios2                 randconfig-002-20250211    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                randconfig-001-20250211    gcc-14.2.0
parisc                randconfig-002-20250211    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc               randconfig-001-20250211    clang-15
powerpc               randconfig-002-20250211    clang-21
powerpc               randconfig-003-20250211    clang-19
powerpc64             randconfig-001-20250211    clang-21
powerpc64             randconfig-002-20250211    gcc-14.2.0
powerpc64             randconfig-003-20250211    clang-17
riscv                            allmodconfig    clang-21
riscv                            allyesconfig    clang-21
riscv                 randconfig-001-20250211    gcc-14.2.0
riscv                 randconfig-002-20250211    clang-19
s390                             allmodconfig    clang-19
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250211    clang-21
s390                  randconfig-002-20250211    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                    randconfig-001-20250211    gcc-14.2.0
sh                    randconfig-002-20250211    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250211    gcc-14.2.0
sparc                 randconfig-002-20250211    gcc-14.2.0
sparc64               randconfig-001-20250211    gcc-14.2.0
sparc64               randconfig-002-20250211    gcc-14.2.0
um                               allmodconfig    clang-21
um                               allyesconfig    gcc-12
um                    randconfig-001-20250211    clang-17
um                    randconfig-002-20250211    clang-15
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250210    clang-19
x86_64      buildonly-randconfig-002-20250210    gcc-12
x86_64      buildonly-randconfig-003-20250210    clang-19
x86_64      buildonly-randconfig-004-20250210    clang-19
x86_64      buildonly-randconfig-005-20250210    clang-19
x86_64      buildonly-randconfig-006-20250210    clang-19
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250211    gcc-14.2.0
xtensa                randconfig-002-20250211    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
