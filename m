Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 912B8144304
	for <linux-m68k@lists.linux-m68k.org>; Fri, 14 Mar 2025 06:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741933728; cv=none; b=AosmqCLPXqP8W2tat6wZByObzt4QJBQqMtrrYPosfbSKdPN/bZzLaH8NDti4dAFvBRvsPCtP7PYmZcZxDRNOCeMUZL4tSiC+0X5nBCzCiXkE7FhZs8H6wGpQOJy+cnnihSVn95MOly3pxJw3YMsIN7tmuTs5k5eGkOlNuVC0XlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741933728; c=relaxed/simple;
	bh=s1M66vKWTgbRTSkxE/ZCDxRXrnq7Ha/dwselkuexWrg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HhB+hBrFxyFXSfVWBtvVfoXd1opI2V/JSa1WSVd1/f1Wc0YmnqR7Dv0z6+QDq8QtKqq0la5PQP5T0EvtD0zFYkkPXHRFmFwKO9l4FVZbBGrlPGhwv1hS/DWWVB8PdOx+KLAiW8OGHolun1lG/fNTT2B/R4ynWrP78l7PmkHOCd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZPF5iKVV; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZPF5iKVV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741933727; x=1773469727;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=s1M66vKWTgbRTSkxE/ZCDxRXrnq7Ha/dwselkuexWrg=;
  b=ZPF5iKVV62n+BXud3hheh4uGLwxeBGbx55o83ghDHO6v0adV/gFTFKPl
   iTkaQiuUtmiX1CKj/9KNZaiY+B3bLNFILkv0feyxx0ifyORTKO3rAq8pQ
   1248NT0ItvbIDW/2qFVmIlOzCWcvVbaL4l4rccEtdgavnbO93dMOgqrh6
   bGtRi12tqAHUDx217GXXvPQS0+ishTX4eSheu8gspoYNr7qCaJxLQ/9uc
   R5ctuz1pKarEr5yBAmiTqIjBfxGbiV9uikc5xyMOlSvy3F+zWR0FdRLv4
   YWUgSRdYQeHdQfkZMkv4Fwv2JZQSvAQ5TlcHFmFI/i7VNtoTPUVm7fwuL
   A==;
X-CSE-ConnectionGUID: +fEkPY2ZS+W6/DzK5hWPMw==
X-CSE-MsgGUID: ad4TvTVHS22zFYErAmlrFg==
X-IronPort-AV: E=McAfee;i="6700,10204,11372"; a="54455199"
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; 
   d="scan'208";a="54455199"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2025 23:28:45 -0700
X-CSE-ConnectionGUID: YisgfRewReeJP4xK5eVXLA==
X-CSE-MsgGUID: Hu7xDrTAQz6SiTwVdpayBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; 
   d="scan'208";a="152119239"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 13 Mar 2025 23:28:43 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tsyXB-000AAU-1l;
	Fri, 14 Mar 2025 06:28:41 +0000
Date: Fri, 14 Mar 2025 14:27:42 +0800
From: kernel test robot <lkp@intel.com>
To: Greg Ungerer <gerg@linux-m68k.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
	uclinux-dev@uclinux.org
Subject: [gerg-m68knommu:dt 5/14] drivers/gpu/drm/tegra/hdmi.h:122:9:
 warning: "ACR_ENABLE" redefined
Message-ID: <202503141417.1McpE8Mn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git dt
head:   91b4bcf6b8709da81124749743327c60b904fef8
commit: 0cc1fe544a742bcb4a96a404bab84d5cd4d789c4 [5/14] m68k: coldfire: enable common clock framework
config: m68k-randconfig-r123-20250314 (https://download.01.org/0day-ci/archive/20250314/202503141417.1McpE8Mn-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250314/202503141417.1McpE8Mn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503141417.1McpE8Mn-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/tegra/hdmi.c:35:
>> drivers/gpu/drm/tegra/hdmi.h:122:9: warning: "ACR_ENABLE" redefined
     122 | #define ACR_ENABLE         (1 << 31)
         |         ^~~~~~~~~~
   In file included from arch/m68k/include/asm/m5441xsim.h:19,
                    from arch/m68k/include/asm/mcfsim.h:48,
                    from arch/m68k/include/asm/io_no.h:35,
                    from arch/m68k/include/asm/io.h:6,
                    from include/linux/io.h:14,
                    from include/linux/irq.h:20,
                    from include/asm-generic/hardirq.h:17,
                    from ./arch/m68k/include/generated/asm/hardirq.h:1,
                    from include/linux/hardirq.h:11,
                    from include/linux/interrupt.h:11,
                    from include/linux/kernel_stat.h:8,
                    from include/linux/cgroup.h:26,
                    from include/linux/memcontrol.h:13,
                    from include/linux/swap.h:9,
                    from include/linux/suspend.h:5,
                    from include/linux/regulator/consumer.h:35,
                    from drivers/gpu/drm/tegra/hdmi.c:17:
   arch/m68k/include/asm/m54xxacr.h:34:9: note: this is the location of the previous definition
      34 | #define ACR_ENABLE      0x00008000      /* Enable address */
         |         ^~~~~~~~~~


vim +/ACR_ENABLE +122 drivers/gpu/drm/tegra/hdmi.h

edec4af4c3d6d22 Thierry Reding 2012-11-15  119  
edec4af4c3d6d22 Thierry Reding 2012-11-15  120  #define ACR_SUBPACK_CTS(x) (((x) & 0xffffff) << 8)
edec4af4c3d6d22 Thierry Reding 2012-11-15  121  #define ACR_SUBPACK_N(x)   (((x) & 0xffffff) << 0)
edec4af4c3d6d22 Thierry Reding 2012-11-15 @122  #define ACR_ENABLE         (1 << 31)
edec4af4c3d6d22 Thierry Reding 2012-11-15  123  

:::::: The code at line 122 was first introduced by commit
:::::: edec4af4c3d6d225578290a9acc38c78147df55b drm: tegra: Add HDMI support

:::::: TO: Thierry Reding <thierry.reding@avionic-design.de>
:::::: CC: Dave Airlie <airlied@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
