Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1517C433EF
	for <linux-m68k@archiver.kernel.org>; Wed, 29 Jun 2022 00:14:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229714AbiF2AOy (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 28 Jun 2022 20:14:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229573AbiF2AOx (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 28 Jun 2022 20:14:53 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3D9522BDE
        for <linux-m68k@lists.linux-m68k.org>; Tue, 28 Jun 2022 17:14:52 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id g7so9010250pjj.2
        for <linux-m68k@lists.linux-m68k.org>; Tue, 28 Jun 2022 17:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language
         :from:to:cc:references:in-reply-to:content-transfer-encoding;
        bh=05ASLe35KlS/635AYkr9ttdQBevoBXGVkR7t9AbxzS8=;
        b=dzzx4WtXS/WkHpvykE0Ug4pI7IQoDYpxYcwT22eGTgXydtRyVau06KToMULz4WZ85p
         grc9sV1BmBI096bjPV6AYIg+FD5hBe5gj3092gLAqIoDR6Usno3qkCUxW0him8f4Kt+7
         5Uf02V1S6CU9QXgRzjHroyahVKDiR/lHNsV044fz9JWOwGa1zg1AbzobwrAmZjbW8zFF
         NJWZj5bNSbN92/C5/1fpmT4IbOePFpLv8AN2psJq3YvTqAwnlZ6jrlyHQy1YHFlzFM4V
         6GGIoWoQqCmV+YlWQVYdo/a8/uHvejllTjqLg43Sy9OxgGuiI2LvtGtvLWOWEwxpHjVI
         SvDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=05ASLe35KlS/635AYkr9ttdQBevoBXGVkR7t9AbxzS8=;
        b=fjAfsGOPzA69qFbUwv8ca0UCDjOXqLvwYYWWBBtaBnsCBBOVit5ZKwd4qB9v74Ik7y
         wXBKivGicLmIPt5FFvzwBjoDGcf66MaC9UXjfYsT57fvQCwG1IOKhc5988aaz84wzYwB
         CPApD1Rvtk+uQC0Vs6iEuCvi6Tdfh8lVD5JS6VX5Go/EqbtxPOlm1WJkkCqOvQMsgSe5
         2goh1LfFa2CHoo1T80ja8Qzgf+MQdxyUXVaF79HglfGBn8JAUaT7I5oCawGYt1eW1xe2
         Du/GNZUBBTfIqQLYjmbeZbu0pwKNhVB8c8Yr64HK5ivZx0fcPiLuOp8nl5B3ahVuxtvn
         TVcA==
X-Gm-Message-State: AJIora8b8p7OD0BWaMsBEJHRB/M7U4JaeEKM9YDzekO6GU0CmbZoiNj0
        +ql7OeKDWmREV0ILRVSZNvI=
X-Google-Smtp-Source: AGRyM1s6BvhKknOd3DGT0QQr5uB83fgcSZ645ndGItCzAFy4UPsuv2Gt9Oy4n8CrGTj/IyliMMkT6Q==
X-Received: by 2002:a17:903:240e:b0:168:ea13:f9e0 with SMTP id e14-20020a170903240e00b00168ea13f9e0mr7684101plo.6.1656461692074;
        Tue, 28 Jun 2022 17:14:52 -0700 (PDT)
Received: from ?IPV6:2001:df0:0:200c:75aa:d6ca:4354:6033? ([2001:df0:0:200c:75aa:d6ca:4354:6033])
        by smtp.gmail.com with ESMTPSA id c13-20020a170902c1cd00b0016a276aada7sm9950167plc.20.2022.06.28.17.14.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jun 2022 17:14:51 -0700 (PDT)
Message-ID: <2402062b-aae6-a247-06a8-3775c2909bdb@gmail.com>
Date:   Wed, 29 Jun 2022 12:14:42 +1200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2 3/3] arch/*/: remove CONFIG_VIRT_TO_BUS
Content-Language: en-US
From:   Michael Schmitz <schmitzmic@gmail.com>
To:     Bart Van Assche <bvanassche@acm.org>,
        Arnd Bergmann <arnd@kernel.org>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        scsi <linux-scsi@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Jakub Kicinski <kuba@kernel.org>,
        Christoph Hellwig <hch@infradead.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Linux IOMMU <iommu@lists.linux-foundation.org>,
        Khalid Aziz <khalid@gonehiking.org>,
        "Maciej W . Rozycki" <macro@orcam.me.uk>,
        Matt Wang <wwentao@vmware.com>,
        Miquel van Smoorenburg <mikevs@xs4all.net>,
        Mark Salyzyn <salyzyn@android.com>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Linux-Arch <linux-arch@vger.kernel.org>,
        alpha <linux-alpha@vger.kernel.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Parisc List <linux-parisc@vger.kernel.org>,
        Denis Efremov <efremov@linux.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
References: <20220617125750.728590-1-arnd@kernel.org>
 <20220617125750.728590-4-arnd@kernel.org>
 <6ba86afe-bf9f-1aca-7af1-d0d348d75ffc@gmail.com>
 <CAMuHMdVewn0OYA9oJfStk0-+vCKAUou+4Mvd5H2kmrSks1p5jg@mail.gmail.com>
 <b4e5a1c9-e375-63fb-ec7c-abb7384a6d59@gmail.com>
 <9289fd82-285c-035f-5355-4d70ce4f87b0@gmail.com>
 <CAMuHMdXUihTPD9A9hs__Xr2ErfOqkZ5KgCHqm+9HvRf39uS5kA@mail.gmail.com>
 <c30bc9b6-6ccd-8856-dc6b-4e16450dad6f@gmail.com>
 <CAK8P3a1rxEVwVF5U-PO6pQkfURU5Tro1Qp8SPUfHEV9jjWOmCQ@mail.gmail.com>
 <9f812d3d-0fcd-46e6-6d7e-6d4bf66f24ab@gmail.com>
 <fc47e8da-81d3-e563-0a17-4eb23db015cc@acm.org>
 <859c2adc-d3cb-64e8-faba-06e1ac5eddaf@gmail.com>
In-Reply-To: <859c2adc-d3cb-64e8-faba-06e1ac5eddaf@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Bart,

On 29/06/22 12:01, Michael Schmitz wrote:
>
>> An example of a user space application that passes an SG I/O data 
>> buffer to the kernel that is aligned to a four byte boundary but not 
>> to an eight byte boundary if the -s (scattered) command line option 
>> is used: 
>> https://github.com/osandov/blktests/blob/master/src/discontiguous-io.cpp
>
> Thanks - four byte alignment actually wouldn't be an issue for me. 
> It's two byte or smaller that would trip up the SCSI DMA.
>
> While I'm sure such an even more pathological test case could be 
> written, I was rather worried about st.c and sr.c input ...
Nevermind - I just see m68k defines ARCH_DMA_MINALIGN to be four bytes. 
Should be safe for all that matters, then.

Cheers,

     Michael


