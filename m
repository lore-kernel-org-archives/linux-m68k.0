From: Philippe De Muyter <phdm@macqel.be>
Subject: Re: [uClinux-dev] [PATCH] m68k: Merge mmu and non-mmu versions of
	sys_call_table
Date: Thu, 7 Apr 2011 00:05:10 +0200
Message-ID: <20110406220510.GA17350__13052.6097644635$1302127576$gmane$org@frolo.macqel>
References: <alpine.DEB.2.00.1104062231190.11240@ayla.of.borg>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.00.1104062231190.11240@ayla.of.borg>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: uClinux development list <uclinux-dev@uclinux.org>
Cc: Greg Ungerer <gerg@uclinux.org>, Linux/m68k <linux-m68k@lists.linux-m68k.org>

On Wed, Apr 06, 2011 at 10:33:07PM +0200, Geert Uytterhoeven wrote:
> Impact for m68knommu:
>   - The table is now stored in .data instead of .text,

Do you mean .rodata ?

>   - Removed unused padding at the end of the table.
> 
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
> Not tested on m68knommu
> 
> Questions:
>   - Why was it .text?

Probably because it is constanti (read-only).

Philippe

-- 
Philippe De Muyter +32 2 6101532 Macq SA rue de l'Aeronef 2 B-1140 Bruxelles
