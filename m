Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8F19C433F5
	for <linux-m68k@archiver.kernel.org>; Wed, 23 Mar 2022 15:46:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243424AbiCWPsG (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 23 Mar 2022 11:48:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245295AbiCWPsC (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 23 Mar 2022 11:48:02 -0400
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E510D75E4C
        for <linux-m68k@lists.linux-m68k.org>; Wed, 23 Mar 2022 08:46:32 -0700 (PDT)
Received: by mail-pl1-x634.google.com with SMTP id x2so1889077plm.7
        for <linux-m68k@lists.linux-m68k.org>; Wed, 23 Mar 2022 08:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=xOiL2IfLtHJ36vMwZliYDCRzc17oZt5tTjd6We2oUPs=;
        b=UIlACU9xyViEAEMb+LWZazjfQIQZ72L+YA+fuprsQuufl1YO3dJiXs476a2EBPOJ5D
         uz+/vTdIoDtABCazC2o0C61DxSoRE008KpwIMn/TKiyTdmk45/Ra0zCJea1whDpnFmzn
         6LcHNBGX/iRmNGrrn4J0IY2dZ4yu7DWgYQuEY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=xOiL2IfLtHJ36vMwZliYDCRzc17oZt5tTjd6We2oUPs=;
        b=gUvI4d1xkCHhiLd1CKt8QRA1is2vAVifhhVJ5XOI156afJOvPvoKH/spj2jaRacTF+
         opHiKPLZvtMp9ZG29PyQoFjlhVNIST8pe9mnOOPNSX6QYnPq8S2Yt0YkTjfIsLbjbG7D
         YOi8223N+oJjYL1ZCB90R3ZfQ4lAphvFt1Qn0GwcRciXc6hKX48mFmATBSCVv0ac44Y7
         1ffUUTJIVsh9/47K0tT5ulHYSPZcYaIMSke/3t7taOMqJWzeXyVe1lJPlqJh4MuV7avs
         xk7kFFTCd4oKccTL6iTRtRhWYXdOxwQTyZJSsvrxhlNeqK/m2PLQDjcsEq8umKxNaCzF
         WGSg==
X-Gm-Message-State: AOAM5322v3eAfgl5xFVt2/5zyFZmDlduFUvlTj6eqxKVkViFcLQJhX4G
        Ya3RhdDw6V8Ferdlh2qi0YHTzw==
X-Google-Smtp-Source: ABdhPJz6Yvd8lbd/EYC+2ebO6g3u2YPP5AuLumW3lXbXAAvyq1KLB+vZcAM1bmRaOs9bbWRolPIKdA==
X-Received: by 2002:a17:902:e9d4:b0:153:bd06:859c with SMTP id 20-20020a170902e9d400b00153bd06859cmr702714plk.8.1648050392261;
        Wed, 23 Mar 2022 08:46:32 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id v24-20020a634818000000b0036407db4728sm210630pga.26.2022.03.23.08.46.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Mar 2022 08:46:32 -0700 (PDT)
Date:   Wed, 23 Mar 2022 08:46:31 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     David Gow <davidgow@google.com>,
        Daniel Latypov <dlatypov@google.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        KUnit Development <kunit-dev@googlegroups.com>,
        llvm@lists.linux.dev, linux-hardening@vger.kernel.org,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
Subject: Re: [PATCH] lib: stackinit: Convert to KUnit
Message-ID: <202203230844.0B6C73765@keescook>
References: <20220224055145.1853657-1-keescook@chromium.org>
 <CAMuHMdX_g1tbiUL9PUQdqaegrEzCNN3GtbSvSBFYAL4TzvstFg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdX_g1tbiUL9PUQdqaegrEzCNN3GtbSvSBFYAL4TzvstFg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Tue, Mar 22, 2022 at 03:30:22PM +0100, Geert Uytterhoeven wrote:
> Hi Kees,
> 
> On Thu, Feb 24, 2022 at 9:12 AM Kees Cook <keescook@chromium.org> wrote:
> > Convert to running under Kunit (and retain being able to run stand-alone
> > too). Building under Clang (or GCC 12) with CONFIG_INIT_STACK_ALL_ZERO=y,
> > this now passes as expected:
> >
> > $ ./tools/testing/kunit/kunit.py config --make_option LLVM=1
> > $ ./tools/testing/kunit/kunit.py run overflow --make_option LLVM=1 \
> >         --kconfig_add CONFIG_INIT_STACK_ALL_ZERO=y
> > ...
> 
> > Signed-off-by: Kees Cook <keescook@chromium.org>
> 
> Thanks for your patch, which is now commit 02788ebcf521fe78 ("lib:
> stackinit: Convert to KUnit") upstream.
> 
> Out of curiosity, I gave this a try on m68k, and it still seems to
> fail the same way of before[1]:
> [...]
> [1] https://lore.kernel.org/r/CAMuHMdW6N40+0gGQ+LSrN64Mo4A0-ELAm0pR3gWQ0mNanyBuUQ@mail.gmail.com

Ah yes! Thanks for the reminder. I will take a look at this. Clearly, it's
an issue with memory layout assumptions that don't match on m68k, etc.

-- 
Kees Cook
