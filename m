Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CE70C7618E
	for <linux-m68k@archiver.kernel.org>; Fri, 21 Apr 2023 09:18:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230417AbjDUJSV (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 21 Apr 2023 05:18:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230492AbjDUJSU (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 21 Apr 2023 05:18:20 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60AD2526B
        for <linux-m68k@lists.linux-m68k.org>; Fri, 21 Apr 2023 02:18:15 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-63b73203e0aso12884740b3a.1
        for <linux-m68k@lists.linux-m68k.org>; Fri, 21 Apr 2023 02:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682068694; x=1684660694;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uTqi/NHn/phUmw8tZxlsBPtGHvPzGZ38R4I4XVLubhQ=;
        b=M4CiRCW0Z+fXwxBi46nqSqm/dcQtlpteCHggAHikGaJ5bX6WlWnEGoJ02DQkGFjVO2
         OAwct5RUzEHFSkyrElUkntf9mWiSEEWjt+jLK8CTBOmfmavtqg/gLjG3U6WEq08pcvnX
         UhrpaepFbTS8vdNoj/2wWQdGqTIQpdwheMeN7fnw0+SVGG9IPqf58EqIH+qbcXqUkvA/
         YFzcNSQKdRnPL95eZKJZ4+j4gFHBBQzT/Mdm+sENnUB5M13+5uwlSmSfz8M9JFVKrh7/
         mR+U6YlNRPuYAxevsaaC3WFluGgTsMGAgV1cwB+/qHeS35LQ1eFQ34Nr1XYGCIKyqDBn
         1xyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682068694; x=1684660694;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uTqi/NHn/phUmw8tZxlsBPtGHvPzGZ38R4I4XVLubhQ=;
        b=FMZ04e2ES9p6Xb5rp//yaY6CirmHiNeHfy3ta8K4+ain567HsgVEVZxd4wgL0c72is
         KnDzl2aa4S5gIUt8NoE4/XmjW1RsTtreNOuPiZvdxHbO6fdGZ/I5ms7jlN24P8jblzoP
         HaNaJvBw8cX/Osj0lRZB/3TC0ZpY7Tc0ke/sWHMf9TQPAsHarY7fms8/50fcZenpcu+9
         KRYog1mux4Fpe7Dubif5J6DC3Rv7NZEJDg2s+T+XoUuC1yUP2bJZGjlqUC2J57qLQkA0
         WdZGiUC5/tRDuIcNlrBnectniMg5CVCtsMREuwUtHeDhgFAZoarXiSphnAesewICjAFD
         wXqA==
X-Gm-Message-State: AAQBX9dfeTdWdnZZERFgqQlUx39GY4HeyawIVpovdHc3+1Gx9sfIUD+Z
        Vb68cwQ3nsMxZIQ8y6vbV/k8+csPPyc=
X-Google-Smtp-Source: AKy350bcZj0fAd8UnVv10mT9NIfl16wdYbUqmkNqCpk4aTEYBemZ12G6dWZDGcRMn9UC0mOUyGmHOg==
X-Received: by 2002:a17:902:ea0d:b0:1a1:e112:461c with SMTP id s13-20020a170902ea0d00b001a1e112461cmr10633468plg.30.1682068694113;
        Fri, 21 Apr 2023 02:18:14 -0700 (PDT)
Received: from [10.1.1.24] (222-152-172-8-fibre.sparkbb.co.nz. [222.152.172.8])
        by smtp.gmail.com with ESMTPSA id s1-20020a170902988100b001a1fe40a8dasm2336012plp.262.2023.04.21.02.18.10
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 21 Apr 2023 02:18:13 -0700 (PDT)
Subject: Re: reliable reproducer, was Re: core dump analysis
To:     Finn Thain <fthain@linux-m68k.org>
References: <4a9c1d0d-07aa-792e-921f-237d5a30fc44.ref@yahoo.com>
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
 <d1599d1b-b47e-b8c7-6c33-5077c3301293@linux-m68k.org>
 <71af7b52-a1d4-581c-d5af-afce6991c48d@gmail.com>
 <a5036039-9758-f304-5659-49588a9f5165@linux-m68k.org>
 <7ea095ba-7df1-1ffe-e87d-12d46ebe72f6@gmail.com>
 <f890dd95-6bb9-8012-c49e-774fae71200d@gmail.com>
 <2fdc2819-526a-756f-19d0-ac1147f85b63@linux-m68k.org>
Cc:     debian-68k@lists.debian.org, linux-m68k@lists.linux-m68k.org
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <868b5214-fa13-dcf7-a671-9843169eea06@gmail.com>
Date:   Fri, 21 Apr 2023 21:18:08 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <2fdc2819-526a-756f-19d0-ac1147f85b63@linux-m68k.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Finn,

Am 21.04.2023 um 20:30 schrieb Finn Thain:
> On Fri, 21 Apr 2023, Michael Schmitz wrote:
>
>>
>> How often did a page fault happen when executing moveml, in other
>> programs?
>>
>
> The printk() I placed in bus_error030() was conditional on the short word
> at the instruction pointer. It didn't consider all forms of movem, just
> 0x48e7 which is the start of "moveml X,%sp@-". This matched page faults in
> many of the programs that executed while booting to single user mode. I
> suppose most of them don't use signal handlers in the same way dash does
> otherwise they would probably be unreliable too.

OK; so too much noise unless filtered on the command name...

I'll try first to get register state at the time of signal delivery from 
the sa_sigaction handler's ucontext parameter to see where the signal 
stack falls in relation to the call frames from your rec() function on 
the stack (and what the register contents were). Hope that won't be too 
noisy ... Then see how that changes with bus error handling forcing 
signal delivery.

Shame we don't have similar code to find the MMU descriptors on 040.

Cheers,

	Michael


