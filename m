Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F3F6C54EBD
	for <linux-m68k@archiver.kernel.org>; Mon,  9 Jan 2023 12:37:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233475AbjAIMhM (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 9 Jan 2023 07:37:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233434AbjAIMhL (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 9 Jan 2023 07:37:11 -0500
Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2DB39FCF
        for <linux-m68k@lists.linux-m68k.org>; Mon,  9 Jan 2023 04:37:09 -0800 (PST)
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.95)
          for linux-m68k@lists.linux-m68k.org with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1pErOl-003xTv-J5; Mon, 09 Jan 2023 13:37:07 +0100
Received: from dynamic-078-055-158-214.78.55.pool.telefonica.de ([78.55.158.214] helo=[192.168.1.11])
          by inpost2.zedat.fu-berlin.de (Exim 4.95)
          for linux-m68k@lists.linux-m68k.org with esmtpsa (TLS1.3)
          tls TLS_AES_128_GCM_SHA256
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1pErOl-000wiR-DC; Mon, 09 Jan 2023 13:37:07 +0100
Message-ID: <0fbcfa49-c77f-f67d-44ad-f8430274ca9d@physik.fu-berlin.de>
Date:   Mon, 9 Jan 2023 13:37:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
To:     linux-m68k <linux-m68k@lists.linux-m68k.org>
From:   John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: Current status of seccomp support in the m68k kernel?
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 78.55.158.214
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi!

I have finally found some time again to work on the userland m68k support for
seccomp and I was wondering what the current state of the kernel support is?

If I remember correctly there were some patches posted that needed testing?

Adrian

-- 
  .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
   `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
