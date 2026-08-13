Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83706472F73
	for <linux-m68k@lists.linux-m68k.org>; Thu, 13 Aug 2026 13:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786627234; cv=none; b=MMTk5keHnXL6w9dKqH449HHCU9pwT5UVTR/0C2jdmoYjPDZAvlryPJ//nm8QnPCOuKQWZlwdcX4WUewO8wa5w8jgVgn0un0GrYtzcWHRbgtmL9vISnlzCAxp/1IDlH0HhIGgGFa3E1Fac+e+cb5eUhIYyKVvkk+hOCovRDKxMPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786627234; c=relaxed/simple;
	bh=DUVI2geeKuIaZD/r5hejexRLa/zyQcvlu4bNG5O16jY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mR+FdyPmQG3qavpI8rHaRPItxZwQ9urUCLTu67AoWoR+VARZNKrcLeGQGQ3D8gW9hq6FNRWdFaDA8ZWIN9bMJeMEvXDbDZCpIzp/m+b97nzHjxcFwReFPtnHhr3r5OSkWKxtGapgcEhWwXwQ8p+jyELYe3rMEN8GG+pe9D1GxNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UZAEpVgV; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UZAEpVgV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786627232; x=1818163232;
  h=date:from:to:cc:subject:message-id;
  bh=DUVI2geeKuIaZD/r5hejexRLa/zyQcvlu4bNG5O16jY=;
  b=UZAEpVgVedDDshmUkNXHXH9xWLV6NdDw2KfCd2sBo0kzs5T4P0pDcxoW
   p+luYyBLOokAVLqX7zg64LSlkqg+S7CGtifTO5RbxK4pGpkEz4/DfLtdc
   LWbo8chpvcad/8dFETOrNYOcHozk11cFhAmrnJXntwOEq0qnAm1YSAgbC
   QhI1pvkz6ERwHzrEPQ3qUCARt7oLIK+wWqLtF3rAYDP2GqiDenikMz+Qm
   z9ZbZ5EIXNPjoV0h82BQ/Y04qdRQyRjZRAuzbsmnTDz8cKq7BnW8iWz+a
   /Gdq+fU2G4VuX/geedO9rrtTCmnWklb5mD6pIbEsYUzvMtb0nmhfey1CZ
   g==;
X-CSE-ConnectionGUID: L05/ZKb6SzOVXhZY8cn87A==
X-CSE-MsgGUID: inLBKSkqSHq7BiJcZYa3WQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="104733695"
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; 
   d="scan'208";a="104733695"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2026 06:20:18 -0700
X-CSE-ConnectionGUID: 2bJLMcShQq2RVKhhzU42iA==
X-CSE-MsgGUID: 4AByHMjyShmKN5y2P+CJsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; 
   d="scan'208";a="288726002"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 13 Aug 2026 06:20:18 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wuVM0-00000000U9u-0x5m;
	Thu, 13 Aug 2026 13:20:16 +0000
Date: Thu, 13 Aug 2026 21:19:54 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:for-linus] BUILD SUCCESS
 1fd495ef09eef96169a379a749c24b5e69974bb8
Message-ID: <202608132143.U1VZhjZR-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git for-linus
branch HEAD: 1fd495ef09eef96169a379a749c24b5e69974bb8  m68k: Define NR_CPUS to 1

elapsed time: 1519m

