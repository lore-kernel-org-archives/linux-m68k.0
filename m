Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4DAA23E325
	for <linux-m68k@lists.linux-m68k.org>; Tue, 14 Apr 2026 13:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776173446; cv=none; b=OAxVJ3BEfLftxF8doGThrSmvbXrf3/12tSt9WEEwanLtVzRWRFcKYuQq35EypT5JQ/GA3Opjpm/Jb2WmVBCPPXFo9gVHxQpHjXg3ekAeBUESmUGxlivEoNm1btul73FA0dXwusj+FtWsg/ZTgRu5lww+mt2htvYbR+hdx5HOFGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776173446; c=relaxed/simple;
	bh=8Itk0Jut4jI3YW2S1f48t/WEgPNQ+Ogh3Y7wklOy/FM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=G17ovSpRxMVhI0RAOP04rarHpxMVuHTjQ5riIEF7Se/BQP8e32PBVSmraKnMix99tNV/h46LbxhIwJ4xFSE/IbnzO4Yb7m22hP742bLNrBFNGcfyh9dgmTApEX/xW3Xh5o/CkNb9QD3S7I3ZxbmK6zWR8KiOClenMZU5jlnza2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=goWXG0JE; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="goWXG0JE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776173445; x=1807709445;
  h=date:from:to:cc:subject:message-id;
  bh=8Itk0Jut4jI3YW2S1f48t/WEgPNQ+Ogh3Y7wklOy/FM=;
  b=goWXG0JEkRch+dQo9FwJwlV+C0utP9XQRyCnBQhW4xLauVfmp8uYwSj5
   68uDTy1SjQeVc1IUVDauK469o3Ur1Xsbi8CmDbonV+1rxv0m11uQXYc54
   it7VF4e+qGzBoti1psy9/ojICogYF1KMndwKIDF8H1qp1ZSo5TuhS7gLW
   p9WB9emivrp6Yp9h5h011DF2YUTu/0n4R7r4wSmSVhquVoNZXrGTaWO1y
   2osI+LDTklKaVJExRnpoKIzC0nRB6rnNE5qdkp021uOhNjteiNRMgUIya
   aAs82cwI39Cq4twVlRRmlF5624UiKM5wiDmN/Ls+LAfKQKIbk/Pu+0GAI
   w==;
X-CSE-ConnectionGUID: dZ0tpXThTRig5eoGSuJJcg==
X-CSE-MsgGUID: IBLUQ0lUR0CFV05icKUJGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="77201014"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="77201014"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 06:30:43 -0700
X-CSE-ConnectionGUID: ntWVbsFSQ4663TFFY6ddIQ==
X-CSE-MsgGUID: cHaD8ccPTOqyqyokznm+Mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="235031483"
Received: from lkp-server01.sh.intel.com (HELO 7b0b59b3a0d4) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 14 Apr 2026 06:30:42 -0700
Received: from kbuild by 7b0b59b3a0d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wCdqh-000000001Tp-3Kmq;
	Tue, 14 Apr 2026 13:30:39 +0000
Date: Tue, 14 Apr 2026 21:30:34 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:master] BUILD SUCCESS
 b77b21fbd0ee0bab64acbbe63d0a2ebcc9f14373
Message-ID: <202604142127.IfGzRA4E-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git master
branch HEAD: b77b21fbd0ee0bab64acbbe63d0a2ebcc9f14373  Merge tag 'v7.0'

elapsed time: 1115m

