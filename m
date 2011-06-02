From: Matthias Reis <matthias.reis@physik.tu-berlin.de>
Subject: Support for MMU-less Atari ST
Date: Thu, 2 Jun 2011 21:25:53 +0200
Message-ID: <20110602192553.GA2071@matze-K8NF4G-SATA2>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail.tu-berlin.de ([130.149.7.33]:57254 "EHLO mail.tu-berlin.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752576Ab1FBTqE (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Thu, 2 Jun 2011 15:46:04 -0400
Received: from pd951a75c.dip.t-dialin.net ([217.81.167.92] helo=localhost)
	by mail.tu-berlin.de (exim-4.75/mailfrontend-2) with esmtpsa [TLSv1:AES128-SHA:128]
	for <linux-m68k@vger.kernel.org>
	id 1QSDWk-0001XU-I2; Thu, 02 Jun 2011 21:25:54 +0200
Content-Disposition: inline
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org

Hi all,

since the m68k and the m68knommu trees have now been merged, I wonder if it is possible to run linux on mmu-less 68000 machines like the (original) Atari ST. I think the first thing to do would be to modify arch/m68k/kernel/head.S in order to handle non-mmu CPUs. I would be happy to do some work on this but the problem is that I'm not very familiar with the kernel so far. It would be nice if someone could tell me which things need to be done to run linux on a mmu-less Atari ST. I'm not expecting detailed step-by-step instructions, but rather some hints where the MMU- or 68020-dependent stuff in the Atari drivers lies.

Thanks in advance.

Best regards,
Matthias
