From: Florian Tobias Schandinat <FlorianSchandinat@gmx.de>
Subject: Re: [PATCH] fbdev/amifb: Remove write-only variable amifb_inverse
Date: Thu, 23 Aug 2012 20:47:57 +0000
Message-ID: <503696FD.8090900@gmx.de>
References: <1345296621-15367-1-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mailout-de.gmx.net ([213.165.64.22]:49809 "HELO
	mailout-de.gmx.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S934314Ab2HWUsD (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 23 Aug 2012 16:48:03 -0400
In-Reply-To: <1345296621-15367-1-git-send-email-geert@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-fbdev@vger.kernel.org, linux-m68k@vger.kernel.org

On 08/18/2012 01:30 PM, Geert Uytterhoeven wrote:
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>

Applied.


Thanks,

Florian Tobias Schandinat

> ---
>  drivers/video/amifb.c |    2 --
>  1 files changed, 0 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/video/amifb.c b/drivers/video/amifb.c
> index 887df9d..7fa1bf8 100644
> --- a/drivers/video/amifb.c
> +++ b/drivers/video/amifb.c
> @@ -949,7 +949,6 @@ static int round_down_bpp = 1;	/* for mode probing */
>  
>  
>  static int amifb_ilbm = 0;	/* interleaved or normal bitplanes */
> -static int amifb_inverse = 0;
>  
>  static u32 amifb_hfmin __initdata;	/* monitor hfreq lower limit (Hz) */
>  static u32 amifb_hfmax __initdata;	/* monitor hfreq upper limit (Hz) */
> @@ -2355,7 +2354,6 @@ static int __init amifb_setup(char *options)
>  		if (!*this_opt)
>  			continue;
>  		if (!strcmp(this_opt, "inverse")) {
> -			amifb_inverse = 1;
>  			fb_invert_cmaps();
>  		} else if (!strcmp(this_opt, "ilbm"))
>  			amifb_ilbm = 1;
