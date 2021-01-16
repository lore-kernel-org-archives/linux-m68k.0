Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4337C433E0
	for <linux-m68k@archiver.kernel.org>; Sat, 16 Jan 2021 09:06:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 98DF723A56
	for <linux-m68k@archiver.kernel.org>; Sat, 16 Jan 2021 09:06:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725995AbhAPJF5 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sat, 16 Jan 2021 04:05:57 -0500
Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66]:47183 "EHLO
        outpost1.zedat.fu-berlin.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726111AbhAPJFX (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sat, 16 Jan 2021 04:05:23 -0500
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.94)
          with esmtps (TLS1.2)
          tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1l0hVg-003ahU-W8; Sat, 16 Jan 2021 10:04:40 +0100
Received: from dynamic-078-055-056-042.78.55.pool.telefonica.de ([78.55.56.42] helo=[192.168.1.10])
          by inpost2.zedat.fu-berlin.de (Exim 4.94)
          with esmtpsa (TLS1.2)
          tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1l0hVg-003CoK-Ax; Sat, 16 Jan 2021 10:04:40 +0100
Subject: Re: Booting Linux on Sun3 machines
To:     Sam Creasey <sammy@sammy.net>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
References: <9fd0f739-1b4b-6ce1-6a02-02375b4b574f@physik.fu-berlin.de>
 <CAMuHMdW5Of5dJwVjBytZyuTw3fxv1vPXrTcB6EzLUVW6T3Jsbw@mail.gmail.com>
 <20210116010503.GI1344617@anhedonia>
From:   John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Message-ID: <36851b1c-ee19-3545-d21b-e4f62edc91de@physik.fu-berlin.de>
Date:   Sat, 16 Jan 2021 10:04:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210116010503.GI1344617@anhedonia>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 78.55.56.42
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Sam!

On 1/16/21 2:05 AM, Sam Creasey wrote:
> Honestly, it probably doesn't boot.  The last kernel I knew to boot
> successfully was 2.6.16, and that required patches.

I guess then we have something to fix :-).

> My last round of notes is still here: https://sammy.net/sun3/

OK, thank you. I will have a look.

> It does include links to a compiled bootloader to netboot a sun3, and
> a very ancient debian userland (though if you get to trying to load
> init, I'd call that a victory).

Great. I will probably try the old stuff first, then switch to a newer kernel
and report any issues I run into to the list.

> I don't believe I ever wrote up full boot instructions, but the
> bootloader is a fork of the NetBSD one, so if you can get
> rarp/tftp/nfs/etc working well enough to netboot that, you're in the
> right place to try to netboot a Linux kernel.  I don't currently have
> a boot server configured, but I might be able to find some time to
> set something up and help you debug if you get that far.  I've
> certainly still got hardware to test with.

Sounds good. Let's get this back into working state!

Adrian

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer - glaubitz@debian.org
`. `'   Freie Universitaet Berlin - glaubitz@physik.fu-berlin.de
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

