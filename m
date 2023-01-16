Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9F0EC54EBE
	for <linux-m68k@archiver.kernel.org>; Mon, 16 Jan 2023 10:08:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230041AbjAPKII (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 16 Jan 2023 05:08:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230034AbjAPKHr (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 16 Jan 2023 05:07:47 -0500
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98AA3193F6
        for <linux-m68k@lists.linux-m68k.org>; Mon, 16 Jan 2023 02:07:27 -0800 (PST)
Received: by mail-qv1-f53.google.com with SMTP id d13so19242288qvj.8
        for <linux-m68k@lists.linux-m68k.org>; Mon, 16 Jan 2023 02:07:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=26Y1vYmwwq8aWhcVlX6A7aJb6PyVhNqZiaD+Qkg9TZw=;
        b=xgTdNfcvHHa4jklmH5qFm7BLZna0fLF5amD1BZNU7QN49Bjvcmfm1X7BFfzmJy78da
         KcUWUEiXagwY9T3Hj3f2vloSVBvKCjdvxGtYG8dlXvjlrBTriV85vYFEZPl4mjZmDmIJ
         zo4mlQn6muJpOiAHPeOPxceoN0dsAeUR8aYB70MSLNy/Mf89Dw1cbvTxd+F/l641XogU
         X39BnzluTVFdX0EzHxQMiXTGZC+JjrLcG5TayXlMnG63vJ7HBS0Oq7VJ9v0cB9RuJ1ws
         6XVNCSTs29Qmr3LKj38vm3YQr059TdoLgHTyNRP+NeoRWH9Tc/Sp1GET+3H10qtuLpU1
         0JXA==
X-Gm-Message-State: AFqh2kqlyDSkCwtjxA93jRww3HCi/oRYdqVPZIKYQNsefrFXMFKiJMhF
        XD7+nJJZRPYhcH5KGzvsdjKFnJAFJW7Tng==
X-Google-Smtp-Source: AMrXdXvraCpAs0sIfgmwrg2QtGo2yVWlrL2oyQoGrZoSfyqi5JvBTdy+1RDE26DrRZwme5HXcJdSmw==
X-Received: by 2002:a05:6214:1874:b0:534:7be6:4be6 with SMTP id eh20-20020a056214187400b005347be64be6mr18668026qvb.0.1673863646567;
        Mon, 16 Jan 2023 02:07:26 -0800 (PST)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com. [209.85.128.178])
        by smtp.gmail.com with ESMTPSA id w22-20020a05620a425600b006cbc00db595sm17991154qko.23.2023.01.16.02.07.26
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jan 2023 02:07:26 -0800 (PST)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-4d19b2686a9so246564707b3.6
        for <linux-m68k@lists.linux-m68k.org>; Mon, 16 Jan 2023 02:07:26 -0800 (PST)
X-Received: by 2002:a81:91cc:0:b0:48d:1334:6e38 with SMTP id
 i195-20020a8191cc000000b0048d13346e38mr1765629ywg.316.1673863645871; Mon, 16
 Jan 2023 02:07:25 -0800 (PST)
MIME-Version: 1.0
References: <20221211061358.28035-1-palmer@rivosinc.com> <20221211061358.28035-6-palmer@rivosinc.com>
In-Reply-To: <20221211061358.28035-6-palmer@rivosinc.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 16 Jan 2023 11:07:14 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXpFBcxPZLcyqP_Zi7sxF1OgKtW1wExUO3xYks-RViVhA@mail.gmail.com>
Message-ID: <CAMuHMdXpFBcxPZLcyqP_Zi7sxF1OgKtW1wExUO3xYks-RViVhA@mail.gmail.com>
Subject: Re: [PATCH v2 05/24] m68k: Remove COMMAND_LINE_SIZE from uapi
To:     Palmer Dabbelt <palmer@rivosinc.com>
Cc:     Arnd Bergmann <arnd@arndb.de>, linux-arch@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

CC linux-m68k

On Sun, Dec 11, 2022 at 7:19 AM Palmer Dabbelt <palmer@rivosinc.com> wrote:
>
> As far as I can tell this is not used by userspace and thus should not
> be part of the user-visible API.
>
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> ---
> This leaves an empty <uapi/asm/setup.h>, which will soon be cleaned up.
> ---
>  arch/m68k/include/asm/setup.h      | 3 +--
>  arch/m68k/include/uapi/asm/setup.h | 2 --
>  2 files changed, 1 insertion(+), 4 deletions(-)
>
> diff --git a/arch/m68k/include/asm/setup.h b/arch/m68k/include/asm/setup.h
> index 2c99477aaf89..9a256cc3931d 100644
> --- a/arch/m68k/include/asm/setup.h
> +++ b/arch/m68k/include/asm/setup.h
> @@ -23,9 +23,8 @@
>  #define _M68K_SETUP_H
>
>  #include <uapi/asm/bootinfo.h>
> -#include <uapi/asm/setup.h>
> -
>
> +#define COMMAND_LINE_SIZE 256
>  #define CL_SIZE COMMAND_LINE_SIZE
>
>  #ifndef __ASSEMBLY__
> diff --git a/arch/m68k/include/uapi/asm/setup.h b/arch/m68k/include/uapi/asm/setup.h
> index 25fe26d5597c..005593acc7d8 100644
> --- a/arch/m68k/include/uapi/asm/setup.h
> +++ b/arch/m68k/include/uapi/asm/setup.h
> @@ -12,6 +12,4 @@
>  #ifndef _UAPI_M68K_SETUP_H
>  #define _UAPI_M68K_SETUP_H
>
> -#define COMMAND_LINE_SIZE 256
> -
>  #endif /* _UAPI_M68K_SETUP_H */
> --
> 2.38.1
>
