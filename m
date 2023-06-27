Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FF62EB64DC
	for <linux-m68k@archiver.kernel.org>; Tue, 27 Jun 2023 21:01:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229599AbjF0VBf (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 27 Jun 2023 17:01:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229881AbjF0VBd (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 27 Jun 2023 17:01:33 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30D17F2
        for <linux-m68k@lists.linux-m68k.org>; Tue, 27 Jun 2023 14:01:33 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1b7f2239bfdso30224075ad.1
        for <linux-m68k@lists.linux-m68k.org>; Tue, 27 Jun 2023 14:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687899692; x=1690491692;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=P+M7tEnjJDtu150UIK78eMZjmbGUtM7e5Fjt8nWZ0yk=;
        b=EEAFfmkXxvxLQKSckNGd2ZSV3KFogeID+Fu07F5vObGax9BbbGTHMjNPkWpqJAJVcH
         pQvHfFi3MuvS2en7hgib7UJpPWUapwBCg8rlberKLmSq3DFWM7/xIZN7INLmmqEHLsUh
         qitezyDQfhSscafezpHggVgt0WLI8tgIl0uMXCJdPAHvlcj4VIjJKb6j7/ZGCnIDizgv
         wo2zP75PWYpQesW5XMNkIMNlUWOk9aqZVrMomyrANyuVHFRGKdh0f6XzxRPe0kewrYvm
         0KzGKCqgMKcTqBBhxX7lyhj56QxI4SK/fKCSdPeLy85gsmtVFv88cBuoZEpsI4YCe97K
         o/WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687899692; x=1690491692;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P+M7tEnjJDtu150UIK78eMZjmbGUtM7e5Fjt8nWZ0yk=;
        b=CHhvJQdNVcO0gP58smAxnJyklAwtHsiG8HcOkaYzYAoyEEBAp8dEyxb7V3wXh/1ycM
         UU7ZJaBa7OoreUwoIU6eSNOOpZ5JF2tnFZDw4ITx8pol8uiKO3STafSJdPB9QadHYslz
         kGhW4Obu7Zlf+N5KUSP89Eo1tY7suI1EdBZLDMXM6bOnm8hHuj4KiJ+ZeRS+6P2dkoyH
         Z9Y8xvwCUU/aYcFOBO+KpSm5TFIkn/IWHvllI0DTsegpVYMfu4rTXWAQsHZJAS9HFsqm
         UhEHTvWRD9tv0wH3ry2QOW0PSWvouUpPIrgjooyruF98MgZWQYJgOFkVLlX/4cxXqq+N
         VbrA==
X-Gm-Message-State: AC+VfDw4XCqXWZP1imaGuc3Q39IX+wz5vhkq+E7bSO5uw6EmbcItztZ5
        1t93XFPtNDJ9JFCJ8Vn/FsM=
X-Google-Smtp-Source: ACHHUZ5Ms+IS+/rtXxolIJxIsutHi1fnnUiL8cEAZTZ1vZL/Fg4JF6S5Mmuw32zf0DumOU0QNMHuig==
X-Received: by 2002:a17:902:f542:b0:1b5:91:4693 with SMTP id h2-20020a170902f54200b001b500914693mr14752161plf.1.1687899692466;
        Tue, 27 Jun 2023 14:01:32 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id jl3-20020a170903134300b001ac6b926621sm6363521plb.292.2023.06.27.14.01.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jun 2023 14:01:31 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <2b7e8b1d-1697-6a25-434d-352f95e6fff2@roeck-us.net>
Date:   Tue, 27 Jun 2023 14:01:29 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v5 26/33] nios2: Convert __pte_free_tlb() to use ptdescs
Content-Language: en-US
To:     Dinh Nguyen <dinguyen@kernel.org>,
        Vishal Moola <vishal.moola@gmail.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org,
        linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
        loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
        linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
        linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
        sparclinux@vger.kernel.org, linux-um@lists.infradead.org,
        xen-devel@lists.xenproject.org, kvm@vger.kernel.org,
        Hugh Dickins <hughd@google.com>,
        Mike Rapoport <rppt@kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>
References: <20230622205745.79707-1-vishal.moola@gmail.com>
 <20230622205745.79707-27-vishal.moola@gmail.com>
 <13bab37c-0f0a-431a-8b67-4379bf4dc541@roeck-us.net>
 <CAOzc2px6VutRkMUTn+M5LFLf1YbRVZFgJ=q7StaApwYRxUWqQA@mail.gmail.com>
 <cc954b15-63ab-9d9f-2d37-1aea78b7f65f@roeck-us.net>
 <b6a5753b-8874-6465-f690-094ee753e038@roeck-us.net>
 <CAOzc2pxdqeaRjYLfOqvMW-AEobTzD9xOP+MyP9nxgEbi1T2r7Q@mail.gmail.com>
 <c3751051-7fc7-7129-b9a7-ead71c576ace@kernel.org>
From:   Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <c3751051-7fc7-7129-b9a7-ead71c576ace@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On 6/27/23 13:05, Dinh Nguyen wrote:
> 
> 
> On 6/27/23 14:56, Vishal Moola wrote:
>> On Tue, Jun 27, 2023 at 12:14 PM Guenter Roeck <linux@roeck-us.net> wrote:
>>>
>>> On 6/27/23 12:10, Guenter Roeck wrote:
>>>> On 6/27/23 10:42, Vishal Moola wrote:
>>>>> On Mon, Jun 26, 2023 at 10:47 PM Guenter Roeck <linux@roeck-us.net> wrote:
>>>>>>
>>>>>> On Thu, Jun 22, 2023 at 01:57:38PM -0700, Vishal Moola (Oracle) wrote:
>>>>>>> Part of the conversions to replace pgtable constructor/destructors with
>>>>>>> ptdesc equivalents.
>>>>>>>
>>>>>>> Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
>>>>>>> Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>
>>>>>>
>>>>>> This patch causes all nios2 builds to fail.
>>>>>
>>>>> It looks like you tried to apply this patch on its own. This patch depends
>>>>> on patches 01-12 of this patchset to compile properly. I've cross-compiled
>>>>> this architecture and it worked, but let me know if something fails
>>>>> when its applied on top of those patches (or the rest of the patchset).
>>>>
>>>>
>>>> No, I did not try to apply this patch on its own. I tried to build yesterday's
>>>> pending-fixes branch of linux-next.
>>>>
>>>
>>> A quick check shows that the build fails with next-20230627. See log below.
>>
>> Ah it looks like this one slipped into -next on its own somehow? Stephen, please
>> drop this patch from -next; it shouldn't be in without the rest of the
>> patchset which
>> I intend to have Andrew take through the mm tree.
>>
> 
> I apologize, but I queue this patch up for Linus and it's been pulled for this merge window. I didn't realize you were going to take this patchset through another tree.
> 
> Sorry about that.
> 

Yes, indeed, I just confirmed that all nios2 builds in the mainline kernel
are now broken.

Guenter

