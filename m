Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54DBCCD3441
	for <linux-m68k@archiver.kernel.org>; Tue, 19 Sep 2023 06:44:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231570AbjISGoT convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 19 Sep 2023 02:44:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231546AbjISGoS (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 19 Sep 2023 02:44:18 -0400
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C677100
        for <linux-m68k@lists.linux-m68k.org>; Mon, 18 Sep 2023 23:44:12 -0700 (PDT)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-59bbdb435bfso52615067b3.3
        for <linux-m68k@lists.linux-m68k.org>; Mon, 18 Sep 2023 23:44:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695105851; x=1695710651;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kAmWc6PGNbz/v7P4Pzb+X6jxKjTax8yaPXnsgZKZYbo=;
        b=Pen/+5BtiwhvbdMIMFl67pjxMcHVJ0mXG77J/4kTGx44yKXpeknD8AWwlJr/yGz90N
         RCDTFtsKOBq+UPSI22AjaR9GQAVEfPYpcu5YSAbi/XXE1/YJEiH/3KaV4kcoquhr0bIF
         udCZXupZOJWZ9KLa19jU5hCW9j7x57ulA/mm/Dfuq/rGgtVIP2aQxf1Otd5nJwSZb7ID
         1NVIZ6Uoe/bf/gzfiRJBZmh+GASjRC9fc07tVog0MTvb/OJm8oBHJ8lsNrGfbhNyzeH5
         xYKun7WPXT65isgZIlTV/hPu+ux8dDDyWJEFq5r0YfvKoKa4AENJwws8OJ8Oa8kmdzX5
         j+6w==
X-Gm-Message-State: AOJu0YxOr55dyfwDtigaMdK//iGyLOSCMI7NJ+Wc5xUxUUJKk1j8F1iG
        G8mN0bRl035ajt5W6ey8XR4LReg2KIicpw==
X-Google-Smtp-Source: AGHT+IHi3rzsD1cTlsfRgYu6nBWhYqpIZgMNENOWrSxJy1H7jAlBlIGVeDjhOjS8QfvMT/mnikkNaw==
X-Received: by 2002:a25:b08a:0:b0:d81:c4d4:9e86 with SMTP id f10-20020a25b08a000000b00d81c4d49e86mr10345264ybj.64.1695105851370;
        Mon, 18 Sep 2023 23:44:11 -0700 (PDT)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com. [209.85.128.173])
        by smtp.gmail.com with ESMTPSA id b13-20020a252e4d000000b00d17586ff1f7sm2601868ybn.28.2023.09.18.23.44.10
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Sep 2023 23:44:10 -0700 (PDT)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-59c0442a359so43199477b3.0
        for <linux-m68k@lists.linux-m68k.org>; Mon, 18 Sep 2023 23:44:10 -0700 (PDT)
X-Received: by 2002:a81:d352:0:b0:59b:cfe1:bcf1 with SMTP id
 d18-20020a81d352000000b0059bcfe1bcf1mr10748173ywl.44.1695105850445; Mon, 18
 Sep 2023 23:44:10 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1695031668.git.geert@linux-m68k.org> <d91725ff1ed5d4b6ba42474e2ebfeebe711cba23.1695031668.git.geert@linux-m68k.org>
 <87h6nqlxli.fsf@mail.lhotse>
In-Reply-To: <87h6nqlxli.fsf@mail.lhotse>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 19 Sep 2023 08:43:58 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW6=wnOjT7qG4tHvc5X4JAJkkHMnVDsQ-dKM6i3FKyWWw@mail.gmail.com>
Message-ID: <CAMuHMdW6=wnOjT7qG4tHvc5X4JAJkkHMnVDsQ-dKM6i3FKyWWw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] powerpc: Replace GPL 2.0+ README.legal boilerplate
 with SPDX
To:     Michael Ellerman <mpe@ellerman.id.au>
Cc:     Greg Ungerer <gerg@linux-m68k.org>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Thomas Gleixner <tglx@linutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-m68k@lists.linux-m68k.org, linuxppc-dev@lists.ozlabs.org,
        linux-spdx@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Michael,

On Tue, Sep 19, 2023 at 4:13 AM Michael Ellerman <mpe@ellerman.id.au> wrote:
> Geert Uytterhoeven <geert@linux-m68k.org> writes:
> > Upstream Linux never had a "README.legal" file, but it was present
> > in early source releases of Linux/m68k.  It contained a simple copyright
> > notice and a link to a version of the "COPYING" file that predated the
> > addition of the "only valid GPL version is v2" clause.
> >
> > Get rid of the references to non-existent files by replacing the
> > boilerplate with SPDX license identifiers.
> >
> > Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
>
> LGTM.
>
> Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

Can you please take it through the PPC tree?
Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
