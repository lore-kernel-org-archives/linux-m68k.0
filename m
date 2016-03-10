From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Subject: Re: [PATCH 4/6] parisc: rtc: provide rtc_class_ops directly
Date: Thu, 10 Mar 2016 05:34:12 +0100
Message-ID: <20160310043412.GC9868@piout.net>
References: <1456851608-3374907-1-git-send-email-arnd@arndb.de>
 <1456851608-3374907-5-git-send-email-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1456851608-3374907-5-git-send-email-arnd@arndb.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, Kyle McMartin <kyle@mcmartin.ca>, rtc-linux@googlegroups.com, Alessandro Zummo <a.zummo@towertech.it>, linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org, linux-parisc@vger.kernel.org, linux-m68k@lists.linux-m68k.org, "James E.J. Bottomley" <jejb@parisc-linux.org>, Helge Deller <deller@gmx.de>, linux-kernel@vger.kernel.org

On 01/03/2016 at 18:00:00 +0100, Arnd Bergmann wrote :
> -	pdev = platform_device_register_simple("rtc-generic", -1, NULL, 0);
> +	pdev = platform_device_register_data(NULL, "rtc-generic", -1,
> +					     &rtc_generic_ops,
> +					     sizeof(rtc_generic_ops));
> +
> +

spurious blank line

>  	return PTR_ERR_OR_ZERO(pdev);
>  }
>  device_initcall(rtc_init);
> -- 
> 2.7.0
> 

-- 
Alexandre Belloni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
