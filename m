From: Paul Mundt <lethal@linux-sh.org>
Subject: Re: [PATCH 1/3] fbdev/amifb: Correct check for video memory size
Date: Tue, 24 May 2011 16:27:29 +0900
Message-ID: <20110524072729.GG11986@linux-sh.org>
References: <1306006976-32117-1-git-send-email-geert@linux-m68k.org> <1306006976-32117-3-git-send-email-geert@linux-m68k.org> <1306006976-32117-1-git-send-email-geert@linux-m68k.org> <1306006976-32117-2-git-send-email-geert@linux-m68k.org> <1306006976-32117-1-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from linux-sh.org ([111.68.239.195]:34850 "EHLO linux-sh.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753344Ab1EXH1f (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Tue, 24 May 2011 03:27:35 -0400
Content-Disposition: inline
In-Reply-To: <1306006976-32117-3-git-send-email-geert@linux-m68k.org> <1306006976-32117-2-git-send-email-geert@linux-m68k.org> <1306006976-32117-1-git-send-email-geert@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-fbdev@vger.kernel.org, linux-m68k@vger.kernel.org

On Sat, May 21, 2011 at 09:42:54PM +0200, Geert Uytterhoeven wrote:
> The check should compare the available memory size with the highest allocation
> value (VIDEOMEMSIZE_*_2M), not with the lowest value (VIDEOMEMSIZE_*_1M).
> 
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>

On Sat, May 21, 2011 at 09:42:55PM +0200, Geert Uytterhoeven wrote:
> Fail gracefully instead.
> 
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>

On Sat, May 21, 2011 at 09:42:56PM +0200, Geert Uytterhoeven wrote:
> amiga_chip_alloc() already aligns to the PAGE_SIZE
> 
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>

All applied, thanks.