configs tested: 110
configs skipped: 138

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allnoconfig    gcc-16.1.0
alpha                           allyesconfig    gcc-16.1.0
alpha                              defconfig    gcc-16.1.0
arc                             allmodconfig    gcc-16.1.0
arc                             allyesconfig    gcc-16.1.0
arc                           randconfig-001    gcc-13.4.0
arc                  randconfig-001-20260813    gcc-13.4.0
arc                  randconfig-002-20260813    gcc-13.4.0
arm                       keystone_defconfig    gcc-16.1.0
arm                  randconfig-001-20260813    gcc-13.4.0
arm                  randconfig-002-20260813    gcc-13.4.0
arm                  randconfig-003-20260813    gcc-13.4.0
arm                  randconfig-004-20260813    gcc-13.4.0
arm64                         randconfig-001    gcc-14.3.0
arm64                randconfig-001-20260813    gcc-14.3.0
arm64                randconfig-001-20260813    gcc-16.1.0
arm64                randconfig-002-20260813    gcc-14.3.0
arm64                randconfig-002-20260813    gcc-16.1.0
arm64                randconfig-003-20260813    gcc-14.3.0
arm64                randconfig-003-20260813    gcc-16.1.0
arm64                randconfig-004-20260813    gcc-14.3.0
arm64                randconfig-004-20260813    gcc-16.1.0
csky                            allmodconfig    gcc-16.1.0
csky                 randconfig-001-20260813    gcc-14.3.0
csky                 randconfig-001-20260813    gcc-16.1.0
csky                 randconfig-002-20260813    gcc-14.3.0
csky                 randconfig-002-20260813    gcc-16.1.0
hexagon              randconfig-001-20260813    gcc-11.5.0
hexagon              randconfig-002-20260813    gcc-11.5.0
i386                            allmodconfig    gcc-14
i386       buildonly-randconfig-001-20260813    gcc-14
i386       buildonly-randconfig-002-20260813    gcc-14
i386       buildonly-randconfig-003-20260813    gcc-14
i386       buildonly-randconfig-004-20260813    gcc-14
i386       buildonly-randconfig-005-20260813    gcc-14
i386       buildonly-randconfig-006-20260813    gcc-14
i386                 randconfig-001-20260813    clang-22
i386                 randconfig-002-20260813    clang-22
i386                 randconfig-003-20260813    clang-22
i386                 randconfig-004-20260813    clang-22
i386                 randconfig-005-20260813    clang-22
i386                 randconfig-006-20260813    clang-22
i386                 randconfig-007-20260813    clang-22
i386                 randconfig-011-20260813    clang-22
i386                 randconfig-012-20260813    clang-22
i386                 randconfig-013-20260813    clang-22
i386                 randconfig-014-20260813    clang-22
i386                 randconfig-015-20260813    clang-22
i386                 randconfig-016-20260813    clang-22
i386                 randconfig-017-20260813    clang-22
loongarch                          defconfig    clang-24
loongarch            randconfig-001-20260813    gcc-11.5.0
loongarch            randconfig-002-20260813    gcc-11.5.0
nios2                           allmodconfig    gcc-11.5.0
nios2                            allnoconfig    gcc-11.5.0
nios2                randconfig-001-20260813    gcc-11.5.0
nios2                randconfig-002-20260813    gcc-11.5.0
parisc                          allmodconfig    gcc-16.1.0
parisc                          allyesconfig    gcc-16.1.0
parisc                             defconfig    gcc-16.1.0
parisc               randconfig-001-20260813    gcc-10.5.0
parisc               randconfig-002-20260813    gcc-10.5.0
powerpc                   adder875_defconfig    gcc-16.1.0
powerpc                   amigaone_defconfig    gcc-16.1.0
powerpc              randconfig-001-20260813    gcc-10.5.0
powerpc              randconfig-002-20260813    gcc-10.5.0
powerpc64            randconfig-001-20260813    gcc-10.5.0
powerpc64            randconfig-002-20260813    gcc-10.5.0
riscv                         randconfig-001    gcc-10.5.0
riscv                randconfig-001-20260813    gcc-10.5.0
riscv                randconfig-002-20260813    gcc-10.5.0
s390                 randconfig-001-20260813    gcc-10.5.0
s390                 randconfig-002-20260813    gcc-10.5.0
sh                                 defconfig    gcc-16.1.0
sh                   randconfig-001-20260813    gcc-10.5.0
sh                   randconfig-002-20260813    gcc-10.5.0
sparc                randconfig-001-20260813    clang-20
sparc                randconfig-002-20260813    clang-20
sparc64              randconfig-001-20260813    clang-20
sparc64              randconfig-002-20260813    clang-20
um                   randconfig-001-20260813    clang-20
um                   randconfig-002-20260813    clang-20
x86_64     buildonly-randconfig-001-20260813    gcc-14
x86_64     buildonly-randconfig-002-20260813    gcc-14
x86_64     buildonly-randconfig-003-20260813    gcc-14
x86_64     buildonly-randconfig-004-20260813    gcc-14
x86_64     buildonly-randconfig-005-20260813    gcc-14
x86_64     buildonly-randconfig-006-20260813    gcc-14
x86_64                                 kexec    clang-22
x86_64               randconfig-001-20260813    gcc-13
x86_64               randconfig-002-20260813    gcc-13
x86_64               randconfig-003-20260813    gcc-13
x86_64               randconfig-004-20260813    gcc-13
x86_64               randconfig-005-20260813    gcc-13
x86_64               randconfig-006-20260813    gcc-13
x86_64               randconfig-011-20260813    gcc-14
x86_64               randconfig-012-20260813    gcc-14
x86_64               randconfig-013-20260813    gcc-14
x86_64               randconfig-014-20260813    gcc-14
x86_64               randconfig-015-20260813    gcc-14
x86_64               randconfig-016-20260813    gcc-14
x86_64               randconfig-071-20260813    gcc-14
x86_64               randconfig-072-20260813    gcc-14
x86_64               randconfig-073-20260813    gcc-14
x86_64               randconfig-074-20260813    gcc-14
x86_64               randconfig-075-20260813    gcc-14
x86_64               randconfig-076-20260813    gcc-14
x86_64                          rhel-9.4-bpf    gcc-14
xtensa               randconfig-001-20260813    clang-20
xtensa               randconfig-002-20260813    clang-20

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
