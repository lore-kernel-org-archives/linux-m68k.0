Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6835C433EF
	for <linux-m68k@archiver.kernel.org>; Tue,  8 Mar 2022 06:59:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344328AbiCHHAN (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 8 Mar 2022 02:00:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230005AbiCHHAN (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 8 Mar 2022 02:00:13 -0500
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 795A13D485
        for <linux-m68k@lists.linux-m68k.org>; Mon,  7 Mar 2022 22:59:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646722757; x=1678258757;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=3r9Q4MTP0fZhfe8+z8yP9fXmyyh4M+9d2NSqShnQczQ=;
  b=g9yEwSDIE5Tq4WOgJs0q4H4+5iv1L5Hsvxa7u2APSB35R8+Gu7lnuU7m
   2A8WAxDnBo9g3VP7RKZj4se87jyDdO4RcIcOfp/NiyVdkm8NgXSSqL1qO
   pkuO4PA01RFChD4O2WL3+ilBVbYdAbVnvImrGFiF3qmsDujatx/L4kjKn
   zORHGmjMUSQvjqjSwIhf+19aQDsAOqKp/BTB5uANGYMt9nFGy2jqnOPry
   w7qPMOdlirnvoszc6T61oZyOIa7rTH1+KwRZBk0PI2+0kugKcXaeTFyAT
   QkdyKAluiLJf/EKVxCZWU90jqYZTFyiNLX9Bz5mUHFY4quwf9iloT4olf
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10279"; a="242047199"
X-IronPort-AV: E=Sophos;i="5.90,163,1643702400"; 
   d="scan'208";a="242047199"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2022 22:59:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,163,1643702400"; 
   d="scan'208";a="711432374"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 07 Mar 2022 22:59:15 -0800
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nRToQ-00014F-Nf; Tue, 08 Mar 2022 06:59:14 +0000
Date:   Tue, 08 Mar 2022 14:58:47 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:master] BUILD SUCCESS
 46c5118e55c98936e6a433c7b1554dfc36b7cad1
Message-ID: <6226fea7.mpt/QIcuFzP76WDM%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git master
branch HEAD: 46c5118e55c98936e6a433c7b1554dfc36b7cad1  Merge tag 'v5.17-rc7'

elapsed time: 995m

configs tested: 74
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm                              allmodconfig
arm                              allyesconfig
arm64                            allyesconfig
arm64                               defconfig
sh                          landisk_defconfig
sh                          urquell_defconfig
mips                           ip32_defconfig
mips                      fuloong2e_defconfig
m68k                          atari_defconfig
mips                    maltaup_xpa_defconfig
openrisc                 simple_smp_defconfig
sh                        edosk7705_defconfig
powerpc                 mpc834x_itx_defconfig
m68k                       m5249evb_defconfig
arm                            hisi_defconfig
riscv                               defconfig
arm                  randconfig-c002-20220308
arm                  randconfig-c002-20220307
ia64                                defconfig
ia64                             allmodconfig
ia64                             allyesconfig
m68k                                defconfig
m68k                             allyesconfig
m68k                             allmodconfig
nds32                             allnoconfig
nios2                               defconfig
arc                              allyesconfig
csky                                defconfig
alpha                               defconfig
nds32                               defconfig
alpha                            allyesconfig
nios2                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
h8300                            allyesconfig
xtensa                           allyesconfig
parisc                              defconfig
s390                                defconfig
parisc64                            defconfig
s390                             allmodconfig
s390                             allyesconfig
parisc                           allyesconfig
i386                             allyesconfig
i386                              debian-10.3
i386                   debian-10.3-kselftests
i386                                defconfig
sparc                            allyesconfig
sparc                               defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                             allnoconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
riscv                    nommu_virt_defconfig
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                                  kexec
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                    rhel-8.3-kselftests

clang tested configs:
x86_64                        randconfig-c007
riscv                randconfig-c006-20220308
powerpc              randconfig-c003-20220308
i386                          randconfig-c001
arm                  randconfig-c002-20220308
mips                 randconfig-c004-20220308

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
