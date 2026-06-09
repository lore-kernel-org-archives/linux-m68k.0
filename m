Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 991F31D0DEE
	for <linux-m68k@lists.linux-m68k.org>; Tue,  9 Jun 2026 06:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780988374; cv=none; b=rE5nLX+neFbN565MyaNbg4Pn2mKCt0ahl6fac+a/+DlhR/oVNnO4zQ3UTWF+mERR3c5FfL/P32bQ8W3CTZWy2DKuoQfz1ALeOH5JtZ6e95H2QtZeAWCVjtDQDgtAqYMZIHbRjWwwpONzRIJKlWnynyf1EsAd3bXtQqEW8VlPYZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780988374; c=relaxed/simple;
	bh=USxDlh+cTOmctRbVLXUwHBHqPmHhLde8bvmv+bZmeZo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZLefwFp5UMGGwmHeJsKZpdhDB3iMKaU2z//HMCzNEEMUzdXI9JzUFV4FstMHQAKpC8ipWvoJAxWRb8CL6aUo2POeUoxv6CDUnEYKupnB/8QuUJbwhSEpWJ0iJnmPGJcQojMEN4gDDyaZs3qV2AONHNYw1RJwUN0IpRrB9zHBVas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-486621f0adbso3823289b6e.2
        for <linux-m68k@lists.linux-m68k.org>; Mon, 08 Jun 2026 23:59:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780988372; x=1781593172;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cfrTmKBa/6XQOKTJVCGFPY/9uy59Ow4t/P5iBf4xoKk=;
        b=cjKfBkkNMqKVPN8yGTb9PXi5e0zuwrDiIdBqEEsIfEm+HU/5eiK6OF79m+xzTO/cdg
         xCUnn1LPVT6aRbzvcGyUSNxm13c6XdIAKEsM4Y75iRanNd00dYkpljdSn5nMAlD/BeAP
         qPollutzpvMz5c8xUwy/PM75dKLrIuA2keaqiRhxniskcT5KpSON47aZ408lDLFcj/yR
         WxOp6H3UquGZKh0GagJce4dHzWk21MbLzwO+oXCwg6+usVhVICCZ96UCvleRKVNCQxyS
         88mMLhk70JyxKGaFVbBMwwbXMmlqsPZl0FOmF6lWfYLS560lVWMHRnkNE1xHr62uCYVE
         fGTw==
X-Forwarded-Encrypted: i=1; AFNElJ+YtdnkGnlb3kDEypJRI5EPuHe7V7R3aLAzddvqyMqxP3i+oMgZv595WuYYeQoyMbmw5JBZEJZsqlUc@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Ywe+EmVb2tONFXAWQrxP2gXcDhSXYtjy0sILAWkAKY6E6AxT00m
	S9dOgYVQ2rrWtwUHXGLgLIIRF0DQ2JMamarBIrpPT43cvGup7XSpmw+ZLx838/aB
X-Gm-Gg: Acq92OEjwDM8Ut3CPjv3cwgqMlW0xQv/36fSBTFYx7aiMUNIeKKGBP9eDdRaIVQxB83
	HSAPvqoCDd6JsmQZjXZNuInDgYFHIRiHxn+4omzzvlLeot9VDeHF9OSvaxulwDUm+f8yXWt/ZlL
	1ZMN5ZYmVdZQTgJUOh6ePSjmgItrtYUvYzZqzjDNU+f2+abED8X6BHwmwtc+jzqnxoD/pkxMhKO
	GAFXrBvEDgN2OpGFYEUxnSKtl7MEddOiUQMDLaQWfjnkYhZhTk/JcTCgduiCXM7QX6INpN0X67s
	62mtV5mUlZhkFo8IsTdXYNUxI/39ZxZWabu989BS0D3qNLvD2WOOn7ElL4GpcVsTyXkrKFSIhIC
	S7xNmaNTgbg8F2czAOzeDJc4rYDxuNDocJqmKs7+R87wOsM0s8VJei3GG+BeU72K9TD0mVG1vwm
	MJGmPb3tltlPz6+Xkbvc5dXHKPDTlw21J+Zxq9TQhK6rEUWiSaN9K9e2o1rHC8heO5BQ7WSjU=
