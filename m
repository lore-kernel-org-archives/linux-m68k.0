From: Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: [RFC 2/2] nubus: Fix pointer validation
Date: Tue, 25 Apr 2017 16:03:59 +1200
Message-ID: <3d6f5f64-27de-ecfa-96ce-9229f6d0a1ea@gmail.com>
References: <cover.1492910474.git.fthain@telegraphics.com.au>
 <0fbc5e985afe65b9dc06ca1f96b6f7e8a3739184.1492910474.git.fthain@telegraphics.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pg0-f68.google.com ([74.125.83.68]:35864 "EHLO
        mail-pg0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751865AbdDYEEG (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Tue, 25 Apr 2017 00:04:06 -0400
Received: by mail-pg0-f68.google.com with SMTP id v1so974738pgv.3
        for <linux-m68k@vger.kernel.org>; Mon, 24 Apr 2017 21:04:06 -0700 (PDT)
In-Reply-To: <0fbc5e985afe65b9dc06ca1f96b6f7e8a3739184.1492910474.git.fthain@telegraphics.com.au>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org

Hi Finn,

I had to look at a few other functions in the nubus driver to figure out
how the address layout looks for th bus address range, but it all made
sense in the end. Can't find any fault with this one. So:

Reviewed-by: Michael Schmitz <schmitzmic@gmail.com>


Am 23.04.2017 um 13:24 schrieb Finn Thain:
> Fix bounds checking on slot-space pointer movement.
> Remove redundant test for zero byte-lanes value.
> Fix broken byte-lanes vs. address validation.
> 
> This patch changes the circumstances under which an error is printed to
> the console and fixes the address validation.
> 
> The validation code should work correctly now: the broken test for a
> valid bytelanes value is replaced with a working test (which eliminates
> false negatives) and the 24-bit directory offset bounds check is fixed
> (which eliminates false positives).
> 
> Please see "Designing Cards and Drivers for the Macintosh Family"
> ch. 8, "NuBus Card Firmware" for an explanation of the bytelanes check
> and directory offset value.
> 
> Signed-off-by: Finn Thain <fthain@telegraphics.com.au>
> ---
> To fully test this would require a card with a flawed ROM, which is
> difficult to find. The valid case has been tested however.
> ---
>  drivers/nubus/nubus.c | 14 ++++++--------
>  1 file changed, 6 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/nubus/nubus.c b/drivers/nubus/nubus.c
> index bb628de..bb81347 100644
> --- a/drivers/nubus/nubus.c
> +++ b/drivers/nubus/nubus.c
> @@ -92,9 +92,6 @@ static void nubus_rewind(unsigned char **ptr, int len, int map)
>  {
>  	unsigned char *p = *ptr;
>  
> -	/* Sanity check */
> -	if (len > 65536)
> -		pr_err("rewind of 0x%08x!\n", len);
>  	while (len) {
>  		do {
>  			p--;
> @@ -108,8 +105,6 @@ static void nubus_advance(unsigned char **ptr, int len, int map)
>  {
>  	unsigned char *p = *ptr;
>  
> -	if (len > 65536)
> -		pr_err("advance of 0x%08x!\n", len);
>  	while (len) {
>  		while (not_useful(p, map))
>  			p++;
> @@ -121,10 +116,15 @@ static void nubus_advance(unsigned char **ptr, int len, int map)
>  
>  static void nubus_move(unsigned char **ptr, int len, int map)
>  {
> +	unsigned long slot_space = (unsigned long)*ptr & 0xFF000000;
> +
>  	if (len > 0)
>  		nubus_advance(ptr, len, map);
>  	else if (len < 0)
>  		nubus_rewind(ptr, -len, map);
> +
> +	if (((unsigned long)*ptr & 0xFF000000) != slot_space)
> +		pr_err("%s: moved out of slot address space!\n", __func__);
>  }
>  
>  /* Now, functions to read the sResource tree */
> @@ -808,8 +808,6 @@ void __init nubus_probe_slot(int slot)
>  			continue;
>  
>  		dp = *rp;
> -		if(dp == 0)
> -			continue;
>  
>  		/* The last byte of the format block consists of two
>  		   nybbles which are "mirror images" of each other.
> @@ -818,7 +816,7 @@ void __init nubus_probe_slot(int slot)
>  			continue;
>  		/* Check that this value is actually *on* one of the
>  		   bytelanes it claims are valid! */
> -		if ((dp & 0x0F) >= (1 << i))
> +		if (not_useful(rp, dp))
>  			continue;
>  
>  		/* Looks promising.  Let's put it on the list. */
> 
