Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 166B6C433F5
	for <linux-m68k@archiver.kernel.org>; Fri, 15 Oct 2021 06:27:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EA9146008E
	for <linux-m68k@archiver.kernel.org>; Fri, 15 Oct 2021 06:27:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234369AbhJOG3r (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 15 Oct 2021 02:29:47 -0400
Received: from mail-ua1-f41.google.com ([209.85.222.41]:37559 "EHLO
        mail-ua1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234327AbhJOG3q (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 15 Oct 2021 02:29:46 -0400
Received: by mail-ua1-f41.google.com with SMTP id f4so16002136uad.4
        for <linux-m68k@lists.linux-m68k.org>; Thu, 14 Oct 2021 23:27:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zLWrh2HbN7U/0CA4mkAltroII0u8oVmRY36amHD0pU8=;
        b=ARasHvr1vZNK3joj99cBMn7YqxN+eBXawq2+XKwwZK2vw5rmXTeV8CTzPN5G13pv9m
         9LEQqb9+1VPu1revPHvqSR9aiDJk/IWGHJgJrd4+Y08HpL5WfwqZqA1RF1To4VWh4PQv
         DFna3mUdgmTzQ0XiNq4GN9CliROLEK/B20IdnR8/y6RYD2aMtsaD3aidukmEzzxvMhaB
         4a/H7JUdJ82eBPgd+UmKcT6kmITvTGTwxzlj7ilj1/VaLEMyVcdMtcQtU9PRFwqnEtsB
         Pzda5kPzdQ/a3ISl414rMQVfMr7+9mVMvJyDRAp9Ab0s7xNuqVByAgjXQeF940anQhxw
         Lz2A==
X-Gm-Message-State: AOAM531rWaXUAeAjWyotLHX1fIUhyMsbj7eyh76TiVbqhucaSY7k/L+V
        2ml9zKtX2KeRZxhjbMsSuB0wtU+kX/PQYA==
X-Google-Smtp-Source: ABdhPJyG8tu01a8LqRUNOKUTA/ufa5W5VVN16Huq+c+ZyN3hFxnIOwMZsScXrcEPGuWgWv0ZC395Kw==
X-Received: by 2002:a67:ec55:: with SMTP id z21mr12160121vso.29.1634279260038;
        Thu, 14 Oct 2021 23:27:40 -0700 (PDT)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id f26sm3299655uaq.11.2021.10.14.23.27.39
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Oct 2021 23:27:39 -0700 (PDT)
Received: by mail-ua1-f44.google.com with SMTP id h4so16063629uaw.1
        for <linux-m68k@lists.linux-m68k.org>; Thu, 14 Oct 2021 23:27:39 -0700 (PDT)
X-Received: by 2002:a67:cb0a:: with SMTP id b10mr12377426vsl.9.1634279259068;
 Thu, 14 Oct 2021 23:27:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210729022053.134453-1-jk@codeconstruct.com.au>
 <20210729022053.134453-5-jk@codeconstruct.com.au> <20211014183456.GA8474@asgard.redhat.com>
In-Reply-To: <20211014183456.GA8474@asgard.redhat.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 15 Oct 2021 08:27:27 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVJusoGEe-+eLnA5zKJ79Z4uRYVePTFsa6WVfKDqwmySw@mail.gmail.com>
Message-ID: <CAMuHMdVJusoGEe-+eLnA5zKJ79Z4uRYVePTFsa6WVfKDqwmySw@mail.gmail.com>
Subject: Re: [PATCH net-next v4 04/15] mctp: Add sockaddr_mctp to uapi
To:     Eugene Syromiatnikov <esyr@redhat.com>
Cc:     Jeremy Kerr <jk@codeconstruct.com.au>,
        netdev <netdev@vger.kernel.org>,
        Matt Johnston <matt@codeconstruct.com.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        Jakub Kicinski <kuba@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Fri, Oct 15, 2021 at 12:32 AM Eugene Syromiatnikov <esyr@redhat.com> wrote:
> On Thu, Jul 29, 2021 at 10:20:42AM +0800, Jeremy Kerr wrote:
> > This change introduces the user-visible MCTP header, containing the
> > protocol-specific addressing definitions.
>
> [...]
>
> > --- a/include/uapi/linux/mctp.h
> > +++ b/include/uapi/linux/mctp.h
> > @@ -9,7 +9,28 @@
> >  #ifndef __UAPI_MCTP_H
> >  #define __UAPI_MCTP_H
> >
> > +#include <linux/types.h>
> > +
> > +typedef __u8                 mctp_eid_t;
> > +
> > +struct mctp_addr {
> > +     mctp_eid_t              s_addr;
> > +};
> > +
> >  struct sockaddr_mctp {
> > +     unsigned short int      smctp_family;
>
> This gap makes the size of struct sockaddr_mctp 2 bytes less at least
> on m68k, are you fine with that?
>
> > +     int                     smctp_network;
> > +     struct mctp_addr        smctp_addr;
> > +     __u8                    smctp_type;
> > +     __u8                    smctp_tag;

And it may be wise to add 1 byte of explicit padding here?
Or is there a good reason not to do so?

> >  };

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