X-Received: by 2002:a05:6808:1188:b0:467:2f84:b0c6 with SMTP id 5614622812f47-4868dc82420mr11866845b6e.8.1780988372281;
        Mon, 08 Jun 2026 23:59:32 -0700 (PDT)
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com. [209.85.161.46])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4865b7ad946sm15209507b6e.8.2026.06.08.23.59.31
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 23:59:31 -0700 (PDT)
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-69dead44101so3081424eaf.3
        for <linux-m68k@lists.linux-m68k.org>; Mon, 08 Jun 2026 23:59:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9Lm05kzXZB+4AtJ0MY8g/mdJDZliis//EiLxeTLm0lJAsqb5UdenqZZPNQTV6o8Aqi43sR9S5kAxKQ@lists.linux-m68k.org
X-Received: by 2002:a05:6102:94c:b0:6cb:d562:b96a with SMTP id
 ada2fe7eead31-6ff02387516mr9986946137.14.1780988002958; Mon, 08 Jun 2026
 23:53:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260609-acpi_spcr-v2-0-3cd9a3bda727@posteo.de> <20260609-acpi_spcr-v2-1-3cd9a3bda727@posteo.de>
In-Reply-To: <20260609-acpi_spcr-v2-1-3cd9a3bda727@posteo.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 9 Jun 2026 08:53:11 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXH0mR9Sr+ze2_m94uc46_7gubApzWOkf+vUO+w=DmNoQ@mail.gmail.com>
X-Gm-Features: AVVi8Cemo9bnqwwW5sau-L6wcH5-zrPfob50Y8WSYUrCMRB7OtaTQ6EIMHl5BFg
Message-ID: <CAMuHMdXH0mR9Sr+ze2_m94uc46_7gubApzWOkf+vUO+w=DmNoQ@mail.gmail.com>
Subject: Re: [PATCH RESEND v2 1/2] serial: earlycon: add uart_clk_freq parameter
To: Markus Probst <markus.probst@posteo.de>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Ard Biesheuvel <ardb@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-efi@vger.kernel.org, linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Markus,

On Tue, 9 Jun 2026 at 00:40, Markus Probst <markus.probst@posteo.de> wrote:
> Add `uart_clk_freq` parameter to `setup_earlycon`. This allows the
> options string to be reused with `add_preferred_console`, while still
> allowing to set the uart clock frequency. This will be used in the
> following commit ("ACPI: SPCR: Support UART clock frequency field").
>
> No logical change intended.
>
> Signed-off-by: Markus Probst <markus.probst@posteo.de>

> --- a/drivers/tty/serial/earlycon.c
> +++ b/drivers/tty/serial/earlycon.c
> @@ -135,11 +135,14 @@ static int __init parse_options(struct earlycon_device *device, char *options)
>         return 0;
>  }
>
> -static int __init register_earlycon(char *buf, const struct earlycon_id *match)
> +static int __init register_earlycon(char *buf, unsigned int uart_clk_freq,
> +                                   const struct earlycon_id *match)
>  {
>         int err;
>         struct uart_port *port = &early_console_dev.port;
>
> +       port->uartclk = uart_clk_freq;

Who is actually consuming this value?
Earlycon typically works with the serial console, as configured before
Linux boot by the firmware.
The Microsoft doc referenced in patch 2 seem to agree with that:

   "On a system where the BIOS or system firmware uses the serial
    port for console input/output, this table should be used to convey
    information about the settings, to ensure a seamless transition
    between the firmware console output and Windows EMS output."

> +
>         /* On parsing error, pass the options buf to the setup function */
>         if (buf && !parse_options(&early_console_dev, buf))
>                 buf = NULL;

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
