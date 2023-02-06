Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39475C61DA4
	for <linux-m68k@archiver.kernel.org>; Mon,  6 Feb 2023 08:15:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229831AbjBFIPT (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 6 Feb 2023 03:15:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229542AbjBFIPS (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 6 Feb 2023 03:15:18 -0500
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com [IPv6:2607:f8b0:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FCBFD502
        for <linux-m68k@lists.linux-m68k.org>; Mon,  6 Feb 2023 00:15:17 -0800 (PST)
Received: by mail-oi1-x22d.google.com with SMTP id 20so8314066oix.5
        for <linux-m68k@lists.linux-m68k.org>; Mon, 06 Feb 2023 00:15:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=timesys-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dUinwjIEud5ScA5CPC+83mpkv/hL3F8XpulRQ3sAlhE=;
        b=Mblfc8LrJz46j2GcLbnSUISMFGa4T+p/wNxXqFdXwPki/UxNj7XG4W49t4/VMISxrU
         EOwJLSnHh+Ab1bC7ZKnLEnjst50KM9/Ig/T068n7E77Vo/CzDN0/Ek5je3BLWs5YYIZI
         y1cS1nz1Ow2+0nso9T5vdpl+qu3bltsDLWTBSh/K35UpvbPHQK+iLwiHAVtJ4yN7j+HU
         b8Iz0KuobA9JBovYSpWjFlUUKxd4ZF8UJM2HVEfVQ9CPv58ZlvY+1+X2HdxUWiRUYdKc
         UK2COwNem9lQ0/9Elkl4uhyP4NdGTXFKGBlr7B4DO2bTGAfe81V2JOniFKZhldCswQdx
         YNYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dUinwjIEud5ScA5CPC+83mpkv/hL3F8XpulRQ3sAlhE=;
        b=xkLJsHnxnDaSMCUjw9CHSXNXjLRBJohgPOyBH8x2f1gQxVsQXL3tDkvPPKnC/M2W8s
         PHu4/RKQXaAW0BBZMoMm/FbOVgFQBGMIJi0Hr3KfhNxIvPXwK3rcswYv9ErMCp7O12Lj
         mvrn9We9aNhPFjh9Po6am/3e29bGd3/N89fX6PYj7xgaT4efG/mvtCwW9cO4sR2+GaeS
         39jd51pNRviZrKzkpmWGfPiE67QSani80aS2RAW25h4Ta8QabuB2Iry/7RD+KIedXzjM
         MzvO3BK8BMZeMfjc3iRAaMaLHQdco2kPpL7dXejPIGP+R54QT5z//4xr7m/0+xgrOpHl
         iVdg==
X-Gm-Message-State: AO0yUKUVhj5CaP1DD9yCmQW/Tl+98hx0Ttlp0SjJ6JQPtFVNxF/uh6f/
        ma7c2QRlCRPglMGN9N6gOLhFGJSiaTFcrdw9ejsiQg==
X-Google-Smtp-Source: AK7set+9Cb5ehSujS48HvJ2+DWCcy243LM+avEYg1u3RYW4mjiuijdR+iSW3SWrHmrGKGLG1wfv/0sOCWtukL+QEBSc=
X-Received: by 2002:a05:6808:c6:b0:378:4bd3:b102 with SMTP id
 t6-20020a05680800c600b003784bd3b102mr760177oic.299.1675671316367; Mon, 06 Feb
 2023 00:15:16 -0800 (PST)
MIME-Version: 1.0
References: <Y9PWhU7DVQCLP9EX@bill-the-cat> <CAMuHMdUMvGhpbfsTaaNSpypH_XdKjVzY3yWOOpR=Acj_7K6-uw@mail.gmail.com>
 <CALJHbkBqdvJu8KGKbJ2eayhiP_t607AvuwgYidhLTPY7=Mt4Hg@mail.gmail.com>
 <Y9fs2wH4WHIzae5r@bill-the-cat> <7739d9da9f49f99d156dacf645a311388e9eb628.camel@physik.fu-berlin.de>
 <af87d98baa2eb3bf253a1f06bc29ee9cd5034e3b.camel@physik.fu-berlin.de>
In-Reply-To: <af87d98baa2eb3bf253a1f06bc29ee9cd5034e3b.camel@physik.fu-berlin.de>
From:   Angelo Dureghello <angelo.dureghello@timesys.com>
Date:   Mon, 6 Feb 2023 09:14:46 +0100
Message-ID: <CALJHbkAuaGrfiAm2jzTmrAPSM+Gq1z-gVSZ+7hgn8-e_Lr82XQ@mail.gmail.com>
Subject: Re: U-Boot support for M68K removal
To:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc:     Tom Rini <trini@konsulko.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k@lists.linux-m68k.org,
        Joshua Thompson <funaho@jurai.org>,
        Philip Blundell <philb@gnu.org>, u-boot@lists.denx.de,
        Huan Wang <alison.wang@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi John,

On Sat, Feb 4, 2023 at 4:55 PM John Paul Adrian Glaubitz
<glaubitz@physik.fu-berlin.de> wrote:
>
> On Mon, 2023-01-30 at 17:22 +0100, John Paul Adrian Glaubitz wrote:
> > FWIW, m68k is still a very actively maintained architecture in the
> > Linux kernel and userland with even LLVM and Rust having recently
> > added support for m68k.
> >
> > I also own a Coldfire board myself (not sure which one without
> > looking), so I can offer to test U-Boot patches in the future.
>
> So, I just found my Coldfire board and it's actually a 547x/548x EVB
> fitted with a 5475 CPU module clocked at 266 MHz.
>
> I will get this board set up during the next weeks and I am happy to
> test any Coldfire kernel patches, and eventually, U-Boot patches if
> that board is still supported.
>

thanks a lot.

Actually, i am debugging on a 54415 based board, totally dead
using current master.
I cannot printf, so using some gpio's for debug.
Issue seems to happen at first puts, so, something related
to serial port initialization. Hope to fix this soon.

>
> Adrian
>
> --
>  .''`.  John Paul Adrian Glaubitz
> : :' :  Debian Developer
> `. `'   Physicist
>   `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913


Regards,
angelo

-- 
Angelo Dureghello
Timesys
e. angelo.dureghello@timesys.com
