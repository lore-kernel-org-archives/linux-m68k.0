Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA514ECAAD6
	for <linux-m68k@archiver.kernel.org>; Fri, 26 Aug 2022 07:45:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245518AbiHZHo7 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 26 Aug 2022 03:44:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245584AbiHZHoq (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Fri, 26 Aug 2022 03:44:46 -0400
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4C6DD3471
        for <linux-m68k@vger.kernel.org>; Fri, 26 Aug 2022 00:44:40 -0700 (PDT)
Received: by mail-qk1-f175.google.com with SMTP id a15so563887qko.4
        for <linux-m68k@vger.kernel.org>; Fri, 26 Aug 2022 00:44:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=XA55eR0DqX3Ru4hxlZ5ChYWGLWwogeAjdman3X1DUMk=;
        b=CMrJExiimVyLz/avS03zMZkfjsYQLA/wGoNPw1SVyQdHfKqovCHCngPmaedv032BaK
         RRISyB9s/Y+sT/ix8SfqE8tedtawD4r4dNKC/hK3b91xE8arXOPd1VuKcchga5RnKSxC
         j51y64Z0/XleABjsTcjhFkFEqVaMECGA3u7IPhlxQ7yr69TmPsOEOwtd5arQR0e9bE7Y
         Wi9LTLwX5NobhPmStBiQFZuCCd5PDPk6aomu7Hn/tDKtRa783FOMojuILThNrUIpSBRd
         ea0EKmqSPuNZdx5j78D8L9Mc/AjWa4ed+KL7loPf6BdVHRs3v1F9dfpZ7QzDdkRJ73Wf
         Ibqw==
X-Gm-Message-State: ACgBeo04VIjtp7aBhnsW9SDTg7NqOtnc6pvdV6DKRQXhIVGRpFWVcFfo
        4QpQqcdXdvuN4lkrqfnHfdFTK/t/qriDWA==
X-Google-Smtp-Source: AA6agR4wD8rucTosf47i7tD5j29r5mk5X+ST2t2xv8Z+fyWnSozo95VlwHNecb/G19ega93AgDSeGA==
X-Received: by 2002:a05:620a:101a:b0:6bb:13a6:9d81 with SMTP id z26-20020a05620a101a00b006bb13a69d81mr5744454qkj.565.1661499879601;
        Fri, 26 Aug 2022 00:44:39 -0700 (PDT)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com. [209.85.128.169])
        by smtp.gmail.com with ESMTPSA id z8-20020a05622a060800b0034490214788sm872565qta.49.2022.08.26.00.44.39
        for <linux-m68k@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Aug 2022 00:44:39 -0700 (PDT)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-334dc616f86so16246467b3.8
        for <linux-m68k@vger.kernel.org>; Fri, 26 Aug 2022 00:44:39 -0700 (PDT)
X-Received: by 2002:a05:690c:830:b0:33d:794b:e66c with SMTP id
 by16-20020a05690c083000b0033d794be66cmr7354846ywb.502.1661499879152; Fri, 26
 Aug 2022 00:44:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220826040302.3455339-1-gerg@linux-m68k.org> <20220826040302.3455339-3-gerg@linux-m68k.org>
In-Reply-To: <20220826040302.3455339-3-gerg@linux-m68k.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 26 Aug 2022 09:44:27 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWRjG6n9MpLG+rZtyrTPdj6sGLt7LehHo+i0P9aHach+Q@mail.gmail.com>
Message-ID: <CAMuHMdWRjG6n9MpLG+rZtyrTPdj6sGLt7LehHo+i0P9aHach+Q@mail.gmail.com>
Subject: Re: [PATCH 3/3] m68k: allow kexec on all MMU enabled CPUs
To:     Greg Ungerer <gerg@linux-m68k.org>
Cc:     "Linux/m68k" <linux-m68k@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Greg,

On Fri, Aug 26, 2022 at 6:08 AM Greg Ungerer <gerg@linux-m68k.org> wrote:
> The configuration setting for 68k kexec support limits it to only
> the classic 68k CPU types (so no ColdFire). However the underlying
> support can handle any 68k CPU that is MMU enabled - and that includes
> ColdFire. (Of course that support is only as good as mentioned in
> the current configuration help).
>
> None of the no-MMU CPU types (classic or ColdFire) have support for
> kexec yet, so the configuration as it stands is not quite right, and
> it will fail to compile on them.
>
> Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>

Thanks for your patch!

> --- a/arch/m68k/Kconfig
> +++ b/arch/m68k/Kconfig
> @@ -87,7 +87,7 @@ config MMU_SUN3
>
>  config KEXEC
>         bool "kexec system call"
> -       depends on M68KCLASSIC
> +       depends on MMU
>         select KEXEC_CORE
>         help
>           kexec is a system call that implements the ability to shutdown your

Don't you need changes to arch/m68k/kernel/relocate_kernel.S,
which supports 68020+ only?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
