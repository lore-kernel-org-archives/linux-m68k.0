From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: [PATCH 3/13] pmac-zilog: cleanup
Date: Tue, 17 Nov 2009 15:58:33 +1100 (EST)
Message-ID: <alpine.OSX.2.00.0911171521240.371@silk.local>
References: <alpine.OSX.2.00.0911031441280.483@silk.local> <1258423668.2140.557.camel@pasglop>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from www.telegraphics.com.au ([204.15.192.19]:63801 "EHLO
	mail.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752187AbZKQE62 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 16 Nov 2009 23:58:28 -0500
In-Reply-To: <1258423668.2140.557.camel@pasglop>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linuxppc-dev@ozlabs.org, linux-m68k@vger.kernel.org

Hi Ben,

On Tue, 17 Nov 2009, Benjamin Herrenschmidt wrote:

> On Wed, 2009-11-04 at 00:40 +1100, Finn Thain wrote:
> > Whitespace cleanups and comment typo fix.
> > 
> > Signed-off-by: Finn Thain <fthain@telegraphics.com.au>
> 
> Acked-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> 
> Hi Finn. Do you want me to carry and merge those patches via the powerpc 
> tree ?

The CUDA changes are probably detrimental without the macfb changes. The 
m68k side of the pmac-zilog patch won't apply without a patch earlier in 
the series, and the pmac-zilog changes as a whole are no use without that.
So I think it is best if Geert merges them with your acked-by, once they 
pass review.

Finn

> 
> Cheers,
> Ben.
> 
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-m68k" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
