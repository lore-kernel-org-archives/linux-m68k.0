Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81A77C77B73
	for <linux-m68k@archiver.kernel.org>; Tue, 25 Apr 2023 05:59:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233309AbjDYF7f (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 25 Apr 2023 01:59:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233364AbjDYF7a (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 25 Apr 2023 01:59:30 -0400
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8A06AD2A
        for <linux-m68k@lists.linux-m68k.org>; Mon, 24 Apr 2023 22:59:25 -0700 (PDT)
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-63d4595d60fso33096492b3a.0
        for <linux-m68k@lists.linux-m68k.org>; Mon, 24 Apr 2023 22:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682402364; x=1684994364;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=faS+qPGrruCjZ6uwwcVbw5zx7VBhlF2GowZoTjFU/tE=;
        b=sOMN39rUccE2NPcOY6JkZQ5GRgD/EzG1wpEWC5jFJoQKkijA5pFwDHETsZWZ3h6814
         7QGfgOd7iMGhOXDWhmV8+achB7FdWdHv8BVsTvKmr9qR7eO/jJL9Ro0A6ZbHxhwTdn5+
         qYiLMSXK55asu5JnsaQGsHfN/wXK/mGhkkdCvHkMMSPl6m/P8meVADBedjTCPDTsgMcy
         xV+h+gqddYtFSzmb7AOaa2kiDIJUue3FC64aZHiA7dB+xj6U4L07hE5p6iGR1IgVCSrE
         juyk4ictz9ci8p08qaCqZ45MFCCM4Hv71e0XYgDDbNDaz7Eq7MDuTDppA40+Gqn3K/N3
         m/4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682402364; x=1684994364;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=faS+qPGrruCjZ6uwwcVbw5zx7VBhlF2GowZoTjFU/tE=;
        b=CbgdS0KWcmcDEWLbYPibrJJoHHXmOAp5hq4qKS96p4XIOh618cZhMFr8xGZZCnEZfe
         BNpwrPWKWERhY8zsyxojPHUOvf02gOtuCxlQDMO8zncrcYjP8e48dKTahJ9zlO3xbjZf
         3n6juvPlOI0v0xrbPAv7A3PZtGC2hgT62INPCmSXQabLE1z7MiKvTuGr9YQv+P4Gxsoy
         Ua7BS4dH5P1hzd6CQrDnR3mxbahimQj7vlO/66nkomKo/Ydckro0fgaJyKE9PJsCQ74V
         lnWcZTemk2lh7fmAEqu/5saTwOmHwpkzcrSXrTR/MXDjIJnmH1jmNuDlI8km1frKRwnI
         3l2A==
X-Gm-Message-State: AAQBX9drj0+hZOmwJn48uG9Onyr8+AsudDTI3zhNPsP/J5OVuuSOUExh
        AHiFkLSXktI3awQxSt0kCtUhOgEoJCk=
X-Google-Smtp-Source: AKy350adke7A5tzKmMCmGj0w1emYIeqpr58Dzo8kFDnVcgx0to78MMueF8eFZlX/DKKyQGPebeQUuQ==
X-Received: by 2002:a17:90a:7066:b0:24b:2b8a:d618 with SMTP id f93-20020a17090a706600b0024b2b8ad618mr18942847pjk.9.1682402364403;
        Mon, 24 Apr 2023 22:59:24 -0700 (PDT)
Received: from [10.1.1.24] (222-152-172-8-fibre.sparkbb.co.nz. [222.152.172.8])
        by smtp.gmail.com with ESMTPSA id w8-20020a1709027b8800b001a661000398sm7393860pll.103.2023.04.24.22.59.21
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 24 Apr 2023 22:59:23 -0700 (PDT)
Subject: Re: signal delivery, was Re: reliable reproducer
To:     Finn Thain <fthain@linux-m68k.org>
References: <4a9c1d0d-07aa-792e-921f-237d5a30fc44.ref@yahoo.com>
 <868b5214-fa13-dcf7-a671-9843169eea06@gmail.com>
 <b1488232-a826-a93a-4806-c11355cf3a77@gmail.com> <87fs8sz6e9.fsf@igel.home>
 <c73f8f04-944c-107c-4343-ade1deb3098c@gmail.com> <878rekz0md.fsf@igel.home>
 <f6ca1bd9-419b-f18e-100a-d212bdbf3da1@gmail.com> <87o7nfyd7e.fsf@igel.home>
 <cb1059f0-527e-2023-9c60-abcbf9eda9b7@gmail.com> <87jzy3y79y.fsf@igel.home>
 <5824d97d-683b-a354-3c39-cb0f54e50bc0@gmail.com>
 <06c14a4a-1679-31d6-0501-97e20741f88a@gmail.com>
 <13d36a79-5aae-d63c-5014-5503688f07bb@linux-m68k.org>
 <d97fb295-886d-226a-c8f9-6359562d919f@gmail.com>
 <1d9955d2-6016-a238-142a-887f95465dd8@linux-m68k.org>
 <4763c8e2-6fb3-eda6-10d0-94ed1d01cd60@gmail.com>
 <a5d70bac-bd00-7131-9ca0-18976f539adf@linux-m68k.org>
 <b150c146-cade-bcd3-9c34-d99284dcd153@gmail.com>
 <c3d2d874-e366-1d3b-71b0-7a089d40308a@linux-m68k.org>
 <1fcaa695-5c2d-0c76-444d-6d6be0105f6e@linux-m68k.org>
 <7c86ad1d-7bbd-8f61-5ac4-56a1b99a8663@gmail.com>
Cc:     debian-68k@lists.debian.org, linux-m68k@lists.linux-m68k.org
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <accc9748-0c44-1a07-4cfe-18726d55dd90@gmail.com>
Date:   Tue, 25 Apr 2023 17:59:19 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <7c86ad1d-7bbd-8f61-5ac4-56a1b99a8663@gmail.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Finn,

Am 25.04.2023 um 14:32 schrieb Michael Schmitz:
>>> Maybe we should try modifying get_sigframe() to increase the gap between
>>> the signal and exception frames from 0-1 long words up to 64-65 long
>>> words.
>>>
>>
>> It turns out that doing so (patch below) does make the problem go away.
>> Was the exception frame getting clobbered?
>
> Might happen, if the frame gap isn't actually equal to the exception
> frame extra size anymore? Aligning the start of the signal frame to the
> next lower quadword boundary increases the gap size.
>
> When setting up the sigframe, the extra is copied to the correct
> location (right past struct sigframe, or into uc_filler). When moving
> that exception frame into place, the assumption is that the gap is the
> extra size, not more.
>
> I'll try dropping the quadword alignment constraint - the return
> trampoline still ought to remain longword aligned.

No luck - still stack corruption.

Cheers,

	Michael
