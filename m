Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77340246784
	for <linux-m68k@lists.linux-m68k.org>; Tue,  1 Jul 2025 09:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751360663; cv=none; b=EAb+HOnEFBOjMcpSi041FEcKqjo+QnVzT9c0l6OvAPq6REF6+rbCeEtxx72Kh0cnC3XmD7yxSt5ARDDAXV8Co2NqJ0YsM0Ee8EgmHyDeLUJAsXZdXn4Y0Nmv4sgK528SsiODRw8uF+J+adciPFWuICTbFvSgokNaJCVj+fbYu+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751360663; c=relaxed/simple;
	bh=EQtISQAZO5Qgnmieoc1daWZObnSmksWwypA80rM6uwA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=juTjBSZ96pmUTncduVHcKv2+etNpvF857t4Hu8FIvi7aQgvo/Hjqw0DuX7z+8CROEndqFMQdZn3kuNG5OhGjheI+zWulXsG01PifSrIvn+9A2xxEmx8wcr/yN8+QR+MrZSrXopKLgC+rBbENVG8LuL+s90HXVWBcNzXDRqFzryo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Oj6f3AwG; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Oj6f3AwG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751360661; x=1782896661;
  h=date:from:to:cc:subject:message-id;
  bh=EQtISQAZO5Qgnmieoc1daWZObnSmksWwypA80rM6uwA=;
  b=Oj6f3AwGUSfQyb6IDnyKI4hDITYmH9xBrWHKGEI9ZyQibyPlPJtLrknj
   aFeEmBFmkmA4qf/lSpKDreTLZ7nNZB/DScJ1JM8+n3oQ66B5V1CNIELfl
   02a5h3wRa+QnBR72Uc+JF15iESWhSL4nOVPj/aokyroBNKnZ7JhOImzsu
   agLTIOvug2nnCmqMDR1JfVq1vdiNDkc+yvCR3ald/ZaTyfJqx6jnz4WSl
   oW04QMf4rHWPJwwfbe1ytk0l1ocC+nRLYWvtXOgtxgeCLOk5RgdQ6ckmy
   6f5zHAiwgGp5plMxtbjk7FAur3rdbXsUP+Ao5uXDneaL10z7hGO2QVqVA
   g==;
X-CSE-ConnectionGUID: jG0q6MmKTiqXLOvAW90EWg==
X-CSE-MsgGUID: 3S4cdjUdR9OSI57xnziG2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="53575630"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="53575630"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2025 02:04:20 -0700
X-CSE-ConnectionGUID: hM7L3rnpSZu/C22cJtXfWA==
X-CSE-MsgGUID: 4wh7BH9oRPCs9opjWU1p4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="154431687"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 01 Jul 2025 02:04:19 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uWWuX-000Zve-0X;
	Tue, 01 Jul 2025 09:04:17 +0000
Date: Tue, 01 Jul 2025 17:03:32 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:for-v6.17] BUILD SUCCESS
 8135422ae047fe0d5b7e8017f3fd43cf4dfa80c4
Message-ID: <202507011722.o7gU0O5o-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git for-v6.17
branch HEAD: 8135422ae047fe0d5b7e8017f3fd43cf4dfa80c4  m68k: mm: Convert pointer table macros to use ptdescs

elapsed time: 800m

configs tested: 12
configs skipped: 131

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
loongarch   allmodconfig    gcc-15.1.0
m68k        allmodconfig    gcc-15.1.0
m68k         allnoconfig    gcc-15.1.0
m68k        allyesconfig    gcc-15.1.0
microblaze  allmodconfig    gcc-15.1.0
microblaze   allnoconfig    gcc-15.1.0
microblaze  allyesconfig    gcc-15.1.0
mips         allnoconfig    gcc-15.1.0
nios2        allnoconfig    gcc-14.2.0
sh           allnoconfig    gcc-15.1.0
sparc        allnoconfig    gcc-15.1.0
xtensa       allnoconfig    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
