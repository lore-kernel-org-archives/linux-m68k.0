Return-Path: <SRS0=XpS4=AV=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64B88C433DF
	for <linux-m68k@archiver.kernel.org>; Fri, 10 Jul 2020 08:18:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4ABE42078B
	for <linux-m68k@archiver.kernel.org>; Fri, 10 Jul 2020 08:18:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726288AbgGJIS5 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 10 Jul 2020 04:18:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726004AbgGJIS4 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 10 Jul 2020 04:18:56 -0400
Received: from smtp3.strotmann.de (smtp3.strotmann.de [IPv6:2a03:4000:2:33f::5353])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A88B9C08C5CE
        for <linux-m68k@lists.linux-m68k.org>; Fri, 10 Jul 2020 01:18:56 -0700 (PDT)
Received: from smtp2.strotmann.de (unknown [IPv6:fd00::2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by smtp3.strotmann.de (Postfix) with ESMTPS id 81A307FF27;
        Fri, 10 Jul 2020 10:18:51 +0200 (CEST)
Received: from emacs.strotmann.de.strotmann.de (unknown [IPv6:fd00::123])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp2.strotmann.de (Postfix) with ESMTPSA id 4B35Xp0Pb1z1sMQ;
        Fri, 10 Jul 2020 10:18:50 +0200 (CEST)
References: <86sgeskyb7.fsf@emacs.strotmann.de>
User-agent: mu4e 1.2.0; emacs 28.0.50
From:   Carsten Strotmann <cas@strotmann.de>
To:     linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Debian-68k <debian-68k@lists.debian.org>
Subject: virtual eventing chat meeting today
In-reply-to: <86sgeskyb7.fsf@emacs.strotmann.de>
Date:   Fri, 10 Jul 2020 10:18:48 +0200
Message-ID: <86zh87236f.fsf@emacs.strotmann.de>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi,

a short reminder of the next virtual eventing chat meeting will be 
on
10th of July 2020 (today) starting at 8:00pm CEST (20:00 H) on
<https://meet.m68k.info> (the Jitsi meeting page will be online 30
minutes before the meeting starts.

Based on the discussion last month I've created a prototype of an
"planet m68k" news aggregator website (that could also be used as 
a
source for a monthly newsletter) containing m68k development news.

Also, the poll for a larger m68k developers meeting in Q4/2020 is 
still
open (and will be open until end of August)
<https://nuudel.digitalcourage.de/sBwNfnUh2BjGWHJY>


See you tonight

Carsten
