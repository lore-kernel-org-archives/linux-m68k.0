From: Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: [PATCH] m68k: use conventional function parameters for do_sigreturn
Date: Tue, 09 Feb 2016 10:48:06 +0100
Message-ID: <mvmegcmw6y1.fsf@hawking.suse.de>
References: <1453183018-11722-1-git-send-email-gerg@uclinux.org>
	<8737tcxoka.fsf@linux-m68k.org> <56AFF16E.2020506@uclinux.org>
	<871t8u7w43.fsf@linux-m68k.org> <56B17EA9.8020504@uclinux.org>
	<871t8mkcd1.fsf@linux-m68k.org> <56B93106.4050806@uclinux.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.9]:34415 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756281AbcBIJsM (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 9 Feb 2016 04:48:12 -0500
In-Reply-To: <56B93106.4050806@uclinux.org> (Greg Ungerer's message of "Tue, 9
	Feb 2016 10:21:26 +1000")
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Ungerer <gerg@uclinux.org>
Cc: linux-m68k@vger.kernel.org

Greg Ungerer <gerg@uclinux.org> writes:

> Should I submit a gcc bug report?

No, it's not a bug.  Function parameters are dead after return, so any
writes to them can be elided.

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
"And now for something completely different."
