Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62528C61DA4
	for <linux-m68k@archiver.kernel.org>; Mon, 30 Jan 2023 10:18:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236314AbjA3KSQ (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 30 Jan 2023 05:18:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236351AbjA3KSH (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 30 Jan 2023 05:18:07 -0500
Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98EF5196AA
        for <linux-m68k@lists.linux-m68k.org>; Mon, 30 Jan 2023 02:18:02 -0800 (PST)
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.95)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1pMREd-000bYP-Ts; Mon, 30 Jan 2023 11:17:59 +0100
Received: from p57bd9464.dip0.t-ipconnect.de ([87.189.148.100] helo=[192.168.178.81])
          by inpost2.zedat.fu-berlin.de (Exim 4.95)
          with esmtpsa (TLS1.3)
          tls TLS_AES_128_GCM_SHA256
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1pMREd-000Y8d-Nf; Mon, 30 Jan 2023 11:17:59 +0100
Message-ID: <e94e6e1d-f0ac-d1bc-bee3-70486d86eec5@physik.fu-berlin.de>
Date:   Mon, 30 Jan 2023 11:17:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: Work on adding TLS support to LLVM on m68k
Content-Language: en-US
To:     Finn Thain <fthain@linux-m68k.org>
Cc:     linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Debian m68k <debian-68k@lists.debian.org>, port-m68k@netbsd.org
References: <1dfde9d2-250f-dd1b-1775-76917f4b2166@physik.fu-berlin.de>
 <30d71f0f-6628-4a67-2de3-eb84b25b2836@linux-m68k.org>
From:   John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
In-Reply-To: <30d71f0f-6628-4a67-2de3-eb84b25b2836@linux-m68k.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 87.189.148.100
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Finn!

On 1/29/23 01:15, Finn Thain wrote:
> The developers of the TLS/NPTL support for m68k/coldfire were working for
> Freescale and Codesourcery at the time...
> 
> https://lists.debian.org/debian-68k/2008/02/msg00212.html
> https://lists.debian.org/debian-68k/2007/11/msg00071.html

Thanks, these links are very useful, especially the one describing the ABI.

I have copied the ABI description into the Github issue, crediting the source:

> https://github.com/llvm/llvm-project/issues/60354

> The toolchain mailing lists at sourceware.org might be a good place to
> seek technical information about the implementation. Or you could try
> sending a question to the old e-mail addresses of the people who sent the
> patches e.g.
> 
> https://git.kernel.org/torvalds/c/9674cdc74d63

I have sent an email to both Joseph and Maxim, but I haven't got any reply yet.

Adrian

-- 
  .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
   `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

