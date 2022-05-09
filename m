Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54FF2C433F5
	for <linux-m68k@archiver.kernel.org>; Mon,  9 May 2022 11:06:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232002AbiEILKn (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 9 May 2022 07:10:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231855AbiEILKm (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Mon, 9 May 2022 07:10:42 -0400
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B92DA10277E
        for <linux-m68k@vger.kernel.org>; Mon,  9 May 2022 04:06:48 -0700 (PDT)
Received: by mail-qt1-f174.google.com with SMTP id k2so10674301qtp.1
        for <linux-m68k@vger.kernel.org>; Mon, 09 May 2022 04:06:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DKdUODGGOOyd+c8m55qzfpIJCsRp5fC1uxSohKM6so8=;
        b=Fl1tR+FFKSREZacdmRfH5KISfhqZaNPIy6mUb7ogi8Lkg6GYRUX14ZuGmjB/+8n1dU
         0b6dnQOzkLJB3z01kH1g3aQOVhIwCeDiVsfqs1yCiK/Xh7MGnC3dtgUW+63zuXgNWRJT
         QpSbA7hy/jnBeRPZWlKuolOOqpr0Mt4oSSnKLA7Gl5i47OcXwJAE38ocRKNN7Kc4s3gd
         cmZLBZQ2jMFjkyc38RZnLlDvRosNuj/JhuM92pXj4Ee3mpsXJlT56lP3XVm9D84tvPoK
         QTYPxsQazE/xbqucYkeC3NsoQuDVoozHd1OCe5cotSBo45ZbArR2aRKgzVvCEpGgHuCM
         /QVw==
X-Gm-Message-State: AOAM530RhNIjV7rWyUBVMA6GQknActPCct42dOkAT/GkCVLax8J7lTHM
        nu0xrLLHehK+F4M2hUqRestDyafodua/tg==
X-Google-Smtp-Source: ABdhPJxobdQ7Q0GvAJ1eLryKZx1AakfygERiKeohtW7QnESHjCiIE2oliGefc+Rt1ORL+1rIGD50Eg==
X-Received: by 2002:a05:622a:6206:b0:2f1:d7bc:7522 with SMTP id hj6-20020a05622a620600b002f1d7bc7522mr14438618qtb.556.1652094407663;
        Mon, 09 May 2022 04:06:47 -0700 (PDT)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com. [209.85.219.178])
        by smtp.gmail.com with ESMTPSA id w21-20020a05620a129500b0069fc13ce223sm6539864qki.84.2022.05.09.04.06.47
        for <linux-m68k@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 May 2022 04:06:47 -0700 (PDT)
Received: by mail-yb1-f178.google.com with SMTP id x17so3720225ybj.3
        for <linux-m68k@vger.kernel.org>; Mon, 09 May 2022 04:06:47 -0700 (PDT)
X-Received: by 2002:a05:6902:905:b0:64a:2089:f487 with SMTP id
 bu5-20020a056902090500b0064a2089f487mr12478988ybb.202.1652094407003; Mon, 09
 May 2022 04:06:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220127074158.25888-1-schmitzmic@gmail.com> <20220127074158.25888-2-schmitzmic@gmail.com>
In-Reply-To: <20220127074158.25888-2-schmitzmic@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 9 May 2022 13:06:36 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWYf=VSRa0CatKYHACaQarqNz9ETJqJXBj_pg1MeeK7Rg@mail.gmail.com>
Message-ID: <CAMuHMdWYf=VSRa0CatKYHACaQarqNz9ETJqJXBj_pg1MeeK7Rg@mail.gmail.com>
Subject: Re: [PATCH v10 1/3] m68k/kernel - wire up syscall_trace_enter/leave
 for m68k
To:     Michael Schmitz <schmitzmic@gmail.com>
Cc:     "Linux/m68k" <linux-m68k@vger.kernel.org>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        Al Viro <viro@zeniv.linux.org.uk>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Thu, Jan 27, 2022 at 8:42 AM Michael Schmitz <schmitzmic@gmail.com> wrote:
> m68k (other than Coldfire) uses syscall_trace for both trace entry
> and trace exit. Seccomp support requires separate entry points for
> trace entry and exit which are already provided for Coldfire.
>
> Replace syscall_trace by syscall_trace_enter and syscall_trace_leave
> in preparation for seccomp support.
>
> No regression seen in testing with strace on ARAnyM.
>
> Signed-off-by: Michael Schmitz <schmitzmic@gmail.com>
> Acked-by: "Eric W. Biederman" <ebiederm@xmission.com>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
i.e. will queue in the m68k for-v5.19 branch.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
