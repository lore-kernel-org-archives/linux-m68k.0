Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 968F2C83F01
	for <linux-m68k@archiver.kernel.org>; Thu, 31 Aug 2023 00:04:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237781AbjHaAEt (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 30 Aug 2023 20:04:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343839AbjHaAEs (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 30 Aug 2023 20:04:48 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED50FCCF
        for <linux-m68k@lists.linux-m68k.org>; Wed, 30 Aug 2023 17:04:45 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1c0db66af1bso1469475ad.2
        for <linux-m68k@lists.linux-m68k.org>; Wed, 30 Aug 2023 17:04:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1693440285; x=1694045085; darn=lists.linux-m68k.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2wclbGISi0DTsfnw2wuB5z2VMldigUtFlGGDgvrtyHY=;
        b=fH5jHfyXVUvNdm9k9VsoiHKyu+toU1DQebGBG/CLS4hWxIMlR0nFy/dKRuavflWBSs
         VPOFEUHOEusJL8mbE7umTG2ItolHiNi/IrgH/3/XkSBdVPDK5NxnPZxoUv7ugADFFusa
         qNncHAFaLSN52KEbfERfTaJpm/S7QxZ0+Ifm0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693440285; x=1694045085;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2wclbGISi0DTsfnw2wuB5z2VMldigUtFlGGDgvrtyHY=;
        b=FQT7a0qu+gxoUd8qRHY+gvU9stNzrsSJIISA6lWIVWzWctme2RlRscTKJGuXYf+5B3
         e4HvLwsUMWcDUQZ5K9MhFg3CFSUXX10j5lwNxAuixbhNg75bmOadtCwLrcb9ZOub7YvO
         qr98Gm6x/DiXkhLbwV2s4AXuF1Mpcr/33v5DOZmpZ+4m3mIWWuvRUDIXesupqv11AkGS
         v5R17mpnc1MhzCfHBM/7NmthYax1q1ZMdUsqGRdZS+ZUcqIIm5b5WnNOAnc6bL9TUnhx
         yPWx4+z3Ic7CUOuIihURL/Y+zBiLkAv3xX4pnrkXZvpLk/ryd+xRR408NCIEy8/MplBw
         +Wog==
X-Gm-Message-State: AOJu0Yz+xV/Jk+W/1gPHjTWivmRmdBAyuqZLgsEQfksf+YBU0FVgsC2j
        aLjZey2f3VLiUQOGQOAb7gwI2A==
X-Google-Smtp-Source: AGHT+IFGMTemHoGX0sBWxi5Tew5dUP8jSwJec6Ka+YeMhrkhHDOargCzGiUpjQ6Og16mC5nefUj++g==
X-Received: by 2002:a17:902:d34d:b0:1bf:5df2:8e97 with SMTP id l13-20020a170902d34d00b001bf5df28e97mr3592551plk.4.1693440285320;
        Wed, 30 Aug 2023 17:04:45 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id x13-20020a170902820d00b001c0cb2aa2easm67102pln.121.2023.08.30.17.04.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Aug 2023 17:04:44 -0700 (PDT)
Date:   Wed, 30 Aug 2023 17:04:44 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Azeem Shaikh <azeemshaikh38@gmail.com>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-hardening@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] m68k/atari: Replace strlcpy with strscpy
Message-ID: <202308301704.7A3F0F9CBD@keescook>
References: <20230830185428.4109426-1-azeemshaikh38@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230830185428.4109426-1-azeemshaikh38@gmail.com>
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Wed, Aug 30, 2023 at 06:54:28PM +0000, Azeem Shaikh wrote:
> strlcpy() reads the entire source buffer first.
> This read may exceed the destination size limit.
> This is both inefficient and can lead to linear read
> overflows if a source string is not NUL-terminated [1].
> In an effort to remove strlcpy() completely [2], replace
> strlcpy() here with strscpy().
> 
> Direct replacement is safe here since return value of -errno
> is used to check for truncation instead of sizeof(dest).
> 
> [1] https://www.kernel.org/doc/html/latest/process/deprecated.html#strlcpy
> [2] https://github.com/KSPP/linux/issues/89
> 
> Signed-off-by: Azeem Shaikh <azeemshaikh38@gmail.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
