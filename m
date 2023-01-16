Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5F71C63797
	for <linux-m68k@archiver.kernel.org>; Mon, 16 Jan 2023 14:47:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231654AbjAPOro (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 16 Jan 2023 09:47:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231668AbjAPOrT (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 16 Jan 2023 09:47:19 -0500
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com [IPv6:2607:f8b0:4864:20::b36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15577234C2
        for <linux-m68k@lists.linux-m68k.org>; Mon, 16 Jan 2023 06:29:46 -0800 (PST)
Received: by mail-yb1-xb36.google.com with SMTP id 203so30432343yby.10
        for <linux-m68k@lists.linux-m68k.org>; Mon, 16 Jan 2023 06:29:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LlT3/9OUvutP7VvfxlbNRKjuyN5KCHWjHMPtY13KD4A=;
        b=E11T6SWFQLjpvpWZl6/zFSmbp42oUMOwB76D9OrBwgxQDzKvjxiXLjM8wWs/SAeo03
         Np7KuQ638sd0tYB+EMBHAwA6Lb03gX/dR2BN46C57YrIt4ttEC4MqZTKFfSAod9RpT/O
         6fdYAVXJ/TEjXYQmAM85Ia9TTXTN9o/ssBm8prfQTr+ntRLu2Ea5Eyqpci4Urqz50Mhc
         p6tXO52etbSZo8aho38HQQJwA9YMdUL2Bz2Lx/6Sy2yB+jSuJRKq89bowouaxoycArYO
         8CG8/oSWR1NWeS2R//rw7fmpvdPmT8Rbi5HN8Myl4OM6furTwSbZAw60e8NoBQaQv8oE
         /8KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LlT3/9OUvutP7VvfxlbNRKjuyN5KCHWjHMPtY13KD4A=;
        b=V0zCBeBQYMzDJzImN3Qn6ErbVIFvEHgDysX4BP8dqQIXLmo2V4634U20rwZzvf8q5q
         MdBip2Lk+6h5sIt+e/lkO9nyADXhT6YxqdE+sxG0Yehv+ZS5YWrfBV8PFAgTCXuStDdo
         PoL2Vb5B4CUgrTgru0TnV5oq60b7XMkL+lN6E89LYRmo089GB4bMUVPOcvuYVEKnEppM
         9cHc2jF3n+KldeJm3OLJRkwN7fBRhtxj3qMWQjjMFtnP6JRZkOEuKQkKi/1BGavUD9nf
         LRYs08xpL1fJa7/2buiqeorVxBkayJfwgzNzqChEMU6D8MlAxRZBN1/KUwJ4eJfLh7iO
         COsg==
X-Gm-Message-State: AFqh2kqH08AlMnbX938vgDQhLq2qrg2Vs3Cu4PJP7vsjysjPcbShJF5G
        GWvRfUcKYTGOS4x4iFqgDEi0sv9hVWG/hFsPayB/0w==
X-Google-Smtp-Source: AMrXdXtd5fUt49TBzg30p8QXrh2V1ZEz9SaQ+wLWPEoHDzNytLWHJ08uQw/FRD/pUVTwOpfRPAGa6eaS5bOvGE5QKXI=
X-Received: by 2002:a25:d08d:0:b0:7ca:9b40:72a7 with SMTP id
 h135-20020a25d08d000000b007ca9b4072a7mr1866366ybg.130.1673879385297; Mon, 16
 Jan 2023 06:29:45 -0800 (PST)
MIME-Version: 1.0
References: <20230112133942.58471-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20230112133942.58471-1-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 16 Jan 2023 15:29:34 +0100
Message-ID: <CACRpkdbZs1qF8sqHv+V4-su6rfQvHEJoEHPJkef4cj172ZYKew@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] gpio: Remove unused and obsoleted irq_to_gpio()
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        linux-doc-tw-discuss@lists.sourceforge.net,
        linux-m68k@lists.linux-m68k.org, linux-sh@vger.kernel.org,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        Yanteng Si <siyanteng@loongson.cn>,
        Hu Haowen <src.res@email.cn>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Thu, Jan 12, 2023 at 2:39 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> irq_to_gpio() is legacy and unused API, remove it for good.
>
> This leaves gpio_to_irq() as it's used yet in many places.
> Nevertheless, removal of its counterpart is a good signal
> to whoever even trying to consider using them that do not.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Thanks for killing off this API.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
