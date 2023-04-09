Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24FCCC7619A
	for <linux-m68k@archiver.kernel.org>; Sun,  9 Apr 2023 01:56:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229451AbjDIB4R (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sat, 8 Apr 2023 21:56:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbjDIB4Q (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sat, 8 Apr 2023 21:56:16 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CE794C38
        for <linux-m68k@lists.linux-m68k.org>; Sat,  8 Apr 2023 18:56:14 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id q15-20020a17090a2dcf00b0023efab0e3bfso4441641pjm.3
        for <linux-m68k@lists.linux-m68k.org>; Sat, 08 Apr 2023 18:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1681005373;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tQQY8IybG7Zg8B8RwfRlPWMhUE/ejDqdO1wvDK+Ue1A=;
        b=JKHhIiST2Pu6mApi24cgX6QJrczg44w8+pEEjWloHkqF7HqHjoqfsWbLqeOcr6gUTw
         JgkIvDdnTqRx/SzBO0nKQwQRdIi7UXAnhaRHVB5xFDKg9l//ODV/WZa67zdEf0C3Bmyc
         y6pWfZURTQhj/LvtO5qAVPlYMnEZ3mAu7AJKBJPb4jhk+mSVrRRWPtoPKsDvUALzzLpj
         xmbo920CY3H3g3oJbwp/hU/Qn4dAxwyg6ZY84vh5yDG+MwpU+MDHDH5w8tWKyS2PFT35
         X7xjUmF5FiqU5rnnp1i6UpUU8J0Kl9LSwGECKSHpJNVeZl2mX5VZI1+FGpvWFvT8TwYs
         sezQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681005373;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tQQY8IybG7Zg8B8RwfRlPWMhUE/ejDqdO1wvDK+Ue1A=;
        b=o1pJ8GTYYr1F/TeeugYL65ejYQCEOtake7L+x6cNjHQETS/KOXAP39+j2RnqjUGYzg
         uIlZiNErRgbwRnWGgGV8hOEoHjfmXx2fJU3UZaVZhR534UaAscGpFZKfRwbSqYBb0PSg
         EyROSm2eT+WUZ94fnh6lsEFfPTl7XoqLtjWzUlZBsSjfASw3r27GgucrYx/+gKXs3Zqd
         5ZMSdmFwDNnNuSYeSTLnsz5FTo+oe2Gab6ZgBWzXGMOF5BGJMd+cOr2kmLK7noIy243Z
         Dq4bB9E+cIH03g0zGofRtGi0nLvTmyN1xUFJk5ZZ57mf3UvM7Y481qkHh+GnQbXlqR9D
         3AVg==
X-Gm-Message-State: AAQBX9fAruiVmR+szzHmuBRLBwa9NwyGhnFcT9fXYZ6XBKI82tS72DSW
        DrFUMGKpKxAhnNBiw1P1QB+wov6rwY0=
X-Google-Smtp-Source: AKy350aYA5gQZX+rEE71jeZGJrrgVrD8ATOS6aUI3wx5zT+GpQ12g6hyIFOjNmz309lTiPgGsU+XMw==
X-Received: by 2002:a17:90b:3847:b0:246:696f:b1f1 with SMTP id nl7-20020a17090b384700b00246696fb1f1mr6325681pjb.6.1681005373243;
        Sat, 08 Apr 2023 18:56:13 -0700 (PDT)
Received: from [10.1.1.24] (222-154-151-112-fibre.sparkbb.co.nz. [222.154.151.112])
        by smtp.gmail.com with ESMTPSA id j3-20020a17090adc8300b002369d3b282csm3327276pjv.40.2023.04.08.18.56.09
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 08 Apr 2023 18:56:12 -0700 (PDT)
Subject: Re: core dump analysis, was Re: stack smashing detected
To:     Geert Uytterhoeven <geert@linux-m68k.org>
References: <4a9c1d0d-07aa-792e-921f-237d5a30fc44.ref@yahoo.com>
 <30a1be59-a1fd-f882-1072-c7db8734b1f1@gmail.com>
 <39f79c2d-e803-d7b1-078f-8757ca9b1238@yahoo.com>
 <c47abfdc-31c8-e7ed-1c14-90f68710f25d@gmail.com>
 <040ad66a-71dd-001b-0446-36cbd6547b37@yahoo.com>
 <5b9d64bb-2adc-20a2-f596-f99bf255b5cc@linux-m68k.org>
 <56bd9a33-c58a-58e0-3956-e63c61abe5fe@yahoo.com>
 <1725f7c1-2084-a404-653d-9e9f8bbe961c@linux-m68k.org>
 <e10b8e06-6a36-5c83-89da-bec8fd7d3ed9@linux-m68k.org>
 <19d1f2ac-67dd-5415-b64a-1e1b4451f01e@linux-m68k.org>
 <ef5bcf6f-3541-50c2-9b6a-5e9d2f9c68d5@linux-m68k.org>
 <87zg7rap45.fsf@igel.home>
 <5a5588ca-81c3-3f4c-fd43-c95e90b27939@linux-m68k.org>
 <67f6bc5f-e1fc-64b9-cb3c-1698cf4daf51@gmail.com>
 <9eea635f-c947-eae7-09fa-d39f00d91532@linux-m68k.org>
 <3dfea52a-b09e-517a-c3ca-4b559a3d9ce4@gmail.com>
 <23ddfd2a-1123-45ae-866d-158d45e23ba2@linux-m68k.org>
 <8ff53c49-331e-1388-31c5-79cf21a2c201@gmail.com>
 <CAMuHMdVPayRjadOYxxZb-J7q-YtgZDwtCs93+Rz_ReSk+NHCwg@mail.gmail.com>
Cc:     Finn Thain <fthain@linux-m68k.org>,
        Andreas Schwab <schwab@linux-m68k.org>,
        debian-68k@lists.debian.org, linux-m68k@lists.linux-m68k.org
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <79ad6f51-5d02-0104-3b63-024e54a25e3c@gmail.com>
Date:   Sun, 9 Apr 2023 13:56:05 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdVPayRjadOYxxZb-J7q-YtgZDwtCs93+Rz_ReSk+NHCwg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Geert,

Am 08.04.2023 um 00:06 schrieb Geert Uytterhoeven:
> Hi Michael,
>
> On Fri, Apr 7, 2023 at 3:58 AM Michael Schmitz <schmitzmic@gmail.com> wrote:
>> The easiest way to do that is to log all wait and signal syscalls, as
>> well as process exit. That might alter timing if these log messages go
>> to the serial console though. Is that what you have in mind?
>
> Store to RAM, retrieve through a new /proc file?

Yes, that could be done, though I'd rather avoid duplicating a lot of 
the generic message formatting code (printk and friends).

I'll have a look around ...

Cheers,

	Michael

>
> Gr{oetje,eeting}s,
>
>                         Geert
>
