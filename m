From: Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: [PATCH] m68k: Increase initial mapping to 16MB if possible
Date: Tue, 29 Apr 2014 12:33:44 +0200
Message-ID: <8738gwxw53.fsf@igel.home>
References: <87ppk7m3db.fsf@igel.home>
	<loom.20140429T121132-254@post.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.10]:40424 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933248AbaD2Kdr (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 29 Apr 2014 06:33:47 -0400
In-Reply-To: <loom.20140429T121132-254@post.gmane.org> (Thorsten Glaser's
	message of "Tue, 29 Apr 2014 10:11:55 +0000 (UTC)")
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Thorsten Glaser <tg@debian.org>
Cc: linux-m68k@vger.kernel.org

Thorsten Glaser <tg@debian.org> writes:

> Andreas Schwab <schwab <at> linux-m68k.org> writes:
>
>> If the size of the first memory chunk is at least 16MB increase the
>> initial mapping to 16MB instead of 4MB.  This makes it possible to map
>
> Why not always?

Always what?

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
"And now for something completely different."
