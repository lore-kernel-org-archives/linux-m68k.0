From: Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: [PATCH] m68knommu: fix fec setup warning for ColdFire 5271 builds
Date: Thu, 26 Mar 2015 09:27:46 +0100
Message-ID: <mvma8z0yxh9.fsf@hawking.suse.de>
References: <1427340156-11839-1-git-send-email-gerg@uclinux.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.9]:56753 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752347AbbCZI1t (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 26 Mar 2015 04:27:49 -0400
In-Reply-To: <1427340156-11839-1-git-send-email-gerg@uclinux.org>
	(gerg@uclinux.org's message of "Thu, 26 Mar 2015 13:22:36 +1000")
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: gerg@uclinux.org
Cc: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org

gerg@uclinux.org writes:

> Fix it my moving the definition of par inside the 5271 conditional code.

s/my/by/

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
"And now for something completely different."
