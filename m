Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C22FC77B7E
	for <linux-m68k@archiver.kernel.org>; Sat, 29 Apr 2023 07:11:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229559AbjD2HLt (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sat, 29 Apr 2023 03:11:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229501AbjD2HLs (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sat, 29 Apr 2023 03:11:48 -0400
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED6AC2D47
        for <linux-m68k@lists.linux-m68k.org>; Sat, 29 Apr 2023 00:11:45 -0700 (PDT)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
        by mail-out.m-online.net (Postfix) with ESMTP id 4Q7gdC6j74z1s94V;
        Sat, 29 Apr 2023 09:11:43 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
        by mail.m-online.net (Postfix) with ESMTP id 4Q7gdC68T4z1qqlS;
        Sat, 29 Apr 2023 09:11:43 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
        by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
        with ESMTP id KGpN6wOWZxHA; Sat, 29 Apr 2023 09:11:43 +0200 (CEST)
X-Auth-Info: 15ojG/0Zcis/17fy1w/HOpJ2uv+b5COEz14r0xSLJJG1lVL5amAShq4sDXn2OK1i
Received: from tiger.home (aftr-82-135-86-255.dynamic.mnet-online.de [82.135.86.255])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.mnet-online.de (Postfix) with ESMTPSA;
        Sat, 29 Apr 2023 09:11:42 +0200 (CEST)
Received: by tiger.home (Postfix, from userid 1000)
        id A1CCD199962; Sat, 29 Apr 2023 09:11:42 +0200 (CEST)
From:   Andreas Schwab <schwab@linux-m68k.org>
To:     Finn Thain <fthain@linux-m68k.org>
Cc:     Michael Schmitz <schmitzmic@gmail.com>,
        linux-m68k@lists.linux-m68k.org
Subject: Re: signal delivery, was Re: reliable reproducer
In-Reply-To: <ae06a4dd-fbc2-7924-9f7d-b8e0a92a8a7d@linux-m68k.org> (Finn
        Thain's message of "Sat, 29 Apr 2023 15:03:19 +1000 (AEST)")
References: <4a9c1d0d-07aa-792e-921f-237d5a30fc44.ref@yahoo.com>
        <4763c8e2-6fb3-eda6-10d0-94ed1d01cd60@gmail.com>
        <a5d70bac-bd00-7131-9ca0-18976f539adf@linux-m68k.org>
        <b150c146-cade-bcd3-9c34-d99284dcd153@gmail.com>
        <c3d2d874-e366-1d3b-71b0-7a089d40308a@linux-m68k.org>
        <1fcaa695-5c2d-0c76-444d-6d6be0105f6e@linux-m68k.org>
        <7c86ad1d-7bbd-8f61-5ac4-56a1b99a8663@gmail.com>
        <1ac37684-2696-6103-10d9-92914b0497a1@gmail.com>
        <1c4fc19f-ad9b-7b8f-6638-8b026fe1280b@linux-m68k.org>
        <5ac55169-4916-d671-489f-7eb8fb85d336@gmail.com>
        <9544ef26-a444-e186-fb1e-0e914acd36af@gmail.com>
        <20de24b3-098d-4603-2768-b0468a4fe772@gmail.com>
        <69565abb-1cd6-716e-046e-5a6d69a4e617@linux-m68k.org>
        <89cb2211-5f6e-07a2-3149-1ad1ad887265@linux-m68k.org>
        <d3d27369-8532-ba69-2463-66b8decbee67@gmail.com>
        <4b4eacf2-6934-5563-fb47-04843a77a35c@gmail.com>
        <dad59503-34e4-bc0e-db29-f53b951afc78@linux-m68k.org>
        <13d2b2f4-ad99-02a8-db89-828a4c20fe54@gmail.com>
        <ae06a4dd-fbc2-7924-9f7d-b8e0a92a8a7d@linux-m68k.org>
X-Yow:  ...Get me a GIN and TONIC!!...make it HAIR TONIC!!
Date:   Sat, 29 Apr 2023 09:11:42 +0200
Message-ID: <87h6szjh75.fsf@linux-m68k.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Apr 29 2023, Finn Thain wrote:

> There's probably a reason why do_page_fault() picked a 256 byte gap

The biggest size of an operand a (coprocessor) instruction can transfer
is 255 bytes.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."
