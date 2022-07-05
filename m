Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45630C43334
	for <linux-m68k@archiver.kernel.org>; Tue,  5 Jul 2022 07:05:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231331AbiGEHFv (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 5 Jul 2022 03:05:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229727AbiGEHFk (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 5 Jul 2022 03:05:40 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED88513CE7
        for <linux-m68k@lists.linux-m68k.org>; Tue,  5 Jul 2022 00:05:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657004734; x=1688540734;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=cA1id20EGQHjV/yqpQg1lpnEciTzwKiX8nMv2gjYof8=;
  b=Pny1HUNLiUz8NkaHNXxnAX3duLn0E11yB1F4U6fMqZGavpy3HxX3LF+0
   I9snj/9K7Vi+QPL2zfWb50ToC6tPp+j5h3243xyiaiYeLL/Xn+r2T2r63
   EmTG7ivRofpwRbeUQ8uZAepXb5wtkfMjOrOvsghzWKZ1ew34imx74YpN4
   iw2xJumfRyJtAhDrKAmRmE1FyfkZAAEAJYPveXZDn36NqYgz/UXeTpGt1
   2ktbwLfxA4XsExrY1X8wetDT5wrpeNEl7Q5S/UQwbCLPh8QswuYrA4349
   zrojjNLBC5FaCcKcPejsIsf51X+8DlSY94bj+ytpp/0CbXxaXXEGIeb8j
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10398"; a="272048226"
X-IronPort-AV: E=Sophos;i="5.92,245,1650956400"; 
   d="scan'208";a="272048226"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2022 00:05:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,245,1650956400"; 
   d="scan'208";a="682409239"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 05 Jul 2022 00:05:31 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1o8ccl-000Ipc-7p;
        Tue, 05 Jul 2022 07:05:31 +0000
Date:   Tue, 05 Jul 2022 15:04:32 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:master] BUILD SUCCESS
 dd9ab4734e4802b64911299764b9834f0296166b
Message-ID: <62c3e280.yRmszKMooOpW2uxe%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git master
branch HEAD: dd9ab4734e4802b64911299764b9834f0296166b  m68k: q40: Align '*' in comments

elapsed time: 721m

configs tested: 52
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm                              allyesconfig
ia64                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
m68k                             allyesconfig
m68k                             allmodconfig
powerpc                           allnoconfig
sh                               allmodconfig
mips                             allyesconfig
powerpc                          allmodconfig
i386                                defconfig
i386                             allyesconfig
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                        randconfig-a006
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a015
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a016
arc                  randconfig-r043-20220703
riscv                randconfig-r042-20220703
s390                 randconfig-r044-20220703
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                           allyesconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit

clang tested configs:
x86_64                        randconfig-a005
x86_64                        randconfig-a001
x86_64                        randconfig-a003
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a006
x86_64                        randconfig-a012
x86_64                        randconfig-a016
x86_64                        randconfig-a014
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015
hexagon              randconfig-r041-20220703
hexagon              randconfig-r045-20220703

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
