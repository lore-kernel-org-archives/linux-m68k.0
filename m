Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B721325BF15
	for <linux-m68k@lists.linux-m68k.org>; Sat, 13 Dec 2025 02:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765592815; cv=none; b=M/9+RQjk55Dvz1UzWHJaemYHkp6mlK8oNPcdCLqgNcqgDVKrs+k6ZFe2q7tjElo/eBsY55KFjA9El/BMECh1aiVIKnwKsR5DvojPjsGJAkM0+iKM5Jb81RfmABq98tBcPAgOSD8VABEqaC0Ujl0ZMzwi8IHuEwr4PXmnQ+A9gdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765592815; c=relaxed/simple;
	bh=SOjt9B5ABzutNkJZHouSTxDWMIzPLQKJEcK4rsH2qTQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gh8QoFswy77NC6I25PzJufuHQw7x1MA0IRhJZu7P7PJhyDsA23TKsYu80xVyfFhP9Dj3LmhO26UDq4zpeh/K+9aNvEwDkiAfk1ucC3hUHia7soUSjEBdIwg9bBq3cpD9rFmbtF8z8/8V8jfwzhUgmmkMilMbvBru1FYeUoQcey8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b1SuKfQO; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b1SuKfQO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765592814; x=1797128814;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SOjt9B5ABzutNkJZHouSTxDWMIzPLQKJEcK4rsH2qTQ=;
  b=b1SuKfQO/GjHzwHcCAyOgHYKsqW1XSAcT4k5JZr7YHUt/O+Z0w0cf6UF
   +sWGFNgbgxwUgLZBnr3mYVV7tYRMO5NeGqW1jbW091KgExsYzvtr8XkpA
   L3t2slmH+wtVtEfbXqZGjnd4CffAlsFsSsnFEAfI5FMdf2B8alKiZWwEb
   HWIaS/Dxmt9JNpnVSw2ByjRrUoQKzOKrdYdpu+RvyWfwd1BbK3A3ZgOFL
   GvStbep+OaTBozNsUN7hMAdR/1dHFSj3bdAoPGHCuHa98Bh5DHEH1BNli
   ess4jgwWfe+y6tCAgVAz1FqJ89qezWk/jL4Smn59DBXKCtpusJlpKe6OM
   g==;
X-CSE-ConnectionGUID: cX2FVlK+Q7aSjrF0AsgVBw==
X-CSE-MsgGUID: VtIj7vyQQtmpgOg96lVOcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="71224361"
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="71224361"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 18:26:53 -0800
X-CSE-ConnectionGUID: isBGTdzKRxmpc27P8VIIhA==
X-CSE-MsgGUID: mAIASSQLQ5GwKnQQJ1cyJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="202161482"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 12 Dec 2025 18:26:51 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUFLM-000000006wH-1sd8;
	Sat, 13 Dec 2025 02:26:48 +0000
Date: Sat, 13 Dec 2025 10:25:49 +0800
From: kernel test robot <lkp@intel.com>
To: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>, fthain@linux-m68k.org
Cc: oe-kbuild-all@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
	linux-kernel@vger.kernel.org,
	Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
Subject: Re: [PATCH] nubus: add a cleanup in nubus_init()
Message-ID: <202512131055.DdhG2azK-lkp@intel.com>
References: <20251212122930.36115-1-lihaoxiang@isrc.iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251212122930.36115-1-lihaoxiang@isrc.iscas.ac.cn>

Hi Haoxiang,

kernel test robot noticed the following build errors:

[auto build test ERROR on gerg-m68knommu/for-next]
[also build test ERROR on linus/master v6.18 next-20251212]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Haoxiang-Li/nubus-add-a-cleanup-in-nubus_init/20251212-203606
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git for-next
patch link:    https://lore.kernel.org/r/20251212122930.36115-1-lihaoxiang%40isrc.iscas.ac.cn
patch subject: [PATCH] nubus: add a cleanup in nubus_init()
config: m68k-defconfig (https://download.01.org/0day-ci/archive/20251213/202512131055.DdhG2azK-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512131055.DdhG2azK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512131055.DdhG2azK-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/nubus/nubus.c: In function 'nubus_init':
>> drivers/nubus/nubus.c:887:29: error: 'nubus_parent' undeclared (first use in this function); did you mean 'nubus_dirent'?
     887 |                 put_device(&nubus_parent);
         |                             ^~~~~~~~~~~~
         |                             nubus_dirent
   drivers/nubus/nubus.c:887:29: note: each undeclared identifier is reported only once for each function it appears in


vim +887 drivers/nubus/nubus.c

   876	
   877	static int __init nubus_init(void)
   878	{
   879		int err;
   880	
   881		if (!MACH_IS_MAC)
   882			return 0;
   883	
   884		nubus_proc_init();
   885		err = nubus_parent_device_register();
   886		if (err) {
 > 887			put_device(&nubus_parent);
   888			return err;
   889		}
   890		nubus_scan_bus();
   891		return 0;
   892	}
   893	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
