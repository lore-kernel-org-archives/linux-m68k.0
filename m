Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58F7F32471A
	for <linux-m68k@lists.linux-m68k.org>; Tue,  6 Jan 2026 12:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767702605; cv=none; b=oYULq1j7Q11fvZ9wc0U7ZzbjHsuF3xSITUOqqo4rulaXGEuL7vNEoiMyd9WE7jLGAguISlcyi7TXqlugIXz0x5Cg1veuBf6qQLOPyU7HEtVus4AnnKp08FpX8IR8sTcGldsACzCm0sgiYvQZ2+f8v72/x4GZvrxXLahhiy1flOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767702605; c=relaxed/simple;
	bh=kScoJcPO/M4zo5BX4pMoo5vDQQCwmWGMQJvCKxTwDv0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=K0fBsrWQ+hjhINYfGHDUJW0y8hKvQZ4oyR5wpidbzpVs6VHOUEKhyu25eBoYoNZlrndTqoetGKo0B+rTOmwujG6Dj0m+JrXb5Wajzj5tYsYLChh3JYmY51i90a6IZ9tO4tP9ZEiKXtUbm92GNnFGX/dIrM2Bk+3GMWM/0SF8RKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HLaGsTU8; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HLaGsTU8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767702603; x=1799238603;
  h=date:from:to:cc:subject:message-id;
  bh=kScoJcPO/M4zo5BX4pMoo5vDQQCwmWGMQJvCKxTwDv0=;
  b=HLaGsTU81MERpJA6VaiRQFwOqwpaEa0TUb9f8tHx46rbrhMXCpXuqKF/
   n5tMOcqWStduxXpjOtUhBp0YOuPwJmhvDS/H2rO5SAdocAmg1DwkRTDw2
   1vC34DnVpptgTGyrNNm8v+20fXDYXtD1NMrpPGDunFtrIlvpwwkz7VggS
   qTEaMihvSQS7hgh6NHvLzaVgPshdZuGKV1NvXNvoR0PCkABicsBobSZ6h
   NZWE6RaQc9FfxGIHNR01mMldEGIg1aC9lklr5lBturi7vjuHn5cxTmSJJ
   oiH3nQ80PaSZ1GB6L9ityZeQxZtvNMIDbmMhf1c8DljiSZYo8B3D4Z4Q2
   A==;
X-CSE-ConnectionGUID: PD7rupilSZmQoe/wIlti9w==
X-CSE-MsgGUID: r2mLcfZbQTWzlAcf9FmPxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11662"; a="86651444"
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; 
   d="scan'208";a="86651444"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2026 04:30:02 -0800
X-CSE-ConnectionGUID: rGN+QzIrSXWZJ2Cz5RuaCw==
X-CSE-MsgGUID: KlRgOnneR7aKm8FItVgBvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; 
   d="scan'208";a="202700342"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 06 Jan 2026 04:30:01 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vd6CE-000000001wL-0LfN;
	Tue, 06 Jan 2026 12:29:58 +0000
Date: Tue, 06 Jan 2026 20:29:44 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:master] BUILD SUCCESS
 634df17853975c4219460d9eda73d1835750deb8
Message-ID: <202601062035.iD71WvKy-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git master
branch HEAD: 634df17853975c4219460d9eda73d1835750deb8  Merge tag 'v6.19-rc4'

elapsed time: 1505m

