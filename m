Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 502A1C433E6
	for <linux-m68k@archiver.kernel.org>; Mon, 11 Jan 2021 09:51:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 09C2E22B47
	for <linux-m68k@archiver.kernel.org>; Mon, 11 Jan 2021 09:51:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728593AbhAKJvE (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 11 Jan 2021 04:51:04 -0500
Received: from mail.kernel.org ([198.145.29.99]:39432 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728432AbhAKJvA (ORCPT <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 11 Jan 2021 04:51:00 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6649D22527;
        Mon, 11 Jan 2021 09:50:11 +0000 (UTC)
Subject: Re: Old platforms: bring out your dead
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc:     Daniel Palmer <daniel@0x0f.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Krzysztof Adamski <krzysztof.adamski@nokia.com>,
        Oleksij Rempel <o.rempel@pengutronix.de>,
        Baruch Siach <baruch@tkos.co.il>,
        Russell King - ARM Linux <linux@armlinux.org.uk>,
        Daniel Tang <dt.tangr@gmail.com>,
        =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Jamie Iles <jamie@jamieiles.com>,
        Barry Song <song.bao.hua@hisilicon.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jonas Jensen <jonas.jensen@gmail.com>,
        Marc Gonzalez <marc.w.gonzalez@free.fr>,
        Hartley Sweeten <hsweeten@visionengravers.com>,
        Lubomir Rintel <lkundrak@v3.sk>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Shawn Guo <shawnguo@kernel.org>, Alex Elder <elder@linaro.org>,
        Alexander Shiyan <shc_work@mail.ru>,
        Koen Vandeputte <koen.vandeputte@ncentric.com>,
        Hans Ulli Kroll <ulli.kroll@googlemail.com>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Wei Xu <xuwei5@hisilicon.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Mark Salter <msalter@redhat.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
References: <CAFr9PX=BV1YFcO_GQWsW3XEo8nndjUwArzW5Fg1fnWzt8fiwGw@mail.gmail.com>
 <e1b2de15-b4ad-68bb-4fae-cf0f3ecd4b79@physik.fu-berlin.de>
 <CAMuHMdUia3-DroA3VOA5jkYYWP+Rip5yse-nd00JuV8uFnVp1Q@mail.gmail.com>
 <803a40ba-d0cb-e5e2-9d57-f1b70d7aee37@physik.fu-berlin.de>
 <CAMuHMdV0orx=9W3LU40Z4wvtL18Znz79=j6pObUw+22TEaAM6g@mail.gmail.com>
From:   Greg Ungerer <gerg@linux-m68k.org>
Message-ID: <9e9cc4ad-38b0-f799-cd0e-c1e1c7e3501c@linux-m68k.org>
Date:   Mon, 11 Jan 2021 19:50:07 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdV0orx=9W3LU40Z4wvtL18Znz79=j6pObUw+22TEaAM6g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org



On 11/1/21 7:36 pm, Geert Uytterhoeven wrote:
> Hi Adrian,
> 
> On Mon, Jan 11, 2021 at 10:26 AM John Paul Adrian Glaubitz
> <glaubitz@physik.fu-berlin.de> wrote:
>> On 1/11/21 10:20 AM, Geert Uytterhoeven wrote:
>>>> Sounds interesting. Do these SoCs come with an MMU? And do they use the
>>>> ColdFire instruction set or do they run plain 68k code?
>>>
>>> No MMU, plain m68k code.
>>>
>>> 68328 Soc = 68000 core + some peripherals,
>>> 68360 SoC = CPU32 core (based on 68020 + some peripherals.
>>
>> OK, I guess that would be useful for the NoMMU Linux port.
> 
> Note that 68360 support was removed from the kernel in 2016, as
> Arnd said.

And that 68360 was bit rotten for a very long time before that.
Nobody ever seemed to show much interest in it.

Keep in mind that the 68328 family of parts are pretty slow too...


>>> Anyone working on integrating m68k (and SPARC and MIPS?) softcores in
>>> LiteX? ;-)
>>
>> I'm personally waiting for the Vampire to gain support for the real 68851
>> as the hardware in general looks very attractive [1].
> 
> The 68851 is way too complex for what's needed (who needs support for
> 256 byte pages (https://lwn.net/Articles/839746/)?).
> They'd be better off implementing something simpler, like 68040 MMU
> support, or perhaps even a software-controlled TLB like most RISC
> architectures (incl. ColdFire?).  The latter would require more changes
> to Linux, though.

Yep, the ColdFire MMU is a software controlled TLB.

Regards
Greg
