Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CF2AC433B4
	for <linux-m68k@archiver.kernel.org>; Fri, 16 Apr 2021 20:36:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3A8FA6124B
	for <linux-m68k@archiver.kernel.org>; Fri, 16 Apr 2021 20:36:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240036AbhDPUgq (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 16 Apr 2021 16:36:46 -0400
Received: from mslow1.mail.gandi.net ([217.70.178.240]:37677 "EHLO
        mslow1.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235727AbhDPUgq (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 16 Apr 2021 16:36:46 -0400
Received: from relay9-d.mail.gandi.net (unknown [217.70.183.199])
        by mslow1.mail.gandi.net (Postfix) with ESMTP id DFEDFD74F5
        for <linux-m68k@lists.linux-m68k.org>; Fri, 16 Apr 2021 20:26:48 +0000 (UTC)
X-Originating-IP: 90.65.108.55
Received: from localhost (lfbn-lyo-1-1676-55.w90-65.abo.wanadoo.fr [90.65.108.55])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 422A6FF802;
        Fri, 16 Apr 2021 20:26:27 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     linux-kernel@vger.kernel.org, Laurent Vivier <laurent@vivier.eu>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-m68k@lists.linux-m68k.org, linux-rtc@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 0/2] m68k: Add Virtual M68k Machine
Date:   Fri, 16 Apr 2021 22:26:26 +0200
Message-Id: <161860472066.842937.16850667459079911050.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210323221430.3735147-1-laurent@vivier.eu>
References: <20210323221430.3735147-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Tue, 23 Mar 2021 23:14:28 +0100, Laurent Vivier wrote:
> The most powerful m68k machine emulated by QEMU is a Quadra 800,
> but this machine is very limited: only 1 GiB of memory and only some
> specific interfaces, with no DMA.
> 
> The Virtual M68k Machine is based on Goldfish interfaces defined by Google
> for Android simulator. It uses Goldfish-rtc (timer and RTC),
> Goldfish-pic (PIC) and Goldfish-tty (for early tty).
> 
> [...]

Applied, thanks!

[1/2] rtc: goldfish: remove dependency to OF
      commit: 3fd00fdc4f11c656a63e6a6280c0bcb63cf109a2
[2/2] m68k: introduce a virtual m68k machine
      commit: 95631785c64840f3816f7a4cc2ce1a5332f43184

Best regards,
-- 
Alexandre Belloni <alexandre.belloni@bootlin.com>
