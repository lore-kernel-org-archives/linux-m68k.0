From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH 4/4] sparc: iounmap() and *_free_coherent() - Use
 lookup_resource()
Date: Mon, 23 May 2011 02:46:20 -0400 (EDT)
Message-ID: <20110523.024620.245701157448889932.davem@davemloft.net>
References: <1306006756-32009-1-git-send-email-geert@linux-m68k.org>
	<1306006756-32009-5-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from shards.monkeyblade.net ([198.137.202.13]:51091 "EHLO
	shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752021Ab1EWGrZ (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 23 May 2011 02:47:25 -0400
In-Reply-To: <1306006756-32009-5-git-send-email-geert@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: geert@linux-m68k.org
Cc: linux-kernel@vger.kernel.org, sparclinux@vger.kernel.org, linux-m68k@vger.kernel.org

From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sat, 21 May 2011 21:39:16 +0200

> Replace a custom implementation (which doesn't lock the resource tree) by a
> call to lookup_resource()
> 
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>

Acked-by: David S. Miller <davem@davemloft.net>
