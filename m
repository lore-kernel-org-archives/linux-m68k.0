From: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [RFC,v2,01/24] macintosh/nvram: Remove as unused
Date: Mon, 15 Jun 2015 16:41:48 +1000 (AEST)
Message-ID: <20150615064148.83D59140291@ozlabs.org>
References: <20150614074607.524658883@telegraphics.com.au>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:46798 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753861AbbFOGlu (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Mon, 15 Jun 2015 02:41:50 -0400
In-Reply-To: <20150614074607.524658883@telegraphics.com.au>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>, linux-kernel@vger.kernel.org, linux-m68k@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>

On Sun, 2015-14-06 at 07:46:08 UTC, Finn Thain wrote:
> Signed-off-by: Finn Thain <fthain@telegraphics.com.au>
> Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
>  drivers/macintosh/nvram.c |  130 ----------------------------------------------
>  1 file changed, 130 deletions(-)

This seems uncontroversial, so I'll take it via powerpc for 4.1.

In future please include the details on how/why it's unused in the changelog.

Geert did the digging for you:

  Removal seems to be forgotten by full-history-linux
  commit 17c6f4635bea74e110ab3558d408c9cd218c568a
  Author: Benjamin Herrenschmidt <benh@kernel.crashing.org>
  Date:   Fri Feb 6 14:20:56 2004 +1100
  
      ppc32: Rework nvram management
  
      move drivers/macintosh/nvram.c to drivers/char/generic_nvram.c,
      update platform hooks,
      fix powermac nvram driver for newer machines


I'll fold that into the changelog.

cheers
