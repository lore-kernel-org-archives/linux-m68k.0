Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A123EC433F5
	for <linux-m68k@archiver.kernel.org>; Thu, 29 Sep 2022 09:36:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234738AbiI2JgV (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 29 Sep 2022 05:36:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235289AbiI2Jf4 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 29 Sep 2022 05:35:56 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF5D53057D
        for <linux-m68k@lists.linux-m68k.org>; Thu, 29 Sep 2022 02:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1664444124; x=1695980124;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=WmvesdF2bSTkZ9sWoJOK9gDp3uaYU2hbkfDxnCYM63U=;
  b=Sj7FYmU6OrMooPkvCUsfE8sfEpKM9DV9s+vXHOwyw1+QdMFHByO8515r
   OsVt8xQJn3FllNwbHzjKsFjOYYZfia0YnMO771FGZ6yD4jnR1Rpv0pIXo
   LGpV6/5z64OtMdB+SAf6pN2avDU6k3nVsmQMshADlhEKEOmv0kA4PzagN
   +3nQZ83zE1ytf99o+wqJZ+eULUQun9kXuaTgNAUz6ZjhBgBr0cxreNmvz
   yM2mhpNg5ZPs3F0oTob1PWS+0CueZTuz3f21YTTTxGifyOwNcT5+LZWNp
   41OMuZmDSwKMg+fBm6ARFuEOCwOsqt1WuLRTqsRyRY8rbnD9A6Ft2I395
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10484"; a="301819542"
X-IronPort-AV: E=Sophos;i="5.93,354,1654585200"; 
   d="scan'208";a="301819542"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2022 02:35:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10484"; a="747764671"
X-IronPort-AV: E=Sophos;i="5.93,354,1654585200"; 
   d="scan'208";a="747764671"
Received: from lkp-server01.sh.intel.com (HELO 6126f2790925) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 29 Sep 2022 02:35:21 -0700
Received: from kbuild by 6126f2790925 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1odpwu-0000xQ-2D;
        Thu, 29 Sep 2022 09:35:20 +0000
Date:   Thu, 29 Sep 2022 17:34:22 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:master] BUILD SUCCESS
 f1bb20c8be1929743fdb313b4770601afc39c1b7
Message-ID: <6335669e.PP6helDYG4dPzkYH%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git master
branch HEAD: f1bb20c8be1929743fdb313b4770601afc39c1b7  m68k: Rework BI_VIRT_RNG_SEED as BI_RNG_SEED

elapsed time: 727m

configs tested: 58
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arc                                 defconfig
alpha                               defconfig
s390                             allmodconfig
s390                                defconfig
um                             i386_defconfig
s390                             allyesconfig
um                           x86_64_defconfig
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-syz
i386                                defconfig
x86_64                              defconfig
powerpc                           allnoconfig
arm                                 defconfig
powerpc                          allmodconfig
mips                             allyesconfig
sh                               allmodconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64               randconfig-a002-20220926
x86_64                    rhel-8.3-kselftests
x86_64               randconfig-a004-20220926
x86_64                           allyesconfig
i386                          randconfig-a001
x86_64               randconfig-a001-20220926
i386                          randconfig-a003
x86_64               randconfig-a003-20220926
i386                             allyesconfig
arm                              allyesconfig
i386                          randconfig-a005
arm64                            allyesconfig
m68k                             allmodconfig
alpha                            allyesconfig
x86_64               randconfig-a005-20220926
arc                  randconfig-r043-20220925
m68k                             allyesconfig
x86_64               randconfig-a006-20220926
arc                              allyesconfig
riscv                randconfig-r042-20220925
s390                 randconfig-r044-20220925
ia64                             allmodconfig

clang tested configs:
i386                          randconfig-a002
i386                 randconfig-a011-20220926
i386                 randconfig-a014-20220926
i386                          randconfig-a004
x86_64               randconfig-a015-20220926
x86_64               randconfig-a012-20220926
x86_64               randconfig-a014-20220926
i386                          randconfig-a006
hexagon              randconfig-r041-20220925
x86_64               randconfig-a016-20220926
i386                 randconfig-a012-20220926
x86_64               randconfig-a013-20220926
i386                 randconfig-a015-20220926
i386                 randconfig-a013-20220926
x86_64               randconfig-a011-20220926
i386                 randconfig-a016-20220926
hexagon              randconfig-r045-20220925

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
