Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3448AC433E6
	for <linux-m68k@archiver.kernel.org>; Wed, 17 Mar 2021 04:31:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0EB3964F8C
	for <linux-m68k@archiver.kernel.org>; Wed, 17 Mar 2021 04:31:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229550AbhCQEaw (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 17 Mar 2021 00:30:52 -0400
Received: from mout.perfora.net ([74.208.4.197]:36779 "EHLO mout.perfora.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229540AbhCQEaa (ORCPT <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 17 Mar 2021 00:30:30 -0400
X-Greylist: delayed 302 seconds by postgrey-1.27 at vger.kernel.org; Wed, 17 Mar 2021 00:30:30 EDT
Received: from [192.168.1.5] ([136.25.12.210]) by mrelay.perfora.net
 (mreueus002 [74.208.5.2]) with ESMTPSA (Nemesis) id 0Levc1-1m3TWF3Ihb-00qkD4;
 Wed, 17 Mar 2021 05:25:24 +0100
From:   Mike Pavone <pavone@retrodev.com>
Subject: [PATCH] m68k/mvme16x: Fix timer interrupts
To:     linux-m68k@lists.linux-m68k.org
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>
Message-ID: <628cb0d0-94af-651f-0d84-f78b966cd8bd@retrodev.com>
Date:   Tue, 16 Mar 2021 21:25:23 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Provags-ID: V03:K1:haPn25ueCc2Axrh7CBbDuM3vyJBv56ZML0orj1OKCtD/jI3c4Kr
 1ybDgJzr5gUF3iQRpQvlPxx2sE4WJTBSbIUrTfgRf8SloEFW4GGY9Sbg1XHZckQLc8hEL3f
 zEFpL7DNlnrKCGWEgYAUMAKSbCoAzoFGQx1UG/LGmsy83WqMMUQ25d2tBifzFUZnf6TSy31
 K2STHImI/Bcu76heO/5qA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:rM3HjmBxEAY=:a1XK/VM2noLyDogZr9JFa6
 XkpvLrvP+fsNC7nX3aGUrK+AGEEfpcjO7XfPoVOo2KuzKVTquCdd3VzHuRiG7X+g0R7CjEtP8
 3uh44DGrEuZKIdfTo5XcqpdqAMlsw73dSkJEq/43YFLgz24TdXOPoDKR/2Yr4zS4WMIfcO9YB
 c6TacJhmfjZqlTZWThrwEdQ4DwjvDquhccP4w4GLyk0c/AXlVOy/fOL6Pq0M+aV1H/45VKZku
 +/Oe1le0D34D+ENXPt+MgJFdS1LlfL3LlLjzEj/Q3lP6OvSsegEyhNM1hSzgTUB0zBkEAIlEM
 k1eDhSpaxLj09sluybWFfjwpXQ4HzF7BOqpnRdIl/E21INczNd//gN6OTtLDkOwra9kV10WYR
 bq+ldkML0HGnphhTDXyB8dkOkSuPgznpUw6V7+q50WG6e2hgS31BJVVhWk0oNQoBVIMaP/VFE
 xctN9EvHaA==
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Timer interrupts on MVME16x and MVME17x boards are broken as the CEN and
COC bits are being inadvertently cleared when clearing the overflow
counter. This results in no timer interrupts being delivered after the
first. Initialization then hangs in calibrate_delay as the jiffies counter
is not updated. OR with current register value to preserve these bits.

Fixes: 19999a8b8782 ("m68k: mvme16x: Handle timer counter overflow")
Signed-off-by: Michael Pavone <pavone@retrodev.com>
---
  arch/m68k/mvme16x/config.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/m68k/mvme16x/config.c b/arch/m68k/mvme16x/config.c
index 30357fe4ba6c..949d3e19f79c 100644
--- a/arch/m68k/mvme16x/config.c
+++ b/arch/m68k/mvme16x/config.c
@@ -375,7 +375,7 @@ static irqreturn_t mvme16x_timer_int (int irq, void *dev_id)
  
  	local_irq_save(flags);
  	out_8(PCCTIC1, in_8(PCCTIC1) | PCCTIC1_INT_CLR);
-	out_8(PCCTOVR1, PCCTOVR1_OVR_CLR);
+	out_8(PCCTOVR1, in_8(PCCTOVR1) | PCCTOVR1_OVR_CLR);
  	clk_total += PCC_TIMER_CYCLES;
  	legacy_timer_tick(1);
  	local_irq_restore(flags);

