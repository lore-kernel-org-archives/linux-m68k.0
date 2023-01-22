Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD152C54E94
	for <linux-m68k@archiver.kernel.org>; Sun, 22 Jan 2023 15:23:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231352AbjAVPXF (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 22 Jan 2023 10:23:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231356AbjAVPW7 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sun, 22 Jan 2023 10:22:59 -0500
Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38FD86A5E
        for <linux-m68k@lists.linux-m68k.org>; Sun, 22 Jan 2023 07:22:57 -0800 (PST)
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.95)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1pJcBL-004Amu-P1; Sun, 22 Jan 2023 16:22:55 +0100
Received: from p57ae5361.dip0.t-ipconnect.de ([87.174.83.97] helo=[192.168.178.35])
          by inpost2.zedat.fu-berlin.de (Exim 4.95)
          with esmtpsa (TLS1.3)
          tls TLS_AES_128_GCM_SHA256
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1pJcBL-0006Ex-IP; Sun, 22 Jan 2023 16:22:55 +0100
Message-ID: <730dab34-7638-9bb2-e3a6-89492b782995@physik.fu-berlin.de>
Date:   Sun, 22 Jan 2023 16:22:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: LLVM buildbot for m68k backend has been moved to production
Content-Language: en-US
To:     noloader@gmail.com
Cc:     linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Debian m68k <debian-68k@lists.debian.org>,
        Min-Yih Hsu <minyihh@uci.edu>
References: <40e8c60c-396d-0cde-d702-ab44f53bd26f@physik.fu-berlin.de>
 <CAH8yC8=gjpi6+weBkmfGaJtPXBRcLUh78mDcnYMiVaF9ULGHcw@mail.gmail.com>
From:   John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
In-Reply-To: <CAH8yC8=gjpi6+weBkmfGaJtPXBRcLUh78mDcnYMiVaF9ULGHcw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 87.174.83.97
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hello!

On 1/20/23 15:17, Jeffrey Walton wrote:
>> For a number of weeks, the LLVM buildbot which cross-compiles the M68K backend
>> has been "green", i.e. builds and testsuite have passed without problems [1].
>>
>> As a consequence, I have asked the admin of the LLVM buildbot master server to
>> move our buildbot from staging to production. After receiving approval yesterday,
>> I moved the buildbot to production now [2].
>>
>> Another step forward in maturing the M68K backend in LLVM. More news on the backend
>> coming soon, I'm preparing a longer report.
> 
> Good job, Adrian.

Thanks for the praise which, of course, should be mainly given to Min and Sheng who
are maintaining the backend in LLVM.

Since that work requires a lot of time and effort, I am inviting everyone to support
their work through Open Collective [1] or Patreon [2]. It's well worth the money if
you spend $10 or $20 a month.

Adrian

> [1] https://opencollective.com/m68k-llvm-dev
> [2] https://www.patreon.com/m68k_llvm

-- 
  .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
   `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

