Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87A64C54EBE
	for <linux-m68k@archiver.kernel.org>; Tue, 10 Jan 2023 08:14:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231530AbjAJIOZ (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 10 Jan 2023 03:14:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237777AbjAJIOS (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Tue, 10 Jan 2023 03:14:18 -0500
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A8CE2DE2
        for <linux-m68k@vger.kernel.org>; Tue, 10 Jan 2023 00:14:17 -0800 (PST)
Received: by mail-qv1-f41.google.com with SMTP id o17so8094490qvn.4
        for <linux-m68k@vger.kernel.org>; Tue, 10 Jan 2023 00:14:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M4VIFTvvpOfdOSGfup1EPvnKtKZu2A4WpCCYUQt27aE=;
        b=5742BAEShNSYc82VacGbbXHwUwaOPBRJ/yQkLzbzHxWEjVDg/2wL8PPzt9ahBpAcP2
         v3YW6e5APm8VFQiCDCYcxW6mMdcn69OAZr+axxGE52bG3sQiYXDylZbKJq1TKLQ2yPz3
         t0psmMV0AWzeVDRC0BfkRYb0LbI/sToDZCjZYx8zBKYEooBlZKwx4g/pog2tFrZ6qU2y
         3sEkoQLysb6uaCrxxHg6XakyRcMPwwv1/OotceP9YSYWoqqVZNO+PJWU8G6k1TZQOWHU
         /yXlNz7x+tKDPTQIXSfHrqKFdbbfWSnmSz/T7CPJ/BQxFudr2blUJ58xrKMPS4AGyeVP
         CwOA==
X-Gm-Message-State: AFqh2koKSA6kg9IlhkUTaVhtBT0DRlkUHSaCDyuQHEzpSr9RkjTdNEnq
        /I1kqo9D2f/ZpRvOVTbGGc/wN4EsTdRNZA==
X-Google-Smtp-Source: AMrXdXvUMbk3kjaoP39HV0ph1lGxRSkql1ptumo/ev3fUKDi9e4+75fyhuGKJkmCgIRo5zH6DKhuEA==
X-Received: by 2002:a05:6214:2c20:b0:51f:6fd9:e5a with SMTP id lc32-20020a0562142c2000b0051f6fd90e5amr95024432qvb.39.1673338455974;
        Tue, 10 Jan 2023 00:14:15 -0800 (PST)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com. [209.85.219.170])
        by smtp.gmail.com with ESMTPSA id x4-20020a05620a258400b006fca1691425sm6807645qko.63.2023.01.10.00.14.15
        for <linux-m68k@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jan 2023 00:14:15 -0800 (PST)
Received: by mail-yb1-f170.google.com with SMTP id t15so11047546ybq.4
        for <linux-m68k@vger.kernel.org>; Tue, 10 Jan 2023 00:14:15 -0800 (PST)
X-Received: by 2002:a25:d84e:0:b0:7b4:6a33:d89f with SMTP id
 p75-20020a25d84e000000b007b46a33d89fmr1268332ybg.543.1673338455343; Tue, 10
 Jan 2023 00:14:15 -0800 (PST)
MIME-Version: 1.0
References: <20230110030546.21688-1-schmitzmic@gmail.com>
In-Reply-To: <20230110030546.21688-1-schmitzmic@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 10 Jan 2023 09:14:03 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVJR3hVx9um5uLKzRptFyAGk8w6mQuwb2H0XQQ=vqvkzw@mail.gmail.com>
Message-ID: <CAMuHMdVJR3hVx9um5uLKzRptFyAGk8w6mQuwb2H0XQQ=vqvkzw@mail.gmail.com>
Subject: Re: [PATCH RESEND v11 0/3] Add kernel seccomp support for m68k
To:     Michael Schmitz <schmitzmic@gmail.com>
Cc:     linux-m68k@vger.kernel.org, glaubitz@physik.fu-berlin.de
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Michael,

On Tue, Jan 10, 2023 at 4:05 AM Michael Schmitz <schmitzmic@gmail.com> wrote:
> [Resending after removing yet another leftover merge
> conflict - thanks to Finn Thain for spotting that ...]

Please increase the version number of the whole series.
Doing it without breaks tools like b4.

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
