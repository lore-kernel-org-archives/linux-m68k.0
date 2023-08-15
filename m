Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52E4BC0015E
	for <linux-m68k@archiver.kernel.org>; Tue, 15 Aug 2023 11:07:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235397AbjHOLGj (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 15 Aug 2023 07:06:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236708AbjHOLG3 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 15 Aug 2023 07:06:29 -0400
Received: from mail.sowerbutts.com (mail.sowerbutts.com [IPv6:2001:8b0:3b1:dead::100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F4E81BCD
        for <linux-m68k@lists.linux-m68k.org>; Tue, 15 Aug 2023 04:05:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sowerbutts.com; s=igor; h=In-Reply-To:Content-Type:MIME-Version:References:
        Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=910tOkqPGYx9Ov2mIfsmDj9Ocxdz2cTQ8plT+DzuI/k=; b=pWj2Zfk5W2xS6YxA70hWzNJZZM
        5RkOmuK3CMMHQE8Fklqfczw9P6/UH0qFI2K2Mfk8Vbm+PyZ43bMaSRxzOgL1lOxtOAEDP9GrMn/C4
        9h+KXZ2wTS4scENfvnk42r5wIIjlMNsxciJHdWJ4Jy/CfaKXIpWI0rdZCvegLg9ZYIwh5IhKM/s1/
        VoJw5zeeAVyFrG5oJ7cPE4lJN0vYJOSNnKKOW5ZXVWW2hJcCYSA29DNVLaYiBfUz/U0wq6J1UuvLz
        1WdrxkUXKFGYVCg8hFpHNtXcPnn3PkfbV3rCPOBuEPCoMlqgOFKRCprM3qwTgEJhYnKc8alhlTTEO
        Ut1185og==;
Received: from [2001:8b0:3b1:cafe:2292:e7dd:dea3:4ff6] (helo=sowerbutts.com)
        by mail.sowerbutts.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.96)
        (envelope-from <will@sowerbutts.com>)
        id 1qVrqq-000PPL-1D;
        Tue, 15 Aug 2023 12:04:40 +0100
Date:   Tue, 15 Aug 2023 12:04:40 +0100
From:   William R Sowerbutts <will@sowerbutts.com>
To:     Michael Schmitz <schmitzmic@gmail.com>
Cc:     Richard Z <rz@linux-m68k.org>, Finn Thain <fthain@linux-m68k.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
Subject: Re: Linux 6.4.4 on m68k - Q40 - pata_falcon causes oops at boot time
Message-ID: <ZNtbyOJTcDe5NySL@sowerbutts.com>
References: <521776cc-a11e-0a3a-b44d-fc051f6ee2ea@linux-m68k.org>
 <624c5629-e337-46ba-c8ac-411fe19f2f46@gmail.com>
 <81706cdc-2a7a-f383-881a-7313fefbb938@linux-m68k.org>
 <68187ca1-1d4f-92f9-f6c7-476caaa24df0@gmail.com>
 <275c3e98-a8e3-5d2a-13fa-db79ab9d6719@linux-m68k.org>
 <ZNlYFCVubNgzmUfc@sowerbutts.com>
 <c8fd631b-226c-4c60-884b-2ffa6437d03f@gmail.com>
 <ZNoNlC5fhztMFBAk@sowerbutts.com>
 <2B76FA74-7F6E-4790-A9BF-5308B682A3ED@linux-m68k.org>
 <dd9a6276-e2bd-d7cb-9ea4-45a40fe4fdf4@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dd9a6276-e2bd-d7cb-9ea4-45a40fe4fdf4@gmail.com>
X-URL:  http://sowerbutts.com/
X-Hatstand: Voltron
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

>> Also, I would like to see data on the speed impact of the byte swapping, 
>> making the old hardware even 5% slower isn't something I would be 
>> enthusiastic about and my guess is it would more than that.
>Well, the inner loop of raw_insw() uses one movew whereas raw_insw_swapw()
>uses two movew and one rolw instruction. Reading or writing huge files that
>are contiguous on disk will show an impact. Random access of small files does
>have higher overhead both in waiting for disk latency and buffer
>cache/filesystem overhead. I'm sure it can be measured at least for the first
>case.

I've run some tests on my Q40 (40MHz 68040), using 6.4.10 plus Michael's RFC2 
patch. I added a little tweak to pata_falcon_data_xfer() to force byte 
swapping for one specific device only (this allowed me to avoid byte swapping 
the slave IDE drive, which holds my root filesystem).

        if(MACH_IS_Q40 && qc->dev->devno == 0)
            swap = 0; // or 1, for the second test

I booted up the kernel and then timed reading the entire contents of a 2GB 
"InnoDisk Corp. iCF 4000" compact flash card using dd.

With no CPU byteswapping (legacy byte ordering) -- 1308.72 seconds:

# date; time dd if=/dev/sda bs=256k of=/dev/null; date
Tue Aug 15 11:07:19 UTC 2023
7999+1 records in
7999+1 records out
0.40user 1236.33system 21:48.72elapsed 94%CPU (0avgtext+0avgdata 1088maxresident)k
0inputs+0outputs (0major+115minor)pagefaults 0swaps
Tue Aug 15 11:29:08 UTC 2023

With CPU byteswapping (compatible byte ordering) -- 1426.46 seconds:

# date; time dd if=/dev/sda bs=256k of=/dev/null; date
Tue Aug 15 11:30:52 UTC 2023
7999+1 records in
7999+1 records out
0.42user 1348.82system 23:46.46elapsed 94%CPU (0avgtext+0avgdata 1088maxresident)k
0inputs+0outputs (0major+115minor)pagefaults 0swaps
Tue Aug 15 11:54:39 UTC 2023

So it is nearly 9% slower for very large data transfers.

Thanks

Will

_________________________________________________________________________
William R Sowerbutts                                  will@sowerbutts.com
"Carpe post meridiem"                               http://sowerbutts.com
         main(){char*s=">#=0> ^#X@#@^7=",c=0,m;for(;c<15;c++)for
         (m=-1;m<7;putchar(m++/6&c%3/2?10:s[c]-31&1<<m?42:32));}  

