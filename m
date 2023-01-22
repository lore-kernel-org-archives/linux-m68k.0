Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F5F0C25B4E
	for <linux-m68k@archiver.kernel.org>; Sun, 22 Jan 2023 16:35:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229814AbjAVQfr (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 22 Jan 2023 11:35:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229766AbjAVQfr (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Sun, 22 Jan 2023 11:35:47 -0500
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BB60FF07
        for <linux-m68k@vger.kernel.org>; Sun, 22 Jan 2023 08:35:44 -0800 (PST)
Received: by mail-qv1-f42.google.com with SMTP id e19so4248051qvw.13
        for <linux-m68k@vger.kernel.org>; Sun, 22 Jan 2023 08:35:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IhhIvokiD1rNNK4lcmj3j4UaaORnjeIZMIQ1ASxeAJo=;
        b=B4um2VLvu/rLJ+0qrytld2GmRl/UEZ9Res3yXHx/IY3aExhAz0ObhT2PeV1U/qZ07Z
         mKa3IbqAeQJBWCEo+q03MoRH0aqtBln+ryN1sq54IyiXRu/CVydzYl/KoqtR37ogn1EE
         9tFFOsJL8VJ80kJBKK88MQL3eos+ncLikKwDtdfPqnAo4LS21pPLa5j5uxG7FyhF6TKo
         yrapc9P4hW2PWJRgJStCEHOcOXHVneaQAKst7UMlDSvZpZN8Sbra4MGGF8lzfLy+SoVW
         /erZ4vieTqtzsuT+jQti92PlK622FOHVFDt9sJGTSZy3GwjSIj7sCZGzhnw+uAejbXch
         TCOg==
X-Gm-Message-State: AFqh2krT1Opw94qdP4M6iKo9kxYpGgqlfnbhjcrLrOZ6iLvIJcHcS10x
        JJF72L81ECskgYSQQqykZM/BwPKbKqidLA==
X-Google-Smtp-Source: AMrXdXuFdgpBlrk6II4A5+iputvL2pl4jwL9ro6tM36gFowjkCj1/1XTfj5NFnXjxoo4F8kPgEGBTQ==
X-Received: by 2002:a05:6214:57d1:b0:534:dfd9:98e with SMTP id lw17-20020a05621457d100b00534dfd9098emr32795667qvb.26.1674405343122;
        Sun, 22 Jan 2023 08:35:43 -0800 (PST)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com. [209.85.128.179])
        by smtp.gmail.com with ESMTPSA id y10-20020a05620a25ca00b006fa4cac54a5sm30025658qko.72.2023.01.22.08.35.42
        for <linux-m68k@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Jan 2023 08:35:42 -0800 (PST)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-501c3a414acso76595057b3.7
        for <linux-m68k@vger.kernel.org>; Sun, 22 Jan 2023 08:35:42 -0800 (PST)
X-Received: by 2002:a0d:e657:0:b0:4d9:3858:392 with SMTP id
 p84-20020a0de657000000b004d938580392mr1823027ywe.502.1674405342374; Sun, 22
 Jan 2023 08:35:42 -0800 (PST)
MIME-Version: 1.0
References: <20230112035529.13521-1-schmitzmic@gmail.com> <20230112035529.13521-2-schmitzmic@gmail.com>
In-Reply-To: <20230112035529.13521-2-schmitzmic@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Sun, 22 Jan 2023 17:35:31 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWW=5MJZL0ztbPhAp726zX=PoGArQhgXz4fekJQUoCmRw@mail.gmail.com>
Message-ID: <CAMuHMdWW=5MJZL0ztbPhAp726zX=PoGArQhgXz4fekJQUoCmRw@mail.gmail.com>
Subject: Re: [PATCH v13 1/3] m68k/kernel - check syscall_trace_enter() return
 code on m68k
To:     Michael Schmitz <schmitzmic@gmail.com>
Cc:     linux-m68k@vger.kernel.org, glaubitz@physik.fu-berlin.de
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Thu, Jan 12, 2023 at 4:55 AM Michael Schmitz <schmitzmic@gmail.com> wrote:
> Check return code of syscall_trace_enter(), and skip syscall
> if -1. Return code will be left at what had been set by
> ptrace or seccomp (in regs->d0).
>
> No regression seen in testing with strace on ARAnyM.
>
> Signed-off-by: Michael Schmitz <schmitzmic@gmail.com>
>
> --
> Changes from v12:
>
> - prevent overwriting the syscall return value after change
>   by ptrace or seccomp on 68020+

Thanks for the update!
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.3.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
