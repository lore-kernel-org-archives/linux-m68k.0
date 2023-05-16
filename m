Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48D1DC77B7A
	for <linux-m68k@archiver.kernel.org>; Tue, 16 May 2023 07:11:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230307AbjEPHLE convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 16 May 2023 03:11:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230491AbjEPHLD (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 16 May 2023 03:11:03 -0400
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF7A910FE
        for <linux-m68k@lists.linux-m68k.org>; Tue, 16 May 2023 00:11:01 -0700 (PDT)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-55a26b46003so202814007b3.1
        for <linux-m68k@lists.linux-m68k.org>; Tue, 16 May 2023 00:11:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684221061; x=1686813061;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JLKEBtcsn7izVRwefw1phNZul3WTWfMY8k8wmlvyiKA=;
        b=YqvuIEpJQzSSH3vJRa3bdSc/yz5DP+Nlb4RQ3X7BD1e6sN2ixw1KDjLmmVkMzJ2gTM
         8c3MmpTD1hJTy5lqveaxeJKctfBVSP6lqynfPJbHYikxfTHxSsskuO0tphb8yvEpVZFL
         +wRPbZrrb5KyA22jkpM0owuY1YGq/cEMRm4QSE+hqVARwaeIShTjdDInB20AgY//h1um
         5ayW9OuOEE2XTZdtRDWVIqm1i4GlN1jWFh2sIlm2YKQShuozXDGZddmT0GMPghhwO3hf
         lRy7bCK0ka7+Tm/PqwZwbxQ0mpuymJT0EnJiqx4ageUsDQZNHsJ3xhz7Q4ieZ7J0LpWv
         iyyw==
X-Gm-Message-State: AC+VfDx4B/uiEh51aRbDYR3nL3p/iIIepoG2PlomQHdVqq/h3rbcx0kf
        SbOJGTXhEvhgOduCw60rfzbBzZxq7l9P7w==
X-Google-Smtp-Source: ACHHUZ4yNMIGKna4EzGCoM/xiUSTpeFL8Tc283LG4El+aSSJdQb+YvnL/I9A35vEIRY/sq8Qm1+kcA==
X-Received: by 2002:a81:c312:0:b0:559:d103:d5c8 with SMTP id r18-20020a81c312000000b00559d103d5c8mr32833725ywk.31.1684221060786;
        Tue, 16 May 2023 00:11:00 -0700 (PDT)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com. [209.85.219.173])
        by smtp.gmail.com with ESMTPSA id c185-20020a0df3c2000000b00559f03541c6sm397566ywf.132.2023.05.16.00.11.00
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 May 2023 00:11:00 -0700 (PDT)
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-ba827a34ba8so350054276.0
        for <linux-m68k@lists.linux-m68k.org>; Tue, 16 May 2023 00:11:00 -0700 (PDT)
X-Received: by 2002:a05:6902:18d6:b0:ba7:b446:f5a4 with SMTP id
 ck22-20020a05690218d600b00ba7b446f5a4mr6935547ybb.8.1684221059889; Tue, 16
 May 2023 00:10:59 -0700 (PDT)
MIME-Version: 1.0
References: <71ed7fb234a5f7381a50253b0d841a656d53e64c.1684200125.git.fthain@linux-m68k.org>
In-Reply-To: <71ed7fb234a5f7381a50253b0d841a656d53e64c.1684200125.git.fthain@linux-m68k.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 16 May 2023 09:10:47 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVi_vtqCD9QA-WqTya=GyPvXg0Ey3sTywcRy0HKCutHAg@mail.gmail.com>
Message-ID: <CAMuHMdVi_vtqCD9QA-WqTya=GyPvXg0Ey3sTywcRy0HKCutHAg@mail.gmail.com>
Subject: Re: [PATCH v5] nubus: Don't list slot resources by default
To:     Finn Thain <fthain@linux-m68k.org>
Cc:     Brad Boyer <flar@allandria.com>, linux-m68k@lists.linux-m68k.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Tue, May 16, 2023 at 4:05 AM Finn Thain <fthain@linux-m68k.org> wrote:
> Some Nubus card ROMs contain many slot resources. A single Radius video
> card produced well over a thousand entries under /proc/bus/nubus/.
> Populating /proc/bus/nubus/ on a slow machine with several such cards
> installed takes long enough that the user may think that the system is
> wedged. All those procfs entries also consume significant RAM though
> they are not normally needed (except by developers).
> Omit these resources from /proc/bus/nubus/ by default and add a kernel
> parameter to enable them when needed.
> On the test machine, this saved 300 kB and 10 seconds.
>
> Cc: Brad Boyer <flar@allandria.com>
> Reviewed-by: Brad Boyer <flar@allandria.com>
> Tested-by: Stan Johnson <userm57@yahoo.com>
> Signed-off-by: Finn Thain <fthain@linux-m68k.org>
> ---
> Changed since v4:
>  - Renamed the new global variable and adopted module_param_named().

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
i.e. will queue in the m68k for-v6.5 branch.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
