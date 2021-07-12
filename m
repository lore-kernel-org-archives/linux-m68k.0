Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A90E9C07E99
	for <linux-m68k@archiver.kernel.org>; Mon, 12 Jul 2021 10:20:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8AFC160C40
	for <linux-m68k@archiver.kernel.org>; Mon, 12 Jul 2021 10:20:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231736AbhGLKX3 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 12 Jul 2021 06:23:29 -0400
Received: from mail-out.m-online.net ([212.18.0.9]:59834 "EHLO
        mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231536AbhGLKX3 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 12 Jul 2021 06:23:29 -0400
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
        by mail-out.m-online.net (Postfix) with ESMTP id 4GNfsz154Fz1qxHY;
        Mon, 12 Jul 2021 12:20:39 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
        by mail.m-online.net (Postfix) with ESMTP id 4GNfsz0cQ5z1r6Nq;
        Mon, 12 Jul 2021 12:20:39 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
        by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
        with ESMTP id 0vFvCDn-Xi5K; Mon, 12 Jul 2021 12:20:38 +0200 (CEST)
X-Auth-Info: fVqtb9+ciTWfbHXw/ZI/wb215GtryVAsZ1EKboMP9u/884E/iUNMfnnsrtRuSU2P
Received: from igel.home (ppp-46-244-167-56.dynamic.mnet-online.de [46.244.167.56])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.mnet-online.de (Postfix) with ESMTPSA;
        Mon, 12 Jul 2021 12:20:38 +0200 (CEST)
Received: by igel.home (Postfix, from userid 1000)
        id 9AB132C0754; Mon, 12 Jul 2021 12:20:37 +0200 (CEST)
From:   Andreas Schwab <schwab@linux-m68k.org>
To:     Michael Schmitz <schmitzmic@gmail.com>
Cc:     Christoph Hellwig <hch@lst.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        linux-m68k@lists.linux-m68k.org
Subject: Re: RFC: remove set_fs for m68k
References: <20210709070132.3387689-1-hch@lst.de>
        <039e2f42-b9bc-d8ce-393a-c0896439f784@gmail.com>
X-Yow:  This ASEXUAL PIG really BOILS my BLOOD...  He's so..so.....URGENT!!
Date:   Mon, 12 Jul 2021 12:20:37 +0200
In-Reply-To: <039e2f42-b9bc-d8ce-393a-c0896439f784@gmail.com> (Michael
        Schmitz's message of "Sun, 11 Jul 2021 19:20:26 +1200")
Message-ID: <87fswjomtm.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Jul 11 2021, Michael Schmitz wrote:

> Testing your series, I've got this in the console log:
>
> [16534.130000] *** FORMAT ERROR ***   FORMAT=0
> [16534.150000] Current process id is 1347
> [16534.160000] BAD KERNEL TRAP: 00000000
> [16534.180000] Modules linked in: atari_scsi ne 8390p
> [16534.210000] PC: [<00002a8c>] resume_userspace+0x14/0x16
> [16534.230000] SR: 2200  SP: d1b6e0e8  a2: 00000000
> [16534.240000] d0: 0000001e    d1: 00000003    d2: 00000578    d3: 00000000
> [16534.270000] d4: ffffffff    d5: 00000001    a0: 00000578    a1: 00000080
> [16534.300000] Process savelog (pid: 1347, task=e3955528)
> [16534.310000] Frame format=0
> [16534.330000] Stack from 005e9fa4:
> [16534.330000]         02108005 0d06b008 1eeeb649 007e0001 00aea040
> 003ec318 005e9e68 000279a2
> [16534.330000]         000b0000 00000000 00000000 030dfffb 0044fffa
> 0e000000 fffa1a00 fffa1c00
> [16534.330000]         fffa1e00 fffb0e40 fffb0e80 00049e02 00000040
> 0085a800 00000001
> [16534.430000] Call Trace: [<000279a2>] warn_slowpath_fmt+0x0/0x62
> [16534.460000]  [<000b0000>] vm_map_ram+0x144/0x5ae
> [16534.490000]  [<00049e02>] __handle_irq_event_percpu+0x38/0xce
> [16534.520000]
> [16534.540000] Code: 9f38 9f38 9f38 9f38 9f38 9f38 9f38 9f38 <9f38> 9f38
> 9f38 9f38 9f38 9f38 9f38 9f38 9f38 9f38 9f38 9f38 9f38 9f38 9f38 9f38

That looks like something overwrote the kernel code. 0x9f38 isn't an
insn that you would ever see in the kernel.

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."
