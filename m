Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8A72135A53
	for <linux-m68k@lists.linux-m68k.org>; Fri, 10 Apr 2026 05:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775798181; cv=none; b=ed8Mpy5KHLt/9BZtX9UCXx2VPk7Gm/a+PulSr2XGGm7uGD5omzi8mat6h5bOrnV0CceEJQc/M2yftIV6VScOHBQvr++Lj6QZbVVxeDYM7AqVSzYR+VQGPyXoMuftZKYw3SJ8lFz3lP0viKjWhdhlVhMivuft99GXpGzN22fzjrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775798181; c=relaxed/simple;
	bh=YcuPoNfkbb4E/qboLw7I+1NveTc6z0UXRWOOOcto9hg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cmp6luN9aTceeyaYMy5x3vAvsHe2N0XDh0FdHE7/a5Q/ocuFQcnI4Z/vtJuL9XktmcDoqniBtsNbjwwH+inaiZLK9yFBTdLD4DH46uruYusthdQXuteujMeVsPYSrA9DX3wBScgCGtD4hMN27gECI275Ks13foNd20Q46NzdkoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J/Wt6JXM; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J/Wt6JXM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775798180; x=1807334180;
  h=date:from:to:cc:subject:message-id;
  bh=YcuPoNfkbb4E/qboLw7I+1NveTc6z0UXRWOOOcto9hg=;
  b=J/Wt6JXMRqGdix14pWAtPhtp8WJDPf4mphX+97sm50Dm1WA0Hasz9neR
   w1qBCXWKXgw/fSt38qLoupeOg6pM+kQBqg1A8JQahbH0ObKnwIibJqphx
   GOI4FRtAkeJJAUPIBtcCyQyNROo0sWAR4po3DH4RjXAfBpBQHaDaoasl5
   qJps99ry4klGev6L/R+PKF3cmtfmklGsmS/OsZI9eouQhJt4uFkZfBdGO
   pWQ7lDK5pZqnwVtRwLFN2rvvty93tEYK8UYJ1/lenugxIGRKgAdNtPFxA
   OSlpMEiUqM9dq3RpM1WgquN/R+uucGUu0NKRIP++7ifEd3o4FlaMjj80L
   w==;
X-CSE-ConnectionGUID: Ueae5kmaTcu41Syb0BuM0w==
X-CSE-MsgGUID: hgPQqimGQLK/uCAjq7f7iw==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="87513314"
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="87513314"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 22:16:18 -0700
X-CSE-ConnectionGUID: m9kMBOMQTuWAq5s6gGux7g==
X-CSE-MsgGUID: dUuhBAlKSICwjsMxJprpEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="233382159"
Received: from lkp-server01.sh.intel.com (HELO 6449335cace3) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 09 Apr 2026 22:16:16 -0700
Received: from kbuild by 6449335cace3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wB4E1-000000001oL-2MwE;
	Fri, 10 Apr 2026 05:16:13 +0000
Date: Fri, 10 Apr 2026 13:15:17 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:for-v7.1] BUILD SUCCESS
 ddc4d06f159818eb250fa6a9da5dc1bef1fa2ee1
Message-ID: <202604101311.eDSseyZY-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git for-v7.1
branch HEAD: ddc4d06f159818eb250fa6a9da5dc1bef1fa2ee1  m68k: virt: Switch to qemu-virt-ctrl driver

elapsed time: 2631m

