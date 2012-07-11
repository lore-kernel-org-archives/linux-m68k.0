From: Philippe De Muyter <phdm@macqel.be>
Subject: Re: [PATCH v2] m68k: fix ColdFire clear cache operation
Date: Wed, 11 Jul 2012 17:51:48 +0200
Message-ID: <20120711155148.GA26577@frolo.macqel>
References: <1341967036-14645-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mailrelay004.isp.belgacom.be ([195.238.6.170]:18510 "EHLO
	mailrelay004.isp.belgacom.be" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S932768Ab2GKPvx (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>);
	Wed, 11 Jul 2012 11:51:53 -0400
Content-Disposition: inline
In-Reply-To: <1341967036-14645-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: gerg@snapgear.com
Cc: linux-m68k@vger.kernel.org, Greg Ungerer <gerg@uclinux.org>

On Wed, Jul 11, 2012 at 10:37:16AM +1000, gerg@snapgear.com wrote:

> +	__asm__ __volatile__ (
> +		"movec	%0,%%cacr\n\t"
> +		"nop\n\t"

This could be written as

		"movec %0,%%cacr; nop"

i.e. :
	final "\n\t" is useless
	other "\n\t" may be replaced by ";"

Philippe
