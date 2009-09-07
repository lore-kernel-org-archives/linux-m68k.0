From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH] net: fix hydra printk format warning
Date: Mon, 07 Sep 2009 01:57:42 -0700 (PDT)
Message-ID: <20090907.015742.83956406.davem@davemloft.net>
References: <20090904172037.b2dd7f20.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:36946
	"EHLO sunset.davemloft.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752510AbZIGI50 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 7 Sep 2009 04:57:26 -0400
In-Reply-To: <20090904172037.b2dd7f20.randy.dunlap@oracle.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: randy.dunlap@oracle.com
Cc: linux-m68k@vger.kernel.org, netdev@vger.kernel.org, geert@linux-m68k.org, zippel@linux-m68k.org

From: Randy Dunlap <randy.dunlap@oracle.com>
Date: Fri, 4 Sep 2009 17:20:37 -0700

> From: Randy Dunlap <randy.dunlap@oracle.com>
> 
> m68k:
> drivers/net/hydra.c:178: warning: format '%08lx' expects type 'long unsigned int', but argument 3 has type 'resource_size_t'
> 
> Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>

Applied to net-next-2.6, thanks.
