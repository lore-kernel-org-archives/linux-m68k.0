Return-Path: <SRS0=T0KM=Z7=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_SBL,URIBL_SBL_A autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26250C43603
	for <linux-m68k@archiver.kernel.org>; Mon,  9 Dec 2019 00:38:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E5677206E0
	for <linux-m68k@archiver.kernel.org>; Mon,  9 Dec 2019 00:38:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726653AbfLIAiS (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 8 Dec 2019 19:38:18 -0500
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:38608 "EHLO
        kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726596AbfLIAiS (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sun, 8 Dec 2019 19:38:18 -0500
Received: from localhost (localhost.localdomain [127.0.0.1])
        by kvm5.telegraphics.com.au (Postfix) with ESMTP id 7C8972744C;
        Sun,  8 Dec 2019 19:38:15 -0500 (EST)
Date:   Mon, 9 Dec 2019 11:38:15 +1100 (AEDT)
From:   Finn Thain <fthain@telegraphics.com.au>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
cc:     Arno Griffioen <arno@ancienthardware.org>,
        linux-m68k@lists.linux-m68k.org
Subject: Linux-mac68k Conversion from CVS to Git 
Message-ID: <alpine.LNX.2.21.1.1912091059430.63@nippy.intranet>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi All,

I've finally converted the old CVS repository to Git, two years after 
sourceforge made their CVS services read-only. [1]

This means the web tree for the mac.linux-m68k.org website can be safely 
updated once again.

I think it would be a good idea to move the old CVS repo to the FTP 
archive [2]. Keeping both CVS and Git repos on sourceforge is undesirable 
because,

1) it's not obvious which repo is authoritative

2) the Penguin-18 source in CVS is incomplete and has only one commit

3) the Linux source in CVS is a mess of branches and tags that is much 
   more confusing than the Git conversion, which has been tidied up.

Please post any questions/comments that you may have about this.

[1]
https://sourceforge.net/p/linux-mac68k/news/2019/11/conversion-from-cvs-to-git/

[2]
http://ftp.mac.linux-m68k.org/
