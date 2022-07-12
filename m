Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8319FC43334
	for <linux-m68k@archiver.kernel.org>; Tue, 12 Jul 2022 03:11:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229500AbiGLDLG (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 11 Jul 2022 23:11:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231145AbiGLDK6 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 11 Jul 2022 23:10:58 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2633A509CB
        for <linux-m68k@lists.linux-m68k.org>; Mon, 11 Jul 2022 20:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657595456; x=1689131456;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=PKVtfxbwAwZfziXJMhcKwVzO5nsOTjsg9wU3l40j8nk=;
  b=DtEluh/3Q2msKXkxXKLHc/G3g5S8o4AzshOsiERTsWKrhN8qEthEPYPA
   G2/7ROamWDjKqzHBKGwP1bAXRv7CqRVl63bz7Q3qcJtv0hd/x67UhfUSo
   czGUIw+jf1jfAXhQ8N2u0s2PKwPvGgGhbA5IE+1Ip/Cm4ZLVJ3mhH3iMF
   +hRboRB8NpD7Rl+mJfB00nnA0OITrtkHyAGO4RJ3/EPOPHIHxlddmYQi/
   B2X7C2xxbLqHIa/yXBMo2DWeVL7o+apnFlx29l11UDdnT3GglSpYEXMFD
   a9NW7svAiLnLLEPlXp/rBozyAxH0klvxDCZSSQPr3zutAM+twWzLuPU+0
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10405"; a="284851321"
X-IronPort-AV: E=Sophos;i="5.92,264,1650956400"; 
   d="scan'208";a="284851321"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2022 20:10:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,264,1650956400"; 
   d="scan'208";a="922033597"
Received: from lkp-server02.sh.intel.com (HELO 8708c84be1ad) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 11 Jul 2022 20:10:54 -0700
Received: from kbuild by 8708c84be1ad with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1oB6IX-0001bL-KQ;
        Tue, 12 Jul 2022 03:10:53 +0000
Date:   Tue, 12 Jul 2022 11:09:55 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:master] BUILD SUCCESS
 c74f6f033e9b10e89a71b4923b737412226cd24d
Message-ID: <62cce603.85SCrqZg9m9FNmpL%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git master
branch HEAD: c74f6f033e9b10e89a71b4923b737412226cd24d  m68k: Add common forward declaration for show_registers()

elapsed time: 723m

configs tested: 52
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm                              allyesconfig
arm64                            allyesconfig
ia64                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
m68k                             allmodconfig
m68k                             allyesconfig
mips                             allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
sh                               allmodconfig
i386                                defconfig
i386                             allyesconfig
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a015
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
x86_64                        randconfig-a002
x86_64                        randconfig-a004
x86_64                        randconfig-a006
arc                  randconfig-r043-20220710
s390                 randconfig-r044-20220710
riscv                randconfig-r042-20220710
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                    rhel-8.3-kselftests
x86_64                           rhel-8.3-syz
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                           allyesconfig

clang tested configs:
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a006
x86_64                        randconfig-a014
x86_64                        randconfig-a016
x86_64                        randconfig-a012
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
hexagon              randconfig-r041-20220710
hexagon              randconfig-r045-20220710

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
