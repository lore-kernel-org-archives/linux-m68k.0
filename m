Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC48DC433EF
	for <linux-m68k@archiver.kernel.org>; Mon, 15 Nov 2021 09:59:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8DB8063210
	for <linux-m68k@archiver.kernel.org>; Mon, 15 Nov 2021 09:59:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230452AbhKOKCY (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 15 Nov 2021 05:02:24 -0500
Received: from mail-ua1-f44.google.com ([209.85.222.44]:40951 "EHLO
        mail-ua1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229456AbhKOKCX (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Mon, 15 Nov 2021 05:02:23 -0500
Received: by mail-ua1-f44.google.com with SMTP id y5so15670194ual.7
        for <linux-m68k@vger.kernel.org>; Mon, 15 Nov 2021 01:59:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lkOiHq+WiTN6gRKTjaQySk9L4ieIPb9sZZHKtJt/B5Y=;
        b=NT4uh0iLGocBiW6fHz7fwufoohwLCxUWJYqylrO61heGIT+noIkyQoRHluO3HyX0BH
         JRTHA2V16fggEyMlhL6da32SncquoPj2jlOcbhWkQJ6RJFkLJeN6bQECHBgM576t44HM
         9VS6M0rmAUYtY4v+nVMJlVoItsinHCXwbNnNNuT1obHuZZmdTsIoYdK9Wsn/OBW5F3op
         y7yL2TLhAqTeClNzQhqXhIl07RRF3cNzM3TwhstQaZ9oJDP6krq0i5YEAkoSkg/Rn9nW
         K0xb6xSq/U5Ei7UudHi+6J5NRkr9Zlt7yWuj+TV3l6i/4ePa3WkfvHqQO+X+fopGmQgl
         MD6A==
X-Gm-Message-State: AOAM531BQS/Sasj/rrw+VGUHubuY3SrD4I65QL7VWgAQTMvL3aoAEdDW
        Oooa0f8+GG8eCgwmtAEJ9uhvM0KfA0Qubw==
X-Google-Smtp-Source: ABdhPJyvVlg+ktqPW4sCW6076McS0jVIzLBSNYHMqp8ycJQwr3xcys4LeDudG0VtZeel5w+Z4tNacg==
X-Received: by 2002:a05:6102:5109:: with SMTP id bm9mr40166741vsb.10.1636970367755;
        Mon, 15 Nov 2021 01:59:27 -0800 (PST)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id c11sm8932749vsh.22.2021.11.15.01.59.27
        for <linux-m68k@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Nov 2021 01:59:27 -0800 (PST)
Received: by mail-ua1-f53.google.com with SMTP id w23so10647343uao.5
        for <linux-m68k@vger.kernel.org>; Mon, 15 Nov 2021 01:59:27 -0800 (PST)
X-Received: by 2002:a9f:3e01:: with SMTP id o1mr9067423uai.89.1636970367208;
 Mon, 15 Nov 2021 01:59:27 -0800 (PST)
MIME-Version: 1.0
References: <20211114234005.335-1-schmitzmic@gmail.com> <20211114234005.335-2-schmitzmic@gmail.com>
In-Reply-To: <20211114234005.335-2-schmitzmic@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 15 Nov 2021 10:59:15 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWP-15RzVZiE1zR3sdSf06bqj9LZwh3BkgpoUHmvqxLsg@mail.gmail.com>
Message-ID: <CAMuHMdWP-15RzVZiE1zR3sdSf06bqj9LZwh3BkgpoUHmvqxLsg@mail.gmail.com>
Subject: Re: [PATCH v11 1/3] m68k: amiga/pcmcia - add 16 bit detection
 interface to amipcmcia.h
To:     Michael Schmitz <schmitzmic@gmail.com>
Cc:     "Linux/m68k" <linux-m68k@vger.kernel.org>,
        ALeX Kazik <alex@kazik.de>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Mon, Nov 15, 2021 at 12:40 AM Michael Schmitz <schmitzmic@gmail.com> wrote:
> Add the interface definition for 16 bit card autoprobing (using
> the generic PCMCIA cftable entry parser) to amipcmcia.h for use
> by apne.c. Include necessary cftable definitions from cistpl.h,
> remove locally duplicate definitions from amipcmcia.h.
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
