Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB0EF1A9F96
	for <linux-m68k@lists.linux-m68k.org>; Tue, 26 May 2026 04:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779770995; cv=none; b=OI/9g84K6lg2mPT8XniIvdhh1XaU7al8C7b/BkLYt3Oumy6Tsn9hY26Zj0KCFbJzTPM5Jp/FZ0WiGa+OS+//yU7k29YLvzlA0lKhaNxXJz6J36T+V5Ywvvk9oy6cUpoCvJOIbnXUcgaLpoLpWikC9c14Y+Ca5M4UK3ANtRm3qRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779770995; c=relaxed/simple;
	bh=mKmonktep6DG3Qg1WhL4Fv4VF3EzRSViHjVeXV83TGg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NeooVh1LrjxoV0SxVBs0Pp7C5es3b0872b1s4zG/CculiYkoUsrAZa/rIDybBWh5L30olAVAEGK3gMvnSXVXHszqP7mLf+WU29dsnVottI9tpT4M2xgRULXOsTR03x2I62NyPMtMn7z8E9m37V7xlmpwgC/M9CyfrWwdda/A2Hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=neUaJJfx; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="neUaJJfx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779770994; x=1811306994;
  h=date:from:to:cc:subject:message-id;
  bh=mKmonktep6DG3Qg1WhL4Fv4VF3EzRSViHjVeXV83TGg=;
  b=neUaJJfxG2DmmAsn3Z90jlIuB/PvCcybrcN8XBsfEUMKuYGzIxqw7hko
   H2nyYnxqilcaJJB1K4xys5hOx33VMyxmlShwt8rVmARJxdDK/9RKAeSqj
   dDr9j7/TvPU0dMpbSXmWp6lPPApUBFJmYv1MfwBKx49ytSZQ+OsRmQTWZ
   76yuWhc+ep7zHUy0AfVHG3aTFXuN1HZxRhhFb30BU1KMqvoKg3y2t9efa
   M3Jw4KmbZNLT1uiKAP+U7CUzWRY55DvpyNYQLFjnwcr+b0YeaR2EK3Myx
   xYechZkLenl9saDAvK5seyLyoA1YgggTVuy7RcMjmcRBn3O+9T41nX7LY
   w==;
X-CSE-ConnectionGUID: t4NsQwfjTM+OS9uurxBIgA==
X-CSE-MsgGUID: 0bLghmZ5QLeTbiXLXunjYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="90877248"
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; 
   d="scan'208";a="90877248"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2026 21:49:52 -0700
X-CSE-ConnectionGUID: vmfAMjAfS+Soa7RRaFhUsQ==
X-CSE-MsgGUID: luDASj00RZSuiLJNyqYBTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; 
   d="scan'208";a="235435103"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 25 May 2026 21:49:51 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wRjjg-00000000284-36CZ;
	Tue, 26 May 2026 04:49:48 +0000
Date: Tue, 26 May 2026 12:48:59 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:for-v7.2] BUILD SUCCESS
 01793374319cdb685bd487633bbd8bd57f416172
Message-ID: <202605261252.fBuZoW3Z-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git for-v7.2
branch HEAD: 01793374319cdb685bd487633bbd8bd57f416172  m68k: defconfig: Update defconfigs for v7.1-rc1

elapsed time: 765m

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
