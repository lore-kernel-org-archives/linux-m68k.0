From: Jiri Kosina <jkosina@suse.cz>
Subject: Re: [PATCH] [TRIVIAL] 8250_hp300: Fix warning typo 'CONFIG_8250'
Date: Tue, 8 Nov 2011 10:26:31 +0100 (CET)
Message-ID: <alpine.LNX.2.00.1111081025470.1964@pobox.suse.cz>
References: <1320673476.14409.367.camel@x61.thuisdomein>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1320673476.14409.367.camel@x61.thuisdomein>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Paul Bolle <pebolle@tiscali.nl>
Cc: linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@lists.linux-m68k.org, Alan Cox <alan@linux.intel.com>, Greg Kroah-Hartman <gregkh@suse.de>

On Mon, 7 Nov 2011, Paul Bolle wrote:

> Signed-off-by: Paul Bolle <pebolle@tiscali.nl>
> ---
> 0) This patch is untested: I have neither the hardware nor the toolchain
> needed. It should be correct (though it makes an already too long line
> even longer). Nevertheless I think a proper solution is a patch that
> drops this warning entirely. I've CC'd the m68k people for further
> feedback.
> 
> 1) If SERIAL_8250_HP300 is set but neither HPDCA nor HPAPCI are set we
> end up with an elaborate nop, don't we? Initialization should always
> fail in that case. So effectively SERIAL_8250_HP300 depends on HPDCA
> and/or HPAPCI. Was there perhaps some problem in translating that
> dependency into a Kconfig dependency?
> 
> 2) Related question: is it useful to have both HPDCA and HPAPCI set?
> 
>  drivers/tty/serial/8250_hp300.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/drivers/tty/serial/8250_hp300.c b/drivers/tty/serial/8250_hp300.c
> index c13438c..dc41fbb 100644
> --- a/drivers/tty/serial/8250_hp300.c
> +++ b/drivers/tty/serial/8250_hp300.c
> @@ -21,7 +21,7 @@
>  #include "8250.h"
>  
>  #if !defined(CONFIG_HPDCA) && !defined(CONFIG_HPAPCI)
> -#warning CONFIG_8250 defined but neither CONFIG_HPDCA nor CONFIG_HPAPCI defined, are you sure?
> +#warning CONFIG_SERIAL_8250 defined but neither CONFIG_HPDCA nor CONFIG_HPAPCI defined, are you sure?
>  #endif

What is the point of this warning anyway? Shouldn't everything necessary 
be taken care of by Kconfig rules?

-- 
Jiri Kosina
SUSE Labs
