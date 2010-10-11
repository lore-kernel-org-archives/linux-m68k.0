From: Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: aranym bug, manifests as "ida_remove called for id=13" on recent kernels
Date: Mon, 11 Oct 2010 16:15:35 +0200
Message-ID: <m3wrpo24u0.fsf@hase.home>
References: <20101007174948.GT19804@ZenIV.linux.org.uk>
	<AANLkTin4886D+-yo=zrf2Yj2R5NM9qdRkc3M9cG2rN_F@mail.gmail.com>
	<20101010144952.GF19804@ZenIV.linux.org.uk>
	<AANLkTinuA3AzMoJ82pvCuhmo59DZxL2F1j3xhXUkjj7z@mail.gmail.com>
	<20101010235256.GG19804@ZenIV.linux.org.uk>
	<20101011024103.GH19804@ZenIV.linux.org.uk>
	<20101011043632.GA2566@cynthia.pants.nu>
	<20101011044808.GI19804@ZenIV.linux.org.uk>
	<Pine.BSM.4.64L.1010111218040.23471@herc.mirbsd.org>
	<20101011133545.GJ19804@ZenIV.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.9]:52249 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754673Ab0JKOPh (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 11 Oct 2010 10:15:37 -0400
In-Reply-To: <20101011133545.GJ19804@ZenIV.linux.org.uk> (Al Viro's message of
	"Mon, 11 Oct 2010 14:35:45 +0100")
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Al Viro <viro@ZenIV.linux.org.uk>
Cc: Thorsten Glaser <tg@mirbsd.de>, linux-kernel@vger.kernel.org, linux-m68k@vger.kernel.org

Al Viro <viro@ZenIV.linux.org.uk> writes:

> Below is what I'm using on top of mainline kernel; it's a combination of
> couple of patches in debian m68k kernel plus compile fixes.

Try Geert's linux-m68k tree.

> This kind of miscompile is definitely triggered in a lot of places -
> anything that does return ERR_PTR(error) right after error = foo(...);
> is going to get fscked and it's not a rare thing.

Only if they are optimized into tail calls.

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
"And now for something completely different."
