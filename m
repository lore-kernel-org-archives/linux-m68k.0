Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6223353A8A7
	for <linux-m68k@lists.linux-m68k.org>; Tue,  8 Sep 2026 12:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788869569; cv=none; b=qIJ8witRFe1zfdJHE4M7H9We4UKbXPQ1Tzh5ifPApbs4uBZYUZB0gQSgNHBtrNsUw6sUvvrbP8tkhZ7SPmTpiKoErtwm5UycpEKq7tSLUDZ1e47QZhSnzxoqCjdiev3odlcUN8QixbY49Rd/rzPBFsqMuG0E5CaqRLoo/PTUZaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788869569; c=relaxed/simple;
	bh=N57Q9jJ47NWM7wlKGf2Ka5HsUm6AQkZAuPET0AMf+kU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=aKXlLxdaAHBC0dVwTq6zEQS2C3RosT5hNYlSQTIxaDUsTRojyFT1PrnwzrDNYv+WekOyuRcaPXQ8w4h5NKyTO5Jw0mlj/83Xx81nkTVtdMittylTfAxtlZ5PzVzZUP3yEafQumnz6So5CGMgSujAFSwy5dH1oGMCw3CYtdOVh7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aV9qEDhJ; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aV9qEDhJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788869560; x=1820405560;
  h=date:from:to:cc:subject:message-id;
  bh=N57Q9jJ47NWM7wlKGf2Ka5HsUm6AQkZAuPET0AMf+kU=;
  b=aV9qEDhJYtSF4bhuU4jowpj8Q24O6RV2slsGWzZsuuPuVp5zYi/U8Q90
   Mq87y4hWeLdBL5V8GcWFmMALiDKyYuZqoKrQ8gYVhnaKhaPErhytjOmAf
   B8I7rT/UdV5vvCA3hVFsVNcyOricydecrhwDtX9jo0kPvEW3siv9t/OYW
   +Us0c0/tWJ7D0H1j7wSPdU0qoGizgEnYEksWeMzD+0vviryZRK1ILAX3Z
   8bRZuirJLNFVggQsp51AG3Zg5GvObjrJoguTHXcQ1VzpB/X6zdwS19xpG
   tnh/E9CquSURblWfeXnDjy3b96DxmKuhVT5GvHOtMhPOpOW+h6n+hQTZA
   w==;
X-CSE-ConnectionGUID: CbRMet5DRR2N2l6K/t4N1w==
X-CSE-MsgGUID: KxXQzq3nSTa+6sCkwhfImA==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="93132431"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="93132431"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2026 05:12:35 -0700
X-CSE-ConnectionGUID: VqRfXSKdTNSw4fhZ8tMzXA==
X-CSE-MsgGUID: 4qZ/2ZXuRYiwHwTeIsYpIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="267308924"
Received: from lkp-server01.sh.intel.com (HELO dc5b8f51e05b) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 08 Sep 2026 05:12:33 -0700
Received: from kbuild by dc5b8f51e05b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x3ugh-0000000005t-1DF0;
	Tue, 08 Sep 2026 12:12:31 +0000
Date: Tue, 08 Sep 2026 20:11:51 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:master] BUILD SUCCESS
 6c90d7cb82736d1f511676517240d37bff65112b
Message-ID: <202609082049.OQK4uYPG-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git master
branch HEAD: 6c90d7cb82736d1f511676517240d37bff65112b  Merge tag 'v7.3-rc2'

elapsed time: 1519m

configs tested: 74
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha         allnoconfig    gcc-16.1.0
alpha        allyesconfig    gcc-16.1.0
arc          allmodconfig    clang-24
arc           allnoconfig    gcc-16.1.0
arc          allyesconfig    clang-24
arc          allyesconfig    gcc-16.1.0
arm           allnoconfig    clang-17
arm           allnoconfig    gcc-16.1.0
arm          allyesconfig    clang-24
arm64        allmodconfig    clang-24
arm64         allnoconfig    gcc-16.1.0
csky         allmodconfig    gcc-16.1.0
csky          allnoconfig    gcc-16.1.0
hexagon      allmodconfig    gcc-16.1.0
hexagon       allnoconfig    clang-24
hexagon       allnoconfig    gcc-16.1.0
i386         allmodconfig    clang-22
i386          allnoconfig    gcc-14
i386          allnoconfig    gcc-16.1.0
i386         allyesconfig    clang-22
loongarch    allmodconfig    clang-24
loongarch     allnoconfig    clang-20
loongarch     allnoconfig    gcc-16.1.0
m68k         allmodconfig    gcc-16.1.0
m68k          allnoconfig    gcc-16.1.0
m68k         allyesconfig    clang-24
m68k         allyesconfig    gcc-16.1.0
microblaze    allnoconfig    gcc-16.1.0
microblaze   allyesconfig    gcc-16.1.0
mips         allmodconfig    gcc-16.1.0
mips          allnoconfig    gcc-16.1.0
mips         allyesconfig    gcc-16.1.0
nios2        allmodconfig    clang-20
nios2        allmodconfig    gcc-11.5.0
nios2         allnoconfig    clang-24
nios2         allnoconfig    gcc-11.5.0
openrisc     allmodconfig    clang-20
openrisc     allmodconfig    gcc-16.1.0
openrisc      allnoconfig    clang-24
openrisc      allnoconfig    gcc-16.1.0
parisc       allmodconfig    gcc-16.1.0
parisc        allnoconfig    clang-24
parisc        allnoconfig    gcc-16.1.0
parisc       allyesconfig    clang-17
powerpc      allmodconfig    gcc-16.1.0
powerpc       allnoconfig    clang-24
powerpc       allnoconfig    gcc-16.1.0
riscv        allmodconfig    clang-24
riscv         allnoconfig    clang-24
riscv         allnoconfig    gcc-16.1.0
riscv        allyesconfig    clang-24
s390         allmodconfig    clang-17
s390          allnoconfig    clang-24
s390         allyesconfig    gcc-16.1.0
sh           allmodconfig    gcc-16.1.0
sh            allnoconfig    clang-24
sh            allnoconfig    gcc-16.1.0
sh           allyesconfig    clang-17
sparc         allnoconfig    clang-24
sparc         allnoconfig    gcc-16.1.0
sparc64      allmodconfig    clang-20
um           allmodconfig    clang-17
um            allnoconfig    clang-17
um            allnoconfig    clang-24
um           allyesconfig    gcc-16.1.0
x86_64       allmodconfig    clang-22
x86_64        allnoconfig    clang-22
x86_64        allnoconfig    clang-24
x86_64       allyesconfig    clang-22
x86_64      rhel-9.4-rust    clang-22
xtensa        allnoconfig    clang-24
xtensa        allnoconfig    gcc-16.1.0
xtensa       allyesconfig    clang-20
xtensa       allyesconfig    gcc-16.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