configs tested: 155
configs skipped: 8

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    gcc-15.2.0
arc                               allnoconfig    gcc-15.2.0
arc                                 defconfig    gcc-15.2.0
arc                   randconfig-001-20260414    gcc-9.5.0
arc                   randconfig-002-20260414    gcc-11.5.0
arm                               allnoconfig    clang-23
arm                              allyesconfig    gcc-15.2.0
arm                                 defconfig    clang-23
arm                   randconfig-001-20260414    clang-23
arm                   randconfig-002-20260414    gcc-15.2.0
arm                   randconfig-003-20260414    clang-23
arm                   randconfig-004-20260414    gcc-8.5.0
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260414    gcc-12.5.0
arm64                 randconfig-002-20260414    gcc-11.5.0
arm64                 randconfig-003-20260414    clang-16
arm64                 randconfig-004-20260414    gcc-13.4.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260414    gcc-15.2.0
csky                  randconfig-002-20260414    gcc-9.5.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-23
hexagon                             defconfig    clang-23
hexagon               randconfig-001-20260414    clang-23
hexagon               randconfig-002-20260414    clang-16
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20260414    clang-20
i386        buildonly-randconfig-002-20260414    clang-20
i386        buildonly-randconfig-003-20260414    gcc-14
i386        buildonly-randconfig-004-20260414    gcc-14
i386        buildonly-randconfig-005-20260414    gcc-14
i386        buildonly-randconfig-006-20260414    gcc-14
i386                                defconfig    clang-20
i386                  randconfig-001-20260414    gcc-14
i386                  randconfig-002-20260414    clang-20
i386                  randconfig-003-20260414    gcc-14
i386                  randconfig-004-20260414    clang-20
i386                  randconfig-005-20260414    clang-20
i386                  randconfig-006-20260414    clang-20
i386                  randconfig-007-20260414    gcc-14
i386                  randconfig-011-20260414    clang-20
i386                  randconfig-012-20260414    clang-20
i386                  randconfig-013-20260414    gcc-14
i386                  randconfig-014-20260414    gcc-14
i386                  randconfig-015-20260414    clang-20
i386                  randconfig-016-20260414    clang-20
i386                  randconfig-017-20260414    gcc-14
loongarch                         allnoconfig    clang-23
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260414    clang-18
loongarch             randconfig-002-20260414    clang-23
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    gcc-15.2.0
m68k                                defconfig    gcc-15.2.0
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    gcc-15.2.0
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20260414    gcc-11.5.0
nios2                 randconfig-002-20260414    gcc-11.5.0
openrisc                         allmodconfig    gcc-15.2.0
openrisc                          allnoconfig    gcc-15.2.0
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    gcc-15.2.0
parisc                           allyesconfig    gcc-15.2.0
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260414    gcc-8.5.0
parisc                randconfig-002-20260414    gcc-14.3.0
parisc64                            defconfig    gcc-15.2.0
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    gcc-15.2.0
powerpc                       holly_defconfig    clang-23
powerpc               randconfig-001-20260414    gcc-8.5.0
powerpc               randconfig-002-20260414    gcc-8.5.0
powerpc64             randconfig-001-20260414    gcc-13.4.0
powerpc64             randconfig-002-20260414    gcc-12.5.0
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-23
riscv                 randconfig-001-20260414    clang-23
riscv                 randconfig-002-20260414    gcc-8.5.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    clang-23
s390                  randconfig-001-20260414    clang-23
s390                  randconfig-002-20260414    clang-23
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    gcc-15.2.0
sh                                  defconfig    gcc-15.2.0
sh                    randconfig-001-20260414    gcc-15.2.0
sh                    randconfig-002-20260414    gcc-15.2.0
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260414    gcc-15.2.0
sparc                 randconfig-002-20260414    gcc-14.3.0
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20260414    gcc-8.5.0
sparc64               randconfig-002-20260414    clang-23
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                                  defconfig    clang-23
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260414    clang-23
um                    randconfig-002-20260414    gcc-12
um                           x86_64_defconfig    clang-23
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260414    gcc-14
x86_64      buildonly-randconfig-002-20260414    gcc-14
x86_64      buildonly-randconfig-003-20260414    gcc-14
x86_64      buildonly-randconfig-004-20260414    clang-20
x86_64      buildonly-randconfig-005-20260414    gcc-14
x86_64      buildonly-randconfig-006-20260414    gcc-14
x86_64                              defconfig    gcc-14
x86_64                randconfig-001-20260414    gcc-14
x86_64                randconfig-002-20260414    clang-20
x86_64                randconfig-003-20260414    gcc-14
x86_64                randconfig-004-20260414    clang-20
x86_64                randconfig-005-20260414    clang-20
x86_64                randconfig-006-20260414    clang-20
x86_64                randconfig-011-20260414    gcc-14
x86_64                randconfig-013-20260414    gcc-14
x86_64                randconfig-014-20260414    gcc-14
x86_64                randconfig-015-20260414    gcc-14
x86_64                randconfig-016-20260414    clang-20
x86_64                randconfig-071-20260414    gcc-14
x86_64                randconfig-072-20260414    gcc-14
x86_64                randconfig-073-20260414    gcc-14
x86_64                randconfig-074-20260414    gcc-14
x86_64                randconfig-075-20260414    gcc-14
x86_64                randconfig-076-20260414    clang-20
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.2.0
xtensa                randconfig-001-20260414    gcc-8.5.0
xtensa                randconfig-002-20260414    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
