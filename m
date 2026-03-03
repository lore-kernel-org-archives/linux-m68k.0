Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ACA7352C5B
	for <linux-m68k@lists.linux-m68k.org>; Tue,  3 Mar 2026 01:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772500657; cv=none; b=C6e7AWZ0Y5/EMzoTjslpW409UdL0H3xRo+Lbh3LrHBCULEYOEdXFVlSteU/WUBTACbUkJqa3UBCUnERjdnoXNLudOIMl1vnw2Gyc1Pk8WMM+eZkDs9/ClCf0NKnAkMM/y9yY4RxEI5fWXjzDrna8eRLVKgLgaJpWIBRJQ9gNppU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772500657; c=relaxed/simple;
	bh=5KvPeEpiLwE8qnTNQGy3kVFx+QCov73Uj0JuokHhNIY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ftPsRxFSVuV6m3Aun/XbwPfOExFzWFe94zu+la+5eZdG0Ffp22ROUdsBO5ao9TgotnGjYPZmc53l4O2oXMEPi8q44UrsFMrUnZpRixWU4rzE2ftdy98GPlv2+WkWBgW/y/D5XydTVR8Nzd/fSVl661Hri/4V+/Jcgam6dy3v0og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BYy1sT/g; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BYy1sT/g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772500655; x=1804036655;
  h=date:from:to:cc:subject:message-id;
  bh=5KvPeEpiLwE8qnTNQGy3kVFx+QCov73Uj0JuokHhNIY=;
  b=BYy1sT/gn53psFAO9MWBDNuAdfzO5Ea4fzRcaKWrGJm+HWlgMC6SOkEL
   1PwLjAPKKXa3mGjDbeY56p3u+QavidlGKHVzd0lF2+up24QTa3EolKl3Y
   2hBzlxZ46x7JaFPGeBIf2LPgxlPSvehk/gZzzJFIL6QiqHbTUfaTLmL3S
   XKjhiNhZ07KY5z8E5ly7AfHP7qOhw9UAF+mjg9xSNAoR4Q2rqGF71n/6B
   AA5ht1YqkDaNCoCPHfZsUBYhYpgYQf6OQCAFbaxyCZyhY6Zm8C5Hk3WjF
   9hJKhwqMlJK+DugupUkXEDj+xdezE6hJLxSvZTpR1PljXRXUY8I2K6HT7
   g==;
X-CSE-ConnectionGUID: WQcxsonyTF+3HKwDEUAxPg==
X-CSE-MsgGUID: uA/fFJ0tSJy5/eyMgglAIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="73711582"
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; 
   d="scan'208";a="73711582"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2026 17:17:33 -0800
X-CSE-ConnectionGUID: oCm+eZCJRxWOuZD4ZGArxw==
X-CSE-MsgGUID: 1vVlJ+/YQOyoUWx/7sxMAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; 
   d="scan'208";a="255700539"
Received: from lkp-server01.sh.intel.com (HELO f27a57aa7a36) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 02 Mar 2026 17:17:32 -0800
Received: from kbuild by f27a57aa7a36 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxEO9-000000001ap-1hgq;
	Tue, 03 Mar 2026 01:17:29 +0000
Date: Tue, 03 Mar 2026 09:17:27 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:master] BUILD SUCCESS
 b879a081bb0f6725a8ca41b6bdbe25acaa6a73dd
Message-ID: <202603030919.HIA3wLp5-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git master
branch HEAD: b879a081bb0f6725a8ca41b6bdbe25acaa6a73dd  Merge tag 'v7.0-rc2'

elapsed time: 866m

configs tested: 55
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha         allnoconfig    gcc-15.2.0
alpha        allyesconfig    gcc-15.2.0
arc          allmodconfig    gcc-15.2.0
arc           allnoconfig    gcc-15.2.0
arc          allyesconfig    gcc-15.2.0
arm           allnoconfig    clang-23
arm          allyesconfig    gcc-15.2.0
arm64        allmodconfig    clang-19
arm64         allnoconfig    gcc-15.2.0
csky         allmodconfig    gcc-15.2.0
csky          allnoconfig    gcc-15.2.0
hexagon      allmodconfig    clang-17
hexagon       allnoconfig    clang-23
i386         allmodconfig    gcc-14
i386          allnoconfig    gcc-14
i386         allyesconfig    gcc-14
loongarch    allmodconfig    clang-19
loongarch     allnoconfig    clang-23
m68k         allmodconfig    gcc-15.2.0
m68k          allnoconfig    gcc-15.2.0
m68k         allyesconfig    gcc-15.2.0
microblaze    allnoconfig    gcc-15.2.0
microblaze   allyesconfig    gcc-15.2.0
mips         allmodconfig    gcc-15.2.0
mips          allnoconfig    gcc-15.2.0
mips         allyesconfig    gcc-15.2.0
nios2        allmodconfig    gcc-11.5.0
nios2         allnoconfig    gcc-11.5.0
openrisc     allmodconfig    gcc-15.2.0
openrisc      allnoconfig    gcc-15.2.0
parisc       allmodconfig    gcc-15.2.0
parisc        allnoconfig    gcc-15.2.0
parisc       allyesconfig    gcc-15.2.0
powerpc      allmodconfig    gcc-15.2.0
powerpc       allnoconfig    gcc-15.2.0
riscv        allmodconfig    clang-23
riscv         allnoconfig    gcc-15.2.0
riscv        allyesconfig    clang-16
s390         allmodconfig    clang-18
s390          allnoconfig    clang-23
s390         allyesconfig    gcc-15.2.0
sh           allmodconfig    gcc-15.2.0
sh            allnoconfig    gcc-15.2.0
sh           allyesconfig    gcc-15.2.0
sparc         allnoconfig    gcc-15.2.0
sparc64      allmodconfig    clang-23
um           allmodconfig    clang-19
um            allnoconfig    clang-23
um           allyesconfig    gcc-14
x86_64       allmodconfig    clang-20
x86_64        allnoconfig    clang-20
x86_64       allyesconfig    clang-20
x86_64      rhel-9.4-rust    clang-20
xtensa        allnoconfig    gcc-15.2.0
xtensa       allyesconfig    gcc-15.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
