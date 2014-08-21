From: gerg@uclinux.org
Subject: [PATCH 0/2] m68k: propose move of platform coldfire
Date: Thu, 21 Aug 2014 13:04:05 +1000
Message-ID: <1408590247-10875-1-git-send-email-gerg@uclinux.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from nschwqsrv02p.mx.bigpond.com ([61.9.189.234]:62653 "EHLO
	nschwqsrv02p.mx.bigpond.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751898AbaHUDLX (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>);
	Wed, 20 Aug 2014 23:11:23 -0400
Received: from nschwcmgw08p ([61.9.190.168]) by nschwmtas01p.mx.bigpond.com
          with ESMTP
          id <20140821030408.ZZGC17954.nschwmtas01p.mx.bigpond.com@nschwcmgw08p>
          for <linux-m68k@vger.kernel.org>; Thu, 21 Aug 2014 03:04:08 +0000
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org


Hi All,

I propose that we move the arch/m68k/platform/coldfire directory to be
directly under arch/m68k.

The current platform/ structure was inhereted from the move of m68knommu,
and is inconsistent with the existing m68k platforms (each having a
directory under arch/m68k).

Moving platform/coldfire is quite strait forward. The following patches do a
move, and fix up the broken pathname comments.

This does leave the question of what to do with the other directories still
under arch/m68k/platform, namely 68000 and 68360. Should they be moved in
the same way as coldfire? 

Regards
Greg
