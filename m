From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] m68k: merge the non-mmu and mmu versions of hardirq.h
Date: Wed, 17 Jun 2009 09:41:43 +0200
Message-ID: <200906170941.44383.arnd@arndb.de>
References: <200906170710.n5H7AxxV009015@localhost.localdomain>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.126.187]:55129 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751558AbZFQHl6 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 17 Jun 2009 03:41:58 -0400
In-Reply-To: <200906170710.n5H7AxxV009015@localhost.localdomain>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Ungerer <gerg@snapgear.com>
Cc: linux-kernel@vger.kernel.org, gerg@uclinux.org, linux-m68k@vger.kernel.org

On Wednesday 17 June 2009, Greg Ungerer wrote:
> [PATCH] m68k: merge the non-mmu and mmu versions of hardirq.h
> 
> There is nothing different required between the non-mmu and mmu
> versions of hardirq.h, so merge them back into a single file.
> 
> Signed-off-by: Greg Ungerer <gerg@uclinux.org>

AFAICT this file is also the same in the new asm-generic version, so you
could fall back to that directly.

	Arnd <><
