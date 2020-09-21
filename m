Return-Path: <SRS0=iw/Y=C6=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 595FDC43464
	for <linux-m68k@archiver.kernel.org>; Mon, 21 Sep 2020 07:39:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1D3F420719
	for <linux-m68k@archiver.kernel.org>; Mon, 21 Sep 2020 07:39:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=timesys-com.20150623.gappssmtp.com header.i=@timesys-com.20150623.gappssmtp.com header.b="F6nAit+7"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726428AbgIUHjw (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 21 Sep 2020 03:39:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726244AbgIUHjs (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Mon, 21 Sep 2020 03:39:48 -0400
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com [IPv6:2607:f8b0:4864:20::e44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4499DC061755
        for <linux-m68k@vger.kernel.org>; Mon, 21 Sep 2020 00:39:48 -0700 (PDT)
Received: by mail-vs1-xe44.google.com with SMTP id y194so7538577vsc.4
        for <linux-m68k@vger.kernel.org>; Mon, 21 Sep 2020 00:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=timesys-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=GWnC/F8rKzI6UfksMWGgze+CFL7HVlhF5OAIRBPzVqc=;
        b=F6nAit+7PRCH1m6eIDAfjWsUeK8Zm0K8FlQH38J6hOd/3Hb4p6wrIo6Dxy0l5+1Gz0
         MvHPlgIE7KHHSQytXEmbwcFmBfKjix6AOUT0GzZylLKcDAXEPis94N2p4Kde3qgePIQ3
         IvxxgPwpmmMB1Qvs3pqJSXzQrPm8v/jqOt98M3pKtIwWqoDpf+z+bz3O+z8wi5Eo99Gg
         UlVIlSffgMhugMFVvLVGsNaCAxjBuJInUMkd6aej0AD7XPexScAoY/lJi0VY1DJv6ikL
         /fbk0JVpMIX1sTwNoyyDaJ3dTD0yOQcF7+Br+N9iQr1J4ok9alrh4MI0MnLLYotuyW7e
         zYLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=GWnC/F8rKzI6UfksMWGgze+CFL7HVlhF5OAIRBPzVqc=;
        b=Z7s1tCatJBxenMgVYhHjsqKya2via3ed1ZIlUwIJKi9aekFxeu7gyAreFBeIahBRTL
         o6GrcPas74edFIJAjtkK5Ph0K29xHSSyDdqfj2UZQqLNcoVQlwjlX1r3ehVjjvuepqzF
         53QndHg7N6LtxweKzLohlyL132wI95H9HdC9666Vkga9VdtAYc5dq+4zNWOeuvF9Xqga
         pnXclDQ6ArRa7+pSP/8x5EvasmPnxddlI+iu1kwg7dgTGyxYkhnnrlFfhTuzyiLhIsqo
         3P9NXwrtr//UQFaR4YtvDzpUkPL3Y6PpTmHL2REuPH00vF826ckqycWY0jGPoVIta5uY
         YNKQ==
X-Gm-Message-State: AOAM533UvF0vOTw2qRDwJ89jtkOnNkkCNukG0y4Zi4Cg407zs02pOiN3
        5CSEvIv284y0/57nzJ87/+MneQeJnlPC1rYHhD6P7LXWER7+bwaN
X-Google-Smtp-Source: ABdhPJyIU8qpKhAewaw74gc12XQCQ/YQ7wuwCzq3YPBRWgSMAwhKm4zZzBW9SMdpXoqVLkdPgnXmMGV73oXLST8BKfQ=
X-Received: by 2002:a67:e09d:: with SMTP id f29mr16453349vsl.53.1600673987445;
 Mon, 21 Sep 2020 00:39:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200921030858.3899744-1-gerg@linux-m68k.org>
In-Reply-To: <20200921030858.3899744-1-gerg@linux-m68k.org>
From:   Angelo Dureghello <angelo.dureghello@timesys.com>
Date:   Mon, 21 Sep 2020 09:38:39 +0200
Message-ID: <CALJHbkD=eujoo5Cx+5YwGkFRmmZ4i=Vpvznm=5+=5n3fKOBR_Q@mail.gmail.com>
Subject: Re: [PATCH] m68knommu: include SDHC support only when hardware has it
To:     Greg Ungerer <gerg@linux-m68k.org>
Cc:     "Linux/m68k" <linux-m68k@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Greg,

thanks a lot for the fix.

On Mon, Sep 21, 2020 at 5:09 AM Greg Ungerer <gerg@linux-m68k.org> wrote:
>
> The mere fact that the kernel has the MMC subsystem enabled (CONFIG_MMC
> enabled) does not mean that the underlying hardware platform has the
> SDHC hardware present. Within the ColdFire hardware defines that is
> signified by MCFSDHC_BASE being defined with an address.
>
> The platform data for the ColdFire parts is including the SDHC hardware
> if CONFIG_MMC is enabled, instead of MCFSDHC_BASE. This means that if
> you are compiling for a ColdFire target that does not support SDHC but
> enable CONFIG_MMC you will fail to compile with errors like this:
>
>     arch/m68k/coldfire/device.c:565:12: error: =E2=80=98MCFSDHC_BASE=E2=
=80=99 undeclared here (not in a function)
>        .start =3D MCFSDHC_BASE,
>             ^
>     arch/m68k/coldfire/device.c:566:25: error: =E2=80=98MCFSDHC_SIZE=E2=
=80=99 undeclared here (not in a function)
>        .end =3D MCFSDHC_BASE + MCFSDHC_SIZE - 1,
>                          ^
>     arch/m68k/coldfire/device.c:569:12: error: =E2=80=98MCF_IRQ_SDHC=E2=
=80=99 undeclared here (not in a function)
>        .start =3D MCF_IRQ_SDHC,
>             ^
>
> Make the SDHC platform support depend on MCFSDHC_BASE, that is only
> include it if the specific ColdFire SoC has that hardware module.
>
> Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>
> ---
>  arch/m68k/coldfire/device.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/arch/m68k/coldfire/device.c b/arch/m68k/coldfire/device.c
> index 9ef4ec0aea00..59f7dfe50a4d 100644
> --- a/arch/m68k/coldfire/device.c
> +++ b/arch/m68k/coldfire/device.c
> @@ -554,7 +554,7 @@ static struct platform_device mcf_edma =3D {
>  };
>  #endif /* IS_ENABLED(CONFIG_MCF_EDMA) */
>
> -#if IS_ENABLED(CONFIG_MMC)
> +#ifdef MCFSDHC_BASE
>  static struct mcf_esdhc_platform_data mcf_esdhc_data =3D {
>         .max_bus_width =3D 4,
>         .cd_type =3D ESDHC_CD_NONE,
> @@ -579,7 +579,7 @@ static struct platform_device mcf_esdhc =3D {
>         .resource               =3D mcf_esdhc_resources,
>         .dev.platform_data      =3D &mcf_esdhc_data,
>  };
> -#endif /* IS_ENABLED(CONFIG_MMC) */
> +#endif /* MCFSDHC_BASE */
>
>  static struct platform_device *mcf_devices[] __initdata =3D {
>         &mcf_uart,
> @@ -613,7 +613,7 @@ static struct platform_device *mcf_devices[] __initda=
ta =3D {
>  #if IS_ENABLED(CONFIG_MCF_EDMA)
>         &mcf_edma,
>  #endif
> -#if IS_ENABLED(CONFIG_MMC)
> +#ifdef MCFSDHC_BASE
>         &mcf_esdhc,
>  #endif
>  };
> --
> 2.25.1
>

Tested on mcf54418 stmark2.

Reviewed-by: Angelo Dureghello <angelo.dureghello@timesys.com>
Tested-by: Angelo Dureghello <angelo.dureghello@timesys.com>


Regards,
angelo
