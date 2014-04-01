From: Andreas Schwab <schwab@suse.de>
Subject: Re: [PATCH 0/4] Atari kernel-in-FastRAM patches, take three
Date: Tue, 01 Apr 2014 11:06:32 +0200
Message-ID: <mvmioqtbeqv.fsf@hawking.suse.de>
References: <1396137686-32678-1-git-send-email-schmitz@debian.org>
	<8761mvl3jb.fsf@igel.home>
	<CAOmrzkLWKq_qxmL5wKsGQGvAwNEQCP1QHhkd70vxViAyBoP98g@mail.gmail.com>
	<87a9c63x1c.fsf@igel.home>
	<CAOmrzkLbnUYjaEYa3MAccs03J46OWWKtndA3zyE8Kc+Ckr2eEg@mail.gmail.com>
	<CAMuHMdWrg6dwwdY3WsMUqFG8V6s_PWguT6W5wkSPJrkORstvOw@mail.gmail.com>
	<533A6D43.30403@biophys.uni-duesseldorf.de>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:37458 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751251AbaDAJGe (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Tue, 1 Apr 2014 05:06:34 -0400
In-Reply-To: <533A6D43.30403@biophys.uni-duesseldorf.de>
	(schmitz@biophys.uni-duesseldorf.de's message of "Tue, 01 Apr 2014
	20:39:47 +1300")
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: schmitz <schmitz@biophys.uni-duesseldorf.de>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Michael Schmitz <schmitzmic@gmail.com>, Linux/m68k <linux-m68k@vger.kernel.org>, debian m68k <debian-68k@lists.debian.org>

schmitz <schmitz@biophys.uni-duesseldorf.de> writes:

> What size FastRAM did precipitate that bug for you, Andreas?

It's the combination of kernel size and FastRAM setting that matters.

You can easily watch it by adding the bootmem_debug kernel parameter.

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
"And now for something completely different."
