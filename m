Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19074359FAB
	for <linux-m68k@lists.linux-m68k.org>; Tue, 18 Nov 2025 11:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763465483; cv=none; b=S3RTYTwxHfyHTiPgYROdptnwYj4K5ftmgn8dUbbnF2KcDxe8YjjUqsosGE1MAgG/UBWBl41smGnRZdOq16ywKPoI7q+Wdy7LXGYGXMkn3aYc1D8D0rCOkrVjLxEE+RJMKCuUJCbGpAOOyEnwj5v5XOvAkViUv4oqjA8gDA8Z/9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763465483; c=relaxed/simple;
	bh=k4m141xbxIbOckd2Jn9toTt04NExeFnE15d/iNsNzx0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ny7C0342LSMM3dB/Mvl6xM+xxZqljkTdPBE6kGtaBNt9Wob9XYxcd3qCvJ7phT4K7nqa60Mo+OWiTrD1v7shpTJXRl8szSa9AV4FymRuyohswuJHQ4mQALMWie6CxVlcC2EJhg9HJXycmT8/fBDspjybtbAs3A6oJktziiGKu7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VWdZvHYD; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VWdZvHYD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763465482; x=1795001482;
  h=date:from:to:cc:subject:message-id;
  bh=k4m141xbxIbOckd2Jn9toTt04NExeFnE15d/iNsNzx0=;
  b=VWdZvHYDN/QjxL/WYOyjI9HQKhHsdr4a423vVk0ofuTQ0g+lyn9vGx3+
   AB73WMVi8twdcADbAu9RRGpVMrYhBA6IryVOdB1bObr8Z5DbmnY9gUjUr
   +uAWZulnBAgYN7rGE/FlA4uh4Z0OYu1ZKFjZ846nL174nZf3bnE8z49/N
   buGan/qQPcg1NWSdRac4NEv8msO5kRQPQwiYMjpWymvIQqc8zxjuTSiLs
   4EjESbyrZCFaBcTBOXvTJo9zFbLDg+i3fq7q/+NGav/WmCI2AIZMZ28Vm
   APxpIS9PhCzHI1pI5GIHNi0KGRdtwcf+GW6ntqy0Hhsmm9fWnV2oLjv1B
   w==;
X-CSE-ConnectionGUID: LKMzN7NwTsiJBMhng8Bn7A==
X-CSE-MsgGUID: L/uHX0LqTp+HVmJImmHKEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="76085764"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="76085764"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 03:31:21 -0800
X-CSE-ConnectionGUID: 3zhlqB+MTpmwGaVTugLN6A==
X-CSE-MsgGUID: tgKky9xYRfOyew7FcIcoww==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 18 Nov 2025 03:31:19 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vLJvZ-0001f9-17;
	Tue, 18 Nov 2025 11:31:17 +0000
Date: Tue, 18 Nov 2025 19:31:16 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:master] BUILD SUCCESS
 0ad9a06eabc5976fe4b521278941509d124d02dc
Message-ID: <202511181911.dHCoDjVb-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git master
branch HEAD: 0ad9a06eabc5976fe4b521278941509d124d02dc  Merge tag 'v6.18-rc6'

elapsed time: 1544m

