Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CF1AC05027
	for <linux-m68k@archiver.kernel.org>; Fri, 20 Jan 2023 10:45:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229585AbjATKpo (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 20 Jan 2023 05:45:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229577AbjATKpo (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Fri, 20 Jan 2023 05:45:44 -0500
Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 220E894CB9
        for <linux-m68k@vger.kernel.org>; Fri, 20 Jan 2023 02:45:43 -0800 (PST)
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.95)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1pIotx-003ZqW-BE; Fri, 20 Jan 2023 11:45:41 +0100
Received: from p57bd9464.dip0.t-ipconnect.de ([87.189.148.100] helo=[192.168.178.81])
          by inpost2.zedat.fu-berlin.de (Exim 4.95)
          with esmtpsa (TLS1.3)
          tls TLS_AES_128_GCM_SHA256
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1pIotx-001A85-4t; Fri, 20 Jan 2023 11:45:41 +0100
Message-ID: <42b774b6-fc52-5c8d-bdaa-2a6c07e6af9b@physik.fu-berlin.de>
Date:   Fri, 20 Jan 2023 11:45:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v13 0/3] Add kernel seccomp support for m68k
Content-Language: en-US
From:   John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To:     Michael Schmitz <schmitzmic@gmail.com>
Cc:     linux-m68k@vger.kernel.org, geert@linux-m68k.org,
        Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>,
        Andreas Schwab <schwab@linux-m68k.org>,
        Al Viro <viro@zeniv.linux.org.uk>
References: <20230112035529.13521-1-schmitzmic@gmail.com>
 <0687610a-0efd-51f5-110d-fad0de113556@physik.fu-berlin.de>
 <38518fa1-a584-6e9e-5160-a6922730e8f5@gmail.com>
 <6eab0d17-8928-212b-740c-6db249f79838@physik.fu-berlin.de>
 <10371c02-c54b-fa3e-2729-12d524685652@gmail.com>
 <e5e6d22a-fafc-9535-4682-a957286ce38d@physik.fu-berlin.de>
 <739413f9-0425-59d9-b6a5-fe225f56cf78@gmail.com>
 <a3addb76-d35a-f74d-f939-686699608066@physik.fu-berlin.de>
 <f2ce2438-8fe1-145e-64d0-9c754cee8913@physik.fu-berlin.de>
 <2b3a641c-003f-6485-a1c1-0e0fdd45d23b@gmail.com>
 <6ab60cd7-66c1-67e7-b82b-a7bb1b2218b3@physik.fu-berlin.de>
In-Reply-To: <6ab60cd7-66c1-67e7-b82b-a7bb1b2218b3@physik.fu-berlin.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 87.189.148.100
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi!

On 1/19/23 10:18, John Paul Adrian Glaubitz wrote:
>> Now that we have m68k support for libseccomp, getting this merged is no longer purely academic.
>>
>> Both Al Viro and Andreas Schwab had provided feedback and improvements - could you perhaps review
>> the latest version again (v13) if that's what is holding this up?
> 
> @Andreas: Please use my Github branch if you want to test libseccomp as well.

libseccomp upstream is now waiting for the kernel patches to be merged, see [1].

Adrian

> [1] https://github.com/seccomp/libseccomp/pull/397

-- 
  .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
   `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

