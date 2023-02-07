Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94EE2C636CC
	for <linux-m68k@archiver.kernel.org>; Tue,  7 Feb 2023 22:58:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230012AbjBGW6M (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 7 Feb 2023 17:58:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229953AbjBGW6L (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 7 Feb 2023 17:58:11 -0500
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4E031BC8
        for <linux-m68k@lists.linux-m68k.org>; Tue,  7 Feb 2023 14:58:10 -0800 (PST)
Received: by mail-pj1-x102c.google.com with SMTP id o16-20020a17090ad25000b00230759a8c06so349561pjw.2
        for <linux-m68k@lists.linux-m68k.org>; Tue, 07 Feb 2023 14:58:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YNtSC/zkNNPqfJLQrgVUzYHaOC2fVVi3+2+umFBoggM=;
        b=eyzvp2nO4w8jYeKbKnRFOFVEb6jU2g1PFRx5mjAWpr2Fevv7kTemzgkfHaAMJzuUKJ
         SSl6lHD70sAOmRfgbNIaVAf/pAEAaKPEN/M2quRdOQj8WAur5V6rgSBfhtoxYpW4pjNr
         1nwz7exJkX9+20XugOydYQqXnikc7DifwRXs/latZynVOaexI6bcOerorQQR+xAtrqfi
         aZB4TeMM4fECtUfIY+MhaH8uZtjQvkHCAky2IfbVfo0DuwYOJDbfGOkVG7u/HqE2hbxA
         270MMPOa9+IcFvLKzw2vf6S5B4OL2IA2R1h3/cFJNxvX/M2dHPOyWmq/AUQMxRquJUg4
         zYBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YNtSC/zkNNPqfJLQrgVUzYHaOC2fVVi3+2+umFBoggM=;
        b=y2JPff6mt9NF5OUsPb08CV0XgoozCtRCnmpia/Yk1xTLRLqLObmeGfcvRBXmZjuMZw
         p3gzO38wzO65qwoioXswX1KRTYiRWo9Wt/Ae2yLLNmcuFNhetsox0xA9K6CiYFgUrDKj
         6jIXt2t/oXOFvuz9+juwL6qp9e2pAKVn+ProjOf430IlPGfcwG+aoWvsPl4a6amPZJZr
         +d3qa6dKQWbtMBfYvdM1aVUdZGfFBdASwse25embee0upDVMf7Tv5tSc2CqVbQ4muN85
         CpQPGTYuiIKhW5RkhI6xTuN04P5ToSbVGjpRb+PANuInuq1bjI7YTqWCpK+9lEqdn7xh
         pr0A==
X-Gm-Message-State: AO0yUKW81CsIxkZEQdIVErRCaffjgNsnfvflykPjs+LeOR1xhL10nq7V
        p003SSs80jpI9XH30H/5iau+0JUx3S4=
X-Google-Smtp-Source: AK7set8UwHlMiKt9d/4gM35v8VRJDx7UA3rPLZT0EQs6I2FOOwjlpILI33b1itR7UrZVtcdbxVENeA==
X-Received: by 2002:a17:90b:4f4d:b0:230:c41b:4d8d with SMTP id pj13-20020a17090b4f4d00b00230c41b4d8dmr524317pjb.16.1675810689978;
        Tue, 07 Feb 2023 14:58:09 -0800 (PST)
Received: from ?IPV6:2001:df0:0:200c:65af:66bd:e324:4a85? ([2001:df0:0:200c:65af:66bd:e324:4a85])
        by smtp.gmail.com with ESMTPSA id d23-20020a17090ad99700b00213202d77d9sm49259pjv.43.2023.02.07.14.58.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Feb 2023 14:58:09 -0800 (PST)
Message-ID: <c267a9fc-7788-f905-d984-e0372d50d0ec@gmail.com>
Date:   Wed, 8 Feb 2023 11:58:05 +1300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: stack smashing detected
To:     Stan Johnson <userm57@yahoo.com>,
        Finn Thain <fthain@linux-m68k.org>
Cc:     debian-68k@lists.debian.org,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
References: <4a9c1d0d-07aa-792e-921f-237d5a30fc44.ref@yahoo.com>
 <4a9c1d0d-07aa-792e-921f-237d5a30fc44@yahoo.com>
 <e7574759-4870-d554-dd63-17da220270f1@gmail.com>
 <af524ac9-f5af-e9fb-e33f-0884a0ebfcb6@yahoo.com>
 <8d54f302-0a39-b8c7-4115-5c10c1d3769f@gmail.com>
 <203b8fd4-6618-27a8-7d18-d50e7accfa4b@gmail.com>
 <33d7ea3e-9bd2-16e4-4d9a-f7aa5657a0f7@yahoo.com>
Content-Language: en-US
From:   Michael Schmitz <schmitzmic@gmail.com>
In-Reply-To: <33d7ea3e-9bd2-16e4-4d9a-f7aa5657a0f7@yahoo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Thanks Stan,

On 8/02/23 08:37, Stan Johnson wrote:
> Hi Michael,
>
> On 2/5/23 3:19 PM, Michael Schmitz wrote:
>> ...
>>
>> Seeing Finn's report that Al Viro's VM_FAULT_RETRY fix may have solved
>> his task corruption troubles on 040, I just noticed that I probably
>> misunderstood how Al's patch works.
>>
>> Botching up a fault retry and carrying on may well leave the page tables
>> in a state where some later access could go to the wrong page and
>> manifest as user space corruption. Could you try Al's patch 4 (m68k: fix
>> livelock in uaccess) to see if this helps?
>> ...
> ok, this appears to be the patch:
>
> Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
> ---
>   arch/m68k/mm/fault.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/arch/m68k/mm/fault.c b/arch/m68k/mm/fault.c
> index 4d2837eb3e2a..228128e45c67 100644
> --- a/arch/m68k/mm/fault.c
> +++ b/arch/m68k/mm/fault.c
> @@ -138,8 +138,11 @@ int do_page_fault(struct pt_regs *regs, unsigned
> long address,
>   	fault = handle_mm_fault(vma, address, flags, regs);
>   	pr_debug("handle_mm_fault returns %x\n", fault);
>
> -	if (fault_signal_pending(fault, regs))
> +	if (fault_signal_pending(fault, regs)) {
> +		if (!user_mode(regs))
> +			goto no_context;
>   		return 0;
> +	}
>
>   	/* The fault is fully completed (including releasing mmap lock) */
>   	if (fault & VM_FAULT_COMPLETED)

That's correct.

Your results show improvement but the problem does not entirely go away.

Looking at differences between 030 and 040/040 fault handling, it 
appears only 030 handles faults corrected by exception tables (such as 
used in uaccess macros) special, i.e. aborting bus error processing 
while 040 and 060 carry on in the fault handler.

I wonder if that's the main difference between 030 and 040 behaviour?

I'll try and log such accesses caught by exception tables on 030 to see 
if they are rare enough to allow adding a kernel log message...

Cheers,

     Michael


