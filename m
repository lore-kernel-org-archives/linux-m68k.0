Return-Path: <SRS0=ttaO=YV=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4DBFCA9EC0
	for <linux-m68k@archiver.kernel.org>; Mon, 28 Oct 2019 22:31:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6F627214E0
	for <linux-m68k@archiver.kernel.org>; Mon, 28 Oct 2019 22:31:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725880AbfJ1WbR (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 28 Oct 2019 18:31:17 -0400
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:58098 "EHLO
        kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725829AbfJ1WbR (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Mon, 28 Oct 2019 18:31:17 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
        by kvm5.telegraphics.com.au (Postfix) with ESMTP id 9BCE22A29A;
        Mon, 28 Oct 2019 18:31:13 -0400 (EDT)
Date:   Tue, 29 Oct 2019 09:31:11 +1100 (AEDT)
From:   Finn Thain <fthain@telegraphics.com.au>
To:     Kars de Jong <jongk@linux-m68k.org>
cc:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Andreas 'count' Kotes 
        <count-vger.kernel.org+linux-m68k@flatline.de>,
        linux-m68k <linux-m68k@vger.kernel.org>
Subject: Re: Amiga PCMCIA network card support
In-Reply-To: <CACz-3riuHWhRXQsdaphDnhLM6zz6eKkc5YrT9=iUk5of+411wA@mail.gmail.com>
Message-ID: <alpine.LNX.2.21.1910290912520.9@nippy.intranet>
References: <7d87adfd-4373-950d-fc94-3bbdcce9e798@flatline.de> <CACz-3rgbLHbQf7kSbyH7NP5SUcMt1hJ=FiU+SGpTT8ZecuLYVQ@mail.gmail.com> <5531fcb0-687d-7186-a4b5-f2f9349d334a@flatline.de> <CACz-3riJHfuhkFMyPbUCz8Q9Mbu6T+CFz5gMwAKzMeg0tjM4Hg@mail.gmail.com>
 <1989702b-16ca-b376-c33d-9e04e6de2ca3@physik.fu-berlin.de> <CACz-3riuHWhRXQsdaphDnhLM6zz6eKkc5YrT9=iUk5of+411wA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Mon, 28 Oct 2019, Kars de Jong wrote:

> 
> For starters. it does not identify my chip correctly, it says it's a 
> FAS100A (it's actually a Symbios Logic 53CF94-2 which is more like a 
> FAS236). But after I fixed that it still doesn't work.
> 

Can you send the log? I have a script to decode the output from 
esp_dump_cmd_log() which might help here.

> One difference between the new driver and the old one is its support for 
> tagged commands. I haven't found an easy way to disable that yet though.
> 

I pushed some debug patches to my github that might help. 
https://github.com/fthain/linux/commits/esp-debug

There's a patch that adds the option to disable TCQ 
(esp_scsi.esp_use_tcq=0), and one to disable disconnect/reselect etc.

There's also a patch to disable DMA in the zorro_esp driver (requires the 
parameter esp_scsi.esp_disable_sync=1) that might help with debugging the 
FAS236 esp_rev problem.

-- 
