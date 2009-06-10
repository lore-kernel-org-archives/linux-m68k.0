From: Matthew Lear <matt@bubblegen.co.uk>
Subject: Re: 2.6.29 & network stack strangeness
Date: Wed, 10 Jun 2009 11:59:31 +0100
Message-ID: <4A2F9213.3010907@bubblegen.co.uk>
References: <4A2936AF.4080601@bubblegen.co.uk>    <Pine.LNX.4.64.0906060149130.16687@loopy.telegraphics.com.au>    <4A294532.7030904@bubblegen.co.uk>    <Pine.LNX.4.64.0906060233071.16687@loopy.telegraphics.com.au>    <4A294B63.7010404@bubblegen.co.uk> <4A2DC70F.7080401@freescale.com> <3585ad3f94615c5bfa3f8100f6cfeb0d.squirrel@webmail.plus.net> <4A2F1C74.1010800@freescale.com> <4A2F7E88.6040602@bubblegen.co.uk> <4A2F8318.5080206@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from relay.ptn-ipout02.plus.net ([212.159.7.36]:16712 "EHLO
	relay.ptn-ipout02.plus.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754439AbZFJK7e (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>);
	Wed, 10 Jun 2009 06:59:34 -0400
In-Reply-To: <4A2F8318.5080206@freescale.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Lanttor <lanttor.guo@freescale.com>
Cc: linux-m68k@vger.kernel.org

Lanttor wrote:
>> Thanks but this makes no difference. From what I can tell, the patch to entry.S
>> is essentially benign because ret_from_interrupt() is not invoked anywhere.
> 
> ret_from_interrupt() is the part of inthandler(), and it's called by inthandler() at end.
> 

Indeed it is. My apologies.
