From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: [PATCH 08/22] m68knommu: switch to GPIO init macros in ColdFire
 528x init code
Date: Fri, 27 Apr 2012 12:49:09 +1000 (EST)
Message-ID: <alpine.LNX.2.00.1204271240130.6685@nippy.intranet>
References: <1335399962-10308-1-git-send-email-gerg@snapgear.com> <1335399962-10308-9-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from vm4.telegraphics.com.au ([98.124.60.149]:60780 "EHLO
	vps4.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758520Ab2D0DSY (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 26 Apr 2012 23:18:24 -0400
In-Reply-To: <1335399962-10308-9-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: gerg@snapgear.com
Cc: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org, sfking@fdwdc.com, Greg Ungerer <gerg@uclinux.org>


On Thu, 26 Apr 2012, gerg@snapgear.com wrote:

> +	MCFGPS(QA, 24, 4, MCFQADC_DDRQA, MCFQADC_PORTQA, MCFQADC_PORTQA),
> +	MCFGPS(QA, 32, 4, MCFQADC_DDRQB, MCFQADC_PORTQB, MCFQADC_PORTQB),

I think the second label should be "QB".

Also affected is "[PATCH 19/22] m68knommu: simplify the ColdFire 528x GPIO 
struct setup".

Finn
