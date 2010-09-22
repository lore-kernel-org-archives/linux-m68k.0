From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 07/18] m68k: remove big kernel lock
Date: Wed, 22 Sep 2010 13:04:45 +0200
Message-ID: <201009221304.45353.arnd@arndb.de>
References: <1284492909-7147-1-git-send-email-arnd@arndb.de> <1284492909-7147-8-git-send-email-arnd@arndb.de> <m21v8mkhg7.fsf@igel.home>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.126.171]:61379 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753312Ab0IVLFA (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 22 Sep 2010 07:05:00 -0400
In-Reply-To: <m21v8mkhg7.fsf@igel.home>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Roman Zippel <zippel@linux-m68k.org>, linux-m68k@vger.kernel.org

On Tuesday 21 September 2010, Andreas Schwab wrote:
> 
> Arnd Bergmann <arnd@arndb.de> writes:
> 
> > The cache flush code only locks against itself, so there
> > is no excuse to use the BKL here. This replaces it with
> > a local mutex in order to maintain serialization of flushes.
> 
> I don't think this needs a lock at all.
> 

Quite likely, I just took the most conservative approach.
If you want to queue a patch to drop the BKL from m68k, I'll
happily drop this one from my series.

	Arnd
