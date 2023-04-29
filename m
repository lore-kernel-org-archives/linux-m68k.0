Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E826BC77B60
	for <linux-m68k@archiver.kernel.org>; Sat, 29 Apr 2023 08:17:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230460AbjD2IRg (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sat, 29 Apr 2023 04:17:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230392AbjD2IRf (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Sat, 29 Apr 2023 04:17:35 -0400
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B32051982
        for <linux-m68k@vger.kernel.org>; Sat, 29 Apr 2023 01:17:33 -0700 (PDT)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
        by mail-out.m-online.net (Postfix) with ESMTP id 4Q7j576mY3z1r1Mf;
        Sat, 29 Apr 2023 10:17:31 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
        by mail.m-online.net (Postfix) with ESMTP id 4Q7j5761vFz1qqlS;
        Sat, 29 Apr 2023 10:17:31 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
        by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
        with ESMTP id U03LBZfJiclI; Sat, 29 Apr 2023 10:17:31 +0200 (CEST)
X-Auth-Info: Eo4QWUJCith/4biZVa+243C49ipkDTNpBj/ooSg+T5VnUCMOoALphlQIqfl1NMGB
Received: from igel.home (aftr-82-135-86-255.dynamic.mnet-online.de [82.135.86.255])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.mnet-online.de (Postfix) with ESMTPSA;
        Sat, 29 Apr 2023 10:17:31 +0200 (CEST)
Received: by igel.home (Postfix, from userid 1000)
        id B73B02C14D1; Sat, 29 Apr 2023 10:17:30 +0200 (CEST)
From:   Andreas Schwab <schwab@linux-m68k.org>
To:     Michael Schmitz <schmitzmic@gmail.com>
Cc:     linux-m68k@vger.kernel.org, geert@linux-m68k.org,
        Finn Thain <fthain@linux-m68k.org>,
        Stan Johnson <userm57@yahoo.com>
Subject: Re: [PATCH RFC v1] m68k: signal.c: use signal frame gap to avoid
 stack corruption
In-Reply-To: <20230429080410.8993-1-schmitzmic@gmail.com> (Michael Schmitz's
        message of "Sat, 29 Apr 2023 20:04:10 +1200")
References: <20230429080410.8993-1-schmitzmic@gmail.com>
X-Yow:  Did YOU find a DIGITAL WATCH in YOUR box of VELVEETA?
Date:   Sat, 29 Apr 2023 10:17:30 +0200
Message-ID: <871qk385lx.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Apr 29 2023, Michael Schmitz wrote:

> We can use the format b fault address in frame.un.fmtb.daddr
> to find the address where the fault occurred, i.e. the
> address where the instruction will resume.

I don't think you can assume any order of transfer.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."
