Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12F03C433EF
	for <linux-m68k@archiver.kernel.org>; Wed, 16 Feb 2022 07:33:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230169AbiBPHdI (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 16 Feb 2022 02:33:08 -0500
Received: from gmail-smtp-in.l.google.com ([23.128.96.19]:55546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230157AbiBPHdI (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 16 Feb 2022 02:33:08 -0500
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFE6116EA95
        for <linux-m68k@lists.linux-m68k.org>; Tue, 15 Feb 2022 23:32:51 -0800 (PST)
Received: by mail-pg1-x535.google.com with SMTP id r76so1397205pgr.10
        for <linux-m68k@lists.linux-m68k.org>; Tue, 15 Feb 2022 23:32:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=wCCyVmZ+5iGYbJC8twTzHJn6vR+93LVpKRueppFWfUI=;
        b=QQcWnwvChAMp/Ey1WjJl7dcyJZcKShbv+ZH+YJwLjkAnPu+ZWrcUWGi0ryjCRxbiEQ
         Dpfb4pvBxfU7taiV+JhtVI8WCgyUFGhY22gmz/vgMcK+RvL0r69Ar0oVbgyxpshppKX3
         7x11CwbTdy/25qWCwfldbEg3nIiwDwgk3AXK0MS7sSQQSo4i3Afu4EOVqeFGF5KVWZlw
         l6MMyvZf2QuGWRdmEm/MYB2mBZ/9uGmsMkqj93e1M7Ysut6uQWEjGLldzetCzqwFnCeV
         uU2Tm19XTV550nvIwe50t552AbEwsiO2BVtfD1+n3nf3j2t4v5OCYjM03WpsI7dzGGnU
         1+vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:references:cc:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=wCCyVmZ+5iGYbJC8twTzHJn6vR+93LVpKRueppFWfUI=;
        b=3l37Lt4ok4csf6hXzjcMCFWx+BnIap/tjUGUzXYa/Jw8LMPC4L4tixnH8cBe5oAAGO
         6KBZFXSlYQ7i5X/Tn9JPdY/BU+C5p7LE07+dt11V7cxRwcIOljV8LKm4RILYnefq97h/
         +xoezwrtZuoTt8V06ESusuKq19IYk/T9x/h5bDr4JoFsRm37u0w+GUQTtlZzrwquzPyt
         o4zGdUaT+2VqJ8atVtuhqHwyXZJ8nyGpfkS9APzmj/qu0DwEALxAVgTNy0HVIMy06D3t
         FVE79n7eRJXrQpHIB7/xGors3BQMR33Pb9k2OJM/+HxezWALLDZi3xqv0LT0EgjSWPdg
         8G8g==
X-Gm-Message-State: AOAM5331LtSrvkj4iaQqJxANEXrMGcL+cA/rqwwnIpFH+hE2614cXWVL
        yFyVvH46waSxylMMSJuB4xERJ55GlyE=
X-Google-Smtp-Source: ABdhPJwDx/TCzlKTRfxfcGDPWeJF1IoPiKZTh/zW/8v6KOrOfl3H8u8Y4sD8l9+DUFxjoGoHGATUsA==
X-Received: by 2002:a05:6a00:1a88:b0:4c9:6871:59b2 with SMTP id e8-20020a056a001a8800b004c9687159b2mr1948564pfv.31.1644996768045;
        Tue, 15 Feb 2022 23:32:48 -0800 (PST)
Received: from [10.1.1.24] (222-155-5-102-adsl.sparkbb.co.nz. [222.155.5.102])
        by smtp.gmail.com with ESMTPSA id m21sm4590753pgh.69.2022.02.15.23.32.45
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 15 Feb 2022 23:32:47 -0800 (PST)
Subject: Re: Wrong colors on ARAnyM
To:     Geert Uytterhoeven <geert@linux-m68k.org>
References: <CAMuHMdU3ievhXxKR_xi_v3aumnYW7UNUO6qMdhgfyWTyVSsCkQ@mail.gmail.com>
 <b03160b6-7f3b-7765-49ee-c49b7dd2c4e0@gmail.com>
 <CAMuHMdVUX0zJtRAtjCBAa7iEk7MwCjcmSsJdCrSrPcY=6ti=cQ@mail.gmail.com>
 <4b3a0bc8-24a1-2a33-19bb-fbae954c614c@gmail.com>
 <CAMuHMdWkxDMbS4D8wkEPAVgrFnoJzejUkxKCnvA+MA38vS6g9Q@mail.gmail.com>
Cc:     Petr Stehlik <pstehlik@sophics.cz>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <45001563-bd16-616e-3d42-263de137c004@gmail.com>
Date:   Wed, 16 Feb 2022 20:32:43 +1300
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdWkxDMbS4D8wkEPAVgrFnoJzejUkxKCnvA+MA38vS6g9Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Geert,

Am 15.02.2022 um 21:11 schrieb Geert Uytterhoeven:
>> Only the blue bits ever entirely seem to end up where they ought to.
>> Testing this hypothesis on ARAnyM (without getting it to boot all the
>> way, for some odd reason likely to do with my current .config) shows
>> that the current code results in the shifter_tt.color_reg entries either
>> 5 or 0x17, 0x113 or 0x117. Adding the missing parentheses results in
>> what I'd expect to see.
>
> Oops.
>
>> This bug has been present since at least 2.4.30. I do recall seeing this
>> odd blue console before on the Falcon, so it's been a real bug for ages.
>
> I recall seeing an odd blue console before, too.
> I always dismissed it as some artefact of redrawing the screen in
> a different color mode, like we used to have when switching from a
> 16-color to a monochrome text console (remember the underlined text?).
>
> Did/do you see it on the real Falcon, too?

I do see the blue text colour bug, but not the random behaviour in 
switching to 2 bpp, on the actual hardware. So there appear to be two 
distinct bugs - the STe colour map entries tend towards the blue, and 
switching to that palette does not always happen when it should.

Still no idea what causes ARAnyM to miss palette updates or use the 
wrong palette at times ...

>> I can confirm that the bug is gone with additional parentheses to apply
>> the shifts (<<8 for red, <<4 for green) to the result of the bit-wise
>> or, not just the right-hand portion of it.
>>
>> Do you want me to prepare a patch, or would you prefer to do it yourself?
>
> Feel free to send a patch.

Done (now that I've tested on hardware).

Cheers,

	Michael


> If you don't get to it, I'll make one, eventually.
> Thanks!
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
>
