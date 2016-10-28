From: Philippe De Muyter <phdm@macq.eu>
Subject: Re: [PATCH] m68k: Fix ndelay() macro
Date: Fri, 28 Oct 2016 23:03:35 +0200
Message-ID: <20161028210335.GA3940__18066.8731024072$1477689164$gmane$org@frolo.macqel>
References: <1477667548-740-1-git-send-email-boris.brezillon@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1477667548-740-1-git-send-email-boris.brezillon@free-electrons.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org

On Fri, Oct 28, 2016 at 05:12:28PM +0200, Boris Brezillon wrote:
> The current ndelay() macro definition has an extra semi-colon at the
> end of the line thus leading to a compilation error when ndelay is used
> in a conditional block with curly braces like this one:

without curly braces

> 
> 	if (cond)
> 		ndelay(t);
> 	else
> 		...
> 

Philippe

-- 
Philippe De Muyter +32 2 6101532 Macq SA rue de l'Aeronef 2 B-1140 Bruxelles
