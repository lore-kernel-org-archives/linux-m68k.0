Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4894BC77B72
	for <linux-m68k@archiver.kernel.org>; Thu, 20 Apr 2023 07:40:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234068AbjDTHk3 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 20 Apr 2023 03:40:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234122AbjDTHk1 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 20 Apr 2023 03:40:27 -0400
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BBEE4202
        for <linux-m68k@lists.linux-m68k.org>; Thu, 20 Apr 2023 00:40:24 -0700 (PDT)
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-63d2ba63dddso630317b3a.2
        for <linux-m68k@lists.linux-m68k.org>; Thu, 20 Apr 2023 00:40:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681976423; x=1684568423;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yigQcCyYo5bfWaheVBkkNAwwz1QVaiyPfxi/HUGD75I=;
        b=JaDwXNBTGP2seH5fjo9MeEd/yLBaHxj55XpZe09YsHYBBpRYH48n7ItyukhaYmW+8Y
         2rwiiFiD+ufL4rSEgt/ldZvRGL5wrG5/Cjg87LETBp+jEtpVcXesQ2wQFzWqRcJ3m5Lw
         IE/YmHnIJqWx6lkgRoTfG6P7gOun7qL7BERNqZnQen9V9l34XbNuyEV6rS+YjddyJBhc
         LIHkdjng4OS/54KMmVcrL14gx1y/VGBz88yvtXpyWH8XweQMJ2mHx1nVB20m8NN54gw9
         scXrBvCltY6AI26Q6HaoL/xegngRByvRBM1KwuTKdJLdyUQxmtfuahYsoMk4oYcicn1r
         pUSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681976423; x=1684568423;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yigQcCyYo5bfWaheVBkkNAwwz1QVaiyPfxi/HUGD75I=;
        b=DzFdiyY7lqMa48+PaK/JFplHzisUK02VcGDw5ecocA4LqlPENnUO5HOj2c/r0jYIxE
         AgYvAsw8EVx3wlbbjkppfwdOIH+jW3TNoVDjBsTV/DSP5IYHNmowLDISjWZ/oUoXEXot
         IgFm7FUQyJCSCOsNKINvzWBq8qI8t4Qo6E1ncajOqzPMFAQUxyyzgXm0cebfPW7m1R8R
         GW7Sk/4gt2px7m+l/6edG+Z9uE3Xo730+TuIZTWnq6T0Sd9y9nH8WU81KwMk28c1L6Gz
         v6izEPBZ8Grwgc0l4vulqVe5pOO30Z2Ibfw1wA5NJ9Ax7J02H1RZwo2IaEGQJcw/eYk6
         IkkA==
X-Gm-Message-State: AAQBX9fvRxMpmZqGaup8Hh3hzeL2BVGKhVWOE3aBirEgRpwjZUm5ojtD
        jlFhrXmcLOggamFlYyptSe/pyQ1kC0s=
X-Google-Smtp-Source: AKy350ZaprsGW0XpGSaox0KC5mpq1Ceao9XzAAN6iDA1Ll2qu37tcD1N1XAqZNcxMmnc0AbGBFghzw==
X-Received: by 2002:a05:6a21:33a7:b0:f2:1577:2ea0 with SMTP id yy39-20020a056a2133a700b000f215772ea0mr11269pzb.44.1681976423577;
        Thu, 20 Apr 2023 00:40:23 -0700 (PDT)
Received: from [10.1.1.24] (222-152-172-8-fibre.sparkbb.co.nz. [222.152.172.8])
        by smtp.gmail.com with ESMTPSA id o20-20020a056a0015d400b0063b6bd2216dsm594263pfu.187.2023.04.20.00.40.20
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 20 Apr 2023 00:40:23 -0700 (PDT)
Subject: Re: reliable reproducer, was Re: core dump analysis
To:     Finn Thain <fthain@linux-m68k.org>
References: <4a9c1d0d-07aa-792e-921f-237d5a30fc44.ref@yahoo.com>
 <1725f7c1-2084-a404-653d-9e9f8bbe961c@linux-m68k.org>
 <e10b8e06-6a36-5c83-89da-bec8fd7d3ed9@linux-m68k.org>
 <19d1f2ac-67dd-5415-b64a-1e1b4451f01e@linux-m68k.org>
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
 <be49e4a9-298b-a748-399a-9a075ceca72a@linux-m68k.org>
Cc:     debian-68k@lists.debian.org, linux-m68k@lists.linux-m68k.org
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <576b7614-00e2-7ad2-6769-c2d231d4729b@gmail.com>
Date:   Thu, 20 Apr 2023 19:40:18 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <be49e4a9-298b-a748-399a-9a075ceca72a@linux-m68k.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Finn,

Am 20.04.2023 um 18:04 schrieb Finn Thain:
> On Wed, 19 Apr 2023, I wrote:
>
>> Oddly, the program never detects any stack corruption when run on the
>> QEMU '040.
>>
>
> I tested a Motorola '040 and got the same result.

OK, that would mean the bus error was just the most reliable way to get 
do_signal_return run after child process termination, and the signal 
delivery itself may be responsible for stack corruption.

Cheers,

	Michael
