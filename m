From: Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: BUG: workqueue lockup
Date: Mon, 21 Mar 2016 01:01:33 +0100
Message-ID: <877fgwvgv6.fsf@linux-m68k.org>
References: <87oaa9upgl.fsf@linux-m68k.org>
	<alpine.LNX.2.00.1603210921330.15763@nippy.intranet>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.9]:59143 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751392AbcCUABi (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 20 Mar 2016 20:01:38 -0400
In-Reply-To: <alpine.LNX.2.00.1603210921330.15763@nippy.intranet> (Finn
	Thain's message of "Mon, 21 Mar 2016 09:29:58 +1100 (AEDT)")
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: linux-m68k@vger.kernel.org

Finn Thain <fthain@telegraphics.com.au> writes:

> On Sun, 20 Mar 2016, Andreas Schwab wrote:
>
>> I'm getting this hangup with 4.5 in aranym:
>
> Are you using this aranym patch?
>
> https://sourceforge.net/p/aranym/bugs/40/

Thanks, I have committed it now.  In future, please send patches to the
aranym mailinglist.

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
"And now for something completely different."
