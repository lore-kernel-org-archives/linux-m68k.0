Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EAB7C32793
	for <linux-m68k@archiver.kernel.org>; Wed, 18 Jan 2023 09:13:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229513AbjARJNk (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 18 Jan 2023 04:13:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229570AbjARJMe (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Wed, 18 Jan 2023 04:12:34 -0500
Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78BDB6F307
        for <linux-m68k@vger.kernel.org>; Wed, 18 Jan 2023 00:30:28 -0800 (PST)
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.95)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1pI3py-000bkt-Id; Wed, 18 Jan 2023 09:30:26 +0100
Received: from p57bd9464.dip0.t-ipconnect.de ([87.189.148.100] helo=[192.168.178.81])
          by inpost2.zedat.fu-berlin.de (Exim 4.95)
          with esmtpsa (TLS1.3)
          tls TLS_AES_128_GCM_SHA256
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1pI3py-001BU6-CP; Wed, 18 Jan 2023 09:30:26 +0100
Message-ID: <a3addb76-d35a-f74d-f939-686699608066@physik.fu-berlin.de>
Date:   Wed, 18 Jan 2023 09:30:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v13 0/3] Add kernel seccomp support for m68k
To:     Michael Schmitz <schmitzmic@gmail.com>
Cc:     linux-m68k@vger.kernel.org, geert@linux-m68k.org,
        Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>
References: <20230112035529.13521-1-schmitzmic@gmail.com>
 <0687610a-0efd-51f5-110d-fad0de113556@physik.fu-berlin.de>
 <38518fa1-a584-6e9e-5160-a6922730e8f5@gmail.com>
 <6eab0d17-8928-212b-740c-6db249f79838@physik.fu-berlin.de>
 <10371c02-c54b-fa3e-2729-12d524685652@gmail.com>
 <e5e6d22a-fafc-9535-4682-a957286ce38d@physik.fu-berlin.de>
 <739413f9-0425-59d9-b6a5-fe225f56cf78@gmail.com>
Content-Language: en-US
From:   John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
In-Reply-To: <739413f9-0425-59d9-b6a5-fe225f56cf78@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 87.189.148.100
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Michael

On 1/18/23 00:25, Michael Schmitz wrote:
> Look at include/seccomp-syscalls.h - I'd add the missing syscalls after this one:
> 
> #define __PNR_memfd_secret                      -10244
> 
> (pseudo syscall numbers for the other architectures)
> 
> plus appropriate boilerplate such as this:
> 
> #ifdef __NR_memfd_secret
> #define __SNR_memfd_secret              __NR_memfd_secret
> #else
> #define __SNR_memfd_secret              __PNR_memfd_secret
> #endif
> 
> (actual syscall numbers from our arch/m68k/include/uapi/asm/unistd-32.h used).
> 
> Just looked at the source, didn't try to build anything so I may be missing something crucial here...

Good catch, thank you! I added the missing definitions and it builds fine now.

Will test against a kernel with your patches now.

Adrian

-- 
  .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
   `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

