From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: Support for MMU-less Atari ST
Date: Fri, 3 Jun 2011 20:54:25 +1000 (EST)
Message-ID: <alpine.OSX.2.00.1106032052150.193@ibook.intranet>
References: <20110602192553.GA2071@matze-K8NF4G-SATA2> <4DE88763.4030705@snapgear.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from vm4.telegraphics.com.au ([98.124.60.149]:35170 "EHLO
	vps4.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751834Ab1FCKyW (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 3 Jun 2011 06:54:22 -0400
In-Reply-To: <4DE88763.4030705@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Ungerer <gerg@snapgear.com>
Cc: Matthias Reis <matthias.reis@physik.tu-berlin.de>, linux-m68k@vger.kernel.org


On Fri, 3 Jun 2011, Greg Ungerer wrote:

> I haven't looked in arch/m68k/kernel/head.S yet, but if that can
> be made to work without enabling the MMU then that seems like a
> reasonable start.

I believe that Laurent Vivier was able to accomplish something similar 
with his Macintosh SE port.

Finn
