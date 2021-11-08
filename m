Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC0BEC433F5
	for <linux-m68k@archiver.kernel.org>; Mon,  8 Nov 2021 08:36:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A593061002
	for <linux-m68k@archiver.kernel.org>; Mon,  8 Nov 2021 08:36:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235272AbhKHIiz (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 8 Nov 2021 03:38:55 -0500
Received: from mail-ua1-f42.google.com ([209.85.222.42]:34348 "EHLO
        mail-ua1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235223AbhKHIiz (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Mon, 8 Nov 2021 03:38:55 -0500
Received: by mail-ua1-f42.google.com with SMTP id b3so29988945uam.1
        for <linux-m68k@vger.kernel.org>; Mon, 08 Nov 2021 00:36:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=O85jXDlIhDrBvas5K+8sQEDRZx/b9o2lLkxMrSAFTUs=;
        b=vQ/nQeYJiUthVDO2b3za5vFPgWPOneylH8ml3xBi7fGdAxNUG8OHbTCAAeRJZnzpjN
         vNiNoy7B/MLyD17u+HYcUYpFG6fMinazT8QfZM6a/3vloABSeo7JizUkN0Nk0DG4bLZ7
         PHj7xdOfppfABIu2qMFTfPMOo8R9WYIRoXqfv2nJiiIMHGbj4H4eo+yUcgjFWNsUm7yv
         R52YZnUK+OLO3WlAiEZxCaMTYJxn7VZPfLI/kIUEwIOjI5mA2vsLnmK2awUDQ54utqvp
         94rTWWWQIVOSfIFDZaZDvFa4OUEsuw3is2mi2tDKr3N2AusYE1mmMAokFhocPCEQR6+4
         lmtw==
X-Gm-Message-State: AOAM532Zlk+BTVNg6xrGtKoBYJSFkXC5GUS9tTv+JFkwtpPKzD7sJX3G
        alccfCfqnDm4BlEJnfjPFfKD6NOIWtr2pw==
X-Google-Smtp-Source: ABdhPJw8dqKlP6luW1P8+BUEPh7GBJABha85nk2u3CmAFedNv9XXyMQFz35/BiTiiT3f95ScxTYwow==
X-Received: by 2002:a05:6102:5f2:: with SMTP id w18mr74545820vsf.6.1636360570792;
        Mon, 08 Nov 2021 00:36:10 -0800 (PST)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id t5sm3241595vsk.24.2021.11.08.00.36.10
        for <linux-m68k@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Nov 2021 00:36:10 -0800 (PST)
Received: by mail-ua1-f46.google.com with SMTP id o26so29931903uab.5
        for <linux-m68k@vger.kernel.org>; Mon, 08 Nov 2021 00:36:10 -0800 (PST)
X-Received: by 2002:a05:6102:2910:: with SMTP id cz16mr35905257vsb.9.1636360570521;
 Mon, 08 Nov 2021 00:36:10 -0800 (PST)
MIME-Version: 1.0
References: <20211104061102.30899-1-schmitzmic@gmail.com> <20211104061102.30899-3-schmitzmic@gmail.com>
In-Reply-To: <20211104061102.30899-3-schmitzmic@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 8 Nov 2021 09:35:59 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXKj4k7EaqU8bOGMqJtqPCQMFOGnYyWsuTHshc2rVZyAw@mail.gmail.com>
Message-ID: <CAMuHMdXKj4k7EaqU8bOGMqJtqPCQMFOGnYyWsuTHshc2rVZyAw@mail.gmail.com>
Subject: Re: [PATCH v8 2/3] m68k: io_mm.h - add APNE 100 MBit support
To:     Michael Schmitz <schmitzmic@gmail.com>
Cc:     "Linux/m68k" <linux-m68k@vger.kernel.org>,
        ALeX Kazik <alex@kazik.de>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Thu, Nov 4, 2021 at 7:11 AM Michael Schmitz <schmitzmic@gmail.com> wrote:
> Add code to support 10 Mbit and 100 Mbit mode for APNE driver.
>
> A new ISA type ISA_TYPE_AG16 dynamically switches the Amiga
> ISA inb accessor to word access as required by the 100 Mbit cards.
>
> Patch modified after patch "[PATCH RFC net-next] Amiga PCMCIA
> 100 MBit card support" submitted to netdev 2018/09/16 by Alex
> Kazik <alex@kazik.de>.
>
> Signed-off-by: Michael Schmitz <schmitzmic@gmail.com>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
