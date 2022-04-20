Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6A34C433EF
	for <linux-m68k@archiver.kernel.org>; Wed, 20 Apr 2022 07:43:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376315AbiDTHqF (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 20 Apr 2022 03:46:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376318AbiDTHqD (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 20 Apr 2022 03:46:03 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EDF13B57B
        for <linux-m68k@lists.linux-m68k.org>; Wed, 20 Apr 2022 00:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650440598; x=1681976598;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VLZ3Oiyauf4PXpEX5Cd3P8yK2szKUl8ted+JLr34T8s=;
  b=lM6OVSaBP7w/EnpUwdUyUsBTmxQCYZTWE47y0stcIGoEQAhrJdOZCDbP
   G2vxFKFgIouJSvjD/qoDPNmmosOdZB74QVAUubXjEgp4QAaPQPdCN35jQ
   ZTvWg3eJOlk8/LSkoWNMIKw8AtRNNa8Jr/H6KCGS87HN+gHXpBFq/4M2i
   Moab+wuklGz2MMOoBE8t4iHLa/19JaP+iE19sWKsb9YAyN2plUZUy+M+Y
   LdlZYKacluhzfBAT4oua/G2D/tw0MAQWds0ynwwzZ0DGh0IfcjCU/7QPS
   wnHzbAE4UpTuryEdnPTzR/zqe9RXFGFVJ+/bNZ+P4EGxFewpVvf9QkFeO
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10322"; a="243897093"
X-IronPort-AV: E=Sophos;i="5.90,275,1643702400"; 
   d="scan'208";a="243897093"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2022 00:43:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,275,1643702400"; 
   d="scan'208";a="510453668"
Received: from lkp-server01.sh.intel.com (HELO 3abc53900bec) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 20 Apr 2022 00:43:11 -0700
Received: from kbuild by 3abc53900bec with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1nh4zW-0006jC-Ps;
        Wed, 20 Apr 2022 07:43:10 +0000
Date:   Wed, 20 Apr 2022 15:42:45 +0800
From:   kernel test robot <lkp@intel.com>
To:     Arnd Bergmann <arnd@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Greg Ungerer <gerg@linux-m68k.org>
Cc:     kbuild-all@lists.01.org, Arnd Bergmann <arnd@arndb.de>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Finn Thain <fthain@linux-m68k.org>,
        linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org,
        linux-mmc@vger.kernel.org, alsa-devel@alsa-project.org
Subject: Re: [PATCH] [v2] m68k: coldfire: drop ISA_DMA_API support
Message-ID: <202204201546.tAlqEoGg-lkp@intel.com>
References: <20220419132716.1392407-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220419132716.1392407-1-arnd@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Arnd,

I love your patch! Yet something to improve:

[auto build test ERROR on geert-m68k/for-next]
[also build test ERROR on tiwai-sound/for-next gerg-m68knommu/for-next v5.18-rc3 next-20220419]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Arnd-Bergmann/m68k-coldfire-drop-ISA_DMA_API-support/20220419-212846
base:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git for-next
config: m68k-m5307c3_defconfig (https://download.01.org/0day-ci/archive/20220420/202204201546.tAlqEoGg-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/0adee00b1eb9676cd3c269f898b1fae518d8c9e5
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Arnd-Bergmann/m68k-coldfire-drop-ISA_DMA_API-support/20220419-212846
        git checkout 0adee00b1eb9676cd3c269f898b1fae518d8c9e5
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash arch/m68k/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> make[3]: *** No rule to make target 'arch/m68k/coldfire/dma.o', needed by 'arch/m68k/coldfire/built-in.a'.
   make[3]: Target '__build' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
