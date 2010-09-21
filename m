From: Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: [PATCH 07/18] m68k: remove big kernel lock
Date: Tue, 21 Sep 2010 21:46:48 +0200
Message-ID: <m21v8mkhg7.fsf@igel.home>
References: <1284492909-7147-1-git-send-email-arnd@arndb.de>
	<1284492909-7147-8-git-send-email-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.9]:60317 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754298Ab0IUTqu (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 21 Sep 2010 15:46:50 -0400
In-Reply-To: <1284492909-7147-8-git-send-email-arnd@arndb.de> (Arnd Bergmann's
	message of "Tue, 14 Sep 2010 21:34:58 +0200")
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Roman Zippel <zippel@linux-m68k.org>, linux-m68k@vger.kernel.org

Arnd Bergmann <arnd@arndb.de> writes:

> The cache flush code only locks against itself, so there
> is no excuse to use the BKL here. This replaces it with
> a local mutex in order to maintain serialization of flushes.

I don't think this needs a lock at all.

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
"And now for something completely different."
