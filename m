Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4524BC001B0
	for <linux-m68k@archiver.kernel.org>; Mon, 24 Jul 2023 09:01:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232087AbjGXJBJ convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 24 Jul 2023 05:01:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232086AbjGXJAv (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 24 Jul 2023 05:00:51 -0400
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77144E7F
        for <linux-m68k@lists.linux-m68k.org>; Mon, 24 Jul 2023 02:00:50 -0700 (PDT)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-583ae4818c8so29007017b3.3
        for <linux-m68k@lists.linux-m68k.org>; Mon, 24 Jul 2023 02:00:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690189249; x=1690794049;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VOXvAdgGFfyUI6gOLSWZe+HVhUskG1Kl4mS4DRRwsNQ=;
        b=MOkMVyTUoPpoe8WaO1qj2E2YUY8IkPVFEIira2lF93Wng3OJZLu19K+Aulbajxilzf
         q+XJo/ZHyy2rqzxN/zPW1isorebsXhwzqiggEjYx5OFk4+EwGp3eRfRTHs8MlHMmrhx+
         3dJdtegdnU9nCHKuYKBXmhGy8gKyXZJThPl8/Oy58VbTl8t3kAterjse6T7haGDB5xoB
         6yHNfynO+/r6k0EgfThQNTqTwsdhIBW8a/vshYeuztSOyoL3nXI1KlvQ0VWbxwfMxMUP
         YK0FA7JA3DWT/od7/8Sjn4qgRuL2NhBdNTa5uEUse33X5jXswFOWRYfUXA7kDjyR9pUm
         WuhA==
X-Gm-Message-State: ABy/qLZrAxW5ncUiXOV8Jay0h1/d00rMXsma+0Ceq902vyLF3lLLSExk
        XC2X44O9jG+YQJvFwzbaKGxz0eER9ZH2Lg==
X-Google-Smtp-Source: APBJJlFhM7YRqWnoMB1uznhVSBIKS1LlvnActxyiC7/2zuaYYPpLc4XWExU9LHHR4k7JcvhsXAcjXg==
X-Received: by 2002:a0d:f4c1:0:b0:57a:75b8:b790 with SMTP id d184-20020a0df4c1000000b0057a75b8b790mr6867159ywf.29.1690189249363;
        Mon, 24 Jul 2023 02:00:49 -0700 (PDT)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com. [209.85.128.171])
        by smtp.gmail.com with ESMTPSA id i199-20020a816dd0000000b005774338d039sm345323ywc.96.2023.07.24.02.00.49
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jul 2023 02:00:49 -0700 (PDT)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-58411e24eefso1466377b3.1
        for <linux-m68k@lists.linux-m68k.org>; Mon, 24 Jul 2023 02:00:49 -0700 (PDT)
X-Received: by 2002:a0d:cc0f:0:b0:56d:2d59:dc30 with SMTP id
 o15-20020a0dcc0f000000b0056d2d59dc30mr6549898ywd.24.1690189248957; Mon, 24
 Jul 2023 02:00:48 -0700 (PDT)
MIME-Version: 1.0
References: <20230713080020.72931-1-panzhiai@cdjrlc.com> <9dc7423a9e54f849212f21a59074ffb4@208suo.com>
In-Reply-To: <9dc7423a9e54f849212f21a59074ffb4@208suo.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 24 Jul 2023 11:00:37 +0200
X-Gmail-Original-Message-ID: <CAMuHMdViE_OMQC=Y9T30oK6Ho1zXegLoYN4KhWGHzuimkpeGTA@mail.gmail.com>
Message-ID: <CAMuHMdViE_OMQC=Y9T30oK6Ho1zXegLoYN4KhWGHzuimkpeGTA@mail.gmail.com>
Subject: Re: [PATCH] m68k: sun3: idprom: ERROR: "foo* bar" should be "foo *bar"
To:     hexingwei001@208suo.com
Cc:     sammy@sammy.net, linux-m68k@lists.linux-m68k.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Thu, Jul 13, 2023 at 10:09 AM <hexingwei001@208suo.com> wrote:
> Fix one occurrences of the checkpatch.pl error:
> ERROR: "foo* bar" should be "foo *bar"
>
> Signed-off-by: Xingwei He <hexingwei001@208suo.com>

Thanks for your patch!
But obviously you forgot to run scripts/checkpatch.pl on your own patch:

WARNING: From:/Signed-off-by: email name mismatch: 'From:
hexingwei001@208suo.com' != 'Signed-off-by: Xingwei He
<hexingwei001@208suo.com>'

> --- a/arch/m68k/sun3/idprom.c
> +++ b/arch/m68k/sun3/idprom.c
> @@ -83,7 +83,7 @@ static void __init display_system_type(unsigned char
> machtype)
>       prom_halt();
>   }
>
> -void sun3_get_model(unsigned char* model)
> +void sun3_get_model(unsigned char *model)
>   {
>       register int i;

Whitespace-damaged, so it fails to apply.

These problems are present in all your patches, so something is\
wrong in your workflow.  Please test your patches by running
scripts/checkpatch.pl, emailing them to yourself, and trying to
apply them.

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
