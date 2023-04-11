Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F6E5C7619A
	for <linux-m68k@archiver.kernel.org>; Tue, 11 Apr 2023 07:19:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229828AbjDKHTk convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 11 Apr 2023 03:19:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230088AbjDKHTS (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 11 Apr 2023 03:19:18 -0400
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EA53E4
        for <linux-m68k@lists.linux-m68k.org>; Tue, 11 Apr 2023 00:19:17 -0700 (PDT)
Received: by mail-yb1-f182.google.com with SMTP id z9so7040561ybs.9
        for <linux-m68k@lists.linux-m68k.org>; Tue, 11 Apr 2023 00:19:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681197556;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fIRHDzGwyamvH5/FvMk0GKZK/sn64iiOUBYP4NzfyGA=;
        b=foPtroFpLsS58Ho4VQlt3OXSrqdnna7OKPDZicQQEv4Eq7W2tHD/Id6R/lmsAEirqS
         PTgP8pPJmus9kmP4bwqqtxredmiats9CwoHcyF0GcB6AK/vehLgLnjq1RASn2zK8f77e
         YULAdEPVfsCKQf3U/NHxD2Cqln2WmLWWfEjsLQSfySvp2DoZQgm+nRy6ftD/DVkvFMPN
         bjNr0ZmMkZ7VaFw5RQbtpWsWImS2E5xhJdxyfmH+AbLNRRJaX3C/rQwoY0ofe7db09rD
         NO3d1BDXOJdHkO7XXz5S2Z6WAgr0tTtXeXaVEcHwlgUTbnGjj0XaL5c7zctUBEefE/9r
         8WMQ==
X-Gm-Message-State: AAQBX9cCqaGGmCwLcx2AXQ+B6hCtqqj9OMJWzlJN59gAJDALQGQHcYgf
        Q1x6V7KrBL2eS9t2y+SLAyQDMI1lGuiH2A==
X-Google-Smtp-Source: AKy350Z0SmzuTjFDYujg72zZYmfx1I2OkYYuNjCzgo6PoWVI0eME4iooDxQRX+AbDO4GiTDPNlBpfQ==
X-Received: by 2002:a25:4c81:0:b0:b66:edd5:162a with SMTP id z123-20020a254c81000000b00b66edd5162amr11003789yba.30.1681197555723;
        Tue, 11 Apr 2023 00:19:15 -0700 (PDT)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com. [209.85.128.174])
        by smtp.gmail.com with ESMTPSA id b69-20020a253448000000b00b8be4767167sm2049773yba.26.2023.04.11.00.19.15
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Apr 2023 00:19:15 -0700 (PDT)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-54f64b29207so34202237b3.8
        for <linux-m68k@lists.linux-m68k.org>; Tue, 11 Apr 2023 00:19:15 -0700 (PDT)
X-Received: by 2002:a05:690c:2a05:b0:54f:6dd4:d3e1 with SMTP id
 ei5-20020a05690c2a0500b0054f6dd4d3e1mr1039125ywb.2.1681197554984; Tue, 11 Apr
 2023 00:19:14 -0700 (PDT)
MIME-Version: 1.0
References: <4a9c1d0d-07aa-792e-921f-237d5a30fc44.ref@yahoo.com>
 <c47abfdc-31c8-e7ed-1c14-90f68710f25d@gmail.com> <040ad66a-71dd-001b-0446-36cbd6547b37@yahoo.com>
 <5b9d64bb-2adc-20a2-f596-f99bf255b5cc@linux-m68k.org> <56bd9a33-c58a-58e0-3956-e63c61abe5fe@yahoo.com>
 <1725f7c1-2084-a404-653d-9e9f8bbe961c@linux-m68k.org> <e10b8e06-6a36-5c83-89da-bec8fd7d3ed9@linux-m68k.org>
 <19d1f2ac-67dd-5415-b64a-1e1b4451f01e@linux-m68k.org> <ef5bcf6f-3541-50c2-9b6a-5e9d2f9c68d5@linux-m68k.org>
 <87zg7rap45.fsf@igel.home> <5a5588ca-81c3-3f4c-fd43-c95e90b27939@linux-m68k.org>
 <67f6bc5f-e1fc-64b9-cb3c-1698cf4daf51@gmail.com> <9eea635f-c947-eae7-09fa-d39f00d91532@linux-m68k.org>
 <3dfea52a-b09e-517a-c3ca-4b559a3d9ce4@gmail.com> <23ddfd2a-1123-45ae-866d-158d45e23ba2@linux-m68k.org>
 <8ff53c49-331e-1388-31c5-79cf21a2c201@gmail.com> <CAMuHMdVPayRjadOYxxZb-J7q-YtgZDwtCs93+Rz_ReSk+NHCwg@mail.gmail.com>
 <79ad6f51-5d02-0104-3b63-024e54a25e3c@gmail.com> <7106e764-4def-c03a-30d5-e4f810bd85cc@linux-m68k.org>
 <912d690c-c43c-8a72-ec8e-14cfb26785f1@gmail.com>
In-Reply-To: <912d690c-c43c-8a72-ec8e-14cfb26785f1@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 11 Apr 2023 09:19:02 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXEKvKDPZWdzrEs0z=qS=hiK8AEwkSMgwoQcfjc_a4wEA@mail.gmail.com>
Message-ID: <CAMuHMdXEKvKDPZWdzrEs0z=qS=hiK8AEwkSMgwoQcfjc_a4wEA@mail.gmail.com>
Subject: Re: instrumentation, was Re: core dump analysis
To:     Michael Schmitz <schmitzmic@gmail.com>
Cc:     Finn Thain <fthain@linux-m68k.org>,
        Andreas Schwab <schwab@linux-m68k.org>,
        debian-68k@lists.debian.org, linux-m68k@lists.linux-m68k.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Michael,

On Tue, Apr 11, 2023 at 6:56 AM Michael Schmitz <schmitzmic@gmail.com> wrote:
> Am 11.04.2023 um 12:20 schrieb Finn Thain:
> > On Sun, 9 Apr 2023, Michael Schmitz wrote:
> >> Am 08.04.2023 um 00:06 schrieb Geert Uytterhoeven:
> >>> On Fri, Apr 7, 2023 at 3:58 AM Michael Schmitz <wrote:
> >>>> The easiest way to do that is to log all wait and signal syscalls, as
> >>>> well as process exit. That might alter timing if these log messages
> >>>> go to the serial console though. Is that what you have in mind?
> >>>
> >>> Store to RAM, retrieve through a new /proc file?
> >>
> >> Yes, that could be done, though I'd rather avoid duplicating a lot of
> >> the generic message formatting code (printk and friends).
> >>
> >> I'll have a look around ...
> >>
> >
> > A better solution might be be to port the existing instrumentation like
> > ftrace, kprobes, uprobes etc. Might be a lot of work though. I wonder
> > how portable that stuff is.
> >
> > If you use printk, you could probably avoid most of the delays by enabling
> > the dummy console. Then the kernel messages would be collected with dmesg,
> > given a sufficiently large CONFIG_LOG_BUF_SHIFT. But it would be
> > inconvenient to have no serial console available for the usual purposes.
>
> Can we disable the serial console after boot, by registering the dummy
> console? Or will that just log messages to both?

You can increase loglevel.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
