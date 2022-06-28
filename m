Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A942DC433EF
	for <linux-m68k@archiver.kernel.org>; Tue, 28 Jun 2022 00:23:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242630AbiF1AXP (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 27 Jun 2022 20:23:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242603AbiF1AXN (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 27 Jun 2022 20:23:13 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 080E8FE9
        for <linux-m68k@lists.linux-m68k.org>; Mon, 27 Jun 2022 17:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1656375792; x=1687911792;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=PUQegaKrUqgCx1iuaSmLTve3po1TilCdytawDityQho=;
  b=iHMYXPXmAnDHseGM5TkR7mPWdS2y9sY+AZKDHqU7zj5c4lr47sUjK7wz
   x9tifLeF63/q9bNxWDzRji8uXHkvy6fq3PrYtWmqhgwwE5d7R3rqdkYiz
   oU0vJXTSxUPxu7M0QVxCEJjhoPOaBuPhrOacQmGLkFFIywyWI+I1WR4LB
   h4jj5okHReBHuOdD6p6OFq9Z6mjgHQGb72dqk5ArgbYxSY6Qo9gLJagDn
   xZb4dZ1vA5H3lzoqRF7dXrKPtkdJ5Y4WMYLNhKD0BUFE9j5AEhehY+Ovt
   G/HTltY6KKk9Bda9AWJmoxZt7NkSff2PD7pa1OippbaEHa2kUxsBx87iI
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10391"; a="280355076"
X-IronPort-AV: E=Sophos;i="5.92,227,1650956400"; 
   d="scan'208";a="280355076"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2022 17:23:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,227,1650956400"; 
   d="scan'208";a="836430398"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 27 Jun 2022 17:23:10 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1o5z0X-0009Go-VO;
        Tue, 28 Jun 2022 00:23:09 +0000
Date:   Tue, 28 Jun 2022 08:22:31 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:master] BUILD SUCCESS
 a830f02404586b01d275f62e128c57fe15a2b7e1
Message-ID: <62ba49c7.E9NxgNBeEoOEUKyU%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git master
branch HEAD: a830f02404586b01d275f62e128c57fe15a2b7e1  Merge tag 'v5.19-rc4'

elapsed time: 722m

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
x86_64               randconfig-a012-20220627
x86_64               randconfig-a011-20220627
x86_64               randconfig-a013-20220627
x86_64               randconfig-a014-20220627
x86_64               randconfig-a015-20220627
x86_64               randconfig-a016-20220627
i386                 randconfig-a014-20220627
i386                 randconfig-a012-20220627
i386                 randconfig-a015-20220627
i386                 randconfig-a011-20220627
i386                 randconfig-a016-20220627
i386                 randconfig-a013-20220627
arc                  randconfig-r043-20220627
s390                 randconfig-r044-20220627
riscv                randconfig-r042-20220627
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
x86_64               randconfig-a002-20220627
x86_64               randconfig-a003-20220627
x86_64               randconfig-a001-20220627
x86_64               randconfig-a005-20220627
x86_64               randconfig-a006-20220627
x86_64               randconfig-a004-20220627
i386                 randconfig-a002-20220627
i386                 randconfig-a004-20220627
i386                 randconfig-a003-20220627
i386                 randconfig-a001-20220627
i386                 randconfig-a005-20220627
i386                 randconfig-a006-20220627
hexagon              randconfig-r041-20220627
hexagon              randconfig-r045-20220627

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
