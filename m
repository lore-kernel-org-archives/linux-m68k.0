From: Michael Schmitz <schmitzmic@gmail.com>
Subject: [PATCH v3 0/4] Atari kernel-in-FastRAM patches v3
Date: Mon, 31 Mar 2014 21:06:04 +1300
Message-ID: <1396253168-25601-1-git-send-email-schmitz@debian.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pd0-f173.google.com ([209.85.192.173]:64064 "EHLO
	mail-pd0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752035AbaCaIGS (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 31 Mar 2014 04:06:18 -0400
Received: by mail-pd0-f173.google.com with SMTP id z10so7660345pdj.32
        for <linux-m68k@vger.kernel.org>; Mon, 31 Mar 2014 01:06:17 -0700 (PDT)
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org
Cc: geert@linux-m68k.org, debian-68k@lists.debian.org

Hi Geert,

changes to stram.c and atafb.c patches as requested. The external_addr
case is still untested - may have other bugs that I've not seen when
changing the external_addr types.

CC to the relevant lists for floppy and SCSI patches. 

Cheers,

	Michael
