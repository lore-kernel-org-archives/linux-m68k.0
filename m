Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61F3237B00E
	for <linux-m68k@lists.linux-m68k.org>; Tue, 26 May 2026 07:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779781932; cv=none; b=NYC5uOl2AmT61pYl5wTezWabPhxYoYPwJtBYmOtuSfzigUS7lhMkeKRRBSL7YVgF1WhhMmaO9nw7K7rZ2ChiiOigVyXRdN7RxzDgMbDZRatIpCRIaHnf69/sGyrhl+1sPglq5Fm52u2JCfpnFb1RMElcJpqSD3HIwEOPMnkK/iQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779781932; c=relaxed/simple;
	bh=Pvh2PlS6jmGoGriGe4/DRNNI1EijkmN8VHb/ZRF0Rjo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QhEn8Ey6bfRuQDaQNMyodBcIZUc1j85D0ecXDQ8FxnjzttM7V6FCiZNIokcafdhswl/IuFAEKOMMdsBAPyq1S3ai6mfb35j+ji8OhmyXLHCt82/0OKAqYkMATtygMttntTuKKlUdoiYiGqfpIFdpBVDP5o6TQ7iie02FWfULYg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jZn2TFKO; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jZn2TFKO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779781931; x=1811317931;
  h=date:from:to:cc:subject:message-id;
  bh=Pvh2PlS6jmGoGriGe4/DRNNI1EijkmN8VHb/ZRF0Rjo=;
  b=jZn2TFKOqC6z7Auxunvm7HlTg9CiHkssNN1cxD8N3KT+jv4QxTuNMb62
   DUmKEhCn8EIbfxm3F40U/u+ezjlLi/imnXoKhobxcNCHCSXLQLnPxzlTl
   WT3pAoolAVZHsb4U61HQhVVInY/69u/8ZeOPg51fMWOMLNNGU10JUzfEk
   VhyjsRewPPM+jP1c9lI0ejLmyVKIRpGczTrxqyhRCNkeTHX+LNsH0sjpV
   sxlhshw0oEu8hJY/K8ryH8lO2ef5LHbDF52mbRbKq4P731o4ZwaJaxxyM
   PseHxXA1HsBUJ/ojEiVx723ZBYXGGwVeuajtC/4ItyTPtq8D/keGwNccR
   Q==;
X-CSE-ConnectionGUID: /sziXzHKTpmzPalmriQurQ==
X-CSE-MsgGUID: Nkhn8VjUQPOIAge/KzA3Eg==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="80622584"
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; 
   d="scan'208";a="80622584"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2026 00:52:10 -0700
X-CSE-ConnectionGUID: vLqhH9K4RomCsx9KFw2MBg==
X-CSE-MsgGUID: Y+MZLmQSRVydGdOBe0wqZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; 
   d="scan'208";a="246115044"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 26 May 2026 00:52:08 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wRma5-000000002EI-2iG4;
	Tue, 26 May 2026 07:52:05 +0000
Date: Tue, 26 May 2026 15:51:13 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:master] BUILD SUCCESS
 26b3f6c06bb2e4c5e933736324b70b732c06ba64
Message-ID: <202605261506.VnQLBj5J-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git master
branch HEAD: 26b3f6c06bb2e4c5e933736324b70b732c06ba64  Merge tag 'v7.1-rc5'

elapsed time: 947m

configs tested: 59
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                   allnoconfig    gcc-15.2.0
alpha                  allyesconfig    gcc-15.2.0
arc                    allmodconfig    gcc-15.2.0
arc                     allnoconfig    gcc-15.2.0
arc                    allyesconfig    gcc-15.2.0
arm                     allnoconfig    clang-23
arm                    allyesconfig    gcc-15.2.0
arm64                  allmodconfig    clang-19
arm64                   allnoconfig    gcc-15.2.0
arm64       randconfig-002-20260526    gcc-8.5.0
csky                   allmodconfig    gcc-15.2.0
csky                    allnoconfig    gcc-15.2.0
csky        randconfig-001-20260526    gcc-15.2.0
csky        randconfig-002-20260526    gcc-13.4.0
hexagon                allmodconfig    clang-17
hexagon                 allnoconfig    clang-23
i386                   allmodconfig    gcc-14
i386                    allnoconfig    gcc-14
i386                   allyesconfig    gcc-14
loongarch               allnoconfig    clang-23
loongarch   randconfig-001-20260526    gcc-15.2.0
m68k                   allmodconfig    gcc-15.2.0
m68k                    allnoconfig    gcc-15.2.0
m68k                   allyesconfig    gcc-15.2.0
microblaze              allnoconfig    gcc-15.2.0
microblaze             allyesconfig    gcc-15.2.0
mips                    allnoconfig    gcc-15.2.0
mips                   allyesconfig    gcc-15.2.0
nios2                  allmodconfig    gcc-11.5.0
nios2                   allnoconfig    gcc-11.5.0
openrisc               allmodconfig    gcc-15.2.0
openrisc                allnoconfig    gcc-15.2.0
parisc                 allmodconfig    gcc-15.2.0
parisc                  allnoconfig    gcc-15.2.0
parisc                 allyesconfig    gcc-15.2.0
parisc      randconfig-001-20260526    gcc-15.2.0
powerpc                allmodconfig    gcc-15.2.0
powerpc                 allnoconfig    gcc-15.2.0
riscv                  allmodconfig    clang-23
riscv                   allnoconfig    gcc-15.2.0
riscv                  allyesconfig    clang-16
s390                    allnoconfig    clang-23
s390                   allyesconfig    gcc-15.2.0
sh                     allmodconfig    gcc-15.2.0
sh                      allnoconfig    gcc-15.2.0
sh                     allyesconfig    gcc-15.2.0
sparc                   allnoconfig    gcc-15.2.0
sparc64                allmodconfig    clang-23
um                     allmodconfig    clang-19
um                      allnoconfig    clang-23
um                     allyesconfig    gcc-14
x86_64                 allmodconfig    clang-20
x86_64                  allnoconfig    clang-20
x86_64                 allyesconfig    clang-20
x86_64      randconfig-001-20260526    gcc-14
x86_64      randconfig-003-20260526    gcc-14
x86_64      randconfig-005-20260526    gcc-14
x86_64                rhel-9.4-rust    clang-20
xtensa                  allnoconfig    gcc-15.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
