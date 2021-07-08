Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EFC9C07E96
	for <linux-m68k@archiver.kernel.org>; Thu,  8 Jul 2021 19:28:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2038161621
	for <linux-m68k@archiver.kernel.org>; Thu,  8 Jul 2021 19:28:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229631AbhGHTbC (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 8 Jul 2021 15:31:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229497AbhGHTbC (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 8 Jul 2021 15:31:02 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFA88C061574
        for <linux-m68k@lists.linux-m68k.org>; Thu,  8 Jul 2021 12:28:19 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id oj10-20020a17090b4d8ab0290172f77377ebso4627454pjb.0
        for <linux-m68k@lists.linux-m68k.org>; Thu, 08 Jul 2021 12:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=SZFMW4mU1kuTOvReeiJCvTILGj6LAzRuV2yB6k48QIg=;
        b=QQ6+kBbLV7ogBdebA2/QcAeHo2LJ3le/AttxBIavjzm017XAyEfT8tBQpCzBR6olCC
         JeNolfpubx2MJug8wymCw5Wf/JQaxqq1Zk0KtDV7Ly4bgeVamoc2nCUVd3mUcYkg1SDU
         TL+dFwGUZp2o6PX/3MXhQfzmci65yoRfKOVF7X/5O+u1V3EUk4l6Gj2POcmDuWhwUPle
         5+T5Syez023TPrZwRAce/MRjuMvIkuIRC86U7E1AANNQgVFL3lRyCXyB82aLeBfQWm9x
         trge+UX4UWve9RmAt7LFCEhZsbqzDJ/OPGxLLZBctSNpnAXAyEa9edcVKkyPmQz5jtNp
         MWAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=SZFMW4mU1kuTOvReeiJCvTILGj6LAzRuV2yB6k48QIg=;
        b=mXL74JLb0F+agiyPfDDGwSyIxfkfPLKgIyQsaH3a4n3UQjIgXDuALB3WlACqWaWQBq
         MaHkyZMAzqlaqZx6d49ML6eKQ03z01CdDfwD/uVUqQVXBmBiRGfiuvRS9AzQ9Lvhwn0k
         99Lg1gw/eYCb4f0ACYL2/diYcM1QhnSSHCkqdTW1qrJ6J0AD+V0sjt7fRNUVAZtIK0sj
         Ak1mio5jiuuzF1jwWn43BQ7dJ+M8JwcDgdpGj0oAwwXuAFlcS3kHnEUtsQy0JK5D5/ya
         acnKoV/p1r67r3ASG0P9F1YnJ3x1HAfmWKsxgF/98jSqCRtt52R0U6rl8dYrMpvM5GOr
         DZYw==
X-Gm-Message-State: AOAM5323587Cen38HWU6xNXJn8Kzc6uVpfp0zmRwVGkISKXaTjOBum0r
        daffwjwk8o8haKLs+q5ZTWhmkrn3Ezo=
X-Google-Smtp-Source: ABdhPJyVYgOXKjDlnAbgvlNfJ5OfYaQZ3qKPu1WvsTLryc4/7UdSKOqtlVjerWsa+0eenPxtMXjBpw==
X-Received: by 2002:a17:902:650b:b029:129:9c6a:13d8 with SMTP id b11-20020a170902650bb02901299c6a13d8mr15589734plk.63.1625772498867;
        Thu, 08 Jul 2021 12:28:18 -0700 (PDT)
Received: from ?IPv6:2001:df0:0:200c:a5c1:bb20:811d:7b3b? ([2001:df0:0:200c:a5c1:bb20:811d:7b3b])
        by smtp.gmail.com with ESMTPSA id q12sm3624069pfj.220.2021.07.08.12.28.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jul 2021 12:28:18 -0700 (PDT)
Subject: Re: [PATCH RFC v2] m68k: remove get_fs()/set_fs()
To:     Christoph Hellwig <hch@lst.de>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
References: <1625708899-29013-1-git-send-email-schmitzmic@gmail.com>
 <CAHk-=whRp-m0DFPF27=OZzMq4b=16J+6bQEG_jeDM=osuuZF2w@mail.gmail.com>
 <CAHk-=wgCp0X4Q=GkDF1j1=_XTq4gA_ZsKUXfkPBeeTJcoS6gwQ@mail.gmail.com>
 <20210708043145.GB17672@lst.de>
 <38991687-7b33-994b-b7d3-22400872a45a@gmail.com>
 <20210708045804.GA18249@lst.de>
 <147ffcbd-f946-bb6c-b7bc-35c0672572ce@gmail.com>
 <20210708125751.GA11898@lst.de>
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <bf4ad0a4-5cd4-4e82-8513-64ab47d5e522@gmail.com>
Date:   Fri, 9 Jul 2021 07:28:13 +1200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210708125751.GA11898@lst.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Christoph,

On 9/07/21 12:57 am, Christoph Hellwig wrote:
> On Thu, Jul 08, 2021 at 05:48:46PM +1200, Michael Schmitz wrote:
>> Hi Christoph,
>>
>> Am 08.07.2021 um 16:58 schrieb Christoph Hellwig:
>>> On Thu, Jul 08, 2021 at 04:33:08PM +1200, Michael Schmitz wrote:
>>>>> Yes, that problem exists, but just removing the # causes "inst" to go
>>>>> into the cpp output.  Let me brush up my cpp-foo.
>>>> Putting quotes around 'inst' makes it compile for me.
>>> Do you just want to take the series over from here?  I think you are
>>> about 15 times more qualified than me anyway :)
>> Not in a million years :-) A brief look at my patch review history on
>> linux-m68k will disabuse you of that notion. I routinely hit v6 and higher
>> ... I'm a simple hobbyist, and a little out of my depth here.
> I've force pushed a new version to the branch, can you give it a spin?

Still the same fault (can't start init). But as Linus pointed out, your 
__constant_copy_to_user() is still broken.

I'll try to back out that part sometime later today.

Cheers,

     Michael


