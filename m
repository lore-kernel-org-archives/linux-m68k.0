From: Philippe Ombredanne <pombredanne@nexb.com>
Subject: Re: [PATCH v3 14/14] nubus: Add support for the driver model
Date: Thu, 7 Dec 2017 10:57:41 +0100
Message-ID: <CAOFm3uGWw0_Dvt0k533g8ovVyz0ehHZi6fSXC4jSpq3JjQCyAg@mail.gmail.com>
References: <cover.1512454057.git.fthain@telegraphics.com.au> <5c71aa72f8c6192ca472b103555cad7441974f71.1512454057.git.fthain@telegraphics.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-wr0-f194.google.com ([209.85.128.194]:35685 "EHLO
        mail-wr0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752214AbdLGJ6X (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Thu, 7 Dec 2017 04:58:23 -0500
Received: by mail-wr0-f194.google.com with SMTP id g53so6816101wra.2
        for <linux-m68k@vger.kernel.org>; Thu, 07 Dec 2017 01:58:23 -0800 (PST)
In-Reply-To: <5c71aa72f8c6192ca472b103555cad7441974f71.1512454057.git.fthain@telegraphics.com.au>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Finn,

On Tue, Dec 5, 2017 at 7:20 AM, Finn Thain <fthain@telegraphics.com.au> wrote:
> This patch brings basic support for the Linux Driver Model to the
> NuBus subsystem.
>
> For flexibility, the matching of boards with drivers is left up to the
> drivers. This is also the approach taken by NetBSD. A board may have
> many functions, and drivers may have to consider many functional
> resources and board resources in order to match a device.
>
> This implementation does not bind drivers to resources (nor does it bind
> many drivers to the same board). Apple's NuBus declaration ROM design
> is flexible enough to allow that, but I don't see a need to support it
> as we don't use the "slot zero" resources (in the main logic board ROM).
>
> Eliminate the global nubus_boards linked list by rewriting the procfs
> board iterator around bus_for_each_dev(). Hence the nubus device refcount
> can be used to determine the lifespan of board objects.
>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Tested-by: Stan Johnson <userm57@yahoo.com>
> Signed-off-by: Finn Thain <fthain@telegraphics.com.au>
>
> ---
> The conversion of Mac network drivers from the Space.c convention to
> the Driver Model takes place in a separate patch series, archived at
> https://lkml.org/lkml/2017/11/11/25
> That series motivates parts of this design, such as the definition of
> 'for_each_board_func_rsrc'.
[]
> diff --git a/drivers/nubus/bus.c b/drivers/nubus/bus.c
> new file mode 100644
> index 000000000000..b5045e639b4d
> --- /dev/null
> +++ b/drivers/nubus/bus.c
> @@ -0,0 +1,119 @@
> +/*
> + * Bus implementation for the NuBus subsystem.
> + *
> + * Copyright (C) 2017 Finn Thain
> + *
> + * SPDX-License-Identifier: GPL-2.0
> + */

I think the SPDX id should be on the first line using C++-style // comments.
See tglx's doc patches and Linus posts explaining why he wants it this way!

-- 
Cordially
Philippe Ombredanne
