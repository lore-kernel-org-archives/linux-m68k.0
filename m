From: lsorense@csclub.uwaterloo.ca (Lennart Sorensen)
Subject: Re: Fix support for console port other than ttyS0 on mcf.c
Date: Wed, 4 Feb 2009 15:20:09 -0500
Message-ID: <20090204202009.GI26064__23456.5674946227$1233780542$gmane$org@csclub.uwaterloo.ca>
References: <20090204201518.GH26064@csclub.uwaterloo.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20090204201518.GH26064@csclub.uwaterloo.ca>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: linux-m68k@lists.linux-m68k.org

Perhaps CCing linux-m68k@lists.linux-m68k.org would be a good idea.

-- 
Len Sorensen

On Wed, Feb 04, 2009 at 03:15:18PM -0500, Lennart Sorensen wrote:
> Due to a case of backwards logic, mfc.c always makes the console port be
> ttyS0 even when you ask for another port.
> 
> This patch fixes this issue.
> 
> Only when the requested port is NOT in the range 0 to MAXPORTS-1 do we
> force it to be treated as if port 0 was requested.  Forcing the port to
> 0 when it is in fact in the range 0 to MAXPORTS is not helpful.
> 
> Tested with working console on ttyS2 on a 5271evb.
> 
> Signed-off-by: Len Sorensen <lsorense@csclub.uwaterloo.ca>
> 
> diff --git a/drivers/serial/mcf.c b/drivers/serial/mcf.c
> index 56841fe..0eefb07 100644
> --- a/drivers/serial/mcf.c
> +++ b/drivers/serial/mcf.c
> @@ -513,7 +513,7 @@ static int __init mcf_console_setup(struct console *co, char *options)
>         int parity = 'n';
>         int flow = 'n';
> 
> -       if ((co->index >= 0) && (co->index <= MCF_MAXPORTS))
> +       if ((co->index < 0) || (co->index >= MCF_MAXPORTS))
>                 co->index = 0;
>         port = &mcf_ports[co->index].port;
>         if (port->membase == 0)
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
