Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E425AC433F5
	for <linux-m68k@archiver.kernel.org>; Mon, 10 Jan 2022 22:10:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241871AbiAJWKQ (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 10 Jan 2022 17:10:16 -0500
Received: from mga11.intel.com ([192.55.52.93]:59378 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240848AbiAJWKQ (ORCPT <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 10 Jan 2022 17:10:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1641852616; x=1673388616;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=2eAK/1B7k7dnl2twn9LWseTxqNeMCn21Mp+Bg0Zo5M8=;
  b=kGelCub6a9e8b/MLFxtZo8PHXer6lhz+lwFE25xa9H7v72R6UvgcFmTY
   kUPT6vNY0vHcWBM/PdYrLYSXls/ShIL0soVAOJHaouqUyNQHBVIoQ6YyA
   rjxMnX43RFNdKl6MV/foHsqwCNYLmw7/u9fmUfpLn9DtBzmRQhXMfEcWk
   d855I1A32anrrUXRmu0tXLHbB3STUgNHeTSad3TREV7D38XqOsAqpI7Ls
   gGExNN2wjTkra/XvVBIFBFyqAHHrpkkGe4q2wd/WowTtW/fE0I4bC9UIm
   8rG3S2FloGpnkgDUDyLKRx4zPP7lwhDYuM3SwazA3bu0abr6Q2xsOYy6E
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10223"; a="240888896"
X-IronPort-AV: E=Sophos;i="5.88,278,1635231600"; 
   d="scan'208";a="240888896"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2022 14:10:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,278,1635231600"; 
   d="scan'208";a="690739611"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 10 Jan 2022 14:10:13 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1n72rl-00040R-8O; Mon, 10 Jan 2022 22:10:13 +0000
Date:   Tue, 11 Jan 2022 06:09:33 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:m68k-v5.16] BUILD SUCCESS
 61b439794190c9eb1746c08e8271692cad2b33e1
Message-ID: <61dcae9d./6HIctuhQ/AY5e1w%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git m68k-v5.16
branch HEAD: 61b439794190c9eb1746c08e8271692cad2b33e1  m68k: defconfig: Enable Atari EtherNAT and NetUSBee USB support

elapsed time: 746m

configs tested: 54
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
