Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 274A7C636CC
	for <linux-m68k@archiver.kernel.org>; Thu,  9 Feb 2023 03:41:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232801AbjBIDlv (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 8 Feb 2023 22:41:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232802AbjBIDlg (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 8 Feb 2023 22:41:36 -0500
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 584F11ABEA
        for <linux-m68k@lists.linux-m68k.org>; Wed,  8 Feb 2023 19:41:35 -0800 (PST)
Received: by mail-pf1-x433.google.com with SMTP id s20so515216pfe.2
        for <linux-m68k@lists.linux-m68k.org>; Wed, 08 Feb 2023 19:41:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:mime-version:user-agent:date:message-id:from:cc
         :references:to:subject:from:to:cc:subject:date:message-id:reply-to;
        bh=Rd1eV4VoM43wsxEJHDhpyb7HSzriG3L1CEe2rEg4mWY=;
        b=Aboijy1LyfY8C+/Q3/HtNHyO1GlIlLSdrZT+mcPVS7mf3OtOVsaP2HMS/xnZAlp5Oo
         hbqgL8jQs4seIq/u2rmGmF/CsBZmqQGA4WnfrS6UkonE5vshVgoQZ4PP1/jMqu7R4m9l
         c7B7Bqn3Fqp7nR5rQthmSZqXDhmzwvzk0ytEJetLtYhM1ca2YLxy6JIdV5LPhvCB9gYn
         UoESoS9sIvu8IISwT+/C2K3+YKkfhX91i/n+l4dgMICa4DrxbsfbgDJp/Snn/bTExE7k
         fBBqCh9GgqlS2Fv82sqJ0emLnP6vqki74C3Ttn4UH7aCOzp7lx1FnmmlHv0/LW/Zo03z
         Pt6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:mime-version:user-agent:date:message-id:from:cc
         :references:to:subject:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rd1eV4VoM43wsxEJHDhpyb7HSzriG3L1CEe2rEg4mWY=;
        b=FOVSH2MhXgxXoAK5srGCEOG/zB+xVP/jVUUlZ3asnh3bsppN2V/l3c6Q+9FLtcEwlA
         +IxDn2l9EH1HviclSbb0/gZbZ3URzuTDz6KsYlthhW1sAUyfkR5G7cxHGyhoNAH99Vt8
         4+WcCaEZ0HPaY6PNK7R4faK5ynd0JnELHUli0y9BvBT9ddmmalqnfwNMvQIhE9ys5TFf
         xfMlpyN6tbOsU0fgLjskYPVFCzHTFLH2leaVK4fZR74QyJasuakeTpqW9mj46yraV+oU
         J/MQhH0cVQBYjqhQAR1sHaXoloEwAKFkE3DSAVjLBFCOtjV5LTVTzTT+G5frOwm4NfR+
         mX2w==
X-Gm-Message-State: AO0yUKWYt25B0v79CruHV1RkMTKoFmkcJ+BYtarLkOCOnXtJq2nLSzDS
        gh7i6mk4kuQTm13bT7NCFZUuKyJAssw=
X-Google-Smtp-Source: AK7set8rQ0mOm5jUlreeQk3nRpSbIIW6ZYGcv7/dQ7OlRSXcDd2r4sE4W0ZD6RAqppPLae/P9T/iUA==
X-Received: by 2002:a62:14c7:0:b0:5a8:4b66:d8db with SMTP id 190-20020a6214c7000000b005a84b66d8dbmr2630698pfu.5.1675914094381;
        Wed, 08 Feb 2023 19:41:34 -0800 (PST)
Received: from [10.1.1.24] (222-154-147-142-fibre.sparkbb.co.nz. [222.154.147.142])
        by smtp.gmail.com with ESMTPSA id x7-20020aa79187000000b0059072daa002sm185105pfa.192.2023.02.08.19.41.30
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 08 Feb 2023 19:41:33 -0800 (PST)
Subject: Re: stack smashing detected
To:     Stan Johnson <userm57@yahoo.com>,
        Finn Thain <fthain@linux-m68k.org>
References: <4a9c1d0d-07aa-792e-921f-237d5a30fc44.ref@yahoo.com>
 <4a9c1d0d-07aa-792e-921f-237d5a30fc44@yahoo.com>
 <e7574759-4870-d554-dd63-17da220270f1@gmail.com>
 <af524ac9-f5af-e9fb-e33f-0884a0ebfcb6@yahoo.com>
 <8d54f302-0a39-b8c7-4115-5c10c1d3769f@gmail.com>
 <203b8fd4-6618-27a8-7d18-d50e7accfa4b@gmail.com>
 <33d7ea3e-9bd2-16e4-4d9a-f7aa5657a0f7@yahoo.com>
 <c267a9fc-7788-f905-d984-e0372d50d0ec@gmail.com>
Cc:     debian-68k@lists.debian.org,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <dff09ed2-af93-fd43-6d6f-045a6fc0e30d@gmail.com>
Date:   Thu, 9 Feb 2023 16:41:28 +1300
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <c267a9fc-7788-f905-d984-e0372d50d0ec@gmail.com>
Content-Type: multipart/mixed;
 boundary="------------5E2AB34E14FE2986159B4410"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

This is a multi-part message in MIME format.
--------------5E2AB34E14FE2986159B4410
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stan,

Am 08.02.2023 um 11:58 schrieb Michael Schmitz:
> Thanks Stan,
>
> On 8/02/23 08:37, Stan Johnson wrote:
>> Hi Michael,
>>
>> On 2/5/23 3:19 PM, Michael Schmitz wrote:
>>> ...
>>>
>>> Seeing Finn's report that Al Viro's VM_FAULT_RETRY fix may have solved
>>> his task corruption troubles on 040, I just noticed that I probably
>>> misunderstood how Al's patch works.
>>>
>>> Botching up a fault retry and carrying on may well leave the page tables
>>> in a state where some later access could go to the wrong page and
>>> manifest as user space corruption. Could you try Al's patch 4 (m68k: fix
>>> livelock in uaccess) to see if this helps?
>>> ...
>> ok, this appears to be the patch:
>>
>> Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
>> ---
>>   arch/m68k/mm/fault.c | 5 ++++-
>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/m68k/mm/fault.c b/arch/m68k/mm/fault.c
>> index 4d2837eb3e2a..228128e45c67 100644
>> --- a/arch/m68k/mm/fault.c
>> +++ b/arch/m68k/mm/fault.c
>> @@ -138,8 +138,11 @@ int do_page_fault(struct pt_regs *regs, unsigned
>> long address,
>>       fault = handle_mm_fault(vma, address, flags, regs);
>>       pr_debug("handle_mm_fault returns %x\n", fault);
>>
>> -    if (fault_signal_pending(fault, regs))
>> +    if (fault_signal_pending(fault, regs)) {
>> +        if (!user_mode(regs))
>> +            goto no_context;
>>           return 0;
>> +    }
>>
>>       /* The fault is fully completed (including releasing mmap lock) */
>>       if (fault & VM_FAULT_COMPLETED)
>
> That's correct.
>
> Your results show improvement but the problem does not entirely go away.
>
> Looking at differences between 030 and 040/040 fault handling, it
> appears only 030 handles faults corrected by exception tables (such as
> used in uaccess macros) special, i.e. aborting bus error processing
> while 040 and 060 carry on in the fault handler.
>
> I wonder if that's the main difference between 030 and 040 behaviour?

Following the 040 code a bit further, I suspect that happens in the 040 
writeback handler, so this may be a red herring.

> I'll try and log such accesses caught by exception tables on 030 to see
> if they are rare enough to allow adding a kernel log message...

Looks like this kind of event is rare enough to not trigger in a normal 
boot on my 030. Please give the attached patch a try so we can confirm 
(or rule out) that user space access faults from kernel mode are to 
blame for your stack smashes.

Cheers,

	Michael


> Cheers,
>
>     Michael
>
>

--------------5E2AB34E14FE2986159B4410
Content-Type: text/x-diff;
 name="0001-m68k-debug-exception-handling-data-faults-on-030.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="0001-m68k-debug-exception-handling-data-faults-on-030.patch"

From a55467a02b66addca6f74fc32b473bc077cb34b2 Mon Sep 17 00:00:00 2001
From: Michael Schmitz <schmitzmic@gmail.com>
Date: Thu, 9 Feb 2023 14:39:35 +1300
Subject: [PATCH] m68k: debug exception handling data faults on 030

030 faults handled by exception tables are just silently ignored - see how
many of these do happen in practice, and if they are related to 'stack
smashing' faults.

Signed-off-by: Michael Schmitz <schmitzmic@gmail.com>
---
 arch/m68k/kernel/traps.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/m68k/kernel/traps.c b/arch/m68k/kernel/traps.c
index 5c8cba0efc63..b3cef760f7e8 100644
--- a/arch/m68k/kernel/traps.c
+++ b/arch/m68k/kernel/traps.c
@@ -554,8 +554,13 @@ static inline void bus_error030 (struct frame *fp)
 			}
 			/* Don't try to do anything further if an exception was
 			   handled. */
-			if (do_page_fault (&fp->ptregs, addr, errorcode) < 0)
+			if (do_page_fault (&fp->ptregs, addr, errorcode) < 0) {
+				pr_err("Exception handled for data %s fault at %#010lx in %s (pc=%#lx)\n",
+				       ssw & RW ? "read" : "write",
+				       fp->un.fmtb.daddr,
+				       space_names[ssw & DFC], fp->ptregs.pc);
 				return;
+			}
 		} else if (!(mmusr & MMU_I)) {
 			/* probably a 020 cas fault */
 			if (!(ssw & RM) && send_fault_sig(&fp->ptregs) > 0)
-- 
2.17.1


--------------5E2AB34E14FE2986159B4410--
