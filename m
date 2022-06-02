Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80D8BC433EF
	for <linux-m68k@archiver.kernel.org>; Thu,  2 Jun 2022 19:10:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238416AbiFBTKm (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 2 Jun 2022 15:10:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238427AbiFBTKm (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 2 Jun 2022 15:10:42 -0400
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EE0B2706
        for <linux-m68k@lists.linux-m68k.org>; Thu,  2 Jun 2022 12:10:41 -0700 (PDT)
Received: by mail-qt1-f180.google.com with SMTP id x7so4070680qta.6
        for <linux-m68k@lists.linux-m68k.org>; Thu, 02 Jun 2022 12:10:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XtWDo4MTVxUub0OsqsFcXGlMn8SJu8w5e+LETPN1X5w=;
        b=xHyVLEkYU/GVFq/95e6UI2xO4fGgGUULrDZowHZrhCO+V9AF6YXYAWHOTcXYlNVXzv
         qRDdo9Y0fthm9MOSpJMiXdC0QVtl3lcOrNxZP+eWYUkIJ8kXl9tYh/0LwBQvFsPuIL6P
         Xaor7UaRFmoy4zAd8wSrycFF8hfV8jBlr5y+hNkG2sY8tXHx+GRvHrgLWw195i+t7l/j
         vKdVEaa+HZIO5MKr9WoF+5dbyVgHRR/syADahZR5lMB6y1ujshTVTZS+Xk6uCZCsXe5T
         wETYNd0zj8G6SCxpojTPCL9qmHeBSTJjN9oxqtj/w/m5xJJMRw0PWWlIKmKcp9yCRzQF
         WtnA==
X-Gm-Message-State: AOAM531kZfY8E/5pL0VVi6UDXul6fZSiUk8arL/XFi2J6MK6Hkez4Roi
        26/WVsguS65IpmWI/stOim1mmaR1Yzq4RA==
X-Google-Smtp-Source: ABdhPJx9mAwlcWcjVhPLMZaz5Dvlpdb8PLBEy5rZHGrm/BXie4Z6xhPil4zLjuIkDD7T6nZ4aLV8xA==
X-Received: by 2002:a05:622a:a:b0:304:da33:ef45 with SMTP id x10-20020a05622a000a00b00304da33ef45mr1939196qtw.411.1654197039879;
        Thu, 02 Jun 2022 12:10:39 -0700 (PDT)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com. [209.85.128.173])
        by smtp.gmail.com with ESMTPSA id x16-20020a376310000000b0069fc13ce209sm3865023qkb.58.2022.06.02.12.10.39
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jun 2022 12:10:39 -0700 (PDT)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-30ce6492a60so61247077b3.8
        for <linux-m68k@lists.linux-m68k.org>; Thu, 02 Jun 2022 12:10:39 -0700 (PDT)
X-Received: by 2002:a0d:f801:0:b0:30f:f716:2950 with SMTP id
 i1-20020a0df801000000b0030ff7162950mr3084004ywf.358.1654197038940; Thu, 02
 Jun 2022 12:10:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220602180919.4856-1-wangxiang@cdjrlc.com>
In-Reply-To: <20220602180919.4856-1-wangxiang@cdjrlc.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 2 Jun 2022 21:10:27 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWroxsXvgon34voezjW5HE8mcqB_FEZY5DXi0z_CBpfWg@mail.gmail.com>
Message-ID: <CAMuHMdWroxsXvgon34voezjW5HE8mcqB_FEZY5DXi0z_CBpfWg@mail.gmail.com>
Subject: Re: [PATCH] m68k: Fix syntax errors in comments
To:     Xiang wangx <wangxiang@cdjrlc.com>
Cc:     Greg Ungerer <gerg@linux-m68k.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Xiang,

On Thu, Jun 2, 2022 at 8:09 PM Xiang wangx <wangxiang@cdjrlc.com> wrote:
> Delete the redundant word 'the'.
>
> Signed-off-by: Xiang wangx <wangxiang@cdjrlc.com>

Thanks for your patch!

> --- a/arch/m68k/coldfire/intc-2.c
> +++ b/arch/m68k/coldfire/intc-2.c
> @@ -7,7 +7,7 @@
>   * family, the 5270, 5271, 5274, 5275, and the 528x family which have two such
>   * controllers, and the 547x and 548x families which have only one of them.
>   *
> - * The external 7 fixed interrupts are part the the Edge Port unit of these
> + * The external 7 fixed interrupts are part the Edge Port unit of these

I think "the the" should be replaced by "of the" instead.

>   * ColdFire parts. They can be configured as level or edge triggered.
>   *
>   * (C) Copyright 2009-2011, Greg Ungerer <gerg@snapgear.com>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
