Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6BBEC6FA8F
	for <linux-m68k@archiver.kernel.org>; Tue, 29 Aug 2023 09:03:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234380AbjH2JCk (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 29 Aug 2023 05:02:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234376AbjH2JCY (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Tue, 29 Aug 2023 05:02:24 -0400
X-Greylist: delayed 592 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 29 Aug 2023 02:02:12 PDT
Received: from welho-filter2.welho.com (welho-filter2b.welho.com [83.102.41.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC7EE107
        for <linux-m68k@vger.kernel.org>; Tue, 29 Aug 2023 02:02:12 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by welho-filter2.welho.com (Postfix) with ESMTP id 24A4C43D62;
        Tue, 29 Aug 2023 11:52:19 +0300 (EEST)
X-Virus-Scanned: Debian amavisd-new at pp.htv.fi
Received: from welho-smtp1.welho.com ([IPv6:::ffff:83.102.41.84])
        by localhost (welho-filter2.welho.com [::ffff:83.102.41.24]) (amavisd-new, port 10024)
        with ESMTP id UBd3gwth2BFN; Tue, 29 Aug 2023 11:52:18 +0300 (EEST)
Received: from [192.168.0.20] (89-27-78-73.bb.dnainternet.fi [89.27.78.73])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by welho-smtp1.welho.com (Postfix) with ESMTPSA id 83AC67A;
        Tue, 29 Aug 2023 11:52:14 +0300 (EEST)
Message-ID: <e32da2e7-3445-3fce-eb8f-242bdec0df1b@helsinkinet.fi>
Date:   Tue, 29 Aug 2023 11:52:14 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: Tuple and changes for m68k with -malign-int
To:     Finn Thain <fthain@linux-m68k.org>
Cc:     libc-help@sourceware.org, debian-68k <debian-68k@lists.debian.org>,
        linux-m68k <linux-m68k@vger.kernel.org>
References: <e9035006d50933fb02727fa373629cc821784f6c.camel@aura-online.co.uk>
 <10cbcb8a65639f88e7eeb503fd02df172bc46a07.camel@physik.fu-berlin.de>
 <80a52487-3105-ed5b-a1eb-ec1a0689ef21@linux-m68k.org>
 <4b4fe9c56dfdb8ec74150413cfc211d70243eb7e.camel@physik.fu-berlin.de>
 <0891ec11-bed1-9120-79d5-4436dc9aee32@linux-m68k.org>
Content-Language: en-US
From:   Eero Tamminen <oak@helsinkinet.fi>
In-Reply-To: <0891ec11-bed1-9120-79d5-4436dc9aee32@linux-m68k.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi,

On 29.8.2023 4.14, Finn Thain wrote:
> On Mon, 28 Aug 2023, John Paul Adrian Glaubitz wrote:
>> And since we have to break the ABI anyway to be able to use 64-bit
>> time_t
> 
> If you're worried about Y2038, aren't you jumping the gun? I reckon we
> have about 10 years in which to figure out what a better m68k ABI should
> look like.

Debian is discussing LFS + time_t transition for the next release, for 
all architectures.  They are related, and if one needs to break / 
transition ABI, doing it once is better than doing it twice...

LWN has summary of the discussion: https://lwn.net/Articles/938149/


	- Eero
