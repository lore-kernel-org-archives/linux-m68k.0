Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFAE0C64ED8
	for <linux-m68k@archiver.kernel.org>; Mon, 27 Feb 2023 20:45:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229470AbjB0UpF (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 27 Feb 2023 15:45:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229451AbjB0UpF (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Mon, 27 Feb 2023 15:45:05 -0500
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12F0E2056D
        for <linux-m68k@vger.kernel.org>; Mon, 27 Feb 2023 12:45:04 -0800 (PST)
Received: by mail-pj1-x1033.google.com with SMTP id y15-20020a17090aa40f00b00237ad8ee3a0so7461373pjp.2
        for <linux-m68k@vger.kernel.org>; Mon, 27 Feb 2023 12:45:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=aq/3JL5WaQAxRuLsRiAkkaejaSZZL3INg4wXJVEsIb8=;
        b=IR5jovmcPhADcmgvo/bRrjLlyEk5HJj7VhF6LTDdCmq65Wp+9LVgu+9bRGzcy6fBFw
         8lVWKcdsAaE3n0SDijD6IykSE/lbnQhYqU9WuwQ8PRyq/DuBnPl3UHi92OFpzM8sqNFV
         a1P8sXT4AYduSrLS4fj5v8oRsWoIYheCfRjEY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aq/3JL5WaQAxRuLsRiAkkaejaSZZL3INg4wXJVEsIb8=;
        b=uos7MCmAA82mqqcEBZI4VLSVlafNw539JVZp48n3E95OLntgz2tgmBdJhP3Wqf3YrY
         XYU059mIzAbd9RCA/fAmvva1OrnEn5ZQ0VzSmn/p8HI9AP4SSzZu9hOD8x87sWwbMCLe
         FBPv2AIpd2/5hy8pKixqHseh8wV+buRkA13zrVaEWQfxn+xg2GBJhN3IALGx4dOI/Vwu
         LespYBzoEbPDDVcF7R2WvDl4Uc59U8PsJsr1Rtmd4uhs4CXRtWeFs51ByZ/iblRhStLb
         kbr6YNz3FnHKKCGz3KhGL2cC3FaO4bin7JMYCJC442gbVtw7KXHz16y40GZmjmH8S+ck
         NkZQ==
X-Gm-Message-State: AO0yUKX25/x3elZTXrv7sQ1w4rTqKORKYm7fuS97ROQnxBC1GgSvl/vE
        eaaKCwJ9xfaHd6cNcXf03Rh60g==
X-Google-Smtp-Source: AK7set95+BcYBporGffr7xyCCMDhL5TU9UuNtU3sTxHo3e2CxYRnDkTg+nz8ScNaXf+qTa1OU8phwA==
X-Received: by 2002:a05:6a21:788f:b0:b8:723f:e21b with SMTP id bf15-20020a056a21788f00b000b8723fe21bmr1049090pzc.3.1677530703481;
        Mon, 27 Feb 2023 12:45:03 -0800 (PST)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id v1-20020aa78501000000b005d4e89b69e5sm4610447pfn.127.2023.02.27.12.45.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Feb 2023 12:45:02 -0800 (PST)
Message-ID: <63fd164e.a70a0220.96864.89bb@mx.google.com>
X-Google-Original-Message-ID: <202302271241.@keescook>
Date:   Mon, 27 Feb 2023 12:45:02 -0800
From:   Kees Cook <keescook@chromium.org>
To:     Michael Schmitz <schmitzmic@gmail.com>
Cc:     linux-m68k@vger.kernel.org, geert@linux-m68k.org,
        glaubitz@physik.fu-berlin.de,
        Andy Lutomirski <luto@amacapital.net>,
        Will Drewry <wad@chromium.org>
Subject: Re: [PATCH v13 0/3] Add kernel seccomp support for m68k
References: <20230112035529.13521-1-schmitzmic@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230112035529.13521-1-schmitzmic@gmail.com>
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Thu, Jan 12, 2023 at 04:55:26PM +1300, Michael Schmitz wrote:
> Previous version of patch 1 did overwrite a syscall return
> value that was changed by ptrace or seccomp (in regs->d0)
> by -ENOSYS when skipping a syscall. Branch directly to
> ret_from_syscall instead of falling through to badsys (which
> must set -ENOSYS). I'm sure this can be done more elegantly.
> 
> Patch 3 used the wrong struct definition for ARCH_REGS - the
> kernel ptrace code copies 19 registers (from syscall stack
> and switch_stack, pt_regs only contains the 14 from the
> syscall stack). Stack overflow ensues.

Hi,

Thanks for expanding seccomp support to m68k! I happened to see this
land in Linus's tree, but it was news to me that it was under
development. Please use scripts/get_maintainers.pl in the future:

SECURE COMPUTING
M:      Kees Cook <keescook@chromium.org>
R:      Andy Lutomirski <luto@amacapital.net>
R:      Will Drewry <wad@chromium.org>
S:      Supported
T:      git git://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git for-next/seccomp
F:      Documentation/userspace-api/seccomp_filter.rst
F:      include/linux/seccomp.h
F:      include/uapi/linux/seccomp.h
F:      kernel/seccomp.c
F:      tools/testing/selftests/kselftest_harness.h
F:      tools/testing/selftests/seccomp/*
K:      \bsecure_computing
K:      \bTIF_SECCOMP\b

> With these changes, 79 of 94 seccomp_bpf tests now succeed.

I'm curious which tests are not passing?

Thanks!

-Kees

-- 
Kees Cook
