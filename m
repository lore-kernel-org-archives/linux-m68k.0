Return-Path: <SRS0=PEg3=DQ=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8762DC433E7
	for <linux-m68k@archiver.kernel.org>; Fri,  9 Oct 2020 20:56:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 486DD22261
	for <linux-m68k@archiver.kernel.org>; Fri,  9 Oct 2020 20:56:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390960AbgJIU4n (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 9 Oct 2020 16:56:43 -0400
Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66]:51275 "EHLO
        outpost1.zedat.fu-berlin.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2390951AbgJIU4n (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 9 Oct 2020 16:56:43 -0400
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.94)
          with esmtps (TLS1.2)
          tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1kQzRR-003y9t-AO; Fri, 09 Oct 2020 22:56:41 +0200
Received: from p5b13af0b.dip0.t-ipconnect.de ([91.19.175.11] helo=[192.168.178.139])
          by inpost2.zedat.fu-berlin.de (Exim 4.94)
          with esmtpsa (TLS1.2)
          tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1kQzRR-003I8X-26; Fri, 09 Oct 2020 22:56:41 +0200
Subject: Re: Upstreaming the CD-TV CD-ROM driver
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Matthew Garrett <mjg59@google.com>
References: <a75889ab-4d84-aec4-8f01-7d42e7e015c9@physik.fu-berlin.de>
 <CAMuHMdWjRpfkQVxTvLvA=+dV=L2-TmtHkVxJYB2W2u0GKvr0SA@mail.gmail.com>
From:   John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Message-ID: <3d4314d3-6537-c1b3-0b13-62dc319dc919@physik.fu-berlin.de>
Date:   Fri, 9 Oct 2020 22:56:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <CAMuHMdWjRpfkQVxTvLvA=+dV=L2-TmtHkVxJYB2W2u0GKvr0SA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 91.19.175.11
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On 10/9/20 10:49 PM, Geert Uytterhoeven wrote:
> On Fri, Oct 9, 2020 at 9:58 PM John Paul Adrian Glaubitz
> <glaubitz@physik.fu-berlin.de> wrote:
>> I wanted to try out Matthew Garrett's driver for the Amiga CD-TV CD-ROM drive [1] today
>> but it turns out that a simple rebase won't do it since the code in arch/m68k/amiga/dmac.c
>> is no longer there.
>>
>> Can anyone point me to where that code has been moved to?
> 
> Upstream never had arch/m68k/amiga/dmac.c.
> It was added in the parent commits of [1], by Matthew.

Okay, that actually explains why I couldn't find it in the Git history ;-).

Thanks for the pointer.

Adrian

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer - glaubitz@debian.org
`. `'   Freie Universitaet Berlin - glaubitz@physik.fu-berlin.de
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
