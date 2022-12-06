Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECC4BC47089
	for <linux-m68k@archiver.kernel.org>; Tue,  6 Dec 2022 00:40:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232584AbiLFAkj (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 5 Dec 2022 19:40:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232616AbiLFAkT (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 5 Dec 2022 19:40:19 -0500
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC30620F76
        for <linux-m68k@lists.linux-m68k.org>; Mon,  5 Dec 2022 16:38:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1670287131; x=1701823131;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=YcuvdrrjohFJ+Xb416d9ZsetcNPwVK/xm8nfdfaww08=;
  b=NSVkw/G3ARw9Mw+86NH6FmF1o4icdOb8nn5FiZJrWhnFYcQpLeWVNCBY
   tPaB6CX7Z84fycm4rDWzJJLUCWb56660tL4ZoDxM2/Gxi6OvNjJNlgLBJ
   LLPXsE9Jf79vf8SxFNHvOfzU1BQ5rEJDTb3Xgaa4Zeuiy4cNONSqDvABU
   +DDxBf7hG4epTW8G8YVnvRlAROy9X0fLr57Pom/N89W7QTpWSqVkOoxcQ
   /Q1r8/lXHrDAqJfF7YAS5cl16Rr7bwxXHd7ck3j1naImhJcltQXL/KHdu
   cilxX1Y3yI6CghDNbuSqZH6XLVaJsf8xShX+XC3EfDvoXMU3/GpmLzkxw
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10552"; a="296190837"
X-IronPort-AV: E=Sophos;i="5.96,220,1665471600"; 
   d="scan'208";a="296190837"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2022 16:38:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10552"; a="891178060"
X-IronPort-AV: E=Sophos;i="5.96,220,1665471600"; 
   d="scan'208";a="891178060"
Received: from lkp-server01.sh.intel.com (HELO b3c45e08cbc1) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 05 Dec 2022 16:38:27 -0800
Received: from kbuild by b3c45e08cbc1 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1p2Lyd-0000Rp-0C;
        Tue, 06 Dec 2022 00:38:27 +0000
Date:   Tue, 06 Dec 2022 08:38:24 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:master] BUILD SUCCESS
 815a2a23b79ae9655d9fa85099381ca1e776c5be
Message-ID: <638e8f00.g4Gc4+y76LI3tzMv%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git master
branch HEAD: 815a2a23b79ae9655d9fa85099381ca1e776c5be  Merge tag 'v6.1-rc8'

elapsed time: 727m

configs tested: 63
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
ia64                             allmodconfig
um                             i386_defconfig
um                           x86_64_defconfig
arc                                 defconfig
alpha                               defconfig
s390                             allmodconfig
i386                                defconfig
s390                                defconfig
x86_64                              defconfig
x86_64               randconfig-a011-20221205
x86_64               randconfig-a012-20221205
s390                             allyesconfig
arc                              allyesconfig
x86_64                               rhel-8.3
x86_64               randconfig-a014-20221205
alpha                            allyesconfig
x86_64               randconfig-a013-20221205
x86_64                           allyesconfig
x86_64               randconfig-a015-20221205
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64                    rhel-8.3-kselftests
x86_64                           rhel-8.3-kvm
x86_64                          rhel-8.3-func
x86_64               randconfig-a016-20221205
m68k                             allmodconfig
m68k                             allyesconfig
powerpc                           allnoconfig
i386                             allyesconfig
powerpc                          allmodconfig
arm                                 defconfig
mips                             allyesconfig
arc                  randconfig-r043-20221205
s390                 randconfig-r044-20221205
arm                              allyesconfig
riscv                randconfig-r042-20221205
i386                 randconfig-a014-20221205
i386                 randconfig-a013-20221205
arm64                            allyesconfig
sh                               allmodconfig
i386                 randconfig-a012-20221205
i386                 randconfig-a015-20221205
i386                 randconfig-a011-20221205
i386                 randconfig-a016-20221205

clang tested configs:
x86_64               randconfig-a003-20221205
x86_64               randconfig-a001-20221205
x86_64               randconfig-a002-20221205
x86_64               randconfig-a004-20221205
x86_64               randconfig-a005-20221205
x86_64               randconfig-a006-20221205
hexagon              randconfig-r045-20221205
arm                  randconfig-r046-20221205
hexagon              randconfig-r041-20221205
i386                 randconfig-a003-20221205
i386                 randconfig-a001-20221205
i386                 randconfig-a002-20221205
i386                 randconfig-a005-20221205
i386                 randconfig-a004-20221205
i386                 randconfig-a006-20221205
hexagon              randconfig-r041-20221204
riscv                randconfig-r042-20221204
hexagon              randconfig-r045-20221204
s390                 randconfig-r044-20221204

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
