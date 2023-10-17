Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8059FCDB465
	for <linux-m68k@archiver.kernel.org>; Tue, 17 Oct 2023 02:08:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230343AbjJQCIZ (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 16 Oct 2023 22:08:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229666AbjJQCIY (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 16 Oct 2023 22:08:24 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4EDB9B
        for <linux-m68k@lists.linux-m68k.org>; Mon, 16 Oct 2023 19:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697508503; x=1729044503;
  h=date:from:to:cc:subject:message-id;
  bh=1FVwb9yVBOLyE2DyscxXMqgNmCXfdSdnV2Y9lI1DuAc=;
  b=F9/xgEfOI7mbAJJyBgeFN37D3LshrY3k1arVuzTtsOF1ltsCuR6QW9tv
   XYNIq+J3UDNIiTK/OMsc1dxblrCJeRjF2IE2kg5puuR79kbAFVIgTuQhk
   Nvtfbug3couE+bXYQyNTA5tNL+Z9apwEviT6/PC41y3FXm1dKL1GM8Ydq
   mKfvQkoxl3qOrz/OJS0ezLt3YL9LCrHS26W7JCwaBzFG6cRIuzAqhTr3Y
   uruTzwsKAbLa5dm4n1I1THhP8bGXFcfb6LInL5vLzDh8DGfZwtjYNDe1R
   7U5ebiIFISli1C3Xbhu1OBYXzYyyq+sXeAMPRG68ohKdCe1D6BaGfZLyg
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="7246751"
X-IronPort-AV: E=Sophos;i="6.03,230,1694761200"; 
   d="scan'208";a="7246751"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2023 19:08:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="929580123"
X-IronPort-AV: E=Sophos;i="6.03,230,1694761200"; 
   d="scan'208";a="929580123"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 16 Oct 2023 19:08:21 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qsZVL-0008qW-0M;
        Tue, 17 Oct 2023 02:08:19 +0000
Date:   Tue, 17 Oct 2023 10:07:42 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:for-v6.7] BUILD SUCCESS
 03191fb3db3d2585725bcffe0356d12fcfd27c4c
Message-ID: <202310171040.4vaUuVp8-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git for-v6.7
branch HEAD: 03191fb3db3d2585725bcffe0356d12fcfd27c4c  m68k: lib: Include <linux/libgcc.h> for __muldi3()

elapsed time: 740m

configs tested: 4
configs skipped: 161

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
