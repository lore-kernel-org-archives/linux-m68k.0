Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F165C433FE
	for <linux-m68k@archiver.kernel.org>; Tue, 22 Feb 2022 00:06:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237361AbiBVAHN (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 21 Feb 2022 19:07:13 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:56830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237352AbiBVAHM (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 21 Feb 2022 19:07:12 -0500
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 336E3245BC
        for <linux-m68k@lists.linux-m68k.org>; Mon, 21 Feb 2022 16:06:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645488408; x=1677024408;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=a7r4Z4yeDLW3my2dQtgYCiZOl94ATemEsHT6O1whbZc=;
  b=K+B1wUoCjxiwzpDRfXeQOCEsHqrbsG1tyk4bOJutt6SRc8hPrqKMarHQ
   GpB8atKUZxCMSu0gF/nKqqg8HSykoUxJ8McBNYvHmkWmFCJ+A4RAYs2o0
   I9EU5AJSg2hO+nXI3WP1T9U7uaQEwzFhhUK18VxNZqllEfA7kFNlJi0XA
   TTvP9wKdiWrK7eQfJouSlFmbCDHcB3IOXaVO6G/68sX2Ljhi8Aoa+F+al
   WWNJKK/A+1BOnfobF6h2jnNrcIhl/CR0OTLqjqoc8+M0WCIn2Qr00fJi4
   6N5YH81wP3h09XivlEAlgMYe4w73VRiOXb+2reuEBNRCI9YKToyQRCX6f
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10265"; a="251533974"
X-IronPort-AV: E=Sophos;i="5.88,386,1635231600"; 
   d="scan'208";a="251533974"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2022 16:06:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,386,1635231600"; 
   d="scan'208";a="507779676"
Received: from lkp-server01.sh.intel.com (HELO da3212ac2f54) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 21 Feb 2022 16:06:46 -0800
Received: from kbuild by da3212ac2f54 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nMIhZ-00027Z-PH; Tue, 22 Feb 2022 00:06:45 +0000
Date:   Tue, 22 Feb 2022 08:05:49 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:master] BUILD SUCCESS
 7775e06b6677688f74efe8a5d1b7e05576260fcf
Message-ID: <621428dd.8n7mIF3cUcWu5Gsp%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git master
branch HEAD: 7775e06b6677688f74efe8a5d1b7e05576260fcf  Merge tag 'v5.17-rc5'

elapsed time: 725m

configs tested: 123
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                               defconfig
arm                              allmodconfig
arm                              allyesconfig
arm64                            allyesconfig
i386                 randconfig-c001-20220221
arm                            lart_defconfig
arm                            zeus_defconfig
arm                        keystone_defconfig
parisc                generic-64bit_defconfig
alpha                            alldefconfig
sh                           se7724_defconfig
arc                 nsimosci_hs_smp_defconfig
mips                 decstation_r4k_defconfig
sh                     magicpanelr2_defconfig
powerpc                      mgcoge_defconfig
sh                           se7780_defconfig
sh                               allmodconfig
powerpc                  storcenter_defconfig
mips                         tb0226_defconfig
mips                           ip32_defconfig
sh                            hp6xx_defconfig
sh                           se7721_defconfig
arc                          axs101_defconfig
ia64                          tiger_defconfig
powerpc                        warp_defconfig
sh                            migor_defconfig
sh                        edosk7760_defconfig
sh                 kfr2r09-romimage_defconfig
powerpc                         ps3_defconfig
mips                        jmr3927_defconfig
sh                           sh2007_defconfig
arm                  randconfig-c002-20220221
ia64                                defconfig
ia64                             allmodconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
csky                                defconfig
alpha                               defconfig
nds32                               defconfig
nios2                            allyesconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
parisc                              defconfig
parisc64                            defconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
s390                             allyesconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
powerpc                          allyesconfig
x86_64               randconfig-a003-20220221
x86_64               randconfig-a002-20220221
x86_64               randconfig-a005-20220221
x86_64               randconfig-a006-20220221
x86_64               randconfig-a001-20220221
x86_64               randconfig-a004-20220221
i386                 randconfig-a002-20220221
i386                 randconfig-a001-20220221
i386                 randconfig-a005-20220221
i386                 randconfig-a003-20220221
i386                 randconfig-a006-20220221
i386                 randconfig-a004-20220221
arc                  randconfig-r043-20220221
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec

clang tested configs:
mips                 randconfig-c004-20220221
x86_64               randconfig-c007-20220221
powerpc              randconfig-c003-20220221
i386                 randconfig-c001-20220221
arm                  randconfig-c002-20220221
s390                 randconfig-c005-20220221
riscv                randconfig-c006-20220221
mips                      malta_kvm_defconfig
powerpc                 mpc8272_ads_defconfig
arm                        vexpress_defconfig
arm                          collie_defconfig
arm                          pcm027_defconfig
arm                         lpc32xx_defconfig
powerpc                      katmai_defconfig
x86_64               randconfig-a011-20220221
x86_64               randconfig-a015-20220221
x86_64               randconfig-a014-20220221
x86_64               randconfig-a016-20220221
x86_64               randconfig-a013-20220221
x86_64               randconfig-a012-20220221
i386                 randconfig-a016-20220221
i386                 randconfig-a012-20220221
i386                 randconfig-a015-20220221
i386                 randconfig-a011-20220221
i386                 randconfig-a014-20220221
i386                 randconfig-a013-20220221
hexagon              randconfig-r045-20220221
hexagon              randconfig-r041-20220221
riscv                randconfig-r042-20220221
s390                 randconfig-r044-20220221

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
