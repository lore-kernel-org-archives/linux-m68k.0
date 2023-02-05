Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8D39C636CC
	for <linux-m68k@archiver.kernel.org>; Sun,  5 Feb 2023 20:41:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229582AbjBEUlw (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 5 Feb 2023 15:41:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229567AbjBEUlp (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sun, 5 Feb 2023 15:41:45 -0500
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6F691C5AB
        for <linux-m68k@lists.linux-m68k.org>; Sun,  5 Feb 2023 12:41:38 -0800 (PST)
Received: by mail-ej1-x631.google.com with SMTP id qw12so29017283ejc.2
        for <linux-m68k@lists.linux-m68k.org>; Sun, 05 Feb 2023 12:41:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nA/a76A+HUu/p3q1j/ksBjPXLniSmCFkRwLsRUtoauc=;
        b=RAXg4fKD/6SPLwBhZz74xHccwCI6WZIYpGpGHWQ9ObJeCvGoohTSAtwCqfiD+ZaDQ1
         aIRLI8OL+avYEEBlM4uINCdq7A3GKoZhraxTCpB9pYCimwQ4kIElEWhkml7G/7PEKTT6
         Vy21ly1st4HkkM+1bI4kXV+bK57J6A6HvWAas=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nA/a76A+HUu/p3q1j/ksBjPXLniSmCFkRwLsRUtoauc=;
        b=jhj7zgf4MRTjWo8HVbHhXxB9tgFjq8BSDFyLLV+iznW+zJv1qQjyAjJL5d8Wfo8Ezz
         wMZTuYpZq/crZa8tSIZCsuR4JX84vn81F2UsvLZT9MZtgNA9jz3pJVxhiPGLoM7UZQrn
         mD6K3hLcMZTMsyuurTfY6YXfZWBSY91mus6J23YOb0lQgCVzAoBG4Io3GixcG9T6WU2t
         HSbZgpqSY87xLRgV2MjUH+oZYEmH9wJJ4Hd285QNQqe9iZpos3cnOUmhhtHUsx3ic/6g
         OW45ofy9fwHDx79Oq4Jcf6CIJq5olq4ydNy2J1Wf7Q5Q8qW2jF2roF8/QmZBV4sYMksz
         5ZaQ==
X-Gm-Message-State: AO0yUKU0ayCXAfRed1CCXB7+bQx0XlQ0vCXNBKGmsiwlSEAv29P2bmvP
        hI+/NzKYJvnRwbv0tnKivwVCknjUTWgAGUSYGYo=
X-Google-Smtp-Source: AK7set8SfqwhLH0TOf3NEjmzB6ZuPvnl0Zp5atlEXQUcD3e9oSneX7DVnvtgYWYJex/Zf98s8/Y1iA==
X-Received: by 2002:a17:906:3e0d:b0:878:8073:4915 with SMTP id k13-20020a1709063e0d00b0087880734915mr16167328eji.15.1675629696915;
        Sun, 05 Feb 2023 12:41:36 -0800 (PST)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com. [209.85.218.53])
        by smtp.gmail.com with ESMTPSA id z2-20020a1709064e0200b00887a23bab85sm4478261eju.220.2023.02.05.12.41.35
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Feb 2023 12:41:36 -0800 (PST)
Received: by mail-ej1-f53.google.com with SMTP id bk15so28934914ejb.9
        for <linux-m68k@lists.linux-m68k.org>; Sun, 05 Feb 2023 12:41:35 -0800 (PST)
X-Received: by 2002:a17:906:892:b0:87a:7098:ca09 with SMTP id
 n18-20020a170906089200b0087a7098ca09mr4402604eje.78.1675629695651; Sun, 05
 Feb 2023 12:41:35 -0800 (PST)
MIME-Version: 1.0
References: <Y9lz6yk113LmC9SI@ZenIV> <Y9l0aBPUEpf1bci9@ZenIV>
 <92a4aa45-0a7c-a389-798a-2f3e3cfa516f@linux-m68k.org> <Y+AUEJpWYdUzW0OD@ZenIV>
In-Reply-To: <Y+AUEJpWYdUzW0OD@ZenIV>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sun, 5 Feb 2023 12:41:18 -0800
X-Gmail-Original-Message-ID: <CAHk-=wh8+LsDDd8AFMwaYHAA+eLT8O2ziEJfpoeo_H6MCg2NKg@mail.gmail.com>
Message-ID: <CAHk-=wh8+LsDDd8AFMwaYHAA+eLT8O2ziEJfpoeo_H6MCg2NKg@mail.gmail.com>
Subject: Re: [PATCH 04/10] m68k: fix livelock in uaccess
To:     Al Viro <viro@zeniv.linux.org.uk>
Cc:     Finn Thain <fthain@linux-m68k.org>, linux-arch@vger.kernel.org,
        linux-alpha@vger.kernel.org, linux-ia64@vger.kernel.org,
        linux-hexagon@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
        Michal Simek <monstr@monstr.eu>,
        Dinh Nguyen <dinguyen@kernel.org>,
        linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org,
        sparclinux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Sun, Feb 5, 2023 at 12:39 PM Al Viro <viro@zeniv.linux.org.uk> wrote:
>
> BTW, since these patches would be much easier to backport than any unification
> work, I think the right thing to do would be to have further unification done on
> top of them.

Ack. I'm not NAKing the patches, I was just hoping that we also have
some way forward.

So "fix the issues, then unify" sounds like the right thing to do to me.

               Linus
