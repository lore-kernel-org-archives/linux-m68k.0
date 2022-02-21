Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E85D1C433EF
	for <linux-m68k@archiver.kernel.org>; Mon, 21 Feb 2022 01:54:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244979AbiBUByu (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 20 Feb 2022 20:54:50 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:37864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243581AbiBUByt (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sun, 20 Feb 2022 20:54:49 -0500
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC7684AE0B
        for <linux-m68k@lists.linux-m68k.org>; Sun, 20 Feb 2022 17:54:27 -0800 (PST)
Received: by mail-pj1-x102a.google.com with SMTP id b8so13661991pjb.4
        for <linux-m68k@lists.linux-m68k.org>; Sun, 20 Feb 2022 17:54:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=IotG9PzCOAGZPy26NsbojxV3CpCIh2VaX05qncsSKtw=;
        b=BJz1Yc1XOSF26alhBGOkFEMnLNkRHUr09jM0cR/2gqXxHi4GWUTjKX0fOmjY1nbBcc
         j6AtutVI+Qw4NR7YfxQ8EMh6yWuJDUNyozmIG77M6MwKjyrdFlch0Z7Cqbor/rIp8d+Z
         8PtygpvKwmboP7g/ljQEIgnY6WLjtrLXdHQxQ3rbCMMc1oqI7Vajfne8hRySx/Q9O6Le
         UFh6/J9q+O0P6Am9062BD6YJXYw4wysL5nd1C4roE9xBSV1RB6JR3rGzcG6CL8Oq2ZUY
         z4LQ0Y6j/iZODIOxRBjFCKmwM5SyRxRR5h4V1VdcBQbtprV8fI72A9WPmcAdNo4tn57b
         VD7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:references:cc:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=IotG9PzCOAGZPy26NsbojxV3CpCIh2VaX05qncsSKtw=;
        b=ef8gqvRVzav0pPikJynVDh4p065eFSTt3U4Ol0ObIp72YiEVRBBSup5g7xEaEJiXXI
         l8K6uc/Nxcxj5s6axT4Q2N/R9agtAUH14mo57prpdrv2hNjBVRFjbqfYHX7b/XJqdJU/
         S9avUaOQvtK5Y3lhDH16KRkn2rVGuFAvjortbm0z9MVVTWwISLQsFgqFp55v/ZSSNKv/
         UHLCWDwrgVj/0kejiBfw8HxjPHGopDE7Nj7aP0hpXmKAMfvMeWAYh3rMaTMp1W+rFUx7
         m3tfEN+FtsqP04XDl22x9rINBWii/FiXk0QqH2JzXhXkP1o0asBPeZXqhnSTerP9r10P
         JRaQ==
X-Gm-Message-State: AOAM531tKNh1+0uEqKQP4EM7ODrDDaURUjfvz5Uk4wtGQ4zKqrgVBjRL
        ebUXSREGIq6e1pi5yc7fD6YtjJ4ngAI=
X-Google-Smtp-Source: ABdhPJwMBKVPcO/wCwoUrM6c3mnBfjm5GDO4/A1r4QNxY9cCivp2xrUCk+cWOmSomsJSdErDiBMihg==
X-Received: by 2002:a17:90b:3509:b0:1b8:aaea:a82e with SMTP id ls9-20020a17090b350900b001b8aaeaa82emr23241485pjb.109.1645408466927;
        Sun, 20 Feb 2022 17:54:26 -0800 (PST)
Received: from [10.1.1.24] (222-155-5-102-adsl.sparkbb.co.nz. [222.155.5.102])
        by smtp.gmail.com with ESMTPSA id g14sm5763831pfj.80.2022.02.20.17.54.24
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 20 Feb 2022 17:54:26 -0800 (PST)
Subject: Re: Wrong colors on ARAnyM
To:     =?UTF-8?Q?Petr_Stehl=c3=adk?= <pstehlik@sophics.cz>,
        Geert Uytterhoeven <geert@linux-m68k.org>
References: <CAMuHMdU3ievhXxKR_xi_v3aumnYW7UNUO6qMdhgfyWTyVSsCkQ@mail.gmail.com>
 <b03160b6-7f3b-7765-49ee-c49b7dd2c4e0@gmail.com>
 <CAMuHMdVUX0zJtRAtjCBAa7iEk7MwCjcmSsJdCrSrPcY=6ti=cQ@mail.gmail.com>
 <4b3a0bc8-24a1-2a33-19bb-fbae954c614c@gmail.com>
 <CAMuHMdWkxDMbS4D8wkEPAVgrFnoJzejUkxKCnvA+MA38vS6g9Q@mail.gmail.com>
 <6073b6c3a46eef78dda3e6c522cba691f1ddbd16.camel@sophics.cz>
Cc:     linux-m68k <linux-m68k@lists.linux-m68k.org>
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <3e0d1d9c-a353-9e05-3db6-d02f6fad4dac@gmail.com>
Date:   Mon, 21 Feb 2022 14:54:21 +1300
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <6073b6c3a46eef78dda3e6c522cba691f1ddbd16.camel@sophics.cz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Petr,

all good with the palette handling.

There is another issue I ran into while testing atafb's handling of 16 
bit video modes though:

When specifying non-default video modes, the kernel parameter

video=atafb:R320;240;16

is used (as an example). Using this in ARAnyM, the command line ends on

video=atafb:R320

and anything specified past the video option on the command line is lost 
(along with xres and depth).

The same mode option is passed on to the kernel correctly by ataboot on 
my Falcon.

Could you look into what in ARAnyMs parsing of the config file or the 
'Args' config item causes truncation of the kernel options?

This can be trivially worked around by using another token separator, 
and Geert is the only one who ever tried 16 bit video modes as far as 
I've seen, so nothing urgent ...

Cheers,

	Michael


Am 15.02.2022 um 22:16 schrieb Petr Stehlík:
> On Út, 2022-02-15 at 09:11 +0100, Geert Uytterhoeven wrote:
>>> Now what would cause us to miss every other palette update or depth
>>> change?
>>
>> That's a good question! Why does ARAnyM sometimes decide to use the
>> Falcon palette, and sometimes the STe palette, and not only with
>> bpp == 2, but also with other color depths?
>
> just wanted to let you know that I'm following you. If you happen to
> identify any bug in ARAnyM I'll try to fix it ASAP.
>
> Thanks,
>
> Petr
>
>
