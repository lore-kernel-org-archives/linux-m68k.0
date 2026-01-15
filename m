Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5E683BB9EB
	for <linux-m68k@lists.linux-m68k.org>; Thu, 15 Jan 2026 16:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768494534; cv=none; b=tVdVrEQwsHh5J/iafGEEPZOcInAhX8UoeWomrUWzE3ozDjlfY/3CGYb3Q9+lLtn8DigMqJxs917eslIXKSoRPfgzaSoFhXNXSyU8vtTRv8fDjjSqy1qWd9L3AdDkO0W0BgD/ba+yGkUBG5rHKmtz+gTNjpenIJXuYTtENGpuXdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768494534; c=relaxed/simple;
	bh=JFb4SbeyltssbTkVrC2fePq+++qLD9rMapcGslFduHk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SHsJDH81oLL1ZqoSGl3ew8bCPiLNvvvFswlC8w8HihTIVgs9fpqfVvhZGJpolTX/jUVfR2Y2tnSGf0KrfwulBtBZ9kKgJcea6PTCvElmkhz1ccGNNpXNnKw18rv95bB4EoshRkzW+G5d8VsHdNYXVZRN+3qcQTenYH6+pMQl2p8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=EF/n63xX; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="EF/n63xX"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-432d2c7dd52so967716f8f.2
        for <linux-m68k@lists.linux-m68k.org>; Thu, 15 Jan 2026 08:28:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768494529; x=1769099329; darn=lists.linux-m68k.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=URJX5xTHolO9FC46ryjpGruJ5TGEDEyfrbwATuqwgLQ=;
        b=EF/n63xX9urv1si9oxfDYL5fehqTsiHqF9dzb7TJaJeIqCPpo4e092rWQIL3OWqrU8
         ZTU3RHw7qLZak7vZTnz0EugrT3zVJmz8n+4hm+oyWSTg2HQ39L1QcxW8zfAjzhZbZj10
         FJT9up4qIckNmvBDWp+plig/BMn2WJTut3nWzDljU//SjqhFh7mOEcVa2MarY2vPdXCZ
         EfPWUNCLRlN9hXGbsFa0VJ5YWjsmBFPJe5AMP7gY7pTB4XGKSOK7QvvX8ce9zx5ri037
         y12kiKg/L84F9YhgI/3J5tfE6qgsUqWAjIZ1fxXeRRhpvlx0yq9+CE8UCE9PqMxUGe/2
         3AfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768494529; x=1769099329;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=URJX5xTHolO9FC46ryjpGruJ5TGEDEyfrbwATuqwgLQ=;
        b=J+uP2ppW0dTMA15Sflfp1eEapqqaFeEliaRNIa5TI8M7eWEN5a0o2KoDHiOgm7IkIb
         d6TYLZSokxuTE8eYLLLq/1KUxXGYzX90a/KU1Ug61toWuBn/U1JQPAb8viEjsZjbhOcg
         vHxXeA7KdzPJ7i3EA6au6EEePsV4BkQWk40lOIFn12UTo4raEbOramiKOKm+wT5Y2wB0
         QzsZNSbU31jJcb2nXcQZa5KTR0MdkQ1jEm5Ad13nlfw8S36CLtzMrJB3+rrhV91Cf+xx
         Zm8bkpACsdoEJzNU6DApxM9kVZA40SOqn9c9qlbGEn2Q7NHfPCnhi8WVg3K76ZQOpQ0w
         GpoQ==
X-Forwarded-Encrypted: i=1; AJvYcCUWYR4mxMC6efJ311bqCLbsrxH7ri1nHLNHmVYatHhiyV36iDQ1V+jw8NyqinyZOwoYf5WaiKmBqzXR@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YyE1DLG5pRlgJKJZ+hRLQhQ3NfgfOCqu9TxE/9H+iR1jViWFrz8
	O/tHBhjS7Xk++SosNGjLCfOBVNxJxpp+D9GNarPmjigJ3bVB8qWCioOn3fyDM9tXx1U=
X-Gm-Gg: AY/fxX7Sb5RNKQDHEwmrZTiafx+yoOGStmXIzQR4L/JeJMwes8pU0U/ASpyddN1hXWk
	qXG0CGR+4SHfYsJt63LbKv4Dp1sIhlM0J+NWPeMQNV9HEhqR7Xr1UmMD7eCpcQHS0/1Y1Vo2OnY
	7nD30mPK5kqwrK7pZEIjCS2Nr2iwiZkhTJuAWyhBX1agu0tWlhzRZ5GNxT3vybVaI+PtC7hkPtI
	0IYVtThAY6oZZn3hohyX+WrwH/3SEjuFrT9iqeSEEa+BO4JtLdVtJ3jf3BqtyBQRBcG7/B81quS
	BvrvnD7/wrX2xRRNhcEHUecOYwEUoXqPd90rTCuCz1AeX0Y2nz8HqZaM+XyMYbSRoKxiT0Qx7gb
	1KgLNGvcS+GwB8TNWUuhgDExPerHBiVvLLxRpOyZJwr3M0555E51XSwsmzkZsSSROY0Nfp1MPIB
	tMVJc/dRlaD06e3Q==
