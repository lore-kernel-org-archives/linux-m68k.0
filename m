Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27C59C07E95
	for <linux-m68k@archiver.kernel.org>; Tue, 13 Jul 2021 08:16:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 05B58611AB
	for <linux-m68k@archiver.kernel.org>; Tue, 13 Jul 2021 08:16:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234431AbhGMITX (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 13 Jul 2021 04:19:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234157AbhGMITX (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 13 Jul 2021 04:19:23 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECAD9C0613DD
        for <linux-m68k@lists.linux-m68k.org>; Tue, 13 Jul 2021 01:16:32 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id o201so13792941pfd.1
        for <linux-m68k@lists.linux-m68k.org>; Tue, 13 Jul 2021 01:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=uiLDCxGu4R5ODJZG2nP1Ma3mr+vdry9ComUUgpZ55eU=;
        b=Okl6YFHMtw+P+QMpXOINAca4/vU+8nexLiFaZTNeAY11kifAL6k7Xi/sYLkzswzYRD
         zT0DxWz+bI44oONG+JMQqnKdNp6v6la9m03dgPcCyGpqCbqZPC9mw3iiQWUw+ER4vhvs
         AoFfUacrk4S7QE2NUL5wWL6L6efB/YECwS9ZuRp35e5MbQ2ddKFmft/X3WMd5006rjKe
         pMYf0foPR47rHg0FHv1Vyx4ULQar/uI8xoMntqa+G5XCyTsrkQ7OSz4C+SZKvStEK5RE
         iIzkRnEvvaxp0sUXS5yfc07xTaKyrx3mrDQGyDGRrjcT1PIcBBPScXnL5b426JRipXEj
         LVIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:cc:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=uiLDCxGu4R5ODJZG2nP1Ma3mr+vdry9ComUUgpZ55eU=;
        b=o6OvAQLU+6kLo4roHNFnTUWLRpwXJKRhKcbf3ZiSb1By/HkDwpCghmev5EPkV/sMNR
         mrkdNrHaSG7eT/02rbjgBH3k+RWmQSSwuf24VqFsgXfyJQuFau6+AussqDLanzp7nbWd
         gEyi8vw765SDdtLkCJ+8mS2u//yDTYg8mM2Gj8a1/IrwARFphWSrsKw8JuCtwagWTL1Z
         zqFMuEmMyFRQOEins1VC2rDhduejOsPHdtW7dT1hyeWXrEGL5YfOoDA191Jx+sNZsdj0
         Niz9OXQU9HjRdKGN1UglL8nSFPmJBIvubdPJ0ZURVyrg8NgAlO2e+9pXmtOfRxG0ozck
         hX+g==
X-Gm-Message-State: AOAM5311DM5FboKzQfuTy5Gc8zPhUY6vbu2X2n26bl/OAaLKnGt7ZxmF
        g6CUeXQW+TpawR9RDRfAbdtpwxBkvVg=
X-Google-Smtp-Source: ABdhPJyVkLmUr17VEaldRuoWIULWyB4JMoZBR9PQdJIzlS7xP4QP3QFJc+SESBRse1otB7ZnQhdOGg==
X-Received: by 2002:a63:230c:: with SMTP id j12mr3191176pgj.382.1626164191927;
        Tue, 13 Jul 2021 01:16:31 -0700 (PDT)
Received: from [10.1.1.25] (222-152-189-37-fibre.sparkbb.co.nz. [222.152.189.37])
        by smtp.gmail.com with ESMTPSA id n22sm18807860pff.57.2021.07.13.01.16.27
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 13 Jul 2021 01:16:31 -0700 (PDT)
Subject: Re: RFC: remove set_fs for m68k
To:     Christoph Hellwig <hch@lst.de>
References: <20210709070132.3387689-1-hch@lst.de>
 <039e2f42-b9bc-d8ce-393a-c0896439f784@gmail.com> <87fswjomtm.fsf@igel.home>
 <969718aa-92d4-e77b-0630-f9da6c809178@gmail.com>
 <20210713054134.GA5880@lst.de>
Cc:     Andreas Schwab <schwab@linux-m68k.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        linux-m68k@lists.linux-m68k.org
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <90e30f50-f062-ac8d-68e7-1250c886d0e1@gmail.com>
Date:   Tue, 13 Jul 2021 20:16:25 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <20210713054134.GA5880@lst.de>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Christoph,

Am 13.07.2021 um 17:41 schrieb Christoph Hellwig:
> On Tue, Jul 13, 2021 at 07:12:45AM +1200, Michael Schmitz wrote:
>> That confirms my guess - can we rely on the call trace in that case? And
>> how does overwriting kernel code at that address tee up with the kernel
>> still happily chugging along?
>
> So if you remove the WARN_ON everything keeps running just fine?  I

I'll try that next. It certainly ran fine when I tried your earlier 
version which still had the __constant_copy_from_user() (but modified to 
use __get_user_asm() for the 1, 2 and 4 byte cases). That doesn't prove 
much though - I may not have hit the exact same memory pressure (not 
sure how often savelogs runs on that system, and I haven't checked how 
much the kernel size differs between the two versions).

Anyway, I'll try my previous version again, and I'll try with the 
WARN_ON removed, but that'll take a few days (did I mention this 030 is 
clocked at 16 MHz only?).

> wonder if in_interrupt somehow is not exact in m68k.  Or we actually
> call it from an interrupt.  Let me try to unwind the various call
> chains.

I suspect it may get called from an interrupt - not sure what interrupt 
handler would call vm_map_ram(), or if that even is allowed though. 
Might happen during a softirq, which is covered by in_interrupt as well ...

Cheers,

	Michael





