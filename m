Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16905C636D3
	for <linux-m68k@archiver.kernel.org>; Mon, 30 Jan 2023 19:10:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236396AbjA3TKl (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 30 Jan 2023 14:10:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229887AbjA3TKk (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 30 Jan 2023 14:10:40 -0500
X-Greylist: delayed 483 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 30 Jan 2023 11:10:38 PST
Received: from welho-filter4.welho.com (welho-filter4b.welho.com [83.102.41.30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DC70195
        for <linux-m68k@lists.linux-m68k.org>; Mon, 30 Jan 2023 11:10:38 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
        by welho-filter4.welho.com (Postfix) with ESMTP id 1AAC963133;
        Mon, 30 Jan 2023 21:02:33 +0200 (EET)
X-Virus-Scanned: Debian amavisd-new at pp.htv.fi
Received: from welho-smtp3.welho.com ([IPv6:::ffff:83.102.41.86])
        by localhost (welho-filter4.welho.com [::ffff:83.102.41.26]) (amavisd-new, port 10024)
        with ESMTP id AtSuJ6FLRDl2; Mon, 30 Jan 2023 21:02:32 +0200 (EET)
Received: from [192.168.0.20] (89-27-79-133.bb.dnainternet.fi [89.27.79.133])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by welho-smtp3.welho.com (Postfix) with ESMTPSA id 688CE2315;
        Mon, 30 Jan 2023 20:56:48 +0200 (EET)
Message-ID: <6558aca3-63aa-c89c-93fc-a5afe48cbe78@helsinkinet.fi>
Date:   Mon, 30 Jan 2023 20:56:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: U-Boot support for M68K removal
To:     Tom Rini <trini@konsulko.com>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc:     Angelo Dureghello <angelo.dureghello@timesys.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k@lists.linux-m68k.org,
        Joshua Thompson <funaho@jurai.org>,
        Philip Blundell <philb@gnu.org>, u-boot@lists.denx.de,
        Huan Wang <alison.wang@nxp.com>
References: <Y9PWhU7DVQCLP9EX@bill-the-cat>
 <CAMuHMdUMvGhpbfsTaaNSpypH_XdKjVzY3yWOOpR=Acj_7K6-uw@mail.gmail.com>
 <CALJHbkBqdvJu8KGKbJ2eayhiP_t607AvuwgYidhLTPY7=Mt4Hg@mail.gmail.com>
 <Y9fs2wH4WHIzae5r@bill-the-cat>
 <7739d9da9f49f99d156dacf645a311388e9eb628.camel@physik.fu-berlin.de>
 <Y9fxfNDNXXyJQ0Dn@bill-the-cat>
Content-Language: en-US
From:   Eero Tamminen <oak@helsinkinet.fi>
In-Reply-To: <Y9fxfNDNXXyJQ0Dn@bill-the-cat>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi,

On 30.1.2023 18.34, Tom Rini wrote:
> That's great to hear. While I started my life on m68k machines, I never
> did get Linux up on one. Do the coldfire platforms you have run U-Boot
> today? If so, are they already supported upstream? One of my biggest
> concerns about the architecture, in U-Boot, is that I've just not heard
> of anyone using it in quite some time, and we don't have any emulated
> platforms either (can it be done in QEMU? We have other plaforms in CI
> via QEMU) so I worry it's not working.

Qemu supports both m68k and ColdFire nowadays: 
https://www.qemu.org/docs/master/system/target-m68k.html


	- Eero

PS. For m68k there are also a lot of other emulators that emulate 
specific platforms.

Aranym, 68040 Atari "clone", used a lot by Debian m68k port before Qemu 
got m68k support.

WinAUE, 68000-68040 Amiga emulation.  Unlike Aranym or Qemu, this 
emulates also CPU cache.

Hatari, 68000-68040 Atari emulation (based on WinUAE CPU core).

Previous, 68030 NeXT emulator (based on Hatari).

