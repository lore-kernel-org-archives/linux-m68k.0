Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E63661E572F
	for <linux-m68k@lists.linux-m68k.org>; Fri, 27 Jun 2025 06:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751004003; cv=none; b=iXAaUC6SvjXm50QIAiio4XWnT+mlv0sezXa/fmMkHz5K/Bn+ESaNB/MRBoZdZW/TWLlg+lqvKPc9z6mgVv8aChv8u6LPVvy/5sAwGvnTzVPfyKdg5DeMnAPxhp6fUYxsCrFSvenWwmgwv0isKuC+0j8A71RFXBUqDNbgpyGefuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751004003; c=relaxed/simple;
	bh=PNjNZMpScHoR5w6If3yM1SnGGvv4bf5QJBsM8IGLZV4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZiA/69TNVkpT9v027TVIdaMeFhZ6YSvLIFrSVDnHDie9zMElJMFkOWUjNIGfRhTbpP51NadDnkwC9/qfpL2NcD3FichmPRUBdK/vFfNcGpicMCiThe6BIepl4Fw2SuQMI9wVzrdpkkX6xONPjBVbsrf7FcXwrYSw8vZ0TrZF4PY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jS5nYgkJ; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jS5nYgkJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751004002; x=1782540002;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PNjNZMpScHoR5w6If3yM1SnGGvv4bf5QJBsM8IGLZV4=;
  b=jS5nYgkJYqD667LMGFl6QovCcyGHD6L8q6HwK5r0yJo6kJqGwEbR+M5N
   sp2kJgd4aq8woZpSHmIUS1rypt9QXla608ttS/1ur9n/zE+sSVHJnyG2r
   qKp/dR47bY9yhS7dKehsv/fIU/BELl8e2IIsdux0GhdLXFcT6XCYKMeb3
   Wn6g2d/4/Z2ff7c6VIkfJK3JlSzn4Kx8CizWpIAnUXPrnGmcdUbljhpWi
   9YjruEmIASXIAv5GOjpzPoAwhF/pPImzuWl5BXlInzs09GQ8KjzBa2Pa+
   wfczox1AfunbCEG2CsEHenMEZfWBqhPRUF+ndBtbHiWjWGt9Katrm96vD
   w==;
X-CSE-ConnectionGUID: sWfIenH0T+CnWn6A+rO9tQ==
X-CSE-MsgGUID: 7HBD/w12R4ql7JhvfkDv6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="63569806"
X-IronPort-AV: E=Sophos;i="6.16,269,1744095600"; 
   d="scan'208";a="63569806"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 23:00:01 -0700
X-CSE-ConnectionGUID: qIAPEiwdQJCUGJBChcHHrA==
X-CSE-MsgGUID: O1Bz6RBsRnqMXQ9UtQ6qaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,269,1744095600"; 
   d="scan'208";a="157009570"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 26 Jun 2025 22:59:59 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uV27x-000VqE-0u;
	Fri, 27 Jun 2025 05:59:57 +0000
Date: Fri, 27 Jun 2025 13:59:04 +0800
From: kernel test robot <lkp@intel.com>
To: Greg Ungerer <gerg@linux-m68k.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
	uclinux-dev@uclinux.org
Subject: [gerg-m68knommu:dt 7/14] arch/m68k/coldfire/intc.c:173:34: error:
 'MCFINT_VECBASE' undeclared
Message-ID: <202506271329.TPfKPXfx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git dt
head:   f1fa7fc50979940f45a83a33ea77b41c98d8e29b
commit: bd3e6e3ba6e920be08054f1c066c0cf8801875af [7/14] m68k: coldfire: support devicetree binding for intc controller
config: m68k-amcore_defconfig (https://download.01.org/0day-ci/archive/20250627/202506271329.TPfKPXfx-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250627/202506271329.TPfKPXfx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506271329.TPfKPXfx-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/m68k/coldfire/intc.c: In function 'intc_of_init':
>> arch/m68k/coldfire/intc.c:173:34: error: 'MCFINT_VECBASE' undeclared (first use in this function)
     173 |         const unsigned int num = MCFINT_VECBASE + 64;
         |                                  ^~~~~~~~~~~~~~
   arch/m68k/coldfire/intc.c:173:34: note: each undeclared identifier is reported only once for each function it appears in


vim +/MCFINT_VECBASE +173 arch/m68k/coldfire/intc.c

   169	
   170	static int __init intc_of_init(struct device_node *np,
   171				       struct device_node *parent)
   172	{
 > 173		const unsigned int num = MCFINT_VECBASE + 64;
   174		struct irq_domain *domain;
   175		int irq;
   176	
   177		domain = irq_domain_add_linear(np, num, &intc_irqdomain_ops, NULL);
   178	
   179		for (irq = MCFINT_VECBASE; irq < num; irq++)
   180			irq_create_mapping(domain, irq);
   181	
   182		return 0;
   183	}
   184	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
