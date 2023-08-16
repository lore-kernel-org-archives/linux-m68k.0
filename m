Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EBDDC41513
	for <linux-m68k@archiver.kernel.org>; Wed, 16 Aug 2023 14:56:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245704AbjHPO4Z convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 16 Aug 2023 10:56:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343872AbjHPO4F (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 16 Aug 2023 10:56:05 -0400
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4444C272B
        for <linux-m68k@lists.linux-m68k.org>; Wed, 16 Aug 2023 07:56:02 -0700 (PDT)
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-6bd066b0fd4so4558983a34.2
        for <linux-m68k@lists.linux-m68k.org>; Wed, 16 Aug 2023 07:56:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692197761; x=1692802561;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PWptNDRMUs2ZAaEq3Zc4y6Na38OgEqP5UG5bQfgs1Ds=;
        b=aFDFwtcVhhlCW1+vRA8rzndJcbPbiUpmxwwd12v9XxcXDnO6ChxCG7NoNOByo7SSKN
         4Hi+l0cESlzyGJ/j8R4HkoVDiggk/QlgwflTF/gZLgF5Hvv8amSoOAvEnRmYLwrx6jiU
         IcWfpGd3LuRVyRfZLnh0uhdNXaDO2Farc0Zo0aS0jXJP0N/AYAh2cE5Q2ib/PL+4GtNV
         tcSuSyPkrjLLrNpwPwOqWAo67ENQhSjeqeflmq+ocwe3WpCKdbdBE32zn7c5ED1M3elV
         xmie7J54D/0bbF4Fo874G7EGV9Wxdv1/F4oVikiqjN+sA9BIrtjgC5BnGBCp5KC00qdM
         cafg==
X-Gm-Message-State: AOJu0YxLvAlCuokZdYEtEjo7Hh3YfC+xzjq76aNl2Ydh6X1ybu606h9f
        7CY4itwWgqdxaUiUhGytiUbe20nK/NWgpQ==
X-Google-Smtp-Source: AGHT+IGR7MQeGjcZEufyb41BuEUWSvXj9Yok8NlzbsA8K9W19a9FbsQm1zJ2GYlyzljv9TsSk3PAQw==
X-Received: by 2002:a9d:7443:0:b0:6b7:5112:bc1a with SMTP id p3-20020a9d7443000000b006b75112bc1amr2025860otk.24.1692197761434;
        Wed, 16 Aug 2023 07:56:01 -0700 (PDT)
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com. [209.85.167.172])
        by smtp.gmail.com with ESMTPSA id w25-20020a056830111900b006b9b6aea237sm6175175otq.80.2023.08.16.07.56.01
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Aug 2023 07:56:01 -0700 (PDT)
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-3a812843f0fso1343451b6e.2
        for <linux-m68k@lists.linux-m68k.org>; Wed, 16 Aug 2023 07:56:01 -0700 (PDT)
X-Received: by 2002:a05:6358:6f1b:b0:135:499b:a68c with SMTP id
 r27-20020a0563586f1b00b00135499ba68cmr1098840rwn.8.1692197760871; Wed, 16 Aug
 2023 07:56:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230807153654.997091-1-masahiroy@kernel.org> <20230807153654.997091-2-masahiroy@kernel.org>
In-Reply-To: <20230807153654.997091-2-masahiroy@kernel.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 16 Aug 2023 16:55:49 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWqXKZOFAemsYB=5d+eOZdANh=KYhiE18otKPLPp4pP6Q@mail.gmail.com>
Message-ID: <CAMuHMdWqXKZOFAemsYB=5d+eOZdANh=KYhiE18otKPLPp4pP6Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] m68k: remove <asm/export.h>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org,
        linux-arch@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Mon, Aug 7, 2023 at 5:37 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
> All *.S files under arch/m68k/ have been converted to include
> <linux/export.h> instead of <asm/export.h>.
>
> Remove <asm/export.h>.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
i.e. will queue in the m68k for-v6.6 branch.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
