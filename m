Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D905CC433F5
	for <linux-m68k@archiver.kernel.org>; Wed,  8 Sep 2021 04:13:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BAAA86112F
	for <linux-m68k@archiver.kernel.org>; Wed,  8 Sep 2021 04:13:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229744AbhIHEOO (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 8 Sep 2021 00:14:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229737AbhIHEOM (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 8 Sep 2021 00:14:12 -0400
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com [IPv6:2607:f8b0:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F647C061757
        for <linux-m68k@lists.linux-m68k.org>; Tue,  7 Sep 2021 21:13:05 -0700 (PDT)
Received: by mail-ot1-x32e.google.com with SMTP id c19-20020a9d6153000000b0051829acbfc7so1237896otk.9
        for <linux-m68k@lists.linux-m68k.org>; Tue, 07 Sep 2021 21:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=HkIuLVDKn7TgiCzRztoLPo7WO6itaQ7BA8yRHyvqmmo=;
        b=Ur8IPF1yWy22Q0kJ/WFmntzBviiE2zn/rwKijChNN1Wm+xfBYvALfoYlSH/nLo+5Fa
         DZ5M0bNGH1eAOziJCp3RiQ5URJKyfRK34JqRBsLFyRi8xYhsA9QxAoVp8bpyzBMYVluu
         3HGtkrIKzyC+wDzrzJjVWSP6tUIZjFHZo+Bpojuh56NtlRL/zyid3hJQTm1xtJCou7/q
         7WN3rYKpGAeatm3UQACj38hDs+GaEO7wVh5c/t5d5nXWpMpSoWKrRdwxwQw54FH3cfjH
         E+C3kvlmn3N33fUrMrAVBuDK5PWqvfGIGH0xKF7d167ywTtksTyi5w/UpGHGacZuJ1TW
         xZnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=HkIuLVDKn7TgiCzRztoLPo7WO6itaQ7BA8yRHyvqmmo=;
        b=UjQ/OBzr4z+gxRwnfgehEas+O9rXvfodDcikyVl1Leau2eYiiGO8fb8/NBJjyu2nfh
         2F9KbrebVfKcWXIKxoi/BoB1ERtMG5uvXmZriDijIvyxiFqAQNUpyzd4xUd8pg8sxGKb
         7+MJViKh3evbQLbFV7sm9PyMQvUbPqbeH0OeB2zkzgipRVAvhc+QaSY3mpaOY/MGHeXV
         KbsiG1y3/KGN9hxTPAD3gaZUiS2drzpjMs0LK6RfabUO2ixMngNCUw31i4nZ3Tmfht+6
         qJZvWlNTjHYAN9DnEWYKf9EUlxMm/jGRJfqScKk+NPVx1hieFLphTdrlWZ49iBeeUK7M
         EStQ==
X-Gm-Message-State: AOAM532t1F4hTOQbtMFp0Nmey59bqZZbBhjFe4CNJdsqx+iNlfck+I7R
        QRlha9zB40fg7+YMGpqBwqs=
X-Google-Smtp-Source: ABdhPJxPC/ElUQrxDzILrbmOrghUnICdEMQf0kufEGvSFVx5WCxFtQVy+RXq9o6FxgGv6ItwJ8/iqQ==
X-Received: by 2002:a9d:828:: with SMTP id 37mr1509555oty.0.1631074384551;
        Tue, 07 Sep 2021 21:13:04 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id c75sm209181oob.47.2021.09.07.21.13.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Sep 2021 21:13:04 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Tue, 7 Sep 2021 21:13:02 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] m68k: mvme: Remove overdue #warnings in RTC handling
Message-ID: <20210908041302.GA2585571@roeck-us.net>
References: <20210907124511.2723414-1-geert@linux-m68k.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210907124511.2723414-1-geert@linux-m68k.org>
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Tue, Sep 07, 2021 at 02:45:11PM +0200, Geert Uytterhoeven wrote:
> The warnings were introduced when converting the MVME147 and MVME16x
> RTC handling from gettod to hwclk.  Replace the #warning by a comment,
> and return an error to inform the upper layer that writing to the RTC is
> not yet supported.
> 
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  arch/m68k/mvme147/config.c | 4 +++-
>  arch/m68k/mvme16x/config.c | 4 +++-
>  2 files changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/m68k/mvme147/config.c b/arch/m68k/mvme147/config.c
> index e1e90c49a49624cc..dfd6202fd403e92b 100644
> --- a/arch/m68k/mvme147/config.c
> +++ b/arch/m68k/mvme147/config.c
> @@ -171,7 +171,6 @@ static int bcd2int (unsigned char b)
>  
>  int mvme147_hwclk(int op, struct rtc_time *t)
>  {
> -#warning check me!
>  	if (!op) {
>  		m147_rtc->ctrl = RTC_READ;
>  		t->tm_year = bcd2int (m147_rtc->bcd_year);
> @@ -183,6 +182,9 @@ int mvme147_hwclk(int op, struct rtc_time *t)
>  		m147_rtc->ctrl = 0;
>  		if (t->tm_year < 70)
>  			t->tm_year += 100;
> +	} else {
> +		/* FIXME Setting the time is not yet supported */
> +		return -EOPNOTSUPP;
>  	}
>  	return 0;
>  }
> diff --git a/arch/m68k/mvme16x/config.c b/arch/m68k/mvme16x/config.c
> index b59593c7cfb9dfbf..b4422c2dfbbf4f7c 100644
> --- a/arch/m68k/mvme16x/config.c
> +++ b/arch/m68k/mvme16x/config.c
> @@ -436,7 +436,6 @@ int bcd2int (unsigned char b)
>  
>  int mvme16x_hwclk(int op, struct rtc_time *t)
>  {
> -#warning check me!
>  	if (!op) {
>  		rtc->ctrl = RTC_READ;
>  		t->tm_year = bcd2int (rtc->bcd_year);
> @@ -448,6 +447,9 @@ int mvme16x_hwclk(int op, struct rtc_time *t)
>  		rtc->ctrl = 0;
>  		if (t->tm_year < 70)
>  			t->tm_year += 100;
> +	} else {
> +		/* FIXME Setting the time is not yet supported */
> +		return -EOPNOTSUPP;
>  	}
>  	return 0;
>  }
> -- 
> 2.25.1
> 
