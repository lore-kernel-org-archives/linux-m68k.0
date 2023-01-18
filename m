Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA1E4C32793
	for <linux-m68k@archiver.kernel.org>; Wed, 18 Jan 2023 22:21:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229564AbjARWVj (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 18 Jan 2023 17:21:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229446AbjARWVg (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Wed, 18 Jan 2023 17:21:36 -0500
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3917264682
        for <linux-m68k@vger.kernel.org>; Wed, 18 Jan 2023 14:21:36 -0800 (PST)
Received: by mail-pl1-x62f.google.com with SMTP id c6so525513pls.4
        for <linux-m68k@vger.kernel.org>; Wed, 18 Jan 2023 14:21:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XX04lWxahMaP+N40uHcgjtrzC/2DFsBx0hwGwKtF2A8=;
        b=l3YwVqfhamV7XIrChsR00QVq/1DWqs8StR92RtJjRHNzb2F0Co/DwwJ+MWuuKvIGip
         kebc/DGVF9sKIAl+YoPU/Wq8L3fQbYhRitKsv/3GNo5gPK8cUZxlsAO001eV788MJHbb
         e/xbdE44TgxysWoKs3s1dt2A6pUsr4kfF2UB6ZzbvtQ/OKwHN3iIze/UcAyIrdxoepTN
         vyASwODFidXajf3BkHHoHCo+D8YX0+kpDK36YAgcZFrn1NtSRe5+Ns4MEGTlreIIpE22
         lt3nQBW8gak5e2wj8iBHg9D9MbsR/H6vfwUPQ7EYwxLaTy26yB0OQLxLbanKdh5QfbBh
         PZKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XX04lWxahMaP+N40uHcgjtrzC/2DFsBx0hwGwKtF2A8=;
        b=ZlN7E/ya0GbJakcbEzKs9pfS3XLHfzFkFu1Nhx0N881BzXB/YhoLN2s/WjCO6Cxwbj
         3NKYAqywMSt1WWfvPmx+eKIVTwHmI3qLWpKwtt6k8T4NVh+lMV7ugKuygfW4OzFI84AJ
         TH7fkFUH6SW6gUKdBQy01PxusUGQsEQJecLy4/il5rFQcJEHdrtt5FYA181sITVJJXQX
         T80Kdm6LRGfA6pP4QMV0/+4MATMnu83e7q0TZ/1s7uZWHqZtzTIIz25N5NzYtUMsWmlz
         jX6Zw7M+vJ89odV1fNC4QeM20r+LEiI1JsCXdBPQgkzG4PJrlKSW8XkQE2acjOxkhLz6
         sZjg==
X-Gm-Message-State: AFqh2ko1l5ks+WhxBqIMsQF7P3h9v5QAZqVRwY7njmE/8/OpxejGA6ku
        nu88ZFlOG3IwhaY2hO5l5mTwaCPfxtE=
X-Google-Smtp-Source: AMrXdXv1BknvaLz3cARylZREK3KrI7xqjhV5bqmgkV/W+OM2eOIAPUSODfTdLEs9sFYVnmpS3IRheA==
X-Received: by 2002:a17:90a:2b85:b0:229:2d61:e419 with SMTP id u5-20020a17090a2b8500b002292d61e419mr8328562pjd.14.1674080495709;
        Wed, 18 Jan 2023 14:21:35 -0800 (PST)
Received: from ?IPV6:2001:df0:0:200c:113f:d4b9:7ba1:906c? ([2001:df0:0:200c:113f:d4b9:7ba1:906c])
        by smtp.gmail.com with ESMTPSA id o10-20020a17090aac0a00b002291295fc2dsm1844877pjq.17.2023.01.18.14.21.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jan 2023 14:21:34 -0800 (PST)
Message-ID: <2b3a641c-003f-6485-a1c1-0e0fdd45d23b@gmail.com>
Date:   Thu, 19 Jan 2023 11:21:30 +1300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v13 0/3] Add kernel seccomp support for m68k
Content-Language: en-US
To:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc:     linux-m68k@vger.kernel.org, geert@linux-m68k.org,
        Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>,
        Andreas Schwab <schwab@linux-m68k.org>,
        Al Viro <viro@zeniv.linux.org.uk>
References: <20230112035529.13521-1-schmitzmic@gmail.com>
 <0687610a-0efd-51f5-110d-fad0de113556@physik.fu-berlin.de>
 <38518fa1-a584-6e9e-5160-a6922730e8f5@gmail.com>
 <6eab0d17-8928-212b-740c-6db249f79838@physik.fu-berlin.de>
 <10371c02-c54b-fa3e-2729-12d524685652@gmail.com>
 <e5e6d22a-fafc-9535-4682-a957286ce38d@physik.fu-berlin.de>
 <739413f9-0425-59d9-b6a5-fe225f56cf78@gmail.com>
 <a3addb76-d35a-f74d-f939-686699608066@physik.fu-berlin.de>
 <f2ce2438-8fe1-145e-64d0-9c754cee8913@physik.fu-berlin.de>
From:   Michael Schmitz <schmitzmic@gmail.com>
In-Reply-To: <f2ce2438-8fe1-145e-64d0-9c754cee8913@physik.fu-berlin.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Adrian,

On 18/01/23 22:43, John Paul Adrian Glaubitz wrote:
> Hi Michael!
>
> On 1/18/23 09:30, John Paul Adrian Glaubitz wrote:
>> Good catch, thank you! I added the missing definitions and it builds 
>> fine now.
>>
>> Will test against a kernel with your patches now.
>
> libseccomp testsuite now fully passes on m68k, see attached.

Great - you haven't had a chance to compile the kernel selftest suite 
for seccomp though?

I wonder whether some of the 'architecture difference' skipped tests are 
related to the remaining seccomp_bpf self test faults??

>
> @Geert: Any chance you can approve the seccomp patches?

Now that we have m68k support for libseccomp, getting this merged is no 
longer purely academic.

Both Al Viro and Andreas Schwab had provided feedback and improvements - 
could you perhaps review the latest version again (v13) if that's what 
is holding this up?

Cheers,

     Michael


>
> Thanks,
> Adrian
>
