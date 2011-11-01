From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH] net/ethernet: Move mac89x0.c from apple to cirrus
Date: Tue, 01 Nov 2011 19:33:05 -0400 (EDT)
Message-ID: <20111101.193305.2191680732467562808.davem@davemloft.net>
References: <1319911741-9977-1-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from shards.monkeyblade.net ([198.137.202.13]:38397 "EHLO
	shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755986Ab1KAXeO (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 1 Nov 2011 19:34:14 -0400
In-Reply-To: <1319911741-9977-1-git-send-email-geert@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: geert@linux-m68k.org
Cc: jeffrey.t.kirsher@intel.com, netdev@vger.kernel.org, linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org

From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sat, 29 Oct 2011 20:09:01 +0200

> Macintosh CS89x0 based ethernet cards use a Crystal Semiconductor (Now
> Cirrus Logic) CS89x0 chip, so the mac89x0 driver should be in
> drivers/net/ethernet/cirrus instead of drivers/net/ethernet/apple.
> 
> This also fixes a build problem, as the driver needs a header file from the
> cirrus directory:
> 
> drivers/net/ethernet/apple/mac89x0.c:107:20: error: cs89x0.h: No such file or directory
> 
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>

Applied, thanks.
