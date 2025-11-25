Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A92AB32939E
	for <linux-m68k@lists.linux-m68k.org>; Tue, 25 Nov 2025 16:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764089103; cv=none; b=JAM92hUIp4Lgwp8Xkw9LjhQuezVZCHtCOLez00CC+Uq7A+4T3IysmBXSrKRFLAOmhDtrb4Obh7B0Re3pmKQ5K5hTneCM6fcJnsbfkxEQce33BBdcO3lFQjlAX/3oJOwW+UWzV1pJ3WAcvcI1my7xOXUOMGF5i71rfz9T3B6ZYe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764089103; c=relaxed/simple;
	bh=OEK6BbYO7Ogt85QnZ3Qb0cV5cok8nrHBTdsKsqAhSBg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bywxxLnfDlSNeL7WqFjCSBv0ItrNBYszxdBpVMS2+kp+FBXwHAEavjBxBM2dgbJy4cMHaM0GujtVFaLJJ0b6ldad/PJrr9PxTRUnqnS+Bjm0RGmVq43Pkf/Ewi8AU12/aH5j11Ry8EvRrxkAxKgKvZ6IDj3pHSJavTjnnG8/eRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YbVcA9oy; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YbVcA9oy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764089102; x=1795625102;
  h=date:from:to:cc:subject:message-id;
  bh=OEK6BbYO7Ogt85QnZ3Qb0cV5cok8nrHBTdsKsqAhSBg=;
  b=YbVcA9oyntr6c6tl5xW3A55T9s6A5JbDRi8VqM0Q3QmhusEccPez79Qb
   Q6Gq0Qilcy4rnLff84UU2rrhExP95id+w6UYMhZy2RNaMRApxxEWsa8Co
   Hlf9e8Vj+XXgHEreiv2TkZlVJeJdynF/ED2SZ6CXTYP/q/Gg/UXr7x/q3
   16dgo8bYgF1e0x2a2S0xsCWZYd52Naun3vthamb2ceWgr5ULq8y9jCpSF
   SKfKhZNt3e3wCI03zjDVPAsMIPd1TH2p46JdnJAiY36CUwZdusOc4AYN9
   BGr+IaWkAOL4nSxhcIsGxrVv+hRV6Vx6nVbZ3+Ik4A7hyyabCKG3TQ/CO
   A==;
X-CSE-ConnectionGUID: fKObhBTbQtK+MZe+DF/T1w==
X-CSE-MsgGUID: pdWiSA9WQHCiCdOYsNS7OQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="83725004"
X-IronPort-AV: E=Sophos;i="6.20,226,1758610800"; 
   d="scan'208";a="83725004"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2025 08:45:00 -0800
X-CSE-ConnectionGUID: la3X+mgbRLuNpZfyaqyu2Q==
X-CSE-MsgGUID: 7RGKsnr5SfeclNtYuWnmnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,226,1758610800"; 
   d="scan'208";a="216028627"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 25 Nov 2025 08:44:59 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vNw9x-0000000021L-1Zlv;
	Tue, 25 Nov 2025 16:44:57 +0000
Date: Wed, 26 Nov 2025 00:44:37 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:for-v6.19] BUILD SUCCESS
 aaf4e92341b081bac1230f22619b0a298e285dab
Message-ID: <202511260032.65STexJY-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git for-v6.19
branch HEAD: aaf4e92341b081bac1230f22619b0a298e285dab  m68k: defconfig: Update defconfigs for v6.18-rc1

elapsed time: 1485m

configs tested: 11
configs skipped: 162

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha       allnoconfig    gcc-15.1.0
arc         allnoconfig    gcc-15.1.0
arm         allnoconfig    clang-22
arm64       allnoconfig    gcc-15.1.0
csky        allnoconfig    gcc-15.1.0
hexagon     allnoconfig    clang-22
i386        allnoconfig    gcc-14
loongarch   allnoconfig    clang-22
m68k        allnoconfig    gcc-15.1.0
microblaze  allnoconfig    gcc-15.1.0
mips        allnoconfig    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
