From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [RESEND,01/10] via-cuda: Cleanup printk calls
Date: Fri, 10 Feb 2017 00:17:52 +1100 (AEDT)
Message-ID: <3vJzCN2hnJz9s7K@ozlabs.org>
References: <f0e5117608ea57a64ed60562ec29203a46234b64.1483055859.git.fthain@telegraphics.com.au>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:52199 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751074AbdBINTx (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
        Thu, 9 Feb 2017 08:19:53 -0500
In-Reply-To: <f0e5117608ea57a64ed60562ec29203a46234b64.1483055859.git.fthain@telegraphics.com.au>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org

On Sun, 2017-01-01 at 00:56:26 UTC, Finn Thain wrote:
> Add missing log message severity, remove old debug messages and
> replace printk() loop with print_hex_dump() call.
> 
> Tested-by: Stan Johnson <userm57@yahoo.com>
> Signed-off-by: Finn Thain <fthain@telegraphics.com.au>

Series applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/523717d1496c794e8380d0e3de5ca6

cheers
