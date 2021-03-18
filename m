Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96376C433E0
	for <linux-m68k@archiver.kernel.org>; Thu, 18 Mar 2021 07:24:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6694864EBD
	for <linux-m68k@archiver.kernel.org>; Thu, 18 Mar 2021 07:24:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229745AbhCRHXf (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 18 Mar 2021 03:23:35 -0400
Received: from mout.perfora.net ([74.208.4.196]:54303 "EHLO mout.perfora.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229554AbhCRHXM (ORCPT <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 18 Mar 2021 03:23:12 -0400
Received: from [192.168.1.5] ([136.25.12.210]) by mrelay.perfora.net
 (mreueus003 [74.208.5.2]) with ESMTPSA (Nemesis) id 0LxhYD-1lkRUS0ZQZ-017AtM;
 Thu, 18 Mar 2021 08:23:03 +0100
Subject: Re: [PATCH] m68k/mvme16x: Fix timer interrupts
To:     Finn Thain <fthain@telegraphics.com.au>
Cc:     linux-m68k@lists.linux-m68k.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
References: <628cb0d0-94af-651f-0d84-f78b966cd8bd@retrodev.com>
 <96914f42-e18-29cc-6c5-28b3a2fb360@telegraphics.com.au>
From:   Michael Pavone <pavone@retrodev.com>
Message-ID: <598f5719-8cc5-15da-4062-157b1162318a@retrodev.com>
Date:   Thu, 18 Mar 2021 00:23:02 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <96914f42-e18-29cc-6c5-28b3a2fb360@telegraphics.com.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Provags-ID: V03:K1:50GKWac8BfCvYdgShLaoU0zHIBktOiJE+JmnqRcYjCJmszSCm7P
 99cjrNpVcqwMc6iaLUxdFno7HPBFTk6e/C13pjVZjrZxHS7CdXxqG28/Q3pBdLFQMDpFqJL
 0aUlOjInyRwFF7+jP/9AHEjoxpGMYmAxLe7ChLloKbcOqB06kyg3lgw0WqlnqOQ8lA79cIJ
 452+AcZONl1Mz29g3WFiw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Y25uIEduhW4=:8AuYU1ADRchIM9opZ1luju
 ABohYEbMddXvTlA0LXv+l724sqoKOLwKlzC1Io6twh+5CrKx8UgpfPE0ZrbfMR+qjQa5NKRz3
 RgoeqxC/mqpOHpNw46cn6vgsoHY3FlS9tiyfSeTaJutZY/ULdF704UnrV1LeAt1oV1apfxSn+
 +rSwV/1wMtsiBDR/aBGf1v7TphXmAl/wWb9j8Tx22sLHP8soE39bKNQ5DosPuj3jsmvWCdkks
 lw9Rzi0bDC/5TyipXkFK5607OmZmXKsE8jcIKlR9V2gLNbjFUMPWvnP4LHYjkePeSPkQ5FiCy
 rfXc9HS+R07ahG8QSrGYbLIoOEc0uMhWs2BzgCLzrSHC3VtCqu2fZbmLGhmmkm2WF/8ZzYHZk
 iAWkYsXWzlR6pkrEnMlEIm5hZNhKbThL7vRJnpdvYUUG8sy9tfE1JwfekvqLpTmShkSCiC8sL
 FuMqmxwgyw==
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On 3/17/21 8:05 PM, Finn Thain wrote:

> On Tue, 16 Mar 2021, Mike Pavone wrote:
>
>> Timer interrupts on MVME16x and MVME17x boards are broken as the CEN and
>> COC bits are being inadvertently cleared when clearing the overflow
>> counter. This results in no timer interrupts being delivered after the
>> first. Initialization then hangs in calibrate_delay as the jiffies counter
>> is not updated. OR with current register value to preserve these bits.
>>
>> Fixes: 19999a8b8782 ("m68k: mvme16x: Handle timer counter overflow")
>> Signed-off-by: Michael Pavone <pavone@retrodev.com>
> Sorry about that regression.
>
> Do you think that commit 7529b90d051e ("m68k: mvme147: Handle timer
> counter overflow") has the same problem?

I don't have an MVME147 board to test with, but based on the documentation
it looks like it does. The clear bit is in the same register as the enable
and count enable bits on the original PCCchip.

