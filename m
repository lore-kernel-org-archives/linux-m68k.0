Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74D32C61DA4
	for <linux-m68k@archiver.kernel.org>; Mon,  6 Feb 2023 12:59:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229952AbjBFM7k (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 6 Feb 2023 07:59:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229791AbjBFM7j (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 6 Feb 2023 07:59:39 -0500
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76F2416311
        for <linux-m68k@lists.linux-m68k.org>; Mon,  6 Feb 2023 04:59:38 -0800 (PST)
Received: by mail-ot1-x335.google.com with SMTP id 14-20020a9d010e000000b0068bdddfa263so3159847otu.2
        for <linux-m68k@lists.linux-m68k.org>; Mon, 06 Feb 2023 04:59:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=timesys-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=u8miXVEsAasWL4kIGDK7yVZHn79+yexd4UDO99DWlXI=;
        b=cQb4pf+T5TINoX/GrdK+YS/iY7p2Fd1+uTAfgLbQbau4QD7lD2TaC0fUjBCX5tw0Ty
         ShAqHs975OVR3A3kXIwwMBp5U8+GuiMNDs2Y3inQeUxPXI8shmRaGDovzJMBfP/dUtR4
         Sh0GLQsfW9FR1gTxXtbg7+gh+Xt+ulvKAI5YlG4KjiJ7EHE0tFK8ZtSu7VHjV+cUIHUc
         2Xq3tZqz9wr1hjLtl6lGm7i3Eus4gST1pBUYITXNlKz1o1D3c/8fM+aZ4KIaOh0lZnXI
         5WGSiPaGyjo+U06iVKjTqA5SrJc3taf9qyfX3MHAZh9dmzpqvZsk0bmk7/Doye1zkT5m
         JKvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u8miXVEsAasWL4kIGDK7yVZHn79+yexd4UDO99DWlXI=;
        b=V8bOJnSrmoTDeTQ8pEANGk4ppPfaRsyGrMTgNtEqVVYjNpYwWdWAqrs6geC1tI0GuL
         hNaWLRkFjRLawXHMSui72teuutX5ae8RjapAtYAn3CRFEAs4HvboQolbO3umsONAsnnU
         g1Hi8U+uvNL72fvlfFl07y1Y9V6S8TwngJxFvgUYKCHf33qpb+mYoj32oFeb5ynY4HmH
         /sAR/ZPyOJycukmVXnDu98ltQE0kmnbRddxPu5NCNqof6/m52FvZRcSKIxhDur0bHVv7
         cnvXGFcJiwOPC3OpmEN08+hhCGMu1TBpeOe+6Hc/5eI37jwytSL4vBaIMZzrj+rM5P09
         WROw==
X-Gm-Message-State: AO0yUKXcdG+sN5F2J8R0bstEByEhRxWyuMQXQHWQAlOdVkOOo8RBHAGv
        dux0iCL6elpCrORqOt4qfqhfatJEDnFQDYPJKdL1FQ==
X-Google-Smtp-Source: AK7set+2QVusKEr9Htq7Yl1KnnPVackum+DhJ7wWsw4TQgPHK/AukHOTdvBrbpv4X1QOuApL5lO87eZhooiELpY3xAo=
X-Received: by 2002:a9d:3e1e:0:b0:68b:bc50:bf with SMTP id a30-20020a9d3e1e000000b0068bbc5000bfmr946076otd.74.1675688377641;
 Mon, 06 Feb 2023 04:59:37 -0800 (PST)
MIME-Version: 1.0
References: <Y9PWhU7DVQCLP9EX@bill-the-cat> <CAMuHMdUMvGhpbfsTaaNSpypH_XdKjVzY3yWOOpR=Acj_7K6-uw@mail.gmail.com>
 <CALJHbkBqdvJu8KGKbJ2eayhiP_t607AvuwgYidhLTPY7=Mt4Hg@mail.gmail.com>
 <Y9fs2wH4WHIzae5r@bill-the-cat> <7739d9da9f49f99d156dacf645a311388e9eb628.camel@physik.fu-berlin.de>
 <af87d98baa2eb3bf253a1f06bc29ee9cd5034e3b.camel@physik.fu-berlin.de>
 <CALJHbkAuaGrfiAm2jzTmrAPSM+Gq1z-gVSZ+7hgn8-e_Lr82XQ@mail.gmail.com> <b7d1cfce-3ba3-6621-60c0-9b401a382971@kernel.org>
In-Reply-To: <b7d1cfce-3ba3-6621-60c0-9b401a382971@kernel.org>
From:   Angelo Dureghello <angelo.dureghello@timesys.com>
Date:   Mon, 6 Feb 2023 13:59:07 +0100
Message-ID: <CALJHbkBMNd-3sqCaAFMxc__7NBYRB7-D9SmH4VqRTM=cTpUxaw@mail.gmail.com>
Subject: Re: U-Boot support for M68K removal
To:     Greg Ungerer <gerg@kernel.org>
Cc:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Tom Rini <trini@konsulko.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k@lists.linux-m68k.org,
        Joshua Thompson <funaho@jurai.org>,
        Philip Blundell <philb@gnu.org>, u-boot@lists.denx.de,
        Huan Wang <alison.wang@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Greg,

On Mon, Feb 6, 2023 at 1:02 PM Greg Ungerer <gerg@kernel.org> wrote:
>
>

> I wish I had a 54415 based board in my collection. Would make it so
> much easier to keep the kernel working on it :-(
>
> Regards
> Greg
>

I can solder here one additional stmark2 for you when i find the time.

You can send me your data at
angelo AT kernel-space.org

Regards
-- 
angelo
