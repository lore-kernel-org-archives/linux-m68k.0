Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53050C77B75
	for <linux-m68k@archiver.kernel.org>; Fri, 21 Apr 2023 07:50:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230401AbjDUHug convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 21 Apr 2023 03:50:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230480AbjDUHuf (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 21 Apr 2023 03:50:35 -0400
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C190393C7
        for <linux-m68k@lists.linux-m68k.org>; Fri, 21 Apr 2023 00:50:27 -0700 (PDT)
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-b983027d0faso1245515276.0
        for <linux-m68k@lists.linux-m68k.org>; Fri, 21 Apr 2023 00:50:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682063427; x=1684655427;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BkpYhZmr123XoZwxeuyT9/faeSkMZw8H0JzS3L2I10s=;
        b=KkZJJykMXNrCpF8OB+qINHevGXHXlJRruQgfJ28IGReyeu50bhJcwAaZk18ERXmxP1
         KjB5KBATS5etFZa7yR9D1+vQou44Vxpkk0yRZ9rDxBpEyc06VRF5txDaOCY46p9VsWMe
         8oLJHeYCauR3UhUlgqu+Al+JcNl1j8urFWc5RV47MLHDNBEhm3ZtcHbCtiD2J+MSSQW3
         Z9UvLWyXwwqdvgm/fviI8nqRJc3Wwt64tYS0WXa7z1iQWqEDY3Mu2+qbqgxEpASol7Ee
         dT1TrHvgPsaLEuFuD2gKw7Zr13blSsPAvlLpJLKKgHTqejHOIXJsYQKgzlP7NG+sIk/2
         XpFA==
X-Gm-Message-State: AAQBX9fHySWL/GyA9UYtJcb4cm2rvzZCSeGySKDYqG9LZHhN/dUPDzIK
        rJ+LrDNC3MWhmAwm126KMHkSO1osZ3f5+6Hw
X-Google-Smtp-Source: AKy350ZhA10ySarFrDgAWDbqQVwLls9Onyw5TTo5NaoIiduqx/j3CBntCTM8xtWdE2UbO+re5KHNiA==
X-Received: by 2002:a25:ace6:0:b0:b8f:2fc0:d4dd with SMTP id x38-20020a25ace6000000b00b8f2fc0d4ddmr1631913ybd.45.1682063426598;
        Fri, 21 Apr 2023 00:50:26 -0700 (PDT)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com. [209.85.219.172])
        by smtp.gmail.com with ESMTPSA id s14-20020a5b074e000000b00b993995abe4sm74178ybq.60.2023.04.21.00.50.25
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Apr 2023 00:50:26 -0700 (PDT)
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-b92284f69ebso1673317276.3
        for <linux-m68k@lists.linux-m68k.org>; Fri, 21 Apr 2023 00:50:25 -0700 (PDT)
X-Received: by 2002:a25:4d8:0:b0:b98:c9af:b9c7 with SMTP id
 207-20020a2504d8000000b00b98c9afb9c7mr1724109ybe.26.1682063425192; Fri, 21
 Apr 2023 00:50:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230421-m68k-kexec-include-reboot-v1-1-7552963a0f25@kernel.org>
In-Reply-To: <20230421-m68k-kexec-include-reboot-v1-1-7552963a0f25@kernel.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 21 Apr 2023 09:50:13 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUuV=JmoLoEOL1TfBBmFAMbqOGz0oHn3kz1QN_7s_uObQ@mail.gmail.com>
Message-ID: <CAMuHMdUuV=JmoLoEOL1TfBBmFAMbqOGz0oHn3kz1QN_7s_uObQ@mail.gmail.com>
Subject: Re: [PATCH] m68k: kexec: include reboot.h
To:     Simon Horman <horms@kernel.org>
Cc:     Baoquan He <bhe@redhat.com>,
        "Leizhen (ThunderTown)" <thunder.leizhen@huawei.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-m68k@lists.linux-m68k.org, kexec@lists.infradead.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Fri, Apr 21, 2023 at 9:11 AM Simon Horman <horms@kernel.org> wrote:
> Include reboot.h in machine_kexec.c for declaration of
> machine_crash_shutdown and machine_shutdown.
>
> gcc-12 with W=1 reports:
>
>  arch/m68k/kernel/machine_kexec.c:26:6: warning: no previous prototype for 'machine_shutdown' [-Wmissing-prototypes]
>     26 | void machine_shutdown(void)
>        |      ^~~~~~~~~~~~~~~~
>  arch/m68k/kernel/machine_kexec.c:30:6: warning: no previous prototype for 'machine_crash_shutdown' [-Wmissing-prototypes]
>     30 | void machine_crash_shutdown(struct pt_regs *regs)
>        |      ^~~~~~~~~~~~~~~~~~~~~~
>
> No functional changes intended.
> Compile tested only.
>
> Signed-off-by: Simon Horman <horms@kernel.org>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
i.e. will queue in the m68k for-v6.4 branch.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
