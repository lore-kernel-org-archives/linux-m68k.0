From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: debian-installer progress and input needed
Date: Mon, 22 May 2017 10:09:32 +1000 (AEST)
Message-ID: <alpine.LNX.2.00.1705221001520.1844@nippy.intranet>
References: <b9651ade-0079-c8c6-40a3-80549f3601c5@physik.fu-berlin.de> <a86ad435-c026-55cb-5a0e-d2797e23736b@physik.fu-berlin.de> <242cd92a-e660-088e-6656-393dbcf74792@physik.fu-berlin.de>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:54720 "EHLO
        kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755073AbdEVAJe (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Sun, 21 May 2017 20:09:34 -0400
In-Reply-To: <242cd92a-e660-088e-6656-393dbcf74792@physik.fu-berlin.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Debian m68k <debian-68k@lists.debian.org>, Linux/m68k <linux-m68k@vger.kernel.org>

On Sun, 21 May 2017, John Paul Adrian Glaubitz wrote:

> On 05/17/2017 02:24 PM, John Paul Adrian Glaubitz wrote:
> > Ok, let's get some order into this.
> > 
> > I have already opened a bug report to include loop-modules [1].
> > 
> > Then, looking at the module packages on m68k [2] and powerpc [3],
> > I suggest to add the following new packages first:
> > (...)
> > Did I miss anything?
> 
> I have made some changes to src:linux now following the previous discussion
> and I have pushed them to github [1].
> 
> Comments?
> 

Looks good but I suspect that macmace needs to be added to the nic-modules 
list.

-- 

> Adrian
> 
> > [1] https://github.com/glaubitz/linux-debian/commits/m68k
> 
> 
