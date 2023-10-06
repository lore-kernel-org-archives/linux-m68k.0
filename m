Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6825E94114
	for <linux-m68k@archiver.kernel.org>; Fri,  6 Oct 2023 20:44:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233510AbjJFUof (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 6 Oct 2023 16:44:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233504AbjJFUoe (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 6 Oct 2023 16:44:34 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AD00BD
        for <linux-m68k@lists.linux-m68k.org>; Fri,  6 Oct 2023 13:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696625074; x=1728161074;
  h=date:from:to:cc:subject:message-id;
  bh=g6+LlPirpQCglWQB5PBEdzaH1PBULEw0MTYCfSLQZN8=;
  b=YEUPRvVdlUBK66gZKMWS2ZnP+vbnVKypIdqRWBpatU6ppx3cIGtmh+4+
   UfWE2PX11xMEs2fNZ+1C4wzVIkYdAnZwtRoUqv2QrWIPHXfuuxzwfJmwu
   gKNU5PcWu9dUOyOJH2Iy0sciNiVKc1P8I++wM/pp3FAaaiBzPQx35LmsD
   cgs2WUwOgLFp+oeT7dkRvOh9k/54p2zRf97DcxLOVFCdPFNUp2+XvvGBx
   Y/ZJoxroDRwKyT2n12JWv4hBHMrdNOk07pHCQaoOVfFDqv0wTjb6KQGFu
   QJ5+OAjd1X9x0eW/dwY1RNmnI8wX/YP/T74emgCeRCm/x3gwHfB5yh0ah
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10855"; a="470097716"
X-IronPort-AV: E=Sophos;i="6.03,204,1694761200"; 
   d="scan'208";a="470097716"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2023 13:44:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10855"; a="702169410"
X-IronPort-AV: E=Sophos;i="6.03,204,1694761200"; 
   d="scan'208";a="702169410"
Received: from lkp-server01.sh.intel.com (HELO 8a3a91ad4240) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 06 Oct 2023 13:44:32 -0700
Received: from kbuild by 8a3a91ad4240 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qorgU-0003dP-0B;
        Fri, 06 Oct 2023 20:44:30 +0000
Date:   Sat, 07 Oct 2023 04:43:57 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:for-v6.7] BUILD SUCCESS
 48ceb35e72683dce009f2b47f6579b0a1f9d9768
Message-ID: <202310070455.i1EpDpFF-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git for-v6.7
branch HEAD: 48ceb35e72683dce009f2b47f6579b0a1f9d9768  m68k: defconfig: Update virt_defconfig for v6.6-rc3

elapsed time: 745m

configs tested: 4
configs skipped: 125

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
