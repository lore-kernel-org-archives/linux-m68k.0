Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAE13C47096
	for <linux-m68k@archiver.kernel.org>; Thu,  3 Jun 2021 07:09:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CA7A060FE9
	for <linux-m68k@archiver.kernel.org>; Thu,  3 Jun 2021 07:09:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229635AbhFCHLh (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 3 Jun 2021 03:11:37 -0400
Received: from mail-ua1-f54.google.com ([209.85.222.54]:40855 "EHLO
        mail-ua1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229567AbhFCHLh (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Thu, 3 Jun 2021 03:11:37 -0400
Received: by mail-ua1-f54.google.com with SMTP id e12so127007ual.7
        for <linux-m68k@vger.kernel.org>; Thu, 03 Jun 2021 00:09:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8HLU7+1DcN/P5dm/O9Ji/h8l70USab8hrd8l3qwSNyM=;
        b=StlyRroqBLVqsK1vaz8SXgg+fjfHzvcaJ6qjJc+KbYfJlPODbxgadhYQETSJmVJ1cT
         f95JsobW+uOY0UTA3pxdgs7gwYenog/yiNwHrwHlNb/t7s/nk+eo24WooHq9K6853jWu
         /V43cetPkC6pel1KobXLBWqqjoaYyjedtZ9NP002GRuHRhxpFBEfc5jzLeVMcmv1xV7+
         em6BlutWhBQnwIOopzTo87lZ4I4aQZH+BLNgveKfyyFDzf3WJX0MRHRghaN0+rifwsDe
         qPpKH+We8XNL53qC0h/vRdff3nQZ1fYpr2JpEtNfPSjxW1g0JJxepL2FjJd64zkjXyO+
         a2jg==
X-Gm-Message-State: AOAM530WrMr0olPOoZqaeqpjJylFelwsBCdw+wZR2cvs8ZuxV0pJUMz7
        iHqL2HyST0QBRSNIPOwkblpnT0QdPNREFSFWKk4=
X-Google-Smtp-Source: ABdhPJy/HvWFq4Nb1AyGazEnBq8hqN5GYsRKX61NALKgkic3Houh5mf6sNwp5w40zM6oz5GoRoGVDDPgmTURP5K177g=
X-Received: by 2002:ab0:708c:: with SMTP id m12mr15445636ual.4.1622704192774;
 Thu, 03 Jun 2021 00:09:52 -0700 (PDT)
MIME-Version: 1.0
References: <CAMuHMdUskb3oicq8Kbf6MY_4mn4-Y1pJ-om4fny7k48gndscgg@mail.gmail.com>
 <1622611267-15825-1-git-send-email-schmitzmic@gmail.com> <4f52cce1-e894-c224-a42b-18cce4f61056@gmail.com>
In-Reply-To: <4f52cce1-e894-c224-a42b-18cce4f61056@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 3 Jun 2021 09:09:41 +0200
Message-ID: <CAMuHMdVqpBs2ZCZord_KYyQG0uVd7TkA532YvFkpbSi07odwLA@mail.gmail.com>
Subject: Re: [PATCH RFC 0/2] Fix m68k multiplatform ISA support
To:     Michael Schmitz <schmitzmic@gmail.com>
Cc:     "Linux/m68k" <linux-m68k@vger.kernel.org>, fthain@linux-m68k.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Michael,

On Thu, Jun 3, 2021 at 5:44 AM Michael Schmitz <schmitzmic@gmail.com> wrote:
> Point of detail: don't forget to run 'make clean' after applying this
> series. Modules are not automatically rebuilt after changes to our
> io_mm.h (should they?)

Yes they should.  If not, that's a bug in the build system.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
