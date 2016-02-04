From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: Re: Linux/m68k on the Apollo FPGA softcore?
Date: Thu, 4 Feb 2016 16:00:01 +0100
Message-ID: <56B36771.9010006@physik.fu-berlin.de>
References: <alpine.DEB.2.10.1602021757210.2761@firda>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66]:38367 "EHLO
	outpost1.zedat.fu-berlin.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S965791AbcBDPHo (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 4 Feb 2016 10:07:44 -0500
In-Reply-To: <alpine.DEB.2.10.1602021757210.2761@firda>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: =?UTF-8?Q?Kolbj=c3=b8rn_Barmen?= <linux-m68k@kolla.no>, linux-m68k@vger.kernel.org

On 02/02/2016 06:16 PM, Kolbj=F8rn Barmen wrote:
> From what I understand, the core implements a new FPU, not
> compatible with existing FPUs, and there has
> been talks about a new MMU implementation too.=20

Well, that would be too bad given the fact that there is already a huge
number of applications and kernels which work with the old FPU/MMU
combination.

I'd buy such an accelerator in a heartbeat, but it should be binary
compatible with existing 68020+ code.

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer - glaubitz@debian.org
`. `'   Freie Universitaet Berlin - glaubitz@physik.fu-berlin.de
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
