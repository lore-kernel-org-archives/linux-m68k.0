Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB0E5EB64DA
	for <linux-m68k@archiver.kernel.org>; Wed,  5 Jul 2023 22:14:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231691AbjGEWOD (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 5 Jul 2023 18:14:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230487AbjGEWOC (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Wed, 5 Jul 2023 18:14:02 -0400
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0235D131
        for <linux-m68k@vger.kernel.org>; Wed,  5 Jul 2023 15:14:01 -0700 (PDT)
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-55b5a37acb6so18164a12.0
        for <linux-m68k@vger.kernel.org>; Wed, 05 Jul 2023 15:14:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20221208.gappssmtp.com; s=20221208; t=1688595240; x=1691187240;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=e1PYHuNqTuRLJzIljfse+JbLTKjt2Fwd2vT5gf4D1GA=;
        b=XvES4BdrfczecF6NyNOMdgddluSZIdyU/I+fIwl/Gcp6/LtlTXQfkDuTopCsqIru9n
         vFoPy7hn+mtmKKevEWf56wRMSYgnWunjY6RsPgyBhZvw0J/d7s9TJdtI3na/5QAfJPVa
         mj36HSNTXv0mJ1vzYFDVSNMv1TeE4P9VD6cjdm6Ek9wv7ZJcvbYNoeR4gUkYKUfJ32u2
         qfTszQqRVHgWl09OROkungamXKvi19fla6cDHhWE15OPg0AqYaMT9PpilmAaZIli3Hff
         r/NEO1A+Zoh69mHoT7cCh45HbQlXV4Sbxc0yVbT+LxXvEanHtDq0NjLwWD2DgBhrwGqP
         PR8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688595240; x=1691187240;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e1PYHuNqTuRLJzIljfse+JbLTKjt2Fwd2vT5gf4D1GA=;
        b=jCCpPNsibZMmxk739IVzea3LHOOYzQNhqOS4IhNh0ChVhf0NEtKMg9DpBRLVhUL5HH
         mL2D3+2YogHem4dv9San4LaY+E+lv+lph9fp1uQpl/tryklpquVhWh131vf78cgvA3Yd
         5ZZqLWSZDGOe08MQT/BnMMuRL9bV6cr+e9OZ/ZUOw+eixwYupNEKsyliRRFVfQFJOTb2
         8U5LP9CpbJWjxLTjqL4P8oVCBCt5Tp+rcHMG7U2mtS5xQfF6QYR86/abOrgs1JuAOwpT
         i8nbbHaWFhhTkfx4zcRHH7e3fZRksIzcagRvNqyjnh9P1/b/PKw0pCvVZxhHAcZkX0zy
         amlA==
X-Gm-Message-State: ABy/qLaKxDdIQbdCeTaoXrWK+9NrqW4FOTDT4xR93FgiDj24WcYm3x4Z
        eBgRAanjU6bh2i8LDUE7lU/+hQ==
X-Google-Smtp-Source: APBJJlGyHfQLZeEPVMyCRQ8MhTi151yV2sPv49SjE+qnZdYyARJBE/lr/1Kgb251ASx1pPtiHus57A==
X-Received: by 2002:a05:6a20:54a9:b0:12d:77e:ba3 with SMTP id i41-20020a056a2054a900b0012d077e0ba3mr314720pzk.0.1688595240412;
        Wed, 05 Jul 2023 15:14:00 -0700 (PDT)
Received: from [192.168.1.136] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id t21-20020a62ea15000000b00666e649ca46sm23688pfh.101.2023.07.05.15.13.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Jul 2023 15:13:59 -0700 (PDT)
Message-ID: <49192b95-8fc8-7dcd-f062-a4876731e347@kernel.dk>
Date:   Wed, 5 Jul 2023 16:13:58 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v4 1/1] block: bugfix for Amiga partition overflow check
 patch
Content-Language: en-US
To:     Michael Schmitz <schmitzmic@gmail.com>, linux-block@vger.kernel.org
Cc:     linux-m68k@vger.kernel.org, chzigotzky@xenosoft.de,
        geert@linux-m68k.org, hch@lst.de, martin@lichtvoll.de,
        stable@vger.kernel.org, Greg KH <gregkh@linuxfoundation.org>
References: <20230620201725.7020-1-schmitzmic@gmail.com>
 <20230704233808.25166-1-schmitzmic@gmail.com>
 <20230704233808.25166-2-schmitzmic@gmail.com>
 <a84267a2-e353-4401-87d0-e9fdcf4c81a0@kernel.dk>
 <6411e623-8928-3b83-4482-6c1d1b5b2407@gmail.com>
 <f61ba21f-a8a0-756c-2a41-b831a0302395@kernel.dk>
 <01cf1491-a9b3-2342-3fd6-f4cae212bc43@gmail.com>
From:   Jens Axboe <axboe@kernel.dk>
In-Reply-To: <01cf1491-a9b3-2342-3fd6-f4cae212bc43@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

>> should be enough for it to go into stable from 5.2 and onwards.
> OK - I wasn't certain whether you wanted the Fixes or stable tag dropped.
>>> (Greg didn't seem to object to the Fixes: as such, just to the
>>> incorrect version prereq)
>> I think it's really confusing... A patch should only have a Fixes tag if
>> it's fixing a specific bug in that patch. Either it is, in which case
>> you would not need Cc stable at all since it's only in 6.5-rc, or it
>
> It is fixing a bug in b6f3f28f60. I should have checked whether the
> patch series had already gone to release, not just -rc, instead of
> just adding the stable tag out of caution.
But this is the confusion - if it's fixing a bug in b6f3f28f60, then why
is it marked as needing to get backported much further back, predating
that commit?

-- 
Jens Axboe


