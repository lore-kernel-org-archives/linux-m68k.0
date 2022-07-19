Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B4F3C43334
	for <linux-m68k@archiver.kernel.org>; Tue, 19 Jul 2022 09:12:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233865AbiGSJMp (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 19 Jul 2022 05:12:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229989AbiGSJMo (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 19 Jul 2022 05:12:44 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4119B23BC6
        for <linux-m68k@lists.linux-m68k.org>; Tue, 19 Jul 2022 02:12:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1658221964; x=1689757964;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=3tWOpo39CrXFSPwLvdx9z0QBTqAlwUp+5v0hw6tJMLI=;
  b=LShtgnO8UP0EOkpwuzhMAddKGmuc7BDJUIfmglUGndXgYqGGAAtgQtMK
   BKX4zSskjf6yTXzVLQ2ZtSxXaWcHMcKsWbaJ21biMXsPU7on0TkT9396l
   PN15JTZHoqIUlB/YyY//z//g5Zn0a5vW5MF9/abPr0e2Ir2+dwfl4Hz7W
   CnSh5HRqF95C+4ZpvbRWWOJwtSv1bSfTe4fniZ250ruk3EWdPO8/GG4wT
   kG9yQwq4W7FN9XaikZ/4gIlIM3KRxgaWmBqfPDyCi+1dRiAR6Of8Zpr8y
   Z/ZhvA0oD16b90gRGf0QUFsskn5aM0+8Wdtf3EpiPybPHTtTDVIY2YElR
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10412"; a="266842947"
X-IronPort-AV: E=Sophos;i="5.92,283,1650956400"; 
   d="scan'208";a="266842947"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2022 02:12:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,283,1650956400"; 
   d="scan'208";a="739795422"
Received: from lkp-server02.sh.intel.com (HELO ff137eb26ff1) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 19 Jul 2022 02:12:42 -0700
Received: from kbuild by ff137eb26ff1 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1oDjHV-0005T6-Jt;
        Tue, 19 Jul 2022 09:12:41 +0000
Date:   Tue, 19 Jul 2022 17:12:11 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:master] BUILD SUCCESS
 6f6ecd46902059f00e1191a5d2adc8cac066bbf1
Message-ID: <62d6756b.2wZaban4RJ3dwsUo%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git master
branch HEAD: 6f6ecd46902059f00e1191a5d2adc8cac066bbf1  Merge tag 'v5.19-rc7'

elapsed time: 728m

configs tested: 56
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm                              allyesconfig
arm64                            allyesconfig
ia64                             allmodconfig
arc                               allnoconfig
alpha                             allnoconfig
riscv                             allnoconfig
csky                              allnoconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
m68k                             allyesconfig
powerpc                          allmodconfig
mips                             allyesconfig
powerpc                           allnoconfig
sh                               allmodconfig
i386                                defconfig
i386                             allyesconfig
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                        randconfig-a006
x86_64               randconfig-a013-20220718
x86_64               randconfig-a012-20220718
x86_64               randconfig-a015-20220718
x86_64               randconfig-a014-20220718
x86_64               randconfig-a016-20220718
x86_64               randconfig-a011-20220718
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a016
arc                  randconfig-r043-20220718
riscv                randconfig-r042-20220718
s390                 randconfig-r044-20220718
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                           allyesconfig
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                    rhel-8.3-kselftests
x86_64                           rhel-8.3-syz

clang tested configs:
x86_64                        randconfig-a005
x86_64                        randconfig-a001
x86_64                        randconfig-a003
i386                 randconfig-a003-20220718
i386                 randconfig-a005-20220718
i386                 randconfig-a001-20220718
i386                 randconfig-a002-20220718
i386                 randconfig-a006-20220718
i386                 randconfig-a004-20220718
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015
hexagon              randconfig-r041-20220718
hexagon              randconfig-r045-20220718

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
