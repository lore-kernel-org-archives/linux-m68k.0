From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: [PATCH] m68k: Fix misspellings in comments.
Date: Thu, 25 Feb 2016 20:23:43 +1100 (AEDT)
Message-ID: <alpine.LNX.2.00.1602252014030.11488@nippy.intranet>
References: <1456389599-14349-1-git-send-email-adam.buchbinder@gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1456389599-14349-1-git-send-email-adam.buchbinder@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Adam Buchbinder <adam.buchbinder@gmail.com>
Cc: linux-m68k@lists.linux-m68k.org, trivial@kernel.org


> diff --git a/arch/m68k/include/asm/mac_iop.h b/arch/m68k/include/asm/mac_iop.h
> index fde874a..df3ea1a 100644
> --- a/arch/m68k/include/asm/mac_iop.h
> +++ b/arch/m68k/include/asm/mac_iop.h
> @@ -48,7 +48,7 @@
>  
>  /* IOP message status codes */
>  
> -#define IOP_MSGSTATUS_UNUSED	0	/* Unusued message structure       */
> +#define IOP_MSGSTATUS_UNUSED	0	/* Unused message structure       */
>  #define IOP_MSGSTATUS_WAITING	1	/* waiting for channel             */
>  #define IOP_MSGSTATUS_SENT	2	/* message sent, awaiting reply    */
>  #define IOP_MSGSTATUS_COMPLETE	3	/* message complete and reply rcvd */

I'd prefer that the length of the line is not reduced, so that the ends of 
the lines remain flush.

-- 
