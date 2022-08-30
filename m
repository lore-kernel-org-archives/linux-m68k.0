Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A779EECAAD2
	for <linux-m68k@archiver.kernel.org>; Tue, 30 Aug 2022 00:34:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229732AbiH3Ae5 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 29 Aug 2022 20:34:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229696AbiH3Ae4 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 29 Aug 2022 20:34:56 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3738915822
        for <linux-m68k@lists.linux-m68k.org>; Mon, 29 Aug 2022 17:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661819695; x=1693355695;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=l58fa/AL1u0iFOVfMukt+TdkuzKpzA4tIWwkaPwax+o=;
  b=aQbLyiqmJMCC/MFhsiCvYHXkaA6RIl65D8Qj3RS1IQDLUDAgmJonH3RU
   ivivbRhP/vVp84fXGNB9C0UHjp2D+oxDB0AjiTeaiZwpBO7uLM1E8jytX
   jrdXf6w3PF2kQN7RjUbywlnd+ov0mkOdh2ACNthpatsRSQamr+PUiVM7s
   eoR499Q5Wh8cp5yK5KQS0DPJU5yr/dszaSfgw4NmA+1H4GBRfZ8ui1Nup
   I6G0CyNP97zx2IB+8SmjDgrazpSS8evDtXuzPiFpLqqlywmB3zu3dJENx
   iSgea+JWYeiR0uSEYL8b913MVsTMoIFBSsz0xmq17sBQ/i8iTDzW5CJqo
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10454"; a="282012402"
X-IronPort-AV: E=Sophos;i="5.93,273,1654585200"; 
   d="scan'208";a="282012402"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2022 17:34:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,273,1654585200"; 
   d="scan'208";a="641147248"
Received: from lkp-server02.sh.intel.com (HELO e45bc14ccf4d) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 29 Aug 2022 17:34:53 -0700
Received: from kbuild by e45bc14ccf4d with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oSpDQ-0000Pn-1k;
        Tue, 30 Aug 2022 00:34:52 +0000
Date:   Tue, 30 Aug 2022 08:34:16 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:master] BUILD SUCCESS
 0da0978304a94b2d905f9e2e0ec3976b5f4bbc67
Message-ID: <630d5b08.1A1qjBmHOLXfWUYt%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git master
branch HEAD: 0da0978304a94b2d905f9e2e0ec3976b5f4bbc67  Merge tag 'v6.0-rc3'

elapsed time: 726m

configs tested: 47
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                              defconfig
x86_64                               rhel-8.3
i386                 randconfig-a001-20220829
x86_64                    rhel-8.3-kselftests
i386                 randconfig-a002-20220829
x86_64                           allyesconfig
i386                 randconfig-a004-20220829
i386                 randconfig-a005-20220829
x86_64                          rhel-8.3-func
arc                  randconfig-r043-20220829
x86_64               randconfig-a003-20220829
i386                 randconfig-a006-20220829
powerpc                           allnoconfig
i386                 randconfig-a003-20220829
powerpc                          allmodconfig
x86_64               randconfig-a002-20220829
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
m68k                             allmodconfig
x86_64               randconfig-a001-20220829
arc                              allyesconfig
x86_64                           rhel-8.3-syz
mips                             allyesconfig
sh                               allmodconfig
x86_64               randconfig-a004-20220829
alpha                            allyesconfig
m68k                             allyesconfig
x86_64               randconfig-a005-20220829
x86_64               randconfig-a006-20220829
i386                             allyesconfig
i386                                defconfig
arm                                 defconfig
ia64                             allmodconfig
arm                              allyesconfig
arm64                            allyesconfig

clang tested configs:
x86_64               randconfig-a011-20220829
x86_64               randconfig-a014-20220829
x86_64               randconfig-a012-20220829
x86_64               randconfig-a013-20220829
hexagon              randconfig-r041-20220829
x86_64               randconfig-a016-20220829
x86_64               randconfig-a015-20220829
s390                 randconfig-r044-20220829
hexagon              randconfig-r045-20220829
riscv                randconfig-r042-20220829

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
