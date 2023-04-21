Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E238C77B73
	for <linux-m68k@archiver.kernel.org>; Fri, 21 Apr 2023 01:57:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231287AbjDUB5a (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 20 Apr 2023 21:57:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229660AbjDUB53 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 20 Apr 2023 21:57:29 -0400
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD77B183
        for <linux-m68k@lists.linux-m68k.org>; Thu, 20 Apr 2023 18:57:28 -0700 (PDT)
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-63b51fd2972so1474081b3a.3
        for <linux-m68k@lists.linux-m68k.org>; Thu, 20 Apr 2023 18:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682042248; x=1684634248;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=soaBuH914CVwLxmstLreOFZF3FGgAAVjqt2XqtPwI0g=;
        b=LxyeJhhangIwHAnLMuDZxM0NUSKLCrakitHekiKBYwMRW2yu2rP9HHOp7kBfULYLQw
         9QWTTsEvgBqutk5ZdlYReHND9cEczfoglLIDQLSX6rAmen04/HZGLd/ZvTZKrs+8lDcn
         OfYiyO5lVWBsZmMllHaVRK6+X+d07ypLAAvlhc0Mgiac32yfxm15PE/Q+qKfkw7oXbmf
         50zE9ukkO4KK4muxytDvMzOLc204IkTHyOphvgEjdKiCFjhpQV+gGOtp8OcgBijr9U7Y
         Fi6XeYE/Amk7i5rsVUGgQQi424ICLSa/XFnNrjt78Ez5YAoFVp9Ijc/mprqlFFSFq4bO
         bMug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682042248; x=1684634248;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=soaBuH914CVwLxmstLreOFZF3FGgAAVjqt2XqtPwI0g=;
        b=IU8KpxG5dW0lkFBHIztpHtDIko+7enelVxAtRtXYXUEVA8sg+/ayKHqci0r4txvB//
         JmdcescU/mIWB3lvyYFs6mc32+CHLuIl5wQQW2okx0QvzoFeVL4Gx4xBHm2e98j4rJCe
         f+euqGE7QGK4jJZcTyLY82+Cj+hKBVOLXwrbfsK4yfp8AWm6QvfFTj7kVbXQoAUqNsjA
         ydwNJQfYpZRnuADAdT9kZSV9cqnza0xRYmJr7mDt50UWT2z0/1zv88knRWOv2Hc7MQcN
         l5w0S8TcwTMlArNtd8rpxpET19dQO133NPygReE/U9CBq39sinqjITOVGTzwHGXQbRjO
         mzpA==
X-Gm-Message-State: AAQBX9cnbQIcOLv245KXWtZyIBFCHhHSVSduUwQdDeC6f3FzOHj2fVA8
        C7j9B+c/ybe947EB3TIijq8e3hixQuA=
X-Google-Smtp-Source: AKy350Y3kKkYUW1u65vawbAfCD273ydQo+Bsccko0RNgEtq4kAy4MqBtGGPLa5e/UudHEAL5nfZznA==
X-Received: by 2002:a05:6a00:2e8b:b0:63c:6485:d5e5 with SMTP id fd11-20020a056a002e8b00b0063c6485d5e5mr4244744pfb.22.1682042248049;
        Thu, 20 Apr 2023 18:57:28 -0700 (PDT)
Received: from ?IPV6:2001:df0:0:200c:852f:30a1:4dd:b24b? ([2001:df0:0:200c:852f:30a1:4dd:b24b])
        by smtp.gmail.com with ESMTPSA id 123-20020a621881000000b00638965d4248sm1804254pfy.184.2023.04.20.18.57.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Apr 2023 18:57:27 -0700 (PDT)
Message-ID: <2e5aa9b7-2de9-aea3-050d-4ea0bc479e50@gmail.com>
Date:   Fri, 21 Apr 2023 13:57:24 +1200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: reliable reproducer, was Re: core dump analysis
Content-Language: en-US
To:     Finn Thain <fthain@linux-m68k.org>
Cc:     debian-68k@lists.debian.org, linux-m68k@lists.linux-m68k.org
References: <4a9c1d0d-07aa-792e-921f-237d5a30fc44.ref@yahoo.com>
 <ef5bcf6f-3541-50c2-9b6a-5e9d2f9c68d5@linux-m68k.org>
 <87zg7rap45.fsf@igel.home>
 <5a5588ca-81c3-3f4c-fd43-c95e90b27939@linux-m68k.org>
 <67f6bc5f-e1fc-64b9-cb3c-1698cf4daf51@gmail.com>
 <9eea635f-c947-eae7-09fa-d39f00d91532@linux-m68k.org>
 <3dfea52a-b09e-517a-c3ca-4b559a3d9ce4@gmail.com>
 <23ddfd2a-1123-45ae-866d-158d45e23ba2@linux-m68k.org>
 <2f241963-44cd-3196-b39e-9c2d63cda1d3@linux-m68k.org>
 <60109ace-4e55-29da-86d9-35e931b11134@gmail.com>
 <c77fe8b3-03fa-491b-7c10-64f2e52c748a@linux-m68k.org>
 <d025ad67-9cc2-cf5a-09a7-ce1d8f66109b@gmail.com>
 <e777cb75-84f6-a61d-810a-2b6d0176e642@linux-m68k.org>
 <c519ff55-fa2a-56c8-6d72-c5afab38ef48@gmail.com>
 <54597ab3-2776-2a55-9952-3bfbbc329829@linux-m68k.org>
 <406cb339-0a0c-4d71-9b5c-c11568793c14@gmail.com>
 <bee7db9b-0f81-dc2e-c737-c8aa25fd0588@linux-m68k.org>
 <fee988a9-dea8-7cae-af02-dda9f12cae08@gmail.com>
 <d4aec386-b0b6-fcae-837c-15ec726e50ec@linux-m68k.org>
From:   Michael Schmitz <schmitzmic@gmail.com>
In-Reply-To: <d4aec386-b0b6-fcae-837c-15ec726e50ec@linux-m68k.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Finn,

On 21/04/23 13:15, Finn Thain wrote:
> Fri, 21 Apr 2023 11:15:22 +1000 (AEST)n Thu, 20 Apr 2023, Michael Schmitz wrote:
>
>> In my tests, increasing the depth does not cause a monotonous increase
>> in fault probability. 16k depth only has four crashes, 8k had nine. I'll
>> stick with 200000 for now.
>>
> My tests used 'norandmaps' in the kernel parameters. With the attached
> .config (which supports Mac and Atari) I saw 12 failures out of 16 tests
> at depth 5000.

Right - I' make sure to add that in future tests.

I'll also add your patch to bus_error030 in my builds.

Cheers,

     Michael


