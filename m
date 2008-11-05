From: Riccardo <riccardo@kaffe.org>
Subject: Re: [PATCH] Add SWIM floppy support for m68k Macs.
Date: Wed, 5 Nov 2008 22:45:30 +0100
Message-ID: <10DF5AA6-AB83-11DD-9A74-00050249ADE1@kaffe.org>
References: <Pine.LNX.4.64.0811051746550.23115@loopy.telegraphics.com.au>
Mime-Version: 1.0 (Apple Message framework v553)
Content-Type: text/plain; delsp=yes; charset=US-ASCII; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from cp-out8.libero.it ([212.52.84.108]:47217 "EHLO
	cp-out8.libero.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750943AbYKEVpe (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 5 Nov 2008 16:45:34 -0500
In-Reply-To: <Pine.LNX.4.64.0811051746550.23115@loopy.telegraphics.com.au>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: linux-m68k@vger.kernel.org


Hi,

On Wednesday, November 5, 2008, at 07:58  AM, Finn Thain wrote:

> I've seen this with more recent kernels. Not sure about 2.6.18. It  
> happens
> because a proc file is registered twice by the nubus probe code. It is
> only a cosmetic problem, but I have been working on a patch for it.
>
> You may want to try Stephen's daily build,
>
> http://people.debian.org/~smarenka/m68k/kernel/linux-image-2.6.26-1- 
> mac_2.6.26-9_m68k.deb

Thank you, but I used one of those, from yesterday.

Riccardo

