From: Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: Add private syscalls to support NPTL
Date: Tue, 18 Aug 2009 00:18:44 +0200
Message-ID: <m23a7qulrv.fsf@igel.home>
References: <4A89D037.7090807@codesourcery.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.9]:56801 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751632AbZHQWSp (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 17 Aug 2009 18:18:45 -0400
In-Reply-To: <4A89D037.7090807@codesourcery.com> (Maxim Kuvyrkov's message of
	"Tue, 18 Aug 2009 01:48:39 +0400")
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Maxim Kuvyrkov <maxim@codesourcery.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@vger.kernel.org

Maxim Kuvyrkov <maxim@codesourcery.com> writes:

> +		{
> +			int do_page_fault(struct pt_regs *, unsigned long,
> +					unsigned long);

Functions should always be declared in headers, and definitely never in
block scope.

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
"And now for something completely different."
