Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36B52194098
	for <linux-m68k@lists.linux-m68k.org>; Tue, 17 Jun 2025 01:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750125513; cv=none; b=bbwOx5/VljOzk0iO5fifV01qiA60T4ETVZfUbI2H7qb9XedLKKvGH2Li87oOD2wCKqxY10ogsnmxIbcdLU6FLCU0RCT0OYRespL1MAQ7IdxRhQ7iQo8aeoMuBDgVM3aLqoIisTG3B3o/2SBCNtaHuzXDYybbGpQaV3VwPHt7WVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750125513; c=relaxed/simple;
	bh=b9B5iZZh1RRMXRDdv5OkTIpxM4z1zzE2Qs6RJLP+c4c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OaePc32v8Hut0g8aaopi9HwP4NMZm3se1x9+gdbwOe7ql0jMVaxkGjcYwWkBHtzVbnVz2zQ8GYi+9qvOzZK/AVc842XS0MtgVuEystbeLXxIJmNylb7lSkm2xpYQb++ZCSNiRxzLAfO/+HxRYT3afQAdfAtJ/NrMSUoJg0NAiBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BYrvflk2; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BYrvflk2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750125512; x=1781661512;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=b9B5iZZh1RRMXRDdv5OkTIpxM4z1zzE2Qs6RJLP+c4c=;
  b=BYrvflk2Kd7tHOIcnZJoPenEBTo7AzXVQo6rnz9/YD7AKzh277+dWXNR
   7uboF8SnlfzG2txxE5WaM9cD+LBAVXRN1Rz55y9qbfIVQEKLxabE+SHTE
   WpEdffHxmaULYa3+mfhx89ABoMW900C6F2JTMHlrwYAF8P5NYylhQy92e
   icJMMGqx/AHa2AEI/DSj+BUMXHs3NeFj1t3iJZvXgAQUMuLzpDaRjj3zQ
   qsVj/DEgGtH38jYP08f4EFlJ7X/z6fsZ4ZEG1ihl84AmRecBcYdcxZUWP
   SQGpkpDjE+a2Dq7vPAsNebR7OwLnEX7HZO+LngeHWfJuK2rQX+5emPn8b
   Q==;
X-CSE-ConnectionGUID: dpVYaYpyTmCSOjGwJ6n/Kw==
X-CSE-MsgGUID: MA2crxzKS5iHM1hJJG/9cQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="63635665"
X-IronPort-AV: E=Sophos;i="6.16,242,1744095600"; 
   d="scan'208";a="63635665"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2025 18:58:30 -0700
X-CSE-ConnectionGUID: 75E4KUTHTZqXwE8gW4YMHQ==
X-CSE-MsgGUID: DCvwaia8Smuz46hEP5MwTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,242,1744095600"; 
   d="scan'208";a="152479046"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 16 Jun 2025 18:58:28 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uRLak-000FVK-0n;
	Tue, 17 Jun 2025 01:58:26 +0000
Date: Tue, 17 Jun 2025 09:58:03 +0800
From: kernel test robot <lkp@intel.com>
To: Greg Ungerer <gerg@linux-m68k.org>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
	uclinux-dev@uclinux.org
Subject: [gerg-m68knommu:dt 11/14] kismet: WARNING: unmet direct dependencies
 detected for OF_EARLY_FLATTREE when selected by BUILTIN_DTB
Message-ID: <202506170917.2r2wGfhC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git dt
head:   c0b8c6b8045a76e54fd4593f5fb10d664cfdd567
commit: c19a59419df8d5af5c8ca7c54c94143e3584a04d [11/14] m68k: implement a builtin devicetree for nonmmu
config: m68k-kismet-CONFIG_OF_EARLY_FLATTREE-CONFIG_BUILTIN_DTB-0-0 (https://download.01.org/0day-ci/archive/20250617/202506170917.2r2wGfhC-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250617/202506170917.2r2wGfhC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506170917.2r2wGfhC-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for OF_EARLY_FLATTREE when selected by BUILTIN_DTB
   WARNING: unmet direct dependencies detected for OF_EARLY_FLATTREE
     Depends on [n]: OF [=n]
     Selected by [y]:
     - BUILTIN_DTB [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
