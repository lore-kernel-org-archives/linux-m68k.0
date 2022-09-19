Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08662ECAAD3
	for <linux-m68k@archiver.kernel.org>; Mon, 19 Sep 2022 21:33:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229676AbiISVdS (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 19 Sep 2022 17:33:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229698AbiISVdR (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 19 Sep 2022 17:33:17 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 733DA32BB8
        for <linux-m68k@lists.linux-m68k.org>; Mon, 19 Sep 2022 14:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663623196; x=1695159196;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=lnVqoei7a9+rDsw61qVeEjHjM7Sne9PiTrAktEEN9Bg=;
  b=MWYuhdt2lBSjcdqw27O42euw1v/a2B5CmL5RmttLkh6kv+cqCcE3bhNU
   GW/qmC3nRjj+zbz5Kk/XyOFxGPkwEO5EuvWn5waDN4hd16IlcsvYlFkTi
   UuSO7cYEsbLXbeig4vto7nS4lDG9GJISvxr30uOolL4aCdGUEyyQYfK2V
   +JbfjYOJ8UoceF/W9whYYEHNwDVX7bQa4bikvhbLAIkg6546ZhnTb10JN
   qhqU3ZOTl2YVLKSdFEZA+EsRRjuguIsarj1xypXvXaRuaM353W7Y2xxeQ
   g3f+trpDKk7DbKjb6kQwdrGRHbNcfbYnLa0yFOb3jlYUQ9pCvM9rjozBL
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10475"; a="299519182"
X-IronPort-AV: E=Sophos;i="5.93,328,1654585200"; 
   d="scan'208";a="299519182"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2022 14:33:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,328,1654585200"; 
   d="scan'208";a="744270093"
Received: from lkp-server01.sh.intel.com (HELO c0a60f19fe7e) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 19 Sep 2022 14:33:14 -0700
Received: from kbuild by c0a60f19fe7e with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oaOO9-0002Ek-2K;
        Mon, 19 Sep 2022 21:33:13 +0000
Date:   Tue, 20 Sep 2022 05:32:39 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:master] BUILD SUCCESS
 0f365f52382d7ec1e27394b37869ca7ff12a4eb9
Message-ID: <6328dff7.q1JVnjP3XTQ/Can5%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git master
branch HEAD: 0f365f52382d7ec1e27394b37869ca7ff12a4eb9  Merge tag 'v6.0-rc6'

elapsed time: 722m

configs tested: 58
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arc                                 defconfig
alpha                               defconfig
s390                             allmodconfig
s390                                defconfig
arc                  randconfig-r043-20220919
x86_64                    rhel-8.3-kselftests
x86_64                          rhel-8.3-func
i386                                defconfig
s390                 randconfig-r044-20220919
um                             i386_defconfig
um                           x86_64_defconfig
riscv                randconfig-r042-20220919
x86_64                         rhel-8.3-kunit
s390                             allyesconfig
powerpc                           allnoconfig
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-syz
x86_64                              defconfig
x86_64               randconfig-a012-20220919
x86_64               randconfig-a011-20220919
x86_64                               rhel-8.3
sh                               allmodconfig
i386                             allyesconfig
mips                             allyesconfig
powerpc                          allmodconfig
x86_64               randconfig-a014-20220919
x86_64               randconfig-a015-20220919
x86_64               randconfig-a013-20220919
x86_64                           allyesconfig
arm                                 defconfig
i386                 randconfig-a013-20220919
x86_64               randconfig-a016-20220919
i386                 randconfig-a012-20220919
i386                 randconfig-a014-20220919
ia64                             allmodconfig
m68k                             allmodconfig
i386                 randconfig-a011-20220919
arc                              allyesconfig
i386                 randconfig-a015-20220919
i386                 randconfig-a016-20220919
alpha                            allyesconfig
m68k                             allyesconfig
arm                              allyesconfig
arm64                            allyesconfig

clang tested configs:
hexagon              randconfig-r041-20220919
hexagon              randconfig-r045-20220919
i386                 randconfig-a001-20220919
i386                 randconfig-a002-20220919
x86_64               randconfig-a003-20220919
x86_64               randconfig-a001-20220919
i386                 randconfig-a003-20220919
x86_64               randconfig-a002-20220919
i386                 randconfig-a004-20220919
x86_64               randconfig-a004-20220919
i386                 randconfig-a005-20220919
x86_64               randconfig-a006-20220919
x86_64               randconfig-a005-20220919
i386                 randconfig-a006-20220919

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
