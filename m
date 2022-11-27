Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11E54C43217
	for <linux-m68k@archiver.kernel.org>; Sun, 27 Nov 2022 07:37:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229526AbiK0Hh1 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 27 Nov 2022 02:37:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229506AbiK0Hh0 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sun, 27 Nov 2022 02:37:26 -0500
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37F7E30C
        for <linux-m68k@lists.linux-m68k.org>; Sat, 26 Nov 2022 23:37:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669534646; x=1701070646;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=SX4HBY1FLhAqOOCxOZNR8a5Ich+lmiurYqvdq7Xo260=;
  b=EKle+hyi85Ct23wq0xk014ibqqdrMyCA+kLX+1gDIw27F5pW+9MB1DH7
   xlP0aqUeztQU9lweIM417oeQf/AeWdQXjwrZFrEg3hK2y93qvlvbSKlp8
   vhzw8tc9N7uSUvG8FB9ydeGFe1E6UjLGwNv885W9eHHTl3N6fRLWVTJ8F
   /SK3iJ50z28Gb37x+qdY68i3ekQf9yciXf6DGg9ISU7GaA9obGJKbV+Zg
   s6sTe3LH6o6f4lfoR6+oL++ABrL3aixhoYdEMsHG+NGQWrS5IfEFQQUor
   ENIwAhIEjlLClS0OfUEBPCcz6tta9ZjfypGcvw3RF0YncTz0hsLYq4UR7
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10543"; a="313348166"
X-IronPort-AV: E=Sophos;i="5.96,197,1665471600"; 
   d="scan'208";a="313348166"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2022 23:37:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10543"; a="749004071"
X-IronPort-AV: E=Sophos;i="5.96,197,1665471600"; 
   d="scan'208";a="749004071"
Received: from lkp-server01.sh.intel.com (HELO 64a2d449c951) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 26 Nov 2022 23:37:24 -0800
Received: from kbuild by 64a2d449c951 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1ozCE7-0006rJ-1N;
        Sun, 27 Nov 2022 07:37:23 +0000
Date:   Sun, 27 Nov 2022 15:36:54 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:atari-drm-wip-v1] BUILD SUCCESS WITH WARNING
 9ef3ed30a45a367db0231ea2e98f6f37ba860b4c
Message-ID: <63831396.w95Nj2lMfGMa5occ%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git atari-drm-wip-v1
branch HEAD: 9ef3ed30a45a367db0231ea2e98f6f37ba860b4c  drm: atari: Add a DRM driver for Atari graphics hardware

Warning reports:

https://lore.kernel.org/oe-kbuild-all/202211260930.QVRaOHsO-lkp@intel.com

Warning: (recently discovered and may have been fixed)

drivers/gpu/drm/tiny/atari_drm.c:2176:31: warning: variable 'tmp' set but not used [-Wunused-but-set-variable]

Warning ids grouped by kconfigs:

gcc_recent_errors
`-- m68k-allmodconfig
    `-- drivers-gpu-drm-tiny-atari_drm.c:warning:variable-tmp-set-but-not-used

elapsed time: 2102m

configs tested: 58
configs skipped: 2

gcc tested configs:
arc                  randconfig-r043-20221124
arc                                 defconfig
s390                             allmodconfig
um                             i386_defconfig
alpha                               defconfig
um                           x86_64_defconfig
s390                                defconfig
s390                             allyesconfig
powerpc                           allnoconfig
sh                               allmodconfig
mips                             allyesconfig
powerpc                          allmodconfig
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
ia64                             allmodconfig
x86_64                    rhel-8.3-kselftests
x86_64                          rhel-8.3-func
m68k                             allmodconfig
alpha                            allyesconfig
arc                              allyesconfig
m68k                             allyesconfig
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a015
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                           allyesconfig
x86_64                        randconfig-a002
x86_64                        randconfig-a004
x86_64                        randconfig-a006
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
i386                                defconfig
i386                             allyesconfig
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
arm                                 defconfig
arm                              allyesconfig
arm64                            allyesconfig

clang tested configs:
riscv                randconfig-r042-20221124
hexagon              randconfig-r041-20221124
hexagon              randconfig-r045-20221124
s390                 randconfig-r044-20221124
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a006
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
