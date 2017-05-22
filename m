From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: Re: debian-installer progress and input needed
Date: Mon, 22 May 2017 11:39:32 +0200
Message-ID: <07da0f72-6f7e-bd7c-8186-c5ff59c48282@physik.fu-berlin.de>
References: <b9651ade-0079-c8c6-40a3-80549f3601c5@physik.fu-berlin.de>
 <a86ad435-c026-55cb-5a0e-d2797e23736b@physik.fu-berlin.de>
 <242cd92a-e660-088e-6656-393dbcf74792@physik.fu-berlin.de>
 <alpine.LNX.2.00.1705221001520.1844@nippy.intranet>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66]:33781 "EHLO
        outpost1.zedat.fu-berlin.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1758191AbdEVJje (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>);
        Mon, 22 May 2017 05:39:34 -0400
In-Reply-To: <alpine.LNX.2.00.1705221001520.1844@nippy.intranet>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: Debian m68k <debian-68k@lists.debian.org>, Linux/m68k <linux-m68k@vger.kernel.org>

On 05/22/2017 02:09 AM, Finn Thain wrote:
> Looks good but I suspect that macmace needs to be added to the nic-modules 
> list.

Right, forgot that one because I got interrupted. I also have to drop
the atari_ethernec driver which no longer exists.

Also, I'm wondering which of the drivers are actually listed there
redundantly and are already included through #include <nic-modules>
which seems to include all Ethernet drivers by default.

Will have to ask the Debian kernel people how that actually works.

Adrian

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer - glaubitz@debian.org
`. `'   Freie Universitaet Berlin - glaubitz@physik.fu-berlin.de
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
