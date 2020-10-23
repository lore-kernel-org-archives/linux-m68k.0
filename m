Return-Path: <SRS0=aPjp=D6=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F62CC388F9
	for <linux-m68k@archiver.kernel.org>; Fri, 23 Oct 2020 15:28:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3224A221F9
	for <linux-m68k@archiver.kernel.org>; Fri, 23 Oct 2020 15:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603466931;
	bh=EU+2qTgoZbe7L0HsjpKr8odgtOe3LfA4NHygL8USK4w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=iExZEiGlMe9oO7OUGTB3LQn1z2oEi+zIvdS5uaL9+WN0lss0Ss0V8EgWicgzlKgAj
	 7LlpZN92UmS7sZqtnEV8OGNNd9E47fG+YlFrivWDilw6h1xIPgkEO17r/vEeULUTW0
	 1RCztG3pELbT8cVMGEaW6kVJJRLlMUrsOhoTfifg=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S465812AbgJWP2u (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 23 Oct 2020 11:28:50 -0400
Received: from mail-ej1-f67.google.com ([209.85.218.67]:39841 "EHLO
        mail-ej1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S465813AbgJWP2s (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 23 Oct 2020 11:28:48 -0400
Received: by mail-ej1-f67.google.com with SMTP id qh17so2942332ejb.6
        for <linux-m68k@lists.linux-m68k.org>; Fri, 23 Oct 2020 08:28:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=8VWmVh1g5wU3te7Rzl0E5HboJR4NG/dn6wbec4O2niQ=;
        b=NJ1cHU31DRglqr8YonFVjg68y9sgyVEdMlkd8WCJ0bsM9G95M9Z7XBliqFe7bdpmRd
         2VXviKhL9RGPoX6ZoatX8ooVnqcFuOpckwkPnn75x8zETyfb0kRpoR/eIWW/+6ppniOx
         /405fCX6wspB6cFEN7dLSZV2WZA0wa3IlV7P1aMHWJ0Hc4tJGHZRLpQC+2h3hRIuDgae
         e+emvY2vG1616dmqu7eaGAz+MfkrqmTMgrdHdAv5bzF7ZzQHQskFcPkXH15OF+/SEu/n
         s6gix1h6FJskGszwQgNz07U2qc5GHg2Sd0uNjxN0H40XDO0L4wFw2aeVhtDL+Ar7i/N0
         oPjw==
X-Gm-Message-State: AOAM532opQPMzawkR4BH95cwni1rgAIO6tgRVLfIdcTSXI1CLk9yErqG
        XrLA0vOtWn3P0flpO6WfgDc=
X-Google-Smtp-Source: ABdhPJx3vdJo1BSJWo8drebFDOaoi+uI+K9sO8Av8jwfByJcXHiSiDPwQs12Le8pPww4GnFk+EwZ/A==
X-Received: by 2002:a17:906:48c:: with SMTP id f12mr2639269eja.467.1603466925850;
        Fri, 23 Oct 2020 08:28:45 -0700 (PDT)
Received: from kozik-lap ([194.230.155.171])
        by smtp.googlemail.com with ESMTPSA id s6sm994985ejx.79.2020.10.23.08.28.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2020 08:28:44 -0700 (PDT)
Date:   Fri, 23 Oct 2020 17:28:42 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     peng.fan@nxp.com
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
        kernel@pengutronix.de, linux-imx@nxp.com,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Greg Ungerer <gerg@linux-m68k.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k@lists.linux-m68k.org,
        Angelo Dureghello <angelo.dureghello@timesys.com>
Subject: Re: [PATCH 2/2] i2c: imx: remove id_table entry
Message-ID: <20201023152842.GA5227@kozik-lap>
References: <1603441103-17735-1-git-send-email-peng.fan@nxp.com>
 <1603441103-17735-2-git-send-email-peng.fan@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1603441103-17735-2-git-send-email-peng.fan@nxp.com>
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Fri, Oct 23, 2020 at 04:18:23PM +0800, peng.fan@nxp.com wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> The legacy platform device code has been removed under arch/arm/mach-imx,
> so we no need id_table entry here.

Cc: Greg, Geert, Angelo,

Aren't you breaking Coldfire platforms?

Best regards,
Krzysztof

> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/i2c/busses/i2c-imx.c | 14 --------------
>  1 file changed, 14 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
> index ba9d639223ec..7ea36a78abb0 100644
> --- a/drivers/i2c/busses/i2c-imx.c
> +++ b/drivers/i2c/busses/i2c-imx.c
> @@ -233,19 +233,6 @@ static struct imx_i2c_hwdata vf610_i2c_hwdata = {
>  
>  };
>  
> -static const struct platform_device_id imx_i2c_devtype[] = {
> -	{
> -		.name = "imx1-i2c",
> -		.driver_data = (kernel_ulong_t)&imx1_i2c_hwdata,
> -	}, {
