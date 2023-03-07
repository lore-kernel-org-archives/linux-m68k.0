Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D14A9C64EC4
	for <linux-m68k@archiver.kernel.org>; Tue,  7 Mar 2023 02:15:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229669AbjCGCPE (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 6 Mar 2023 21:15:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229576AbjCGCPC (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 6 Mar 2023 21:15:02 -0500
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4177737F11
        for <linux-m68k@lists.linux-m68k.org>; Mon,  6 Mar 2023 18:15:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678155300; x=1709691300;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=056uSqQLVHIutu7E1HhDkjWJEuhTSSgYf7dXecV7n1E=;
  b=Q3ndGyJj+oJDElHb2HzBPydNgVio3jizF7ZWyyYhf/Z6v+ZxZPNEA5je
   B3fk3oRKHtb9QPKn2gM4q9KkRKmxte9kDX1UbVBUGDGshNItmi42A4Xdh
   vV9qyD5y/eItnEts6FdXU5oB1entNxHnXlQGkxhZz6IYdnw1FHfukutqs
   /tatMxrYxEUgfWjcNdkRVWtb5PYMsbCXtBdr1gVJ1SopsQVEZmfqWdoS5
   xODpkzhvH4pObfDqFkcH2QzTdTpZoTDcAUVz3iz+Jn1bI3Bkg83YeN6Eu
   wya9j7MdjiVVXNy+X7TXCkNMvEQAaA5V49dHdpRinl5HJmt7mVDYyZ/Ua
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="315394446"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; 
   d="scan'208";a="315394446"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2023 18:11:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="706648283"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; 
   d="scan'208";a="706648283"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 06 Mar 2023 18:11:46 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pZMnq-0000rk-0R;
        Tue, 07 Mar 2023 02:11:46 +0000
Date:   Tue, 07 Mar 2023 10:11:12 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:master] BUILD SUCCESS
 513138a14063760ef611f18ba76c5c7915ff8cdd
Message-ID: <64069d40.n1qE9PxP9E05T7mZ%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git master
branch HEAD: 513138a14063760ef611f18ba76c5c7915ff8cdd  m68k: Only force 030 bus error if PC not in exception table

elapsed time: 720m

configs tested: 92
configs skipped: 8

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r001-20230305   gcc  
alpha                randconfig-r035-20230306   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r032-20230306   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                         at91_dt_defconfig   gcc  
arm                                 defconfig   gcc  
arm                          ixp4xx_defconfig   clang
arm                  randconfig-r003-20230306   clang
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r002-20230305   gcc  
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-a001-20230306   gcc  
i386                 randconfig-a002-20230306   gcc  
i386                 randconfig-a003-20230306   gcc  
i386                 randconfig-a004-20230306   gcc  
i386                 randconfig-a005-20230306   gcc  
i386                 randconfig-a006-20230306   gcc  
i386                 randconfig-r001-20230306   gcc  
i386                 randconfig-r002-20230306   gcc  
i386                 randconfig-r034-20230306   gcc  
ia64                             allmodconfig   gcc  
ia64                                defconfig   gcc  
ia64                 randconfig-r021-20230305   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r003-20230305   gcc  
loongarch            randconfig-r004-20230306   gcc  
loongarch            randconfig-r033-20230305   gcc  
loongarch            randconfig-r034-20230305   gcc  
m68k                             allmodconfig   gcc  
m68k                                defconfig   gcc  
m68k                       m5208evb_defconfig   gcc  
m68k                 randconfig-r032-20230305   gcc  
m68k                 randconfig-r036-20230306   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                 randconfig-r024-20230305   clang
nios2                               defconfig   gcc  
nios2                randconfig-r031-20230306   gcc  
openrisc             randconfig-r005-20230306   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc              randconfig-r025-20230305   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r023-20230305   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
sh                               allmodconfig   gcc  
sh                             espt_defconfig   gcc  
sh                          r7785rp_defconfig   gcc  
sh                   randconfig-r005-20230305   gcc  
sh                   randconfig-r022-20230305   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r004-20230305   gcc  
sparc64              randconfig-r006-20230306   gcc  
sparc64              randconfig-r026-20230305   gcc  
sparc64              randconfig-r036-20230305   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230306   gcc  
x86_64               randconfig-a002-20230306   gcc  
x86_64               randconfig-a003-20230306   gcc  
x86_64               randconfig-a004-20230306   gcc  
x86_64               randconfig-a005-20230306   gcc  
x86_64               randconfig-a006-20230306   gcc  
x86_64               randconfig-a011-20230306   clang
x86_64               randconfig-a012-20230306   clang
x86_64               randconfig-a013-20230306   clang
x86_64               randconfig-a014-20230306   clang
x86_64               randconfig-a015-20230306   clang
x86_64               randconfig-a016-20230306   clang
x86_64                               rhel-8.3   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
