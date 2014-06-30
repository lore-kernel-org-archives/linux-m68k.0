From: Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: [PATCH] Fixes q40_irq_startup to return -ENXIO
Date: Mon, 30 Jun 2014 19:27:55 +0200
Message-ID: <871tu6ux2c.fsf@igel.home>
References: <1404097610-5739-1-git-send-email-xerofoify@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1404097610-5739-1-git-send-email-xerofoify@gmail.com> (Nicholas
	Krause's message of "Sun, 29 Jun 2014 23:06:50 -0400")
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Nicholas Krause <xerofoify@gmail.com>
Cc: geert@linux-m68k.org, linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org

Nicholas Krause <xerofoify@gmail.com> writes:

> Fixes q40_irq_startup to return -ENXIO for cases 11-13 in the switch
> statement of this function to handle these failure cases.
>
> Signed-off-by: Nicholas Krause <xerofoify@gmail.com>
> ---
>  arch/m68k/q40/q40ints.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/m68k/q40/q40ints.c b/arch/m68k/q40/q40ints.c
> index 513f9bb..9dfa1ea 100644
> --- a/arch/m68k/q40/q40ints.c
> +++ b/arch/m68k/q40/q40ints.c
> @@ -49,7 +49,7 @@ static unsigned int q40_irq_startup(struct irq_data *data)
>  	case 1: case 2: case 8: case 9:
>  	case 11: case 12: case 13:
>  		printk("%s: ISA IRQ %d not implemented by HW\n", __func__, irq);
> -		/* FIXME return -ENXIO; */
> +		return -ENXIO;

There must be more to it, given the FIXME.

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
"And now for something completely different."
