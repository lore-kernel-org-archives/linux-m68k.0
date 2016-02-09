From: Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: [PATCH] m68k: use conventional function parameters for do_sigreturn
Date: Tue, 09 Feb 2016 15:36:14 +0100
Message-ID: <mvmh9hit0gx.fsf@hawking.suse.de>
References: <1453183018-11722-1-git-send-email-gerg@uclinux.org>
	<8737tcxoka.fsf@linux-m68k.org> <56AFF16E.2020506@uclinux.org>
	<871t8u7w43.fsf@linux-m68k.org> <56B17EA9.8020504@uclinux.org>
	<871t8mkcd1.fsf@linux-m68k.org> <56B93106.4050806@uclinux.org>
	<mvmegcmw6y1.fsf@hawking.suse.de> <56B9E435.2000203@uclinux.org>
	<mvm37t2uior.fsf@hawking.suse.de>
	<20160209140101.GA18058@frolo.macqel>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.9]:37412 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755919AbcBIOgU (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 9 Feb 2016 09:36:20 -0500
In-Reply-To: <20160209140101.GA18058@frolo.macqel> (Philippe De Muyter's
	message of "Tue, 9 Feb 2016 15:01:01 +0100")
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Philippe De Muyter <phdm@macq.eu>
Cc: Greg Ungerer <gerg@uclinux.org>, linux-m68k@vger.kernel.org

Philippe De Muyter <phdm@macq.eu> writes:

> Given what gcc does now, how can scanf still work then ?

In which way is that related to scanf?

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
"And now for something completely different."
