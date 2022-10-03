Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69CBAC433FE
	for <linux-m68k@archiver.kernel.org>; Mon,  3 Oct 2022 23:47:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229461AbiJCXrM (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 3 Oct 2022 19:47:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229520AbiJCXrM (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 3 Oct 2022 19:47:12 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AC89476D5
        for <linux-m68k@lists.linux-m68k.org>; Mon,  3 Oct 2022 16:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1664840831; x=1696376831;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Vbhk3cgoVl/AfllyDnGAvHav0GwVN1W3/5wXNggUwpw=;
  b=QauzyrL+lC+Dyu/8uNUVYKhocVCPQ9mfpelZPOrBz87EXHrQcbiolTDP
   G7kJZMO1v4l4WnWfSSlpz41cXhr+M9vPdGZLynbGrWbvZNsGhQlQgn5xw
   s7bEEfTTT0GrKy7kuA6P4z12WiQT7hrLw8tjkuZnKTX+McgPQngNX4fV2
   FOY8DlL76FK1fDXQnQp1McJuJlmGb5Wv3ZtH17rqePa6rMWIh9wnQpx93
   2B8pNkjzXsbTlL/loJU66DMUYvZIVizC5l04SImyDruYhnQzMkWf5mq/R
   lYFRiWBVqQ7b1zxwPags0PN9wCFL8SZaiiXI/az7CcIgCjs1x5gxStd13
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10489"; a="285980055"
X-IronPort-AV: E=Sophos;i="5.93,366,1654585200"; 
   d="scan'208";a="285980055"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2022 16:47:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10489"; a="601429132"
X-IronPort-AV: E=Sophos;i="5.93,366,1654585200"; 
   d="scan'208";a="601429132"
Received: from lkp-server01.sh.intel.com (HELO 14cc182da2d0) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 03 Oct 2022 16:47:07 -0700
Received: from kbuild by 14cc182da2d0 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1ofV9O-00053D-1f;
        Mon, 03 Oct 2022 23:47:06 +0000
Date:   Tue, 04 Oct 2022 07:46:49 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:m68k-v6.0] BUILD SUCCESS
 b4619cc166e1e974f99fe8e90d2057beeee3d463
Message-ID: <633b7469.Of0LSdUOsJc/4h0V%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git m68k-v6.0
branch HEAD: b4619cc166e1e974f99fe8e90d2057beeee3d463  m68k: defconfig: Enable Atari EtherNAT and NetUSBee USB support

elapsed time: 720m

configs tested: 89
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arc                                 defconfig
alpha                               defconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                              defconfig
s390                                defconfig
x86_64                               rhel-8.3
x86_64                           rhel-8.3-syz
x86_64                          rhel-8.3-func
s390                             allmodconfig
x86_64                           rhel-8.3-kvm
x86_64                    rhel-8.3-kselftests
x86_64                           allyesconfig
x86_64                         rhel-8.3-kunit
arc                              allyesconfig
alpha                            allyesconfig
m68k                             allyesconfig
arm                                 defconfig
m68k                             allmodconfig
i386                 randconfig-a014-20221003
i386                                defconfig
x86_64               randconfig-a011-20221003
i386                 randconfig-a011-20221003
x86_64               randconfig-a015-20221003
i386                 randconfig-a012-20221003
s390                             allyesconfig
x86_64               randconfig-a014-20221003
i386                 randconfig-a013-20221003
x86_64               randconfig-a012-20221003
x86_64               randconfig-a013-20221003
x86_64               randconfig-a016-20221003
i386                 randconfig-a015-20221003
i386                 randconfig-a016-20221003
powerpc                           allnoconfig
arm                              allyesconfig
powerpc                          allmodconfig
arm64                            allyesconfig
mips                             allyesconfig
riscv                randconfig-r042-20221003
sh                               allmodconfig
arc                  randconfig-r043-20221003
i386                             allyesconfig
arc                  randconfig-r043-20221002
s390                 randconfig-r044-20221003
ia64                             allmodconfig
csky                              allnoconfig
alpha                             allnoconfig
arc                               allnoconfig
riscv                             allnoconfig
sh                           se7724_defconfig
powerpc                         ps3_defconfig
powerpc                     tqm8548_defconfig
powerpc                     redwood_defconfig
m68k                       bvme6000_defconfig
arc                    vdk_hs38_smp_defconfig
arm                             ezx_defconfig
i386                          randconfig-c001
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
arm                  randconfig-c002-20221002
x86_64                        randconfig-c001
m68k                          sun3x_defconfig

clang tested configs:
hexagon              randconfig-r041-20221003
riscv                randconfig-r042-20221002
hexagon              randconfig-r041-20221002
i386                 randconfig-a003-20221003
i386                 randconfig-a002-20221003
x86_64               randconfig-a002-20221003
hexagon              randconfig-r045-20221002
i386                 randconfig-a001-20221003
x86_64               randconfig-a001-20221003
hexagon              randconfig-r045-20221003
x86_64               randconfig-a004-20221003
i386                 randconfig-a006-20221003
x86_64               randconfig-a006-20221003
i386                 randconfig-a004-20221003
x86_64               randconfig-a003-20221003
i386                 randconfig-a005-20221003
x86_64               randconfig-a005-20221003
s390                 randconfig-r044-20221002
x86_64                        randconfig-k001
mips                        bcm63xx_defconfig
mips                          ath79_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
