Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C038BC43334
	for <linux-m68k@archiver.kernel.org>; Sat,  9 Jul 2022 06:33:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229557AbiGIGdc (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sat, 9 Jul 2022 02:33:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229479AbiGIGdb (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sat, 9 Jul 2022 02:33:31 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71DDD1A4
        for <linux-m68k@lists.linux-m68k.org>; Fri,  8 Jul 2022 23:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657348408; x=1688884408;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=SmyxqKKgcAA6qnZ8obvdXZ4h5kWOOr8waj0l7lMpplU=;
  b=BOfESeAIkZasCE6sPIqcpKdkfdjIAytjvLQ/OKWwPWMcFbGMtg8x/tmu
   mioy4sxk6SoOCI2B2/67EV/H5OxICYc9Gpa0AUEqRjwGPEO32IaGWAtUL
   oBFciIeD9jpO1JQ+d3yuBGLGawvUpdfKtwIasgc+qA8SE4gIWK0iaKAJe
   3I5j/rAc5tE0owpjcpy6y8F7be8heO5MlwRz6R16P5laQDyUIOTsDUuW0
   61P+DXyxnwuk15feNxq3HQOCAucrWB7JOjAWx/35hPwHECcWla/G2G3n/
   YICXatPECyeMh6OSQywD7tKW7sc+aDe6m+wvJGdntGxe/31Bsa9PGsrGR
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10402"; a="264191210"
X-IronPort-AV: E=Sophos;i="5.92,256,1650956400"; 
   d="scan'208";a="264191210"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2022 23:33:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,256,1650956400"; 
   d="scan'208";a="736567417"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 08 Jul 2022 23:33:26 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1oA41u-000OOY-4Z;
        Sat, 09 Jul 2022 06:33:26 +0000
Date:   Sat, 09 Jul 2022 14:32:40 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:atari-drm-wip] BUILD SUCCESS WITH WARNING
 149db8fecb508c948620b3cb7a0737ebf226f862
Message-ID: <62c92108.da8Xf7yau5vqF7CL%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git atari-drm-wip
branch HEAD: 149db8fecb508c948620b3cb7a0737ebf226f862  drm: atari: Add a DRM driver for Atari graphics hardware

Warning reports:

https://lore.kernel.org/lkml/202207090456.TkBv7Mpl-lkp@intel.com

Warning: (recently discovered and may have been fixed)

drivers/gpu/drm/tiny/atari_drm.c:1024:29: warning: variable 'linesize' set but not used [-Wunused-but-set-variable]
drivers/gpu/drm/tiny/atari_drm.c:2177:31: warning: variable 'tmp' set but not used [-Wunused-but-set-variable]

Warning ids grouped by kconfigs:

gcc_recent_errors
`-- m68k-allmodconfig
    |-- drivers-gpu-drm-tiny-atari_drm.c:warning:variable-linesize-set-but-not-used
    `-- drivers-gpu-drm-tiny-atari_drm.c:warning:variable-tmp-set-but-not-used

elapsed time: 723m

configs tested: 52
configs skipped: 2

gcc tested configs:
arm                                 defconfig
arm                              allyesconfig
arm64                            allyesconfig
ia64                             allmodconfig
powerpc                           allnoconfig
mips                             allyesconfig
powerpc                          allmodconfig
sh                               allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
m68k                             allmodconfig
m68k                             allyesconfig
i386                                defconfig
i386                             allyesconfig
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                        randconfig-a006
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a015
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a016
arc                  randconfig-r043-20220707
s390                 randconfig-r044-20220707
riscv                randconfig-r042-20220707
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
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a006
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
x86_64                        randconfig-a012
x86_64                        randconfig-a016
x86_64                        randconfig-a014
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
hexagon              randconfig-r041-20220707
hexagon              randconfig-r045-20220707

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
