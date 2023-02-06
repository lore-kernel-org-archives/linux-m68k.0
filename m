Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AA99C61DA4
	for <linux-m68k@archiver.kernel.org>; Mon,  6 Feb 2023 13:49:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230460AbjBFNtE (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 6 Feb 2023 08:49:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230299AbjBFNsz (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 6 Feb 2023 08:48:55 -0500
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9559D21A25
        for <linux-m68k@lists.linux-m68k.org>; Mon,  6 Feb 2023 05:48:18 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 9D69BCE1ACC;
        Mon,  6 Feb 2023 13:47:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EA65C4339B;
        Mon,  6 Feb 2023 13:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1675691256;
        bh=d5UX8Jsy8vAkH7W2D8UDabjhYgQEZhQICRNfT+2FU70=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=Pcc9Fev65EjYKKP1wUhCO3dVZJQ5oR+AIIZmioF3DfIIvihHHSSqonNw/AZ3+KVPB
         hb5hwkCQcaurmfjfDFtIswVkwOozbPhGR0WHrA3HRFbD8Q96IDi5Y/3gTHzNt9Tkik
         D1QYPA6QK7akLLP7WyBZA8UYJkbfuBjII3JH7qKZpMcFRrSHKh8xi2KrIEHUXfvowB
         z/JL3aFvUXwabQqLxFRFJZQ6EhsHl4L+fXILxsItnRxd2K+bST7/YAgxW1d4lAOafe
         bq1YkiVKoS7IdN2tdVEIYZmP2tr9S4cND58NPVuFpOcXCqDs3pfBip4sbzh+xHwA7I
         UicHDr8znkIig==
Message-ID: <5d28696e-fae5-ad18-2962-5d78efbb9a19@kernel.org>
Date:   Mon, 6 Feb 2023 23:47:31 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: U-Boot support for M68K removal
Content-Language: en-US
To:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Angelo Dureghello <angelo.dureghello@timesys.com>
Cc:     Tom Rini <trini@konsulko.com>,
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
 <af87d98baa2eb3bf253a1f06bc29ee9cd5034e3b.camel@physik.fu-berlin.de>
 <CALJHbkAuaGrfiAm2jzTmrAPSM+Gq1z-gVSZ+7hgn8-e_Lr82XQ@mail.gmail.com>
 <b7d1cfce-3ba3-6621-60c0-9b401a382971@kernel.org>
 <40a0fdd71a65307e33dc3b5d8fd15d655fcb0607.camel@physik.fu-berlin.de>
 <13f6e0187991b42c45a8341f4441e80aee563741.camel@physik.fu-berlin.de>
From:   Greg Ungerer <gerg@kernel.org>
In-Reply-To: <13f6e0187991b42c45a8341f4441e80aee563741.camel@physik.fu-berlin.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Adrian,

On 6/2/23 22:30, John Paul Adrian Glaubitz wrote:
> On Mon, 2023-02-06 at 13:25 +0100, John Paul Adrian Glaubitz wrote:
>> On Mon, 2023-02-06 at 22:02 +1000, Greg Ungerer wrote:
>>> I wish I had a 54415 based board in my collection. Would make it so
>>> much easier to keep the kernel working on it :-(
>>
>> Maybe we can find one to buy for you. I would be happy to donate for it.
> 
> Btw, what environment are you using to test Coldfire kernel patches?
> 
> Do you use Buildroot to create a bootable ColdFire chroot?

I mostly use this for generating user space:

     https://github.com/AcceleratedLinux/accelerated-linux

It is an off shoot of the older uClinux-dist build packages.

Recently I have just been hand rolling scripts too:

     https://github.com/AcceleratedLinux/accelerated-linux

That has been useful for testing using ELF format binaries in no-MMU space.

I have used buildroot in the past too.

Regards
Greg