configs tested: 112
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                               defconfig    gcc-15.1.0
arc                                 defconfig    gcc-15.1.0
arc                   randconfig-001-20260106    gcc-13.4.0
arc                   randconfig-002-20260106    gcc-8.5.0
arm                         bcm2835_defconfig    clang-22
arm                                 defconfig    clang-22
arm                   randconfig-001-20260106    gcc-11.5.0
arm                   randconfig-002-20260106    clang-22
arm                   randconfig-003-20260106    gcc-10.5.0
arm                   randconfig-004-20260106    gcc-8.5.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20260106    clang-22
arm64                 randconfig-002-20260106    gcc-8.5.0
arm64                 randconfig-003-20260106    gcc-9.5.0
arm64                 randconfig-004-20260106    gcc-10.5.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20260106    gcc-10.5.0
csky                  randconfig-002-20260106    gcc-11.5.0
hexagon                             defconfig    clang-22
hexagon               randconfig-001-20260106    clang-22
hexagon               randconfig-002-20260106    clang-17
i386        buildonly-randconfig-001-20260106    clang-20
i386        buildonly-randconfig-002-20260106    clang-20
i386        buildonly-randconfig-003-20260106    gcc-14
i386        buildonly-randconfig-004-20260106    clang-20
i386        buildonly-randconfig-005-20260106    gcc-14
i386        buildonly-randconfig-006-20260106    clang-20
i386                                defconfig    clang-20
i386                  randconfig-001-20260106    clang-20
i386                  randconfig-002-20260106    gcc-14
i386                  randconfig-003-20260106    clang-20
i386                  randconfig-004-20260106    clang-20
i386                  randconfig-005-20260106    clang-20
i386                  randconfig-006-20260106    clang-20
i386                  randconfig-007-20260106    clang-20
i386                  randconfig-011-20260106    clang-20
i386                  randconfig-012-20260106    gcc-14
i386                  randconfig-013-20260106    gcc-14
i386                  randconfig-014-20260106    clang-20
i386                  randconfig-015-20260106    gcc-14
i386                  randconfig-016-20260106    clang-20
i386                  randconfig-017-20260106    gcc-14
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260106    gcc-15.1.0
loongarch             randconfig-002-20260106    gcc-15.1.0
m68k                                defconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                      maltasmvp_defconfig    gcc-15.1.0
mips                           xway_defconfig    clang-22
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20260106    gcc-8.5.0
nios2                 randconfig-002-20260106    gcc-11.5.0
openrisc                            defconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20260106    gcc-8.5.0
parisc                randconfig-002-20260106    gcc-11.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                    adder875_defconfig    gcc-15.1.0
powerpc                        fsp2_defconfig    gcc-15.1.0
powerpc               randconfig-001-20260106    clang-22
powerpc               randconfig-002-20260106    gcc-8.5.0
powerpc64             randconfig-001-20260106    gcc-8.5.0
powerpc64             randconfig-002-20260106    gcc-8.5.0
riscv                               defconfig    clang-22
riscv                 randconfig-001-20260106    gcc-8.5.0
riscv                 randconfig-002-20260106    clang-22
s390                             alldefconfig    gcc-15.1.0
s390                                defconfig    clang-22
s390                  randconfig-001-20260106    gcc-8.5.0
s390                  randconfig-002-20260106    gcc-14.3.0
sh                                  defconfig    gcc-15.1.0
sh                        edosk7705_defconfig    gcc-15.1.0
sh                    randconfig-001-20260106    gcc-15.1.0
sh                    randconfig-002-20260106    gcc-10.5.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20260106    gcc-11.5.0
sparc                 randconfig-002-20260106    gcc-15.1.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20260106    clang-22
sparc64               randconfig-002-20260106    gcc-15.1.0
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260106    clang-22
um                    randconfig-002-20260106    clang-22
um                           x86_64_defconfig    clang-22
x86_64      buildonly-randconfig-001-20260106    clang-20
x86_64      buildonly-randconfig-002-20260106    gcc-14
x86_64      buildonly-randconfig-003-20260106    clang-20
x86_64      buildonly-randconfig-004-20260106    gcc-14
x86_64      buildonly-randconfig-005-20260106    clang-20
x86_64      buildonly-randconfig-006-20260106    gcc-14
x86_64                              defconfig    gcc-14
x86_64                randconfig-001-20260106    gcc-14
x86_64                randconfig-002-20260106    gcc-14
x86_64                randconfig-003-20260106    clang-20
x86_64                randconfig-004-20260106    clang-20
x86_64                randconfig-005-20260106    gcc-14
x86_64                randconfig-006-20260106    gcc-14
x86_64                randconfig-011-20260106    gcc-14
x86_64                randconfig-012-20260106    gcc-13
x86_64                randconfig-013-20260106    gcc-14
x86_64                randconfig-014-20260106    gcc-14
x86_64                randconfig-015-20260106    clang-20
x86_64                randconfig-016-20260106    clang-20
x86_64                randconfig-071-20260106    gcc-14
x86_64                randconfig-072-20260106    clang-20
x86_64                randconfig-073-20260106    clang-20
x86_64                randconfig-074-20260106    clang-20
x86_64                randconfig-075-20260106    gcc-14
x86_64                randconfig-076-20260106    clang-20
xtensa                randconfig-001-20260106    gcc-8.5.0
xtensa                randconfig-002-20260106    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
