From: Philippe De Muyter <phdm@macq.eu>
Subject: Re: [PATCH 08/10] m68k: Add <asm/archhash.h>
Date: Wed, 25 May 2016 15:24:06 +0200
Message-ID: <20160525132406.GA13750@frolo.macqel>
References: <CA+55aFxPSW+84KfQ1N_WmND-wtvgj2zQm8nFPkRcc+gyU=uing@mail.gmail.com> <20160525073455.5709.qmail@ns.sciencehorizons.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160525073455.5709.qmail@ns.sciencehorizons.net>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: George Spelvin <linux@sciencehorizons.net>
Cc: geert@linux-m68k.org, gerg@linux-m68k.org, linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org, torvalds@linux-foundation.org, tglx@linutronix.de

On Wed, May 25, 2016 at 03:34:55AM -0400, George Spelvin wrote:
> This provides a multiply by constant GOLDEN_RATIO_32 = 0x61C88647
> for the original mc68000, which lacks a 32x32-bit multiply instruction.
> 
> Addition chains found by Yevgen Voronenko's Hcub algorithm at
> http://spiral.ece.cmu.edu/mcm/gen.html

Shouldn't you put that reference in the comments of your archhash.h file ?

Philippe
