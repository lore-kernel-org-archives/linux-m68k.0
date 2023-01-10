Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 208E4C46467
	for <linux-m68k@archiver.kernel.org>; Tue, 10 Jan 2023 20:33:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231523AbjAJUdK (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 10 Jan 2023 15:33:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235452AbjAJUc1 (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Tue, 10 Jan 2023 15:32:27 -0500
X-Greylist: delayed 211 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 10 Jan 2023 12:31:01 PST
Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 986872BED
        for <linux-m68k@vger.kernel.org>; Tue, 10 Jan 2023 12:30:59 -0800 (PST)
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.95)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1pFLDS-001PeE-Oa; Tue, 10 Jan 2023 21:27:26 +0100
Received: from dynamic-077-013-072-015.77.13.pool.telefonica.de ([77.13.72.15] helo=[192.168.1.11])
          by inpost2.zedat.fu-berlin.de (Exim 4.95)
          with esmtpsa (TLS1.3)
          tls TLS_AES_128_GCM_SHA256
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1pFLDS-002Cw2-IW; Tue, 10 Jan 2023 21:27:26 +0100
Message-ID: <9bd0c5b6-7407-197e-4114-f73b32b6722e@physik.fu-berlin.de>
Date:   Tue, 10 Jan 2023 21:27:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v12 0/3] Add kernel seccomp support for m68k
Content-Language: en-US
To:     Michael Schmitz <schmitzmic@gmail.com>
References: <20230110202243.29383-1-schmitzmic@gmail.com>
Cc:     linux-m68k@vger.kernel.org, geert@linux-m68k.org
From:   John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
In-Reply-To: <20230110202243.29383-1-schmitzmic@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 77.13.72.15
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Michael!

On 1/10/23 21:22, Michael Schmitz wrote:
> Merge conflict markers left over in v11 removed, version
> number bumped in order to appease patch management tools.

Thanks a lot! I will build myself an m68k kernel now for the QEMU
virt target and try to build libseccomp and run its testsuite.

I will hopefully report back later this week.

Adrian

-- 
  .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
   `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

