Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F583C71153
	for <linux-m68k@archiver.kernel.org>; Mon,  4 Sep 2023 09:31:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234386AbjIDJbT convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 4 Sep 2023 05:31:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229731AbjIDJbS (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 4 Sep 2023 05:31:18 -0400
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FA7CC6
        for <linux-m68k@lists.linux-m68k.org>; Mon,  4 Sep 2023 02:31:15 -0700 (PDT)
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-6befdb1f545so1000581a34.3
        for <linux-m68k@lists.linux-m68k.org>; Mon, 04 Sep 2023 02:31:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693819875; x=1694424675;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TG988PTwvScD3wLbWtRomruo1Gx7FVCGpITmTrjaWCc=;
        b=ipf1po8UF1m+9cd0cnDVdwTH4F/lzRRmqkhO0BrwbDrQGc9K0BKtzBkEn0jIDuP/d4
         TUxZ3mvOgNROUC2pmW8UyIp+WSXcaolrxfRBQBdesAJlhgLZwvjWa3Qu86m3jWehS3NK
         80ymQrhxfak5yayuDFyg9Ab/2+JMxBjVwbTnmGySeXfw+TAPmQeQhZfoLi5wLj1EEzW6
         WCX0GYM7jbj3b9OQJ0ZPLg/ty09garJaqEVTvaIRvZ9tKaRZGXOnPNS/QIoOpWk8Tc03
         DtLdGGP98MY8/AaFvqIr4VQQNSwtCMMd50CiOWUB76rxS+dKyKYn7Ggtv5O3IRgQOH4o
         5GGQ==
X-Gm-Message-State: AOJu0YwUaY06BWMSOKVGht6953kVYqXTHFGb4Gt1drjcABnpwxqOKmLF
        QkLqf6xntGyLXUNlmUGvshI8eNWH0QMMqw==
X-Google-Smtp-Source: AGHT+IH7ZSRcRNqsTmjEa7wDA4Nu906oANjnhPe66AqYBnIXk9viBbb79UH7EBhsGd3Tvvww7SAh5A==
X-Received: by 2002:a9d:4f0e:0:b0:6bd:749:f5cc with SMTP id d14-20020a9d4f0e000000b006bd0749f5ccmr10969495otl.26.1693819874559;
        Mon, 04 Sep 2023 02:31:14 -0700 (PDT)
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com. [209.85.167.178])
        by smtp.gmail.com with ESMTPSA id d23-20020a056830139700b006bf219db15dsm4368913otq.31.2023.09.04.02.31.14
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Sep 2023 02:31:14 -0700 (PDT)
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-3a9ee3c7dbbso930155b6e.1
        for <linux-m68k@lists.linux-m68k.org>; Mon, 04 Sep 2023 02:31:14 -0700 (PDT)
X-Received: by 2002:a05:6358:2812:b0:133:595:1c with SMTP id
 k18-20020a056358281200b001330595001cmr9719035rwb.31.1693819874112; Mon, 04
 Sep 2023 02:31:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230831121623.36293-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20230831121623.36293-1-andriy.shevchenko@linux.intel.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 4 Sep 2023 11:31:03 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVoDDV-VgPJL75u_t3KeAPhb1xEFX2VigVC3oS51pG6wA@mail.gmail.com>
Message-ID: <CAMuHMdVoDDV-VgPJL75u_t3KeAPhb1xEFX2VigVC3oS51pG6wA@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] zorro: Use helpers from ioport.h
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Andy,

On Thu, Aug 31, 2023 at 2:16 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> We can use the DEFINE_RES_MEM_NAMED() macro and resource_contains() helper
> instead of reimplementing them in the code. No functional change intended.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Thanks for your patch!

> --- a/drivers/zorro/zorro.c
> +++ b/drivers/zorro/zorro.c
> @@ -117,17 +117,13 @@ static struct resource __init *zorro_find_parent_resource(
>         int i;
>
>         for (i = 0; i < bridge->num_resources; i++) {
> -               struct resource *r = &bridge->resource[i];
> -
> -               if (zorro_resource_start(z) >= r->start &&
> -                   zorro_resource_end(z) <= r->end)
> -                       return r;
> +               if (resource_contains(&bridge->resource[i], &z->resource)

Missing closing parenthesis. What happened to your cross-compiler?

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
i.e. will queue in the m68k for-v6.7 branch, with the above fixed.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
