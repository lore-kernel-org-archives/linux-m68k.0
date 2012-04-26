From: Philippe De Muyter <phdm@macqel.be>
Subject: Re: [PATCH v2 01/22] m68knommu: introduce macros to simplify
	ColdFire GPIO table initialization
Date: Thu, 26 Apr 2012 16:39:29 +0200
Message-ID: <20120426143929.GA13126@frolo.macqel>
References: <1335446091-11177-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mailrelay008.isp.belgacom.be ([195.238.6.174]:15471 "EHLO
	mailrelay008.isp.belgacom.be" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1757095Ab2DZOjd (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>);
	Thu, 26 Apr 2012 10:39:33 -0400
Content-Disposition: inline
In-Reply-To: <1335446091-11177-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: gerg@snapgear.com
Cc: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org, Greg Ungerer <gerg@uclinux.org>

Hello Greg,

On Thu, Apr 26, 2012 at 11:14:51PM +1000, gerg@snapgear.com wrote:
> From: Greg Ungerer <gerg@uclinux.org>
> 
...
>  
> +/*
> + *	Define macros to ease the pain of setting up the GPIO tables. There
> + *	is two cases we need to deal with here, they cover all currently
> + *	available ColdFire GPIO hardware. There is of course minor differences
> + *	in the layout and number of bits in each ColdFire part, but the macros
> + *	take all that in.
> + *
> + *	Firstly is the conventional GPIO registers where we toggle individual
> + *	bits in a register, preserving the other bits in the register. For
> + *	lack of a better term I have called this the slow method.
> + */
> +#define	MCFGPS(mlabel, mbase, mngpio, mpddr, mpodr, mppdr)		    \
...
> +/*
> + *	Secondly is the faster case, where we have set and clear registers
> + *	that allow us to set or clear a bit with a single write, not having
> + *	to worry about preserving other bits.
> + */
> +#define	MCFGPF(mlabel, mbase, mngpio)					    \

That's perfectly clear.

Thanks

Philippe

-- 
Philippe De Muyter +32 2 6101532 Macq SA rue de l'Aeronef 2 B-1140 Bruxelles
