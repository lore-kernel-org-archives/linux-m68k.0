Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15B82C433FE
	for <linux-m68k@archiver.kernel.org>; Thu, 29 Sep 2022 09:36:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232298AbiI2JgU (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 29 Sep 2022 05:36:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235679AbiI2Jfn (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 29 Sep 2022 05:35:43 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19295FD20
        for <linux-m68k@lists.linux-m68k.org>; Thu, 29 Sep 2022 02:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1664444125; x=1695980125;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=wL79PKtC/A1IBphh5z5rE07jxzqrtU760n00sGuJLnQ=;
  b=FEO5PpEzJrDnvC2gMivkrELrb8xRLNmv7U7Ev4+xfVvmnFKxC8tEWm4N
   zGiQb+vWB8DHiz2mpw3jM+z0qOcnR08DtI+6UD08Yx6jNJurowKbRcgeT
   chmhfz8KzFyMNQWt6FxFhkSG4qUzDvvRy5avJpxZZcO76iWP8rAjf/4/O
   pm17eYF4Tuivn5KU1u/rfw8M9yY/aKzk+hzGSzG0j212XF1xKr/MrNLl2
   luA+Bc7r6zlhwfCWB1crME/QLEomPUOEIc/ycPJDw+GmbhGAuRIWotcaB
   Q1OAIrJ4IWpwiBuQT5URTU9QMMSu0dUyDgHQe/bCUJrBK2MGZSj5PT6t7
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10484"; a="328220402"
X-IronPort-AV: E=Sophos;i="5.93,354,1654585200"; 
   d="scan'208";a="328220402"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2022 02:35:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10484"; a="617536212"
X-IronPort-AV: E=Sophos;i="5.93,354,1654585200"; 
   d="scan'208";a="617536212"
Received: from lkp-server01.sh.intel.com (HELO 6126f2790925) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 29 Sep 2022 02:35:21 -0700
Received: from kbuild by 6126f2790925 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1odpwu-0000xZ-2O;
        Thu, 29 Sep 2022 09:35:20 +0000
Date:   Thu, 29 Sep 2022 17:34:25 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:for-v6.1] BUILD SUCCESS
 dc63a086daee92c63e392e4e7cd7ed61f3693026
Message-ID: <633566a1.PkJAnlCC71J/m0Uk%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git for-v6.1
branch HEAD: dc63a086daee92c63e392e4e7cd7ed61f3693026  m68k: Rework BI_VIRT_RNG_SEED as BI_RNG_SEED

elapsed time: 728m

configs tested: 47
configs skipped: 114

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
m68k                             allyesconfig
m68k                             allmodconfig
i386                             allyesconfig
i386                                defconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig
m68k                         amcore_defconfig
s390                             allmodconfig
mips                           xway_defconfig
sh                          lboxre2_defconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
i386                 randconfig-a003-20220926
i386                 randconfig-a001-20220926
i386                 randconfig-a006-20220926
i386                 randconfig-a004-20220926
i386                 randconfig-a005-20220926
i386                 randconfig-a002-20220926
um                           x86_64_defconfig
um                             i386_defconfig
i386                          randconfig-c001

clang tested configs:
hexagon              randconfig-r041-20220928
hexagon              randconfig-r045-20220928
riscv                randconfig-r042-20220928
s390                 randconfig-r044-20220928
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                 randconfig-a011-20220926
i386                 randconfig-a015-20220926
i386                 randconfig-a014-20220926
i386                 randconfig-a012-20220926
i386                 randconfig-a013-20220926
i386                 randconfig-a016-20220926
arm                    vt8500_v6_v7_defconfig
mips                           ip22_defconfig
powerpc                     akebono_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
