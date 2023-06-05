Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC07DC7EE23
	for <linux-m68k@archiver.kernel.org>; Mon,  5 Jun 2023 12:52:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232130AbjFEMwl (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 5 Jun 2023 08:52:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232237AbjFEMwk (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 5 Jun 2023 08:52:40 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 719A598
        for <linux-m68k@lists.linux-m68k.org>; Mon,  5 Jun 2023 05:52:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685969558; x=1717505558;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Gr9FU0HsXW4j6iFAuKnKLc7ghOPdKZNL52m0iUuheIY=;
  b=HjNrSVSYpZ0HKGVnIz3L0pfSaILeX88evg93BJWBf6qvHR9gRMm8Va6m
   1euP25D4228Msf+vqMBy0T1/xX2t/BO/BcK8U2tExcUsWkzKU9S+LZk4W
   kaYhZWrkuxnige6lgkPpDDMj4V6d+xtgJeHvTKuCfDFkLhV6HAE3iN5DB
   BKaMnVpiK0MhryT91+HXwILIG53xM4ESFCnE8BxamoQihur2eQ3R8/6YG
   2OAKo5DrJhkmBlvOqPlj2yeE3LElBHZllnyVPJGEz49uTAs2WGGV9ADGb
   vGx7WBKO9ZyHaDe22Yd3nkEUVLjn88bNkNg9Xe1GyQSxoZSUoArwxIbCO
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10731"; a="358806224"
X-IronPort-AV: E=Sophos;i="6.00,217,1681196400"; 
   d="scan'208";a="358806224"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2023 05:52:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10731"; a="773729801"
X-IronPort-AV: E=Sophos;i="6.00,217,1681196400"; 
   d="scan'208";a="773729801"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga008.fm.intel.com with ESMTP; 05 Jun 2023 05:52:33 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1q69hH-001NFH-0K;
        Mon, 05 Jun 2023 15:52:31 +0300
Date:   Mon, 5 Jun 2023 15:52:30 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Yanteng Si <siyanteng@loongson.cn>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>, linux-gpio@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc-tw-discuss@lists.sourceforge.net,
        linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        Hu Haowen <src.res@email.cn>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: Re: [PATCH v1 1/1] gpiolib: Remove unused gpio_cansleep()
Message-ID: <ZH3ajj/tGc3VYvHT@smile.fi.intel.com>
References: <20230602150106.47783-1-andriy.shevchenko@linux.intel.com>
 <2fad9d11-ecc6-aa3d-8c0b-14b1f196ce74@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2fad9d11-ecc6-aa3d-8c0b-14b1f196ce74@loongson.cn>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Mon, Jun 05, 2023 at 10:27:44AM +0800, Yanteng Si wrote:
> Hi andy,
> 
> On 2023/6/2 23:01, Andy Shevchenko wrote:

Thank you, I have incorporated the proposed amendments and it will be available
in v2 of this patch.

-- 
With Best Regards,
Andy Shevchenko


