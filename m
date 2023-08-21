Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CB37EE4996
	for <linux-m68k@archiver.kernel.org>; Mon, 21 Aug 2023 07:47:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231191AbjHUHrH convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 21 Aug 2023 03:47:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233865AbjHUHrG (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Mon, 21 Aug 2023 03:47:06 -0400
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BA7E92
        for <linux-m68k@vger.kernel.org>; Mon, 21 Aug 2023 00:47:05 -0700 (PDT)
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-d71dd633f33so3089780276.2
        for <linux-m68k@vger.kernel.org>; Mon, 21 Aug 2023 00:47:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692604024; x=1693208824;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oMIW8is/xkuextWAf2IiprrrINWZNO1bIb4+7Cl1QYY=;
        b=T15wRlchoPaDrokeZyh/7C1QRD6h5Mu46EtAvmM2Au84s6J+kV6m2+V5Q+YZXmV0xZ
         ohtM7jGYac9TDsWWLSqEn2VkU3yNA8rWBRDvFdPMkobyNHf5TDKGR2T7/xYkXnIkGvY0
         IcUShFDjf5tnNtj6ZPtpjNHuO4ov5sLQUzZJgfcpIm3/C/sYNEMJf6REfNJHP4D0LG+8
         CNZCFC3ebESTZMLCL/xQYbIPdVScqNmkheq9uaVfOCpfBcXuQ5Wb1/Eup5nhWGSa7yD5
         5jcGvMvkEEXSSeyeQ+G36tAt4NweF/WCVXoPbpBqCvDs+knEIbk8CM76orKXoHj8tUfA
         bFMg==
X-Gm-Message-State: AOJu0YyfIm3Ny/2SicCTLn7Y+/9442fTNVjKwaFupUJRTK1ArzRMfZtb
        Ar6DQArTHB2aGMRVfzg1lYtZ/DvnpcWF7g==
X-Google-Smtp-Source: AGHT+IHrQNQTDYSJEgwanpZOJP3LURE3AGLGcJKCEpGZmAQ7q0/eOCiLQMHu0JtVweibmYwkuWJw1Q==
X-Received: by 2002:a25:6c0a:0:b0:d0f:57e8:3476 with SMTP id h10-20020a256c0a000000b00d0f57e83476mr4800956ybc.46.1692604024323;
        Mon, 21 Aug 2023 00:47:04 -0700 (PDT)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com. [209.85.219.170])
        by smtp.gmail.com with ESMTPSA id n82-20020a25da55000000b00d5d4bae6fdfsm1769221ybf.30.2023.08.21.00.47.03
        for <linux-m68k@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Aug 2023 00:47:03 -0700 (PDT)
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-d7260fae148so3113337276.1
        for <linux-m68k@vger.kernel.org>; Mon, 21 Aug 2023 00:47:03 -0700 (PDT)
X-Received: by 2002:a25:3491:0:b0:d73:ea25:f17b with SMTP id
 b139-20020a253491000000b00d73ea25f17bmr5551002yba.1.1692604023446; Mon, 21
 Aug 2023 00:47:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230817035001.8400-1-schmitzmic@gmail.com> <20230817035001.8400-3-schmitzmic@gmail.com>
 <f604a8f6-6203-84c5-82b9-570348d416ec@linux-m68k.org> <CAMuHMdV6NWRKL8DAD2e4HPz=fbcAUqi6ww-8_9Mjg0t8eiZCGQ@mail.gmail.com>
 <8bf4980e-f269-48d2-5b77-3fd6c7270bef@gmail.com> <fd7cd3b9-3f86-feb4-e9ce-aafaea272840@gmail.com>
 <CAMuHMdXcz0koHQXAaWCoGXPJVva2a43C9CuwQf3mZeWhPaSiWw@mail.gmail.com> <00d475d4-76c1-0ae8-1723-a0fc08a57de4@linux-m68k.org>
In-Reply-To: <00d475d4-76c1-0ae8-1723-a0fc08a57de4@linux-m68k.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 21 Aug 2023 09:46:52 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUAA1rEVowURsTaTyH8o3acKyfL3Hpz75ZE1Qrb6AdG5w@mail.gmail.com>
Message-ID: <CAMuHMdUAA1rEVowURsTaTyH8o3acKyfL3Hpz75ZE1Qrb6AdG5w@mail.gmail.com>
Subject: Re: [PATCH RFC v3 2/2] m68k/q40: add data_swab option for pata_falcon
 to byte-swap disk data
To:     Finn Thain <fthain@linux-m68k.org>
Cc:     Michael Schmitz <schmitzmic@gmail.com>, will@sowerbutts.com,
        linux-m68k@vger.kernel.org, rz@linux-m68k.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Finn,

On Sat, Aug 19, 2023 at 1:53 AM Finn Thain <fthain@linux-m68k.org> wrote:
> On Fri, 18 Aug 2023, Geert Uytterhoeven wrote:
> > Of course 0 also works, but causes ".0" to be appended to the platform
> > device's name, visible in e.g. /sys/bus/platform/devices/.
>
> That seems desirable to me.

Why would it be desirable?
IMHO this is an unneeded change which is visible in userspace.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
