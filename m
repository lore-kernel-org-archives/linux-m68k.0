Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA79BC43334
	for <linux-m68k@archiver.kernel.org>; Tue, 12 Jul 2022 04:07:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229733AbiGLEHD (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 12 Jul 2022 00:07:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229666AbiGLEHC (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 12 Jul 2022 00:07:02 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EEC7326CA
        for <linux-m68k@lists.linux-m68k.org>; Mon, 11 Jul 2022 21:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657598818; x=1689134818;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=1pz+y6eYu6b/cJPK7Vq+PNxFHJrRINCajPysqdaDdwQ=;
  b=Cd/ChuFc1pbbzRwj/fGHO71Pn00e4qSts4TE5OMb8/xCuQoRyT5/hkgA
   bpcv4vZa7puPEBz824ABIfy8JLhbkSD1A4PsGf8LvSTvdswkkfoe9nmaF
   XoTHEaeE/gPSuNKk2/vyfiH6HTlJCvwm6bCBmPc4Uo5wWVTUCtAP0D/be
   Hq50sCqruNLs37hSejoD4VZfJq0JTVTUweJ/5e9QytIDOQpyF+SHA/YXZ
   h6klAtQxLCr9YR1BsUAPlKbthtpE3FiCcTB1G4xbPMNnOWb9tPGrcoLhG
   M4873Ko/9FT9tcLkXsb7kJHKfXEQgdxyKgfdRfPXTHVyzjSvj+kgZ0b61
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10405"; a="284859180"
X-IronPort-AV: E=Sophos;i="5.92,264,1650956400"; 
   d="scan'208";a="284859180"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2022 21:06:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,264,1650956400"; 
   d="scan'208";a="922048904"
Received: from lkp-server02.sh.intel.com (HELO 8708c84be1ad) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 11 Jul 2022 21:06:55 -0700
Received: from kbuild by 8708c84be1ad with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1oB7Al-0001eb-EL;
        Tue, 12 Jul 2022 04:06:55 +0000
Date:   Tue, 12 Jul 2022 12:06:17 +0800
From:   kernel test robot <lkp@intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
Subject: [geert-m68k:for-v5.20] BUILD SUCCESS
 f80261e4764b498bf0a6f0d69ee6e6720e49ab9d
Message-ID: <62ccf339.t8xHVa8mOWEpMkcz%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git for-v5.20
branch HEAD: f80261e4764b498bf0a6f0d69ee6e6720e49ab9d  m68k: defconfig: Update defconfigs for v5.19-rc1

elapsed time: 780m

configs tested: 2
configs skipped: 13

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
m68k                             allmodconfig
m68k                             allyesconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
