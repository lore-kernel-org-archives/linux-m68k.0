From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH 1/4] sparc: _sparc_find_resource() should check for
 exact matches
Date: Mon, 23 May 2011 02:45:58 -0400 (EDT)
Message-ID: <20110523.024558.1625882862305082516.davem@davemloft.net>
References: <1306006756-32009-1-git-send-email-geert@linux-m68k.org>
	<1306006756-32009-2-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from shards.monkeyblade.net ([198.137.202.13]:51085 "EHLO
	shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751925Ab1EWGrK (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 23 May 2011 02:47:10 -0400
In-Reply-To: <1306006756-32009-2-git-send-email-geert@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: geert@linux-m68k.org
Cc: linux-kernel@vger.kernel.org, sparclinux@vger.kernel.org, linux-m68k@vger.kernel.org

From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sat, 21 May 2011 21:39:13 +0200

> The address that's passed to _sparc_find_resource() should always be the
> start address of a resource:
>   - iounmap() passes a page-aligned virtual address, while the original
>     address was created by adding the in-page offset to the resource's
>     start address,
>   - sbus_free_coherent() and pci32_free_coherent() should be passed an
>     address obtained from sbus_alloc_coherent() resp. pci32_alloc_coherent(),
>     which is always a resource's start address.
> 
> Hence replace the range check by a check for an exact match.
> 
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>

Acked-by: David S. Miller <davem@davemloft.net>