configs tested: 152
configs skipped: 21

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    gcc-15.2.0
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    gcc-15.2.0
arc                                 defconfig    gcc-15.2.0
arc                   randconfig-001-20260408    gcc-8.5.0
arc                   randconfig-001-20260409    gcc-13.4.0
arc                   randconfig-002-20260408    gcc-8.5.0
arc                   randconfig-002-20260409    gcc-14.3.0
arm                               allnoconfig    clang-23
arm                              allyesconfig    gcc-15.2.0
arm                                 defconfig    clang-23
arm                   randconfig-001-20260408    gcc-8.5.0
arm                   randconfig-002-20260409    gcc-14.3.0
arm                   randconfig-003-20260408    clang-18
arm                   randconfig-003-20260409    gcc-10.5.0
arm                   randconfig-004-20260409    gcc-14.3.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260409    clang-23
arm64                 randconfig-002-20260409    gcc-15.2.0
arm64                 randconfig-003-20260409    clang-23
arm64                 randconfig-004-20260409    clang-23
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260409    gcc-15.2.0
csky                  randconfig-002-20260409    gcc-11.5.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-23
hexagon                             defconfig    clang-23
hexagon               randconfig-001-20260409    clang-23
hexagon               randconfig-002-20260409    clang-23
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20260409    clang-20
i386        buildonly-randconfig-002-20260409    clang-20
i386        buildonly-randconfig-003-20260409    gcc-14
i386        buildonly-randconfig-004-20260409    gcc-14
i386        buildonly-randconfig-005-20260409    gcc-14
i386        buildonly-randconfig-006-20260409    gcc-12
i386                                defconfig    clang-20
i386                  randconfig-001-20260410    gcc-14
i386                  randconfig-002-20260410    clang-20
i386                  randconfig-003-20260410    clang-20
i386                  randconfig-004-20260410    gcc-14
i386                  randconfig-005-20260410    gcc-12
i386                  randconfig-011-20260409    clang-20
i386                  randconfig-012-20260409    clang-20
i386                  randconfig-013-20260409    clang-20
i386                  randconfig-014-20260409    gcc-14
i386                  randconfig-015-20260409    gcc-14
i386                  randconfig-016-20260409    clang-20
i386                  randconfig-017-20260409    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-23
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260409    clang-18
loongarch             randconfig-002-20260409    clang-23
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
mips                        vocore2_defconfig    clang-23
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20260409    gcc-11.5.0
nios2                 randconfig-002-20260409    gcc-10.5.0
openrisc                         allmodconfig    gcc-15.2.0
openrisc                          allnoconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    gcc-15.2.0
parisc                           allyesconfig    gcc-15.2.0
parisc                randconfig-001-20260409    gcc-11.5.0
parisc                randconfig-002-20260409    gcc-11.5.0
parisc64                            defconfig    gcc-15.2.0
powerpc                     akebono_defconfig    clang-23
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    gcc-15.2.0
powerpc               randconfig-001-20260409    clang-16
powerpc               randconfig-002-20260409    gcc-8.5.0
powerpc64             randconfig-001-20260409    gcc-14.3.0
powerpc64             randconfig-002-20260409    gcc-10.5.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                 randconfig-001-20260409    gcc-8.5.0
riscv                 randconfig-002-20260409    clang-23
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                  randconfig-001-20260409    clang-23
s390                  randconfig-002-20260409    clang-23
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    gcc-15.2.0
sh                                  defconfig    gcc-15.2.0
sh                    randconfig-001-20260409    gcc-15.2.0
sh                    randconfig-002-20260409    gcc-13.4.0
sparc                             allnoconfig    gcc-15.2.0
sparc                 randconfig-001-20260409    gcc-8.5.0
sparc                 randconfig-002-20260409    gcc-11.5.0
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20260409    clang-23
sparc64               randconfig-002-20260409    gcc-9.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                                  defconfig    clang-23
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260409    clang-23
um                    randconfig-002-20260409    gcc-14
um                           x86_64_defconfig    clang-23
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260409    clang-20
x86_64      buildonly-randconfig-002-20260409    clang-20
x86_64      buildonly-randconfig-003-20260409    clang-20
x86_64      buildonly-randconfig-004-20260409    clang-20
x86_64      buildonly-randconfig-005-20260409    gcc-14
x86_64      buildonly-randconfig-006-20260409    gcc-14
x86_64                              defconfig    gcc-14
x86_64                randconfig-001-20260408    gcc-14
x86_64                randconfig-002-20260408    gcc-14
x86_64                randconfig-003-20260408    gcc-14
x86_64                randconfig-004-20260408    gcc-14
x86_64                randconfig-005-20260408    gcc-14
x86_64                randconfig-006-20260408    gcc-12
x86_64                randconfig-011-20260409    clang-20
x86_64                randconfig-012-20260409    gcc-14
x86_64                randconfig-013-20260409    gcc-14
x86_64                randconfig-014-20260409    clang-20
x86_64                randconfig-015-20260409    gcc-14
x86_64                randconfig-016-20260409    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.2.0
xtensa                           allyesconfig    gcc-15.2.0
xtensa                randconfig-001-20260409    gcc-12.5.0
xtensa                randconfig-002-20260409    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
