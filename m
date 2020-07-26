Return-Path: <SRS0=TiHb=BF=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C7D7C433E4
	for <linux-m68k@archiver.kernel.org>; Sun, 26 Jul 2020 21:39:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 00318206E3
	for <linux-m68k@archiver.kernel.org>; Sun, 26 Jul 2020 21:39:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BTFc/z0j"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726522AbgGZVjj (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 26 Jul 2020 17:39:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726467AbgGZVjj (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sun, 26 Jul 2020 17:39:39 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5146AC0619D2
        for <linux-m68k@lists.linux-m68k.org>; Sun, 26 Jul 2020 14:39:38 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id lw1so417837pjb.1
        for <linux-m68k@lists.linux-m68k.org>; Sun, 26 Jul 2020 14:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=tm2yOHzLKnb8WxDhtr4R9gnttBBFhuVFIJKIQT3SO+s=;
        b=BTFc/z0jeD/TTIiZf7tiX9S3jjEKZbPgmCKneC5rGmY2V0xgDW+ZQnmy/8hYV/wTC2
         kPBSAzbuHuSWHEX4AzDvX4CbA4VXyHH/J7GgP3AdCI9psI5QkuYtMRuEw55oKr65x0Y8
         ANU3abd6ueWRh+SvzR55zTGG/UnDkI62GL5EwLOO4re3LHQYOA39XFwp1qgd3MMZbVBT
         zY6iUhWIiHyo36S1jRNBrqjAdp5jq5XIkgAq2nTA8dqIVvcpgajqqh3+qQW5oZVSSD4n
         IaclRVNSHbbMuQ6vOkM66h60/NyNHQNFDBFOlj7p4upr/wz2nClUeixWVuyHj07IVH2T
         LelA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=tm2yOHzLKnb8WxDhtr4R9gnttBBFhuVFIJKIQT3SO+s=;
        b=GHCs0LbB29ZjfJj5YGRqJcqoUIZvubiVH/cc3IO/gU5NwzL1jMgYNzLycS8+LDoYzI
         uIEPXAlJYWifJ8iKtY97wlxdk+LcJ0TbUqFOy9nIWPFX5RtIZMlJv5vW28ygm3/cF7H4
         dmpNQhZCF91sQ04KNItypuZYFwW1ehXAMNFED+O6PzIbLMoYxSmG9Zh9EWUFS0CZBfm3
         +8mnxamuf0UwLLiBfbdIQf0Zh/j0I/0fL4wdNnWeVBIsZXrDvUEBi94Rw3kh6148xgqV
         FT+AWc3lE0WpSdj+fZItr8zGGY5rFiS0QNzALtZaFS+Jtc+PXyH3I/poOHCXb2c2PnO4
         HagQ==
X-Gm-Message-State: AOAM531V7ry2Azm/LBJC1F5xGF4gmokoyCnXQA4pJodFWZXORcnnecwf
        QHFijWTeyFBiFLQ7fMZKu14=
X-Google-Smtp-Source: ABdhPJxWPEf02kfJbM7ImOOtVk7s80zwlrqzNeYKDrfZmgWStkCl926Q4lIRCUochzI1UQl9/DVoRw==
X-Received: by 2002:a17:90b:46c1:: with SMTP id jx1mr16388771pjb.157.1595799577771;
        Sun, 26 Jul 2020 14:39:37 -0700 (PDT)
Received: from ?IPv6:2001:df0:0:200c:ec2f:8388:f010:f71a? ([2001:df0:0:200c:ec2f:8388:f010:f71a])
        by smtp.gmail.com with ESMTPSA id z3sm4498022pjn.32.2020.07.26.14.39.35
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 26 Jul 2020 14:39:37 -0700 (PDT)
Subject: Re: Seccomp support for linux-m68k
To:     Andreas Schwab <schwab@linux-m68k.org>
Cc:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Debian m68k <debian-68k@lists.debian.org>,
        Helge Deller <deller@gmx.de>
References: <cd3ff9a1-030e-1e34-3950-99088ef81be0@physik.fu-berlin.de>
 <5642df4a-be8f-01eb-63c1-b5b4d75fa9d0@physik.fu-berlin.de>
 <06f3ccd0-3567-5905-eea0-80fb18206648@gmail.com> <877durreph.fsf@igel.home>
 <80cef911-af86-c49f-5ac3-1cfe7037de80@gmail.com> <87wo2q5yhx.fsf@igel.home>
 <460261ab-8c10-d625-a4e4-a4e755413018@gmail.com> <877duq56hn.fsf@igel.home>
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <96592373-33e0-e7a5-052b-5cd53b2d9fc5@gmail.com>
Date:   Mon, 27 Jul 2020 09:39:28 +1200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <877duq56hn.fsf@igel.home>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Andreas,

On 27/07/20 9:08 AM, Andreas Schwab wrote:
> On Jul 27 2020, Michael Schmitz wrote:
>
>> Hi Andreas,
>>
>> On 26/07/20 11:03 PM, Andreas Schwab wrote:
>>> On Jul 26 2020, Michael Schmitz wrote:
>>>
>>>> No particular reason - I had seen testb used in the syscall entry code and
>>> Where?  That may be bugs.
>> Here:
>>
>> ENTRY(ret_from_signal)
>>          movel   %curptr@(TASK_STACK),%a1
>>          tstb    %a1@(TINFO_FLAGS+2)
>>          jge     1f
>>          jbsr    syscall_trace_leave
>> 1:      RESTORE_SWITCH_STACK
>>          addql   #4,%sp
>> ....
>>
>> and here:
>>
>> ENTRY(system_call)
>>          SAVE_ALL_SYS
>>
>>          GET_CURRENT(%d1)
>>          movel   %d1,%a1
>>
>>          | save top of frame
>>          movel   %sp,%curptr@(TASK_THREAD+THREAD_ESP0)
>>
>>          | syscall trace?
>>          tstb    %a1@(TINFO_FLAGS+2)
>>          jmi     do_trace_entry
>>          cmpl    #NR_syscalls,%d0
>>          jcc     badsys
>>
> How is that relevant?  That is testing a single bit, of course.

No, tstb tests a byte operand. btst tests a bit. And testing the second 
byte of the thread info flags is just what we need if the trace bits are 
14 and 15.

(Had to look up the m68k programmer's reference and check to be sure, 
admittedly.)

Cheers,

     Michael

>
> Andreas.
>