configs tested: 128
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                   randconfig-001-20251117    gcc-14.3.0
arc                   randconfig-002-20251117    gcc-9.5.0
arm                               allnoconfig    clang-22
arm                         lpc18xx_defconfig    clang-22
arm                   randconfig-001-20251117    clang-22
arm                   randconfig-002-20251117    gcc-14.3.0
arm                   randconfig-003-20251117    gcc-12.5.0
arm                   randconfig-004-20251117    gcc-10.5.0
arm                        spear6xx_defconfig    clang-22
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20251117    clang-22
arm64                 randconfig-002-20251117    gcc-15.1.0
arm64                 randconfig-003-20251117    gcc-8.5.0
arm64                 randconfig-004-20251117    gcc-9.5.0
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20251117    gcc-12.5.0
csky                  randconfig-002-20251117    gcc-9.5.0
hexagon                           allnoconfig    clang-22
hexagon               randconfig-001-20251118    clang-16
hexagon               randconfig-002-20251118    clang-22
i386                              allnoconfig    gcc-14
i386        buildonly-randconfig-001-20251118    clang-20
i386        buildonly-randconfig-002-20251118    clang-20
i386        buildonly-randconfig-003-20251118    clang-20
i386        buildonly-randconfig-004-20251118    clang-20
i386        buildonly-randconfig-005-20251118    gcc-13
i386        buildonly-randconfig-006-20251118    clang-20
i386                  randconfig-001-20251118    clang-20
i386                  randconfig-002-20251118    clang-20
i386                  randconfig-003-20251118    gcc-14
i386                  randconfig-004-20251118    gcc-14
i386                  randconfig-005-20251118    clang-20
i386                  randconfig-006-20251118    gcc-14
i386                  randconfig-007-20251118    gcc-14
i386                  randconfig-011-20251118    gcc-14
i386                  randconfig-012-20251118    gcc-12
i386                  randconfig-013-20251118    clang-20
i386                  randconfig-014-20251118    gcc-14
i386                  randconfig-015-20251118    gcc-14
i386                  randconfig-016-20251118    gcc-14
i386                  randconfig-017-20251118    clang-20
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20251118    gcc-15.1.0
loongarch             randconfig-002-20251118    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                                defconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                         db1xxx_defconfig    clang-22
mips                          eyeq6_defconfig    clang-22
mips                        maltaup_defconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20251118    gcc-11.5.0
nios2                 randconfig-002-20251118    gcc-8.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251118    gcc-14.3.0
parisc                randconfig-002-20251118    gcc-12.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                      ppc44x_defconfig    clang-22
powerpc               randconfig-001-20251118    clang-22
powerpc               randconfig-002-20251118    clang-22
powerpc64             randconfig-001-20251118    gcc-13.4.0
powerpc64             randconfig-002-20251118    gcc-8.5.0
riscv                             allnoconfig    gcc-15.1.0
riscv                               defconfig    clang-22
riscv                 randconfig-001-20251117    gcc-12.5.0
riscv                 randconfig-002-20251117    gcc-15.1.0
s390                              allnoconfig    clang-22
s390                                defconfig    clang-22
s390                  randconfig-001-20251117    gcc-14.3.0
s390                  randconfig-002-20251117    clang-22
sh                                allnoconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                    randconfig-001-20251117    gcc-15.1.0
sh                    randconfig-002-20251117    gcc-15.1.0
sh                          rsk7269_defconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251118    gcc-8.5.0
sparc                 randconfig-002-20251118    gcc-8.5.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20251118    clang-22
sparc64               randconfig-002-20251118    clang-22
um                                allnoconfig    clang-22
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251118    clang-22
um                    randconfig-002-20251118    clang-22
um                           x86_64_defconfig    clang-22
x86_64                            allnoconfig    clang-20
x86_64      buildonly-randconfig-001-20251118    clang-20
x86_64      buildonly-randconfig-002-20251118    gcc-14
x86_64      buildonly-randconfig-003-20251118    clang-20
x86_64      buildonly-randconfig-004-20251118    clang-20
x86_64      buildonly-randconfig-005-20251118    clang-20
x86_64      buildonly-randconfig-006-20251118    clang-20
x86_64                              defconfig    gcc-14
x86_64                randconfig-001-20251118    clang-20
x86_64                randconfig-002-20251118    gcc-12
x86_64                randconfig-003-20251118    gcc-14
x86_64                randconfig-004-20251118    gcc-14
x86_64                randconfig-005-20251118    clang-20
x86_64                randconfig-006-20251118    clang-20
x86_64                randconfig-011-20251118    clang-20
x86_64                randconfig-012-20251118    clang-20
x86_64                randconfig-013-20251118    gcc-14
x86_64                randconfig-014-20251118    clang-20
x86_64                randconfig-015-20251118    clang-20
x86_64                randconfig-016-20251118    clang-20
x86_64                randconfig-071-20251118    gcc-13
x86_64                randconfig-072-20251118    clang-20
x86_64                randconfig-073-20251118    gcc-14
x86_64                randconfig-074-20251118    gcc-13
x86_64                randconfig-075-20251118    gcc-14
x86_64                randconfig-076-20251118    clang-20
xtensa                           alldefconfig    gcc-15.1.0
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20251118    gcc-9.5.0
xtensa                randconfig-002-20251118    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
