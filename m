Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14930C46467
	for <linux-m68k@archiver.kernel.org>; Mon, 16 Jan 2023 10:09:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229980AbjAPKI7 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 16 Jan 2023 05:08:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230078AbjAPKIb (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 16 Jan 2023 05:08:31 -0500
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B156C4C22
        for <linux-m68k@lists.linux-m68k.org>; Mon, 16 Jan 2023 02:07:58 -0800 (PST)
Received: by mail-qt1-f170.google.com with SMTP id o5so3225845qtr.11
        for <linux-m68k@lists.linux-m68k.org>; Mon, 16 Jan 2023 02:07:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GZWxErGsgw8qIQZ7WuVMBNjdTSNqeBsJeagSLrPY12c=;
        b=D58bhAhseY+4QoJyXO/Xgfxr4ePP+p8hzxrqwTaSqyPF5GmRSiBvtlBLmdlDtbYXyP
         5kaekK+k19pNqoGPxbG5gtgW/Q7lg4m+5ebvX6kraM/GI5r2FJRMVMUfe3dIRzD7fi7i
         NWP9WmSM96XzEpIGn9JAeeK4l61u4FD+YWz8jVNb06V+DAVGoLUi/63eGMHR2cfgmEr5
         ZszYKxETeVikEaNI34J+JnMDUWgzg3jylDlu7lzp1WLe4/K/X9VUrNPPvEAcJ2WalPFS
         FGqg1LgGvsrrEu8VaZ5/9puFncdKwMoGLa4GevqhvTjxFRpWtbdMG7tjNkQnSqPoByjw
         1/oQ==
X-Gm-Message-State: AFqh2kqJL68UModaFvK2Naiyu2PwxsideJsQyfB5vvmFmK3WwRNzptH2
        4s3e/yvTXWrbJCr92FXYOEJhrzp8VGueiw==
X-Google-Smtp-Source: AMrXdXtxH6LHSoA5Uys0OnaG+oXscGbPRlsguHX/V3ANK57oQuZuSpxHFvqNuvn9RC858qhEn0TCdg==
X-Received: by 2002:ac8:720b:0:b0:3a8:5d1:aacb with SMTP id a11-20020ac8720b000000b003a805d1aacbmr123458436qtp.26.1673863677618;
        Mon, 16 Jan 2023 02:07:57 -0800 (PST)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com. [209.85.219.178])
        by smtp.gmail.com with ESMTPSA id k2-20020a05620a414200b006faaf6dc55asm18058560qko.22.2023.01.16.02.07.57
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jan 2023 02:07:57 -0800 (PST)
Received: by mail-yb1-f178.google.com with SMTP id e130so160884yba.7
        for <linux-m68k@lists.linux-m68k.org>; Mon, 16 Jan 2023 02:07:57 -0800 (PST)
X-Received: by 2002:a5b:541:0:b0:7d5:620e:b60f with SMTP id
 r1-20020a5b0541000000b007d5620eb60fmr793487ybp.89.1673863676798; Mon, 16 Jan
 2023 02:07:56 -0800 (PST)
MIME-Version: 1.0
References: <20221211061358.28035-1-palmer@rivosinc.com> <20221211061358.28035-17-palmer@rivosinc.com>
In-Reply-To: <20221211061358.28035-17-palmer@rivosinc.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 16 Jan 2023 11:07:45 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUwsf8P4HDPfPmtB1F7Xbbb-i_H=ZCKVkMsiG8WzJ8=oA@mail.gmail.com>
Message-ID: <CAMuHMdUwsf8P4HDPfPmtB1F7Xbbb-i_H=ZCKVkMsiG8WzJ8=oA@mail.gmail.com>
Subject: Re: [PATCH v2 16/24] m68k: Remove empty <uapi/asm/setup.h>
To:     Palmer Dabbelt <palmer@rivosinc.com>
Cc:     Arnd Bergmann <arnd@arndb.de>, linux-arch@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

CC linux-m68k

On Sun, Dec 11, 2022 at 7:20 AM Palmer Dabbelt <palmer@rivosinc.com> wrote:
>
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> ---
>  arch/m68k/include/uapi/asm/setup.h | 15 ---------------
>  1 file changed, 15 deletions(-)
>  delete mode 100644 arch/m68k/include/uapi/asm/setup.h
>
> diff --git a/arch/m68k/include/uapi/asm/setup.h b/arch/m68k/include/uapi/asm/setup.h
> deleted file mode 100644
> index 005593acc7d8..000000000000
> --- a/arch/m68k/include/uapi/asm/setup.h
> +++ /dev/null
> @@ -1,15 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
> -/*
> -** asm/setup.h -- Definition of the Linux/m68k setup information
> -**
> -** Copyright 1992 by Greg Harp
> -**
> -** This file is subject to the terms and conditions of the GNU General Public
> -** License.  See the file COPYING in the main directory of this archive
> -** for more details.
> -*/
> -
> -#ifndef _UAPI_M68K_SETUP_H
> -#define _UAPI_M68K_SETUP_H
> -
> -#endif /* _UAPI_M68K_SETUP_H */
> --
> 2.38.1
