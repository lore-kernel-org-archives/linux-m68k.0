From: Philippe De Muyter <phdm@macqel.be>
Subject: Re: [PATCH 01/22] m68knommu: introduce macros to simplify ColdFire
	GPIO table initialization
Date: Thu, 26 Apr 2012 09:16:10 +0200
Message-ID: <20120426071610.GA31640@frolo.macqel>
References: <1335399962-10308-1-git-send-email-gerg@snapgear.com> <1335399962-10308-2-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mailrelay007.isp.belgacom.be ([195.238.6.173]:27669 "EHLO
	mailrelay007.isp.belgacom.be" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751937Ab2DZHQO (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>);
	Thu, 26 Apr 2012 03:16:14 -0400
Content-Disposition: inline
In-Reply-To: <1335399962-10308-2-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: gerg@snapgear.com
Cc: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org, sfking@fdwdc.com, Greg Ungerer <gerg@uclinux.org>

Hi Greg,

On Thu, Apr 26, 2012 at 10:25:41AM +1000, gerg@snapgear.com wrote:
> From: Greg Ungerer <gerg@uclinux.org>
> 
> We have very large tables in the ColdFire CPU GPIO setup code that essentially
> boil down to 2 distinct types of GPIO pin initiaization. Using 2 macros we can
> reduce these large tables to at most a dozen lines of setup code, and in quite
> a few cases a single table entry.
> 
> Introduce these 2 macros into the existing mcfgpio.h header.
...
> +/*
> + *	Define macros to ease the pain of setting up the gpio tables.
> + */
> +#define	MCFGPS(mlabel, mbase, mngpio, mpddr, mpodr, mppdr)		    \
...
> +#define	MCFGPF(mlabel, mbase, mngpio)					    \
...

Maybe a small comment to explain when to use MCFGPS and when to use MCFGPF ?

Best regards

Philippe
