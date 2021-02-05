Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B348C433DB
	for <linux-m68k@archiver.kernel.org>; Fri,  5 Feb 2021 12:16:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5392B64F3F
	for <linux-m68k@archiver.kernel.org>; Fri,  5 Feb 2021 12:16:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231857AbhBEMQL (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 5 Feb 2021 07:16:11 -0500
Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66]:33155 "EHLO
        outpost1.zedat.fu-berlin.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230088AbhBEMOY (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 5 Feb 2021 07:14:24 -0500
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.94)
          with esmtps (TLS1.2)
          tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1l7zzP-002peY-2v; Fri, 05 Feb 2021 13:13:31 +0100
Received: from dynamic-077-013-048-102.77.13.pool.telefonica.de ([77.13.48.102] helo=[192.168.1.10])
          by inpost2.zedat.fu-berlin.de (Exim 4.94)
          with esmtpsa (TLS1.2)
          tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1l7zzO-0048ZG-Rj; Fri, 05 Feb 2021 13:13:31 +0100
Subject: Re: [PATCH] arch: m68k: include: asm: Reconstruct the sentence in
 file sun3ints.h
To:     Bhaskar Chowdhury <unixbhaskar@gmail.com>, sammy@sammy.net,
        geert@linux-m68k.org, linux-m68k@lists.linux-m68k.org,
        linux-kernel@vger.kernel.org
Cc:     rdunlap@infradead.org
References: <20210205120455.1289448-1-unixbhaskar@gmail.com>
From:   John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Message-ID: <02edcb2b-ce56-488a-774b-8ea5caa6f7ac@physik.fu-berlin.de>
Date:   Fri, 5 Feb 2021 13:13:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210205120455.1289448-1-unixbhaskar@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 77.13.48.102
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On 2/5/21 1:04 PM, Bhaskar Chowdhury wrote:
> s/fuck/"do anything"/

What does this fix?

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer - glaubitz@debian.org
`. `'   Freie Universitaet Berlin - glaubitz@physik.fu-berlin.de
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

