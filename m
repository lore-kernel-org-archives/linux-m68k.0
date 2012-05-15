From: Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: [PATCH 1/3] m68k: consistently call ret_from_exception in entry code
Date: Tue, 15 May 2012 10:18:08 +0200
Message-ID: <m21uml6enz.fsf@igel.home>
References: <1337064949-966-1-git-send-email-gerg@snapgear.com>
	<1337064949-966-2-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.9]:50796 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757820Ab2EOISV (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 15 May 2012 04:18:21 -0400
In-Reply-To: <1337064949-966-2-git-send-email-gerg@snapgear.com>
	(gerg@snapgear.com's message of "Tue, 15 May 2012 16:55:47 +1000")
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: gerg@snapgear.com
Cc: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org, Greg Ungerer <gerg@uclinux.org>

<gerg@snapgear.com> writes:

> The ret_from_excption code is referenced by its function name, or by a label
> set at the start of its code. Modify all uses to consistently just use the
> function name "ret_from_exception".

This will cause all branches to use the long variant, because
ret_from_exception is a global symbol (and thus overridable in the ELF
model).  The point of the additional local label is to allow the
assembler to relax the branches.

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
"And now for something completely different."
