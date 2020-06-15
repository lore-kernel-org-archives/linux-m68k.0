Return-Path: <SRS0=2kwO=74=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C1EAC433E0
	for <linux-m68k@archiver.kernel.org>; Mon, 15 Jun 2020 16:44:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EB4FC2067B
	for <linux-m68k@archiver.kernel.org>; Mon, 15 Jun 2020 16:44:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hh8ClNbC"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731064AbgFOQoh (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 15 Jun 2020 12:44:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729966AbgFOQoh (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Mon, 15 Jun 2020 12:44:37 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A084C061A0E
        for <linux-m68k@vger.kernel.org>; Mon, 15 Jun 2020 09:44:37 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id k11so18153022ejr.9
        for <linux-m68k@vger.kernel.org>; Mon, 15 Jun 2020 09:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=iThhRZOPTD8nSG2lczi+yW/5LE1C5oQQb9Z51iZU1QA=;
        b=hh8ClNbCz2iuhQyO1sY0no04hX3sADZNDZ87Wr/AN2080xk+UvJ+O8yiFUEkGAVbSt
         tuh4LVmmNjYVGVQIN5FhJXIpEssruc8yTV8GVJR2VcE26Fb9H9kYZU/EBlSc5mi3T15Z
         7vmBOSbddIUh7+xt0crNoFnx3OsEMkPtZnjmbihlfJX2WIJdcR5a9Nc2TylgqMBbqM0A
         AGxGwYaEAPV8aU6fxGWDScXiHAIZ9DHVdInFfg/FXhX4djdEpznVK+CF1odIM+jk6hy9
         aIucHgtdri4SPv5BlpGNJ4XAsvWlSK74+tuHfpxZafmCUoaZ0Tp7WXCeUCmTXmBfwh4J
         9Pfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=iThhRZOPTD8nSG2lczi+yW/5LE1C5oQQb9Z51iZU1QA=;
        b=XiqtGjbHJRSLl44tiEfGanWXu7qD9D3IOOnmUXE6BHjYrj702sCWMdkl/OXGTLv9wt
         +6Q2ZoXmBNUEDCJOyibguqabepiPadUHI0QCbRPmEs+d4eL5W9b/ukaabInxeCg516dc
         ODZ1iRWH3r6+h40vVnbyiTzW+BfdhyrIYx1U5pNrxgFFsOQKhn+3dKJPKNX7A3yzOr00
         Z8cjqPE0wXhmnBveV4aGN0GGgld4z1k5x3DM8DaYAoqYo5FntnFYHZcg1ZtWGpqRIcgt
         fn3Ymd3FVI2xHlN6xaYao+pAdlmiNdCJ4U/WcUEou/r0GNODRgCFLhYRgN7ouZ+zWri+
         z7uw==
X-Gm-Message-State: AOAM531w9Wqx3ktkDdxMRDapwUnvAhBBVOoqQX9thWECa2Xz3NnGWQcU
        v/qGM/zbXCPF9QCFHj+k+Kw=
X-Google-Smtp-Source: ABdhPJy8h72LwD6LF3FIupIO4gZZ2t2PKswPRm/y5xuNxJ0dUIfC1C5GOugw3hVBEI0dbz1s3pll9Q==
X-Received: by 2002:a17:906:c058:: with SMTP id bm24mr25788569ejb.73.1592239475872;
        Mon, 15 Jun 2020 09:44:35 -0700 (PDT)
Received: from ltop.local ([2a02:a03f:b7f9:7600:2438:c4f9:4ba4:a33e])
        by smtp.gmail.com with ESMTPSA id t20sm9394943ejx.27.2020.06.15.09.44.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2020 09:44:35 -0700 (PDT)
Date:   Mon, 15 Jun 2020 18:44:34 +0200
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     Greg Ungerer <gerg@linux-m68k.org>
Cc:     linux-m68k@vger.kernel.org, kernel test robot <lkp@intel.com>,
        Marc Kleine-Budde <mkl@pengutronix.de>
Subject: Re: [PATCH 4/5] m68knommu: __force type casts for raw IO access
Message-ID: <20200615164434.dizhqp3l4x7dg55r@ltop.local>
References: <20200615071618.2598843-1-gerg@linux-m68k.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200615071618.2598843-1-gerg@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Mon, Jun 15, 2020 at 05:16:18PM +1000, Greg Ungerer wrote:
> Bring the m68knommu raw IO functions into line with the m68k raw IO
> access functions and __force casting of the address component. This
> is primarily to fix sparse warnings on use of these raw macros.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> CC: Marc Kleine-Budde <mkl@pengutronix.de>
> CC: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
> Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>
> ---
>  arch/m68k/include/asm/io_no.h | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/m68k/include/asm/io_no.h b/arch/m68k/include/asm/io_no.h
> index 0498192e1d98..1bc739f1f1ad 100644
> --- a/arch/m68k/include/asm/io_no.h
> +++ b/arch/m68k/include/asm/io_no.h
> @@ -14,15 +14,15 @@
>   * that behavior here first before we include asm-generic/io.h.
>   */
>  #define __raw_readb(addr) \
> -    ({ unsigned char __v = (*(volatile unsigned char *) (addr)); __v; })
> +    ({ u8 __v = (*(__force volatile u8 *) (addr)); __v; })
>  #define __raw_readw(addr) \
> -    ({ unsigned short __v = (*(volatile unsigned short *) (addr)); __v; })
> +    ({ u16 __v = (*(__force volatile u16 *) (addr)); __v; })
>  #define __raw_readl(addr) \
> -    ({ unsigned int __v = (*(volatile unsigned int *) (addr)); __v; })
> +    ({ u32 __v = (*(__force volatile u32 *) (addr)); __v; })
>  
> -#define __raw_writeb(b, addr) (void)((*(volatile unsigned char *) (addr)) = (b))
> -#define __raw_writew(b, addr) (void)((*(volatile unsigned short *) (addr)) = (b))
> -#define __raw_writel(b, addr) (void)((*(volatile unsigned int *) (addr)) = (b))
> +#define __raw_writeb(b, addr) (void)((*(__force volatile u8 *) (addr)) = (b))
> +#define __raw_writew(b, addr) (void)((*(__force volatile u16 *) (addr)) = (b))
> +#define __raw_writel(b, addr) (void)((*(__force volatile u32 *) (addr)) = (b))
>  

Look good to me. Feel free to add my
Reviewed-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>

-- Luc
