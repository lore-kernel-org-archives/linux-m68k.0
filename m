Return-Path: <SRS0=QPqG=BG=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E15FC433DF
	for <linux-m68k@archiver.kernel.org>; Mon, 27 Jul 2020 06:35:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0242D20759
	for <linux-m68k@archiver.kernel.org>; Mon, 27 Jul 2020 06:35:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726139AbgG0GfJ (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 27 Jul 2020 02:35:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726116AbgG0GfJ (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 27 Jul 2020 02:35:09 -0400
Received: from mail-out.m-online.net (mail-out.m-online.net [IPv6:2001:a60:0:28:0:1:25:1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16B2BC0619D2
        for <linux-m68k@lists.linux-m68k.org>; Sun, 26 Jul 2020 23:35:09 -0700 (PDT)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
        by mail-out.m-online.net (Postfix) with ESMTP id 4BFVRF4YVKz1rtjS;
        Mon, 27 Jul 2020 08:35:05 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
        by mail.m-online.net (Postfix) with ESMTP id 4BFVRF40B9z1qqkt;
        Mon, 27 Jul 2020 08:35:05 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
        by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
        with ESMTP id toJs_Cpqs4s5; Mon, 27 Jul 2020 08:35:04 +0200 (CEST)
X-Auth-Info: LLWi3hXJ9gO4d4ye66bMLRB2UxeXEsqTrji18BTJM58UXJyI3zdjOcsdwJVPU2Kd
Received: from igel.home (ppp-46-244-165-251.dynamic.mnet-online.de [46.244.165.251])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.mnet-online.de (Postfix) with ESMTPSA;
        Mon, 27 Jul 2020 08:35:04 +0200 (CEST)
Received: by igel.home (Postfix, from userid 1000)
        id 262C22C1083; Mon, 27 Jul 2020 08:35:04 +0200 (CEST)
From:   Andreas Schwab <schwab@linux-m68k.org>
To:     Michael Schmitz <schmitzmic@gmail.com>
Cc:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Debian m68k <debian-68k@lists.debian.org>,
        Helge Deller <deller@gmx.de>
Subject: Re: Seccomp support for linux-m68k
References: <cd3ff9a1-030e-1e34-3950-99088ef81be0@physik.fu-berlin.de>
        <5642df4a-be8f-01eb-63c1-b5b4d75fa9d0@physik.fu-berlin.de>
        <06f3ccd0-3567-5905-eea0-80fb18206648@gmail.com>
        <877durreph.fsf@igel.home>
        <80cef911-af86-c49f-5ac3-1cfe7037de80@gmail.com>
        <87wo2q5yhx.fsf@igel.home>
        <460261ab-8c10-d625-a4e4-a4e755413018@gmail.com>
        <877duq56hn.fsf@igel.home>
        <96592373-33e0-e7a5-052b-5cd53b2d9fc5@gmail.com>
X-Yow:  I just had a NOSE JOB!!
Date:   Mon, 27 Jul 2020 08:35:04 +0200
In-Reply-To: <96592373-33e0-e7a5-052b-5cd53b2d9fc5@gmail.com> (Michael
        Schmitz's message of "Mon, 27 Jul 2020 09:39:28 +1200")
Message-ID: <87eeoxtqhz.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.0.91 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Jul 27 2020, Michael Schmitz wrote:

> No, tstb tests a byte operand. btst tests a bit.

You can test a bit with tstb as well, as you can see here.

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."
