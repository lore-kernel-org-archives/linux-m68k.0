Return-Path: <SRS0=JkFh=5W=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC3ABC2BA19
	for <linux-m68k@archiver.kernel.org>; Mon,  6 Apr 2020 09:07:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 64B29206B8
	for <linux-m68k@archiver.kernel.org>; Mon,  6 Apr 2020 09:07:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726689AbgDFJH4 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 6 Apr 2020 05:07:56 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:32790 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726622AbgDFJHz (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 6 Apr 2020 05:07:55 -0400
Received: by mail-oi1-f196.google.com with SMTP id m14so12478300oic.0
        for <linux-m68k@lists.linux-m68k.org>; Mon, 06 Apr 2020 02:07:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aV5hcwVoZVESS5WaKWyxtYySJtTUnIne/cLn7cBqE5E=;
        b=Tu0PnGMChDZtADP/adrSobbs+u/+PdvF6D7JEDvaroCy/0jg4ifm/IOWPK3K7hVw3l
         CWQkkq86Is7LWjnFv66W2b8cAQlDhsEP/GgP7s0lkEHqkZE/vTG/tg/hDTQMwAvVcIvh
         twX2w0eHQKk/lgNUdc4VDg2o+vwai0ZQf2Hru87gaSOWNwXkI2+FfCpLxKtPAadkHJZC
         UHe8K2lShGYfIC4dt8XKvrlyrDXbpQiDZGUHOEomKxWPAQw8Fxq/smrMVDdDvc/iux3P
         USg6ceKkA6Z2Rk0MgUMTZlliB9Deo110+qaQJtFKp0Eega/BtjCEnsCutN9xDYhJnTqM
         wg/A==
X-Gm-Message-State: AGi0Pua8V8HfHC9v+feAlj61fHPm+FlSsWhCyaE/IhMAdvmL8tBUNdkp
        yAuRm6E8btgndJVdK7CvSSAuT/HNV4EgvSTBNEE=
X-Google-Smtp-Source: APiQypJOPtsFE4hSNU1FARO4jGkS783loufcg4W8i51YwmnONIIppuvbsBtEr2pLT6TIDrdZeYCi+QgRnrr3829UmfA=
X-Received: by 2002:aca:cdd1:: with SMTP id d200mr11531314oig.153.1586164075301;
 Mon, 06 Apr 2020 02:07:55 -0700 (PDT)
MIME-Version: 1.0
References: <CABq5eXFO1XWJcj5EZ97izZdcOJd+BD2mTV_vFnp4v6SxR7_wKA@mail.gmail.com>
In-Reply-To: <CABq5eXFO1XWJcj5EZ97izZdcOJd+BD2mTV_vFnp4v6SxR7_wKA@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 6 Apr 2020 11:07:44 +0200
Message-ID: <CAMuHMdUDEL1hr8gPcSVcF5May61ov_Gm0cVTfUMPKgE+L-p5ig@mail.gmail.com>
Subject: Re: A4000 reboot hangs
To:     Stefan Reinauer <stefan.k.reinauer@gmail.com>
Cc:     linux-m68k <linux-m68k@lists.linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Stefan,

On Mon, Apr 6, 2020 at 5:54 AM Stefan Reinauer
<stefan.k.reinauer@gmail.com> wrote:
> Is anyone else experiencing reboot hangs on Amiga?
> My setup is A4000D, A3660/66, ZZ9000
>
> I can see the last message before the screen goes dark and the HDD LED
> stays lit, but the machine never gets out of reset. So I currently
> assume it gets stuck somewhere in arch/m68k/amiga/config/amiga_reset()

Does it work if Linux doesn't touch the ZZ9000 (i.e. without your WIP
drivers)?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
