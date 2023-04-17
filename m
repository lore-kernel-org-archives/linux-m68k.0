Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 566B0C77B72
	for <linux-m68k@archiver.kernel.org>; Mon, 17 Apr 2023 23:27:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229652AbjDQX1M (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 17 Apr 2023 19:27:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229461AbjDQX1L (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 17 Apr 2023 19:27:11 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C26BA3
        for <linux-m68k@lists.linux-m68k.org>; Mon, 17 Apr 2023 16:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681774029; x=1713310029;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=wPnw+MYu+6kSm8WBM12p+xZ5c93KJ146jZITi0B6nXQ=;
  b=WcusQzy3mrPJdr/K3ioWO8o2+7w8PN0YRO/3BeGqMQxQUiIvjMY0O6lq
   p/qKNl3qVKjwHyrjH6gpJWrKMtK7TseyfivsORS231DNa8pTCjOpRQIt8
   OgAsiFpWbNyFvUYaotTrvQ88QoVCEp8VAksIIY7z0Rj/0UFbcYrUkpjeF
   JW0Jw1NmHOdX/R/vEXd4wjzIbW/9/G48J+h1dCsq8gm+ODuhj/AVxxluP
   rXxjru6UKMScPVR0mJKuxA2UpksQ3qnHRlsOcHGSm6uMf/zZmOHJqv/ry
   32Wef/30hiF62J16025Qe+odmg1rEBWu8DOvGHvEsxfA4kSoFJ0l9RHI8
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="329204613"
X-IronPort-AV: E=Sophos;i="5.99,205,1677571200"; 
   d="scan'208";a="329204613"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2023 16:27:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="834641183"
X-IronPort-AV: E=Sophos;i="5.99,205,1677571200"; 
   d="scan'208";a="834641183"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 17 Apr 2023 16:27:07 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1poYFW-000cjq-2F;
        Mon, 17 Apr 2023 23:27:06 +0000
Date:   Tue, 18 Apr 2023 07:26:21 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:master] BUILD SUCCESS
 94ea4c5cbeeba22abb2abca416eedb2aca30bc67
Message-ID: <643dd59d.2HfNShQxa5Yth+OI%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git master
branch HEAD: 94ea4c5cbeeba22abb2abca416eedb2aca30bc67  Merge tag 'v6.3-rc7'

elapsed time: 821m

configs tested: 121
configs skipped: 9

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r033-20230416   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r021-20230416   gcc  
arc                  randconfig-r023-20230417   gcc  
arc                  randconfig-r032-20230416   gcc  
arc                  randconfig-r043-20230416   gcc  
arc                  randconfig-r043-20230417   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r013-20230417   gcc  
arm                  randconfig-r046-20230416   clang
arm                  randconfig-r046-20230417   gcc  
arm64                            allyesconfig   gcc  
arm64        buildonly-randconfig-r004-20230416   clang
arm64                               defconfig   gcc  
arm64                randconfig-r016-20230416   gcc  
arm64                randconfig-r036-20230417   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r021-20230417   gcc  
hexagon              randconfig-r041-20230416   clang
hexagon              randconfig-r041-20230417   clang
hexagon              randconfig-r045-20230416   clang
hexagon              randconfig-r045-20230417   clang
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-a001-20230417   gcc  
i386                 randconfig-a002-20230417   gcc  
i386                 randconfig-a003-20230417   gcc  
i386                 randconfig-a004-20230417   gcc  
i386                 randconfig-a005-20230417   gcc  
i386                 randconfig-a006-20230417   gcc  
i386                 randconfig-a011-20230417   clang
i386                 randconfig-a012-20230417   clang
i386                 randconfig-a013-20230417   clang
i386                 randconfig-a014-20230417   clang
i386                 randconfig-a015-20230417   clang
i386                 randconfig-a016-20230417   clang
ia64                             allmodconfig   gcc  
ia64         buildonly-randconfig-r001-20230417   gcc  
ia64         buildonly-randconfig-r003-20230416   gcc  
ia64                                defconfig   gcc  
ia64                 randconfig-r012-20230416   gcc  
ia64                 randconfig-r026-20230416   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch    buildonly-randconfig-r004-20230417   gcc  
loongarch                           defconfig   gcc  
m68k                             allmodconfig   gcc  
m68k         buildonly-randconfig-r003-20230417   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r011-20230417   gcc  
m68k                 randconfig-r013-20230416   gcc  
m68k                 randconfig-r034-20230417   gcc  
microblaze           randconfig-r014-20230417   gcc  
microblaze           randconfig-r016-20230417   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                 randconfig-r024-20230417   gcc  
nios2        buildonly-randconfig-r002-20230417   gcc  
nios2                               defconfig   gcc  
openrisc     buildonly-randconfig-r005-20230417   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r031-20230417   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc              randconfig-r031-20230416   clang
powerpc              randconfig-r033-20230417   gcc  
powerpc              randconfig-r036-20230416   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r015-20230417   clang
riscv                randconfig-r022-20230417   clang
riscv                randconfig-r025-20230416   gcc  
riscv                randconfig-r042-20230416   gcc  
riscv                randconfig-r042-20230417   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r022-20230416   gcc  
s390                 randconfig-r025-20230417   clang
s390                 randconfig-r026-20230417   clang
s390                 randconfig-r044-20230416   gcc  
s390                 randconfig-r044-20230417   clang
sh                               allmodconfig   gcc  
sh           buildonly-randconfig-r002-20230416   gcc  
sh           buildonly-randconfig-r006-20230416   gcc  
sh           buildonly-randconfig-r006-20230417   gcc  
sh                   randconfig-r024-20230416   gcc  
sparc                               defconfig   gcc  
sparc64              randconfig-r011-20230416   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230417   gcc  
x86_64               randconfig-a002-20230417   gcc  
x86_64               randconfig-a003-20230417   gcc  
x86_64               randconfig-a004-20230417   gcc  
x86_64               randconfig-a005-20230417   gcc  
x86_64               randconfig-a006-20230417   gcc  
x86_64               randconfig-a011-20230417   clang
x86_64               randconfig-a012-20230417   clang
x86_64               randconfig-a013-20230417   clang
x86_64               randconfig-a014-20230417   clang
x86_64               randconfig-a015-20230417   clang
x86_64               randconfig-a016-20230417   clang
x86_64                               rhel-8.3   gcc  
xtensa       buildonly-randconfig-r005-20230416   gcc  
xtensa               randconfig-r014-20230416   gcc  
xtensa               randconfig-r023-20230416   gcc  
xtensa               randconfig-r035-20230417   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
