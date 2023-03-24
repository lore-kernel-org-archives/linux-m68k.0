Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6790BC6FD1C
	for <linux-m68k@archiver.kernel.org>; Fri, 24 Mar 2023 08:26:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231453AbjCXI0i convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 24 Mar 2023 04:26:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229752AbjCXI0h (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 24 Mar 2023 04:26:37 -0400
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD4D21D91D
        for <linux-m68k@lists.linux-m68k.org>; Fri, 24 Mar 2023 01:26:36 -0700 (PDT)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-541a05e4124so20853067b3.1
        for <linux-m68k@lists.linux-m68k.org>; Fri, 24 Mar 2023 01:26:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679646396;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=45SbY74W6cAx8TBdsxbYd/fwuLq1btWb/YBacEQlBno=;
        b=K5/5dNjyjDX0jnCoqlnd0AXQ86yvEC414Iq2pOA253lb+/fOWduf3YS+g3CPW95etE
         FuRKhd2O4i3LeNyBrbwQzEw3rmVpLOsOn/lfs6OXS6EcGt8c5Un1WwfOy6Dsxh94+Ary
         1yYcpZCB+n2FcuQ7CMT/Knk9FwMLwb/pA/7iL6T2cbJON/JZDOfytqiSIZsztbJyx5Z2
         /3kgNgs/7VfAIktj1QDr7DsyF38d/s9Hi9AZTq1wt1bolK4URfR8WY0223Ilq0UlB2od
         8fE5vwmObpnePjeKjDO30XC+H9+yWbxOcMyHb6Tb/NKccCFJ4ZwAaB7bsexnIqm00JXZ
         eaZA==
X-Gm-Message-State: AAQBX9ctMuCAsN2/u+LvWGMeRGoM7xRlRwM6aN7W65gpj52LzIeApozl
        A535PiHEpEmhg4IM6uHzEF0gBWxS0S0Iug==
X-Google-Smtp-Source: AKy350bmGNQye0GZ+jaHYYsC5rbPlFV7Cr2pCLXssIbqgiVXFlFsQ0RnubyRj8t7hlJ4U9wvS16Vqw==
X-Received: by 2002:a81:c243:0:b0:541:8c9c:9515 with SMTP id t3-20020a81c243000000b005418c9c9515mr1434140ywg.15.1679646395795;
        Fri, 24 Mar 2023 01:26:35 -0700 (PDT)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com. [209.85.219.172])
        by smtp.gmail.com with ESMTPSA id 7-20020a810707000000b00545a0818492sm299987ywh.34.2023.03.24.01.26.35
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Mar 2023 01:26:35 -0700 (PDT)
Received: by mail-yb1-f172.google.com with SMTP id p204so1208866ybc.12
        for <linux-m68k@lists.linux-m68k.org>; Fri, 24 Mar 2023 01:26:35 -0700 (PDT)
X-Received: by 2002:a05:6902:10c2:b0:b6e:b924:b96f with SMTP id
 w2-20020a05690210c200b00b6eb924b96fmr1607389ybu.3.1679646395243; Fri, 24 Mar
 2023 01:26:35 -0700 (PDT)
MIME-Version: 1.0
References: <5b7c473247d66776343d82a55b9815195b1b11fb.1679551394.git.fthain@linux-m68k.org>
 <mvmttybx3ng.fsf@linux-m68k.org> <CAMuHMdUQ3+OUKZ-6DqcJfMgq8_90Cejzc=onhUmbaYTWJkZHRw@mail.gmail.com>
 <c882ca59-e75d-7ca2-d63f-70aab1b46ade@linux-m68k.org>
In-Reply-To: <c882ca59-e75d-7ca2-d63f-70aab1b46ade@linux-m68k.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 24 Mar 2023 09:26:23 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVSvPk8wYZKVKX_xW_VSHu2qMoX-N4ePRJHejw2nh9JKg@mail.gmail.com>
Message-ID: <CAMuHMdVSvPk8wYZKVKX_xW_VSHu2qMoX-N4ePRJHejw2nh9JKg@mail.gmail.com>
Subject: Re: [PATCH v2] nubus: Don't list card resources by default
To:     Finn Thain <fthain@linux-m68k.org>
Cc:     Andreas Schwab <schwab@linux-m68k.org>,
        linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Finn,

On Fri, Mar 24, 2023 at 1:05 AM Finn Thain <fthain@linux-m68k.org> wrote:
> On Thu, 23 Mar 2023, Geert Uytterhoeven wrote:
> > On Thu, Mar 23, 2023 at 9:39 AM Andreas Schwab <schwab@linux-m68k.org> wrote:
> > > On Mär 23 2023, Finn Thain wrote:
> > > > Checkpatch says "externs should be avoided in .c files" and if this one
> > > > appeared twice I would agree. But as it only appears once, I can't see
> > > > any advantage to putting it in a new .h file instead of the .c file...
> > >
> > > Anything wrong with declaring it in <linux/nubus.h>?
> >
> > It's not meant for NuBus device drivers (at least in its current form).
> > So a drivers/nubus/nubus.h would be the most logical place.
>
> I think Andreas is right inasmuchas the existing prototypes shared between
> drivers/nubus/nubus.c and drivers/nubus/proc.c are found there, and this
> extern is another one of those.
>
> But I take Geert's point that much of include/linux/nubus.h could be moved
> to drivers/nubus/something.h. But is there anything to be gained from
> splitting it up that way?

Splitting it would prevent NuBus device drivers from messing with
internal NuBus variables they're not intended to access.
But I agree that's not a big concern...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
