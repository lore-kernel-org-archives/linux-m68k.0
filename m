From: Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: [PATCH 1/2] m68k/atari - stram: alloc ST-RAM pool even if kernel not in ST-RAM
Date: Wed, 19 Mar 2014 09:18:49 +0100
Message-ID: <mvmd2hisis6.fsf@hawking.suse.de>
References: <1395213784-3249-1-git-send-email-schmitz@debian.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.10]:50746 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752319AbaCSISx (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 19 Mar 2014 04:18:53 -0400
In-Reply-To: <1395213784-3249-1-git-send-email-schmitz@debian.org> (Michael
	Schmitz's message of "Wed, 19 Mar 2014 20:23:03 +1300")
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: linux-m68k@vger.kernel.org, geert@linux-m68k.org, debian-68k@lists.debian.org, Michael Schmitz <schmitz@debian.org>

Michael Schmitz <schmitzmic@gmail.com> writes:

> +		 * Skip page 0, as the fhe first 2 KiB are supervisor-only!

s/fhe//

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
"And now for something completely different."
