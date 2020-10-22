Return-Path: <SRS0=bR5W=D5=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82A37C4363A
	for <linux-m68k@archiver.kernel.org>; Thu, 22 Oct 2020 07:26:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 325C022248
	for <linux-m68k@archiver.kernel.org>; Thu, 22 Oct 2020 07:26:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2506383AbgJVH0R (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 22 Oct 2020 03:26:17 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:38246 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2506381AbgJVH0R (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 22 Oct 2020 03:26:17 -0400
Received: by mail-ot1-f65.google.com with SMTP id i12so653862ota.5
        for <linux-m68k@lists.linux-m68k.org>; Thu, 22 Oct 2020 00:26:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3Wxh2epYIQKmtNhH8kprT0IWQ1xSVOnzFhZ8V7tLn1Q=;
        b=ryK7G3MYSERq0pePfLu33a4Lu9d6Xxam2PKDNOGWkX2Som0QhFpsa/gWbP53zM4A0z
         1OYKVeqfa0oU7+Mll2jx3pVbsbUkEMCtVZdS137fXJfTBxFC53mrapEb4syCF0Yh2zT1
         Hcz4ju/wcfD+h72YLJcdFbtgyTZxOn3KxPeR96zRQyE1FdMhoR3CPX2fGOhF+AV0j3OZ
         yG0+YsrExMnTWikLEH6RNlYfltxi0WIqelH4yqAou9p6i8p5fxHkkbl2zo6gbPH1mGk0
         1aTVu6csZRKEqPTEz4Hjysag/9HYgSo0dD9mM6/0C/ljaWl2Rr7LE8WMbH+jVZIWAbYb
         5xbg==
X-Gm-Message-State: AOAM532sLDzmlc3s2Wy06ygTycvuV7B5RUxRtnXPxgHXCKCR9ip3sHaN
        3xPY4xh7RjlmXmf6HX5XUSWMq0shYmWb446bbm4=
X-Google-Smtp-Source: ABdhPJxGwfErK94xEQ3A0uDcFKrh7oRH1svDTCHCvVb/UVtVDzV0FiL4WgSrbdWmiHb1vwP4iHuXwNlKlysGBU3e9MY=
X-Received: by 2002:a9d:3b76:: with SMTP id z109mr1009002otb.250.1603351576916;
 Thu, 22 Oct 2020 00:26:16 -0700 (PDT)
MIME-Version: 1.0
References: <20201020162303.1730562-1-laurent@vivier.eu> <20201020162844.GA865546@kroah.com>
 <468bbbef-4745-3b16-b6f4-30b46ebcdc33@vivier.eu> <20201020173745.GA882703@kroah.com>
 <387fd2aa-b181-c41f-0581-0a7e79a44e41@vivier.eu> <20201020183246.GA912431@kroah.com>
 <b52e7fde-8874-3c53-ca13-7709656b69fb@vivier.eu> <20201020224446.GA15066@allandria.com>
 <alpine.LNX.2.23.453.2010211038390.6@nippy.intranet> <311d17ed-75fa-a7fe-6c70-177a6eec4519@vivier.eu>
 <alpine.LNX.2.23.453.2010221347000.6@nippy.intranet>
In-Reply-To: <alpine.LNX.2.23.453.2010221347000.6@nippy.intranet>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 22 Oct 2020 09:26:05 +0200
Message-ID: <CAMuHMdVbo2C1yZ5E_A3L8J1zZigO8i8m5AFUTn9SjbY1sx16kA@mail.gmail.com>
Subject: Re: [PATCH] serial: pmac_zilog: don't init if zilog is not available
To:     Finn Thain <fthain@telegraphics.com.au>
Cc:     Laurent Vivier <laurent@vivier.eu>,
        Brad Boyer <brad@allandria.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Joshua Thompson <funaho@jurai.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Paul Mackerras <paulus@samba.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Michael Ellerman <mpe@ellerman.id.au>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Finn,

On Thu, Oct 22, 2020 at 5:23 AM Finn Thain <fthain@telegraphics.com.au> wrote:
> The patch below seems to fix the problem for me. Does it work on your
> system(s)?

Thanks for your patch!

> --- a/arch/m68k/mac/config.c
> +++ b/arch/m68k/mac/config.c
> @@ -776,16 +776,12 @@ static struct resource scc_b_rsrcs[] = {
>  struct platform_device scc_a_pdev = {
>         .name           = "scc",
>         .id             = 0,
> -       .num_resources  = ARRAY_SIZE(scc_a_rsrcs),
> -       .resource       = scc_a_rsrcs,
>  };
>  EXPORT_SYMBOL(scc_a_pdev);
>
>  struct platform_device scc_b_pdev = {
>         .name           = "scc",
>         .id             = 1,
> -       .num_resources  = ARRAY_SIZE(scc_b_rsrcs),
> -       .resource       = scc_b_rsrcs,
>  };
>  EXPORT_SYMBOL(scc_b_pdev);
>
> @@ -812,10 +808,15 @@ static void __init mac_identify(void)
>
>         /* Set up serial port resources for the console initcall. */
>
> -       scc_a_rsrcs[0].start = (resource_size_t) mac_bi_data.sccbase + 2;
> -       scc_a_rsrcs[0].end   = scc_a_rsrcs[0].start;
> -       scc_b_rsrcs[0].start = (resource_size_t) mac_bi_data.sccbase;
> -       scc_b_rsrcs[0].end   = scc_b_rsrcs[0].start;
> +       scc_a_rsrcs[0].start     = (resource_size_t)mac_bi_data.sccbase + 2;
> +       scc_a_rsrcs[0].end       = scc_a_rsrcs[0].start;
> +       scc_a_pdev.num_resources = ARRAY_SIZE(scc_a_rsrcs);
> +       scc_a_pdev.resource      = scc_a_rsrcs;
> +
> +       scc_b_rsrcs[0].start     = (resource_size_t)mac_bi_data.sccbase;
> +       scc_b_rsrcs[0].end       = scc_b_rsrcs[0].start;
> +       scc_b_pdev.num_resources = ARRAY_SIZE(scc_b_rsrcs);
> +       scc_b_pdev.resource      = scc_b_rsrcs;

I can't say I'm a fan of this...

>
>         switch (macintosh_config->scc_type) {
>         case MAC_SCC_PSC:
> diff --git a/drivers/tty/serial/pmac_zilog.c b/drivers/tty/serial/pmac_zilog.c
> index 96e7aa479961..95abdb305d67 100644
> --- a/drivers/tty/serial/pmac_zilog.c
> +++ b/drivers/tty/serial/pmac_zilog.c
> @@ -1697,18 +1697,17 @@ extern struct platform_device scc_a_pdev, scc_b_pdev;

The real issue is this "extern struct platform_device scc_a_pdev, scc_b_pdev",
circumventing the driver framework.

Can we get rid of that?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
