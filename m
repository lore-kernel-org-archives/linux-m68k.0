Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 018C5C433DB
	for <linux-m68k@archiver.kernel.org>; Fri, 15 Jan 2021 18:31:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C560A23A58
	for <linux-m68k@archiver.kernel.org>; Fri, 15 Jan 2021 18:31:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727443AbhAOSbz (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 15 Jan 2021 13:31:55 -0500
Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66]:37187 "EHLO
        outpost1.zedat.fu-berlin.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726151AbhAOSbz (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 15 Jan 2021 13:31:55 -0500
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.94)
          for linux-m68k@lists.linux-m68k.org with esmtps (TLS1.2)
          tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1l0TsP-000e0v-Uu; Fri, 15 Jan 2021 19:31:13 +0100
Received: from pd9f74830.dip0.t-ipconnect.de ([217.247.72.48] helo=[192.168.178.23])
          by inpost2.zedat.fu-berlin.de (Exim 4.94)
          for linux-m68k@lists.linux-m68k.org with esmtpsa (TLS1.2)
          tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1l0TsP-001evV-B3; Fri, 15 Jan 2021 19:31:13 +0100
To:     linux-m68k <linux-m68k@lists.linux-m68k.org>
From:   John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: Booting Linux on Sun3 machines
Message-ID: <9fd0f739-1b4b-6ce1-6a02-02375b4b574f@physik.fu-berlin.de>
Date:   Fri, 15 Jan 2021 19:31:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 217.247.72.48
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi!

Since Arnd has waved with the axe at the Sun3 port this week, I would like to start
testing the port to make sure it still boots and if not, we can fix the problems.

I have three Sun3 machines in my basement that I can test the kernel on. However,
I have zero experience booting these machines, so I was wondering whether anyone
has booted Linux on these machines in the past and can tell me how that works.

Thanks,
Adrian

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer - glaubitz@debian.org
`. `'   Freie Universitaet Berlin - glaubitz@physik.fu-berlin.de
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
