Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8F5DC28D13
	for <linux-m68k@archiver.kernel.org>; Mon, 22 Aug 2022 22:13:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238410AbiHVWNR (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 22 Aug 2022 18:13:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238395AbiHVWNQ (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 22 Aug 2022 18:13:16 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD4E4B52
        for <linux-m68k@lists.linux-m68k.org>; Mon, 22 Aug 2022 15:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661206393; x=1692742393;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=pSkOWEc97UMFMD+zxDZERI6SIwESMPdX1lg/bUkni04=;
  b=HwexqOyfG/LzyMmfnHrn3aoUyc2JPnmiSge+MIr/HAe6wLZ3GG5SauTo
   awNHdmpfurfdMNBJ+4iJyD4XFYgSlEnPBIpwm+N4IQCyCMMrKbmxzTyKI
   s0mAXZ+PVO+WzLMctq9brU4oIFFQhD50a1mO+rl5qx3ltw2gghI9JB7BP
   bGakeX59vkMoKAwrwHV8ynDIpnSF2QGWdtDcjKHdZDjM+9xWxUPlVehts
   1JzK2Gr1W1+PEmYcikJ+eU94UuNhdTvplPGSBk9jwzLUUQ5We3BsFHFg1
   YIqZkhnAYtSUyFmFPbSKGOAYYuCIIkC3yzzk3gdoA6kzENB/NcwaP46TK
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10447"; a="379823365"
X-IronPort-AV: E=Sophos;i="5.93,255,1654585200"; 
   d="scan'208";a="379823365"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2022 15:13:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,255,1654585200"; 
   d="scan'208";a="751449359"
Received: from lkp-server01.sh.intel.com (HELO dd9b29378baa) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 22 Aug 2022 15:13:11 -0700
Received: from kbuild by dd9b29378baa with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oQFfT-0000n5-0u;
        Mon, 22 Aug 2022 22:13:11 +0000
Date:   Tue, 23 Aug 2022 06:12:34 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:master] BUILD SUCCESS
 904b9f3d66f96d7d629d2e6ce728cf85ec2613ca
Message-ID: <6303ff52.Q8BkpR7zJH8Ci0c3%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git master
branch HEAD: 904b9f3d66f96d7d629d2e6ce728cf85ec2613ca  Merge tag 'v6.0-rc2'

elapsed time: 727m

configs tested: 62
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
i386                 randconfig-a015-20220822
i386                 randconfig-a014-20220822
i386                 randconfig-a013-20220822
i386                 randconfig-a011-20220822
i386                 randconfig-a012-20220822
x86_64                    rhel-8.3-kselftests
x86_64                          rhel-8.3-func
i386                 randconfig-a016-20220822
x86_64                         rhel-8.3-kunit
alpha                            allyesconfig
arc                              allyesconfig
m68k                             allyesconfig
x86_64                              defconfig
i386                                defconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
mips                             allyesconfig
x86_64                               rhel-8.3
m68k                             allmodconfig
arm                                 defconfig
x86_64                           allyesconfig
x86_64                           rhel-8.3-syz
arc                               allnoconfig
alpha                             allnoconfig
riscv                             allnoconfig
csky                              allnoconfig
x86_64                           rhel-8.3-kvm
sh                               allmodconfig
i386                             allyesconfig
arm64                            allyesconfig
arm                              allyesconfig
x86_64               randconfig-a014-20220822
x86_64               randconfig-a012-20220822
x86_64               randconfig-a013-20220822
x86_64               randconfig-a011-20220822
x86_64               randconfig-a016-20220822
x86_64               randconfig-a015-20220822
arc                  randconfig-r043-20220821
arc                  randconfig-r043-20220822
riscv                randconfig-r042-20220822
s390                 randconfig-r044-20220822
ia64                             allmodconfig

clang tested configs:
i386                 randconfig-a001-20220822
i386                 randconfig-a002-20220822
x86_64               randconfig-a002-20220822
x86_64               randconfig-a003-20220822
i386                 randconfig-a003-20220822
x86_64               randconfig-a001-20220822
i386                 randconfig-a004-20220822
x86_64               randconfig-a004-20220822
i386                 randconfig-a006-20220822
x86_64               randconfig-a005-20220822
i386                 randconfig-a005-20220822
x86_64               randconfig-a006-20220822
hexagon              randconfig-r041-20220822
hexagon              randconfig-r045-20220822
riscv                randconfig-r042-20220821
hexagon              randconfig-r045-20220821
hexagon              randconfig-r041-20220821
s390                 randconfig-r044-20220821

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
