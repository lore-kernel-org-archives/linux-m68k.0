From: Riccardo <riccardo@kaffe.org>
Subject: Re: I'm back on linux-m68k
Date: Tue, 4 Nov 2008 19:37:01 +0100
Message-ID: <91DF3A3F-AA9F-11DD-9F63-00050249ADE1@kaffe.org>
References: <Pine.LNX.4.64.0811031259300.21302@anakin>
Mime-Version: 1.0 (Apple Message framework v553)
Content-Type: text/plain; charset=US-ASCII; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from cp-out12.libero.it ([212.52.84.112]:50174 "EHLO
	cp-out12.libero.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754070AbYKDShO (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 4 Nov 2008 13:37:14 -0500
In-Reply-To: <Pine.LNX.4.64.0811031259300.21302@anakin>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Joshua Juran <jjuran@gmail.com>, Laurent Vivier <laurent@lvivier.info>, Finn Thain <fthain@telegraphics.com.au>, Linux/m68k <linux-m68k@vger.kernel.org>

Hey

On Monday, November 3, 2008, at 01:01  PM, Geert Uytterhoeven wrote:

> On Mon, 3 Nov 2008, Joshua Juran wrote:
>> I don't remember if 68K machines can have multiple SCSI buses.  If 
>> so, we'll
>> need to figure out how to address external vs. internal.
>
> At least the Quadra 900 and 950 have two SCSI buses, as deducted from 
> Finn'ss
> recent patch.

the quadras 9x0 have them but you could also add scsi cards via NuBus. 
The Q9x0 I think even supported a third ultra-scsi card especially 
designed as an upgrade for servers. I have seen just one recently and 
it is not in my possession.


Riccardo

