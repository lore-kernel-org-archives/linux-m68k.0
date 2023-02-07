Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6E57C6379F
	for <linux-m68k@archiver.kernel.org>; Tue,  7 Feb 2023 22:56:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230184AbjBGW4f (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 7 Feb 2023 17:56:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230168AbjBGW4e (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 7 Feb 2023 17:56:34 -0500
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F350130B2B
        for <linux-m68k@lists.linux-m68k.org>; Tue,  7 Feb 2023 14:56:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675810593; x=1707346593;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FDOyhrG2X8z9k0IPIX77FGLTvc/CQXeh+Z8JpG0kvqU=;
  b=FTGf1cFCi5aL0+Frbhso9Y4dej5Eu6yHd7O/7OzM6ta3JNUi8EVn9NsK
   ldbv79pnJYnFXRoiURRwtORJs3PaDclj1y54XDC+ke0YlkfjS4f3A7IWN
   Namjr3xAlA6INJYFxm+1E48Q8O1oiO28qei51uJokBJXAgE2yaypkRVuS
   Eh6A2gycEBpF9wBMwsCzXuymclCx/qycv1TqCKq9opNrnYPjFkqzsHHyU
   +kG6HBaWBynVhcCNE1jMa7dar0DfS9dht9cBPb/CHyQROVfi9eHc0grOw
   zIfRG9hXOBNwnFz/dv7Rifuhax+BVqpPbDa8rCXIU91bz73YwqBkMfP7x
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10614"; a="392046045"
X-IronPort-AV: E=Sophos;i="5.97,279,1669104000"; 
   d="scan'208";a="392046045"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2023 14:56:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10614"; a="995905650"
X-IronPort-AV: E=Sophos;i="5.97,279,1669104000"; 
   d="scan'208";a="995905650"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga005.fm.intel.com with ESMTP; 07 Feb 2023 14:56:18 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1pPWso-003ooN-2o;
        Wed, 08 Feb 2023 00:56:14 +0200
Date:   Wed, 8 Feb 2023 00:56:14 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Devarsh Thakkar <devarsht@ti.com>,
        Stefan Schmidt <stefan@datenfreihafen.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        linux-doc-tw-discuss@lists.sourceforge.net,
        linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
        linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-input@vger.kernel.org,
        linux-media@vger.kernel.org, linux-wpan@vger.kernel.org,
        netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
        brcm80211-dev-list.pdl@broadcom.com,
        SHA-cyfmac-dev-list@infineon.com, linux-arch@vger.kernel.org,
        devicetree@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v3 04/12] gpiolib: remove gpio_set_debounce
Message-ID: <Y+LXDvl4lpfF4SnK@smile.fi.intel.com>
References: <20230207142952.51844-1-andriy.shevchenko@linux.intel.com>
 <20230207142952.51844-5-andriy.shevchenko@linux.intel.com>
 <Y+LDUTfKgHEJHNXB@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y+LDUTfKgHEJHNXB@google.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Tue, Feb 07, 2023 at 01:32:01PM -0800, Dmitry Torokhov wrote:
> On Tue, Feb 07, 2023 at 04:29:44PM +0200, Andy Shevchenko wrote:
> > @@ -1010,14 +1009,21 @@ static int ads7846_setup_pendown(struct spi_device *spi,
> >  		}
> >  
> >  		ts->gpio_pendown = pdata->gpio_pendown;
> > -
> > -		if (pdata->gpio_pendown_debounce)
> > -			gpio_set_debounce(pdata->gpio_pendown,
> > -					  pdata->gpio_pendown_debounce);
> 
> Can we please change only this to:
> 
> 			gpiod_set_debounce(gpio_to_desc(pdata->gpio_pendown),
> 					   pdata->gpio_pendown_debounce);
> 
> and not change anything else (i.e. drop the changes below)?

Probably. I can try rollback this.

> >  	} else {
> > -		dev_err(&spi->dev, "no get_pendown_state nor gpio_pendown?\n");
> > -		return -EINVAL;
> > +		struct gpio_desc *desc;
> > +
> > +		desc = devm_gpiod_get(&spi->dev, "pendown", GPIOD_IN);
> > +		if (IS_ERR(desc)) {
> > +			dev_err(&spi->dev, "no get_pendown_state nor gpio_pendown?\n");
> > +			return PTR_ERR(desc);
> > +		}
> > +		gpiod_set_consumer_name(desc, "ads7846_pendown");
> > +
> > +		ts->gpio_pendown = desc_to_gpio(desc);
> >  	}
> > +	if (pdata->gpio_pendown_debounce)
> > +		gpiod_set_debounce(gpio_to_desc(ts->gpio_pendown),
> > +				   pdata->gpio_pendown_debounce);
> >  
> >  	return 0;

-- 
With Best Regards,
Andy Shevchenko


