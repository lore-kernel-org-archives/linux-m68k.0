From: Philippe De Muyter <phdm@macqel.be>
Subject: Re: [PATCH] m68k: Use generic strncpy_from_user(), strlen_user(),
	and strnlen_user()
Date: Wed, 30 May 2012 12:22:26 +0200
Message-ID: <20120530102226.GA28628@frolo.macqel>
References: <1338327216-15309-1-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1338327216-15309-1-git-send-email-geert@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org, Greg Ungerer <gerg@uclinux.org>, linux-kernel@vger.kernel.org

On Tue, May 29, 2012 at 11:33:36PM +0200, Geert Uytterhoeven wrote:
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
> Do we also want
> 
>     select HAVE_EFFICIENT_UNALIGNED_ACCESS if (!COLDFIRE && !M68000)

Sorry, I did not follow what happened to unaligned accesses, but
CPU32 family (at least 68340) crashes on unaligned accesses.

Philippe