X-Received: by 2002:a5d:64c5:0:b0:430:fd0f:2910 with SMTP id ffacd0b85a97d-4342c501a57mr9777353f8f.26.1768494528600;
        Thu, 15 Jan 2026 08:28:48 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-434af6e148bsm6604069f8f.33.2026.01.15.08.28.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 08:28:47 -0800 (PST)
Date: Thu, 15 Jan 2026 17:28:44 +0100
From: Petr Mladek <pmladek@suse.com>
To: Marcos Paulo de Souza <mpdesouza@suse.com>
Cc: Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jason Wessel <jason.wessel@windriver.com>,
	Daniel Thompson <danielt@kernel.org>,
	Douglas Anderson <dianders@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	John Ogness <john.ogness@linutronix.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Jiri Slaby <jirislaby@kernel.org>, Breno Leitao <leitao@debian.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Andreas Larsson <andreas@gaisler.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>, linux-um@lists.infradead.org,
	linux-kernel@vger.kernel.org, kgdb-bugreport@lists.sourceforge.net,
	linux-serial@vger.kernel.org, netdev@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org, linux-hardening@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH 16/19] drivers: tty: serial: ma35d1_serial: Migrate to
 register_console_force helper
Message-ID: <aWkVvCu74HhV7W9s@pathway.suse.cz>
References: <20251227-printk-cleanup-part3-v1-0-21a291bcf197@suse.com>
 <20251227-printk-cleanup-part3-v1-16-21a291bcf197@suse.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251227-printk-cleanup-part3-v1-16-21a291bcf197@suse.com>

On Sat 2025-12-27 09:16:23, Marcos Paulo de Souza wrote:
> The register_console_force function was introduced to register consoles
> even on the presence of default consoles, replacing the CON_ENABLE flag
> that was forcing the same behavior.
> 
> No functional changes.
> 
> Signed-off-by: Marcos Paulo de Souza <mpdesouza@suse.com>
> ---
>  drivers/tty/serial/ma35d1_serial.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/tty/serial/ma35d1_serial.c b/drivers/tty/serial/ma35d1_serial.c
> index 285b0fe41a86..d1e03dee5579 100644
> --- a/drivers/tty/serial/ma35d1_serial.c
> +++ b/drivers/tty/serial/ma35d1_serial.c
> @@ -633,7 +633,7 @@ static struct console ma35d1serial_console = {
>  	.write   = ma35d1serial_console_write,
>  	.device  = uart_console_device,
>  	.setup   = ma35d1serial_console_setup,
> -	.flags   = CON_PRINTBUFFER | CON_ENABLED,
> +	.flags   = CON_PRINTBUFFER,
>  	.index   = -1,
>  	.data    = &ma35d1serial_reg,
>  };
> @@ -657,7 +657,7 @@ static void ma35d1serial_console_init_port(void)
>  static int __init ma35d1serial_console_init(void)
>  {
>  	ma35d1serial_console_init_port();
> -	register_console(&ma35d1serial_console);
> +	register_console_force(&ma35d1serial_console);

Sigh, I am afraid that this is not enough.

I double checked how "ma35d1serial_console" was used. I guess
that it could get registered also via the generic uart device
driver code. I see the following:

#ifdef CONFIG_SERIAL_NUVOTON_MA35D1_CONSOLE
[...]
#define MA35D1SERIAL_CONSOLE    (&ma35d1serial_console)
#else
#define MA35D1SERIAL_CONSOLE    NULL
#endif

static struct uart_driver ma35d1serial_reg = {
[...]
	.cons         = MA35D1SERIAL_CONSOLE,
[...]
};

static int __init ma35d1serial_init(void)
{
[...]
	ret = uart_register_driver(&ma35d1serial_reg);
[...]
	ret = platform_driver_register(&ma35d1serial_driver);
[...]
}

And the gneric code:

uart_configure_port(struct uart_driver *drv, struct uart_state *state,
		    struct uart_port *port)
{
[...]
		/*
		 * If this driver supports console, and it hasn't been
		 * successfully registered yet, try to re-register it.
		 * It may be that the port was not available.
		 */
		if (port->cons && !console_is_registered(port->cons))
			register_console(port->cons);

[...]
}

, which can called via from:

  + mux_probe()
    + uart_add_one_port()
      + serial_ctrl_register_port()
	+serial_core_register_port()
	  + serial_core_add_one_port()
	    + uart_configure_port()
	      + register_console()


Honestly, I am not 100% sure. The struct console is assigned to
.cons in struct uart_driver. And uart_configure_port() function
passes port->cons from struct uart_port *port. But I believe
that they can get assigned somewhere in the maze of
the init/probe code.

I would feel more comfortable if we kept the information as
as flag in struct console so that even the generic callbacks
could use it.

Anyway, it makes sense to create a sepate flag for this
purpose, e.g. CON_FORCE or CON_FORCE_ENABLE.

>  	return 0;
>  }
>  console_initcall(ma35d1serial_console_init);

Best Regards,
Petr
